From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v5 4/9] tegra: fdt: i2c: Add extra I2C bindings for U-Boot
Date: Wed, 07 Mar 2012 13:39:09 -0700
Message-ID: <4F57C76D.6040004@wwwdotorg.org>
References: <1331096428-6317-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331096428-6317-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2012 10:00 PM, Simon Glass wrote:
> Add U-Boot's peripheral clock information to the Tegra20 device tree file.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
...
> diff --git a/doc/device-tree-bindings/i2c/tegra20-i2c.txt b/doc/device-tree-bindings/i2c/tegra20-i2c.txt
...
> +Required properties:
> + - clocks : Two clocks must be given, each as a phandle to the Tegra's
> +            CAR node and the clock number as a parameter:

I'd rather rely on the common clock binding documentation for the format
of the clock specifiers than duplicate the information here. True, that
document isn't in U-Boot (nor is it final). I.e.:

    Two clocks must be specified:

But I think this is fine for now (I might care more if submitting a doc
file for the kernel tree), so

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

> +     - the I2C clock to use for the peripheral
> +     - the pll_p_out3 clock, which can be used for fast operation. This
> +          does not change and is the same for all I2C nodes.
> +
> +Example:
> +(TODO: merge with existing example):
> +
> +	i2c@7000c400 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra20-i2c";
> +		reg = <0x7000C400 0x100>;
> +		interrupts = < 116 >;
> +		/* PERIPH_ID_I2C2, PLL_P_OUT3 */
> +		clocks = <&tegra_car 54>, <&tegra_car 124>;
> +	};
