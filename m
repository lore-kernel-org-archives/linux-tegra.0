From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/3] amba: tegra-ahb: use correct base address for future
 chip support
Date: Tue, 17 Mar 2015 10:35:03 +0000
Message-ID: <20150317103503.GT8656@n2100.arm.linux.org.uk>
References: <20150317083221.32662.14647.stgit@baseline>
 <20150317083221.32662.7448.stgit@baseline>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150317083221.32662.7448.stgit@baseline>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 17, 2015 at 01:32:21AM -0700, Paul Walmsley wrote:
>  static inline u32 gizmo_readl(struct tegra_ahb *ahb, u32 offset)
>  {
> -	return readl(ahb->regs - 4 + offset);
> +	return readl(ahb->regs + ahb->offset + offset);
>  }
>  
>  static inline void gizmo_writel(struct tegra_ahb *ahb, u32 value, u32 offset)
>  {
> -	writel(value, ahb->regs - 4 + offset);
> +	writel(value, ahb->regs + ahb->offset + offset);

Rather than storing the offset...

> @@ -262,18 +283,15 @@ static int tegra_ahb_probe(struct platform_device *pdev)
>  	if (IS_ERR(ahb->regs))
>  		return PTR_ERR(ahb->regs);
>  
> +	ad = of_id->data;
>  	ahb->dev = &pdev->dev;
> +	ahb->offset = ad->offset;

What about 

	ahb->regs += ad->offset;

here and avoid the addition and extra loads on every access.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
