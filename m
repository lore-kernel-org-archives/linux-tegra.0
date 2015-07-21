From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v3 1/5] mtd: nand: tegra: add devicetree binding
Date: Tue, 21 Jul 2015 14:05:37 -0700
Message-ID: <20150721210537.GL24125@google.com>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
 <1431282602-7137-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431282602-7137-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, May 10, 2015 at 08:29:58PM +0200, Lucas Stach wrote:
> This adds the devicetree binding for the Tegra 2 NAND flash
> controller.
> 
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.txt           | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
> new file mode 100644
> index 0000000..522d442
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
> @@ -0,0 +1,29 @@
> +NVIDIA Tegra NAND Flash controller
> +
> +Required properties:
> +- compatible: Must be one of:
> +  - "nvidia,tegra20-nand"
> +- reg: MMIO address range
> +- interrupts: interrupt output of the NFC controller
> +- clocks: Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +  - nand
> +- resets: Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.
> +- reset-names: Must include the following entries:
> +  - nand
> +
> +Optional properties:
> +- nvidia,wp-gpios: GPIO used to disable write protection of the flash

I think write-protect is a pretty common function, so we might want to
just remove the 'nvidia,' prefix, so we can eventually move your code to
the core nand_base.c library (BTW, I noticed you grab the GPIO, but you
don't do anything with it; is that intentional?). In fact, I've seen
requests for that very feature on the mailing list.

> +
> +  Example:
> +	nand@70008000 {
> +		compatible = "nvidia,tegra20-nand";
> +		reg = <0x70008000 0x100>;
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
> +		clock-names = "nand";
> +		resets = <&tegra_car 13>;
> +		reset-names = "nand";
> +	};

Otherwise, looks good.

Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I have a few comments on the NAND driver, too.

Brian
