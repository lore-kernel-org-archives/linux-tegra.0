From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: dt: tegra114: Add new SoC base, Tegra 114 SoC
Date: Thu, 20 Dec 2012 11:27:26 +0000
Message-ID: <50D2F61E.10900@arm.com>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com> <1355996654-6579-7-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355996654-6579-7-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20/12/12 09:44, Hiroshi Doyu wrote:
> Initial support for Tegra 114 SoC. This is expected to be included in
> the board DTS files, Tegra 114 SoC based evaluation board family.
> 
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

You definitely need to add some cpu nodes here, or get someone to merge
the NR_CPUS=0 patch: https://lkml.org/lkml/2012/3/31/131

;-)

> ---
>  arch/arm/boot/dts/tegra114.dtsi |   89 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 arch/arm/boot/dts/tegra114.dtsi
> 
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> new file mode 100644
> index 0000000..a5b7330
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -0,0 +1,89 @@
> +/include/ "skeleton.dtsi"
> +
> +/ {
> +	compatible = "nvidia,tegra114";
> +	interrupt-parent = <&gic>;
> +
> +	gic: interrupt-controller {
> +		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> +		reg = <0x50041000 0x1000
> +		       0x50042000 0x1000>;

If this is indeed an A15 GIC, how about adding the GICH and GICV
regions, as well as the VGIC maintenance interrupt?

> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +	};
> +
> +	timer@60005000 {
> +		compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
> +		reg = <0x60005000 0x400>;
> +		interrupts = <0 0 0x04
> +			      0 1 0x04
> +			      0 41 0x04
> +			      0 42 0x04
> +			      0 121 0x04
> +			      0 122 0x04>;
> +	};
> +
> +	serial@70006000 {
> +		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006000 0x40>;
> +		reg-shift = <2>;
> +		interrupts = <0 36 0x04>;
> +		status = "disabled";
> +	};
> +
> +	serial@70006040 {
> +		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006040 0x40>;
> +		reg-shift = <2>;
> +		interrupts = <0 37 0x04>;
> +		status = "disabled";
> +	};
> +
> +	serial@70006200 {
> +		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006200 0x100>;
> +		reg-shift = <2>;
> +		interrupts = <0 46 0x04>;
> +		status = "disabled";
> +	};
> +
> +	serial@70006300 {
> +		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006300 0x100>;
> +		reg-shift = <2>;
> +		interrupts = <0 90 0x04>;
> +		status = "disabled";
> +	};
> +
> +	serial@70006400 {
> +		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006400 0x100>;
> +		reg-shift = <2>;
> +		interrupts = <0 91 0x04>;
> +		status = "disabled";
> +	};
> +
> +	rtc {
> +		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
> +		reg = <0x7000e000 0x100>;
> +		interrupts = <0 2 0x04>;
> +	};
> +
> +	pmc {
> +		compatible = "nvidia,tegra114-pmc", "nvidia,tegra20-pmc";
> +		reg = <0x7000e400 0x400>;
> +	};
> +
> +	tsc {
> +		compatible = "nvidia,tegra114-tsc";
> +		reg = <0x700f0000 0x20000>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <1 13 0xf08>,
> +			     <1 14 0xf08>,
> +			     <1 11 0xf08>,
> +			     <1 10 0xf08>;
> +	};
> +};
> 


-- 
Jazz is not dead. It just smells funny...
