From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: tegra: Add APB misc MIPI pad control
Date: Thu, 04 Sep 2014 09:54:59 -0600
Message-ID: <54088B53.6040802@wwwdotorg.org>
References: <540734EB.2060508@wwwdotorg.org> <1409764008-5401-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409764008-5401-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/03/2014 11:06 AM, Sean Paul wrote:
> This patch adds MIPI CSI/DSIB pad control mux register
> from the APB misc block to tegra pinctrl.
>
> Without writing to this register, the dsib pads are
> muxed as csi, and cannot be used.
>
> The register is not yet documented in the TRM, here is
> the description:
>
> 70000820: APB_MISC_GP_MIPI_PAD_CTRL_0
> 	[31:02] RESERVED
> 	[01:01] DSIB_MODE       [CSI=0,DSIB=1]
> 	[00:00] RESERVED

> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt

The definition of the reg property also needs to be extended. I would 
suggest:

  - reg: Should contain a list of base address and size pairs for:
      -- first entry - the drive strength and pad control registers.
      -- second entry - the pinmux registers
+    -- third entry - the MIPI_PAD_CTRL register

>       dbg, sdio3, spi, uaa, uab, uart2, uart3, sdio1, ddc, gma, gme, gmf, gmg,
>       gmh, owr, uda, gpv, dev3, cec, usb_vbus_en, ao3, ao0, hv0, sdio4, ao4.
>
> +  apb groups:
> +
> +    These do not support any of the optional properties.
> +
> +    dsi_b

I don't think the term "optional properties" is quite right here; even 
the mux function property is optional. A better description might be:

+  MIPI groups:
+
+    These support only the nvidia,function property.
+
+    dsi_b

> +
>   Valid values for nvidia,functions are:
>
>     blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3, displaya,
> @@ -101,14 +107,15 @@ Valid values for nvidia,functions are:
>     sdmmc4, soc, spdif, spi1, spi2, spi3, spi4, spi5, spi6, trace, uarta,
>     uartb, uartc, uartd, ulpi, usb, vgp1, vgp2, vgp3, vgp4, vgp5, vgp6,
>     vi, vi_alt1, vi_alt3, vimclk2, vimclk2_alt, sata, ccla, pe0, pe, pe1,
> -  dp, rtck, sys, clk tmds.
> +  dp, rtck, sys, clk tmds. csi, dsi_b

------>                    ^^ change to a comma

>   Example:
>
>   	pinmux: pinmux {
>   		compatible = "nvidia,tegra124-pinmux";
> -		reg = <0x70000868 0x164		/* Pad control registers */
> -		       0x70003000 0x434>;	/* PinMux registers */
> +		reg = <0x0 0x70000868 0x0 0x164>, /* Pad control registers */
> +		      <0x0 0x70003000 0x0 0x434>, /* Mux registers */
> +		      <0x0 0x70000820 0x0 0x8>;   /* APB misc registers */

I think say "MIPI pad control" or "MIPI PAD CTRL" for the added line; 
all of the registers used by pinctrl are APB misc registers.

> diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c

>   #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
>   #define PINGROUP_REG_A			0x3000	/* bank 1 */
> +#define APB_MISC_PINGROUP_REG_A		0x820	/* bank 2 */

Oh, I think for the same reasons I mentioned above in the documentation, 
name that MIPI_PAD_CTRL_PINGROUP_REG_A?

> +#define APB_MISC_PINGROUP_REG_Y(r)	((r) - APB_MISC_PINGROUP_REG_A)
> +
> +#define APB_MISC_PINGROUP(pg_name, r, b, f0, f1)			\

... and those MIPI_PAD_CTRL_PINGROUP{,_REG_Y}

Sorry for not thinking about the naming issues in the .c file the last 
time around.
