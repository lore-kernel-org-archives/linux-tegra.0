From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 1/2] of/irq: Fix irq-mapping in of_irq_parse_raw()
Date: Tue, 11 Mar 2014 14:15:33 -0600
Message-ID: <20140311201533.GF31835@obsidianresearch.com>
References: <1393944864-28113-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393944864-28113-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 04, 2014 at 06:54:24AM -0800, Tim Harvey wrote:
> When an interrupt-map contains multiple entries an imap pointer arithmetic
> bug can cause only the first entry to be properly evaluated and causes
> the out_irq parameters to be incorrect depending on the #interrupt-cells
> and #address-cells of the parent interrupt controller.

Tim,

I took a bit closer look at this for you, and I suspect the root fix
is this:

--- a/Documentation/devicetree/bindings/arm/gic.txt
+++ b/Documentation/devicetree/bindings/arm/gic.txt
@@ -55,7 +55,6 @@ Example:
        intc: interrupt-controller@fff11000 {
                compatible = "arm,cortex-a9-gic";
                #interrupt-cells = <3>;
-               #address-cells = <1>;
                interrupt-controller;
                reg = <0xfff11000 0x1000>,
                      <0xfff10100 0x100>;
(plus the corresponding purge from the .dt files)

It looks like the implementation does follow the OF specification:

 Each mapping entry consists of a 3-tuple of (child-interrupt,
 interrupt-parent, parent-interrupt). The number of cells for the
 child-interrupt specifier is determined by the "#address-cells" and
 "#interrupt-cells"property of this node. The number of cells for the
 parent-interrupt value is determined by the "#address-cells"and
 "#interrupt-cells"property values of this node's
 interrupt-parent.

So by specifying interrupt-cells = 3, address-cells = 1, the GIC is
requiring 4 DWs for its interrupt specifier.

I see no reason why it doesn't have an address-cells = 0 like other
interrupt controllers..

Setting #address-cells to 0 in the GIC node should be functionally
equivalent to your patch below, since newaddrsize will == 0.

Regards,
Jason

> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 9bcf2cf..8829197 100644
> +++ b/drivers/of/irq.c
> @@ -237,11 +237,11 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>  			/* Check for malformed properties */
>  			if (WARN_ON(newaddrsize + newintsize > MAX_PHANDLE_ARGS))
>  				goto fail;
> -			if (imaplen < (newaddrsize + newintsize))
> +			if (imaplen < newintsize)
>  				goto fail;
>  
> -			imap += newaddrsize + newintsize;
> -			imaplen -= newaddrsize + newintsize;
> +			imap += newintsize;
> +			imaplen -= newintsize;
>  
>  			pr_debug(" -> imaplen=%d\n", imaplen);
>  		}
