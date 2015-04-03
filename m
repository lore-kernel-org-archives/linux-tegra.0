From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v3] ARM: tegra: Correct which USB controller has the UTMI
 pad registers
Date: Fri, 03 Apr 2015 12:10:29 +0300
Message-ID: <551E5905.6050105@kapsi.fi>
References: <551D61A5.2010102@kapsi.fi> <1428045671-2333-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428045671-2333-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2015 10:21 AM, Tomeu Vizoso wrote:
> It should be the first controller, not the second. The indexes of the
> usb resets were also wrong and have been fixed.
>
> The issue was caused by the changes in 308efde ("ARM: tegra: Add resets
> & has-utmi-pad-registers flag to all USB PHYs") being misapplied by git
> due to the patch context being insufficient.
>
> This broke USB after 6261b06 ("regulator: Defer lookup of supply to
> regulator_get"), because it changed the order in which the controllers
> were probed.
>
> The fix for this issue was suggested by Mikko Perttunen and Tuomas
> Tynkkynen.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
> Cc: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi,
>
> hope I have gotten it right this time, but please do check :)

Yeah, this seems correct to me :)

>
> Thanks,
>
> Tomeu
> ---
>   arch/arm/boot/dts/tegra124.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index cf01c81..13cc7ca 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -809,114 +809,114 @@
>   		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
>   		reg = <0x0 0x7d000000 0x0 0x4000>;
>   		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>   		phy_type = "utmi";
>   		clocks = <&tegra_car TEGRA124_CLK_USBD>;
>   		resets = <&tegra_car 22>;
>   		reset-names = "usb";
>   		nvidia,phy = <&phy1>;
>   		status = "disabled";
>   	};
>
>   	phy1: usb-phy@0,7d000000 {
>   		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
>   		reg = <0x0 0x7d000000 0x0 0x4000>,
>   		      <0x0 0x7d000000 0x0 0x4000>;
>   		phy_type = "utmi";
>   		clocks = <&tegra_car TEGRA124_CLK_USBD>,
>   			 <&tegra_car TEGRA124_CLK_PLL_U>,
>   			 <&tegra_car TEGRA124_CLK_USBD>;
>   		clock-names = "reg", "pll_u", "utmi-pads";
> -		resets = <&tegra_car 59>, <&tegra_car 22>;
> +		resets = <&tegra_car 22>, <&tegra_car 22>;
>   		reset-names = "usb", "utmi-pads";
>   		nvidia,hssync-start-delay = <0>;
>   		nvidia,idle-wait-delay = <17>;
>   		nvidia,elastic-limit = <16>;
>   		nvidia,term-range-adj = <6>;
>   		nvidia,xcvr-setup = <9>;
>   		nvidia,xcvr-lsfslew = <0>;
>   		nvidia,xcvr-lsrslew = <3>;
>   		nvidia,hssquelch-level = <2>;
>   		nvidia,hsdiscon-level = <5>;
>   		nvidia,xcvr-hsslew = <12>;
> +		nvidia,has-utmi-pad-registers;
>   		status = "disabled";
>   	};
>
>   	usb@0,7d004000 {
>   		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
>   		reg = <0x0 0x7d004000 0x0 0x4000>;
>   		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>   		phy_type = "utmi";
>   		clocks = <&tegra_car TEGRA124_CLK_USB2>;
>   		resets = <&tegra_car 58>;
>   		reset-names = "usb";
>   		nvidia,phy = <&phy2>;
>   		status = "disabled";
>   	};
>
>   	phy2: usb-phy@0,7d004000 {
>   		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
>   		reg = <0x0 0x7d004000 0x0 0x4000>,
>   		      <0x0 0x7d000000 0x0 0x4000>;
>   		phy_type = "utmi";
>   		clocks = <&tegra_car TEGRA124_CLK_USB2>,
>   			 <&tegra_car TEGRA124_CLK_PLL_U>,
>   			 <&tegra_car TEGRA124_CLK_USBD>;
>   		clock-names = "reg", "pll_u", "utmi-pads";
> -		resets = <&tegra_car 22>, <&tegra_car 22>;
> +		resets = <&tegra_car 58>, <&tegra_car 22>;
>   		reset-names = "usb", "utmi-pads";
>   		nvidia,hssync-start-delay = <0>;
>   		nvidia,idle-wait-delay = <17>;
>   		nvidia,elastic-limit = <16>;
>   		nvidia,term-range-adj = <6>;
>   		nvidia,xcvr-setup = <9>;
>   		nvidia,xcvr-lsfslew = <0>;
>   		nvidia,xcvr-lsrslew = <3>;
>   		nvidia,hssquelch-level = <2>;
>   		nvidia,hsdiscon-level = <5>;
>   		nvidia,xcvr-hsslew = <12>;
> -		nvidia,has-utmi-pad-registers;
>   		status = "disabled";
>   	};
>
>   	usb@0,7d008000 {
>   		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
>   		reg = <0x0 0x7d008000 0x0 0x4000>;
>   		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>   		phy_type = "utmi";
>   		clocks = <&tegra_car TEGRA124_CLK_USB3>;
>   		resets = <&tegra_car 59>;
>   		reset-names = "usb";
>   		nvidia,phy = <&phy3>;
>   		status = "disabled";
>   	};
>
>   	phy3: usb-phy@0,7d008000 {
>   		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
>   		reg = <0x0 0x7d008000 0x0 0x4000>,
>   		      <0x0 0x7d000000 0x0 0x4000>;
>   		phy_type = "utmi";
>   		clocks = <&tegra_car TEGRA124_CLK_USB3>,
>   			 <&tegra_car TEGRA124_CLK_PLL_U>,
>   			 <&tegra_car TEGRA124_CLK_USBD>;
>   		clock-names = "reg", "pll_u", "utmi-pads";
> -		resets = <&tegra_car 58>, <&tegra_car 22>;
> +		resets = <&tegra_car 59>, <&tegra_car 22>;
>   		reset-names = "usb", "utmi-pads";
>   		nvidia,hssync-start-delay = <0>;
>   		nvidia,idle-wait-delay = <17>;
>   		nvidia,elastic-limit = <16>;
>   		nvidia,term-range-adj = <6>;
>   		nvidia,xcvr-setup = <9>;
>   		nvidia,xcvr-lsfslew = <0>;
>   		nvidia,xcvr-lsrslew = <3>;
>   		nvidia,hssquelch-level = <2>;
>   		nvidia,hsdiscon-level = <5>;
>   		nvidia,xcvr-hsslew = <12>;
>   		status = "disabled";
>   	};
>
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>
>   		cpu@0 {
>   			device_type = "cpu";
>
