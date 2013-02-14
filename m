From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: tegra: use pre-processor for all device trees
Date: Thu, 14 Feb 2013 11:41:59 -0600
Message-ID: <511D21E7.5090307@gmail.com>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org> <1360791198-29462-7-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360791198-29462-7-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/13/2013 03:33 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This enables a C pre-processor pass on all Tegra device trees. This
> allows future use of #defines and header files in order to define names
> for various constants, such as the IDs and flags in GPIO specifiers.
> Use of those features will increase the readability of the device tree
> files.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts      |   21 -
>  arch/arm/boot/dts/tegra114-dalmore.dtsp     |   21 +
>  arch/arm/boot/dts/tegra114-pluto.dts        |   21 -
>  arch/arm/boot/dts/tegra114-pluto.dtsp       |   21 +
>  arch/arm/boot/dts/tegra114.dtsi             |  153 -----
>  arch/arm/boot/dts/tegra114.dtsip            |  153 +++++
>  arch/arm/boot/dts/tegra20-colibri-512.dtsi  |  491 ----------------
>  arch/arm/boot/dts/tegra20-colibri-512.dtsip |  491 ++++++++++++++++
>  arch/arm/boot/dts/tegra20-harmony.dts       |  660 ----------------------
>  arch/arm/boot/dts/tegra20-harmony.dtsp      |  660 ++++++++++++++++++++++
>  arch/arm/boot/dts/tegra20-iris-512.dts      |   89 ---
>  arch/arm/boot/dts/tegra20-iris-512.dtsp     |   89 +++
>  arch/arm/boot/dts/tegra20-medcom-wide.dts   |   58 --
>  arch/arm/boot/dts/tegra20-medcom-wide.dtsp  |   58 ++
>  arch/arm/boot/dts/tegra20-paz00.dts         |  505 -----------------
>  arch/arm/boot/dts/tegra20-paz00.dtsp        |  505 +++++++++++++++++
>  arch/arm/boot/dts/tegra20-plutux.dts        |   56 --
>  arch/arm/boot/dts/tegra20-plutux.dtsp       |   56 ++
>  arch/arm/boot/dts/tegra20-seaboard.dts      |  812 ---------------------------
>  arch/arm/boot/dts/tegra20-seaboard.dtsp     |  812 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/tegra20-tamonten.dtsi     |  489 ----------------
>  arch/arm/boot/dts/tegra20-tamonten.dtsip    |  489 ++++++++++++++++
>  arch/arm/boot/dts/tegra20-tec.dts           |   56 --
>  arch/arm/boot/dts/tegra20-tec.dtsp          |   56 ++
>  arch/arm/boot/dts/tegra20-trimslice.dts     |  367 ------------
>  arch/arm/boot/dts/tegra20-trimslice.dtsp    |  367 ++++++++++++
>  arch/arm/boot/dts/tegra20-ventana.dts       |  611 --------------------
>  arch/arm/boot/dts/tegra20-ventana.dtsp      |  611 ++++++++++++++++++++
>  arch/arm/boot/dts/tegra20-whistler.dts      |  563 -------------------
>  arch/arm/boot/dts/tegra20-whistler.dtsp     |  563 +++++++++++++++++++
>  arch/arm/boot/dts/tegra20.dtsi              |  556 ------------------
>  arch/arm/boot/dts/tegra20.dtsip             |  556 ++++++++++++++++++
>  arch/arm/boot/dts/tegra30-beaver.dts        |  373 ------------
>  arch/arm/boot/dts/tegra30-beaver.dtsp       |  373 ++++++++++++
>  arch/arm/boot/dts/tegra30-cardhu-a02.dts    |   93 ---
>  arch/arm/boot/dts/tegra30-cardhu-a02.dtsp   |   93 +++
>  arch/arm/boot/dts/tegra30-cardhu-a04.dts    |  104 ----
>  arch/arm/boot/dts/tegra30-cardhu-a04.dtsp   |  104 ++++
>  arch/arm/boot/dts/tegra30-cardhu.dtsi       |  500 -----------------
>  arch/arm/boot/dts/tegra30-cardhu.dtsip      |  500 +++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi              |  579 -------------------
>  arch/arm/boot/dts/tegra30.dtsip             |  579 +++++++++++++++++++
>  42 files changed, 7157 insertions(+), 7157 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/tegra114-dalmore.dts
>  create mode 100644 arch/arm/boot/dts/tegra114-dalmore.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra114-pluto.dts
>  create mode 100644 arch/arm/boot/dts/tegra114-pluto.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra114.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra114.dtsip
>  delete mode 100644 arch/arm/boot/dts/tegra20-colibri-512.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra20-colibri-512.dtsip
>  delete mode 100644 arch/arm/boot/dts/tegra20-harmony.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-harmony.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-iris-512.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-iris-512.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-medcom-wide.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-medcom-wide.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-paz00.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-paz00.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-plutux.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-plutux.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-seaboard.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-seaboard.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-tamonten.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra20-tamonten.dtsip
>  delete mode 100644 arch/arm/boot/dts/tegra20-tec.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-tec.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-trimslice.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-trimslice.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-ventana.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-ventana.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20-whistler.dts
>  create mode 100644 arch/arm/boot/dts/tegra20-whistler.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra20.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra20.dtsip
>  delete mode 100644 arch/arm/boot/dts/tegra30-beaver.dts
>  create mode 100644 arch/arm/boot/dts/tegra30-beaver.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra30-cardhu-a02.dts
>  create mode 100644 arch/arm/boot/dts/tegra30-cardhu-a02.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra30-cardhu-a04.dts
>  create mode 100644 arch/arm/boot/dts/tegra30-cardhu-a04.dtsp
>  delete mode 100644 arch/arm/boot/dts/tegra30-cardhu.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra30-cardhu.dtsip
>  delete mode 100644 arch/arm/boot/dts/tegra30.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra30.dtsip

Just a reminder to use -M for git format-patch. Why -M for format-patch
is not the default I wonder.

Rob

> 
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> deleted file mode 100644
> index a30aca6..0000000
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra114.dtsi"
> -
> -/ {
> -	model = "NVIDIA Tegra114 Dalmore evaluation board";
> -	compatible = "nvidia,dalmore", "nvidia,tegra114";
> -
> -	memory {
> -		reg = <0x80000000 0x40000000>;
> -	};
> -
> -	serial@70006300 {
> -		status = "okay";
> -		clock-frequency = <408000000>;
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dtsp b/arch/arm/boot/dts/tegra114-dalmore.dtsp
> new file mode 100644
> index 0000000..51f67cd
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dtsp
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +#include "tegra114.dtsip"
> +
> +/ {
> +	model = "NVIDIA Tegra114 Dalmore evaluation board";
> +	compatible = "nvidia,dalmore", "nvidia,tegra114";
> +
> +	memory {
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	serial@70006300 {
> +		status = "okay";
> +		clock-frequency = <408000000>;
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra114-pluto.dts b/arch/arm/boot/dts/tegra114-pluto.dts
> deleted file mode 100644
> index 9bea8f5..0000000
> --- a/arch/arm/boot/dts/tegra114-pluto.dts
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra114.dtsi"
> -
> -/ {
> -	model = "NVIDIA Tegra114 Pluto evaluation board";
> -	compatible = "nvidia,pluto", "nvidia,tegra114";
> -
> -	memory {
> -		reg = <0x80000000 0x40000000>;
> -	};
> -
> -	serial@70006300 {
> -		status = "okay";
> -		clock-frequency = <408000000>;
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra114-pluto.dtsp b/arch/arm/boot/dts/tegra114-pluto.dtsp
> new file mode 100644
> index 0000000..40a88d1
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra114-pluto.dtsp
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +#include "tegra114.dtsip"
> +
> +/ {
> +	model = "NVIDIA Tegra114 Pluto evaluation board";
> +	compatible = "nvidia,pluto", "nvidia,tegra114";
> +
> +	memory {
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	serial@70006300 {
> +		status = "okay";
> +		clock-frequency = <408000000>;
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> deleted file mode 100644
> index 1dfaf28..0000000
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ /dev/null
> @@ -1,153 +0,0 @@
> -/include/ "skeleton.dtsi"
> -
> -/ {
> -	compatible = "nvidia,tegra114";
> -	interrupt-parent = <&gic>;
> -
> -	gic: interrupt-controller {
> -		compatible = "arm,cortex-a15-gic";
> -		#interrupt-cells = <3>;
> -		interrupt-controller;
> -		reg = <0x50041000 0x1000>,
> -		      <0x50042000 0x1000>,
> -		      <0x50044000 0x2000>,
> -		      <0x50046000 0x2000>;
> -		interrupts = <1 9 0xf04>;
> -	};
> -
> -	timer@60005000 {
> -		compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
> -		reg = <0x60005000 0x400>;
> -		interrupts = <0 0 0x04
> -			      0 1 0x04
> -			      0 41 0x04
> -			      0 42 0x04
> -			      0 121 0x04
> -			      0 122 0x04>;
> -	};
> -
> -	tegra_car: clock {
> -		compatible = "nvidia,tegra114-car, nvidia,tegra30-car";
> -		reg = <0x60006000 0x1000>;
> -		#clock-cells = <1>;
> -	};
> -
> -	ahb: ahb {
> -		compatible = "nvidia,tegra114-ahb", "nvidia,tegra30-ahb";
> -		reg = <0x6000c004 0x14c>;
> -	};
> -
> -	gpio: gpio {
> -		compatible = "nvidia,tegra114-gpio", "nvidia,tegra30-gpio";
> -		reg = <0x6000d000 0x1000>;
> -		interrupts = <0 32 0x04
> -			      0 33 0x04
> -			      0 34 0x04
> -			      0 35 0x04
> -			      0 55 0x04
> -			      0 87 0x04
> -			      0 89 0x04
> -			      0 125 0x04>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		#interrupt-cells = <2>;
> -		interrupt-controller;
> -	};
> -
> -	pinmux: pinmux {
> -		compatible = "nvidia,tegra114-pinmux";
> -		reg = <0x70000868 0x148		/* Pad control registers */
> -		       0x70003000 0x40c>;	/* Mux registers */
> -	};
> -
> -	serial@70006000 {
> -		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006000 0x40>;
> -		reg-shift = <2>;
> -		interrupts = <0 36 0x04>;
> -		status = "disabled";
> -	};
> -
> -	serial@70006040 {
> -		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006040 0x40>;
> -		reg-shift = <2>;
> -		interrupts = <0 37 0x04>;
> -		status = "disabled";
> -	};
> -
> -	serial@70006200 {
> -		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006200 0x100>;
> -		reg-shift = <2>;
> -		interrupts = <0 46 0x04>;
> -		status = "disabled";
> -	};
> -
> -	serial@70006300 {
> -		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006300 0x100>;
> -		reg-shift = <2>;
> -		interrupts = <0 90 0x04>;
> -		status = "disabled";
> -	};
> -
> -	rtc {
> -		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
> -		reg = <0x7000e000 0x100>;
> -		interrupts = <0 2 0x04>;
> -	};
> -
> -	pmc {
> -		compatible = "nvidia,tegra114-pmc", "nvidia,tegra30-pmc";
> -		reg = <0x7000e400 0x400>;
> -	};
> -
> -	iommu {
> -		compatible = "nvidia,tegra114-smmu", "nvidia,tegra30-smmu";
> -		reg = <0x7000f010 0x02c
> -		       0x7000f1f0 0x010
> -		       0x7000f228 0x074>;
> -		nvidia,#asids = <4>;
> -		dma-window = <0 0x40000000>;
> -		nvidia,swgroups = <0x18659fe>;
> -		nvidia,ahb = <&ahb>;
> -	};
> -
> -	cpus {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		cpu@0 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a15";
> -			reg = <0>;
> -		};
> -
> -		cpu@1 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a15";
> -			reg = <1>;
> -		};
> -
> -		cpu@2 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a15";
> -			reg = <2>;
> -		};
> -
> -		cpu@3 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a15";
> -			reg = <3>;
> -		};
> -	};
> -
> -	timer {
> -		compatible = "arm,armv7-timer";
> -		interrupts = <1 13 0xf08>,
> -			     <1 14 0xf08>,
> -			     <1 11 0xf08>,
> -			     <1 10 0xf08>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra114.dtsip b/arch/arm/boot/dts/tegra114.dtsip
> new file mode 100644
> index 0000000..d2150f0
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra114.dtsip
> @@ -0,0 +1,153 @@
> +#include "skeleton.dtsi"
> +
> +/ {
> +	compatible = "nvidia,tegra114";
> +	interrupt-parent = <&gic>;
> +
> +	gic: interrupt-controller {
> +		compatible = "arm,cortex-a15-gic";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x50041000 0x1000>,
> +		      <0x50042000 0x1000>,
> +		      <0x50044000 0x2000>,
> +		      <0x50046000 0x2000>;
> +		interrupts = <1 9 0xf04>;
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
> +	tegra_car: clock {
> +		compatible = "nvidia,tegra114-car, nvidia,tegra30-car";
> +		reg = <0x60006000 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
> +	ahb: ahb {
> +		compatible = "nvidia,tegra114-ahb", "nvidia,tegra30-ahb";
> +		reg = <0x6000c004 0x14c>;
> +	};
> +
> +	gpio: gpio {
> +		compatible = "nvidia,tegra114-gpio", "nvidia,tegra30-gpio";
> +		reg = <0x6000d000 0x1000>;
> +		interrupts = <0 32 0x04
> +			      0 33 0x04
> +			      0 34 0x04
> +			      0 35 0x04
> +			      0 55 0x04
> +			      0 87 0x04
> +			      0 89 0x04
> +			      0 125 0x04>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +	};
> +
> +	pinmux: pinmux {
> +		compatible = "nvidia,tegra114-pinmux";
> +		reg = <0x70000868 0x148		/* Pad control registers */
> +		       0x70003000 0x40c>;	/* Mux registers */
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
> +	rtc {
> +		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
> +		reg = <0x7000e000 0x100>;
> +		interrupts = <0 2 0x04>;
> +	};
> +
> +	pmc {
> +		compatible = "nvidia,tegra114-pmc", "nvidia,tegra30-pmc";
> +		reg = <0x7000e400 0x400>;
> +	};
> +
> +	iommu {
> +		compatible = "nvidia,tegra114-smmu", "nvidia,tegra30-smmu";
> +		reg = <0x7000f010 0x02c
> +		       0x7000f1f0 0x010
> +		       0x7000f228 0x074>;
> +		nvidia,#asids = <4>;
> +		dma-window = <0 0x40000000>;
> +		nvidia,swgroups = <0x18659fe>;
> +		nvidia,ahb = <&ahb>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a15";
> +			reg = <0>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a15";
> +			reg = <1>;
> +		};
> +
> +		cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a15";
> +			reg = <2>;
> +		};
> +
> +		cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a15";
> +			reg = <3>;
> +		};
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
> diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> deleted file mode 100644
> index 4441620..0000000
> --- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> +++ /dev/null
> @@ -1,491 +0,0 @@
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "Toradex Colibri T20 512MB";
> -	compatible = "toradex,colibri_t20-512", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x20000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&i2c_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			audio_refclk {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			crt {
> -				nvidia,pins = "crtp";
> -				nvidia,function = "crt";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			displaya {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3",
> -					"ld4", "ld5", "ld6", "ld7", "ld8",
> -					"ld9", "ld10", "ld11", "ld12", "ld13",
> -					"ld14", "ld15", "ld16", "ld17",
> -					"lhs", "lpw0", "lpw2", "lsc0",
> -					"lsc1", "lsck", "lsda", "lspi", "lvs";
> -				nvidia,function = "displaya";
> -				nvidia,tristate = <1>;
> -			};
> -			gpio_dte {
> -				nvidia,pins = "dte";
> -				nvidia,function = "rsvd1";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			gpio_gmi {
> -				nvidia,pins = "ata", "atc", "atd", "ate",
> -					"dap1", "dap2", "dap4", "gpu", "irrx",
> -					"irtx", "spia", "spib", "spic";
> -				nvidia,function = "gmi";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			gpio_pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "rsvd4";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			gpio_uac {
> -				nvidia,pins = "uac";
> -				nvidia,function = "rsvd2";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			hdint {
> -				nvidia,pins = "hdint";
> -				nvidia,function = "hdmi";
> -				nvidia,tristate = <1>;
> -			};
> -			i2c1 {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			i2c3 {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			i2cddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			irda {
> -				nvidia,pins = "uad";
> -				nvidia,function = "irda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			nand {
> -				nvidia,pins = "kbca", "kbcc", "kbcd",
> -					"kbce", "kbcf";
> -				nvidia,function = "nand";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			owc {
> -				nvidia,pins = "owc";
> -				nvidia,function = "owr";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -				nvidia,tristate = <0>;
> -			};
> -			pwm {
> -				nvidia,pins = "sdb", "sdc", "sdd";
> -				nvidia,function = "pwm";
> -				nvidia,tristate = <1>;
> -			};
> -			sdio4 {
> -				nvidia,pins = "atb", "gma", "gme";
> -				nvidia,function = "sdio4";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			spi1 {
> -				nvidia,pins = "spid", "spie", "spif";
> -				nvidia,function = "spi1";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			spi4 {
> -				nvidia,pins = "slxa", "slxc", "slxd", "slxk";
> -				nvidia,function = "spi4";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			uarta {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "uarta";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			uartd {
> -				nvidia,pins = "gmc";
> -				nvidia,function = "uartd";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			ulpi {
> -				nvidia,pins = "uaa", "uab", "uda";
> -				nvidia,function = "ulpi";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			ulpi_refclk {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "pllp_out4";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			usb_gpio {
> -				nvidia,pins = "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			vi {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> -				nvidia,function = "vi";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			vi_sc {
> -				nvidia,pins = "csus";
> -				nvidia,function = "vi_sensor_clk";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -		};
> -	};
> -
> -	i2c@7000c000 {
> -		clock-frequency = <400000>;
> -	};
> -
> -	i2c_ddc: i2c@7000c400 {
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c500 {
> -		clock-frequency = <400000>;
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		pmic: tps6586x@34 {
> -			compatible = "ti,tps6586x";
> -			reg = <0x34>;
> -			interrupts = <0 86 0x4>;
> -
> -			ti,system-power-controller;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			sys-supply = <&vdd_5v0_reg>;
> -			vin-sm0-supply = <&sys_reg>;
> -			vin-sm1-supply = <&sys_reg>;
> -			vin-sm2-supply = <&sys_reg>;
> -			vinldo01-supply = <&sm2_reg>;
> -			vinldo23-supply = <&sm2_reg>;
> -			vinldo4-supply = <&sm2_reg>;
> -			vinldo678-supply = <&sm2_reg>;
> -			vinldo9-supply = <&sm2_reg>;
> -
> -			regulators {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				sys_reg: regulator@0 {
> -					reg = <0>;
> -					regulator-compatible = "sys";
> -					regulator-name = "vdd_sys";
> -					regulator-always-on;
> -				};
> -
> -				regulator@1 {
> -					reg = <1>;
> -					regulator-compatible = "sm0";
> -					regulator-name = "vdd_sm0,vdd_core";
> -					regulator-min-microvolt = <1275000>;
> -					regulator-max-microvolt = <1275000>;
> -					regulator-always-on;
> -				};
> -
> -				regulator@2 {
> -					reg = <2>;
> -					regulator-compatible = "sm1";
> -					regulator-name = "vdd_sm1,vdd_cpu";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				sm2_reg: regulator@3 {
> -					reg = <3>;
> -					regulator-compatible = "sm2";
> -					regulator-name = "vdd_sm2,vin_ldo*";
> -					regulator-min-microvolt = <3700000>;
> -					regulator-max-microvolt = <3700000>;
> -					regulator-always-on;
> -				};
> -
> -				/* LDO0 is not connected to anything */
> -
> -				regulator@5 {
> -					reg = <5>;
> -					regulator-compatible = "ldo1";
> -					regulator-name = "vdd_ldo1,avdd_pll*";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				regulator@6 {
> -					reg = <6>;
> -					regulator-compatible = "ldo2";
> -					regulator-name = "vdd_ldo2,vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				/* LDO3 is not connected to anything */
> -
> -				regulator@8 {
> -					reg = <8>;
> -					regulator-compatible = "ldo4";
> -					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5_reg: regulator@9 {
> -					reg = <9>;
> -					regulator-compatible = "ldo5";
> -					regulator-name = "vdd_ldo5,vdd_fuse";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				regulator@10 {
> -					reg = <10>;
> -					regulator-compatible = "ldo6";
> -					regulator-name = "vdd_ldo6,avdd_vdac,vddio_vi,vddio_cam";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				hdmi_vdd_reg: regulator@11 {
> -					reg = <11>;
> -					regulator-compatible = "ldo7";
> -					regulator-name = "vdd_ldo7,avdd_hdmi";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				hdmi_pll_reg: regulator@12 {
> -					reg = <12>;
> -					regulator-compatible = "ldo8";
> -					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				regulator@13 {
> -					reg = <13>;
> -					regulator-compatible = "ldo9";
> -					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				regulator@14 {
> -					reg = <14>;
> -					regulator-compatible = "ldo_rtc";
> -					regulator-name = "vdd_rtc_out,vdd_cell";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -
> -		temperature-sensor@4c {
> -			compatible = "national,lm95245";
> -			reg = <0x4c>;
> -		};
> -	};
> -
> -	memory-controller@7000f400 {
> -		emc-table@83250 {
> -			reg = <83250>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = <83250>;
> -			nvidia,emc-registers =   <0x00000005 0x00000011
> -				0x00000004 0x00000002 0x00000004 0x00000004
> -				0x00000001 0x0000000a 0x00000002 0x00000002
> -				0x00000001 0x00000001 0x00000003 0x00000004
> -				0x00000003 0x00000009 0x0000000c 0x0000025f
> -				0x00000000 0x00000003 0x00000003 0x00000002
> -				0x00000002 0x00000001 0x00000008 0x000000c8
> -				0x00000003 0x00000005 0x00000003 0x0000000c
> -				0x00000002 0x00000000 0x00000000 0x00000002
> -				0x00000000 0x00000000 0x00000083 0x00520006
> -				0x00000010 0x00000008 0x00000000 0x00000000
> -				0x00000000 0x00000000 0x00000000 0x00000000>;
> -		};
> -		emc-table@133200 {
> -			reg = <133200>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = <133200>;
> -			nvidia,emc-registers =   <0x00000008 0x00000019
> -				0x00000006 0x00000002 0x00000004 0x00000004
> -				0x00000001 0x0000000a 0x00000002 0x00000002
> -				0x00000002 0x00000001 0x00000003 0x00000004
> -				0x00000003 0x00000009 0x0000000c 0x0000039f
> -				0x00000000 0x00000003 0x00000003 0x00000002
> -				0x00000002 0x00000001 0x00000008 0x000000c8
> -				0x00000003 0x00000007 0x00000003 0x0000000c
> -				0x00000002 0x00000000 0x00000000 0x00000002
> -				0x00000000 0x00000000 0x00000083 0x00510006
> -				0x00000010 0x00000008 0x00000000 0x00000000
> -				0x00000000 0x00000000 0x00000000 0x00000000>;
> -		};
> -		emc-table@166500 {
> -			reg = <166500>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = <166500>;
> -			nvidia,emc-registers =   <0x0000000a 0x00000021
> -				0x00000008 0x00000003 0x00000004 0x00000004
> -				0x00000002 0x0000000a 0x00000003 0x00000003
> -				0x00000002 0x00000001 0x00000003 0x00000004
> -				0x00000003 0x00000009 0x0000000c 0x000004df
> -				0x00000000 0x00000003 0x00000003 0x00000003
> -				0x00000003 0x00000001 0x00000009 0x000000c8
> -				0x00000003 0x00000009 0x00000004 0x0000000c
> -				0x00000002 0x00000000 0x00000000 0x00000002
> -				0x00000000 0x00000000 0x00000083 0x004f0006
> -				0x00000010 0x00000008 0x00000000 0x00000000
> -				0x00000000 0x00000000 0x00000000 0x00000000>;
> -		};
> -		emc-table@333000 {
> -			reg = <333000>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = <333000>;
> -			nvidia,emc-registers =   <0x00000014 0x00000041
> -				0x0000000f 0x00000005 0x00000004 0x00000005
> -				0x00000003 0x0000000a 0x00000005 0x00000005
> -				0x00000004 0x00000001 0x00000003 0x00000004
> -				0x00000003 0x00000009 0x0000000c 0x000009ff
> -				0x00000000 0x00000003 0x00000003 0x00000005
> -				0x00000005 0x00000001 0x0000000e 0x000000c8
> -				0x00000003 0x00000011 0x00000006 0x0000000c
> -				0x00000002 0x00000000 0x00000000 0x00000002
> -				0x00000000 0x00000000 0x00000083 0x00380006
> -				0x00000010 0x00000008 0x00000000 0x00000000
> -				0x00000000 0x00000000 0x00000000 0x00000000>;
> -		};
> -	};
> -
> -	ac97: ac97 {
> -		status = "okay";
> -		nvidia,codec-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> -		nvidia,codec-sync-gpio = <&gpio 120 0>; /* gpio PP0 */
> -	};
> -
> -	usb@c5004000 {
> -		status = "okay";
> -		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> -	};
> -
> -	sdhci@c8000600 {
> -		cd-gpios = <&gpio 23 0>; /* gpio PC7 */
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
> -			         "nvidia,tegra-audio-wm9712";
> -		nvidia,model = "Colibri T20 AC97 Audio";
> -
> -		nvidia,audio-routing =
> -			"Headphone", "HPOUTL",
> -			"Headphone", "HPOUTR",
> -			"LineIn", "LINEINL",
> -			"LineIn", "LINEINR",
> -			"Mic", "MIC1";
> -
> -		nvidia,ac97-controller = <&ac97>;
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		vdd_5v0_reg: regulator@100 {
> -			compatible = "regulator-fixed";
> -			reg = <100>;
> -			regulator-name = "vdd_5v0";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -
> -		regulator@101 {
> -			compatible = "regulator-fixed";
> -			reg = <101>;
> -			regulator-name = "internal_usb";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			regulator-boot-on;
> -			regulator-always-on;
> -			gpio = <&gpio 217 0>;
> -		};
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsip b/arch/arm/boot/dts/tegra20-colibri-512.dtsip
> new file mode 100644
> index 0000000..bf8865b
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsip
> @@ -0,0 +1,491 @@
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "Toradex Colibri T20 512MB";
> +	compatible = "toradex,colibri_t20-512", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x20000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&i2c_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			audio_refclk {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			crt {
> +				nvidia,pins = "crtp";
> +				nvidia,function = "crt";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			displaya {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3",
> +					"ld4", "ld5", "ld6", "ld7", "ld8",
> +					"ld9", "ld10", "ld11", "ld12", "ld13",
> +					"ld14", "ld15", "ld16", "ld17",
> +					"lhs", "lpw0", "lpw2", "lsc0",
> +					"lsc1", "lsck", "lsda", "lspi", "lvs";
> +				nvidia,function = "displaya";
> +				nvidia,tristate = <1>;
> +			};
> +			gpio_dte {
> +				nvidia,pins = "dte";
> +				nvidia,function = "rsvd1";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			gpio_gmi {
> +				nvidia,pins = "ata", "atc", "atd", "ate",
> +					"dap1", "dap2", "dap4", "gpu", "irrx",
> +					"irtx", "spia", "spib", "spic";
> +				nvidia,function = "gmi";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			gpio_pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			gpio_uac {
> +				nvidia,pins = "uac";
> +				nvidia,function = "rsvd2";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			hdint {
> +				nvidia,pins = "hdint";
> +				nvidia,function = "hdmi";
> +				nvidia,tristate = <1>;
> +			};
> +			i2c1 {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			i2c3 {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			i2cddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			irda {
> +				nvidia,pins = "uad";
> +				nvidia,function = "irda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			nand {
> +				nvidia,pins = "kbca", "kbcc", "kbcd",
> +					"kbce", "kbcf";
> +				nvidia,function = "nand";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			owc {
> +				nvidia,pins = "owc";
> +				nvidia,function = "owr";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +				nvidia,tristate = <0>;
> +			};
> +			pwm {
> +				nvidia,pins = "sdb", "sdc", "sdd";
> +				nvidia,function = "pwm";
> +				nvidia,tristate = <1>;
> +			};
> +			sdio4 {
> +				nvidia,pins = "atb", "gma", "gme";
> +				nvidia,function = "sdio4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			spi1 {
> +				nvidia,pins = "spid", "spie", "spif";
> +				nvidia,function = "spi1";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			spi4 {
> +				nvidia,pins = "slxa", "slxc", "slxd", "slxk";
> +				nvidia,function = "spi4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			uarta {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "uarta";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			uartd {
> +				nvidia,pins = "gmc";
> +				nvidia,function = "uartd";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			ulpi {
> +				nvidia,pins = "uaa", "uab", "uda";
> +				nvidia,function = "ulpi";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			ulpi_refclk {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "pllp_out4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			usb_gpio {
> +				nvidia,pins = "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			vi {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> +				nvidia,function = "vi";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			vi_sc {
> +				nvidia,pins = "csus";
> +				nvidia,function = "vi_sensor_clk";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +		};
> +	};
> +
> +	i2c@7000c000 {
> +		clock-frequency = <400000>;
> +	};
> +
> +	i2c_ddc: i2c@7000c400 {
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c500 {
> +		clock-frequency = <400000>;
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		pmic: tps6586x@34 {
> +			compatible = "ti,tps6586x";
> +			reg = <0x34>;
> +			interrupts = <0 86 0x4>;
> +
> +			ti,system-power-controller;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			sys-supply = <&vdd_5v0_reg>;
> +			vin-sm0-supply = <&sys_reg>;
> +			vin-sm1-supply = <&sys_reg>;
> +			vin-sm2-supply = <&sys_reg>;
> +			vinldo01-supply = <&sm2_reg>;
> +			vinldo23-supply = <&sm2_reg>;
> +			vinldo4-supply = <&sm2_reg>;
> +			vinldo678-supply = <&sm2_reg>;
> +			vinldo9-supply = <&sm2_reg>;
> +
> +			regulators {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sys_reg: regulator@0 {
> +					reg = <0>;
> +					regulator-compatible = "sys";
> +					regulator-name = "vdd_sys";
> +					regulator-always-on;
> +				};
> +
> +				regulator@1 {
> +					reg = <1>;
> +					regulator-compatible = "sm0";
> +					regulator-name = "vdd_sm0,vdd_core";
> +					regulator-min-microvolt = <1275000>;
> +					regulator-max-microvolt = <1275000>;
> +					regulator-always-on;
> +				};
> +
> +				regulator@2 {
> +					reg = <2>;
> +					regulator-compatible = "sm1";
> +					regulator-name = "vdd_sm1,vdd_cpu";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				sm2_reg: regulator@3 {
> +					reg = <3>;
> +					regulator-compatible = "sm2";
> +					regulator-name = "vdd_sm2,vin_ldo*";
> +					regulator-min-microvolt = <3700000>;
> +					regulator-max-microvolt = <3700000>;
> +					regulator-always-on;
> +				};
> +
> +				/* LDO0 is not connected to anything */
> +
> +				regulator@5 {
> +					reg = <5>;
> +					regulator-compatible = "ldo1";
> +					regulator-name = "vdd_ldo1,avdd_pll*";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				regulator@6 {
> +					reg = <6>;
> +					regulator-compatible = "ldo2";
> +					regulator-name = "vdd_ldo2,vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				/* LDO3 is not connected to anything */
> +
> +				regulator@8 {
> +					reg = <8>;
> +					regulator-compatible = "ldo4";
> +					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5_reg: regulator@9 {
> +					reg = <9>;
> +					regulator-compatible = "ldo5";
> +					regulator-name = "vdd_ldo5,vdd_fuse";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				regulator@10 {
> +					reg = <10>;
> +					regulator-compatible = "ldo6";
> +					regulator-name = "vdd_ldo6,avdd_vdac,vddio_vi,vddio_cam";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				hdmi_vdd_reg: regulator@11 {
> +					reg = <11>;
> +					regulator-compatible = "ldo7";
> +					regulator-name = "vdd_ldo7,avdd_hdmi";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				hdmi_pll_reg: regulator@12 {
> +					reg = <12>;
> +					regulator-compatible = "ldo8";
> +					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				regulator@13 {
> +					reg = <13>;
> +					regulator-compatible = "ldo9";
> +					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				regulator@14 {
> +					reg = <14>;
> +					regulator-compatible = "ldo_rtc";
> +					regulator-name = "vdd_rtc_out,vdd_cell";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +
> +		temperature-sensor@4c {
> +			compatible = "national,lm95245";
> +			reg = <0x4c>;
> +		};
> +	};
> +
> +	memory-controller@7000f400 {
> +		emc-table@83250 {
> +			reg = <83250>;
> +			compatible = "nvidia,tegra20-emc-table";
> +			clock-frequency = <83250>;
> +			nvidia,emc-registers =   <0x00000005 0x00000011
> +				0x00000004 0x00000002 0x00000004 0x00000004
> +				0x00000001 0x0000000a 0x00000002 0x00000002
> +				0x00000001 0x00000001 0x00000003 0x00000004
> +				0x00000003 0x00000009 0x0000000c 0x0000025f
> +				0x00000000 0x00000003 0x00000003 0x00000002
> +				0x00000002 0x00000001 0x00000008 0x000000c8
> +				0x00000003 0x00000005 0x00000003 0x0000000c
> +				0x00000002 0x00000000 0x00000000 0x00000002
> +				0x00000000 0x00000000 0x00000083 0x00520006
> +				0x00000010 0x00000008 0x00000000 0x00000000
> +				0x00000000 0x00000000 0x00000000 0x00000000>;
> +		};
> +		emc-table@133200 {
> +			reg = <133200>;
> +			compatible = "nvidia,tegra20-emc-table";
> +			clock-frequency = <133200>;
> +			nvidia,emc-registers =   <0x00000008 0x00000019
> +				0x00000006 0x00000002 0x00000004 0x00000004
> +				0x00000001 0x0000000a 0x00000002 0x00000002
> +				0x00000002 0x00000001 0x00000003 0x00000004
> +				0x00000003 0x00000009 0x0000000c 0x0000039f
> +				0x00000000 0x00000003 0x00000003 0x00000002
> +				0x00000002 0x00000001 0x00000008 0x000000c8
> +				0x00000003 0x00000007 0x00000003 0x0000000c
> +				0x00000002 0x00000000 0x00000000 0x00000002
> +				0x00000000 0x00000000 0x00000083 0x00510006
> +				0x00000010 0x00000008 0x00000000 0x00000000
> +				0x00000000 0x00000000 0x00000000 0x00000000>;
> +		};
> +		emc-table@166500 {
> +			reg = <166500>;
> +			compatible = "nvidia,tegra20-emc-table";
> +			clock-frequency = <166500>;
> +			nvidia,emc-registers =   <0x0000000a 0x00000021
> +				0x00000008 0x00000003 0x00000004 0x00000004
> +				0x00000002 0x0000000a 0x00000003 0x00000003
> +				0x00000002 0x00000001 0x00000003 0x00000004
> +				0x00000003 0x00000009 0x0000000c 0x000004df
> +				0x00000000 0x00000003 0x00000003 0x00000003
> +				0x00000003 0x00000001 0x00000009 0x000000c8
> +				0x00000003 0x00000009 0x00000004 0x0000000c
> +				0x00000002 0x00000000 0x00000000 0x00000002
> +				0x00000000 0x00000000 0x00000083 0x004f0006
> +				0x00000010 0x00000008 0x00000000 0x00000000
> +				0x00000000 0x00000000 0x00000000 0x00000000>;
> +		};
> +		emc-table@333000 {
> +			reg = <333000>;
> +			compatible = "nvidia,tegra20-emc-table";
> +			clock-frequency = <333000>;
> +			nvidia,emc-registers =   <0x00000014 0x00000041
> +				0x0000000f 0x00000005 0x00000004 0x00000005
> +				0x00000003 0x0000000a 0x00000005 0x00000005
> +				0x00000004 0x00000001 0x00000003 0x00000004
> +				0x00000003 0x00000009 0x0000000c 0x000009ff
> +				0x00000000 0x00000003 0x00000003 0x00000005
> +				0x00000005 0x00000001 0x0000000e 0x000000c8
> +				0x00000003 0x00000011 0x00000006 0x0000000c
> +				0x00000002 0x00000000 0x00000000 0x00000002
> +				0x00000000 0x00000000 0x00000083 0x00380006
> +				0x00000010 0x00000008 0x00000000 0x00000000
> +				0x00000000 0x00000000 0x00000000 0x00000000>;
> +		};
> +	};
> +
> +	ac97: ac97 {
> +		status = "okay";
> +		nvidia,codec-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> +		nvidia,codec-sync-gpio = <&gpio 120 0>; /* gpio PP0 */
> +	};
> +
> +	usb@c5004000 {
> +		status = "okay";
> +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> +	};
> +
> +	sdhci@c8000600 {
> +		cd-gpios = <&gpio 23 0>; /* gpio PC7 */
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
> +			         "nvidia,tegra-audio-wm9712";
> +		nvidia,model = "Colibri T20 AC97 Audio";
> +
> +		nvidia,audio-routing =
> +			"Headphone", "HPOUTL",
> +			"Headphone", "HPOUTR",
> +			"LineIn", "LINEINL",
> +			"LineIn", "LINEINR",
> +			"Mic", "MIC1";
> +
> +		nvidia,ac97-controller = <&ac97>;
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd_5v0_reg: regulator@100 {
> +			compatible = "regulator-fixed";
> +			reg = <100>;
> +			regulator-name = "vdd_5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +
> +		regulator@101 {
> +			compatible = "regulator-fixed";
> +			reg = <101>;
> +			regulator-name = "internal_usb";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			gpio = <&gpio 217 0>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
> deleted file mode 100644
> index 61d027f..0000000
> --- a/arch/arm/boot/dts/tegra20-harmony.dts
> +++ /dev/null
> @@ -1,660 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "NVIDIA Tegra20 Harmony evaluation board";
> -	compatible = "nvidia,harmony", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x40000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			ata {
> -				nvidia,pins = "ata";
> -				nvidia,function = "ide";
> -			};
> -			atb {
> -				nvidia,pins = "atb", "gma", "gme";
> -				nvidia,function = "sdio4";
> -			};
> -			atc {
> -				nvidia,pins = "atc";
> -				nvidia,function = "nand";
> -			};
> -			atd {
> -				nvidia,pins = "atd", "ate", "gmb", "gmd", "gpu",
> -					"spia", "spib", "spic";
> -				nvidia,function = "gmi";
> -			};
> -			cdev1 {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -			};
> -			cdev2 {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "pllp_out4";
> -			};
> -			crtp {
> -				nvidia,pins = "crtp";
> -				nvidia,function = "crt";
> -			};
> -			csus {
> -				nvidia,pins = "csus";
> -				nvidia,function = "vi_sensor_clk";
> -			};
> -			dap1 {
> -				nvidia,pins = "dap1";
> -				nvidia,function = "dap1";
> -			};
> -			dap2 {
> -				nvidia,pins = "dap2";
> -				nvidia,function = "dap2";
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -			};
> -			dap4 {
> -				nvidia,pins = "dap4";
> -				nvidia,function = "dap4";
> -			};
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -			};
> -			dta {
> -				nvidia,pins = "dta", "dtd";
> -				nvidia,function = "sdio2";
> -			};
> -			dtb {
> -				nvidia,pins = "dtb", "dtc", "dte";
> -				nvidia,function = "rsvd1";
> -			};
> -			dtf {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -			};
> -			gmc {
> -				nvidia,pins = "gmc";
> -				nvidia,function = "uartd";
> -			};
> -			gpu7 {
> -				nvidia,pins = "gpu7";
> -				nvidia,function = "rtck";
> -			};
> -			gpv {
> -				nvidia,pins = "gpv", "slxa", "slxk";
> -				nvidia,function = "pcie";
> -			};
> -			hdint {
> -				nvidia,pins = "hdint", "pta";
> -				nvidia,function = "hdmi";
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -			};
> -			irrx {
> -				nvidia,pins = "irrx", "irtx";
> -				nvidia,function = "uarta";
> -			};
> -			kbca {
> -				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> -					"kbce", "kbcf";
> -				nvidia,function = "kbc";
> -			};
> -			lcsn {
> -				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> -					"ld3", "ld4", "ld5", "ld6", "ld7",
> -					"ld8", "ld9", "ld10", "ld11", "ld12",
> -					"ld13", "ld14", "ld15", "ld16", "ld17",
> -					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> -					"lhs", "lm0", "lm1", "lpp", "lpw0",
> -					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> -					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> -					"lvs";
> -				nvidia,function = "displaya";
> -			};
> -			owc {
> -				nvidia,pins = "owc", "spdi", "spdo", "uac";
> -				nvidia,function = "rsvd2";
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -			};
> -			rm {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -			};
> -			sdb {
> -				nvidia,pins = "sdb", "sdc", "sdd";
> -				nvidia,function = "pwm";
> -			};
> -			sdio1 {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "sdio1";
> -			};
> -			slxc {
> -				nvidia,pins = "slxc", "slxd";
> -				nvidia,function = "spdif";
> -			};
> -			spid {
> -				nvidia,pins = "spid", "spie", "spif";
> -				nvidia,function = "spi1";
> -			};
> -			spig {
> -				nvidia,pins = "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -			};
> -			uaa {
> -				nvidia,pins = "uaa", "uab", "uda";
> -				nvidia,function = "ulpi";
> -			};
> -			uad {
> -				nvidia,pins = "uad";
> -				nvidia,function = "irda";
> -			};
> -			uca {
> -				nvidia,pins = "uca", "ucb";
> -				nvidia,function = "uartc";
> -			};
> -			conf_ata {
> -				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
> -					"cdev1", "cdev2", "dap1", "dtb", "gma",
> -					"gmb", "gmc", "gmd", "gme", "gpu7",
> -					"gpv", "i2cp", "pta", "rm", "slxa",
> -					"slxk", "spia", "spib", "uac";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ck32 {
> -				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> -					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> -				nvidia,pull = <0>;
> -			};
> -			conf_csus {
> -				nvidia,pins = "csus", "spid", "spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_crtp {
> -				nvidia,pins = "crtp", "dap2", "dap3", "dap4",
> -					"dtc", "dte", "dtf", "gpu", "sdio1",
> -					"slxc", "slxd", "spdi", "spdo", "spig",
> -					"uda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ddc {
> -				nvidia,pins = "ddc", "dta", "dtd", "kbca",
> -					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
> -					"sdc";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_hdint {
> -				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> -					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> -					"lvp0", "owc", "sdb";
> -				nvidia,tristate = <1>;
> -			};
> -			conf_irrx {
> -				nvidia,pins = "irrx", "irtx", "sdd", "spic",
> -					"spie", "spih", "uaa", "uab", "uad",
> -					"uca", "ucb";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_lc {
> -				nvidia,pins = "lc", "ls";
> -				nvidia,pull = <2>;
> -			};
> -			conf_ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldi", "lhp0",
> -					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> -					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> -					"lvs", "pmc";
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ld17_0 {
> -				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> -					"ld23_22";
> -				nvidia,pull = <1>;
> -			};
> -		};
> -	};
> -
> -	i2s@70002800 {
> -		status = "okay";
> -	};
> -
> -	serial@70006300 {
> -		status = "okay";
> -	};
> -
> -	i2c@7000c000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		wm8903: wm8903@1a {
> -			compatible = "wlf,wm8903";
> -			reg = <0x1a>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <187 0x04>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			micdet-cfg = <0>;
> -			micdet-delay = <100>;
> -			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> -		};
> -	};
> -
> -	hdmi_ddc: i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c500 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		pmic: tps6586x@34 {
> -			compatible = "ti,tps6586x";
> -			reg = <0x34>;
> -			interrupts = <0 86 0x4>;
> -
> -			ti,system-power-controller;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			sys-supply = <&vdd_5v0_reg>;
> -			vin-sm0-supply = <&sys_reg>;
> -			vin-sm1-supply = <&sys_reg>;
> -			vin-sm2-supply = <&sys_reg>;
> -			vinldo01-supply = <&sm2_reg>;
> -			vinldo23-supply = <&sm2_reg>;
> -			vinldo4-supply = <&sm2_reg>;
> -			vinldo678-supply = <&sm2_reg>;
> -			vinldo9-supply = <&sm2_reg>;
> -
> -			regulators {
> -				sys_reg: sys {
> -					regulator-name = "vdd_sys";
> -					regulator-always-on;
> -				};
> -
> -				sm0 {
> -					regulator-name = "vdd_sm0,vdd_core";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				sm1 {
> -					regulator-name = "vdd_sm1,vdd_cpu";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				sm2_reg: sm2 {
> -					regulator-name = "vdd_sm2,vin_ldo*";
> -					regulator-min-microvolt = <3700000>;
> -					regulator-max-microvolt = <3700000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo0 {
> -					regulator-name = "vdd_ldo0,vddio_pex_clk";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				ldo1 {
> -					regulator-name = "vdd_ldo1,avdd_pll*";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo2 {
> -					regulator-name = "vdd_ldo2,vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo3 {
> -					regulator-name = "vdd_ldo3,avdd_usb*";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo4 {
> -					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5 {
> -					regulator-name = "vdd_ldo5,vcore_mmc";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo6 {
> -					regulator-name = "vdd_ldo6,avdd_vdac";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				hdmi_vdd_reg: ldo7 {
> -					regulator-name = "vdd_ldo7,avdd_hdmi";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				hdmi_pll_reg: ldo8 {
> -					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				ldo9 {
> -					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo_rtc {
> -					regulator-name = "vdd_rtc_out,vdd_cell";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -
> -		temperature-sensor@4c {
> -			compatible = "adi,adt7461";
> -			reg = <0x4c>;
> -		};
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -
> -	usb@c5000000 {
> -		status = "okay";
> -	};
> -
> -	usb@c5004000 {
> -		status = "okay";
> -		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -	};
> -
> -	usb-phy@c5004400 {
> -		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> -	};
> -
> -	sdhci@c8000200 {
> -		status = "okay";
> -		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> -		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
> -		power-gpios = <&gpio 155 0>; /* gpio PT3 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@c8000600 {
> -		status = "okay";
> -		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
> -		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
> -		power-gpios = <&gpio 70 0>; /* gpio PI6 */
> -		bus-width = <8>;
> -	};
> -
> -	kbc {
> -		status = "okay";
> -		nvidia,debounce-delay-ms = <2>;
> -		nvidia,repeat-delay-ms = <160>;
> -		nvidia,kbc-row-pins = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15>;
> -		nvidia,kbc-col-pins = <16 17 18 19 20 21 22 23>;
> -		linux,keymap = <0x00020011	/* KEY_W */
> -				0x0003001F	/* KEY_S */
> -				0x0004001E	/* KEY_A */
> -				0x0005002C	/* KEY_Z */
> -				0x000701D0	/* KEY_FN */
> -				0x0107008B	/* KEY_MENU */
> -				0x02060038	/* KEY_LEFTALT */
> -				0x02070064	/* KEY_RIGHTALT */
> -				0x03000006	/* KEY_5 */
> -				0x03010005	/* KEY_4 */
> -				0x03020013	/* KEY_R */
> -				0x03030012	/* KEY_E */
> -				0x03040021	/* KEY_F */
> -				0x03050020	/* KEY_D */
> -				0x0306002D	/* KEY_X */
> -				0x04000008	/* KEY_7 */
> -				0x04010007	/* KEY_6 */
> -				0x04020014	/* KEY_T */
> -				0x04030023	/* KEY_H */
> -				0x04040022	/* KEY_G */
> -				0x0405002F	/* KEY_V */
> -				0x0406002E	/* KEY_C */
> -				0x04070039	/* KEY_SPACE */
> -				0x0500000A	/* KEY_9 */
> -				0x05010009	/* KEY_8 */
> -				0x05020016	/* KEY_U */
> -				0x05030015	/* KEY_Y */
> -				0x05040024	/* KEY_J */
> -				0x05050031	/* KEY_N */
> -				0x05060030	/* KEY_B */
> -				0x0507002B	/* KEY_BACKSLASH */
> -				0x0600000C	/* KEY_MINUS */
> -				0x0601000B	/* KEY_0 */
> -				0x06020018	/* KEY_O */
> -				0x06030017	/* KEY_I */
> -				0x06040026	/* KEY_L */
> -				0x06050025	/* KEY_K */
> -				0x06060033	/* KEY_COMMA */
> -				0x06070032	/* KEY_M */
> -				0x0701000D	/* KEY_EQUAL */
> -				0x0702001B	/* KEY_RIGHTBRACE */
> -				0x0703001C	/* KEY_ENTER */
> -				0x0707008B	/* KEY_MENU */
> -				0x0804002A	/* KEY_LEFTSHIFT */
> -				0x08050036	/* KEY_RIGHTSHIFT */
> -				0x0905001D	/* KEY_LEFTCTRL */
> -				0x09070061	/* KEY_RIGHTCTRL */
> -				0x0B00001A	/* KEY_LEFTBRACE */
> -				0x0B010019	/* KEY_P */
> -				0x0B020028	/* KEY_APOSTROPHE */
> -				0x0B030027	/* KEY_SEMICOLON */
> -				0x0B040035	/* KEY_SLASH */
> -				0x0B050034	/* KEY_DOT */
> -				0x0C000044	/* KEY_F10 */
> -				0x0C010043	/* KEY_F9 */
> -				0x0C02000E	/* KEY_BACKSPACE */
> -				0x0C030004	/* KEY_3 */
> -				0x0C040003	/* KEY_2 */
> -				0x0C050067	/* KEY_UP */
> -				0x0C0600D2	/* KEY_PRINT */
> -				0x0C070077	/* KEY_PAUSE */
> -				0x0D00006E	/* KEY_INSERT */
> -				0x0D01006F	/* KEY_DELETE */
> -				0x0D030068	/* KEY_PAGEUP */
> -				0x0D04006D	/* KEY_PAGEDOWN */
> -				0x0D05006A	/* KEY_RIGHT */
> -				0x0D06006C	/* KEY_DOWN */
> -				0x0D070069	/* KEY_LEFT */
> -				0x0E000057	/* KEY_F11 */
> -				0x0E010058	/* KEY_F12 */
> -				0x0E020042	/* KEY_F8 */
> -				0x0E030010	/* KEY_Q */
> -				0x0E04003E	/* KEY_F4 */
> -				0x0E05003D	/* KEY_F3 */
> -				0x0E060002	/* KEY_1 */
> -				0x0E070041	/* KEY_F7 */
> -				0x0F000001	/* KEY_ESC */
> -				0x0F010029	/* KEY_GRAVE */
> -				0x0F02003F	/* KEY_F5 */
> -				0x0F03000F	/* KEY_TAB */
> -				0x0F04003B	/* KEY_F1 */
> -				0x0F05003C	/* KEY_F2 */
> -				0x0F06003A	/* KEY_CAPSLOCK */
> -				0x0F070040	/* KEY_F6 */
> -				0x14000047	/* KEY_KP7 */
> -				0x15000049	/* KEY_KP9 */
> -				0x15010048	/* KEY_KP8 */
> -				0x1502004B	/* KEY_KP4 */
> -				0x1504004F	/* KEY_KP1 */
> -				0x1601004E	/* KEY_KPSLASH */
> -				0x1602004D	/* KEY_KP6 */
> -				0x1603004C	/* KEY_KP5 */
> -				0x16040051	/* KEY_KP3 */
> -				0x16050050	/* KEY_KP2 */
> -				0x16070052	/* KEY_KP0 */
> -				0x1B010037	/* KEY_KPASTERISK */
> -				0x1B03004A	/* KEY_KPMINUS */
> -				0x1B04004E	/* KEY_KPPLUS */
> -				0x1B050053	/* KEY_KPDOT */
> -				0x1C050073	/* KEY_VOLUMEUP */
> -				0x1D030066	/* KEY_HOME */
> -				0x1D04006B	/* KEY_END */
> -				0x1D0500E1	/* KEY_BRIGHTNESSUP */
> -				0x1D060072	/* KEY_VOLUMEDOWN */
> -				0x1D0700E0	/* KEY_BRIGHTNESSDOWN */
> -				0x1E000045	/* KEY_NUMLOCK */
> -				0x1E010046	/* KEY_SCROLLLOCK */
> -				0x1E020071	/* KEY_MUTE */
> -				0x1F0400D6>;	/* KEY_QUESTION */
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		vdd_5v0_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "vdd_5v0";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -
> -		regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "vdd_1v5";
> -			regulator-min-microvolt = <1500000>;
> -			regulator-max-microvolt = <1500000>;
> -			gpio = <&pmic 0 0>;
> -		};
> -
> -		regulator@2 {
> -			compatible = "regulator-fixed";
> -			reg = <2>;
> -			regulator-name = "vdd_1v2";
> -			regulator-min-microvolt = <1200000>;
> -			regulator-max-microvolt = <1200000>;
> -			gpio = <&pmic 1 0>;
> -			enable-active-high;
> -		};
> -
> -		regulator@3 {
> -			compatible = "regulator-fixed";
> -			reg = <3>;
> -			regulator-name = "vdd_1v05";
> -			regulator-min-microvolt = <1050000>;
> -			regulator-max-microvolt = <1050000>;
> -			gpio = <&pmic 2 0>;
> -			enable-active-high;
> -			/* Hack until board-harmony-pcie.c is removed */
> -			status = "disabled";
> -		};
> -
> -		regulator@4 {
> -			compatible = "regulator-fixed";
> -			reg = <4>;
> -			regulator-name = "vdd_pnl";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <2800000>;
> -			gpio = <&gpio 22 0>; /* gpio PC6 */
> -			enable-active-high;
> -		};
> -
> -		regulator@5 {
> -			compatible = "regulator-fixed";
> -			reg = <5>;
> -			regulator-name = "vdd_bl";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <2800000>;
> -			gpio = <&gpio 176 0>; /* gpio PW0 */
> -			enable-active-high;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-wm8903-harmony",
> -			     "nvidia,tegra-audio-wm8903";
> -		nvidia,model = "NVIDIA Tegra Harmony";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "HPOUTR",
> -			"Headphone Jack", "HPOUTL",
> -			"Int Spk", "ROP",
> -			"Int Spk", "RON",
> -			"Int Spk", "LOP",
> -			"Int Spk", "LON",
> -			"Mic Jack", "MICBIAS",
> -			"IN1L", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&wm8903>;
> -
> -		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> -		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> -		nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
> -		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-harmony.dtsp b/arch/arm/boot/dts/tegra20-harmony.dtsp
> new file mode 100644
> index 0000000..3fe66c1
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-harmony.dtsp
> @@ -0,0 +1,660 @@
> +/dts-v1/;
> +
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "NVIDIA Tegra20 Harmony evaluation board";
> +	compatible = "nvidia,harmony", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x40000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			ata {
> +				nvidia,pins = "ata";
> +				nvidia,function = "ide";
> +			};
> +			atb {
> +				nvidia,pins = "atb", "gma", "gme";
> +				nvidia,function = "sdio4";
> +			};
> +			atc {
> +				nvidia,pins = "atc";
> +				nvidia,function = "nand";
> +			};
> +			atd {
> +				nvidia,pins = "atd", "ate", "gmb", "gmd", "gpu",
> +					"spia", "spib", "spic";
> +				nvidia,function = "gmi";
> +			};
> +			cdev1 {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "pllp_out4";
> +			};
> +			crtp {
> +				nvidia,pins = "crtp";
> +				nvidia,function = "crt";
> +			};
> +			csus {
> +				nvidia,pins = "csus";
> +				nvidia,function = "vi_sensor_clk";
> +			};
> +			dap1 {
> +				nvidia,pins = "dap1";
> +				nvidia,function = "dap1";
> +			};
> +			dap2 {
> +				nvidia,pins = "dap2";
> +				nvidia,function = "dap2";
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +			};
> +			dap4 {
> +				nvidia,pins = "dap4";
> +				nvidia,function = "dap4";
> +			};
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			dta {
> +				nvidia,pins = "dta", "dtd";
> +				nvidia,function = "sdio2";
> +			};
> +			dtb {
> +				nvidia,pins = "dtb", "dtc", "dte";
> +				nvidia,function = "rsvd1";
> +			};
> +			dtf {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +			};
> +			gmc {
> +				nvidia,pins = "gmc";
> +				nvidia,function = "uartd";
> +			};
> +			gpu7 {
> +				nvidia,pins = "gpu7";
> +				nvidia,function = "rtck";
> +			};
> +			gpv {
> +				nvidia,pins = "gpv", "slxa", "slxk";
> +				nvidia,function = "pcie";
> +			};
> +			hdint {
> +				nvidia,pins = "hdint", "pta";
> +				nvidia,function = "hdmi";
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +			};
> +			irrx {
> +				nvidia,pins = "irrx", "irtx";
> +				nvidia,function = "uarta";
> +			};
> +			kbca {
> +				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> +					"kbce", "kbcf";
> +				nvidia,function = "kbc";
> +			};
> +			lcsn {
> +				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> +					"ld3", "ld4", "ld5", "ld6", "ld7",
> +					"ld8", "ld9", "ld10", "ld11", "ld12",
> +					"ld13", "ld14", "ld15", "ld16", "ld17",
> +					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> +					"lhs", "lm0", "lm1", "lpp", "lpw0",
> +					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> +					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> +					"lvs";
> +				nvidia,function = "displaya";
> +			};
> +			owc {
> +				nvidia,pins = "owc", "spdi", "spdo", "uac";
> +				nvidia,function = "rsvd2";
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +			};
> +			rm {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +			};
> +			sdb {
> +				nvidia,pins = "sdb", "sdc", "sdd";
> +				nvidia,function = "pwm";
> +			};
> +			sdio1 {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "sdio1";
> +			};
> +			slxc {
> +				nvidia,pins = "slxc", "slxd";
> +				nvidia,function = "spdif";
> +			};
> +			spid {
> +				nvidia,pins = "spid", "spie", "spif";
> +				nvidia,function = "spi1";
> +			};
> +			spig {
> +				nvidia,pins = "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +			};
> +			uaa {
> +				nvidia,pins = "uaa", "uab", "uda";
> +				nvidia,function = "ulpi";
> +			};
> +			uad {
> +				nvidia,pins = "uad";
> +				nvidia,function = "irda";
> +			};
> +			uca {
> +				nvidia,pins = "uca", "ucb";
> +				nvidia,function = "uartc";
> +			};
> +			conf_ata {
> +				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
> +					"cdev1", "cdev2", "dap1", "dtb", "gma",
> +					"gmb", "gmc", "gmd", "gme", "gpu7",
> +					"gpv", "i2cp", "pta", "rm", "slxa",
> +					"slxk", "spia", "spib", "uac";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ck32 {
> +				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> +					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> +				nvidia,pull = <0>;
> +			};
> +			conf_csus {
> +				nvidia,pins = "csus", "spid", "spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_crtp {
> +				nvidia,pins = "crtp", "dap2", "dap3", "dap4",
> +					"dtc", "dte", "dtf", "gpu", "sdio1",
> +					"slxc", "slxd", "spdi", "spdo", "spig",
> +					"uda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ddc {
> +				nvidia,pins = "ddc", "dta", "dtd", "kbca",
> +					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
> +					"sdc";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_hdint {
> +				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> +					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> +					"lvp0", "owc", "sdb";
> +				nvidia,tristate = <1>;
> +			};
> +			conf_irrx {
> +				nvidia,pins = "irrx", "irtx", "sdd", "spic",
> +					"spie", "spih", "uaa", "uab", "uad",
> +					"uca", "ucb";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_lc {
> +				nvidia,pins = "lc", "ls";
> +				nvidia,pull = <2>;
> +			};
> +			conf_ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldi", "lhp0",
> +					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> +					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> +					"lvs", "pmc";
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ld17_0 {
> +				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> +					"ld23_22";
> +				nvidia,pull = <1>;
> +			};
> +		};
> +	};
> +
> +	i2s@70002800 {
> +		status = "okay";
> +	};
> +
> +	serial@70006300 {
> +		status = "okay";
> +	};
> +
> +	i2c@7000c000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		wm8903: wm8903@1a {
> +			compatible = "wlf,wm8903";
> +			reg = <0x1a>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <187 0x04>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;
> +			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> +		};
> +	};
> +
> +	hdmi_ddc: i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c500 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		pmic: tps6586x@34 {
> +			compatible = "ti,tps6586x";
> +			reg = <0x34>;
> +			interrupts = <0 86 0x4>;
> +
> +			ti,system-power-controller;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			sys-supply = <&vdd_5v0_reg>;
> +			vin-sm0-supply = <&sys_reg>;
> +			vin-sm1-supply = <&sys_reg>;
> +			vin-sm2-supply = <&sys_reg>;
> +			vinldo01-supply = <&sm2_reg>;
> +			vinldo23-supply = <&sm2_reg>;
> +			vinldo4-supply = <&sm2_reg>;
> +			vinldo678-supply = <&sm2_reg>;
> +			vinldo9-supply = <&sm2_reg>;
> +
> +			regulators {
> +				sys_reg: sys {
> +					regulator-name = "vdd_sys";
> +					regulator-always-on;
> +				};
> +
> +				sm0 {
> +					regulator-name = "vdd_sm0,vdd_core";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				sm1 {
> +					regulator-name = "vdd_sm1,vdd_cpu";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +
> +				sm2_reg: sm2 {
> +					regulator-name = "vdd_sm2,vin_ldo*";
> +					regulator-min-microvolt = <3700000>;
> +					regulator-max-microvolt = <3700000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo0 {
> +					regulator-name = "vdd_ldo0,vddio_pex_clk";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				ldo1 {
> +					regulator-name = "vdd_ldo1,avdd_pll*";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo2 {
> +					regulator-name = "vdd_ldo2,vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo3 {
> +					regulator-name = "vdd_ldo3,avdd_usb*";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo4 {
> +					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5 {
> +					regulator-name = "vdd_ldo5,vcore_mmc";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo6 {
> +					regulator-name = "vdd_ldo6,avdd_vdac";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				hdmi_vdd_reg: ldo7 {
> +					regulator-name = "vdd_ldo7,avdd_hdmi";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				hdmi_pll_reg: ldo8 {
> +					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				ldo9 {
> +					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo_rtc {
> +					regulator-name = "vdd_rtc_out,vdd_cell";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +
> +		temperature-sensor@4c {
> +			compatible = "adi,adt7461";
> +			reg = <0x4c>;
> +		};
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +
> +	usb@c5000000 {
> +		status = "okay";
> +	};
> +
> +	usb@c5004000 {
> +		status = "okay";
> +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +	};
> +
> +	usb-phy@c5004400 {
> +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> +	};
> +
> +	sdhci@c8000200 {
> +		status = "okay";
> +		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> +		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
> +		power-gpios = <&gpio 155 0>; /* gpio PT3 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@c8000600 {
> +		status = "okay";
> +		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
> +		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
> +		power-gpios = <&gpio 70 0>; /* gpio PI6 */
> +		bus-width = <8>;
> +	};
> +
> +	kbc {
> +		status = "okay";
> +		nvidia,debounce-delay-ms = <2>;
> +		nvidia,repeat-delay-ms = <160>;
> +		nvidia,kbc-row-pins = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15>;
> +		nvidia,kbc-col-pins = <16 17 18 19 20 21 22 23>;
> +		linux,keymap = <0x00020011	/* KEY_W */
> +				0x0003001F	/* KEY_S */
> +				0x0004001E	/* KEY_A */
> +				0x0005002C	/* KEY_Z */
> +				0x000701D0	/* KEY_FN */
> +				0x0107008B	/* KEY_MENU */
> +				0x02060038	/* KEY_LEFTALT */
> +				0x02070064	/* KEY_RIGHTALT */
> +				0x03000006	/* KEY_5 */
> +				0x03010005	/* KEY_4 */
> +				0x03020013	/* KEY_R */
> +				0x03030012	/* KEY_E */
> +				0x03040021	/* KEY_F */
> +				0x03050020	/* KEY_D */
> +				0x0306002D	/* KEY_X */
> +				0x04000008	/* KEY_7 */
> +				0x04010007	/* KEY_6 */
> +				0x04020014	/* KEY_T */
> +				0x04030023	/* KEY_H */
> +				0x04040022	/* KEY_G */
> +				0x0405002F	/* KEY_V */
> +				0x0406002E	/* KEY_C */
> +				0x04070039	/* KEY_SPACE */
> +				0x0500000A	/* KEY_9 */
> +				0x05010009	/* KEY_8 */
> +				0x05020016	/* KEY_U */
> +				0x05030015	/* KEY_Y */
> +				0x05040024	/* KEY_J */
> +				0x05050031	/* KEY_N */
> +				0x05060030	/* KEY_B */
> +				0x0507002B	/* KEY_BACKSLASH */
> +				0x0600000C	/* KEY_MINUS */
> +				0x0601000B	/* KEY_0 */
> +				0x06020018	/* KEY_O */
> +				0x06030017	/* KEY_I */
> +				0x06040026	/* KEY_L */
> +				0x06050025	/* KEY_K */
> +				0x06060033	/* KEY_COMMA */
> +				0x06070032	/* KEY_M */
> +				0x0701000D	/* KEY_EQUAL */
> +				0x0702001B	/* KEY_RIGHTBRACE */
> +				0x0703001C	/* KEY_ENTER */
> +				0x0707008B	/* KEY_MENU */
> +				0x0804002A	/* KEY_LEFTSHIFT */
> +				0x08050036	/* KEY_RIGHTSHIFT */
> +				0x0905001D	/* KEY_LEFTCTRL */
> +				0x09070061	/* KEY_RIGHTCTRL */
> +				0x0B00001A	/* KEY_LEFTBRACE */
> +				0x0B010019	/* KEY_P */
> +				0x0B020028	/* KEY_APOSTROPHE */
> +				0x0B030027	/* KEY_SEMICOLON */
> +				0x0B040035	/* KEY_SLASH */
> +				0x0B050034	/* KEY_DOT */
> +				0x0C000044	/* KEY_F10 */
> +				0x0C010043	/* KEY_F9 */
> +				0x0C02000E	/* KEY_BACKSPACE */
> +				0x0C030004	/* KEY_3 */
> +				0x0C040003	/* KEY_2 */
> +				0x0C050067	/* KEY_UP */
> +				0x0C0600D2	/* KEY_PRINT */
> +				0x0C070077	/* KEY_PAUSE */
> +				0x0D00006E	/* KEY_INSERT */
> +				0x0D01006F	/* KEY_DELETE */
> +				0x0D030068	/* KEY_PAGEUP */
> +				0x0D04006D	/* KEY_PAGEDOWN */
> +				0x0D05006A	/* KEY_RIGHT */
> +				0x0D06006C	/* KEY_DOWN */
> +				0x0D070069	/* KEY_LEFT */
> +				0x0E000057	/* KEY_F11 */
> +				0x0E010058	/* KEY_F12 */
> +				0x0E020042	/* KEY_F8 */
> +				0x0E030010	/* KEY_Q */
> +				0x0E04003E	/* KEY_F4 */
> +				0x0E05003D	/* KEY_F3 */
> +				0x0E060002	/* KEY_1 */
> +				0x0E070041	/* KEY_F7 */
> +				0x0F000001	/* KEY_ESC */
> +				0x0F010029	/* KEY_GRAVE */
> +				0x0F02003F	/* KEY_F5 */
> +				0x0F03000F	/* KEY_TAB */
> +				0x0F04003B	/* KEY_F1 */
> +				0x0F05003C	/* KEY_F2 */
> +				0x0F06003A	/* KEY_CAPSLOCK */
> +				0x0F070040	/* KEY_F6 */
> +				0x14000047	/* KEY_KP7 */
> +				0x15000049	/* KEY_KP9 */
> +				0x15010048	/* KEY_KP8 */
> +				0x1502004B	/* KEY_KP4 */
> +				0x1504004F	/* KEY_KP1 */
> +				0x1601004E	/* KEY_KPSLASH */
> +				0x1602004D	/* KEY_KP6 */
> +				0x1603004C	/* KEY_KP5 */
> +				0x16040051	/* KEY_KP3 */
> +				0x16050050	/* KEY_KP2 */
> +				0x16070052	/* KEY_KP0 */
> +				0x1B010037	/* KEY_KPASTERISK */
> +				0x1B03004A	/* KEY_KPMINUS */
> +				0x1B04004E	/* KEY_KPPLUS */
> +				0x1B050053	/* KEY_KPDOT */
> +				0x1C050073	/* KEY_VOLUMEUP */
> +				0x1D030066	/* KEY_HOME */
> +				0x1D04006B	/* KEY_END */
> +				0x1D0500E1	/* KEY_BRIGHTNESSUP */
> +				0x1D060072	/* KEY_VOLUMEDOWN */
> +				0x1D0700E0	/* KEY_BRIGHTNESSDOWN */
> +				0x1E000045	/* KEY_NUMLOCK */
> +				0x1E010046	/* KEY_SCROLLLOCK */
> +				0x1E020071	/* KEY_MUTE */
> +				0x1F0400D6>;	/* KEY_QUESTION */
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd_5v0_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "vdd_5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +
> +		regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "vdd_1v5";
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <1500000>;
> +			gpio = <&pmic 0 0>;
> +		};
> +
> +		regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg = <2>;
> +			regulator-name = "vdd_1v2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			gpio = <&pmic 1 0>;
> +			enable-active-high;
> +		};
> +
> +		regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <3>;
> +			regulator-name = "vdd_1v05";
> +			regulator-min-microvolt = <1050000>;
> +			regulator-max-microvolt = <1050000>;
> +			gpio = <&pmic 2 0>;
> +			enable-active-high;
> +			/* Hack until board-harmony-pcie.c is removed */
> +			status = "disabled";
> +		};
> +
> +		regulator@4 {
> +			compatible = "regulator-fixed";
> +			reg = <4>;
> +			regulator-name = "vdd_pnl";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			gpio = <&gpio 22 0>; /* gpio PC6 */
> +			enable-active-high;
> +		};
> +
> +		regulator@5 {
> +			compatible = "regulator-fixed";
> +			reg = <5>;
> +			regulator-name = "vdd_bl";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			gpio = <&gpio 176 0>; /* gpio PW0 */
> +			enable-active-high;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-wm8903-harmony",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "NVIDIA Tegra Harmony";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1L", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +		nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
> +		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-iris-512.dts b/arch/arm/boot/dts/tegra20-iris-512.dts
> deleted file mode 100644
> index 52f1103..0000000
> --- a/arch/arm/boot/dts/tegra20-iris-512.dts
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20-colibri-512.dtsi"
> -
> -/ {
> -	model = "Toradex Colibri T20 512MB on Iris";
> -	compatible = "toradex,iris", "toradex,colibri_t20-512", "nvidia,tegra20";
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -		};
> -	};
> -
> -	pinmux {
> -		state_default: pinmux {
> -			hdint {
> -				nvidia,tristate = <0>;
> -			};
> -
> -			i2cddc {
> -				nvidia,tristate = <0>;
> -			};
> -
> -			sdio4 {
> -				nvidia,tristate = <0>;
> -			};
> -
> -			uarta {
> -				nvidia,tristate = <0>;
> -			};
> -
> -			uartd {
> -				nvidia,tristate = <0>;
> -			};
> -		};
> -	};
> -
> -	usb@c5000000 {
> -		status = "okay";
> -		dr_mode = "otg";
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -	};
> -
> -	serial@70006000 {
> -		status = "okay";
> -	};
> -
> -	serial@70006300 {
> -		status = "okay";
> -	};
> -
> -	i2c_ddc: i2c@7000c400 {
> -		status = "okay";
> -	};
> -
> -	sdhci@c8000600 {
> -		status = "okay";
> -		bus-width = <4>;
> -		vmmc-supply = <&vcc_sd_reg>;
> -		vqmmc-supply = <&vcc_sd_reg>;
> -	};
> -
> -	regulators {
> -		regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "usb_host_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> -			gpio = <&gpio 178 0>;
> -		};
> -
> -		vcc_sd_reg: regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "vcc_sd";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> -		};
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-iris-512.dtsp b/arch/arm/boot/dts/tegra20-iris-512.dtsp
> new file mode 100644
> index 0000000..a0ba0b0
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-iris-512.dtsp
> @@ -0,0 +1,89 @@
> +/dts-v1/;
> +
> +#include "tegra20-colibri-512.dtsip"
> +
> +/ {
> +	model = "Toradex Colibri T20 512MB on Iris";
> +	compatible = "toradex,iris", "toradex,colibri_t20-512", "nvidia,tegra20";
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +		};
> +	};
> +
> +	pinmux {
> +		state_default: pinmux {
> +			hdint {
> +				nvidia,tristate = <0>;
> +			};
> +
> +			i2cddc {
> +				nvidia,tristate = <0>;
> +			};
> +
> +			sdio4 {
> +				nvidia,tristate = <0>;
> +			};
> +
> +			uarta {
> +				nvidia,tristate = <0>;
> +			};
> +
> +			uartd {
> +				nvidia,tristate = <0>;
> +			};
> +		};
> +	};
> +
> +	usb@c5000000 {
> +		status = "okay";
> +		dr_mode = "otg";
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +	};
> +
> +	serial@70006000 {
> +		status = "okay";
> +	};
> +
> +	serial@70006300 {
> +		status = "okay";
> +	};
> +
> +	i2c_ddc: i2c@7000c400 {
> +		status = "okay";
> +	};
> +
> +	sdhci@c8000600 {
> +		status = "okay";
> +		bus-width = <4>;
> +		vmmc-supply = <&vcc_sd_reg>;
> +		vqmmc-supply = <&vcc_sd_reg>;
> +	};
> +
> +	regulators {
> +		regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "usb_host_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			gpio = <&gpio 178 0>;
> +		};
> +
> +		vcc_sd_reg: regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "vcc_sd";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> deleted file mode 100644
> index a2d6d65..0000000
> --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20-tamonten.dtsi"
> -
> -/ {
> -	model = "Avionic Design Medcom-Wide board";
> -	compatible = "ad,medcom-wide", "ad,tamonten", "nvidia,tegra20";
> -
> -	i2c@7000c000 {
> -		wm8903: wm8903@1a {
> -			compatible = "wlf,wm8903";
> -			reg = <0x1a>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <187 0x04>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			micdet-cfg = <0>;
> -			micdet-delay = <100>;
> -			gpio-cfg = <0xffffffff
> -				    0xffffffff
> -				    0
> -				    0xffffffff
> -				    0xffffffff>;
> -		};
> -	};
> -
> -	backlight {
> -		compatible = "pwm-backlight";
> -		pwms = <&pwm 0 5000000>;
> -
> -		brightness-levels = <0 4 8 16 32 64 128 255>;
> -		default-brightness-level = <6>;
> -	};
> -
> -	sound {
> -		compatible = "ad,tegra-audio-wm8903-medcom-wide",
> -			     "nvidia,tegra-audio-wm8903";
> -		nvidia,model = "Avionic Design Medcom-Wide";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "HPOUTR",
> -			"Headphone Jack", "HPOUTL",
> -			"Int Spk", "ROP",
> -			"Int Spk", "RON",
> -			"Int Spk", "LOP",
> -			"Int Spk", "LON",
> -			"Mic Jack", "MICBIAS",
> -			"IN1L", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&wm8903>;
> -
> -		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> -		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dtsp b/arch/arm/boot/dts/tegra20-medcom-wide.dtsp
> new file mode 100644
> index 0000000..6125604
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dtsp
> @@ -0,0 +1,58 @@
> +/dts-v1/;
> +
> +#include "tegra20-tamonten.dtsip"
> +
> +/ {
> +	model = "Avionic Design Medcom-Wide board";
> +	compatible = "ad,medcom-wide", "ad,tamonten", "nvidia,tegra20";
> +
> +	i2c@7000c000 {
> +		wm8903: wm8903@1a {
> +			compatible = "wlf,wm8903";
> +			reg = <0x1a>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <187 0x04>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;
> +			gpio-cfg = <0xffffffff
> +				    0xffffffff
> +				    0
> +				    0xffffffff
> +				    0xffffffff>;
> +		};
> +	};
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 5000000>;
> +
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +	};
> +
> +	sound {
> +		compatible = "ad,tegra-audio-wm8903-medcom-wide",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "Avionic Design Medcom-Wide";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1L", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
> deleted file mode 100644
> index 54d6fce..0000000
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ /dev/null
> @@ -1,505 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "Toshiba AC100 / Dynabook AZ";
> -	compatible = "compal,paz00", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x20000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			ata {
> -				nvidia,pins = "ata", "atc", "atd", "ate",
> -					"dap2", "gmb", "gmc", "gmd", "spia",
> -					"spib", "spic", "spid", "spie";
> -				nvidia,function = "gmi";
> -			};
> -			atb {
> -				nvidia,pins = "atb", "gma", "gme";
> -				nvidia,function = "sdio4";
> -			};
> -			cdev1 {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -			};
> -			cdev2 {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "pllp_out4";
> -			};
> -			crtp {
> -				nvidia,pins = "crtp";
> -				nvidia,function = "crt";
> -			};
> -			csus {
> -				nvidia,pins = "csus";
> -				nvidia,function = "pllc_out1";
> -			};
> -			dap1 {
> -				nvidia,pins = "dap1";
> -				nvidia,function = "dap1";
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -			};
> -			dap4 {
> -				nvidia,pins = "dap4";
> -				nvidia,function = "dap4";
> -			};
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -			};
> -			dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> -				nvidia,function = "rsvd1";
> -			};
> -			dtf {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -			};
> -			gpu {
> -				nvidia,pins = "gpu", "sdb", "sdd";
> -				nvidia,function = "pwm";
> -			};
> -			gpu7 {
> -				nvidia,pins = "gpu7";
> -				nvidia,function = "rtck";
> -			};
> -			gpv {
> -				nvidia,pins = "gpv", "slxa", "slxk";
> -				nvidia,function = "pcie";
> -			};
> -			hdint {
> -				nvidia,pins = "hdint", "pta";
> -				nvidia,function = "hdmi";
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -			};
> -			irrx {
> -				nvidia,pins = "irrx", "irtx";
> -				nvidia,function = "uarta";
> -			};
> -			kbca {
> -				nvidia,pins = "kbca", "kbcc", "kbce", "kbcf";
> -				nvidia,function = "kbc";
> -			};
> -			kbcb {
> -				nvidia,pins = "kbcb", "kbcd";
> -				nvidia,function = "sdio2";
> -			};
> -			lcsn {
> -				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> -					"ld3", "ld4", "ld5", "ld6", "ld7",
> -					"ld8", "ld9", "ld10", "ld11", "ld12",
> -					"ld13", "ld14", "ld15", "ld16", "ld17",
> -					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> -					"lhs", "lm0", "lm1", "lpp", "lpw0",
> -					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> -					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> -					"lvs";
> -				nvidia,function = "displaya";
> -			};
> -			owc {
> -				nvidia,pins = "owc";
> -				nvidia,function = "owr";
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -			};
> -			rm {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -			};
> -			sdc {
> -				nvidia,pins = "sdc";
> -				nvidia,function = "twc";
> -			};
> -			sdio1 {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "sdio1";
> -			};
> -			slxc {
> -				nvidia,pins = "slxc", "slxd";
> -				nvidia,function = "spi4";
> -			};
> -			spdi {
> -				nvidia,pins = "spdi", "spdo";
> -				nvidia,function = "rsvd2";
> -			};
> -			spif {
> -				nvidia,pins = "spif", "uac";
> -				nvidia,function = "rsvd4";
> -			};
> -			spig {
> -				nvidia,pins = "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -			};
> -			uaa {
> -				nvidia,pins = "uaa", "uab", "uda";
> -				nvidia,function = "ulpi";
> -			};
> -			uad {
> -				nvidia,pins = "uad";
> -				nvidia,function = "spdif";
> -			};
> -			uca {
> -				nvidia,pins = "uca", "ucb";
> -				nvidia,function = "uartc";
> -			};
> -			conf_ata {
> -				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
> -					"cdev1", "cdev2", "dap1", "dap2", "dtf",
> -					"gma", "gmb", "gmc", "gmd", "gme",
> -					"gpu", "gpu7", "gpv", "i2cp", "pta",
> -					"rm", "sdio1", "slxk", "spdo", "uac",
> -					"uda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ck32 {
> -				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> -					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> -				nvidia,pull = <0>;
> -			};
> -			conf_crtp {
> -				nvidia,pins = "crtp", "dap3", "dap4", "dtb",
> -					"dtc", "dte", "slxa", "slxc", "slxd",
> -					"spdi";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_csus {
> -				nvidia,pins = "csus", "spia", "spib", "spid",
> -					"spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ddc {
> -				nvidia,pins = "ddc", "irrx", "irtx", "kbca",
> -					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
> -					"spic", "spig", "uaa", "uab";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_dta {
> -				nvidia,pins = "dta", "dtd", "owc", "sdc", "sdd",
> -					"spie", "spih", "uad", "uca", "ucb";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_hdint {
> -				nvidia,pins = "hdint", "ld0", "ld1", "ld2",
> -					"ld3", "ld4", "ld5", "ld6", "ld7",
> -					"ld8", "ld9", "ld10", "ld11", "ld12",
> -					"ld13", "ld14", "ld15", "ld16", "ld17",
> -					"ldc", "ldi", "lhs", "lsc0", "lspi",
> -					"lvs", "pmc";
> -				nvidia,tristate = <0>;
> -			};
> -			conf_lc {
> -				nvidia,pins = "lc", "ls";
> -				nvidia,pull = <2>;
> -			};
> -			conf_lcsn {
> -				nvidia,pins = "lcsn", "lhp0", "lhp1", "lhp2",
> -					"lm0", "lm1", "lpp", "lpw0", "lpw1",
> -					"lpw2", "lsc1", "lsck", "lsda", "lsdi",
> -					"lvp0", "lvp1", "sdb";
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ld17_0 {
> -				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> -					"ld23_22";
> -				nvidia,pull = <1>;
> -			};
> -		};
> -	};
> -
> -	i2s@70002800 {
> -		status = "okay";
> -	};
> -
> -	serial@70006000 {
> -		status = "okay";
> -	};
> -
> -	serial@70006200 {
> -		status = "okay";
> -	};
> -
> -	i2c@7000c000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		alc5632: alc5632@1e {
> -			compatible = "realtek,alc5632";
> -			reg = <0x1e>;
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -		};
> -	};
> -
> -	hdmi_ddc: i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	nvec {
> -		compatible = "nvidia,nvec";
> -		reg = <0x7000c500 0x100>;
> -		interrupts = <0 92 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clock-frequency = <80000>;
> -		request-gpios = <&gpio 170 0>; /* gpio PV2 */
> -		slave-addr = <138>;
> -		clocks = <&tegra_car 67>, <&tegra_car 124>;
> -		clock-names = "div-clk", "fast-clk";
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		pmic: tps6586x@34 {
> -			compatible = "ti,tps6586x";
> -			reg = <0x34>;
> -			interrupts = <0 86 0x4>;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			sys-supply = <&p5valw_reg>;
> -			vin-sm0-supply = <&sys_reg>;
> -			vin-sm1-supply = <&sys_reg>;
> -			vin-sm2-supply = <&sys_reg>;
> -			vinldo01-supply = <&sm2_reg>;
> -			vinldo23-supply = <&sm2_reg>;
> -			vinldo4-supply = <&sm2_reg>;
> -			vinldo678-supply = <&sm2_reg>;
> -			vinldo9-supply = <&sm2_reg>;
> -
> -			regulators {
> -				sys_reg: sys {
> -					regulator-name = "vdd_sys";
> -					regulator-always-on;
> -				};
> -
> -				sm0 {
> -					regulator-name = "+1.2vs_sm0,vdd_core";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				sm1 {
> -					regulator-name = "+1.0vs_sm1,vdd_cpu";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				sm2_reg: sm2 {
> -					regulator-name = "+3.7vs_sm2,vin_ldo*";
> -					regulator-min-microvolt = <3700000>;
> -					regulator-max-microvolt = <3700000>;
> -					regulator-always-on;
> -				};
> -
> -				/* LDO0 is not connected to anything */
> -
> -				ldo1 {
> -					regulator-name = "+1.1vs_ldo1,avdd_pll*";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo2 {
> -					regulator-name = "+1.2vs_ldo2,vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo3 {
> -					regulator-name = "+3.3vs_ldo3,avdd_usb*";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo4 {
> -					regulator-name = "+1.8vs_ldo4,avdd_osc,vddio_sys";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5 {
> -					regulator-name = "+2.85vs_ldo5,vcore_mmc";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo6 {
> -					/*
> -					 * Research indicates this should be
> -					 * 1.8v; other boards that use this
> -					 * rail for the same purpose need it
> -					 * set to 1.8v. The schematic signal
> -					 * name is incorrect; perhaps copied
> -					 * from an incorrect NVIDIA reference.
> -					 */
> -					regulator-name = "+2.85vs_ldo6,avdd_vdac";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				hdmi_vdd_reg: ldo7 {
> -					regulator-name = "+3.3vs_ldo7,avdd_hdmi";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				hdmi_pll_reg: ldo8 {
> -					regulator-name = "+1.8vs_ldo8,avdd_hdmi_pll";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				ldo9 {
> -					regulator-name = "+2.85vs_ldo9,vdd_ddr_rx";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo_rtc {
> -					regulator-name = "+3.3vs_rtc";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -
> -		adt7461@4c {
> -			compatible = "adi,adt7461";
> -			reg = <0x4c>;
> -		};
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -
> -	usb@c5000000 {
> -		status = "okay";
> -	};
> -
> -	usb@c5004000 {
> -		status = "okay";
> -		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -	};
> -
> -	usb-phy@c5004400 {
> -		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> -	};
> -
> -	sdhci@c8000000 {
> -		status = "okay";
> -		cd-gpios = <&gpio 173 0>; /* gpio PV5 */
> -		wp-gpios = <&gpio 57 0>;  /* gpio PH1 */
> -		power-gpios = <&gpio 169 0>; /* gpio PV1 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@c8000600 {
> -		status = "okay";
> -		bus-width = <8>;
> -	};
> -
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -
> -		power {
> -			label = "Power";
> -			gpios = <&gpio 79 1>; /* gpio PJ7, active low */
> -			linux,code = <116>; /* KEY_POWER */
> -			gpio-key,wakeup;
> -		};
> -	};
> -
> -	gpio-leds {
> -		compatible = "gpio-leds";
> -
> -		wifi {
> -			label = "wifi-led";
> -			gpios = <&gpio 24 0>; /* gpio PD0 */
> -			linux,default-trigger = "rfkill0";
> -		};
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		p5valw_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "+5valw";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-alc5632-paz00",
> -			"nvidia,tegra-audio-alc5632";
> -
> -		nvidia,model = "Compal PAZ00";
> -
> -		nvidia,audio-routing =
> -			"Int Spk", "SPKOUT",
> -			"Int Spk", "SPKOUTN",
> -			"Headset Mic", "MICBIAS1",
> -			"MIC1", "Headset Mic",
> -			"Headset Stereophone", "HPR",
> -			"Headset Stereophone", "HPL",
> -			"DMICDAT", "Digital Mic";
> -
> -		nvidia,audio-codec = <&alc5632>;
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dtsp b/arch/arm/boot/dts/tegra20-paz00.dtsp
> new file mode 100644
> index 0000000..e40d7ee
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-paz00.dtsp
> @@ -0,0 +1,505 @@
> +/dts-v1/;
> +
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "Toshiba AC100 / Dynabook AZ";
> +	compatible = "compal,paz00", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x20000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			ata {
> +				nvidia,pins = "ata", "atc", "atd", "ate",
> +					"dap2", "gmb", "gmc", "gmd", "spia",
> +					"spib", "spic", "spid", "spie";
> +				nvidia,function = "gmi";
> +			};
> +			atb {
> +				nvidia,pins = "atb", "gma", "gme";
> +				nvidia,function = "sdio4";
> +			};
> +			cdev1 {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "pllp_out4";
> +			};
> +			crtp {
> +				nvidia,pins = "crtp";
> +				nvidia,function = "crt";
> +			};
> +			csus {
> +				nvidia,pins = "csus";
> +				nvidia,function = "pllc_out1";
> +			};
> +			dap1 {
> +				nvidia,pins = "dap1";
> +				nvidia,function = "dap1";
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +			};
> +			dap4 {
> +				nvidia,pins = "dap4";
> +				nvidia,function = "dap4";
> +			};
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> +				nvidia,function = "rsvd1";
> +			};
> +			dtf {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +			};
> +			gpu {
> +				nvidia,pins = "gpu", "sdb", "sdd";
> +				nvidia,function = "pwm";
> +			};
> +			gpu7 {
> +				nvidia,pins = "gpu7";
> +				nvidia,function = "rtck";
> +			};
> +			gpv {
> +				nvidia,pins = "gpv", "slxa", "slxk";
> +				nvidia,function = "pcie";
> +			};
> +			hdint {
> +				nvidia,pins = "hdint", "pta";
> +				nvidia,function = "hdmi";
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +			};
> +			irrx {
> +				nvidia,pins = "irrx", "irtx";
> +				nvidia,function = "uarta";
> +			};
> +			kbca {
> +				nvidia,pins = "kbca", "kbcc", "kbce", "kbcf";
> +				nvidia,function = "kbc";
> +			};
> +			kbcb {
> +				nvidia,pins = "kbcb", "kbcd";
> +				nvidia,function = "sdio2";
> +			};
> +			lcsn {
> +				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> +					"ld3", "ld4", "ld5", "ld6", "ld7",
> +					"ld8", "ld9", "ld10", "ld11", "ld12",
> +					"ld13", "ld14", "ld15", "ld16", "ld17",
> +					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> +					"lhs", "lm0", "lm1", "lpp", "lpw0",
> +					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> +					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> +					"lvs";
> +				nvidia,function = "displaya";
> +			};
> +			owc {
> +				nvidia,pins = "owc";
> +				nvidia,function = "owr";
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +			};
> +			rm {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +			};
> +			sdc {
> +				nvidia,pins = "sdc";
> +				nvidia,function = "twc";
> +			};
> +			sdio1 {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "sdio1";
> +			};
> +			slxc {
> +				nvidia,pins = "slxc", "slxd";
> +				nvidia,function = "spi4";
> +			};
> +			spdi {
> +				nvidia,pins = "spdi", "spdo";
> +				nvidia,function = "rsvd2";
> +			};
> +			spif {
> +				nvidia,pins = "spif", "uac";
> +				nvidia,function = "rsvd4";
> +			};
> +			spig {
> +				nvidia,pins = "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +			};
> +			uaa {
> +				nvidia,pins = "uaa", "uab", "uda";
> +				nvidia,function = "ulpi";
> +			};
> +			uad {
> +				nvidia,pins = "uad";
> +				nvidia,function = "spdif";
> +			};
> +			uca {
> +				nvidia,pins = "uca", "ucb";
> +				nvidia,function = "uartc";
> +			};
> +			conf_ata {
> +				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
> +					"cdev1", "cdev2", "dap1", "dap2", "dtf",
> +					"gma", "gmb", "gmc", "gmd", "gme",
> +					"gpu", "gpu7", "gpv", "i2cp", "pta",
> +					"rm", "sdio1", "slxk", "spdo", "uac",
> +					"uda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ck32 {
> +				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> +					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> +				nvidia,pull = <0>;
> +			};
> +			conf_crtp {
> +				nvidia,pins = "crtp", "dap3", "dap4", "dtb",
> +					"dtc", "dte", "slxa", "slxc", "slxd",
> +					"spdi";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_csus {
> +				nvidia,pins = "csus", "spia", "spib", "spid",
> +					"spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ddc {
> +				nvidia,pins = "ddc", "irrx", "irtx", "kbca",
> +					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
> +					"spic", "spig", "uaa", "uab";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_dta {
> +				nvidia,pins = "dta", "dtd", "owc", "sdc", "sdd",
> +					"spie", "spih", "uad", "uca", "ucb";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_hdint {
> +				nvidia,pins = "hdint", "ld0", "ld1", "ld2",
> +					"ld3", "ld4", "ld5", "ld6", "ld7",
> +					"ld8", "ld9", "ld10", "ld11", "ld12",
> +					"ld13", "ld14", "ld15", "ld16", "ld17",
> +					"ldc", "ldi", "lhs", "lsc0", "lspi",
> +					"lvs", "pmc";
> +				nvidia,tristate = <0>;
> +			};
> +			conf_lc {
> +				nvidia,pins = "lc", "ls";
> +				nvidia,pull = <2>;
> +			};
> +			conf_lcsn {
> +				nvidia,pins = "lcsn", "lhp0", "lhp1", "lhp2",
> +					"lm0", "lm1", "lpp", "lpw0", "lpw1",
> +					"lpw2", "lsc1", "lsck", "lsda", "lsdi",
> +					"lvp0", "lvp1", "sdb";
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ld17_0 {
> +				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> +					"ld23_22";
> +				nvidia,pull = <1>;
> +			};
> +		};
> +	};
> +
> +	i2s@70002800 {
> +		status = "okay";
> +	};
> +
> +	serial@70006000 {
> +		status = "okay";
> +	};
> +
> +	serial@70006200 {
> +		status = "okay";
> +	};
> +
> +	i2c@7000c000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		alc5632: alc5632@1e {
> +			compatible = "realtek,alc5632";
> +			reg = <0x1e>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +	};
> +
> +	hdmi_ddc: i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	nvec {
> +		compatible = "nvidia,nvec";
> +		reg = <0x7000c500 0x100>;
> +		interrupts = <0 92 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <80000>;
> +		request-gpios = <&gpio 170 0>; /* gpio PV2 */
> +		slave-addr = <138>;
> +		clocks = <&tegra_car 67>, <&tegra_car 124>;
> +		clock-names = "div-clk", "fast-clk";
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		pmic: tps6586x@34 {
> +			compatible = "ti,tps6586x";
> +			reg = <0x34>;
> +			interrupts = <0 86 0x4>;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			sys-supply = <&p5valw_reg>;
> +			vin-sm0-supply = <&sys_reg>;
> +			vin-sm1-supply = <&sys_reg>;
> +			vin-sm2-supply = <&sys_reg>;
> +			vinldo01-supply = <&sm2_reg>;
> +			vinldo23-supply = <&sm2_reg>;
> +			vinldo4-supply = <&sm2_reg>;
> +			vinldo678-supply = <&sm2_reg>;
> +			vinldo9-supply = <&sm2_reg>;
> +
> +			regulators {
> +				sys_reg: sys {
> +					regulator-name = "vdd_sys";
> +					regulator-always-on;
> +				};
> +
> +				sm0 {
> +					regulator-name = "+1.2vs_sm0,vdd_core";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				sm1 {
> +					regulator-name = "+1.0vs_sm1,vdd_cpu";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +
> +				sm2_reg: sm2 {
> +					regulator-name = "+3.7vs_sm2,vin_ldo*";
> +					regulator-min-microvolt = <3700000>;
> +					regulator-max-microvolt = <3700000>;
> +					regulator-always-on;
> +				};
> +
> +				/* LDO0 is not connected to anything */
> +
> +				ldo1 {
> +					regulator-name = "+1.1vs_ldo1,avdd_pll*";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo2 {
> +					regulator-name = "+1.2vs_ldo2,vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo3 {
> +					regulator-name = "+3.3vs_ldo3,avdd_usb*";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo4 {
> +					regulator-name = "+1.8vs_ldo4,avdd_osc,vddio_sys";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5 {
> +					regulator-name = "+2.85vs_ldo5,vcore_mmc";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo6 {
> +					/*
> +					 * Research indicates this should be
> +					 * 1.8v; other boards that use this
> +					 * rail for the same purpose need it
> +					 * set to 1.8v. The schematic signal
> +					 * name is incorrect; perhaps copied
> +					 * from an incorrect NVIDIA reference.
> +					 */
> +					regulator-name = "+2.85vs_ldo6,avdd_vdac";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				hdmi_vdd_reg: ldo7 {
> +					regulator-name = "+3.3vs_ldo7,avdd_hdmi";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				hdmi_pll_reg: ldo8 {
> +					regulator-name = "+1.8vs_ldo8,avdd_hdmi_pll";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				ldo9 {
> +					regulator-name = "+2.85vs_ldo9,vdd_ddr_rx";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo_rtc {
> +					regulator-name = "+3.3vs_rtc";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +
> +		adt7461@4c {
> +			compatible = "adi,adt7461";
> +			reg = <0x4c>;
> +		};
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +
> +	usb@c5000000 {
> +		status = "okay";
> +	};
> +
> +	usb@c5004000 {
> +		status = "okay";
> +		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +	};
> +
> +	usb-phy@c5004400 {
> +		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> +	};
> +
> +	sdhci@c8000000 {
> +		status = "okay";
> +		cd-gpios = <&gpio 173 0>; /* gpio PV5 */
> +		wp-gpios = <&gpio 57 0>;  /* gpio PH1 */
> +		power-gpios = <&gpio 169 0>; /* gpio PV1 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@c8000600 {
> +		status = "okay";
> +		bus-width = <8>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		power {
> +			label = "Power";
> +			gpios = <&gpio 79 1>; /* gpio PJ7, active low */
> +			linux,code = <116>; /* KEY_POWER */
> +			gpio-key,wakeup;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		wifi {
> +			label = "wifi-led";
> +			gpios = <&gpio 24 0>; /* gpio PD0 */
> +			linux,default-trigger = "rfkill0";
> +		};
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		p5valw_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "+5valw";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-alc5632-paz00",
> +			"nvidia,tegra-audio-alc5632";
> +
> +		nvidia,model = "Compal PAZ00";
> +
> +		nvidia,audio-routing =
> +			"Int Spk", "SPKOUT",
> +			"Int Spk", "SPKOUTN",
> +			"Headset Mic", "MICBIAS1",
> +			"MIC1", "Headset Mic",
> +			"Headset Stereophone", "HPR",
> +			"Headset Stereophone", "HPL",
> +			"DMICDAT", "Digital Mic";
> +
> +		nvidia,audio-codec = <&alc5632>;
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts
> deleted file mode 100644
> index 2894800..0000000
> --- a/arch/arm/boot/dts/tegra20-plutux.dts
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20-tamonten.dtsi"
> -
> -/ {
> -	model = "Avionic Design Plutux board";
> -	compatible = "ad,plutux", "ad,tamonten", "nvidia,tegra20";
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -		};
> -	};
> -
> -	i2c@7000c000 {
> -		wm8903: wm8903@1a {
> -			compatible = "wlf,wm8903";
> -			reg = <0x1a>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <187 0x04>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			micdet-cfg = <0>;
> -			micdet-delay = <100>;
> -			gpio-cfg = <0xffffffff
> -				    0xffffffff
> -				    0
> -				    0xffffffff
> -				    0xffffffff>;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "ad,tegra-audio-plutux",
> -			     "nvidia,tegra-audio-wm8903";
> -		nvidia,model = "Avionic Design Plutux";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "HPOUTR",
> -			"Headphone Jack", "HPOUTL",
> -			"Int Spk", "ROP",
> -			"Int Spk", "RON",
> -			"Int Spk", "LOP",
> -			"Int Spk", "LON",
> -			"Mic Jack", "MICBIAS",
> -			"IN1L", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&wm8903>;
> -
> -		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> -		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-plutux.dtsp b/arch/arm/boot/dts/tegra20-plutux.dtsp
> new file mode 100644
> index 0000000..08401b9
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-plutux.dtsp
> @@ -0,0 +1,56 @@
> +/dts-v1/;
> +
> +#include "tegra20-tamonten.dtsip"
> +
> +/ {
> +	model = "Avionic Design Plutux board";
> +	compatible = "ad,plutux", "ad,tamonten", "nvidia,tegra20";
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +		};
> +	};
> +
> +	i2c@7000c000 {
> +		wm8903: wm8903@1a {
> +			compatible = "wlf,wm8903";
> +			reg = <0x1a>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <187 0x04>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;
> +			gpio-cfg = <0xffffffff
> +				    0xffffffff
> +				    0
> +				    0xffffffff
> +				    0xffffffff>;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "ad,tegra-audio-plutux",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "Avionic Design Plutux";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1L", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
> deleted file mode 100644
> index 37b3a57..0000000
> --- a/arch/arm/boot/dts/tegra20-seaboard.dts
> +++ /dev/null
> @@ -1,812 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "NVIDIA Seaboard";
> -	compatible = "nvidia,seaboard", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x40000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			ata {
> -				nvidia,pins = "ata";
> -				nvidia,function = "ide";
> -			};
> -			atb {
> -				nvidia,pins = "atb", "gma", "gme";
> -				nvidia,function = "sdio4";
> -			};
> -			atc {
> -				nvidia,pins = "atc";
> -				nvidia,function = "nand";
> -			};
> -			atd {
> -				nvidia,pins = "atd", "ate", "gmb", "spia",
> -					"spib", "spic";
> -				nvidia,function = "gmi";
> -			};
> -			cdev1 {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -			};
> -			cdev2 {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "pllp_out4";
> -			};
> -			crtp {
> -				nvidia,pins = "crtp", "lm1";
> -				nvidia,function = "crt";
> -			};
> -			csus {
> -				nvidia,pins = "csus";
> -				nvidia,function = "vi_sensor_clk";
> -			};
> -			dap1 {
> -				nvidia,pins = "dap1";
> -				nvidia,function = "dap1";
> -			};
> -			dap2 {
> -				nvidia,pins = "dap2";
> -				nvidia,function = "dap2";
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -			};
> -			dap4 {
> -				nvidia,pins = "dap4";
> -				nvidia,function = "dap4";
> -			};
> -			dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> -				nvidia,function = "vi";
> -			};
> -			dtf {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -			};
> -			gmc {
> -				nvidia,pins = "gmc";
> -				nvidia,function = "uartd";
> -			};
> -			gmd {
> -				nvidia,pins = "gmd";
> -				nvidia,function = "sflash";
> -			};
> -			gpu {
> -				nvidia,pins = "gpu";
> -				nvidia,function = "pwm";
> -			};
> -			gpu7 {
> -				nvidia,pins = "gpu7";
> -				nvidia,function = "rtck";
> -			};
> -			gpv {
> -				nvidia,pins = "gpv", "slxa", "slxk";
> -				nvidia,function = "pcie";
> -			};
> -			hdint {
> -				nvidia,pins = "hdint", "lpw0", "lpw2", "lsc1",
> -					"lsck", "lsda";
> -				nvidia,function = "hdmi";
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -			};
> -			irrx {
> -				nvidia,pins = "irrx", "irtx";
> -				nvidia,function = "uartb";
> -			};
> -			kbca {
> -				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> -					"kbce", "kbcf";
> -				nvidia,function = "kbc";
> -			};
> -			lcsn {
> -				nvidia,pins = "lcsn", "ldc", "lm0", "lpw1",
> -					"lsdi", "lvp0";
> -				nvidia,function = "rsvd4";
> -			};
> -			ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldi", "lhp0",
> -					"lhp1", "lhp2", "lhs", "lpp", "lsc0",
> -					"lspi", "lvp1", "lvs";
> -				nvidia,function = "displaya";
> -			};
> -			owc {
> -				nvidia,pins = "owc", "spdi", "spdo", "uac";
> -				nvidia,function = "rsvd2";
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -			};
> -			rm {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -			};
> -			sdb {
> -				nvidia,pins = "sdb", "sdc", "sdd";
> -				nvidia,function = "sdio3";
> -			};
> -			sdio1 {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "sdio1";
> -			};
> -			slxc {
> -				nvidia,pins = "slxc", "slxd";
> -				nvidia,function = "spdif";
> -			};
> -			spid {
> -				nvidia,pins = "spid", "spie", "spif";
> -				nvidia,function = "spi1";
> -			};
> -			spig {
> -				nvidia,pins = "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -			};
> -			uaa {
> -				nvidia,pins = "uaa", "uab", "uda";
> -				nvidia,function = "ulpi";
> -			};
> -			uad {
> -				nvidia,pins = "uad";
> -				nvidia,function = "irda";
> -			};
> -			uca {
> -				nvidia,pins = "uca", "ucb";
> -				nvidia,function = "uartc";
> -			};
> -			conf_ata {
> -				nvidia,pins = "ata", "atb", "atc", "atd",
> -					"cdev1", "cdev2", "dap1", "dap2",
> -					"dap4", "ddc", "dtf", "gma", "gmc", "gmd",
> -					"gme", "gpu", "gpu7", "i2cp", "irrx",
> -					"irtx", "pta", "rm", "sdc", "sdd",
> -					"slxd", "slxk", "spdi", "spdo", "uac",
> -					"uad", "uca", "ucb", "uda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ate {
> -				nvidia,pins = "ate", "csus", "dap3",
> -					"gpv", "owc", "slxc", "spib", "spid",
> -					"spie";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ck32 {
> -				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> -					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> -				nvidia,pull = <0>;
> -			};
> -			conf_crtp {
> -				nvidia,pins = "crtp", "gmb", "slxa", "spia",
> -					"spig", "spih";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_dte {
> -				nvidia,pins = "dte", "spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_hdint {
> -				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> -					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> -					"lvp0";
> -				nvidia,tristate = <1>;
> -			};
> -			conf_kbca {
> -				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> -					"kbce", "kbcf", "sdio1", "spic", "uaa",
> -					"uab";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_lc {
> -				nvidia,pins = "lc", "ls";
> -				nvidia,pull = <2>;
> -			};
> -			conf_ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldi", "lhp0",
> -					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> -					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> -					"lvs", "pmc", "sdb";
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ld17_0 {
> -				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> -					"ld23_22";
> -				nvidia,pull = <1>;
> -			};
> -			drive_sdio1 {
> -				nvidia,pins = "drive_sdio1";
> -				nvidia,high-speed-mode = <0>;
> -				nvidia,schmitt = <0>;
> -				nvidia,low-power-mode = <3>;
> -				nvidia,pull-down-strength = <31>;
> -				nvidia,pull-up-strength = <31>;
> -				nvidia,slew-rate-rising = <3>;
> -				nvidia,slew-rate-falling = <3>;
> -			};
> -		};
> -
> -		state_i2cmux_ddc: pinmux_i2cmux_ddc {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "rsvd4";
> -			};
> -		};
> -
> -		state_i2cmux_pta: pinmux_i2cmux_pta {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "rsvd4";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "i2c2";
> -			};
> -		};
> -
> -		state_i2cmux_idle: pinmux_i2cmux_idle {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "rsvd4";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "rsvd4";
> -			};
> -		};
> -	};
> -
> -	i2s@70002800 {
> -		status = "okay";
> -	};
> -
> -	serial@70006300 {
> -		status = "okay";
> -	};
> -
> -	i2c@7000c000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		wm8903: wm8903@1a {
> -			compatible = "wlf,wm8903";
> -			reg = <0x1a>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <187 0x04>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			micdet-cfg = <0>;
> -			micdet-delay = <100>;
> -			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> -		};
> -
> -		/* ALS and proximity sensor */
> -		isl29018@44 {
> -			compatible = "isil,isl29018";
> -			reg = <0x44>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <202 0x04>; /* GPIO PZ2 */
> -		};
> -
> -		gyrometer@68 {
> -			compatible = "invn,mpu3050";
> -			reg = <0x68>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <204 0x04>; /* gpio PZ4 */
> -		};
> -	};
> -
> -	i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2cmux {
> -		compatible = "i2c-mux-pinctrl";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		i2c-parent = <&{/i2c@7000c400}>;
> -
> -		pinctrl-names = "ddc", "pta", "idle";
> -		pinctrl-0 = <&state_i2cmux_ddc>;
> -		pinctrl-1 = <&state_i2cmux_pta>;
> -		pinctrl-2 = <&state_i2cmux_idle>;
> -
> -		hdmi_ddc: i2c@0 {
> -			reg = <0>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		i2c@1 {
> -			reg = <1>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			smart-battery@b {
> -				compatible = "ti,bq20z75", "smart-battery-1.1";
> -				reg = <0xb>;
> -				ti,i2c-retry-count = <2>;
> -				ti,poll-retry-count = <10>;
> -			};
> -		};
> -	};
> -
> -	i2c@7000c500 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		pmic: tps6586x@34 {
> -			compatible = "ti,tps6586x";
> -			reg = <0x34>;
> -			interrupts = <0 86 0x4>;
> -
> -			ti,system-power-controller;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			sys-supply = <&vdd_5v0_reg>;
> -			vin-sm0-supply = <&sys_reg>;
> -			vin-sm1-supply = <&sys_reg>;
> -			vin-sm2-supply = <&sys_reg>;
> -			vinldo01-supply = <&sm2_reg>;
> -			vinldo23-supply = <&sm2_reg>;
> -			vinldo4-supply = <&sm2_reg>;
> -			vinldo678-supply = <&sm2_reg>;
> -			vinldo9-supply = <&sm2_reg>;
> -
> -			regulators {
> -				sys_reg: sys {
> -					regulator-name = "vdd_sys";
> -					regulator-always-on;
> -				};
> -
> -				sm0 {
> -					regulator-name = "vdd_sm0,vdd_core";
> -					regulator-min-microvolt = <1300000>;
> -					regulator-max-microvolt = <1300000>;
> -					regulator-always-on;
> -				};
> -
> -				sm1 {
> -					regulator-name = "vdd_sm1,vdd_cpu";
> -					regulator-min-microvolt = <1125000>;
> -					regulator-max-microvolt = <1125000>;
> -					regulator-always-on;
> -				};
> -
> -				sm2_reg: sm2 {
> -					regulator-name = "vdd_sm2,vin_ldo*";
> -					regulator-min-microvolt = <3700000>;
> -					regulator-max-microvolt = <3700000>;
> -					regulator-always-on;
> -				};
> -
> -				/* LDO0 is not connected to anything */
> -
> -				ldo1 {
> -					regulator-name = "vdd_ldo1,avdd_pll*";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo2 {
> -					regulator-name = "vdd_ldo2,vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo3 {
> -					regulator-name = "vdd_ldo3,avdd_usb*";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo4 {
> -					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5 {
> -					regulator-name = "vdd_ldo5,vcore_mmc";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo6 {
> -					regulator-name = "vdd_ldo6,avdd_vdac,vddio_vi,vddio_cam";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				hdmi_vdd_reg: ldo7 {
> -					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				hdmi_pll_reg: ldo8 {
> -					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				ldo9 {
> -					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo_rtc {
> -					regulator-name = "vdd_rtc_out,vdd_cell";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -
> -		temperature-sensor@4c {
> -			compatible = "onnn,nct1008";
> -			reg = <0x4c>;
> -		};
> -
> -		magnetometer@c {
> -			compatible = "ak,ak8975";
> -			reg = <0xc>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <109 0x04>; /* gpio PN5 */
> -		};
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -
> -	memory-controller@7000f400 {
> -		emc-table@190000 {
> -			reg = <190000>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = <190000>;
> -			nvidia,emc-registers = <0x0000000c 0x00000026
> -				0x00000009 0x00000003 0x00000004 0x00000004
> -				0x00000002 0x0000000c 0x00000003 0x00000003
> -				0x00000002 0x00000001 0x00000004 0x00000005
> -				0x00000004 0x00000009 0x0000000d 0x0000059f
> -				0x00000000 0x00000003 0x00000003 0x00000003
> -				0x00000003 0x00000001 0x0000000b 0x000000c8
> -				0x00000003 0x00000007 0x00000004 0x0000000f
> -				0x00000002 0x00000000 0x00000000 0x00000002
> -				0x00000000 0x00000000 0x00000083 0xa06204ae
> -				0x007dc010 0x00000000 0x00000000 0x00000000
> -				0x00000000 0x00000000 0x00000000 0x00000000>;
> -		};
> -
> -		emc-table@380000 {
> -			reg = <380000>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = <380000>;
> -			nvidia,emc-registers = <0x00000017 0x0000004b
> -				0x00000012 0x00000006 0x00000004 0x00000005
> -				0x00000003 0x0000000c 0x00000006 0x00000006
> -				0x00000003 0x00000001 0x00000004 0x00000005
> -				0x00000004 0x00000009 0x0000000d 0x00000b5f
> -				0x00000000 0x00000003 0x00000003 0x00000006
> -				0x00000006 0x00000001 0x00000011 0x000000c8
> -				0x00000003 0x0000000e 0x00000007 0x0000000f
> -				0x00000002 0x00000000 0x00000000 0x00000002
> -				0x00000000 0x00000000 0x00000083 0xe044048b
> -				0x007d8010 0x00000000 0x00000000 0x00000000
> -				0x00000000 0x00000000 0x00000000 0x00000000>;
> -		};
> -	};
> -
> -	usb@c5000000 {
> -		status = "okay";
> -		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
> -		dr_mode = "otg";
> -	};
> -
> -	usb@c5004000 {
> -		status = "okay";
> -		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -	};
> -
> -	usb-phy@c5004400 {
> -		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> -	};
> -
> -	sdhci@c8000000 {
> -		status = "okay";
> -		power-gpios = <&gpio 86 0>; /* gpio PK6 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@c8000400 {
> -		status = "okay";
> -		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> -		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
> -		power-gpios = <&gpio 70 0>; /* gpio PI6 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@c8000600 {
> -		status = "okay";
> -		bus-width = <8>;
> -	};
> -
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -
> -		power {
> -			label = "Power";
> -			gpios = <&gpio 170 1>; /* gpio PV2, active low */
> -			linux,code = <116>; /* KEY_POWER */
> -			gpio-key,wakeup;
> -		};
> -
> -		lid {
> -			label = "Lid";
> -			gpios = <&gpio 23 0>; /* gpio PC7 */
> -			linux,input-type = <5>; /* EV_SW */
> -			linux,code = <0>; /* SW_LID */
> -			debounce-interval = <1>;
> -			gpio-key,wakeup;
> -		};
> -	};
> -
> -	kbc {
> -		status = "okay";
> -		nvidia,debounce-delay-ms = <32>;
> -		nvidia,repeat-delay-ms = <160>;
> -		nvidia,ghost-filter;
> -		nvidia,kbc-row-pins = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15>;
> -		nvidia,kbc-col-pins = <16 17 18 19 20 21 22 23>;
> -		linux,keymap = <0x00020011	/* KEY_W */
> -				0x0003001F	/* KEY_S */
> -				0x0004001E	/* KEY_A */
> -				0x0005002C	/* KEY_Z */
> -				0x000701d0	/* KEY_FN */
> -
> -				0x0107007D	/* KEY_LEFTMETA */
> -				0x02060064 	/* KEY_RIGHTALT */
> -				0x02070038	/* KEY_LEFTALT */
> -
> -				0x03000006	/* KEY_5 */
> -				0x03010005	/* KEY_4 */
> -				0x03020013	/* KEY_R */
> -				0x03030012	/* KEY_E */
> -				0x03040021	/* KEY_F */
> -				0x03050020	/* KEY_D */
> -				0x0306002D	/* KEY_X */
> -
> -				0x04000008	/* KEY_7 */
> -				0x04010007	/* KEY_6 */
> -				0x04020014	/* KEY_T */
> -				0x04030023	/* KEY_H */
> -				0x04040022	/* KEY_G */
> -				0x0405002F	/* KEY_V */
> -				0x0406002E	/* KEY_C */
> -				0x04070039	/* KEY_SPACE */
> -
> -				0x0500000A	/* KEY_9 */
> -				0x05010009	/* KEY_8 */
> -				0x05020016	/* KEY_U */
> -				0x05030015	/* KEY_Y */
> -				0x05040024	/* KEY_J */
> -				0x05050031	/* KEY_N */
> -				0x05060030	/* KEY_B */
> -				0x0507002B	/* KEY_BACKSLASH */
> -
> -				0x0600000C	/* KEY_MINUS */
> -				0x0601000B	/* KEY_0 */
> -				0x06020018	/* KEY_O */
> -				0x06030017	/* KEY_I */
> -				0x06040026	/* KEY_L */
> -				0x06050025	/* KEY_K */
> -				0x06060033	/* KEY_COMMA */
> -				0x06070032	/* KEY_M */
> -
> -				0x0701000D	/* KEY_EQUAL */
> -				0x0702001B	/* KEY_RIGHTBRACE */
> -				0x0703001C	/* KEY_ENTER */
> -				0x0707008B	/* KEY_MENU */
> -
> -				0x08040036	/* KEY_RIGHTSHIFT */
> -				0x0805002A	/* KEY_LEFTSHIFT */
> -
> -				0x09050061	/* KEY_RIGHTCTRL */
> -				0x0907001D	/* KEY_LEFTCTRL */
> -
> -				0x0B00001A	/* KEY_LEFTBRACE */
> -				0x0B010019	/* KEY_P */
> -				0x0B020028	/* KEY_APOSTROPHE */
> -				0x0B030027	/* KEY_SEMICOLON */
> -				0x0B040035	/* KEY_SLASH */
> -				0x0B050034	/* KEY_DOT */
> -
> -				0x0C000044	/* KEY_F10 */
> -				0x0C010043	/* KEY_F9 */
> -				0x0C02000E	/* KEY_BACKSPACE */
> -				0x0C030004	/* KEY_3 */
> -				0x0C040003	/* KEY_2 */
> -				0x0C050067	/* KEY_UP */
> -				0x0C0600D2	/* KEY_PRINT */
> -				0x0C070077	/* KEY_PAUSE */
> -
> -				0x0D00006E	/* KEY_INSERT */
> -				0x0D01006F	/* KEY_DELETE */
> -				0x0D030068	/* KEY_PAGEUP  */
> -				0x0D04006D	/* KEY_PAGEDOWN */
> -				0x0D05006A	/* KEY_RIGHT */
> -				0x0D06006C	/* KEY_DOWN */
> -				0x0D070069	/* KEY_LEFT */
> -
> -				0x0E000057	/* KEY_F11 */
> -				0x0E010058	/* KEY_F12 */
> -				0x0E020042	/* KEY_F8 */
> -				0x0E030010	/* KEY_Q */
> -				0x0E04003E	/* KEY_F4 */
> -				0x0E05003D	/* KEY_F3 */
> -				0x0E060002	/* KEY_1 */
> -				0x0E070041	/* KEY_F7 */
> -
> -				0x0F000001	/* KEY_ESC */
> -				0x0F010029	/* KEY_GRAVE */
> -				0x0F02003F	/* KEY_F5 */
> -				0x0F03000F	/* KEY_TAB */
> -				0x0F04003B	/* KEY_F1 */
> -				0x0F05003C	/* KEY_F2 */
> -				0x0F06003A	/* KEY_CAPSLOCK */
> -				0x0F070040	/* KEY_F6 */
> -
> -				/* Software Handled Function Keys */
> -				0x14000047	/* KEY_KP7 */
> -
> -				0x15000049	/* KEY_KP9 */
> -				0x15010048	/* KEY_KP8 */
> -				0x1502004B	/* KEY_KP4 */
> -				0x1504004F	/* KEY_KP1 */
> -
> -				0x1601004E	/* KEY_KPSLASH */
> -				0x1602004D	/* KEY_KP6 */
> -				0x1603004C	/* KEY_KP5 */
> -				0x16040051	/* KEY_KP3 */
> -				0x16050050	/* KEY_KP2 */
> -				0x16070052	/* KEY_KP0 */
> -
> -				0x1B010037	/* KEY_KPASTERISK */
> -				0x1B03004A	/* KEY_KPMINUS */
> -				0x1B04004E	/* KEY_KPPLUS */
> -				0x1B050053	/* KEY_KPDOT */
> -
> -				0x1C050073	/* KEY_VOLUMEUP */
> -
> -				0x1D030066	/* KEY_HOME */
> -				0x1D04006B	/* KEY_END */
> -				0x1D0500E0	/* KEY_BRIGHTNESSDOWN */
> -				0x1D060072	/* KEY_VOLUMEDOWN */
> -				0x1D0700E1	/* KEY_BRIGHTNESSUP */
> -
> -				0x1E000045	/* KEY_NUMLOCK */
> -				0x1E010046	/* KEY_SCROLLLOCK */
> -				0x1E020071	/* KEY_MUTE */
> -
> -				0x1F04008A>;	/* KEY_HELP */
> -	};
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		vdd_5v0_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "vdd_5v0";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -
> -		regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "vdd_1v5";
> -			regulator-min-microvolt = <1500000>;
> -			regulator-max-microvolt = <1500000>;
> -			gpio = <&pmic 0 0>;
> -		};
> -
> -		regulator@2 {
> -			compatible = "regulator-fixed";
> -			reg = <2>;
> -			regulator-name = "vdd_1v2";
> -			regulator-min-microvolt = <1200000>;
> -			regulator-max-microvolt = <1200000>;
> -			gpio = <&pmic 1 0>;
> -			enable-active-high;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-wm8903-seaboard",
> -			     "nvidia,tegra-audio-wm8903";
> -		nvidia,model = "NVIDIA Tegra Seaboard";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "HPOUTR",
> -			"Headphone Jack", "HPOUTL",
> -			"Int Spk", "ROP",
> -			"Int Spk", "RON",
> -			"Int Spk", "LOP",
> -			"Int Spk", "LON",
> -			"Mic Jack", "MICBIAS",
> -			"IN1R", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&wm8903>;
> -
> -		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> -		nvidia,hp-det-gpios = <&gpio 185 0>; /* gpio PX1 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dtsp b/arch/arm/boot/dts/tegra20-seaboard.dtsp
> new file mode 100644
> index 0000000..6534a61
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-seaboard.dtsp
> @@ -0,0 +1,812 @@
> +/dts-v1/;
> +
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "NVIDIA Seaboard";
> +	compatible = "nvidia,seaboard", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x40000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			ata {
> +				nvidia,pins = "ata";
> +				nvidia,function = "ide";
> +			};
> +			atb {
> +				nvidia,pins = "atb", "gma", "gme";
> +				nvidia,function = "sdio4";
> +			};
> +			atc {
> +				nvidia,pins = "atc";
> +				nvidia,function = "nand";
> +			};
> +			atd {
> +				nvidia,pins = "atd", "ate", "gmb", "spia",
> +					"spib", "spic";
> +				nvidia,function = "gmi";
> +			};
> +			cdev1 {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "pllp_out4";
> +			};
> +			crtp {
> +				nvidia,pins = "crtp", "lm1";
> +				nvidia,function = "crt";
> +			};
> +			csus {
> +				nvidia,pins = "csus";
> +				nvidia,function = "vi_sensor_clk";
> +			};
> +			dap1 {
> +				nvidia,pins = "dap1";
> +				nvidia,function = "dap1";
> +			};
> +			dap2 {
> +				nvidia,pins = "dap2";
> +				nvidia,function = "dap2";
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +			};
> +			dap4 {
> +				nvidia,pins = "dap4";
> +				nvidia,function = "dap4";
> +			};
> +			dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> +				nvidia,function = "vi";
> +			};
> +			dtf {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +			};
> +			gmc {
> +				nvidia,pins = "gmc";
> +				nvidia,function = "uartd";
> +			};
> +			gmd {
> +				nvidia,pins = "gmd";
> +				nvidia,function = "sflash";
> +			};
> +			gpu {
> +				nvidia,pins = "gpu";
> +				nvidia,function = "pwm";
> +			};
> +			gpu7 {
> +				nvidia,pins = "gpu7";
> +				nvidia,function = "rtck";
> +			};
> +			gpv {
> +				nvidia,pins = "gpv", "slxa", "slxk";
> +				nvidia,function = "pcie";
> +			};
> +			hdint {
> +				nvidia,pins = "hdint", "lpw0", "lpw2", "lsc1",
> +					"lsck", "lsda";
> +				nvidia,function = "hdmi";
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +			};
> +			irrx {
> +				nvidia,pins = "irrx", "irtx";
> +				nvidia,function = "uartb";
> +			};
> +			kbca {
> +				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> +					"kbce", "kbcf";
> +				nvidia,function = "kbc";
> +			};
> +			lcsn {
> +				nvidia,pins = "lcsn", "ldc", "lm0", "lpw1",
> +					"lsdi", "lvp0";
> +				nvidia,function = "rsvd4";
> +			};
> +			ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldi", "lhp0",
> +					"lhp1", "lhp2", "lhs", "lpp", "lsc0",
> +					"lspi", "lvp1", "lvs";
> +				nvidia,function = "displaya";
> +			};
> +			owc {
> +				nvidia,pins = "owc", "spdi", "spdo", "uac";
> +				nvidia,function = "rsvd2";
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +			};
> +			rm {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +			};
> +			sdb {
> +				nvidia,pins = "sdb", "sdc", "sdd";
> +				nvidia,function = "sdio3";
> +			};
> +			sdio1 {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "sdio1";
> +			};
> +			slxc {
> +				nvidia,pins = "slxc", "slxd";
> +				nvidia,function = "spdif";
> +			};
> +			spid {
> +				nvidia,pins = "spid", "spie", "spif";
> +				nvidia,function = "spi1";
> +			};
> +			spig {
> +				nvidia,pins = "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +			};
> +			uaa {
> +				nvidia,pins = "uaa", "uab", "uda";
> +				nvidia,function = "ulpi";
> +			};
> +			uad {
> +				nvidia,pins = "uad";
> +				nvidia,function = "irda";
> +			};
> +			uca {
> +				nvidia,pins = "uca", "ucb";
> +				nvidia,function = "uartc";
> +			};
> +			conf_ata {
> +				nvidia,pins = "ata", "atb", "atc", "atd",
> +					"cdev1", "cdev2", "dap1", "dap2",
> +					"dap4", "ddc", "dtf", "gma", "gmc", "gmd",
> +					"gme", "gpu", "gpu7", "i2cp", "irrx",
> +					"irtx", "pta", "rm", "sdc", "sdd",
> +					"slxd", "slxk", "spdi", "spdo", "uac",
> +					"uad", "uca", "ucb", "uda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ate {
> +				nvidia,pins = "ate", "csus", "dap3",
> +					"gpv", "owc", "slxc", "spib", "spid",
> +					"spie";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ck32 {
> +				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> +					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> +				nvidia,pull = <0>;
> +			};
> +			conf_crtp {
> +				nvidia,pins = "crtp", "gmb", "slxa", "spia",
> +					"spig", "spih";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_dte {
> +				nvidia,pins = "dte", "spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_hdint {
> +				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> +					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> +					"lvp0";
> +				nvidia,tristate = <1>;
> +			};
> +			conf_kbca {
> +				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> +					"kbce", "kbcf", "sdio1", "spic", "uaa",
> +					"uab";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_lc {
> +				nvidia,pins = "lc", "ls";
> +				nvidia,pull = <2>;
> +			};
> +			conf_ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldi", "lhp0",
> +					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> +					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> +					"lvs", "pmc", "sdb";
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ld17_0 {
> +				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> +					"ld23_22";
> +				nvidia,pull = <1>;
> +			};
> +			drive_sdio1 {
> +				nvidia,pins = "drive_sdio1";
> +				nvidia,high-speed-mode = <0>;
> +				nvidia,schmitt = <0>;
> +				nvidia,low-power-mode = <3>;
> +				nvidia,pull-down-strength = <31>;
> +				nvidia,pull-up-strength = <31>;
> +				nvidia,slew-rate-rising = <3>;
> +				nvidia,slew-rate-falling = <3>;
> +			};
> +		};
> +
> +		state_i2cmux_ddc: pinmux_i2cmux_ddc {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +			};
> +		};
> +
> +		state_i2cmux_pta: pinmux_i2cmux_pta {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "rsvd4";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "i2c2";
> +			};
> +		};
> +
> +		state_i2cmux_idle: pinmux_i2cmux_idle {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "rsvd4";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +			};
> +		};
> +	};
> +
> +	i2s@70002800 {
> +		status = "okay";
> +	};
> +
> +	serial@70006300 {
> +		status = "okay";
> +	};
> +
> +	i2c@7000c000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		wm8903: wm8903@1a {
> +			compatible = "wlf,wm8903";
> +			reg = <0x1a>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <187 0x04>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;
> +			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> +		};
> +
> +		/* ALS and proximity sensor */
> +		isl29018@44 {
> +			compatible = "isil,isl29018";
> +			reg = <0x44>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <202 0x04>; /* GPIO PZ2 */
> +		};
> +
> +		gyrometer@68 {
> +			compatible = "invn,mpu3050";
> +			reg = <0x68>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <204 0x04>; /* gpio PZ4 */
> +		};
> +	};
> +
> +	i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2cmux {
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c-parent = <&{/i2c@7000c400}>;
> +
> +		pinctrl-names = "ddc", "pta", "idle";
> +		pinctrl-0 = <&state_i2cmux_ddc>;
> +		pinctrl-1 = <&state_i2cmux_pta>;
> +		pinctrl-2 = <&state_i2cmux_idle>;
> +
> +		hdmi_ddc: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			smart-battery@b {
> +				compatible = "ti,bq20z75", "smart-battery-1.1";
> +				reg = <0xb>;
> +				ti,i2c-retry-count = <2>;
> +				ti,poll-retry-count = <10>;
> +			};
> +		};
> +	};
> +
> +	i2c@7000c500 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		pmic: tps6586x@34 {
> +			compatible = "ti,tps6586x";
> +			reg = <0x34>;
> +			interrupts = <0 86 0x4>;
> +
> +			ti,system-power-controller;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			sys-supply = <&vdd_5v0_reg>;
> +			vin-sm0-supply = <&sys_reg>;
> +			vin-sm1-supply = <&sys_reg>;
> +			vin-sm2-supply = <&sys_reg>;
> +			vinldo01-supply = <&sm2_reg>;
> +			vinldo23-supply = <&sm2_reg>;
> +			vinldo4-supply = <&sm2_reg>;
> +			vinldo678-supply = <&sm2_reg>;
> +			vinldo9-supply = <&sm2_reg>;
> +
> +			regulators {
> +				sys_reg: sys {
> +					regulator-name = "vdd_sys";
> +					regulator-always-on;
> +				};
> +
> +				sm0 {
> +					regulator-name = "vdd_sm0,vdd_core";
> +					regulator-min-microvolt = <1300000>;
> +					regulator-max-microvolt = <1300000>;
> +					regulator-always-on;
> +				};
> +
> +				sm1 {
> +					regulator-name = "vdd_sm1,vdd_cpu";
> +					regulator-min-microvolt = <1125000>;
> +					regulator-max-microvolt = <1125000>;
> +					regulator-always-on;
> +				};
> +
> +				sm2_reg: sm2 {
> +					regulator-name = "vdd_sm2,vin_ldo*";
> +					regulator-min-microvolt = <3700000>;
> +					regulator-max-microvolt = <3700000>;
> +					regulator-always-on;
> +				};
> +
> +				/* LDO0 is not connected to anything */
> +
> +				ldo1 {
> +					regulator-name = "vdd_ldo1,avdd_pll*";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo2 {
> +					regulator-name = "vdd_ldo2,vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo3 {
> +					regulator-name = "vdd_ldo3,avdd_usb*";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo4 {
> +					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5 {
> +					regulator-name = "vdd_ldo5,vcore_mmc";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo6 {
> +					regulator-name = "vdd_ldo6,avdd_vdac,vddio_vi,vddio_cam";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				hdmi_vdd_reg: ldo7 {
> +					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				hdmi_pll_reg: ldo8 {
> +					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				ldo9 {
> +					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo_rtc {
> +					regulator-name = "vdd_rtc_out,vdd_cell";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +
> +		temperature-sensor@4c {
> +			compatible = "onnn,nct1008";
> +			reg = <0x4c>;
> +		};
> +
> +		magnetometer@c {
> +			compatible = "ak,ak8975";
> +			reg = <0xc>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <109 0x04>; /* gpio PN5 */
> +		};
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +
> +	memory-controller@7000f400 {
> +		emc-table@190000 {
> +			reg = <190000>;
> +			compatible = "nvidia,tegra20-emc-table";
> +			clock-frequency = <190000>;
> +			nvidia,emc-registers = <0x0000000c 0x00000026
> +				0x00000009 0x00000003 0x00000004 0x00000004
> +				0x00000002 0x0000000c 0x00000003 0x00000003
> +				0x00000002 0x00000001 0x00000004 0x00000005
> +				0x00000004 0x00000009 0x0000000d 0x0000059f
> +				0x00000000 0x00000003 0x00000003 0x00000003
> +				0x00000003 0x00000001 0x0000000b 0x000000c8
> +				0x00000003 0x00000007 0x00000004 0x0000000f
> +				0x00000002 0x00000000 0x00000000 0x00000002
> +				0x00000000 0x00000000 0x00000083 0xa06204ae
> +				0x007dc010 0x00000000 0x00000000 0x00000000
> +				0x00000000 0x00000000 0x00000000 0x00000000>;
> +		};
> +
> +		emc-table@380000 {
> +			reg = <380000>;
> +			compatible = "nvidia,tegra20-emc-table";
> +			clock-frequency = <380000>;
> +			nvidia,emc-registers = <0x00000017 0x0000004b
> +				0x00000012 0x00000006 0x00000004 0x00000005
> +				0x00000003 0x0000000c 0x00000006 0x00000006
> +				0x00000003 0x00000001 0x00000004 0x00000005
> +				0x00000004 0x00000009 0x0000000d 0x00000b5f
> +				0x00000000 0x00000003 0x00000003 0x00000006
> +				0x00000006 0x00000001 0x00000011 0x000000c8
> +				0x00000003 0x0000000e 0x00000007 0x0000000f
> +				0x00000002 0x00000000 0x00000000 0x00000002
> +				0x00000000 0x00000000 0x00000083 0xe044048b
> +				0x007d8010 0x00000000 0x00000000 0x00000000
> +				0x00000000 0x00000000 0x00000000 0x00000000>;
> +		};
> +	};
> +
> +	usb@c5000000 {
> +		status = "okay";
> +		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
> +		dr_mode = "otg";
> +	};
> +
> +	usb@c5004000 {
> +		status = "okay";
> +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +	};
> +
> +	usb-phy@c5004400 {
> +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> +	};
> +
> +	sdhci@c8000000 {
> +		status = "okay";
> +		power-gpios = <&gpio 86 0>; /* gpio PK6 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@c8000400 {
> +		status = "okay";
> +		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> +		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
> +		power-gpios = <&gpio 70 0>; /* gpio PI6 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@c8000600 {
> +		status = "okay";
> +		bus-width = <8>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		power {
> +			label = "Power";
> +			gpios = <&gpio 170 1>; /* gpio PV2, active low */
> +			linux,code = <116>; /* KEY_POWER */
> +			gpio-key,wakeup;
> +		};
> +
> +		lid {
> +			label = "Lid";
> +			gpios = <&gpio 23 0>; /* gpio PC7 */
> +			linux,input-type = <5>; /* EV_SW */
> +			linux,code = <0>; /* SW_LID */
> +			debounce-interval = <1>;
> +			gpio-key,wakeup;
> +		};
> +	};
> +
> +	kbc {
> +		status = "okay";
> +		nvidia,debounce-delay-ms = <32>;
> +		nvidia,repeat-delay-ms = <160>;
> +		nvidia,ghost-filter;
> +		nvidia,kbc-row-pins = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15>;
> +		nvidia,kbc-col-pins = <16 17 18 19 20 21 22 23>;
> +		linux,keymap = <0x00020011	/* KEY_W */
> +				0x0003001F	/* KEY_S */
> +				0x0004001E	/* KEY_A */
> +				0x0005002C	/* KEY_Z */
> +				0x000701d0	/* KEY_FN */
> +
> +				0x0107007D	/* KEY_LEFTMETA */
> +				0x02060064 	/* KEY_RIGHTALT */
> +				0x02070038	/* KEY_LEFTALT */
> +
> +				0x03000006	/* KEY_5 */
> +				0x03010005	/* KEY_4 */
> +				0x03020013	/* KEY_R */
> +				0x03030012	/* KEY_E */
> +				0x03040021	/* KEY_F */
> +				0x03050020	/* KEY_D */
> +				0x0306002D	/* KEY_X */
> +
> +				0x04000008	/* KEY_7 */
> +				0x04010007	/* KEY_6 */
> +				0x04020014	/* KEY_T */
> +				0x04030023	/* KEY_H */
> +				0x04040022	/* KEY_G */
> +				0x0405002F	/* KEY_V */
> +				0x0406002E	/* KEY_C */
> +				0x04070039	/* KEY_SPACE */
> +
> +				0x0500000A	/* KEY_9 */
> +				0x05010009	/* KEY_8 */
> +				0x05020016	/* KEY_U */
> +				0x05030015	/* KEY_Y */
> +				0x05040024	/* KEY_J */
> +				0x05050031	/* KEY_N */
> +				0x05060030	/* KEY_B */
> +				0x0507002B	/* KEY_BACKSLASH */
> +
> +				0x0600000C	/* KEY_MINUS */
> +				0x0601000B	/* KEY_0 */
> +				0x06020018	/* KEY_O */
> +				0x06030017	/* KEY_I */
> +				0x06040026	/* KEY_L */
> +				0x06050025	/* KEY_K */
> +				0x06060033	/* KEY_COMMA */
> +				0x06070032	/* KEY_M */
> +
> +				0x0701000D	/* KEY_EQUAL */
> +				0x0702001B	/* KEY_RIGHTBRACE */
> +				0x0703001C	/* KEY_ENTER */
> +				0x0707008B	/* KEY_MENU */
> +
> +				0x08040036	/* KEY_RIGHTSHIFT */
> +				0x0805002A	/* KEY_LEFTSHIFT */
> +
> +				0x09050061	/* KEY_RIGHTCTRL */
> +				0x0907001D	/* KEY_LEFTCTRL */
> +
> +				0x0B00001A	/* KEY_LEFTBRACE */
> +				0x0B010019	/* KEY_P */
> +				0x0B020028	/* KEY_APOSTROPHE */
> +				0x0B030027	/* KEY_SEMICOLON */
> +				0x0B040035	/* KEY_SLASH */
> +				0x0B050034	/* KEY_DOT */
> +
> +				0x0C000044	/* KEY_F10 */
> +				0x0C010043	/* KEY_F9 */
> +				0x0C02000E	/* KEY_BACKSPACE */
> +				0x0C030004	/* KEY_3 */
> +				0x0C040003	/* KEY_2 */
> +				0x0C050067	/* KEY_UP */
> +				0x0C0600D2	/* KEY_PRINT */
> +				0x0C070077	/* KEY_PAUSE */
> +
> +				0x0D00006E	/* KEY_INSERT */
> +				0x0D01006F	/* KEY_DELETE */
> +				0x0D030068	/* KEY_PAGEUP  */
> +				0x0D04006D	/* KEY_PAGEDOWN */
> +				0x0D05006A	/* KEY_RIGHT */
> +				0x0D06006C	/* KEY_DOWN */
> +				0x0D070069	/* KEY_LEFT */
> +
> +				0x0E000057	/* KEY_F11 */
> +				0x0E010058	/* KEY_F12 */
> +				0x0E020042	/* KEY_F8 */
> +				0x0E030010	/* KEY_Q */
> +				0x0E04003E	/* KEY_F4 */
> +				0x0E05003D	/* KEY_F3 */
> +				0x0E060002	/* KEY_1 */
> +				0x0E070041	/* KEY_F7 */
> +
> +				0x0F000001	/* KEY_ESC */
> +				0x0F010029	/* KEY_GRAVE */
> +				0x0F02003F	/* KEY_F5 */
> +				0x0F03000F	/* KEY_TAB */
> +				0x0F04003B	/* KEY_F1 */
> +				0x0F05003C	/* KEY_F2 */
> +				0x0F06003A	/* KEY_CAPSLOCK */
> +				0x0F070040	/* KEY_F6 */
> +
> +				/* Software Handled Function Keys */
> +				0x14000047	/* KEY_KP7 */
> +
> +				0x15000049	/* KEY_KP9 */
> +				0x15010048	/* KEY_KP8 */
> +				0x1502004B	/* KEY_KP4 */
> +				0x1504004F	/* KEY_KP1 */
> +
> +				0x1601004E	/* KEY_KPSLASH */
> +				0x1602004D	/* KEY_KP6 */
> +				0x1603004C	/* KEY_KP5 */
> +				0x16040051	/* KEY_KP3 */
> +				0x16050050	/* KEY_KP2 */
> +				0x16070052	/* KEY_KP0 */
> +
> +				0x1B010037	/* KEY_KPASTERISK */
> +				0x1B03004A	/* KEY_KPMINUS */
> +				0x1B04004E	/* KEY_KPPLUS */
> +				0x1B050053	/* KEY_KPDOT */
> +
> +				0x1C050073	/* KEY_VOLUMEUP */
> +
> +				0x1D030066	/* KEY_HOME */
> +				0x1D04006B	/* KEY_END */
> +				0x1D0500E0	/* KEY_BRIGHTNESSDOWN */
> +				0x1D060072	/* KEY_VOLUMEDOWN */
> +				0x1D0700E1	/* KEY_BRIGHTNESSUP */
> +
> +				0x1E000045	/* KEY_NUMLOCK */
> +				0x1E010046	/* KEY_SCROLLLOCK */
> +				0x1E020071	/* KEY_MUTE */
> +
> +				0x1F04008A>;	/* KEY_HELP */
> +	};
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd_5v0_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "vdd_5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +
> +		regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "vdd_1v5";
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <1500000>;
> +			gpio = <&pmic 0 0>;
> +		};
> +
> +		regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg = <2>;
> +			regulator-name = "vdd_1v2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			gpio = <&pmic 1 0>;
> +			enable-active-high;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-wm8903-seaboard",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "NVIDIA Tegra Seaboard";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1R", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 185 0>; /* gpio PX1 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> deleted file mode 100644
> index 4766aba..0000000
> --- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
> +++ /dev/null
> @@ -1,489 +0,0 @@
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "Avionic Design Tamonten SOM";
> -	compatible = "ad,tamonten", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x20000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			ata {
> -				nvidia,pins = "ata";
> -				nvidia,function = "ide";
> -			};
> -			atb {
> -				nvidia,pins = "atb", "gma", "gme";
> -				nvidia,function = "sdio4";
> -			};
> -			atc {
> -				nvidia,pins = "atc";
> -				nvidia,function = "nand";
> -			};
> -			atd {
> -				nvidia,pins = "atd", "ate", "gmb", "gmd", "gpu",
> -					"spia", "spib", "spic";
> -				nvidia,function = "gmi";
> -			};
> -			cdev1 {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -			};
> -			cdev2 {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "pllp_out4";
> -			};
> -			crtp {
> -				nvidia,pins = "crtp";
> -				nvidia,function = "crt";
> -			};
> -			csus {
> -				nvidia,pins = "csus";
> -				nvidia,function = "vi_sensor_clk";
> -			};
> -			dap1 {
> -				nvidia,pins = "dap1";
> -				nvidia,function = "dap1";
> -			};
> -			dap2 {
> -				nvidia,pins = "dap2";
> -				nvidia,function = "dap2";
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -			};
> -			dap4 {
> -				nvidia,pins = "dap4";
> -				nvidia,function = "dap4";
> -			};
> -			dta {
> -				nvidia,pins = "dta", "dtd";
> -				nvidia,function = "sdio2";
> -			};
> -			dtb {
> -				nvidia,pins = "dtb", "dtc", "dte";
> -				nvidia,function = "rsvd1";
> -			};
> -			dtf {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -			};
> -			gmc {
> -				nvidia,pins = "gmc";
> -				nvidia,function = "uartd";
> -			};
> -			gpu7 {
> -				nvidia,pins = "gpu7";
> -				nvidia,function = "rtck";
> -			};
> -			gpv {
> -				nvidia,pins = "gpv", "slxa", "slxk";
> -				nvidia,function = "pcie";
> -			};
> -			hdint {
> -				nvidia,pins = "hdint";
> -				nvidia,function = "hdmi";
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -			};
> -			irrx {
> -				nvidia,pins = "irrx", "irtx";
> -				nvidia,function = "uarta";
> -			};
> -			kbca {
> -				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> -					"kbce", "kbcf";
> -				nvidia,function = "kbc";
> -			};
> -			lcsn {
> -				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> -					"ld3", "ld4", "ld5", "ld6", "ld7",
> -					"ld8", "ld9", "ld10", "ld11", "ld12",
> -					"ld13", "ld14", "ld15", "ld16", "ld17",
> -					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> -					"lhs", "lm0", "lm1", "lpp", "lpw0",
> -					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> -					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> -					"lvs";
> -				nvidia,function = "displaya";
> -			};
> -			owc {
> -				nvidia,pins = "owc", "spdi", "spdo", "uac";
> -				nvidia,function = "rsvd2";
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -			};
> -			rm {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -			};
> -			sdb {
> -				nvidia,pins = "sdb", "sdc", "sdd";
> -				nvidia,function = "pwm";
> -			};
> -			sdio1 {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "sdio1";
> -			};
> -			slxc {
> -				nvidia,pins = "slxc", "slxd";
> -				nvidia,function = "spdif";
> -			};
> -			spid {
> -				nvidia,pins = "spid", "spie", "spif";
> -				nvidia,function = "spi1";
> -			};
> -			spig {
> -				nvidia,pins = "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -			};
> -			uaa {
> -				nvidia,pins = "uaa", "uab", "uda";
> -				nvidia,function = "ulpi";
> -			};
> -			uad {
> -				nvidia,pins = "uad";
> -				nvidia,function = "irda";
> -			};
> -			uca {
> -				nvidia,pins = "uca", "ucb";
> -				nvidia,function = "uartc";
> -			};
> -			conf_ata {
> -				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
> -					"cdev1", "cdev2", "dap1", "dtb", "gma",
> -					"gmb", "gmc", "gmd", "gme", "gpu7",
> -					"gpv", "i2cp", "pta", "rm", "slxa",
> -					"slxk", "spia", "spib", "uac";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ck32 {
> -				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> -					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> -				nvidia,pull = <0>;
> -			};
> -			conf_csus {
> -				nvidia,pins = "csus", "spid", "spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_crtp {
> -				nvidia,pins = "crtp", "dap2", "dap3", "dap4",
> -					"dtc", "dte", "dtf", "gpu", "sdio1",
> -					"slxc", "slxd", "spdi", "spdo", "spig",
> -					"uda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ddc {
> -				nvidia,pins = "ddc", "dta", "dtd", "kbca",
> -					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
> -					"sdc";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_hdint {
> -				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> -					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> -					"lvp0", "owc", "sdb";
> -				nvidia,tristate = <1>;
> -			};
> -			conf_irrx {
> -				nvidia,pins = "irrx", "irtx", "sdd", "spic",
> -					"spie", "spih", "uaa", "uab", "uad",
> -					"uca", "ucb";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_lc {
> -				nvidia,pins = "lc", "ls";
> -				nvidia,pull = <2>;
> -			};
> -			conf_ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldi", "lhp0",
> -					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> -					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> -					"lvs", "pmc";
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ld17_0 {
> -				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> -					"ld23_22";
> -				nvidia,pull = <1>;
> -			};
> -		};
> -
> -		state_i2cmux_ddc: pinmux_i2cmux_ddc {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "rsvd4";
> -			};
> -		};
> -
> -		state_i2cmux_pta: pinmux_i2cmux_pta {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "rsvd4";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "i2c2";
> -			};
> -		};
> -
> -		state_i2cmux_idle: pinmux_i2cmux_idle {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "rsvd4";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "rsvd4";
> -			};
> -		};
> -	};
> -
> -	i2s@70002800 {
> -		status = "okay";
> -	};
> -
> -	serial@70006300 {
> -		status = "okay";
> -	};
> -
> -	i2c@7000c000 {
> -		clock-frequency = <400000>;
> -		status = "okay";
> -	};
> -
> -	i2c@7000c400 {
> -		clock-frequency = <100000>;
> -		status = "okay";
> -	};
> -
> -	i2cmux {
> -		compatible = "i2c-mux-pinctrl";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		i2c-parent = <&{/i2c@7000c400}>;
> -
> -		pinctrl-names = "ddc", "pta", "idle";
> -		pinctrl-0 = <&state_i2cmux_ddc>;
> -		pinctrl-1 = <&state_i2cmux_pta>;
> -		pinctrl-2 = <&state_i2cmux_idle>;
> -
> -		hdmi_ddc: i2c@0 {
> -			reg = <0>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		i2c@1 {
> -			reg = <1>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -	};
> -
> -	i2c@7000d000 {
> -		clock-frequency = <400000>;
> -		status = "okay";
> -
> -		pmic: tps6586x@34 {
> -			compatible = "ti,tps6586x";
> -			reg = <0x34>;
> -			interrupts = <0 86 0x4>;
> -
> -			ti,system-power-controller;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			sys-supply = <&vdd_5v0_reg>;
> -			vin-sm0-supply = <&sys_reg>;
> -			vin-sm1-supply = <&sys_reg>;
> -			vin-sm2-supply = <&sys_reg>;
> -			vinldo01-supply = <&sm2_reg>;
> -			vinldo23-supply = <&sm2_reg>;
> -			vinldo4-supply = <&sm2_reg>;
> -			vinldo678-supply = <&sm2_reg>;
> -			vinldo9-supply = <&sm2_reg>;
> -
> -			regulators {
> -				sys_reg: sys {
> -					regulator-name = "vdd_sys";
> -					regulator-always-on;
> -				};
> -
> -				sm0 {
> -					regulator-name = "vdd_sys_sm0,vdd_core";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				sm1 {
> -					regulator-name = "vdd_sys_sm1,vdd_cpu";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				sm2_reg: sm2 {
> -					regulator-name = "vdd_sys_sm2,vin_ldo*";
> -					regulator-min-microvolt = <3700000>;
> -					regulator-max-microvolt = <3700000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo0 {
> -					regulator-name = "vdd_ldo0,vddio_pex_clk";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				ldo1 {
> -					regulator-name = "vdd_ldo1,avdd_pll*";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo2 {
> -					regulator-name = "vdd_ldo2,vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo3 {
> -					regulator-name = "vdd_ldo3,avdd_usb*";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo4 {
> -					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5 {
> -					regulator-name = "vdd_ldo5,vcore_mmc";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -				};
> -
> -				ldo6 {
> -					regulator-name = "vdd_ldo6,avdd_vdac";
> -					/*
> -					 * According to the Tegra 2 Automotive
> -					 * DataSheet, a typical value for this
> -					 * would be 2.8V, but the PMIC only
> -					 * supports 2.85V.
> -					 */
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -				};
> -
> -				hdmi_vdd_reg: ldo7 {
> -					regulator-name = "vdd_ldo7,avdd_hdmi";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				hdmi_pll_reg: ldo8 {
> -					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				ldo9 {
> -					regulator-name = "vdd_ldo9,vdd_ddr_rx,avdd_cam";
> -					/*
> -					 * According to the Tegra 2 Automotive
> -					 * DataSheet, a typical value for this
> -					 * would be 2.8V, but the PMIC only
> -					 * supports 2.85V.
> -					 */
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo_rtc {
> -					regulator-name = "vdd_rtc_out";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -
> -		temperature-sensor@4c {
> -			compatible = "onnn,nct1008";
> -			reg = <0x4c>;
> -		};
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -	};
> -
> -	sdhci@c8000600 {
> -		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
> -		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
> -		bus-width = <4>;
> -		status = "okay";
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		vdd_5v0_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "vdd_5v0";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsip b/arch/arm/boot/dts/tegra20-tamonten.dtsip
> new file mode 100644
> index 0000000..089bbec
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-tamonten.dtsip
> @@ -0,0 +1,489 @@
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "Avionic Design Tamonten SOM";
> +	compatible = "ad,tamonten", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x20000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			ata {
> +				nvidia,pins = "ata";
> +				nvidia,function = "ide";
> +			};
> +			atb {
> +				nvidia,pins = "atb", "gma", "gme";
> +				nvidia,function = "sdio4";
> +			};
> +			atc {
> +				nvidia,pins = "atc";
> +				nvidia,function = "nand";
> +			};
> +			atd {
> +				nvidia,pins = "atd", "ate", "gmb", "gmd", "gpu",
> +					"spia", "spib", "spic";
> +				nvidia,function = "gmi";
> +			};
> +			cdev1 {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "pllp_out4";
> +			};
> +			crtp {
> +				nvidia,pins = "crtp";
> +				nvidia,function = "crt";
> +			};
> +			csus {
> +				nvidia,pins = "csus";
> +				nvidia,function = "vi_sensor_clk";
> +			};
> +			dap1 {
> +				nvidia,pins = "dap1";
> +				nvidia,function = "dap1";
> +			};
> +			dap2 {
> +				nvidia,pins = "dap2";
> +				nvidia,function = "dap2";
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +			};
> +			dap4 {
> +				nvidia,pins = "dap4";
> +				nvidia,function = "dap4";
> +			};
> +			dta {
> +				nvidia,pins = "dta", "dtd";
> +				nvidia,function = "sdio2";
> +			};
> +			dtb {
> +				nvidia,pins = "dtb", "dtc", "dte";
> +				nvidia,function = "rsvd1";
> +			};
> +			dtf {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +			};
> +			gmc {
> +				nvidia,pins = "gmc";
> +				nvidia,function = "uartd";
> +			};
> +			gpu7 {
> +				nvidia,pins = "gpu7";
> +				nvidia,function = "rtck";
> +			};
> +			gpv {
> +				nvidia,pins = "gpv", "slxa", "slxk";
> +				nvidia,function = "pcie";
> +			};
> +			hdint {
> +				nvidia,pins = "hdint";
> +				nvidia,function = "hdmi";
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +			};
> +			irrx {
> +				nvidia,pins = "irrx", "irtx";
> +				nvidia,function = "uarta";
> +			};
> +			kbca {
> +				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> +					"kbce", "kbcf";
> +				nvidia,function = "kbc";
> +			};
> +			lcsn {
> +				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> +					"ld3", "ld4", "ld5", "ld6", "ld7",
> +					"ld8", "ld9", "ld10", "ld11", "ld12",
> +					"ld13", "ld14", "ld15", "ld16", "ld17",
> +					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> +					"lhs", "lm0", "lm1", "lpp", "lpw0",
> +					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> +					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> +					"lvs";
> +				nvidia,function = "displaya";
> +			};
> +			owc {
> +				nvidia,pins = "owc", "spdi", "spdo", "uac";
> +				nvidia,function = "rsvd2";
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +			};
> +			rm {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +			};
> +			sdb {
> +				nvidia,pins = "sdb", "sdc", "sdd";
> +				nvidia,function = "pwm";
> +			};
> +			sdio1 {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "sdio1";
> +			};
> +			slxc {
> +				nvidia,pins = "slxc", "slxd";
> +				nvidia,function = "spdif";
> +			};
> +			spid {
> +				nvidia,pins = "spid", "spie", "spif";
> +				nvidia,function = "spi1";
> +			};
> +			spig {
> +				nvidia,pins = "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +			};
> +			uaa {
> +				nvidia,pins = "uaa", "uab", "uda";
> +				nvidia,function = "ulpi";
> +			};
> +			uad {
> +				nvidia,pins = "uad";
> +				nvidia,function = "irda";
> +			};
> +			uca {
> +				nvidia,pins = "uca", "ucb";
> +				nvidia,function = "uartc";
> +			};
> +			conf_ata {
> +				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
> +					"cdev1", "cdev2", "dap1", "dtb", "gma",
> +					"gmb", "gmc", "gmd", "gme", "gpu7",
> +					"gpv", "i2cp", "pta", "rm", "slxa",
> +					"slxk", "spia", "spib", "uac";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ck32 {
> +				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> +					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> +				nvidia,pull = <0>;
> +			};
> +			conf_csus {
> +				nvidia,pins = "csus", "spid", "spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_crtp {
> +				nvidia,pins = "crtp", "dap2", "dap3", "dap4",
> +					"dtc", "dte", "dtf", "gpu", "sdio1",
> +					"slxc", "slxd", "spdi", "spdo", "spig",
> +					"uda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ddc {
> +				nvidia,pins = "ddc", "dta", "dtd", "kbca",
> +					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
> +					"sdc";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_hdint {
> +				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> +					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> +					"lvp0", "owc", "sdb";
> +				nvidia,tristate = <1>;
> +			};
> +			conf_irrx {
> +				nvidia,pins = "irrx", "irtx", "sdd", "spic",
> +					"spie", "spih", "uaa", "uab", "uad",
> +					"uca", "ucb";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_lc {
> +				nvidia,pins = "lc", "ls";
> +				nvidia,pull = <2>;
> +			};
> +			conf_ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldi", "lhp0",
> +					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> +					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> +					"lvs", "pmc";
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ld17_0 {
> +				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> +					"ld23_22";
> +				nvidia,pull = <1>;
> +			};
> +		};
> +
> +		state_i2cmux_ddc: pinmux_i2cmux_ddc {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +			};
> +		};
> +
> +		state_i2cmux_pta: pinmux_i2cmux_pta {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "rsvd4";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "i2c2";
> +			};
> +		};
> +
> +		state_i2cmux_idle: pinmux_i2cmux_idle {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "rsvd4";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +			};
> +		};
> +	};
> +
> +	i2s@70002800 {
> +		status = "okay";
> +	};
> +
> +	serial@70006300 {
> +		status = "okay";
> +	};
> +
> +	i2c@7000c000 {
> +		clock-frequency = <400000>;
> +		status = "okay";
> +	};
> +
> +	i2c@7000c400 {
> +		clock-frequency = <100000>;
> +		status = "okay";
> +	};
> +
> +	i2cmux {
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c-parent = <&{/i2c@7000c400}>;
> +
> +		pinctrl-names = "ddc", "pta", "idle";
> +		pinctrl-0 = <&state_i2cmux_ddc>;
> +		pinctrl-1 = <&state_i2cmux_pta>;
> +		pinctrl-2 = <&state_i2cmux_idle>;
> +
> +		hdmi_ddc: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	i2c@7000d000 {
> +		clock-frequency = <400000>;
> +		status = "okay";
> +
> +		pmic: tps6586x@34 {
> +			compatible = "ti,tps6586x";
> +			reg = <0x34>;
> +			interrupts = <0 86 0x4>;
> +
> +			ti,system-power-controller;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			sys-supply = <&vdd_5v0_reg>;
> +			vin-sm0-supply = <&sys_reg>;
> +			vin-sm1-supply = <&sys_reg>;
> +			vin-sm2-supply = <&sys_reg>;
> +			vinldo01-supply = <&sm2_reg>;
> +			vinldo23-supply = <&sm2_reg>;
> +			vinldo4-supply = <&sm2_reg>;
> +			vinldo678-supply = <&sm2_reg>;
> +			vinldo9-supply = <&sm2_reg>;
> +
> +			regulators {
> +				sys_reg: sys {
> +					regulator-name = "vdd_sys";
> +					regulator-always-on;
> +				};
> +
> +				sm0 {
> +					regulator-name = "vdd_sys_sm0,vdd_core";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				sm1 {
> +					regulator-name = "vdd_sys_sm1,vdd_cpu";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +
> +				sm2_reg: sm2 {
> +					regulator-name = "vdd_sys_sm2,vin_ldo*";
> +					regulator-min-microvolt = <3700000>;
> +					regulator-max-microvolt = <3700000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo0 {
> +					regulator-name = "vdd_ldo0,vddio_pex_clk";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				ldo1 {
> +					regulator-name = "vdd_ldo1,avdd_pll*";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo2 {
> +					regulator-name = "vdd_ldo2,vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo3 {
> +					regulator-name = "vdd_ldo3,avdd_usb*";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo4 {
> +					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5 {
> +					regulator-name = "vdd_ldo5,vcore_mmc";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +				};
> +
> +				ldo6 {
> +					regulator-name = "vdd_ldo6,avdd_vdac";
> +					/*
> +					 * According to the Tegra 2 Automotive
> +					 * DataSheet, a typical value for this
> +					 * would be 2.8V, but the PMIC only
> +					 * supports 2.85V.
> +					 */
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +				};
> +
> +				hdmi_vdd_reg: ldo7 {
> +					regulator-name = "vdd_ldo7,avdd_hdmi";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				hdmi_pll_reg: ldo8 {
> +					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				ldo9 {
> +					regulator-name = "vdd_ldo9,vdd_ddr_rx,avdd_cam";
> +					/*
> +					 * According to the Tegra 2 Automotive
> +					 * DataSheet, a typical value for this
> +					 * would be 2.8V, but the PMIC only
> +					 * supports 2.85V.
> +					 */
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo_rtc {
> +					regulator-name = "vdd_rtc_out";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +
> +		temperature-sensor@4c {
> +			compatible = "onnn,nct1008";
> +			reg = <0x4c>;
> +		};
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +	};
> +
> +	sdhci@c8000600 {
> +		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
> +		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
> +		bus-width = <4>;
> +		status = "okay";
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd_5v0_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "vdd_5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts
> deleted file mode 100644
> index 402b210..0000000
> --- a/arch/arm/boot/dts/tegra20-tec.dts
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20-tamonten.dtsi"
> -
> -/ {
> -	model = "Avionic Design Tamonten Evaluation Carrier";
> -	compatible = "ad,tec", "ad,tamonten", "nvidia,tegra20";
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -		};
> -	};
> -
> -	i2c@7000c000 {
> -		wm8903: wm8903@1a {
> -			compatible = "wlf,wm8903";
> -			reg = <0x1a>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <187 0x04>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			micdet-cfg = <0>;
> -			micdet-delay = <100>;
> -			gpio-cfg = <0xffffffff
> -				    0xffffffff
> -				    0
> -				    0xffffffff
> -				    0xffffffff>;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "ad,tegra-audio-wm8903-tec",
> -			     "nvidia,tegra-audio-wm8903";
> -		nvidia,model = "Avionic Design TEC";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "HPOUTR",
> -			"Headphone Jack", "HPOUTL",
> -			"Int Spk", "ROP",
> -			"Int Spk", "RON",
> -			"Int Spk", "LOP",
> -			"Int Spk", "LON",
> -			"Mic Jack", "MICBIAS",
> -			"IN1L", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&wm8903>;
> -
> -		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> -		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-tec.dtsp b/arch/arm/boot/dts/tegra20-tec.dtsp
> new file mode 100644
> index 0000000..331c81a
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-tec.dtsp
> @@ -0,0 +1,56 @@
> +/dts-v1/;
> +
> +#include "tegra20-tamonten.dtsip"
> +
> +/ {
> +	model = "Avionic Design Tamonten Evaluation Carrier";
> +	compatible = "ad,tec", "ad,tamonten", "nvidia,tegra20";
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +		};
> +	};
> +
> +	i2c@7000c000 {
> +		wm8903: wm8903@1a {
> +			compatible = "wlf,wm8903";
> +			reg = <0x1a>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <187 0x04>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;
> +			gpio-cfg = <0xffffffff
> +				    0xffffffff
> +				    0
> +				    0xffffffff
> +				    0xffffffff>;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "ad,tegra-audio-wm8903-tec",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "Avionic Design TEC";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1L", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
> deleted file mode 100644
> index 5d79e4f..0000000
> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> +++ /dev/null
> @@ -1,367 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "Compulab TrimSlice board";
> -	compatible = "compulab,trimslice", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x40000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			ata {
> -				nvidia,pins = "ata";
> -				nvidia,function = "ide";
> -			};
> -			atb {
> -				nvidia,pins = "atb", "gma";
> -				nvidia,function = "sdio4";
> -			};
> -			atc {
> -				nvidia,pins = "atc", "gmb";
> -				nvidia,function = "nand";
> -			};
> -			atd {
> -				nvidia,pins = "atd", "ate", "gme", "pta";
> -				nvidia,function = "gmi";
> -			};
> -			cdev1 {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -			};
> -			cdev2 {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "pllp_out4";
> -			};
> -			crtp {
> -				nvidia,pins = "crtp";
> -				nvidia,function = "crt";
> -			};
> -			csus {
> -				nvidia,pins = "csus";
> -				nvidia,function = "vi_sensor_clk";
> -			};
> -			dap1 {
> -				nvidia,pins = "dap1";
> -				nvidia,function = "dap1";
> -			};
> -			dap2 {
> -				nvidia,pins = "dap2";
> -				nvidia,function = "dap2";
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -			};
> -			dap4 {
> -				nvidia,pins = "dap4";
> -				nvidia,function = "dap4";
> -			};
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -			};
> -			dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> -				nvidia,function = "vi";
> -			};
> -			dtf {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -			};
> -			gmc {
> -				nvidia,pins = "gmc", "gmd";
> -				nvidia,function = "sflash";
> -			};
> -			gpu {
> -				nvidia,pins = "gpu";
> -				nvidia,function = "uarta";
> -			};
> -			gpu7 {
> -				nvidia,pins = "gpu7";
> -				nvidia,function = "rtck";
> -			};
> -			gpv {
> -				nvidia,pins = "gpv", "slxa", "slxk";
> -				nvidia,function = "pcie";
> -			};
> -			hdint {
> -				nvidia,pins = "hdint";
> -				nvidia,function = "hdmi";
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -			};
> -			irrx {
> -				nvidia,pins = "irrx", "irtx";
> -				nvidia,function = "uartb";
> -			};
> -			kbca {
> -				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> -					"kbce", "kbcf";
> -				nvidia,function = "kbc";
> -			};
> -			lcsn {
> -				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> -					"ld3", "ld4", "ld5", "ld6", "ld7",
> -					"ld8", "ld9", "ld10", "ld11", "ld12",
> -					"ld13", "ld14", "ld15", "ld16", "ld17",
> -					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> -					"lhs", "lm0", "lm1", "lpp", "lpw0",
> -					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> -					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> -					"lvs";
> -				nvidia,function = "displaya";
> -			};
> -			owc {
> -				nvidia,pins = "owc", "uac";
> -				nvidia,function = "rsvd2";
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -			};
> -			rm {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -			};
> -			sdb {
> -				nvidia,pins = "sdb", "sdc", "sdd";
> -				nvidia,function = "pwm";
> -			};
> -			sdio1 {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "sdio1";
> -			};
> -			slxc {
> -				nvidia,pins = "slxc", "slxd";
> -				nvidia,function = "sdio3";
> -			};
> -			spdi {
> -				nvidia,pins = "spdi", "spdo";
> -				nvidia,function = "spdif";
> -			};
> -			spia {
> -				nvidia,pins = "spia", "spib", "spic";
> -				nvidia,function = "spi2";
> -			};
> -			spid {
> -				nvidia,pins = "spid", "spie", "spif";
> -				nvidia,function = "spi1";
> -			};
> -			spig {
> -				nvidia,pins = "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -			};
> -			uaa {
> -				nvidia,pins = "uaa", "uab", "uda";
> -				nvidia,function = "ulpi";
> -			};
> -			uad {
> -				nvidia,pins = "uad";
> -				nvidia,function = "irda";
> -			};
> -			uca {
> -				nvidia,pins = "uca", "ucb";
> -				nvidia,function = "uartc";
> -			};
> -			conf_ata {
> -				nvidia,pins = "ata", "atc", "atd", "ate",
> -					"crtp", "dap2", "dap3", "dap4", "dta",
> -					"dtb", "dtc", "dtd", "dte", "gmb",
> -					"gme", "i2cp", "pta", "slxc", "slxd",
> -					"spdi", "spdo", "uda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_atb {
> -				nvidia,pins = "atb", "cdev1", "cdev2", "dap1",
> -					"gma", "gmc", "gmd", "gpu", "gpu7",
> -					"gpv", "sdio1", "slxa", "slxk", "uac";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ck32 {
> -				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> -					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> -				nvidia,pull = <0>;
> -			};
> -			conf_csus {
> -				nvidia,pins = "csus", "spia", "spib",
> -					"spid", "spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ddc {
> -				nvidia,pins = "ddc", "dtf", "rm", "sdc", "sdd";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_hdint {
> -				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> -					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> -					"lvp0", "pmc";
> -				nvidia,tristate = <1>;
> -			};
> -			conf_irrx {
> -				nvidia,pins = "irrx", "irtx", "kbca", "kbcb",
> -					"kbcc", "kbcd", "kbce", "kbcf", "owc",
> -					"spic", "spie", "spig", "spih", "uaa",
> -					"uab", "uad", "uca", "ucb";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_lc {
> -				nvidia,pins = "lc", "ls";
> -				nvidia,pull = <2>;
> -			};
> -			conf_ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldi", "lhp0",
> -					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> -					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> -					"lvs", "sdb";
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ld17_0 {
> -				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> -					"ld23_22";
> -				nvidia,pull = <1>;
> -			};
> -			conf_spif {
> -				nvidia,pins = "spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <0>;
> -			};
> -		};
> -	};
> -
> -	i2s@70002800 {
> -		status = "okay";
> -	};
> -
> -	serial@70006000 {
> -		status = "okay";
> -	};
> -
> -	dvi_ddc: i2c@7000c000 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	spi@7000c380 {
> -		status = "okay";
> -		spi-max-frequency = <48000000>;
> -		spi-flash@0 {
> -			compatible = "winbond,w25q80bl";
> -			reg = <0>;
> -			spi-max-frequency = <48000000>;
> -		};
> -	};
> -
> -	hdmi_ddc: i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c500 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		codec: codec@1a {
> -			compatible = "ti,tlv320aic23";
> -			reg = <0x1a>;
> -		};
> -
> -		rtc@56 {
> -			compatible = "emmicro,em3027";
> -			reg = <0x56>;
> -		};
> -	};
> -
> -	usb@c5000000 {
> -		status = "okay";
> -		nvidia,vbus-gpio = <&gpio 170 0>; /* gpio PV2 */
> -	};
> -
> -	usb@c5004000 {
> -		status = "okay";
> -		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -	};
> -
> -	usb-phy@c5004400 {
> -		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> -	};
> -
> -	sdhci@c8000000 {
> -		status = "okay";
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@c8000600 {
> -		status = "okay";
> -		cd-gpios = <&gpio 121 0>; /* gpio PP1 */
> -		wp-gpios = <&gpio 122 0>; /* gpio PP2 */
> -		bus-width = <4>;
> -	};
> -
> -	poweroff {
> -		compatible = "gpio-poweroff";
> -		gpios = <&gpio 191 1>; /* gpio PX7, active low */
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		hdmi_vdd_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "avdd_hdmi";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -		};
> -
> -		hdmi_pll_reg: regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "avdd_hdmi_pll";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-always-on;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-trimslice";
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&codec>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dtsp b/arch/arm/boot/dts/tegra20-trimslice.dtsp
> new file mode 100644
> index 0000000..1f6cd20
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-trimslice.dtsp
> @@ -0,0 +1,367 @@
> +/dts-v1/;
> +
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "Compulab TrimSlice board";
> +	compatible = "compulab,trimslice", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x40000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			ata {
> +				nvidia,pins = "ata";
> +				nvidia,function = "ide";
> +			};
> +			atb {
> +				nvidia,pins = "atb", "gma";
> +				nvidia,function = "sdio4";
> +			};
> +			atc {
> +				nvidia,pins = "atc", "gmb";
> +				nvidia,function = "nand";
> +			};
> +			atd {
> +				nvidia,pins = "atd", "ate", "gme", "pta";
> +				nvidia,function = "gmi";
> +			};
> +			cdev1 {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "pllp_out4";
> +			};
> +			crtp {
> +				nvidia,pins = "crtp";
> +				nvidia,function = "crt";
> +			};
> +			csus {
> +				nvidia,pins = "csus";
> +				nvidia,function = "vi_sensor_clk";
> +			};
> +			dap1 {
> +				nvidia,pins = "dap1";
> +				nvidia,function = "dap1";
> +			};
> +			dap2 {
> +				nvidia,pins = "dap2";
> +				nvidia,function = "dap2";
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +			};
> +			dap4 {
> +				nvidia,pins = "dap4";
> +				nvidia,function = "dap4";
> +			};
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> +				nvidia,function = "vi";
> +			};
> +			dtf {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +			};
> +			gmc {
> +				nvidia,pins = "gmc", "gmd";
> +				nvidia,function = "sflash";
> +			};
> +			gpu {
> +				nvidia,pins = "gpu";
> +				nvidia,function = "uarta";
> +			};
> +			gpu7 {
> +				nvidia,pins = "gpu7";
> +				nvidia,function = "rtck";
> +			};
> +			gpv {
> +				nvidia,pins = "gpv", "slxa", "slxk";
> +				nvidia,function = "pcie";
> +			};
> +			hdint {
> +				nvidia,pins = "hdint";
> +				nvidia,function = "hdmi";
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +			};
> +			irrx {
> +				nvidia,pins = "irrx", "irtx";
> +				nvidia,function = "uartb";
> +			};
> +			kbca {
> +				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> +					"kbce", "kbcf";
> +				nvidia,function = "kbc";
> +			};
> +			lcsn {
> +				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
> +					"ld3", "ld4", "ld5", "ld6", "ld7",
> +					"ld8", "ld9", "ld10", "ld11", "ld12",
> +					"ld13", "ld14", "ld15", "ld16", "ld17",
> +					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
> +					"lhs", "lm0", "lm1", "lpp", "lpw0",
> +					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
> +					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
> +					"lvs";
> +				nvidia,function = "displaya";
> +			};
> +			owc {
> +				nvidia,pins = "owc", "uac";
> +				nvidia,function = "rsvd2";
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +			};
> +			rm {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +			};
> +			sdb {
> +				nvidia,pins = "sdb", "sdc", "sdd";
> +				nvidia,function = "pwm";
> +			};
> +			sdio1 {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "sdio1";
> +			};
> +			slxc {
> +				nvidia,pins = "slxc", "slxd";
> +				nvidia,function = "sdio3";
> +			};
> +			spdi {
> +				nvidia,pins = "spdi", "spdo";
> +				nvidia,function = "spdif";
> +			};
> +			spia {
> +				nvidia,pins = "spia", "spib", "spic";
> +				nvidia,function = "spi2";
> +			};
> +			spid {
> +				nvidia,pins = "spid", "spie", "spif";
> +				nvidia,function = "spi1";
> +			};
> +			spig {
> +				nvidia,pins = "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +			};
> +			uaa {
> +				nvidia,pins = "uaa", "uab", "uda";
> +				nvidia,function = "ulpi";
> +			};
> +			uad {
> +				nvidia,pins = "uad";
> +				nvidia,function = "irda";
> +			};
> +			uca {
> +				nvidia,pins = "uca", "ucb";
> +				nvidia,function = "uartc";
> +			};
> +			conf_ata {
> +				nvidia,pins = "ata", "atc", "atd", "ate",
> +					"crtp", "dap2", "dap3", "dap4", "dta",
> +					"dtb", "dtc", "dtd", "dte", "gmb",
> +					"gme", "i2cp", "pta", "slxc", "slxd",
> +					"spdi", "spdo", "uda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_atb {
> +				nvidia,pins = "atb", "cdev1", "cdev2", "dap1",
> +					"gma", "gmc", "gmd", "gpu", "gpu7",
> +					"gpv", "sdio1", "slxa", "slxk", "uac";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ck32 {
> +				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> +					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> +				nvidia,pull = <0>;
> +			};
> +			conf_csus {
> +				nvidia,pins = "csus", "spia", "spib",
> +					"spid", "spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ddc {
> +				nvidia,pins = "ddc", "dtf", "rm", "sdc", "sdd";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_hdint {
> +				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> +					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
> +					"lvp0", "pmc";
> +				nvidia,tristate = <1>;
> +			};
> +			conf_irrx {
> +				nvidia,pins = "irrx", "irtx", "kbca", "kbcb",
> +					"kbcc", "kbcd", "kbce", "kbcf", "owc",
> +					"spic", "spie", "spig", "spih", "uaa",
> +					"uab", "uad", "uca", "ucb";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_lc {
> +				nvidia,pins = "lc", "ls";
> +				nvidia,pull = <2>;
> +			};
> +			conf_ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldi", "lhp0",
> +					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> +					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
> +					"lvs", "sdb";
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ld17_0 {
> +				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> +					"ld23_22";
> +				nvidia,pull = <1>;
> +			};
> +			conf_spif {
> +				nvidia,pins = "spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <0>;
> +			};
> +		};
> +	};
> +
> +	i2s@70002800 {
> +		status = "okay";
> +	};
> +
> +	serial@70006000 {
> +		status = "okay";
> +	};
> +
> +	dvi_ddc: i2c@7000c000 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	spi@7000c380 {
> +		status = "okay";
> +		spi-max-frequency = <48000000>;
> +		spi-flash@0 {
> +			compatible = "winbond,w25q80bl";
> +			reg = <0>;
> +			spi-max-frequency = <48000000>;
> +		};
> +	};
> +
> +	hdmi_ddc: i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c500 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		codec: codec@1a {
> +			compatible = "ti,tlv320aic23";
> +			reg = <0x1a>;
> +		};
> +
> +		rtc@56 {
> +			compatible = "emmicro,em3027";
> +			reg = <0x56>;
> +		};
> +	};
> +
> +	usb@c5000000 {
> +		status = "okay";
> +		nvidia,vbus-gpio = <&gpio 170 0>; /* gpio PV2 */
> +	};
> +
> +	usb@c5004000 {
> +		status = "okay";
> +		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +	};
> +
> +	usb-phy@c5004400 {
> +		nvidia,phy-reset-gpio = <&gpio 168 0>; /* gpio PV0 */
> +	};
> +
> +	sdhci@c8000000 {
> +		status = "okay";
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@c8000600 {
> +		status = "okay";
> +		cd-gpios = <&gpio 121 0>; /* gpio PP1 */
> +		wp-gpios = <&gpio 122 0>; /* gpio PP2 */
> +		bus-width = <4>;
> +	};
> +
> +	poweroff {
> +		compatible = "gpio-poweroff";
> +		gpios = <&gpio 191 1>; /* gpio PX7, active low */
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hdmi_vdd_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "avdd_hdmi";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		hdmi_pll_reg: regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "avdd_hdmi_pll";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-always-on;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-trimslice";
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&codec>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
> deleted file mode 100644
> index 425c890..0000000
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ /dev/null
> @@ -1,611 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "NVIDIA Tegra20 Ventana evaluation board";
> -	compatible = "nvidia,ventana", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x40000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			ata {
> -				nvidia,pins = "ata";
> -				nvidia,function = "ide";
> -			};
> -			atb {
> -				nvidia,pins = "atb", "gma", "gme";
> -				nvidia,function = "sdio4";
> -			};
> -			atc {
> -				nvidia,pins = "atc";
> -				nvidia,function = "nand";
> -			};
> -			atd {
> -				nvidia,pins = "atd", "ate", "gmb", "spia",
> -					"spib", "spic";
> -				nvidia,function = "gmi";
> -			};
> -			cdev1 {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -			};
> -			cdev2 {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "pllp_out4";
> -			};
> -			crtp {
> -				nvidia,pins = "crtp", "lm1";
> -				nvidia,function = "crt";
> -			};
> -			csus {
> -				nvidia,pins = "csus";
> -				nvidia,function = "vi_sensor_clk";
> -			};
> -			dap1 {
> -				nvidia,pins = "dap1";
> -				nvidia,function = "dap1";
> -			};
> -			dap2 {
> -				nvidia,pins = "dap2";
> -				nvidia,function = "dap2";
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -			};
> -			dap4 {
> -				nvidia,pins = "dap4";
> -				nvidia,function = "dap4";
> -			};
> -			dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> -				nvidia,function = "vi";
> -			};
> -			dtf {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -			};
> -			gmc {
> -				nvidia,pins = "gmc";
> -				nvidia,function = "uartd";
> -			};
> -			gmd {
> -				nvidia,pins = "gmd";
> -				nvidia,function = "sflash";
> -			};
> -			gpu {
> -				nvidia,pins = "gpu";
> -				nvidia,function = "pwm";
> -			};
> -			gpu7 {
> -				nvidia,pins = "gpu7";
> -				nvidia,function = "rtck";
> -			};
> -			gpv {
> -				nvidia,pins = "gpv", "slxa", "slxk";
> -				nvidia,function = "pcie";
> -			};
> -			hdint {
> -				nvidia,pins = "hdint";
> -				nvidia,function = "hdmi";
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -			};
> -			irrx {
> -				nvidia,pins = "irrx", "irtx";
> -				nvidia,function = "uartb";
> -			};
> -			kbca {
> -				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> -					"kbce", "kbcf";
> -				nvidia,function = "kbc";
> -			};
> -			lcsn {
> -				nvidia,pins = "lcsn", "ldc", "lm0", "lpw1",
> -					"lsdi", "lvp0";
> -				nvidia,function = "rsvd4";
> -			};
> -			ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldi", "lhp0",
> -					"lhp1", "lhp2", "lhs", "lpp", "lpw0",
> -					"lpw2", "lsc0", "lsc1", "lsck", "lsda",
> -					"lspi", "lvp1", "lvs";
> -				nvidia,function = "displaya";
> -			};
> -			owc {
> -				nvidia,pins = "owc", "spdi", "spdo", "uac";
> -				nvidia,function = "rsvd2";
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -			};
> -			rm {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -			};
> -			sdb {
> -				nvidia,pins = "sdb", "sdc", "sdd", "slxc";
> -				nvidia,function = "sdio3";
> -			};
> -			sdio1 {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "sdio1";
> -			};
> -			slxd {
> -				nvidia,pins = "slxd";
> -				nvidia,function = "spdif";
> -			};
> -			spid {
> -				nvidia,pins = "spid", "spie", "spif";
> -				nvidia,function = "spi1";
> -			};
> -			spig {
> -				nvidia,pins = "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -			};
> -			uaa {
> -				nvidia,pins = "uaa", "uab", "uda";
> -				nvidia,function = "ulpi";
> -			};
> -			uad {
> -				nvidia,pins = "uad";
> -				nvidia,function = "irda";
> -			};
> -			uca {
> -				nvidia,pins = "uca", "ucb";
> -				nvidia,function = "uartc";
> -			};
> -			conf_ata {
> -				nvidia,pins = "ata", "atb", "atc", "atd",
> -					"cdev1", "cdev2", "dap1", "dap2",
> -					"dap4", "ddc", "dtf", "gma", "gmc",
> -					"gme", "gpu", "gpu7", "i2cp", "irrx",
> -					"irtx", "pta", "rm", "sdc", "sdd",
> -					"slxc", "slxd", "slxk", "spdi", "spdo",
> -					"uac", "uad", "uca", "ucb", "uda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ate {
> -				nvidia,pins = "ate", "csus", "dap3", "gmd",
> -					"gpv", "owc", "spia", "spib", "spic",
> -					"spid", "spie", "spig";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ck32 {
> -				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> -					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> -				nvidia,pull = <0>;
> -			};
> -			conf_crtp {
> -				nvidia,pins = "crtp", "gmb", "slxa", "spih";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_dte {
> -				nvidia,pins = "dte", "spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_hdint {
> -				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> -					"lpw1", "lsck", "lsda", "lsdi", "lvp0";
> -				nvidia,tristate = <1>;
> -			};
> -			conf_kbca {
> -				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> -					"kbce", "kbcf", "sdio1", "uaa", "uab";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_lc {
> -				nvidia,pins = "lc", "ls";
> -				nvidia,pull = <2>;
> -			};
> -			conf_ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldi", "lhp0",
> -					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> -					"lpw0", "lpw2", "lsc0", "lsc1", "lspi",
> -					"lvp1", "lvs", "pmc", "sdb";
> -				nvidia,tristate = <0>;
> -			};
> -			conf_ld17_0 {
> -				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> -					"ld23_22";
> -				nvidia,pull = <1>;
> -			};
> -			drive_sdio1 {
> -				nvidia,pins = "drive_sdio1";
> -				nvidia,high-speed-mode = <0>;
> -				nvidia,schmitt = <1>;
> -				nvidia,low-power-mode = <3>;
> -				nvidia,pull-down-strength = <31>;
> -				nvidia,pull-up-strength = <31>;
> -				nvidia,slew-rate-rising = <3>;
> -				nvidia,slew-rate-falling = <3>;
> -			};
> -		};
> -
> -		state_i2cmux_ddc: pinmux_i2cmux_ddc {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "rsvd4";
> -			};
> -		};
> -
> -		state_i2cmux_pta: pinmux_i2cmux_pta {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "rsvd4";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "i2c2";
> -			};
> -		};
> -
> -		state_i2cmux_idle: pinmux_i2cmux_idle {
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "rsvd4";
> -			};
> -			pta {
> -				nvidia,pins = "pta";
> -				nvidia,function = "rsvd4";
> -			};
> -		};
> -	};
> -
> -	i2s@70002800 {
> -		status = "okay";
> -	};
> -
> -	serial@70006300 {
> -		status = "okay";
> -	};
> -
> -	i2c@7000c000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		wm8903: wm8903@1a {
> -			compatible = "wlf,wm8903";
> -			reg = <0x1a>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <187 0x04>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			micdet-cfg = <0>;
> -			micdet-delay = <100>;
> -			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> -		};
> -
> -		/* ALS and proximity sensor */
> -		isl29018@44 {
> -			compatible = "isil,isl29018";
> -			reg = <0x44>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <202 0x04>; /*gpio PZ2 */
> -		};
> -	};
> -
> -	i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2cmux {
> -		compatible = "i2c-mux-pinctrl";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		i2c-parent = <&{/i2c@7000c400}>;
> -
> -		pinctrl-names = "ddc", "pta", "idle";
> -		pinctrl-0 = <&state_i2cmux_ddc>;
> -		pinctrl-1 = <&state_i2cmux_pta>;
> -		pinctrl-2 = <&state_i2cmux_idle>;
> -
> -		hdmi_ddc: i2c@0 {
> -			reg = <0>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		i2c@1 {
> -			reg = <1>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -	};
> -
> -	i2c@7000c500 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <400000>;
> -
> -		pmic: tps6586x@34 {
> -			compatible = "ti,tps6586x";
> -			reg = <0x34>;
> -			interrupts = <0 86 0x4>;
> -
> -			ti,system-power-controller;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			sys-supply = <&vdd_5v0_reg>;
> -			vin-sm0-supply = <&sys_reg>;
> -			vin-sm1-supply = <&sys_reg>;
> -			vin-sm2-supply = <&sys_reg>;
> -			vinldo01-supply = <&sm2_reg>;
> -			vinldo23-supply = <&sm2_reg>;
> -			vinldo4-supply = <&sm2_reg>;
> -			vinldo678-supply = <&sm2_reg>;
> -			vinldo9-supply = <&sm2_reg>;
> -
> -			regulators {
> -				sys_reg: sys {
> -					regulator-name = "vdd_sys";
> -					regulator-always-on;
> -				};
> -
> -				sm0 {
> -					regulator-name = "vdd_sm0,vdd_core";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				sm1 {
> -					regulator-name = "vdd_sm1,vdd_cpu";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				sm2_reg: sm2 {
> -					regulator-name = "vdd_sm2,vin_ldo*";
> -					regulator-min-microvolt = <3700000>;
> -					regulator-max-microvolt = <3700000>;
> -					regulator-always-on;
> -				};
> -
> -				/* LDO0 is not connected to anything */
> -
> -				ldo1 {
> -					regulator-name = "vdd_ldo1,avdd_pll*";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo2 {
> -					regulator-name = "vdd_ldo2,vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo3 {
> -					regulator-name = "vdd_ldo3,avdd_usb*";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo4 {
> -					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5 {
> -					regulator-name = "vdd_ldo5,vcore_mmc";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo6 {
> -					regulator-name = "vdd_ldo6,avdd_vdac";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				hdmi_vdd_reg: ldo7 {
> -					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				hdmi_pll_reg: ldo8 {
> -					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				ldo9 {
> -					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> -					regulator-min-microvolt = <2850000>;
> -					regulator-max-microvolt = <2850000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo_rtc {
> -					regulator-name = "vdd_rtc_out,vdd_cell";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -
> -		temperature-sensor@4c {
> -			compatible = "onnn,nct1008";
> -			reg = <0x4c>;
> -		};
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -
> -	usb@c5000000 {
> -		status = "okay";
> -	};
> -
> -	usb@c5004000 {
> -		status = "okay";
> -		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -	};
> -
> -	usb-phy@c5004400 {
> -		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> -	};
> -
> -	sdhci@c8000000 {
> -		status = "okay";
> -		power-gpios = <&gpio 86 0>; /* gpio PK6 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@c8000400 {
> -		status = "okay";
> -		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> -		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
> -		power-gpios = <&gpio 70 0>; /* gpio PI6 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@c8000600 {
> -		status = "okay";
> -		bus-width = <8>;
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		vdd_5v0_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "vdd_5v0";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -
> -		regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "vdd_1v5";
> -			regulator-min-microvolt = <1500000>;
> -			regulator-max-microvolt = <1500000>;
> -			gpio = <&pmic 0 0>;
> -		};
> -
> -		regulator@2 {
> -			compatible = "regulator-fixed";
> -			reg = <2>;
> -			regulator-name = "vdd_1v2";
> -			regulator-min-microvolt = <1200000>;
> -			regulator-max-microvolt = <1200000>;
> -			gpio = <&pmic 1 0>;
> -			enable-active-high;
> -		};
> -
> -		regulator@3 {
> -			compatible = "regulator-fixed";
> -			reg = <3>;
> -			regulator-name = "vdd_pnl";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <2800000>;
> -			gpio = <&gpio 22 0>; /* gpio PC6 */
> -			enable-active-high;
> -		};
> -
> -		regulator@4 {
> -			compatible = "regulator-fixed";
> -			reg = <4>;
> -			regulator-name = "vdd_bl";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <2800000>;
> -			gpio = <&gpio 176 0>; /* gpio PW0 */
> -			enable-active-high;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-wm8903-ventana",
> -			     "nvidia,tegra-audio-wm8903";
> -		nvidia,model = "NVIDIA Tegra Ventana";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "HPOUTR",
> -			"Headphone Jack", "HPOUTL",
> -			"Int Spk", "ROP",
> -			"Int Spk", "RON",
> -			"Int Spk", "LOP",
> -			"Int Spk", "LON",
> -			"Mic Jack", "MICBIAS",
> -			"IN1L", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&wm8903>;
> -
> -		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> -		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> -		nvidia,int-mic-en-gpios = <&gpio 184 0>; /* gpio PX0 */
> -		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dtsp b/arch/arm/boot/dts/tegra20-ventana.dtsp
> new file mode 100644
> index 0000000..a5ae217
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-ventana.dtsp
> @@ -0,0 +1,611 @@
> +/dts-v1/;
> +
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "NVIDIA Tegra20 Ventana evaluation board";
> +	compatible = "nvidia,ventana", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x40000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			ata {
> +				nvidia,pins = "ata";
> +				nvidia,function = "ide";
> +			};
> +			atb {
> +				nvidia,pins = "atb", "gma", "gme";
> +				nvidia,function = "sdio4";
> +			};
> +			atc {
> +				nvidia,pins = "atc";
> +				nvidia,function = "nand";
> +			};
> +			atd {
> +				nvidia,pins = "atd", "ate", "gmb", "spia",
> +					"spib", "spic";
> +				nvidia,function = "gmi";
> +			};
> +			cdev1 {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "pllp_out4";
> +			};
> +			crtp {
> +				nvidia,pins = "crtp", "lm1";
> +				nvidia,function = "crt";
> +			};
> +			csus {
> +				nvidia,pins = "csus";
> +				nvidia,function = "vi_sensor_clk";
> +			};
> +			dap1 {
> +				nvidia,pins = "dap1";
> +				nvidia,function = "dap1";
> +			};
> +			dap2 {
> +				nvidia,pins = "dap2";
> +				nvidia,function = "dap2";
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +			};
> +			dap4 {
> +				nvidia,pins = "dap4";
> +				nvidia,function = "dap4";
> +			};
> +			dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd", "dte";
> +				nvidia,function = "vi";
> +			};
> +			dtf {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +			};
> +			gmc {
> +				nvidia,pins = "gmc";
> +				nvidia,function = "uartd";
> +			};
> +			gmd {
> +				nvidia,pins = "gmd";
> +				nvidia,function = "sflash";
> +			};
> +			gpu {
> +				nvidia,pins = "gpu";
> +				nvidia,function = "pwm";
> +			};
> +			gpu7 {
> +				nvidia,pins = "gpu7";
> +				nvidia,function = "rtck";
> +			};
> +			gpv {
> +				nvidia,pins = "gpv", "slxa", "slxk";
> +				nvidia,function = "pcie";
> +			};
> +			hdint {
> +				nvidia,pins = "hdint";
> +				nvidia,function = "hdmi";
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +			};
> +			irrx {
> +				nvidia,pins = "irrx", "irtx";
> +				nvidia,function = "uartb";
> +			};
> +			kbca {
> +				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> +					"kbce", "kbcf";
> +				nvidia,function = "kbc";
> +			};
> +			lcsn {
> +				nvidia,pins = "lcsn", "ldc", "lm0", "lpw1",
> +					"lsdi", "lvp0";
> +				nvidia,function = "rsvd4";
> +			};
> +			ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldi", "lhp0",
> +					"lhp1", "lhp2", "lhs", "lpp", "lpw0",
> +					"lpw2", "lsc0", "lsc1", "lsck", "lsda",
> +					"lspi", "lvp1", "lvs";
> +				nvidia,function = "displaya";
> +			};
> +			owc {
> +				nvidia,pins = "owc", "spdi", "spdo", "uac";
> +				nvidia,function = "rsvd2";
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +			};
> +			rm {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +			};
> +			sdb {
> +				nvidia,pins = "sdb", "sdc", "sdd", "slxc";
> +				nvidia,function = "sdio3";
> +			};
> +			sdio1 {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "sdio1";
> +			};
> +			slxd {
> +				nvidia,pins = "slxd";
> +				nvidia,function = "spdif";
> +			};
> +			spid {
> +				nvidia,pins = "spid", "spie", "spif";
> +				nvidia,function = "spi1";
> +			};
> +			spig {
> +				nvidia,pins = "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +			};
> +			uaa {
> +				nvidia,pins = "uaa", "uab", "uda";
> +				nvidia,function = "ulpi";
> +			};
> +			uad {
> +				nvidia,pins = "uad";
> +				nvidia,function = "irda";
> +			};
> +			uca {
> +				nvidia,pins = "uca", "ucb";
> +				nvidia,function = "uartc";
> +			};
> +			conf_ata {
> +				nvidia,pins = "ata", "atb", "atc", "atd",
> +					"cdev1", "cdev2", "dap1", "dap2",
> +					"dap4", "ddc", "dtf", "gma", "gmc",
> +					"gme", "gpu", "gpu7", "i2cp", "irrx",
> +					"irtx", "pta", "rm", "sdc", "sdd",
> +					"slxc", "slxd", "slxk", "spdi", "spdo",
> +					"uac", "uad", "uca", "ucb", "uda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ate {
> +				nvidia,pins = "ate", "csus", "dap3", "gmd",
> +					"gpv", "owc", "spia", "spib", "spic",
> +					"spid", "spie", "spig";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ck32 {
> +				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
> +					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
> +				nvidia,pull = <0>;
> +			};
> +			conf_crtp {
> +				nvidia,pins = "crtp", "gmb", "slxa", "spih";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_dte {
> +				nvidia,pins = "dte", "spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_hdint {
> +				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
> +					"lpw1", "lsck", "lsda", "lsdi", "lvp0";
> +				nvidia,tristate = <1>;
> +			};
> +			conf_kbca {
> +				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
> +					"kbce", "kbcf", "sdio1", "uaa", "uab";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_lc {
> +				nvidia,pins = "lc", "ls";
> +				nvidia,pull = <2>;
> +			};
> +			conf_ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldi", "lhp0",
> +					"lhp1", "lhp2", "lhs", "lm0", "lpp",
> +					"lpw0", "lpw2", "lsc0", "lsc1", "lspi",
> +					"lvp1", "lvs", "pmc", "sdb";
> +				nvidia,tristate = <0>;
> +			};
> +			conf_ld17_0 {
> +				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> +					"ld23_22";
> +				nvidia,pull = <1>;
> +			};
> +			drive_sdio1 {
> +				nvidia,pins = "drive_sdio1";
> +				nvidia,high-speed-mode = <0>;
> +				nvidia,schmitt = <1>;
> +				nvidia,low-power-mode = <3>;
> +				nvidia,pull-down-strength = <31>;
> +				nvidia,pull-up-strength = <31>;
> +				nvidia,slew-rate-rising = <3>;
> +				nvidia,slew-rate-falling = <3>;
> +			};
> +		};
> +
> +		state_i2cmux_ddc: pinmux_i2cmux_ddc {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +			};
> +		};
> +
> +		state_i2cmux_pta: pinmux_i2cmux_pta {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "rsvd4";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "i2c2";
> +			};
> +		};
> +
> +		state_i2cmux_idle: pinmux_i2cmux_idle {
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "rsvd4";
> +			};
> +			pta {
> +				nvidia,pins = "pta";
> +				nvidia,function = "rsvd4";
> +			};
> +		};
> +	};
> +
> +	i2s@70002800 {
> +		status = "okay";
> +	};
> +
> +	serial@70006300 {
> +		status = "okay";
> +	};
> +
> +	i2c@7000c000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		wm8903: wm8903@1a {
> +			compatible = "wlf,wm8903";
> +			reg = <0x1a>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <187 0x04>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;
> +			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> +		};
> +
> +		/* ALS and proximity sensor */
> +		isl29018@44 {
> +			compatible = "isil,isl29018";
> +			reg = <0x44>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <202 0x04>; /*gpio PZ2 */
> +		};
> +	};
> +
> +	i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2cmux {
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c-parent = <&{/i2c@7000c400}>;
> +
> +		pinctrl-names = "ddc", "pta", "idle";
> +		pinctrl-0 = <&state_i2cmux_ddc>;
> +		pinctrl-1 = <&state_i2cmux_pta>;
> +		pinctrl-2 = <&state_i2cmux_idle>;
> +
> +		hdmi_ddc: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	i2c@7000c500 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		pmic: tps6586x@34 {
> +			compatible = "ti,tps6586x";
> +			reg = <0x34>;
> +			interrupts = <0 86 0x4>;
> +
> +			ti,system-power-controller;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			sys-supply = <&vdd_5v0_reg>;
> +			vin-sm0-supply = <&sys_reg>;
> +			vin-sm1-supply = <&sys_reg>;
> +			vin-sm2-supply = <&sys_reg>;
> +			vinldo01-supply = <&sm2_reg>;
> +			vinldo23-supply = <&sm2_reg>;
> +			vinldo4-supply = <&sm2_reg>;
> +			vinldo678-supply = <&sm2_reg>;
> +			vinldo9-supply = <&sm2_reg>;
> +
> +			regulators {
> +				sys_reg: sys {
> +					regulator-name = "vdd_sys";
> +					regulator-always-on;
> +				};
> +
> +				sm0 {
> +					regulator-name = "vdd_sm0,vdd_core";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				sm1 {
> +					regulator-name = "vdd_sm1,vdd_cpu";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +
> +				sm2_reg: sm2 {
> +					regulator-name = "vdd_sm2,vin_ldo*";
> +					regulator-min-microvolt = <3700000>;
> +					regulator-max-microvolt = <3700000>;
> +					regulator-always-on;
> +				};
> +
> +				/* LDO0 is not connected to anything */
> +
> +				ldo1 {
> +					regulator-name = "vdd_ldo1,avdd_pll*";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo2 {
> +					regulator-name = "vdd_ldo2,vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo3 {
> +					regulator-name = "vdd_ldo3,avdd_usb*";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo4 {
> +					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5 {
> +					regulator-name = "vdd_ldo5,vcore_mmc";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo6 {
> +					regulator-name = "vdd_ldo6,avdd_vdac";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				hdmi_vdd_reg: ldo7 {
> +					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				hdmi_pll_reg: ldo8 {
> +					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				ldo9 {
> +					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
> +					regulator-min-microvolt = <2850000>;
> +					regulator-max-microvolt = <2850000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo_rtc {
> +					regulator-name = "vdd_rtc_out,vdd_cell";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +
> +		temperature-sensor@4c {
> +			compatible = "onnn,nct1008";
> +			reg = <0x4c>;
> +		};
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +
> +	usb@c5000000 {
> +		status = "okay";
> +	};
> +
> +	usb@c5004000 {
> +		status = "okay";
> +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +	};
> +
> +	usb-phy@c5004400 {
> +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
> +	};
> +
> +	sdhci@c8000000 {
> +		status = "okay";
> +		power-gpios = <&gpio 86 0>; /* gpio PK6 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@c8000400 {
> +		status = "okay";
> +		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> +		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
> +		power-gpios = <&gpio 70 0>; /* gpio PI6 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@c8000600 {
> +		status = "okay";
> +		bus-width = <8>;
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd_5v0_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "vdd_5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +
> +		regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "vdd_1v5";
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <1500000>;
> +			gpio = <&pmic 0 0>;
> +		};
> +
> +		regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg = <2>;
> +			regulator-name = "vdd_1v2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			gpio = <&pmic 1 0>;
> +			enable-active-high;
> +		};
> +
> +		regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <3>;
> +			regulator-name = "vdd_pnl";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			gpio = <&gpio 22 0>; /* gpio PC6 */
> +			enable-active-high;
> +		};
> +
> +		regulator@4 {
> +			compatible = "regulator-fixed";
> +			reg = <4>;
> +			regulator-name = "vdd_bl";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			gpio = <&gpio 176 0>; /* gpio PW0 */
> +			enable-active-high;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-wm8903-ventana",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "NVIDIA Tegra Ventana";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1L", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +		nvidia,int-mic-en-gpios = <&gpio 184 0>; /* gpio PX0 */
> +		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
> deleted file mode 100644
> index ea57c0f..0000000
> --- a/arch/arm/boot/dts/tegra20-whistler.dts
> +++ /dev/null
> @@ -1,563 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra20.dtsi"
> -
> -/ {
> -	model = "NVIDIA Tegra20 Whistler evaluation board";
> -	compatible = "nvidia,whistler", "nvidia,tegra20";
> -
> -	memory {
> -		reg = <0x00000000 0x20000000>;
> -	};
> -
> -	host1x {
> -		hdmi {
> -			status = "okay";
> -
> -			vdd-supply = <&hdmi_vdd_reg>;
> -			pll-supply = <&hdmi_pll_reg>;
> -
> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> -			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> -		};
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			ata {
> -				nvidia,pins = "ata", "atb", "ate", "gma", "gmb",
> -					"gmc", "gmd", "gpu";
> -				nvidia,function = "gmi";
> -			};
> -			atc {
> -				nvidia,pins = "atc", "atd";
> -				nvidia,function = "sdio4";
> -			};
> -			cdev1 {
> -				nvidia,pins = "cdev1";
> -				nvidia,function = "plla_out";
> -			};
> -			cdev2 {
> -				nvidia,pins = "cdev2";
> -				nvidia,function = "osc";
> -			};
> -			crtp {
> -				nvidia,pins = "crtp";
> -				nvidia,function = "crt";
> -			};
> -			csus {
> -				nvidia,pins = "csus";
> -				nvidia,function = "vi_sensor_clk";
> -			};
> -			dap1 {
> -				nvidia,pins = "dap1";
> -				nvidia,function = "dap1";
> -			};
> -			dap2 {
> -				nvidia,pins = "dap2";
> -				nvidia,function = "dap2";
> -			};
> -			dap3 {
> -				nvidia,pins = "dap3";
> -				nvidia,function = "dap3";
> -			};
> -			dap4 {
> -				nvidia,pins = "dap4";
> -				nvidia,function = "dap4";
> -			};
> -			ddc {
> -				nvidia,pins = "ddc";
> -				nvidia,function = "i2c2";
> -			};
> -			dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> -				nvidia,function = "vi";
> -			};
> -			dte {
> -				nvidia,pins = "dte";
> -				nvidia,function = "rsvd1";
> -			};
> -			dtf {
> -				nvidia,pins = "dtf";
> -				nvidia,function = "i2c3";
> -			};
> -			gme {
> -				nvidia,pins = "gme";
> -				nvidia,function = "dap5";
> -			};
> -			gpu7 {
> -				nvidia,pins = "gpu7";
> -				nvidia,function = "rtck";
> -			};
> -			gpv {
> -				nvidia,pins = "gpv";
> -				nvidia,function = "pcie";
> -			};
> -			hdint {
> -				nvidia,pins = "hdint", "pta";
> -				nvidia,function = "hdmi";
> -			};
> -			i2cp {
> -				nvidia,pins = "i2cp";
> -				nvidia,function = "i2cp";
> -			};
> -			irrx {
> -				nvidia,pins = "irrx", "irtx";
> -				nvidia,function = "uartb";
> -			};
> -			kbca {
> -				nvidia,pins = "kbca", "kbcc", "kbce", "kbcf";
> -				nvidia,function = "kbc";
> -			};
> -			kbcb {
> -				nvidia,pins = "kbcb", "kbcd";
> -				nvidia,function = "sdio2";
> -			};
> -			lcsn {
> -				nvidia,pins = "lcsn", "lsck", "lsda", "lsdi",
> -					"spia", "spib", "spic";
> -				nvidia,function = "spi3";
> -			};
> -			ld0 {
> -				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> -					"ld5", "ld6", "ld7", "ld8", "ld9",
> -					"ld10", "ld11", "ld12", "ld13", "ld14",
> -					"ld15", "ld16", "ld17", "ldc", "ldi",
> -					"lhp0", "lhp1", "lhp2", "lhs", "lm0",
> -					"lm1", "lpp", "lpw0", "lpw1", "lpw2",
> -					"lsc0", "lsc1", "lspi", "lvp0", "lvp1",
> -					"lvs";
> -				nvidia,function = "displaya";
> -			};
> -			owc {
> -				nvidia,pins = "owc", "uac";
> -				nvidia,function = "owr";
> -			};
> -			pmc {
> -				nvidia,pins = "pmc";
> -				nvidia,function = "pwr_on";
> -			};
> -			rm {
> -				nvidia,pins = "rm";
> -				nvidia,function = "i2c1";
> -			};
> -			sdb {
> -				nvidia,pins = "sdb", "sdc", "sdd", "slxa",
> -					"slxc", "slxd", "slxk";
> -				nvidia,function = "sdio3";
> -			};
> -			sdio1 {
> -				nvidia,pins = "sdio1";
> -				nvidia,function = "sdio1";
> -			};
> -			spdi {
> -				nvidia,pins = "spdi", "spdo";
> -				nvidia,function = "rsvd2";
> -			};
> -			spid {
> -				nvidia,pins = "spid", "spie", "spig", "spih";
> -				nvidia,function = "spi2_alt";
> -			};
> -			spif {
> -				nvidia,pins = "spif";
> -				nvidia,function = "spi2";
> -			};
> -			uaa {
> -				nvidia,pins = "uaa", "uab";
> -				nvidia,function = "uarta";
> -			};
> -			uad {
> -				nvidia,pins = "uad";
> -				nvidia,function = "irda";
> -			};
> -			uca {
> -				nvidia,pins = "uca", "ucb";
> -				nvidia,function = "uartc";
> -			};
> -			uda {
> -				nvidia,pins = "uda";
> -				nvidia,function = "spi1";
> -			};
> -			conf_ata {
> -				nvidia,pins = "ata", "atb", "atc", "ddc", "gma",
> -					"gmb", "gmc", "gmd", "irrx", "irtx",
> -					"kbca", "kbcb", "kbcc", "kbcd", "kbce",
> -					"kbcf", "sdc", "sdd", "spie", "spig",
> -					"spih", "uaa", "uab", "uad", "uca",
> -					"ucb";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_atd {
> -				nvidia,pins = "atd", "ate", "cdev1", "csus",
> -					"dap1", "dap2", "dap3", "dap4", "dte",
> -					"dtf", "gpu", "gpu7", "gpv", "i2cp",
> -					"rm", "sdio1", "slxa", "slxc", "slxd",
> -					"slxk", "spdi", "spdo", "uac", "uda";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_cdev2 {
> -				nvidia,pins = "cdev2", "spia", "spib";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ck32 {
> -				nvidia,pins = "ck32", "ddrc", "lc", "pmca",
> -					"pmcb", "pmcc", "pmcd", "xm2c",
> -					"xm2d";
> -				nvidia,pull = <0>;
> -			};
> -			conf_crtp {
> -				nvidia,pins = "crtp";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_dta {
> -				nvidia,pins = "dta", "dtb", "dtc", "dtd",
> -					"spid", "spif";
> -				nvidia,pull = <1>;
> -				nvidia,tristate = <0>;
> -			};
> -			conf_gme {
> -				nvidia,pins = "gme", "owc", "pta", "spic";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <1>;
> -			};
> -			conf_ld17_0 {
> -				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> -					"ld23_22";
> -				nvidia,pull = <1>;
> -			};
> -			conf_ls {
> -				nvidia,pins = "ls", "pmce";
> -				nvidia,pull = <2>;
> -			};
> -			drive_dap1 {
> -				nvidia,pins = "drive_dap1";
> -				nvidia,high-speed-mode = <0>;
> -				nvidia,schmitt = <1>;
> -				nvidia,low-power-mode = <0>;
> -				nvidia,pull-down-strength = <0>;
> -				nvidia,pull-up-strength = <0>;
> -				nvidia,slew-rate-rising = <0>;
> -				nvidia,slew-rate-falling = <0>;
> -			};
> -		};
> -	};
> -
> -	i2s@70002800 {
> -		status = "okay";
> -	};
> -
> -	serial@70006000 {
> -		status = "okay";
> -	};
> -
> -	hdmi_ddc: i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -
> -		codec: codec@1a {
> -			compatible = "wlf,wm8753";
> -			reg = <0x1a>;
> -		};
> -
> -		tca6416: gpio@20 {
> -			compatible = "ti,tca6416";
> -			reg = <0x20>;
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -		};
> -
> -		max8907@3c {
> -			compatible = "maxim,max8907";
> -			reg = <0x3c>;
> -			interrupts = <0 86 0x4>;
> -
> -			maxim,system-power-controller;
> -
> -			mbatt-supply = <&usb0_vbus_reg>;
> -			in-v1-supply = <&mbatt_reg>;
> -			in-v2-supply = <&mbatt_reg>;
> -			in-v3-supply = <&mbatt_reg>;
> -			in1-supply = <&mbatt_reg>;
> -			in2-supply = <&nvvdd_sv3_reg>;
> -			in3-supply = <&mbatt_reg>;
> -			in4-supply = <&mbatt_reg>;
> -			in5-supply = <&mbatt_reg>;
> -			in6-supply = <&mbatt_reg>;
> -			in7-supply = <&mbatt_reg>;
> -			in8-supply = <&mbatt_reg>;
> -			in9-supply = <&mbatt_reg>;
> -			in10-supply = <&mbatt_reg>;
> -			in11-supply = <&mbatt_reg>;
> -			in12-supply = <&mbatt_reg>;
> -			in13-supply = <&mbatt_reg>;
> -			in14-supply = <&mbatt_reg>;
> -			in15-supply = <&mbatt_reg>;
> -			in16-supply = <&mbatt_reg>;
> -			in17-supply = <&nvvdd_sv3_reg>;
> -			in18-supply = <&nvvdd_sv3_reg>;
> -			in19-supply = <&mbatt_reg>;
> -			in20-supply = <&mbatt_reg>;
> -
> -			regulators {
> -				mbatt_reg: mbatt {
> -					regulator-name = "vbat_pmu";
> -					regulator-always-on;
> -				};
> -
> -				sd1 {
> -					regulator-name = "nvvdd_sv1,vdd_cpu_pmu";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				sd2 {
> -					regulator-name = "nvvdd_sv2,vdd_core";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				nvvdd_sv3_reg: sd3 {
> -					regulator-name = "nvvdd_sv3";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo1 {
> -					regulator-name = "nvvdd_ldo1,vddio_rx_ddr,vcore_acc";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo2 {
> -					regulator-name = "nvvdd_ldo2,avdd_pll*";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo3 {
> -					regulator-name = "nvvdd_ldo3,vcom_1v8b";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo4 {
> -					regulator-name = "nvvdd_ldo4,avdd_usb*";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5 {
> -					regulator-name = "nvvdd_ldo5,vcore_mmc,avdd_lcd1,vddio_1wire";
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -					regulator-always-on;
> -				};
> -
> -				hdmi_pll_reg: ldo6 {
> -					regulator-name = "nvvdd_ldo6,avdd_hdmi_pll";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				ldo7 {
> -					regulator-name = "nvvdd_ldo7,avddio_audio";
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo8 {
> -					regulator-name = "nvvdd_ldo8,vcom_3v0,vcore_cmps";
> -					regulator-min-microvolt = <3000000>;
> -					regulator-max-microvolt = <3000000>;
> -				};
> -
> -				ldo9 {
> -					regulator-name = "nvvdd_ldo9,avdd_cam*";
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -				};
> -
> -				ldo10 {
> -					regulator-name = "nvvdd_ldo10,avdd_usb_ic_3v0";
> -					regulator-min-microvolt = <3000000>;
> -					regulator-max-microvolt = <3000000>;
> -					regulator-always-on;
> -				};
> -
> -				hdmi_vdd_reg: ldo11 {
> -					regulator-name = "nvvdd_ldo11,vddio_pex_clk,vcom_33,avdd_hdmi";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				ldo12 {
> -					regulator-name = "nvvdd_ldo12,vddio_sdio";
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo13 {
> -					regulator-name = "nvvdd_ldo13,vcore_phtn,vdd_af";
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -				};
> -
> -				ldo14 {
> -					regulator-name = "nvvdd_ldo14,avdd_vdac";
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -				};
> -
> -				ldo15 {
> -					regulator-name = "nvvdd_ldo15,vcore_temp,vddio_hdcp";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> -
> -				ldo16 {
> -					regulator-name = "nvvdd_ldo16,vdd_dbrtr";
> -					regulator-min-microvolt = <1300000>;
> -					regulator-max-microvolt = <1300000>;
> -				};
> -
> -				ldo17 {
> -					regulator-name = "nvvdd_ldo17,vddio_mipi";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo18 {
> -					regulator-name = "nvvdd_ldo18,vddio_vi,vcore_cam*";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> -
> -				ldo19 {
> -					regulator-name = "nvvdd_ldo19,avdd_lcd2,vddio_lx";
> -					regulator-min-microvolt = <2800000>;
> -					regulator-max-microvolt = <2800000>;
> -				};
> -
> -				ldo20 {
> -					regulator-name = "nvvdd_ldo20,vddio_ddr_1v2,vddio_hsic,vcom_1v2";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				out5v {
> -					regulator-name = "usb0_vbus_reg";
> -				};
> -
> -				out33v {
> -					regulator-name = "pmu_out3v3";
> -				};
> -
> -				bbat {
> -					regulator-name = "pmu_bbat";
> -					regulator-min-microvolt = <2400000>;
> -					regulator-max-microvolt = <2400000>;
> -					regulator-always-on;
> -				};
> -
> -				sdby {
> -					regulator-name = "vdd_aon";
> -					regulator-always-on;
> -				};
> -
> -				vrtc {
> -					regulator-name = "vrtc,pmu_vccadc";
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -	};
> -
> -	pmc {
> -		nvidia,invert-interrupt;
> -	};
> -
> -	usb@c5000000 {
> -		status = "okay";
> -		nvidia,vbus-gpio = <&tca6416 0 0>; /* GPIO_PMU0 */
> -	};
> -
> -	usb@c5008000 {
> -		status = "okay";
> -		nvidia,vbus-gpio = <&tca6416 1 0>; /* GPIO_PMU1 */
> -	};
> -
> -	sdhci@c8000400 {
> -		status = "okay";
> -		wp-gpios = <&gpio 173 0>; /* gpio PV5 */
> -		bus-width = <8>;
> -	};
> -
> -	sdhci@c8000600 {
> -		status = "okay";
> -		bus-width = <8>;
> -	};
> -
> -	kbc {
> -		status = "okay";
> -		nvidia,debounce-delay-ms = <20>;
> -		nvidia,repeat-delay-ms = <160>;
> -		nvidia,kbc-row-pins = <0 1 2>;
> -		nvidia,kbc-col-pins = <16 17>;
> -		linux,keymap = <0x00000074	/* KEY_POWER */
> -				0x01000066	/* KEY_HOME */
> -				0x0101009E	/* KEY_BACK */
> -				0x0201008B>;	/* KEY_MENU */
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		usb0_vbus_reg: regulator {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "usb0_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-wm8753-whistler",
> -			     "nvidia,tegra-audio-wm8753";
> -		nvidia,model = "NVIDIA Tegra Whistler";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "LOUT1",
> -			"Headphone Jack", "ROUT1",
> -			"MIC2", "Mic Jack",
> -			"MIC2N", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&codec>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20-whistler.dtsp b/arch/arm/boot/dts/tegra20-whistler.dtsp
> new file mode 100644
> index 0000000..ee24daa
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20-whistler.dtsp
> @@ -0,0 +1,563 @@
> +/dts-v1/;
> +
> +#include "tegra20.dtsip"
> +
> +/ {
> +	model = "NVIDIA Tegra20 Whistler evaluation board";
> +	compatible = "nvidia,whistler", "nvidia,tegra20";
> +
> +	memory {
> +		reg = <0x00000000 0x20000000>;
> +	};
> +
> +	host1x {
> +		hdmi {
> +			status = "okay";
> +
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			ata {
> +				nvidia,pins = "ata", "atb", "ate", "gma", "gmb",
> +					"gmc", "gmd", "gpu";
> +				nvidia,function = "gmi";
> +			};
> +			atc {
> +				nvidia,pins = "atc", "atd";
> +				nvidia,function = "sdio4";
> +			};
> +			cdev1 {
> +				nvidia,pins = "cdev1";
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,pins = "cdev2";
> +				nvidia,function = "osc";
> +			};
> +			crtp {
> +				nvidia,pins = "crtp";
> +				nvidia,function = "crt";
> +			};
> +			csus {
> +				nvidia,pins = "csus";
> +				nvidia,function = "vi_sensor_clk";
> +			};
> +			dap1 {
> +				nvidia,pins = "dap1";
> +				nvidia,function = "dap1";
> +			};
> +			dap2 {
> +				nvidia,pins = "dap2";
> +				nvidia,function = "dap2";
> +			};
> +			dap3 {
> +				nvidia,pins = "dap3";
> +				nvidia,function = "dap3";
> +			};
> +			dap4 {
> +				nvidia,pins = "dap4";
> +				nvidia,function = "dap4";
> +			};
> +			ddc {
> +				nvidia,pins = "ddc";
> +				nvidia,function = "i2c2";
> +			};
> +			dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd";
> +				nvidia,function = "vi";
> +			};
> +			dte {
> +				nvidia,pins = "dte";
> +				nvidia,function = "rsvd1";
> +			};
> +			dtf {
> +				nvidia,pins = "dtf";
> +				nvidia,function = "i2c3";
> +			};
> +			gme {
> +				nvidia,pins = "gme";
> +				nvidia,function = "dap5";
> +			};
> +			gpu7 {
> +				nvidia,pins = "gpu7";
> +				nvidia,function = "rtck";
> +			};
> +			gpv {
> +				nvidia,pins = "gpv";
> +				nvidia,function = "pcie";
> +			};
> +			hdint {
> +				nvidia,pins = "hdint", "pta";
> +				nvidia,function = "hdmi";
> +			};
> +			i2cp {
> +				nvidia,pins = "i2cp";
> +				nvidia,function = "i2cp";
> +			};
> +			irrx {
> +				nvidia,pins = "irrx", "irtx";
> +				nvidia,function = "uartb";
> +			};
> +			kbca {
> +				nvidia,pins = "kbca", "kbcc", "kbce", "kbcf";
> +				nvidia,function = "kbc";
> +			};
> +			kbcb {
> +				nvidia,pins = "kbcb", "kbcd";
> +				nvidia,function = "sdio2";
> +			};
> +			lcsn {
> +				nvidia,pins = "lcsn", "lsck", "lsda", "lsdi",
> +					"spia", "spib", "spic";
> +				nvidia,function = "spi3";
> +			};
> +			ld0 {
> +				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
> +					"ld5", "ld6", "ld7", "ld8", "ld9",
> +					"ld10", "ld11", "ld12", "ld13", "ld14",
> +					"ld15", "ld16", "ld17", "ldc", "ldi",
> +					"lhp0", "lhp1", "lhp2", "lhs", "lm0",
> +					"lm1", "lpp", "lpw0", "lpw1", "lpw2",
> +					"lsc0", "lsc1", "lspi", "lvp0", "lvp1",
> +					"lvs";
> +				nvidia,function = "displaya";
> +			};
> +			owc {
> +				nvidia,pins = "owc", "uac";
> +				nvidia,function = "owr";
> +			};
> +			pmc {
> +				nvidia,pins = "pmc";
> +				nvidia,function = "pwr_on";
> +			};
> +			rm {
> +				nvidia,pins = "rm";
> +				nvidia,function = "i2c1";
> +			};
> +			sdb {
> +				nvidia,pins = "sdb", "sdc", "sdd", "slxa",
> +					"slxc", "slxd", "slxk";
> +				nvidia,function = "sdio3";
> +			};
> +			sdio1 {
> +				nvidia,pins = "sdio1";
> +				nvidia,function = "sdio1";
> +			};
> +			spdi {
> +				nvidia,pins = "spdi", "spdo";
> +				nvidia,function = "rsvd2";
> +			};
> +			spid {
> +				nvidia,pins = "spid", "spie", "spig", "spih";
> +				nvidia,function = "spi2_alt";
> +			};
> +			spif {
> +				nvidia,pins = "spif";
> +				nvidia,function = "spi2";
> +			};
> +			uaa {
> +				nvidia,pins = "uaa", "uab";
> +				nvidia,function = "uarta";
> +			};
> +			uad {
> +				nvidia,pins = "uad";
> +				nvidia,function = "irda";
> +			};
> +			uca {
> +				nvidia,pins = "uca", "ucb";
> +				nvidia,function = "uartc";
> +			};
> +			uda {
> +				nvidia,pins = "uda";
> +				nvidia,function = "spi1";
> +			};
> +			conf_ata {
> +				nvidia,pins = "ata", "atb", "atc", "ddc", "gma",
> +					"gmb", "gmc", "gmd", "irrx", "irtx",
> +					"kbca", "kbcb", "kbcc", "kbcd", "kbce",
> +					"kbcf", "sdc", "sdd", "spie", "spig",
> +					"spih", "uaa", "uab", "uad", "uca",
> +					"ucb";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_atd {
> +				nvidia,pins = "atd", "ate", "cdev1", "csus",
> +					"dap1", "dap2", "dap3", "dap4", "dte",
> +					"dtf", "gpu", "gpu7", "gpv", "i2cp",
> +					"rm", "sdio1", "slxa", "slxc", "slxd",
> +					"slxk", "spdi", "spdo", "uac", "uda";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_cdev2 {
> +				nvidia,pins = "cdev2", "spia", "spib";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ck32 {
> +				nvidia,pins = "ck32", "ddrc", "lc", "pmca",
> +					"pmcb", "pmcc", "pmcd", "xm2c",
> +					"xm2d";
> +				nvidia,pull = <0>;
> +			};
> +			conf_crtp {
> +				nvidia,pins = "crtp";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_dta {
> +				nvidia,pins = "dta", "dtb", "dtc", "dtd",
> +					"spid", "spif";
> +				nvidia,pull = <1>;
> +				nvidia,tristate = <0>;
> +			};
> +			conf_gme {
> +				nvidia,pins = "gme", "owc", "pta", "spic";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <1>;
> +			};
> +			conf_ld17_0 {
> +				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
> +					"ld23_22";
> +				nvidia,pull = <1>;
> +			};
> +			conf_ls {
> +				nvidia,pins = "ls", "pmce";
> +				nvidia,pull = <2>;
> +			};
> +			drive_dap1 {
> +				nvidia,pins = "drive_dap1";
> +				nvidia,high-speed-mode = <0>;
> +				nvidia,schmitt = <1>;
> +				nvidia,low-power-mode = <0>;
> +				nvidia,pull-down-strength = <0>;
> +				nvidia,pull-up-strength = <0>;
> +				nvidia,slew-rate-rising = <0>;
> +				nvidia,slew-rate-falling = <0>;
> +			};
> +		};
> +	};
> +
> +	i2s@70002800 {
> +		status = "okay";
> +	};
> +
> +	serial@70006000 {
> +		status = "okay";
> +	};
> +
> +	hdmi_ddc: i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +
> +		codec: codec@1a {
> +			compatible = "wlf,wm8753";
> +			reg = <0x1a>;
> +		};
> +
> +		tca6416: gpio@20 {
> +			compatible = "ti,tca6416";
> +			reg = <0x20>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		max8907@3c {
> +			compatible = "maxim,max8907";
> +			reg = <0x3c>;
> +			interrupts = <0 86 0x4>;
> +
> +			maxim,system-power-controller;
> +
> +			mbatt-supply = <&usb0_vbus_reg>;
> +			in-v1-supply = <&mbatt_reg>;
> +			in-v2-supply = <&mbatt_reg>;
> +			in-v3-supply = <&mbatt_reg>;
> +			in1-supply = <&mbatt_reg>;
> +			in2-supply = <&nvvdd_sv3_reg>;
> +			in3-supply = <&mbatt_reg>;
> +			in4-supply = <&mbatt_reg>;
> +			in5-supply = <&mbatt_reg>;
> +			in6-supply = <&mbatt_reg>;
> +			in7-supply = <&mbatt_reg>;
> +			in8-supply = <&mbatt_reg>;
> +			in9-supply = <&mbatt_reg>;
> +			in10-supply = <&mbatt_reg>;
> +			in11-supply = <&mbatt_reg>;
> +			in12-supply = <&mbatt_reg>;
> +			in13-supply = <&mbatt_reg>;
> +			in14-supply = <&mbatt_reg>;
> +			in15-supply = <&mbatt_reg>;
> +			in16-supply = <&mbatt_reg>;
> +			in17-supply = <&nvvdd_sv3_reg>;
> +			in18-supply = <&nvvdd_sv3_reg>;
> +			in19-supply = <&mbatt_reg>;
> +			in20-supply = <&mbatt_reg>;
> +
> +			regulators {
> +				mbatt_reg: mbatt {
> +					regulator-name = "vbat_pmu";
> +					regulator-always-on;
> +				};
> +
> +				sd1 {
> +					regulator-name = "nvvdd_sv1,vdd_cpu_pmu";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +
> +				sd2 {
> +					regulator-name = "nvvdd_sv2,vdd_core";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				nvvdd_sv3_reg: sd3 {
> +					regulator-name = "nvvdd_sv3";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo1 {
> +					regulator-name = "nvvdd_ldo1,vddio_rx_ddr,vcore_acc";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo2 {
> +					regulator-name = "nvvdd_ldo2,avdd_pll*";
> +					regulator-min-microvolt = <1100000>;
> +					regulator-max-microvolt = <1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo3 {
> +					regulator-name = "nvvdd_ldo3,vcom_1v8b";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo4 {
> +					regulator-name = "nvvdd_ldo4,avdd_usb*";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5 {
> +					regulator-name = "nvvdd_ldo5,vcore_mmc,avdd_lcd1,vddio_1wire";
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +					regulator-always-on;
> +				};
> +
> +				hdmi_pll_reg: ldo6 {
> +					regulator-name = "nvvdd_ldo6,avdd_hdmi_pll";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				ldo7 {
> +					regulator-name = "nvvdd_ldo7,avddio_audio";
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo8 {
> +					regulator-name = "nvvdd_ldo8,vcom_3v0,vcore_cmps";
> +					regulator-min-microvolt = <3000000>;
> +					regulator-max-microvolt = <3000000>;
> +				};
> +
> +				ldo9 {
> +					regulator-name = "nvvdd_ldo9,avdd_cam*";
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +				};
> +
> +				ldo10 {
> +					regulator-name = "nvvdd_ldo10,avdd_usb_ic_3v0";
> +					regulator-min-microvolt = <3000000>;
> +					regulator-max-microvolt = <3000000>;
> +					regulator-always-on;
> +				};
> +
> +				hdmi_vdd_reg: ldo11 {
> +					regulator-name = "nvvdd_ldo11,vddio_pex_clk,vcom_33,avdd_hdmi";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				ldo12 {
> +					regulator-name = "nvvdd_ldo12,vddio_sdio";
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo13 {
> +					regulator-name = "nvvdd_ldo13,vcore_phtn,vdd_af";
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +				};
> +
> +				ldo14 {
> +					regulator-name = "nvvdd_ldo14,avdd_vdac";
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +				};
> +
> +				ldo15 {
> +					regulator-name = "nvvdd_ldo15,vcore_temp,vddio_hdcp";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +				};
> +
> +				ldo16 {
> +					regulator-name = "nvvdd_ldo16,vdd_dbrtr";
> +					regulator-min-microvolt = <1300000>;
> +					regulator-max-microvolt = <1300000>;
> +				};
> +
> +				ldo17 {
> +					regulator-name = "nvvdd_ldo17,vddio_mipi";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo18 {
> +					regulator-name = "nvvdd_ldo18,vddio_vi,vcore_cam*";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +				};
> +
> +				ldo19 {
> +					regulator-name = "nvvdd_ldo19,avdd_lcd2,vddio_lx";
> +					regulator-min-microvolt = <2800000>;
> +					regulator-max-microvolt = <2800000>;
> +				};
> +
> +				ldo20 {
> +					regulator-name = "nvvdd_ldo20,vddio_ddr_1v2,vddio_hsic,vcom_1v2";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				out5v {
> +					regulator-name = "usb0_vbus_reg";
> +				};
> +
> +				out33v {
> +					regulator-name = "pmu_out3v3";
> +				};
> +
> +				bbat {
> +					regulator-name = "pmu_bbat";
> +					regulator-min-microvolt = <2400000>;
> +					regulator-max-microvolt = <2400000>;
> +					regulator-always-on;
> +				};
> +
> +				sdby {
> +					regulator-name = "vdd_aon";
> +					regulator-always-on;
> +				};
> +
> +				vrtc {
> +					regulator-name = "vrtc,pmu_vccadc";
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +	};
> +
> +	pmc {
> +		nvidia,invert-interrupt;
> +	};
> +
> +	usb@c5000000 {
> +		status = "okay";
> +		nvidia,vbus-gpio = <&tca6416 0 0>; /* GPIO_PMU0 */
> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
> +		nvidia,vbus-gpio = <&tca6416 1 0>; /* GPIO_PMU1 */
> +	};
> +
> +	sdhci@c8000400 {
> +		status = "okay";
> +		wp-gpios = <&gpio 173 0>; /* gpio PV5 */
> +		bus-width = <8>;
> +	};
> +
> +	sdhci@c8000600 {
> +		status = "okay";
> +		bus-width = <8>;
> +	};
> +
> +	kbc {
> +		status = "okay";
> +		nvidia,debounce-delay-ms = <20>;
> +		nvidia,repeat-delay-ms = <160>;
> +		nvidia,kbc-row-pins = <0 1 2>;
> +		nvidia,kbc-col-pins = <16 17>;
> +		linux,keymap = <0x00000074	/* KEY_POWER */
> +				0x01000066	/* KEY_HOME */
> +				0x0101009E	/* KEY_BACK */
> +				0x0201008B>;	/* KEY_MENU */
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usb0_vbus_reg: regulator {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "usb0_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-wm8753-whistler",
> +			     "nvidia,tegra-audio-wm8753";
> +		nvidia,model = "NVIDIA Tegra Whistler";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "LOUT1",
> +			"Headphone Jack", "ROUT1",
> +			"MIC2", "Mic Jack",
> +			"MIC2N", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&codec>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> deleted file mode 100644
> index 5916c93..0000000
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ /dev/null
> @@ -1,556 +0,0 @@
> -/include/ "skeleton.dtsi"
> -
> -/ {
> -	compatible = "nvidia,tegra20";
> -	interrupt-parent = <&intc>;
> -
> -	aliases {
> -		serial0 = &uarta;
> -		serial1 = &uartb;
> -		serial2 = &uartc;
> -		serial3 = &uartd;
> -		serial4 = &uarte;
> -	};
> -
> -	host1x {
> -		compatible = "nvidia,tegra20-host1x", "simple-bus";
> -		reg = <0x50000000 0x00024000>;
> -		interrupts = <0 65 0x04   /* mpcore syncpt */
> -			      0 67 0x04>; /* mpcore general */
> -		clocks = <&tegra_car 28>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		ranges = <0x54000000 0x54000000 0x04000000>;
> -
> -		mpe {
> -			compatible = "nvidia,tegra20-mpe";
> -			reg = <0x54040000 0x00040000>;
> -			interrupts = <0 68 0x04>;
> -			clocks = <&tegra_car 60>;
> -		};
> -
> -		vi {
> -			compatible = "nvidia,tegra20-vi";
> -			reg = <0x54080000 0x00040000>;
> -			interrupts = <0 69 0x04>;
> -			clocks = <&tegra_car 100>;
> -		};
> -
> -		epp {
> -			compatible = "nvidia,tegra20-epp";
> -			reg = <0x540c0000 0x00040000>;
> -			interrupts = <0 70 0x04>;
> -			clocks = <&tegra_car 19>;
> -		};
> -
> -		isp {
> -			compatible = "nvidia,tegra20-isp";
> -			reg = <0x54100000 0x00040000>;
> -			interrupts = <0 71 0x04>;
> -			clocks = <&tegra_car 23>;
> -		};
> -
> -		gr2d {
> -			compatible = "nvidia,tegra20-gr2d";
> -			reg = <0x54140000 0x00040000>;
> -			interrupts = <0 72 0x04>;
> -			clocks = <&tegra_car 21>;
> -		};
> -
> -		gr3d {
> -			compatible = "nvidia,tegra20-gr3d";
> -			reg = <0x54180000 0x00040000>;
> -			clocks = <&tegra_car 24>;
> -		};
> -
> -		dc@54200000 {
> -			compatible = "nvidia,tegra20-dc";
> -			reg = <0x54200000 0x00040000>;
> -			interrupts = <0 73 0x04>;
> -			clocks = <&tegra_car 27>, <&tegra_car 121>;
> -			clock-names = "disp1", "parent";
> -
> -			rgb {
> -				status = "disabled";
> -			};
> -		};
> -
> -		dc@54240000 {
> -			compatible = "nvidia,tegra20-dc";
> -			reg = <0x54240000 0x00040000>;
> -			interrupts = <0 74 0x04>;
> -			clocks = <&tegra_car 26>, <&tegra_car 121>;
> -			clock-names = "disp2", "parent";
> -
> -			rgb {
> -				status = "disabled";
> -			};
> -		};
> -
> -		hdmi {
> -			compatible = "nvidia,tegra20-hdmi";
> -			reg = <0x54280000 0x00040000>;
> -			interrupts = <0 75 0x04>;
> -			clocks = <&tegra_car 51>, <&tegra_car 117>;
> -			clock-names = "hdmi", "parent";
> -			status = "disabled";
> -		};
> -
> -		tvo {
> -			compatible = "nvidia,tegra20-tvo";
> -			reg = <0x542c0000 0x00040000>;
> -			interrupts = <0 76 0x04>;
> -			clocks = <&tegra_car 102>;
> -			status = "disabled";
> -		};
> -
> -		dsi {
> -			compatible = "nvidia,tegra20-dsi";
> -			reg = <0x54300000 0x00040000>;
> -			clocks = <&tegra_car 48>;
> -			status = "disabled";
> -		};
> -	};
> -
> -	timer@50004600 {
> -		compatible = "arm,cortex-a9-twd-timer";
> -		reg = <0x50040600 0x20>;
> -		interrupts = <1 13 0x304>;
> -	};
> -
> -	intc: interrupt-controller {
> -		compatible = "arm,cortex-a9-gic";
> -		reg = <0x50041000 0x1000
> -		       0x50040100 0x0100>;
> -		interrupt-controller;
> -		#interrupt-cells = <3>;
> -	};
> -
> -	cache-controller {
> -		compatible = "arm,pl310-cache";
> -		reg = <0x50043000 0x1000>;
> -		arm,data-latency = <5 5 2>;
> -		arm,tag-latency = <4 4 2>;
> -		cache-unified;
> -		cache-level = <2>;
> -	};
> -
> -	timer@60005000 {
> -		compatible = "nvidia,tegra20-timer";
> -		reg = <0x60005000 0x60>;
> -		interrupts = <0 0 0x04
> -			      0 1 0x04
> -			      0 41 0x04
> -			      0 42 0x04>;
> -	};
> -
> -	tegra_car: clock {
> -		compatible = "nvidia,tegra20-car";
> -		reg = <0x60006000 0x1000>;
> -		#clock-cells = <1>;
> -	};
> -
> -	apbdma: dma {
> -		compatible = "nvidia,tegra20-apbdma";
> -		reg = <0x6000a000 0x1200>;
> -		interrupts = <0 104 0x04
> -			      0 105 0x04
> -			      0 106 0x04
> -			      0 107 0x04
> -			      0 108 0x04
> -			      0 109 0x04
> -			      0 110 0x04
> -			      0 111 0x04
> -			      0 112 0x04
> -			      0 113 0x04
> -			      0 114 0x04
> -			      0 115 0x04
> -			      0 116 0x04
> -			      0 117 0x04
> -			      0 118 0x04
> -			      0 119 0x04>;
> -		clocks = <&tegra_car 34>;
> -	};
> -
> -	ahb {
> -		compatible = "nvidia,tegra20-ahb";
> -		reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
> -	};
> -
> -	gpio: gpio {
> -		compatible = "nvidia,tegra20-gpio";
> -		reg = <0x6000d000 0x1000>;
> -		interrupts = <0 32 0x04
> -			      0 33 0x04
> -			      0 34 0x04
> -			      0 35 0x04
> -			      0 55 0x04
> -			      0 87 0x04
> -			      0 89 0x04>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		#interrupt-cells = <2>;
> -		interrupt-controller;
> -	};
> -
> -	pinmux: pinmux {
> -		compatible = "nvidia,tegra20-pinmux";
> -		reg = <0x70000014 0x10   /* Tri-state registers */
> -		       0x70000080 0x20   /* Mux registers */
> -		       0x700000a0 0x14   /* Pull-up/down registers */
> -		       0x70000868 0xa8>; /* Pad control registers */
> -	};
> -
> -	das {
> -		compatible = "nvidia,tegra20-das";
> -		reg = <0x70000c00 0x80>;
> -	};
> -
> -	tegra_ac97: ac97 {
> -		compatible = "nvidia,tegra20-ac97";
> -		reg = <0x70002000 0x200>;
> -		interrupts = <0 81 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 12>;
> -		clocks = <&tegra_car 3>;
> -		status = "disabled";
> -	};
> -
> -	tegra_i2s1: i2s@70002800 {
> -		compatible = "nvidia,tegra20-i2s";
> -		reg = <0x70002800 0x200>;
> -		interrupts = <0 13 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 2>;
> -		clocks = <&tegra_car 11>;
> -		status = "disabled";
> -	};
> -
> -	tegra_i2s2: i2s@70002a00 {
> -		compatible = "nvidia,tegra20-i2s";
> -		reg = <0x70002a00 0x200>;
> -		interrupts = <0 3 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 1>;
> -		clocks = <&tegra_car 18>;
> -		status = "disabled";
> -	};
> -
> -	/*
> -	 * There are two serial driver i.e. 8250 based simple serial
> -	 * driver and APB DMA based serial driver for higher baudrate
> -	 * and performace. To enable the 8250 based driver, the compatible
> -	 * is "nvidia,tegra20-uart" and to enable the APB DMA based serial
> -	 * driver, the comptible is "nvidia,tegra20-hsuart".
> -	 */
> -	uarta: serial@70006000 {
> -		compatible = "nvidia,tegra20-uart";
> -		reg = <0x70006000 0x40>;
> -		reg-shift = <2>;
> -		interrupts = <0 36 0x04>;
> -		clock-frequency = <216000000>;
> -		nvidia,dma-request-selector = <&apbdma 8>;
> -		clocks = <&tegra_car 6>;
> -		status = "disabled";
> -	};
> -
> -	uartb: serial@70006040 {
> -		compatible = "nvidia,tegra20-uart";
> -		reg = <0x70006040 0x40>;
> -		reg-shift = <2>;
> -		interrupts = <0 37 0x04>;
> -		clock-frequency = <216000000>;
> -		nvidia,dma-request-selector = <&apbdma 9>;
> -		clocks = <&tegra_car 96>;
> -		status = "disabled";
> -	};
> -
> -	uartc: serial@70006200 {
> -		compatible = "nvidia,tegra20-uart";
> -		reg = <0x70006200 0x100>;
> -		reg-shift = <2>;
> -		interrupts = <0 46 0x04>;
> -		clock-frequency = <216000000>;
> -		nvidia,dma-request-selector = <&apbdma 10>;
> -		clocks = <&tegra_car 55>;
> -		status = "disabled";
> -	};
> -
> -	uartd: serial@70006300 {
> -		compatible = "nvidia,tegra20-uart";
> -		reg = <0x70006300 0x100>;
> -		reg-shift = <2>;
> -		interrupts = <0 90 0x04>;
> -		clock-frequency = <216000000>;
> -		nvidia,dma-request-selector = <&apbdma 19>;
> -		clocks = <&tegra_car 65>;
> -		status = "disabled";
> -	};
> -
> -	uarte: serial@70006400 {
> -		compatible = "nvidia,tegra20-uart";
> -		reg = <0x70006400 0x100>;
> -		reg-shift = <2>;
> -		interrupts = <0 91 0x04>;
> -		clock-frequency = <216000000>;
> -		nvidia,dma-request-selector = <&apbdma 20>;
> -		clocks = <&tegra_car 66>;
> -		status = "disabled";
> -	};
> -
> -	pwm: pwm {
> -		compatible = "nvidia,tegra20-pwm";
> -		reg = <0x7000a000 0x100>;
> -		#pwm-cells = <2>;
> -		clocks = <&tegra_car 17>;
> -	};
> -
> -	rtc {
> -		compatible = "nvidia,tegra20-rtc";
> -		reg = <0x7000e000 0x100>;
> -		interrupts = <0 2 0x04>;
> -	};
> -
> -	i2c@7000c000 {
> -		compatible = "nvidia,tegra20-i2c";
> -		reg = <0x7000c000 0x100>;
> -		interrupts = <0 38 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 12>, <&tegra_car 124>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	spi@7000c380 {
> -		compatible = "nvidia,tegra20-sflash";
> -		reg = <0x7000c380 0x80>;
> -		interrupts = <0 39 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 11>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 43>;
> -		status = "disabled";
> -	};
> -
> -	i2c@7000c400 {
> -		compatible = "nvidia,tegra20-i2c";
> -		reg = <0x7000c400 0x100>;
> -		interrupts = <0 84 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 54>, <&tegra_car 124>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	i2c@7000c500 {
> -		compatible = "nvidia,tegra20-i2c";
> -		reg = <0x7000c500 0x100>;
> -		interrupts = <0 92 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 67>, <&tegra_car 124>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	i2c@7000d000 {
> -		compatible = "nvidia,tegra20-i2c-dvc";
> -		reg = <0x7000d000 0x200>;
> -		interrupts = <0 53 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 47>, <&tegra_car 124>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	spi@7000d400 {
> -		compatible = "nvidia,tegra20-slink";
> -		reg = <0x7000d400 0x200>;
> -		interrupts = <0 59 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 15>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 41>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000d600 {
> -		compatible = "nvidia,tegra20-slink";
> -		reg = <0x7000d600 0x200>;
> -		interrupts = <0 82 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 16>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 44>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000d800 {
> -		compatible = "nvidia,tegra20-slink";
> -		reg = <0x7000d480 0x200>;
> -		interrupts = <0 83 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 17>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 46>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000da00 {
> -		compatible = "nvidia,tegra20-slink";
> -		reg = <0x7000da00 0x200>;
> -		interrupts = <0 93 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 18>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 68>;
> -		status = "disabled";
> -	};
> -
> -	kbc {
> -		compatible = "nvidia,tegra20-kbc";
> -		reg = <0x7000e200 0x100>;
> -		interrupts = <0 85 0x04>;
> -		clocks = <&tegra_car 36>;
> -		status = "disabled";
> -	};
> -
> -	pmc {
> -		compatible = "nvidia,tegra20-pmc";
> -		reg = <0x7000e400 0x400>;
> -	};
> -
> -	memory-controller@7000f000 {
> -		compatible = "nvidia,tegra20-mc";
> -		reg = <0x7000f000 0x024
> -		       0x7000f03c 0x3c4>;
> -		interrupts = <0 77 0x04>;
> -	};
> -
> -	iommu {
> -		compatible = "nvidia,tegra20-gart";
> -		reg = <0x7000f024 0x00000018	/* controller registers */
> -		       0x58000000 0x02000000>;	/* GART aperture */
> -	};
> -
> -	memory-controller@7000f400 {
> -		compatible = "nvidia,tegra20-emc";
> -		reg = <0x7000f400 0x200>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -
> -	usb@c5000000 {
> -		compatible = "nvidia,tegra20-ehci", "usb-ehci";
> -		reg = <0xc5000000 0x4000>;
> -		interrupts = <0 20 0x04>;
> -		phy_type = "utmi";
> -		nvidia,has-legacy-mode;
> -		clocks = <&tegra_car 22>;
> -		nvidia,needs-double-reset;
> -		nvidia,phy = <&phy1>;
> -		status = "disabled";
> -	};
> -
> -	phy1: usb-phy@c5000400 {
> -		compatible = "nvidia,tegra20-usb-phy";
> -		reg = <0xc5000400 0x3c00>;
> -		phy_type = "utmi";
> -		nvidia,has-legacy-mode;
> -		clocks = <&tegra_car 22>, <&tegra_car 127>;
> -		clock-names = "phy", "pll_u";
> -	};
> -
> -	usb@c5004000 {
> -		compatible = "nvidia,tegra20-ehci", "usb-ehci";
> -		reg = <0xc5004000 0x4000>;
> -		interrupts = <0 21 0x04>;
> -		phy_type = "ulpi";
> -		clocks = <&tegra_car 58>;
> -		nvidia,phy = <&phy2>;
> -		status = "disabled";
> -	};
> -
> -	phy2: usb-phy@c5004400 {
> -		compatible = "nvidia,tegra20-usb-phy";
> -		reg = <0xc5004400 0x3c00>;
> -		phy_type = "ulpi";
> -		clocks = <&tegra_car 94>, <&tegra_car 127>;
> -		clock-names = "phy", "pll_u";
> -	};
> -
> -	usb@c5008000 {
> -		compatible = "nvidia,tegra20-ehci", "usb-ehci";
> -		reg = <0xc5008000 0x4000>;
> -		interrupts = <0 97 0x04>;
> -		phy_type = "utmi";
> -		clocks = <&tegra_car 59>;
> -		nvidia,phy = <&phy3>;
> -		status = "disabled";
> -	};
> -
> -	phy3: usb-phy@c5008400 {
> -		compatible = "nvidia,tegra20-usb-phy";
> -		reg = <0xc5008400 0x3c00>;
> -		phy_type = "utmi";
> -		clocks = <&tegra_car 22>, <&tegra_car 127>;
> -		clock-names = "phy", "pll_u";
> -	};
> -
> -	sdhci@c8000000 {
> -		compatible = "nvidia,tegra20-sdhci";
> -		reg = <0xc8000000 0x200>;
> -		interrupts = <0 14 0x04>;
> -		clocks = <&tegra_car 14>;
> -		status = "disabled";
> -	};
> -
> -	sdhci@c8000200 {
> -		compatible = "nvidia,tegra20-sdhci";
> -		reg = <0xc8000200 0x200>;
> -		interrupts = <0 15 0x04>;
> -		clocks = <&tegra_car 9>;
> -		status = "disabled";
> -	};
> -
> -	sdhci@c8000400 {
> -		compatible = "nvidia,tegra20-sdhci";
> -		reg = <0xc8000400 0x200>;
> -		interrupts = <0 19 0x04>;
> -		clocks = <&tegra_car 69>;
> -		status = "disabled";
> -	};
> -
> -	sdhci@c8000600 {
> -		compatible = "nvidia,tegra20-sdhci";
> -		reg = <0xc8000600 0x200>;
> -		interrupts = <0 31 0x04>;
> -		clocks = <&tegra_car 15>;
> -		status = "disabled";
> -	};
> -
> -	cpus {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		cpu@0 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <0>;
> -		};
> -
> -		cpu@1 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <1>;
> -		};
> -	};
> -
> -	pmu {
> -		compatible = "arm,cortex-a9-pmu";
> -		interrupts = <0 56 0x04
> -			      0 57 0x04>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra20.dtsip b/arch/arm/boot/dts/tegra20.dtsip
> new file mode 100644
> index 0000000..917edd4
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra20.dtsip
> @@ -0,0 +1,556 @@
> +#include "skeleton.dtsi"
> +
> +/ {
> +	compatible = "nvidia,tegra20";
> +	interrupt-parent = <&intc>;
> +
> +	aliases {
> +		serial0 = &uarta;
> +		serial1 = &uartb;
> +		serial2 = &uartc;
> +		serial3 = &uartd;
> +		serial4 = &uarte;
> +	};
> +
> +	host1x {
> +		compatible = "nvidia,tegra20-host1x", "simple-bus";
> +		reg = <0x50000000 0x00024000>;
> +		interrupts = <0 65 0x04   /* mpcore syncpt */
> +			      0 67 0x04>; /* mpcore general */
> +		clocks = <&tegra_car 28>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		ranges = <0x54000000 0x54000000 0x04000000>;
> +
> +		mpe {
> +			compatible = "nvidia,tegra20-mpe";
> +			reg = <0x54040000 0x00040000>;
> +			interrupts = <0 68 0x04>;
> +			clocks = <&tegra_car 60>;
> +		};
> +
> +		vi {
> +			compatible = "nvidia,tegra20-vi";
> +			reg = <0x54080000 0x00040000>;
> +			interrupts = <0 69 0x04>;
> +			clocks = <&tegra_car 100>;
> +		};
> +
> +		epp {
> +			compatible = "nvidia,tegra20-epp";
> +			reg = <0x540c0000 0x00040000>;
> +			interrupts = <0 70 0x04>;
> +			clocks = <&tegra_car 19>;
> +		};
> +
> +		isp {
> +			compatible = "nvidia,tegra20-isp";
> +			reg = <0x54100000 0x00040000>;
> +			interrupts = <0 71 0x04>;
> +			clocks = <&tegra_car 23>;
> +		};
> +
> +		gr2d {
> +			compatible = "nvidia,tegra20-gr2d";
> +			reg = <0x54140000 0x00040000>;
> +			interrupts = <0 72 0x04>;
> +			clocks = <&tegra_car 21>;
> +		};
> +
> +		gr3d {
> +			compatible = "nvidia,tegra20-gr3d";
> +			reg = <0x54180000 0x00040000>;
> +			clocks = <&tegra_car 24>;
> +		};
> +
> +		dc@54200000 {
> +			compatible = "nvidia,tegra20-dc";
> +			reg = <0x54200000 0x00040000>;
> +			interrupts = <0 73 0x04>;
> +			clocks = <&tegra_car 27>, <&tegra_car 121>;
> +			clock-names = "disp1", "parent";
> +
> +			rgb {
> +				status = "disabled";
> +			};
> +		};
> +
> +		dc@54240000 {
> +			compatible = "nvidia,tegra20-dc";
> +			reg = <0x54240000 0x00040000>;
> +			interrupts = <0 74 0x04>;
> +			clocks = <&tegra_car 26>, <&tegra_car 121>;
> +			clock-names = "disp2", "parent";
> +
> +			rgb {
> +				status = "disabled";
> +			};
> +		};
> +
> +		hdmi {
> +			compatible = "nvidia,tegra20-hdmi";
> +			reg = <0x54280000 0x00040000>;
> +			interrupts = <0 75 0x04>;
> +			clocks = <&tegra_car 51>, <&tegra_car 117>;
> +			clock-names = "hdmi", "parent";
> +			status = "disabled";
> +		};
> +
> +		tvo {
> +			compatible = "nvidia,tegra20-tvo";
> +			reg = <0x542c0000 0x00040000>;
> +			interrupts = <0 76 0x04>;
> +			clocks = <&tegra_car 102>;
> +			status = "disabled";
> +		};
> +
> +		dsi {
> +			compatible = "nvidia,tegra20-dsi";
> +			reg = <0x54300000 0x00040000>;
> +			clocks = <&tegra_car 48>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	timer@50004600 {
> +		compatible = "arm,cortex-a9-twd-timer";
> +		reg = <0x50040600 0x20>;
> +		interrupts = <1 13 0x304>;
> +	};
> +
> +	intc: interrupt-controller {
> +		compatible = "arm,cortex-a9-gic";
> +		reg = <0x50041000 0x1000
> +		       0x50040100 0x0100>;
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +	};
> +
> +	cache-controller {
> +		compatible = "arm,pl310-cache";
> +		reg = <0x50043000 0x1000>;
> +		arm,data-latency = <5 5 2>;
> +		arm,tag-latency = <4 4 2>;
> +		cache-unified;
> +		cache-level = <2>;
> +	};
> +
> +	timer@60005000 {
> +		compatible = "nvidia,tegra20-timer";
> +		reg = <0x60005000 0x60>;
> +		interrupts = <0 0 0x04
> +			      0 1 0x04
> +			      0 41 0x04
> +			      0 42 0x04>;
> +	};
> +
> +	tegra_car: clock {
> +		compatible = "nvidia,tegra20-car";
> +		reg = <0x60006000 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
> +	apbdma: dma {
> +		compatible = "nvidia,tegra20-apbdma";
> +		reg = <0x6000a000 0x1200>;
> +		interrupts = <0 104 0x04
> +			      0 105 0x04
> +			      0 106 0x04
> +			      0 107 0x04
> +			      0 108 0x04
> +			      0 109 0x04
> +			      0 110 0x04
> +			      0 111 0x04
> +			      0 112 0x04
> +			      0 113 0x04
> +			      0 114 0x04
> +			      0 115 0x04
> +			      0 116 0x04
> +			      0 117 0x04
> +			      0 118 0x04
> +			      0 119 0x04>;
> +		clocks = <&tegra_car 34>;
> +	};
> +
> +	ahb {
> +		compatible = "nvidia,tegra20-ahb";
> +		reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
> +	};
> +
> +	gpio: gpio {
> +		compatible = "nvidia,tegra20-gpio";
> +		reg = <0x6000d000 0x1000>;
> +		interrupts = <0 32 0x04
> +			      0 33 0x04
> +			      0 34 0x04
> +			      0 35 0x04
> +			      0 55 0x04
> +			      0 87 0x04
> +			      0 89 0x04>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +	};
> +
> +	pinmux: pinmux {
> +		compatible = "nvidia,tegra20-pinmux";
> +		reg = <0x70000014 0x10   /* Tri-state registers */
> +		       0x70000080 0x20   /* Mux registers */
> +		       0x700000a0 0x14   /* Pull-up/down registers */
> +		       0x70000868 0xa8>; /* Pad control registers */
> +	};
> +
> +	das {
> +		compatible = "nvidia,tegra20-das";
> +		reg = <0x70000c00 0x80>;
> +	};
> +
> +	tegra_ac97: ac97 {
> +		compatible = "nvidia,tegra20-ac97";
> +		reg = <0x70002000 0x200>;
> +		interrupts = <0 81 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 12>;
> +		clocks = <&tegra_car 3>;
> +		status = "disabled";
> +	};
> +
> +	tegra_i2s1: i2s@70002800 {
> +		compatible = "nvidia,tegra20-i2s";
> +		reg = <0x70002800 0x200>;
> +		interrupts = <0 13 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 2>;
> +		clocks = <&tegra_car 11>;
> +		status = "disabled";
> +	};
> +
> +	tegra_i2s2: i2s@70002a00 {
> +		compatible = "nvidia,tegra20-i2s";
> +		reg = <0x70002a00 0x200>;
> +		interrupts = <0 3 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 1>;
> +		clocks = <&tegra_car 18>;
> +		status = "disabled";
> +	};
> +
> +	/*
> +	 * There are two serial driver i.e. 8250 based simple serial
> +	 * driver and APB DMA based serial driver for higher baudrate
> +	 * and performace. To enable the 8250 based driver, the compatible
> +	 * is "nvidia,tegra20-uart" and to enable the APB DMA based serial
> +	 * driver, the comptible is "nvidia,tegra20-hsuart".
> +	 */
> +	uarta: serial@70006000 {
> +		compatible = "nvidia,tegra20-uart";
> +		reg = <0x70006000 0x40>;
> +		reg-shift = <2>;
> +		interrupts = <0 36 0x04>;
> +		clock-frequency = <216000000>;
> +		nvidia,dma-request-selector = <&apbdma 8>;
> +		clocks = <&tegra_car 6>;
> +		status = "disabled";
> +	};
> +
> +	uartb: serial@70006040 {
> +		compatible = "nvidia,tegra20-uart";
> +		reg = <0x70006040 0x40>;
> +		reg-shift = <2>;
> +		interrupts = <0 37 0x04>;
> +		clock-frequency = <216000000>;
> +		nvidia,dma-request-selector = <&apbdma 9>;
> +		clocks = <&tegra_car 96>;
> +		status = "disabled";
> +	};
> +
> +	uartc: serial@70006200 {
> +		compatible = "nvidia,tegra20-uart";
> +		reg = <0x70006200 0x100>;
> +		reg-shift = <2>;
> +		interrupts = <0 46 0x04>;
> +		clock-frequency = <216000000>;
> +		nvidia,dma-request-selector = <&apbdma 10>;
> +		clocks = <&tegra_car 55>;
> +		status = "disabled";
> +	};
> +
> +	uartd: serial@70006300 {
> +		compatible = "nvidia,tegra20-uart";
> +		reg = <0x70006300 0x100>;
> +		reg-shift = <2>;
> +		interrupts = <0 90 0x04>;
> +		clock-frequency = <216000000>;
> +		nvidia,dma-request-selector = <&apbdma 19>;
> +		clocks = <&tegra_car 65>;
> +		status = "disabled";
> +	};
> +
> +	uarte: serial@70006400 {
> +		compatible = "nvidia,tegra20-uart";
> +		reg = <0x70006400 0x100>;
> +		reg-shift = <2>;
> +		interrupts = <0 91 0x04>;
> +		clock-frequency = <216000000>;
> +		nvidia,dma-request-selector = <&apbdma 20>;
> +		clocks = <&tegra_car 66>;
> +		status = "disabled";
> +	};
> +
> +	pwm: pwm {
> +		compatible = "nvidia,tegra20-pwm";
> +		reg = <0x7000a000 0x100>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;
> +	};
> +
> +	rtc {
> +		compatible = "nvidia,tegra20-rtc";
> +		reg = <0x7000e000 0x100>;
> +		interrupts = <0 2 0x04>;
> +	};
> +
> +	i2c@7000c000 {
> +		compatible = "nvidia,tegra20-i2c";
> +		reg = <0x7000c000 0x100>;
> +		interrupts = <0 38 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 12>, <&tegra_car 124>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	spi@7000c380 {
> +		compatible = "nvidia,tegra20-sflash";
> +		reg = <0x7000c380 0x80>;
> +		interrupts = <0 39 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 11>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 43>;
> +		status = "disabled";
> +	};
> +
> +	i2c@7000c400 {
> +		compatible = "nvidia,tegra20-i2c";
> +		reg = <0x7000c400 0x100>;
> +		interrupts = <0 84 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 54>, <&tegra_car 124>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	i2c@7000c500 {
> +		compatible = "nvidia,tegra20-i2c";
> +		reg = <0x7000c500 0x100>;
> +		interrupts = <0 92 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 67>, <&tegra_car 124>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	i2c@7000d000 {
> +		compatible = "nvidia,tegra20-i2c-dvc";
> +		reg = <0x7000d000 0x200>;
> +		interrupts = <0 53 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 47>, <&tegra_car 124>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	spi@7000d400 {
> +		compatible = "nvidia,tegra20-slink";
> +		reg = <0x7000d400 0x200>;
> +		interrupts = <0 59 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 15>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 41>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000d600 {
> +		compatible = "nvidia,tegra20-slink";
> +		reg = <0x7000d600 0x200>;
> +		interrupts = <0 82 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 16>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 44>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000d800 {
> +		compatible = "nvidia,tegra20-slink";
> +		reg = <0x7000d480 0x200>;
> +		interrupts = <0 83 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 17>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 46>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000da00 {
> +		compatible = "nvidia,tegra20-slink";
> +		reg = <0x7000da00 0x200>;
> +		interrupts = <0 93 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 18>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 68>;
> +		status = "disabled";
> +	};
> +
> +	kbc {
> +		compatible = "nvidia,tegra20-kbc";
> +		reg = <0x7000e200 0x100>;
> +		interrupts = <0 85 0x04>;
> +		clocks = <&tegra_car 36>;
> +		status = "disabled";
> +	};
> +
> +	pmc {
> +		compatible = "nvidia,tegra20-pmc";
> +		reg = <0x7000e400 0x400>;
> +	};
> +
> +	memory-controller@7000f000 {
> +		compatible = "nvidia,tegra20-mc";
> +		reg = <0x7000f000 0x024
> +		       0x7000f03c 0x3c4>;
> +		interrupts = <0 77 0x04>;
> +	};
> +
> +	iommu {
> +		compatible = "nvidia,tegra20-gart";
> +		reg = <0x7000f024 0x00000018	/* controller registers */
> +		       0x58000000 0x02000000>;	/* GART aperture */
> +	};
> +
> +	memory-controller@7000f400 {
> +		compatible = "nvidia,tegra20-emc";
> +		reg = <0x7000f400 0x200>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +
> +	usb@c5000000 {
> +		compatible = "nvidia,tegra20-ehci", "usb-ehci";
> +		reg = <0xc5000000 0x4000>;
> +		interrupts = <0 20 0x04>;
> +		phy_type = "utmi";
> +		nvidia,has-legacy-mode;
> +		clocks = <&tegra_car 22>;
> +		nvidia,needs-double-reset;
> +		nvidia,phy = <&phy1>;
> +		status = "disabled";
> +	};
> +
> +	phy1: usb-phy@c5000400 {
> +		compatible = "nvidia,tegra20-usb-phy";
> +		reg = <0xc5000400 0x3c00>;
> +		phy_type = "utmi";
> +		nvidia,has-legacy-mode;
> +		clocks = <&tegra_car 22>, <&tegra_car 127>;
> +		clock-names = "phy", "pll_u";
> +	};
> +
> +	usb@c5004000 {
> +		compatible = "nvidia,tegra20-ehci", "usb-ehci";
> +		reg = <0xc5004000 0x4000>;
> +		interrupts = <0 21 0x04>;
> +		phy_type = "ulpi";
> +		clocks = <&tegra_car 58>;
> +		nvidia,phy = <&phy2>;
> +		status = "disabled";
> +	};
> +
> +	phy2: usb-phy@c5004400 {
> +		compatible = "nvidia,tegra20-usb-phy";
> +		reg = <0xc5004400 0x3c00>;
> +		phy_type = "ulpi";
> +		clocks = <&tegra_car 94>, <&tegra_car 127>;
> +		clock-names = "phy", "pll_u";
> +	};
> +
> +	usb@c5008000 {
> +		compatible = "nvidia,tegra20-ehci", "usb-ehci";
> +		reg = <0xc5008000 0x4000>;
> +		interrupts = <0 97 0x04>;
> +		phy_type = "utmi";
> +		clocks = <&tegra_car 59>;
> +		nvidia,phy = <&phy3>;
> +		status = "disabled";
> +	};
> +
> +	phy3: usb-phy@c5008400 {
> +		compatible = "nvidia,tegra20-usb-phy";
> +		reg = <0xc5008400 0x3c00>;
> +		phy_type = "utmi";
> +		clocks = <&tegra_car 22>, <&tegra_car 127>;
> +		clock-names = "phy", "pll_u";
> +	};
> +
> +	sdhci@c8000000 {
> +		compatible = "nvidia,tegra20-sdhci";
> +		reg = <0xc8000000 0x200>;
> +		interrupts = <0 14 0x04>;
> +		clocks = <&tegra_car 14>;
> +		status = "disabled";
> +	};
> +
> +	sdhci@c8000200 {
> +		compatible = "nvidia,tegra20-sdhci";
> +		reg = <0xc8000200 0x200>;
> +		interrupts = <0 15 0x04>;
> +		clocks = <&tegra_car 9>;
> +		status = "disabled";
> +	};
> +
> +	sdhci@c8000400 {
> +		compatible = "nvidia,tegra20-sdhci";
> +		reg = <0xc8000400 0x200>;
> +		interrupts = <0 19 0x04>;
> +		clocks = <&tegra_car 69>;
> +		status = "disabled";
> +	};
> +
> +	sdhci@c8000600 {
> +		compatible = "nvidia,tegra20-sdhci";
> +		reg = <0xc8000600 0x200>;
> +		interrupts = <0 31 0x04>;
> +		clocks = <&tegra_car 15>;
> +		status = "disabled";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <0>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <1>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupts = <0 56 0x04
> +			      0 57 0x04>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
> deleted file mode 100644
> index 8ff2ff2..0000000
> --- a/arch/arm/boot/dts/tegra30-beaver.dts
> +++ /dev/null
> @@ -1,373 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra30.dtsi"
> -
> -/ {
> -	model = "NVIDIA Tegra30 Beaver evaluation board";
> -	compatible = "nvidia,beaver", "nvidia,tegra30";
> -
> -	memory {
> -		reg = <0x80000000 0x80000000>;
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			sdmmc1_clk_pz0 {
> -				nvidia,pins = "sdmmc1_clk_pz0";
> -				nvidia,function = "sdmmc1";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc1_cmd_pz1 {
> -				nvidia,pins =	"sdmmc1_cmd_pz1",
> -						"sdmmc1_dat0_py7",
> -						"sdmmc1_dat1_py6",
> -						"sdmmc1_dat2_py5",
> -						"sdmmc1_dat3_py4";
> -				nvidia,function = "sdmmc1";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc3_clk_pa6 {
> -				nvidia,pins = "sdmmc3_clk_pa6";
> -				nvidia,function = "sdmmc3";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc3_cmd_pa7 {
> -				nvidia,pins =	"sdmmc3_cmd_pa7",
> -						"sdmmc3_dat0_pb7",
> -						"sdmmc3_dat1_pb6",
> -						"sdmmc3_dat2_pb5",
> -						"sdmmc3_dat3_pb4";
> -				nvidia,function = "sdmmc3";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc4_clk_pcc4 {
> -				nvidia,pins =	"sdmmc4_clk_pcc4",
> -						"sdmmc4_rst_n_pcc3";
> -				nvidia,function = "sdmmc4";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc4_dat0_paa0 {
> -				nvidia,pins =	"sdmmc4_dat0_paa0",
> -						"sdmmc4_dat1_paa1",
> -						"sdmmc4_dat2_paa2",
> -						"sdmmc4_dat3_paa3",
> -						"sdmmc4_dat4_paa4",
> -						"sdmmc4_dat5_paa5",
> -						"sdmmc4_dat6_paa6",
> -						"sdmmc4_dat7_paa7";
> -				nvidia,function = "sdmmc4";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			dap2_fs_pa2 {
> -				nvidia,pins =	"dap2_fs_pa2",
> -						"dap2_sclk_pa3",
> -						"dap2_din_pa4",
> -						"dap2_dout_pa5";
> -				nvidia,function = "i2s1";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdio3 {
> -				nvidia,pins = "drive_sdio3";
> -				nvidia,high-speed-mode = <0>;
> -				nvidia,schmitt = <0>;
> -				nvidia,pull-down-strength = <46>;
> -				nvidia,pull-up-strength = <42>;
> -				nvidia,slew-rate-rising = <1>;
> -				nvidia,slew-rate-falling = <1>;
> -			};
> -		};
> -	};
> -
> -	serial@70006000 {
> -		status = "okay";
> -	};
> -
> -	i2c@7000c000 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c500 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c700 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -
> -		tps62361 {
> -			compatible = "ti,tps62361";
> -			reg = <0x60>;
> -
> -			regulator-name = "tps62361-vout";
> -			regulator-min-microvolt = <500000>;
> -			regulator-max-microvolt = <1500000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> -			ti,vsel0-state-high;
> -			ti,vsel1-state-high;
> -		};
> -
> -		pmic: tps65911@2d {
> -			compatible = "ti,tps65911";
> -			reg = <0x2d>;
> -
> -			interrupts = <0 86 0x4>;
> -			#interrupt-cells = <2>;
> -			interrupt-controller;
> -
> -			ti,system-power-controller;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			vcc1-supply = <&vdd_5v_in_reg>;
> -			vcc2-supply = <&vdd_5v_in_reg>;
> -			vcc3-supply = <&vio_reg>;
> -			vcc4-supply = <&vdd_5v_in_reg>;
> -			vcc5-supply = <&vdd_5v_in_reg>;
> -			vcc6-supply = <&vdd2_reg>;
> -			vcc7-supply = <&vdd_5v_in_reg>;
> -			vccio-supply = <&vdd_5v_in_reg>;
> -
> -			regulators {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				vdd1_reg: vdd1 {
> -					regulator-name = "vddio_ddr_1v2";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				vdd2_reg: vdd2 {
> -					regulator-name = "vdd_1v5_gen";
> -					regulator-min-microvolt = <1500000>;
> -					regulator-max-microvolt = <1500000>;
> -					regulator-always-on;
> -				};
> -
> -				vddctrl_reg: vddctrl {
> -					regulator-name = "vdd_cpu,vdd_sys";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				vio_reg: vio {
> -					regulator-name = "vdd_1v8_gen";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo1_reg: ldo1 {
> -					regulator-name = "vdd_pexa,vdd_pexb";
> -					regulator-min-microvolt = <1050000>;
> -					regulator-max-microvolt = <1050000>;
> -				};
> -
> -				ldo2_reg: ldo2 {
> -					regulator-name = "vdd_sata,avdd_plle";
> -					regulator-min-microvolt = <1050000>;
> -					regulator-max-microvolt = <1050000>;
> -				};
> -
> -				/* LDO3 is not connected to anything */
> -
> -				ldo4_reg: ldo4 {
> -					regulator-name = "vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5_reg: ldo5 {
> -					regulator-name = "vddio_sdmmc,avdd_vdac";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo6_reg: ldo6 {
> -					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo7_reg: ldo7 {
> -					regulator-name = "vdd_pllm,x,u,a_p_c_s";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo8_reg: ldo8 {
> -					regulator-name = "vdd_ddr_hs";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -	};
> -
> -	spi@7000da00 {
> -		status = "okay";
> -		spi-max-frequency = <25000000>;
> -		spi-flash@1 {
> -			compatible = "winbond,w25q32";
> -			reg = <1>;
> -			spi-max-frequency = <20000000>;
> -		};
> -	};
> -
> -	ahub {
> -		i2s@70080400 {
> -			status = "okay";
> -		};
> -	};
> -
> -	pmc {
> -		status = "okay";
> -		nvidia,invert-interrupt;
> -	};
> -
> -	sdhci@78000000 {
> -		status = "okay";
> -		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> -		wp-gpios = <&gpio 155 0>; /* gpio PT3 */
> -		power-gpios = <&gpio 31 0>; /* gpio PD7 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@78000600 {
> -		status = "okay";
> -		bus-width = <8>;
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		vdd_5v_in_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "vdd_5v_in";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -
> -		chargepump_5v_reg: regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "chargepump_5v";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> -			enable-active-high;
> -			gpio = <&pmic 0 0>; /* PMIC TPS65911 GPIO0 */
> -		};
> -
> -		ddr_reg: regulator@2 {
> -			compatible = "regulator-fixed";
> -			reg = <2>;
> -			regulator-name = "vdd_ddr";
> -			regulator-min-microvolt = <1500000>;
> -			regulator-max-microvolt = <1500000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&pmic 7 0>; /* PMIC TPS65911 GPIO7 */
> -			vin-supply = <&vdd_5v_in_reg>;
> -		};
> -
> -		vdd_5v_sata_reg: regulator@3 {
> -			compatible = "regulator-fixed";
> -			reg = <3>;
> -			regulator-name = "vdd_5v_sata";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 30 0>; /* gpio PD6 */
> -			vin-supply = <&vdd_5v_in_reg>;
> -		};
> -
> -		usb1_vbus_reg: regulator@4 {
> -			compatible = "regulator-fixed";
> -			reg = <4>;
> -			regulator-name = "usb1_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio 68 0>; /* GPIO PI4 */
> -			gpio-open-drain;
> -			vin-supply = <&vdd_5v_in_reg>;
> -		};
> -
> -		usb3_vbus_reg: regulator@5 {
> -			compatible = "regulator-fixed";
> -			reg = <5>;
> -			regulator-name = "usb3_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio 63 0>; /* GPIO PH7 */
> -			gpio-open-drain;
> -			vin-supply = <&vdd_5v_in_reg>;
> -		};
> -
> -		sys_3v3_reg: regulator@6 {
> -			compatible = "regulator-fixed";
> -			reg = <6>;
> -			regulator-name = "sys_3v3,vdd_3v3_alw";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&pmic 6 0>; /* PMIC TPS65911 GPIO6 */
> -			vin-supply = <&vdd_5v_in_reg>;
> -		};
> -
> -		sys_3v3_pexs_reg: regulator@7 {
> -			compatible = "regulator-fixed";
> -			reg = <7>;
> -			regulator-name = "sys_3v3_pexs";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 95 0>; /* gpio PL7 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra30-beaver.dtsp b/arch/arm/boot/dts/tegra30-beaver.dtsp
> new file mode 100644
> index 0000000..af23c94
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra30-beaver.dtsp
> @@ -0,0 +1,373 @@
> +/dts-v1/;
> +
> +#include "tegra30.dtsip"
> +
> +/ {
> +	model = "NVIDIA Tegra30 Beaver evaluation board";
> +	compatible = "nvidia,beaver", "nvidia,tegra30";
> +
> +	memory {
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			sdmmc1_clk_pz0 {
> +				nvidia,pins = "sdmmc1_clk_pz0";
> +				nvidia,function = "sdmmc1";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc1_cmd_pz1 {
> +				nvidia,pins =	"sdmmc1_cmd_pz1",
> +						"sdmmc1_dat0_py7",
> +						"sdmmc1_dat1_py6",
> +						"sdmmc1_dat2_py5",
> +						"sdmmc1_dat3_py4";
> +				nvidia,function = "sdmmc1";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc3_clk_pa6 {
> +				nvidia,pins = "sdmmc3_clk_pa6";
> +				nvidia,function = "sdmmc3";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc3_cmd_pa7 {
> +				nvidia,pins =	"sdmmc3_cmd_pa7",
> +						"sdmmc3_dat0_pb7",
> +						"sdmmc3_dat1_pb6",
> +						"sdmmc3_dat2_pb5",
> +						"sdmmc3_dat3_pb4";
> +				nvidia,function = "sdmmc3";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc4_clk_pcc4 {
> +				nvidia,pins =	"sdmmc4_clk_pcc4",
> +						"sdmmc4_rst_n_pcc3";
> +				nvidia,function = "sdmmc4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc4_dat0_paa0 {
> +				nvidia,pins =	"sdmmc4_dat0_paa0",
> +						"sdmmc4_dat1_paa1",
> +						"sdmmc4_dat2_paa2",
> +						"sdmmc4_dat3_paa3",
> +						"sdmmc4_dat4_paa4",
> +						"sdmmc4_dat5_paa5",
> +						"sdmmc4_dat6_paa6",
> +						"sdmmc4_dat7_paa7";
> +				nvidia,function = "sdmmc4";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			dap2_fs_pa2 {
> +				nvidia,pins =	"dap2_fs_pa2",
> +						"dap2_sclk_pa3",
> +						"dap2_din_pa4",
> +						"dap2_dout_pa5";
> +				nvidia,function = "i2s1";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdio3 {
> +				nvidia,pins = "drive_sdio3";
> +				nvidia,high-speed-mode = <0>;
> +				nvidia,schmitt = <0>;
> +				nvidia,pull-down-strength = <46>;
> +				nvidia,pull-up-strength = <42>;
> +				nvidia,slew-rate-rising = <1>;
> +				nvidia,slew-rate-falling = <1>;
> +			};
> +		};
> +	};
> +
> +	serial@70006000 {
> +		status = "okay";
> +	};
> +
> +	i2c@7000c000 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c500 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c700 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +
> +		tps62361 {
> +			compatible = "ti,tps62361";
> +			reg = <0x60>;
> +
> +			regulator-name = "tps62361-vout";
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <1500000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			ti,vsel0-state-high;
> +			ti,vsel1-state-high;
> +		};
> +
> +		pmic: tps65911@2d {
> +			compatible = "ti,tps65911";
> +			reg = <0x2d>;
> +
> +			interrupts = <0 86 0x4>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +
> +			ti,system-power-controller;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			vcc1-supply = <&vdd_5v_in_reg>;
> +			vcc2-supply = <&vdd_5v_in_reg>;
> +			vcc3-supply = <&vio_reg>;
> +			vcc4-supply = <&vdd_5v_in_reg>;
> +			vcc5-supply = <&vdd_5v_in_reg>;
> +			vcc6-supply = <&vdd2_reg>;
> +			vcc7-supply = <&vdd_5v_in_reg>;
> +			vccio-supply = <&vdd_5v_in_reg>;
> +
> +			regulators {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				vdd1_reg: vdd1 {
> +					regulator-name = "vddio_ddr_1v2";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd2_reg: vdd2 {
> +					regulator-name = "vdd_1v5_gen";
> +					regulator-min-microvolt = <1500000>;
> +					regulator-max-microvolt = <1500000>;
> +					regulator-always-on;
> +				};
> +
> +				vddctrl_reg: vddctrl {
> +					regulator-name = "vdd_cpu,vdd_sys";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +
> +				vio_reg: vio {
> +					regulator-name = "vdd_1v8_gen";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo1_reg: ldo1 {
> +					regulator-name = "vdd_pexa,vdd_pexb";
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1050000>;
> +				};
> +
> +				ldo2_reg: ldo2 {
> +					regulator-name = "vdd_sata,avdd_plle";
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1050000>;
> +				};
> +
> +				/* LDO3 is not connected to anything */
> +
> +				ldo4_reg: ldo4 {
> +					regulator-name = "vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5_reg: ldo5 {
> +					regulator-name = "vddio_sdmmc,avdd_vdac";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo6_reg: ldo6 {
> +					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo7_reg: ldo7 {
> +					regulator-name = "vdd_pllm,x,u,a_p_c_s";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo8_reg: ldo8 {
> +					regulator-name = "vdd_ddr_hs";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +	};
> +
> +	spi@7000da00 {
> +		status = "okay";
> +		spi-max-frequency = <25000000>;
> +		spi-flash@1 {
> +			compatible = "winbond,w25q32";
> +			reg = <1>;
> +			spi-max-frequency = <20000000>;
> +		};
> +	};
> +
> +	ahub {
> +		i2s@70080400 {
> +			status = "okay";
> +		};
> +	};
> +
> +	pmc {
> +		status = "okay";
> +		nvidia,invert-interrupt;
> +	};
> +
> +	sdhci@78000000 {
> +		status = "okay";
> +		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> +		wp-gpios = <&gpio 155 0>; /* gpio PT3 */
> +		power-gpios = <&gpio 31 0>; /* gpio PD7 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@78000600 {
> +		status = "okay";
> +		bus-width = <8>;
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd_5v_in_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "vdd_5v_in";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +
> +		chargepump_5v_reg: regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "chargepump_5v";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			enable-active-high;
> +			gpio = <&pmic 0 0>; /* PMIC TPS65911 GPIO0 */
> +		};
> +
> +		ddr_reg: regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg = <2>;
> +			regulator-name = "vdd_ddr";
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <1500000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&pmic 7 0>; /* PMIC TPS65911 GPIO7 */
> +			vin-supply = <&vdd_5v_in_reg>;
> +		};
> +
> +		vdd_5v_sata_reg: regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <3>;
> +			regulator-name = "vdd_5v_sata";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 30 0>; /* gpio PD6 */
> +			vin-supply = <&vdd_5v_in_reg>;
> +		};
> +
> +		usb1_vbus_reg: regulator@4 {
> +			compatible = "regulator-fixed";
> +			reg = <4>;
> +			regulator-name = "usb1_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&gpio 68 0>; /* GPIO PI4 */
> +			gpio-open-drain;
> +			vin-supply = <&vdd_5v_in_reg>;
> +		};
> +
> +		usb3_vbus_reg: regulator@5 {
> +			compatible = "regulator-fixed";
> +			reg = <5>;
> +			regulator-name = "usb3_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&gpio 63 0>; /* GPIO PH7 */
> +			gpio-open-drain;
> +			vin-supply = <&vdd_5v_in_reg>;
> +		};
> +
> +		sys_3v3_reg: regulator@6 {
> +			compatible = "regulator-fixed";
> +			reg = <6>;
> +			regulator-name = "sys_3v3,vdd_3v3_alw";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&pmic 6 0>; /* PMIC TPS65911 GPIO6 */
> +			vin-supply = <&vdd_5v_in_reg>;
> +		};
> +
> +		sys_3v3_pexs_reg: regulator@7 {
> +			compatible = "regulator-fixed";
> +			reg = <7>;
> +			regulator-name = "sys_3v3_pexs";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 95 0>; /* gpio PL7 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dts b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> deleted file mode 100644
> index adc88aa..0000000
> --- a/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra30-cardhu.dtsi"
> -
> -/* This dts file support the cardhu A02 version of board */
> -
> -/ {
> -	model = "NVIDIA Tegra30 Cardhu A02 evaluation board";
> -	compatible = "nvidia,cardhu-a02", "nvidia,cardhu", "nvidia,tegra30";
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ddr_reg: regulator@100 {
> -			compatible = "regulator-fixed";
> -			reg = <100>;
> -			regulator-name = "vdd_ddr";
> -			regulator-min-microvolt = <1500000>;
> -			regulator-max-microvolt = <1500000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&pmic 6 0>;
> -		};
> -
> -		sys_3v3_reg: regulator@101 {
> -			compatible = "regulator-fixed";
> -			reg = <101>;
> -			regulator-name = "sys_3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&pmic 7 0>;
> -		};
> -
> -		usb1_vbus_reg: regulator@102 {
> -			compatible = "regulator-fixed";
> -			reg = <102>;
> -			regulator-name = "usb1_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio 68 0>; /* GPIO PI4 */
> -			gpio-open-drain;
> -			vin-supply = <&vdd_5v0_reg>;
> -		};
> -
> -		usb3_vbus_reg: regulator@103 {
> -			compatible = "regulator-fixed";
> -			reg = <103>;
> -			regulator-name = "usb3_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio 63 0>; /* GPIO PH7 */
> -			gpio-open-drain;
> -			vin-supply = <&vdd_5v0_reg>;
> -		};
> -
> -		vdd_5v0_reg: regulator@104 {
> -			compatible = "regulator-fixed";
> -			reg = <104>;
> -			regulator-name = "5v0";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&pmic 2 0>;
> -		};
> -
> -		vdd_bl_reg: regulator@105 {
> -			compatible = "regulator-fixed";
> -			reg = <105>;
> -			regulator-name = "vdd_bl";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 83 0>; /* GPIO PK3 */
> -		};
> -	};
> -
> -	sdhci@78000400 {
> -		status = "okay";
> -		power-gpios = <&gpio 28 0>; /* gpio PD4 */
> -		bus-width = <4>;
> -	};
> -};
> -
> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dtsp b/arch/arm/boot/dts/tegra30-cardhu-a02.dtsp
> new file mode 100644
> index 0000000..64b7184
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a02.dtsp
> @@ -0,0 +1,93 @@
> +/dts-v1/;
> +
> +#include "tegra30-cardhu.dtsip"
> +
> +/* This dts file support the cardhu A02 version of board */
> +
> +/ {
> +	model = "NVIDIA Tegra30 Cardhu A02 evaluation board";
> +	compatible = "nvidia,cardhu-a02", "nvidia,cardhu", "nvidia,tegra30";
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ddr_reg: regulator@100 {
> +			compatible = "regulator-fixed";
> +			reg = <100>;
> +			regulator-name = "vdd_ddr";
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <1500000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&pmic 6 0>;
> +		};
> +
> +		sys_3v3_reg: regulator@101 {
> +			compatible = "regulator-fixed";
> +			reg = <101>;
> +			regulator-name = "sys_3v3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&pmic 7 0>;
> +		};
> +
> +		usb1_vbus_reg: regulator@102 {
> +			compatible = "regulator-fixed";
> +			reg = <102>;
> +			regulator-name = "usb1_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&gpio 68 0>; /* GPIO PI4 */
> +			gpio-open-drain;
> +			vin-supply = <&vdd_5v0_reg>;
> +		};
> +
> +		usb3_vbus_reg: regulator@103 {
> +			compatible = "regulator-fixed";
> +			reg = <103>;
> +			regulator-name = "usb3_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&gpio 63 0>; /* GPIO PH7 */
> +			gpio-open-drain;
> +			vin-supply = <&vdd_5v0_reg>;
> +		};
> +
> +		vdd_5v0_reg: regulator@104 {
> +			compatible = "regulator-fixed";
> +			reg = <104>;
> +			regulator-name = "5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&pmic 2 0>;
> +		};
> +
> +		vdd_bl_reg: regulator@105 {
> +			compatible = "regulator-fixed";
> +			reg = <105>;
> +			regulator-name = "vdd_bl";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 83 0>; /* GPIO PK3 */
> +		};
> +	};
> +
> +	sdhci@78000400 {
> +		status = "okay";
> +		power-gpios = <&gpio 28 0>; /* gpio PD4 */
> +		bus-width = <4>;
> +	};
> +};
> +
> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> deleted file mode 100644
> index 08163e1..0000000
> --- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> +++ /dev/null
> @@ -1,104 +0,0 @@
> -/dts-v1/;
> -
> -/include/ "tegra30-cardhu.dtsi"
> -
> -/* This dts file support the cardhu A04 and later versions of board */
> -
> -/ {
> -	model = "NVIDIA Tegra30 Cardhu A04 (A05, A06, A07) evaluation board";
> -	compatible = "nvidia,cardhu-a04", "nvidia,cardhu", "nvidia,tegra30";
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ddr_reg: regulator@100 {
> -			compatible = "regulator-fixed";
> -			regulator-name = "ddr";
> -			reg = <100>;
> -			regulator-min-microvolt = <1500000>;
> -			regulator-max-microvolt = <1500000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&pmic 7 0>;
> -		};
> -
> -		sys_3v3_reg: regulator@101 {
> -			compatible = "regulator-fixed";
> -			reg = <101>;
> -			regulator-name = "sys_3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&pmic 6 0>;
> -		};
> -
> -		usb1_vbus_reg: regulator@102 {
> -			compatible = "regulator-fixed";
> -			reg = <102>;
> -			regulator-name = "usb1_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio 238 0>; /* GPIO PDD6 */
> -			gpio-open-drain;
> -			vin-supply = <&vdd_5v0_reg>;
> -		};
> -
> -		usb3_vbus_reg: regulator@103 {
> -			compatible = "regulator-fixed";
> -			reg = <103>;
> -			regulator-name = "usb3_vbus";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio 236 0>; /* GPIO PDD4 */
> -			gpio-open-drain;
> -			vin-supply = <&vdd_5v0_reg>;
> -		};
> -
> -		vdd_5v0_reg: regulator@104 {
> -			compatible = "regulator-fixed";
> -			reg = <104>;
> -			regulator-name = "5v0";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&pmic 8 0>;
> -		};
> -
> -		vdd_bl_reg: regulator@105 {
> -			compatible = "regulator-fixed";
> -			reg = <105>;
> -			regulator-name = "vdd_bl";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 234 0>; /* GPIO PDD2 */
> -		};
> -
> -		vdd_bl2_reg: regulator@106 {
> -			compatible = "regulator-fixed";
> -			reg = <106>;
> -			regulator-name = "vdd_bl2";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 232 0>; /* GPIO PDD0 */
> -		};
> -	};
> -
> -	sdhci@78000400 {
> -		status = "okay";
> -		power-gpios = <&gpio 27 0>; /* gpio PD3 */
> -		bus-width = <4>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dtsp b/arch/arm/boot/dts/tegra30-cardhu-a04.dtsp
> new file mode 100644
> index 0000000..fc0d771
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dtsp
> @@ -0,0 +1,104 @@
> +/dts-v1/;
> +
> +#include "tegra30-cardhu.dtsip"
> +
> +/* This dts file support the cardhu A04 and later versions of board */
> +
> +/ {
> +	model = "NVIDIA Tegra30 Cardhu A04 (A05, A06, A07) evaluation board";
> +	compatible = "nvidia,cardhu-a04", "nvidia,cardhu", "nvidia,tegra30";
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ddr_reg: regulator@100 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "ddr";
> +			reg = <100>;
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <1500000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&pmic 7 0>;
> +		};
> +
> +		sys_3v3_reg: regulator@101 {
> +			compatible = "regulator-fixed";
> +			reg = <101>;
> +			regulator-name = "sys_3v3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&pmic 6 0>;
> +		};
> +
> +		usb1_vbus_reg: regulator@102 {
> +			compatible = "regulator-fixed";
> +			reg = <102>;
> +			regulator-name = "usb1_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&gpio 238 0>; /* GPIO PDD6 */
> +			gpio-open-drain;
> +			vin-supply = <&vdd_5v0_reg>;
> +		};
> +
> +		usb3_vbus_reg: regulator@103 {
> +			compatible = "regulator-fixed";
> +			reg = <103>;
> +			regulator-name = "usb3_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&gpio 236 0>; /* GPIO PDD4 */
> +			gpio-open-drain;
> +			vin-supply = <&vdd_5v0_reg>;
> +		};
> +
> +		vdd_5v0_reg: regulator@104 {
> +			compatible = "regulator-fixed";
> +			reg = <104>;
> +			regulator-name = "5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&pmic 8 0>;
> +		};
> +
> +		vdd_bl_reg: regulator@105 {
> +			compatible = "regulator-fixed";
> +			reg = <105>;
> +			regulator-name = "vdd_bl";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 234 0>; /* GPIO PDD2 */
> +		};
> +
> +		vdd_bl2_reg: regulator@106 {
> +			compatible = "regulator-fixed";
> +			reg = <106>;
> +			regulator-name = "vdd_bl2";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 232 0>; /* GPIO PDD0 */
> +		};
> +	};
> +
> +	sdhci@78000400 {
> +		status = "okay";
> +		power-gpios = <&gpio 27 0>; /* gpio PD3 */
> +		bus-width = <4>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> deleted file mode 100644
> index 1749927..0000000
> --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> +++ /dev/null
> @@ -1,500 +0,0 @@
> -/include/ "tegra30.dtsi"
> -
> -/**
> - * This file contains common DT entry for all fab version of Cardhu.
> - * There is multiple fab version of Cardhu starting from A01 to A07.
> - * Cardhu fab version A01 and A03 are not supported. Cardhu fab version
> - * A02 will have different sets of GPIOs for fixed regulator compare to
> - * Cardhu fab version A04. The Cardhu fab version A05, A06, A07 are
> - * compatible with fab version A04. Based on Cardhu fab version, the
> - * related dts file need to be chosen like for Cardhu fab version A02,
> - * use tegra30-cardhu-a02.dts, Cardhu fab version A04 and later, use
> - * tegra30-cardhu-a04.dts.
> - * The identification of board is done in two ways, by looking the sticker
> - * on PCB and by reading board id eeprom.
> - * The stciker will have number like 600-81291-1000-002 C.3. In this 4th
> - * number is the fab version like here it is 002 and hence fab version A02.
> - * The (downstream internal) U-Boot of Cardhu display the board-id as
> - * follows:
> - * BoardID: 0C5B, SKU: 0A01, Fab: 02, Rev: 45.00
> - * In this Fab version is 02 i.e. A02.
> - * The BoardID I2C eeprom is interfaced through i2c5 (pwr_i2c address 0x56).
> - * The location 0x8 of this eeprom contains the Fab version. It is 1 byte
> - * wide.
> - */
> -
> -/ {
> -	model = "NVIDIA Tegra30 Cardhu evaluation board";
> -	compatible = "nvidia,cardhu", "nvidia,tegra30";
> -
> -	memory {
> -		reg = <0x80000000 0x40000000>;
> -	};
> -
> -	pinmux {
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&state_default>;
> -
> -		state_default: pinmux {
> -			sdmmc1_clk_pz0 {
> -				nvidia,pins = "sdmmc1_clk_pz0";
> -				nvidia,function = "sdmmc1";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc1_cmd_pz1 {
> -				nvidia,pins =	"sdmmc1_cmd_pz1",
> -						"sdmmc1_dat0_py7",
> -						"sdmmc1_dat1_py6",
> -						"sdmmc1_dat2_py5",
> -						"sdmmc1_dat3_py4";
> -				nvidia,function = "sdmmc1";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc3_clk_pa6 {
> -				nvidia,pins = "sdmmc3_clk_pa6";
> -				nvidia,function = "sdmmc3";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc3_cmd_pa7 {
> -				nvidia,pins =	"sdmmc3_cmd_pa7",
> -						"sdmmc3_dat0_pb7",
> -						"sdmmc3_dat1_pb6",
> -						"sdmmc3_dat2_pb5",
> -						"sdmmc3_dat3_pb4";
> -				nvidia,function = "sdmmc3";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc4_clk_pcc4 {
> -				nvidia,pins =	"sdmmc4_clk_pcc4",
> -						"sdmmc4_rst_n_pcc3";
> -				nvidia,function = "sdmmc4";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdmmc4_dat0_paa0 {
> -				nvidia,pins =	"sdmmc4_dat0_paa0",
> -						"sdmmc4_dat1_paa1",
> -						"sdmmc4_dat2_paa2",
> -						"sdmmc4_dat3_paa3",
> -						"sdmmc4_dat4_paa4",
> -						"sdmmc4_dat5_paa5",
> -						"sdmmc4_dat6_paa6",
> -						"sdmmc4_dat7_paa7";
> -				nvidia,function = "sdmmc4";
> -				nvidia,pull = <2>;
> -				nvidia,tristate = <0>;
> -			};
> -			dap2_fs_pa2 {
> -				nvidia,pins =	"dap2_fs_pa2",
> -						"dap2_sclk_pa3",
> -						"dap2_din_pa4",
> -						"dap2_dout_pa5";
> -				nvidia,function = "i2s1";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -			sdio3 {
> -				nvidia,pins = "drive_sdio3";
> -				nvidia,high-speed-mode = <0>;
> -				nvidia,schmitt = <0>;
> -				nvidia,pull-down-strength = <46>;
> -				nvidia,pull-up-strength = <42>;
> -				nvidia,slew-rate-rising = <1>;
> -				nvidia,slew-rate-falling = <1>;
> -			};
> -			uart3_txd_pw6 {
> -				nvidia,pins =	"uart3_txd_pw6",
> -						"uart3_cts_n_pa1",
> -						"uart3_rts_n_pc0",
> -						"uart3_rxd_pw7";
> -				nvidia,function = "uartc";
> -				nvidia,pull = <0>;
> -				nvidia,tristate = <0>;
> -			};
> -		};
> -	};
> -
> -	serial@70006000 {
> -		status = "okay";
> -	};
> -
> -	serial@70006200 {
> -		compatible = "nvidia,tegra30-hsuart";
> -		status = "okay";
> -	};
> -
> -	i2c@7000c000 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c400 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000c500 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -
> -		/* ALS and Proximity sensor */
> -		isl29028@44 {
> -			compatible = "isil,isl29028";
> -			reg = <0x44>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <88 0x04>; /*gpio PL0 */
> -		};
> -	};
> -
> -	i2c@7000c700 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2c@7000d000 {
> -		status = "okay";
> -		clock-frequency = <100000>;
> -
> -		wm8903: wm8903@1a {
> -			compatible = "wlf,wm8903";
> -			reg = <0x1a>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <179 0x04>; /* gpio PW3 */
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			micdet-cfg = <0>;
> -			micdet-delay = <100>;
> -			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> -		};
> -
> -		tps62361 {
> -			compatible = "ti,tps62361";
> -			reg = <0x60>;
> -
> -			regulator-name = "tps62361-vout";
> -			regulator-min-microvolt = <500000>;
> -			regulator-max-microvolt = <1500000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> -			ti,vsel0-state-high;
> -			ti,vsel1-state-high;
> -		};
> -
> -		pmic: tps65911@2d {
> -			compatible = "ti,tps65911";
> -			reg = <0x2d>;
> -
> -			interrupts = <0 86 0x4>;
> -			#interrupt-cells = <2>;
> -			interrupt-controller;
> -
> -			ti,system-power-controller;
> -
> -			#gpio-cells = <2>;
> -			gpio-controller;
> -
> -			vcc1-supply = <&vdd_ac_bat_reg>;
> -			vcc2-supply = <&vdd_ac_bat_reg>;
> -			vcc3-supply = <&vio_reg>;
> -			vcc4-supply = <&vdd_5v0_reg>;
> -			vcc5-supply = <&vdd_ac_bat_reg>;
> -			vcc6-supply = <&vdd2_reg>;
> -			vcc7-supply = <&vdd_ac_bat_reg>;
> -			vccio-supply = <&vdd_ac_bat_reg>;
> -
> -			regulators {
> -				vdd1_reg: vdd1 {
> -					regulator-name = "vddio_ddr_1v2";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				vdd2_reg: vdd2 {
> -					regulator-name = "vdd_1v5_gen";
> -					regulator-min-microvolt = <1500000>;
> -					regulator-max-microvolt = <1500000>;
> -					regulator-always-on;
> -				};
> -
> -				vddctrl_reg: vddctrl {
> -					regulator-name = "vdd_cpu,vdd_sys";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				vio_reg: vio {
> -					regulator-name = "vdd_1v8_gen";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo1_reg: ldo1 {
> -					regulator-name = "vdd_pexa,vdd_pexb";
> -					regulator-min-microvolt = <1050000>;
> -					regulator-max-microvolt = <1050000>;
> -				};
> -
> -				ldo2_reg: ldo2 {
> -					regulator-name = "vdd_sata,avdd_plle";
> -					regulator-min-microvolt = <1050000>;
> -					regulator-max-microvolt = <1050000>;
> -				};
> -
> -				/* LDO3 is not connected to anything */
> -
> -				ldo4_reg: ldo4 {
> -					regulator-name = "vdd_rtc";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo5_reg: ldo5 {
> -					regulator-name = "vddio_sdmmc,avdd_vdac";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo6_reg: ldo6 {
> -					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -				};
> -
> -				ldo7_reg: ldo7 {
> -					regulator-name = "vdd_pllm,x,u,a_p_c_s";
> -					regulator-min-microvolt = <1200000>;
> -					regulator-max-microvolt = <1200000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo8_reg: ldo8 {
> -					regulator-name = "vdd_ddr_hs";
> -					regulator-min-microvolt = <1000000>;
> -					regulator-max-microvolt = <1000000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
> -	};
> -
> -	spi@7000da00 {
> -		status = "okay";
> -		spi-max-frequency = <25000000>;
> -		spi-flash@1 {
> -			compatible = "winbond,w25q32";
> -			reg = <1>;
> -			spi-max-frequency = <20000000>;
> -		};
> -	};
> -
> -	ahub {
> -		i2s@70080400 {
> -			status = "okay";
> -		};
> -	};
> -
> -	pmc {
> -		status = "okay";
> -		nvidia,invert-interrupt;
> -	};
> -
> -	sdhci@78000000 {
> -		status = "okay";
> -		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> -		wp-gpios = <&gpio 155 0>; /* gpio PT3 */
> -		power-gpios = <&gpio 31 0>; /* gpio PD7 */
> -		bus-width = <4>;
> -	};
> -
> -	sdhci@78000600 {
> -		status = "okay";
> -		bus-width = <8>;
> -	};
> -
> -	regulators {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		vdd_ac_bat_reg: regulator@0 {
> -			compatible = "regulator-fixed";
> -			reg = <0>;
> -			regulator-name = "vdd_ac_bat";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-always-on;
> -		};
> -
> -		cam_1v8_reg: regulator@1 {
> -			compatible = "regulator-fixed";
> -			reg = <1>;
> -			regulator-name = "cam_1v8";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			enable-active-high;
> -			gpio = <&gpio 220 0>; /* gpio PBB4 */
> -			vin-supply = <&vio_reg>;
> -		};
> -
> -		cp_5v_reg: regulator@2 {
> -			compatible = "regulator-fixed";
> -			reg = <2>;
> -			regulator-name = "cp_5v";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> -			enable-active-high;
> -			gpio = <&pmic 0 0>; /* PMIC TPS65911 GPIO0 */
> -		};
> -
> -		emmc_3v3_reg: regulator@3 {
> -			compatible = "regulator-fixed";
> -			reg = <3>;
> -			regulator-name = "emmc_3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 25 0>; /* gpio PD1 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		modem_3v3_reg: regulator@4 {
> -			compatible = "regulator-fixed";
> -			reg = <4>;
> -			regulator-name = "modem_3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			enable-active-high;
> -			gpio = <&gpio 30 0>; /* gpio PD6 */
> -		};
> -
> -		pex_hvdd_3v3_reg: regulator@5 {
> -			compatible = "regulator-fixed";
> -			reg = <5>;
> -			regulator-name = "pex_hvdd_3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			enable-active-high;
> -			gpio = <&gpio 95 0>; /* gpio PL7 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		vdd_cam1_ldo_reg: regulator@6 {
> -			compatible = "regulator-fixed";
> -			reg = <6>;
> -			regulator-name = "vdd_cam1_ldo";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <2800000>;
> -			enable-active-high;
> -			gpio = <&gpio 142 0>; /* gpio PR6 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		vdd_cam2_ldo_reg: regulator@7 {
> -			compatible = "regulator-fixed";
> -			reg = <7>;
> -			regulator-name = "vdd_cam2_ldo";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <2800000>;
> -			enable-active-high;
> -			gpio = <&gpio 143 0>; /* gpio PR7 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		vdd_cam3_ldo_reg: regulator@8 {
> -			compatible = "regulator-fixed";
> -			reg = <8>;
> -			regulator-name = "vdd_cam3_ldo";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			enable-active-high;
> -			gpio = <&gpio 144 0>; /* gpio PS0 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		vdd_com_reg: regulator@9 {
> -			compatible = "regulator-fixed";
> -			reg = <9>;
> -			regulator-name = "vdd_com";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 24 0>; /* gpio PD0 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		vdd_fuse_3v3_reg: regulator@10 {
> -			compatible = "regulator-fixed";
> -			reg = <10>;
> -			regulator-name = "vdd_fuse_3v3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			enable-active-high;
> -			gpio = <&gpio 94 0>; /* gpio PL6 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		vdd_pnl1_reg: regulator@11 {
> -			compatible = "regulator-fixed";
> -			reg = <11>;
> -			regulator-name = "vdd_pnl1";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -			regulator-boot-on;
> -			enable-active-high;
> -			gpio = <&gpio 92 0>; /* gpio PL4 */
> -			vin-supply = <&sys_3v3_reg>;
> -		};
> -
> -		vdd_vid_reg: regulator@12 {
> -			compatible = "regulator-fixed";
> -			reg = <12>;
> -			regulator-name = "vddio_vid";
> -			regulator-min-microvolt = <5000000>;
> -			regulator-max-microvolt = <5000000>;
> -			enable-active-high;
> -			gpio = <&gpio 152 0>; /* GPIO PT0 */
> -			gpio-open-drain;
> -			vin-supply = <&vdd_5v0_reg>;
> -		};
> -	};
> -
> -	sound {
> -		compatible = "nvidia,tegra-audio-wm8903-cardhu",
> -			     "nvidia,tegra-audio-wm8903";
> -		nvidia,model = "NVIDIA Tegra Cardhu";
> -
> -		nvidia,audio-routing =
> -			"Headphone Jack", "HPOUTR",
> -			"Headphone Jack", "HPOUTL",
> -			"Int Spk", "ROP",
> -			"Int Spk", "RON",
> -			"Int Spk", "LOP",
> -			"Int Spk", "LON",
> -			"Mic Jack", "MICBIAS",
> -			"IN1L", "Mic Jack";
> -
> -		nvidia,i2s-controller = <&tegra_i2s1>;
> -		nvidia,audio-codec = <&wm8903>;
> -
> -		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> -		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsip b/arch/arm/boot/dts/tegra30-cardhu.dtsip
> new file mode 100644
> index 0000000..75ff544
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsip
> @@ -0,0 +1,500 @@
> +#include "tegra30.dtsip"
> +
> +/**
> + * This file contains common DT entry for all fab version of Cardhu.
> + * There is multiple fab version of Cardhu starting from A01 to A07.
> + * Cardhu fab version A01 and A03 are not supported. Cardhu fab version
> + * A02 will have different sets of GPIOs for fixed regulator compare to
> + * Cardhu fab version A04. The Cardhu fab version A05, A06, A07 are
> + * compatible with fab version A04. Based on Cardhu fab version, the
> + * related dts file need to be chosen like for Cardhu fab version A02,
> + * use tegra30-cardhu-a02.dts, Cardhu fab version A04 and later, use
> + * tegra30-cardhu-a04.dts.
> + * The identification of board is done in two ways, by looking the sticker
> + * on PCB and by reading board id eeprom.
> + * The stciker will have number like 600-81291-1000-002 C.3. In this 4th
> + * number is the fab version like here it is 002 and hence fab version A02.
> + * The (downstream internal) U-Boot of Cardhu display the board-id as
> + * follows:
> + * BoardID: 0C5B, SKU: 0A01, Fab: 02, Rev: 45.00
> + * In this Fab version is 02 i.e. A02.
> + * The BoardID I2C eeprom is interfaced through i2c5 (pwr_i2c address 0x56).
> + * The location 0x8 of this eeprom contains the Fab version. It is 1 byte
> + * wide.
> + */
> +
> +/ {
> +	model = "NVIDIA Tegra30 Cardhu evaluation board";
> +	compatible = "nvidia,cardhu", "nvidia,tegra30";
> +
> +	memory {
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	pinmux {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&state_default>;
> +
> +		state_default: pinmux {
> +			sdmmc1_clk_pz0 {
> +				nvidia,pins = "sdmmc1_clk_pz0";
> +				nvidia,function = "sdmmc1";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc1_cmd_pz1 {
> +				nvidia,pins =	"sdmmc1_cmd_pz1",
> +						"sdmmc1_dat0_py7",
> +						"sdmmc1_dat1_py6",
> +						"sdmmc1_dat2_py5",
> +						"sdmmc1_dat3_py4";
> +				nvidia,function = "sdmmc1";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc3_clk_pa6 {
> +				nvidia,pins = "sdmmc3_clk_pa6";
> +				nvidia,function = "sdmmc3";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc3_cmd_pa7 {
> +				nvidia,pins =	"sdmmc3_cmd_pa7",
> +						"sdmmc3_dat0_pb7",
> +						"sdmmc3_dat1_pb6",
> +						"sdmmc3_dat2_pb5",
> +						"sdmmc3_dat3_pb4";
> +				nvidia,function = "sdmmc3";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc4_clk_pcc4 {
> +				nvidia,pins =	"sdmmc4_clk_pcc4",
> +						"sdmmc4_rst_n_pcc3";
> +				nvidia,function = "sdmmc4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc4_dat0_paa0 {
> +				nvidia,pins =	"sdmmc4_dat0_paa0",
> +						"sdmmc4_dat1_paa1",
> +						"sdmmc4_dat2_paa2",
> +						"sdmmc4_dat3_paa3",
> +						"sdmmc4_dat4_paa4",
> +						"sdmmc4_dat5_paa5",
> +						"sdmmc4_dat6_paa6",
> +						"sdmmc4_dat7_paa7";
> +				nvidia,function = "sdmmc4";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
> +			};
> +			dap2_fs_pa2 {
> +				nvidia,pins =	"dap2_fs_pa2",
> +						"dap2_sclk_pa3",
> +						"dap2_din_pa4",
> +						"dap2_dout_pa5";
> +				nvidia,function = "i2s1";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdio3 {
> +				nvidia,pins = "drive_sdio3";
> +				nvidia,high-speed-mode = <0>;
> +				nvidia,schmitt = <0>;
> +				nvidia,pull-down-strength = <46>;
> +				nvidia,pull-up-strength = <42>;
> +				nvidia,slew-rate-rising = <1>;
> +				nvidia,slew-rate-falling = <1>;
> +			};
> +			uart3_txd_pw6 {
> +				nvidia,pins =	"uart3_txd_pw6",
> +						"uart3_cts_n_pa1",
> +						"uart3_rts_n_pc0",
> +						"uart3_rxd_pw7";
> +				nvidia,function = "uartc";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +		};
> +	};
> +
> +	serial@70006000 {
> +		status = "okay";
> +	};
> +
> +	serial@70006200 {
> +		compatible = "nvidia,tegra30-hsuart";
> +		status = "okay";
> +	};
> +
> +	i2c@7000c000 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c400 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000c500 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +
> +		/* ALS and Proximity sensor */
> +		isl29028@44 {
> +			compatible = "isil,isl29028";
> +			reg = <0x44>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <88 0x04>; /*gpio PL0 */
> +		};
> +	};
> +
> +	i2c@7000c700 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +	};
> +
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <100000>;
> +
> +		wm8903: wm8903@1a {
> +			compatible = "wlf,wm8903";
> +			reg = <0x1a>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <179 0x04>; /* gpio PW3 */
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;
> +			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
> +		};
> +
> +		tps62361 {
> +			compatible = "ti,tps62361";
> +			reg = <0x60>;
> +
> +			regulator-name = "tps62361-vout";
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <1500000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			ti,vsel0-state-high;
> +			ti,vsel1-state-high;
> +		};
> +
> +		pmic: tps65911@2d {
> +			compatible = "ti,tps65911";
> +			reg = <0x2d>;
> +
> +			interrupts = <0 86 0x4>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +
> +			ti,system-power-controller;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			vcc1-supply = <&vdd_ac_bat_reg>;
> +			vcc2-supply = <&vdd_ac_bat_reg>;
> +			vcc3-supply = <&vio_reg>;
> +			vcc4-supply = <&vdd_5v0_reg>;
> +			vcc5-supply = <&vdd_ac_bat_reg>;
> +			vcc6-supply = <&vdd2_reg>;
> +			vcc7-supply = <&vdd_ac_bat_reg>;
> +			vccio-supply = <&vdd_ac_bat_reg>;
> +
> +			regulators {
> +				vdd1_reg: vdd1 {
> +					regulator-name = "vddio_ddr_1v2";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd2_reg: vdd2 {
> +					regulator-name = "vdd_1v5_gen";
> +					regulator-min-microvolt = <1500000>;
> +					regulator-max-microvolt = <1500000>;
> +					regulator-always-on;
> +				};
> +
> +				vddctrl_reg: vddctrl {
> +					regulator-name = "vdd_cpu,vdd_sys";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +
> +				vio_reg: vio {
> +					regulator-name = "vdd_1v8_gen";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo1_reg: ldo1 {
> +					regulator-name = "vdd_pexa,vdd_pexb";
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1050000>;
> +				};
> +
> +				ldo2_reg: ldo2 {
> +					regulator-name = "vdd_sata,avdd_plle";
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1050000>;
> +				};
> +
> +				/* LDO3 is not connected to anything */
> +
> +				ldo4_reg: ldo4 {
> +					regulator-name = "vdd_rtc";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo5_reg: ldo5 {
> +					regulator-name = "vddio_sdmmc,avdd_vdac";
> +					regulator-min-microvolt = <3300000>;
> +					regulator-max-microvolt = <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo6_reg: ldo6 {
> +					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +				};
> +
> +				ldo7_reg: ldo7 {
> +					regulator-name = "vdd_pllm,x,u,a_p_c_s";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo8_reg: ldo8 {
> +					regulator-name = "vdd_ddr_hs";
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1000000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +	};
> +
> +	spi@7000da00 {
> +		status = "okay";
> +		spi-max-frequency = <25000000>;
> +		spi-flash@1 {
> +			compatible = "winbond,w25q32";
> +			reg = <1>;
> +			spi-max-frequency = <20000000>;
> +		};
> +	};
> +
> +	ahub {
> +		i2s@70080400 {
> +			status = "okay";
> +		};
> +	};
> +
> +	pmc {
> +		status = "okay";
> +		nvidia,invert-interrupt;
> +	};
> +
> +	sdhci@78000000 {
> +		status = "okay";
> +		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
> +		wp-gpios = <&gpio 155 0>; /* gpio PT3 */
> +		power-gpios = <&gpio 31 0>; /* gpio PD7 */
> +		bus-width = <4>;
> +	};
> +
> +	sdhci@78000600 {
> +		status = "okay";
> +		bus-width = <8>;
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdd_ac_bat_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "vdd_ac_bat";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +
> +		cam_1v8_reg: regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;
> +			regulator-name = "cam_1v8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			enable-active-high;
> +			gpio = <&gpio 220 0>; /* gpio PBB4 */
> +			vin-supply = <&vio_reg>;
> +		};
> +
> +		cp_5v_reg: regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg = <2>;
> +			regulator-name = "cp_5v";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			enable-active-high;
> +			gpio = <&pmic 0 0>; /* PMIC TPS65911 GPIO0 */
> +		};
> +
> +		emmc_3v3_reg: regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <3>;
> +			regulator-name = "emmc_3v3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 25 0>; /* gpio PD1 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		modem_3v3_reg: regulator@4 {
> +			compatible = "regulator-fixed";
> +			reg = <4>;
> +			regulator-name = "modem_3v3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			enable-active-high;
> +			gpio = <&gpio 30 0>; /* gpio PD6 */
> +		};
> +
> +		pex_hvdd_3v3_reg: regulator@5 {
> +			compatible = "regulator-fixed";
> +			reg = <5>;
> +			regulator-name = "pex_hvdd_3v3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			enable-active-high;
> +			gpio = <&gpio 95 0>; /* gpio PL7 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		vdd_cam1_ldo_reg: regulator@6 {
> +			compatible = "regulator-fixed";
> +			reg = <6>;
> +			regulator-name = "vdd_cam1_ldo";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			enable-active-high;
> +			gpio = <&gpio 142 0>; /* gpio PR6 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		vdd_cam2_ldo_reg: regulator@7 {
> +			compatible = "regulator-fixed";
> +			reg = <7>;
> +			regulator-name = "vdd_cam2_ldo";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			enable-active-high;
> +			gpio = <&gpio 143 0>; /* gpio PR7 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		vdd_cam3_ldo_reg: regulator@8 {
> +			compatible = "regulator-fixed";
> +			reg = <8>;
> +			regulator-name = "vdd_cam3_ldo";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			enable-active-high;
> +			gpio = <&gpio 144 0>; /* gpio PS0 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		vdd_com_reg: regulator@9 {
> +			compatible = "regulator-fixed";
> +			reg = <9>;
> +			regulator-name = "vdd_com";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 24 0>; /* gpio PD0 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		vdd_fuse_3v3_reg: regulator@10 {
> +			compatible = "regulator-fixed";
> +			reg = <10>;
> +			regulator-name = "vdd_fuse_3v3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			enable-active-high;
> +			gpio = <&gpio 94 0>; /* gpio PL6 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		vdd_pnl1_reg: regulator@11 {
> +			compatible = "regulator-fixed";
> +			reg = <11>;
> +			regulator-name = "vdd_pnl1";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			enable-active-high;
> +			gpio = <&gpio 92 0>; /* gpio PL4 */
> +			vin-supply = <&sys_3v3_reg>;
> +		};
> +
> +		vdd_vid_reg: regulator@12 {
> +			compatible = "regulator-fixed";
> +			reg = <12>;
> +			regulator-name = "vddio_vid";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			enable-active-high;
> +			gpio = <&gpio 152 0>; /* GPIO PT0 */
> +			gpio-open-drain;
> +			vin-supply = <&vdd_5v0_reg>;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "nvidia,tegra-audio-wm8903-cardhu",
> +			     "nvidia,tegra-audio-wm8903";
> +		nvidia,model = "NVIDIA Tegra Cardhu";
> +
> +		nvidia,audio-routing =
> +			"Headphone Jack", "HPOUTR",
> +			"Headphone Jack", "HPOUTL",
> +			"Int Spk", "ROP",
> +			"Int Spk", "RON",
> +			"Int Spk", "LOP",
> +			"Int Spk", "LON",
> +			"Mic Jack", "MICBIAS",
> +			"IN1L", "Mic Jack";
> +
> +		nvidia,i2s-controller = <&tegra_i2s1>;
> +		nvidia,audio-codec = <&wm8903>;
> +
> +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> deleted file mode 100644
> index 572a45b..0000000
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ /dev/null
> @@ -1,579 +0,0 @@
> -/include/ "skeleton.dtsi"
> -
> -/ {
> -	compatible = "nvidia,tegra30";
> -	interrupt-parent = <&intc>;
> -
> -	aliases {
> -		serial0 = &uarta;
> -		serial1 = &uartb;
> -		serial2 = &uartc;
> -		serial3 = &uartd;
> -		serial4 = &uarte;
> -	};
> -
> -	host1x {
> -		compatible = "nvidia,tegra30-host1x", "simple-bus";
> -		reg = <0x50000000 0x00024000>;
> -		interrupts = <0 65 0x04   /* mpcore syncpt */
> -			      0 67 0x04>; /* mpcore general */
> -		clocks = <&tegra_car 28>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		ranges = <0x54000000 0x54000000 0x04000000>;
> -
> -		mpe {
> -			compatible = "nvidia,tegra30-mpe";
> -			reg = <0x54040000 0x00040000>;
> -			interrupts = <0 68 0x04>;
> -			clocks = <&tegra_car 60>;
> -		};
> -
> -		vi {
> -			compatible = "nvidia,tegra30-vi";
> -			reg = <0x54080000 0x00040000>;
> -			interrupts = <0 69 0x04>;
> -			clocks = <&tegra_car 164>;
> -		};
> -
> -		epp {
> -			compatible = "nvidia,tegra30-epp";
> -			reg = <0x540c0000 0x00040000>;
> -			interrupts = <0 70 0x04>;
> -			clocks = <&tegra_car 19>;
> -		};
> -
> -		isp {
> -			compatible = "nvidia,tegra30-isp";
> -			reg = <0x54100000 0x00040000>;
> -			interrupts = <0 71 0x04>;
> -			clocks = <&tegra_car 23>;
> -		};
> -
> -		gr2d {
> -			compatible = "nvidia,tegra30-gr2d";
> -			reg = <0x54140000 0x00040000>;
> -			interrupts = <0 72 0x04>;
> -			clocks = <&tegra_car 21>;
> -		};
> -
> -		gr3d {
> -			compatible = "nvidia,tegra30-gr3d";
> -			reg = <0x54180000 0x00040000>;
> -			clocks = <&tegra_car 24 &tegra_car 98>;
> -			clock-names = "3d", "3d2";
> -		};
> -
> -		dc@54200000 {
> -			compatible = "nvidia,tegra30-dc";
> -			reg = <0x54200000 0x00040000>;
> -			interrupts = <0 73 0x04>;
> -			clocks = <&tegra_car 27>, <&tegra_car 179>;
> -			clock-names = "disp1", "parent";
> -
> -			rgb {
> -				status = "disabled";
> -			};
> -		};
> -
> -		dc@54240000 {
> -			compatible = "nvidia,tegra30-dc";
> -			reg = <0x54240000 0x00040000>;
> -			interrupts = <0 74 0x04>;
> -			clocks = <&tegra_car 26>, <&tegra_car 179>;
> -			clock-names = "disp2", "parent";
> -
> -			rgb {
> -				status = "disabled";
> -			};
> -		};
> -
> -		hdmi {
> -			compatible = "nvidia,tegra30-hdmi";
> -			reg = <0x54280000 0x00040000>;
> -			interrupts = <0 75 0x04>;
> -			clocks = <&tegra_car 51>, <&tegra_car 189>;
> -			clock-names = "hdmi", "parent";
> -			status = "disabled";
> -		};
> -
> -		tvo {
> -			compatible = "nvidia,tegra30-tvo";
> -			reg = <0x542c0000 0x00040000>;
> -			interrupts = <0 76 0x04>;
> -			clocks = <&tegra_car 169>;
> -			status = "disabled";
> -		};
> -
> -		dsi {
> -			compatible = "nvidia,tegra30-dsi";
> -			reg = <0x54300000 0x00040000>;
> -			clocks = <&tegra_car 48>;
> -			status = "disabled";
> -		};
> -	};
> -
> -	timer@50004600 {
> -		compatible = "arm,cortex-a9-twd-timer";
> -		reg = <0x50040600 0x20>;
> -		interrupts = <1 13 0xf04>;
> -	};
> -
> -	intc: interrupt-controller {
> -		compatible = "arm,cortex-a9-gic";
> -		reg = <0x50041000 0x1000
> -		       0x50040100 0x0100>;
> -		interrupt-controller;
> -		#interrupt-cells = <3>;
> -	};
> -
> -	cache-controller {
> -		compatible = "arm,pl310-cache";
> -		reg = <0x50043000 0x1000>;
> -		arm,data-latency = <6 6 2>;
> -		arm,tag-latency = <5 5 2>;
> -		cache-unified;
> -		cache-level = <2>;
> -	};
> -
> -	timer@60005000 {
> -		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> -		reg = <0x60005000 0x400>;
> -		interrupts = <0 0 0x04
> -			      0 1 0x04
> -			      0 41 0x04
> -			      0 42 0x04
> -			      0 121 0x04
> -			      0 122 0x04>;
> -	};
> -
> -	tegra_car: clock {
> -		compatible = "nvidia,tegra30-car";
> -		reg = <0x60006000 0x1000>;
> -		#clock-cells = <1>;
> -	};
> -
> -	apbdma: dma {
> -		compatible = "nvidia,tegra30-apbdma", "nvidia,tegra20-apbdma";
> -		reg = <0x6000a000 0x1400>;
> -		interrupts = <0 104 0x04
> -			      0 105 0x04
> -			      0 106 0x04
> -			      0 107 0x04
> -			      0 108 0x04
> -			      0 109 0x04
> -			      0 110 0x04
> -			      0 111 0x04
> -			      0 112 0x04
> -			      0 113 0x04
> -			      0 114 0x04
> -			      0 115 0x04
> -			      0 116 0x04
> -			      0 117 0x04
> -			      0 118 0x04
> -			      0 119 0x04
> -			      0 128 0x04
> -			      0 129 0x04
> -			      0 130 0x04
> -			      0 131 0x04
> -			      0 132 0x04
> -			      0 133 0x04
> -			      0 134 0x04
> -			      0 135 0x04
> -			      0 136 0x04
> -			      0 137 0x04
> -			      0 138 0x04
> -			      0 139 0x04
> -			      0 140 0x04
> -			      0 141 0x04
> -			      0 142 0x04
> -			      0 143 0x04>;
> -		clocks = <&tegra_car 34>;
> -	};
> -
> -	ahb: ahb {
> -		compatible = "nvidia,tegra30-ahb";
> -		reg = <0x6000c004 0x14c>; /* AHB Arbitration + Gizmo Controller */
> -	};
> -
> -	gpio: gpio {
> -		compatible = "nvidia,tegra30-gpio";
> -		reg = <0x6000d000 0x1000>;
> -		interrupts = <0 32 0x04
> -			      0 33 0x04
> -			      0 34 0x04
> -			      0 35 0x04
> -			      0 55 0x04
> -			      0 87 0x04
> -			      0 89 0x04
> -			      0 125 0x04>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		#interrupt-cells = <2>;
> -		interrupt-controller;
> -	};
> -
> -	pinmux: pinmux {
> -		compatible = "nvidia,tegra30-pinmux";
> -		reg = <0x70000868 0xd4    /* Pad control registers */
> -		       0x70003000 0x3e4>; /* Mux registers */
> -	};
> -
> -	/*
> -	 * There are two serial driver i.e. 8250 based simple serial
> -	 * driver and APB DMA based serial driver for higher baudrate
> -	 * and performace. To enable the 8250 based driver, the compatible
> -	 * is "nvidia,tegra30-uart", "nvidia,tegra20-uart" and to enable
> -	 * the APB DMA based serial driver, the comptible is
> -	 * "nvidia,tegra30-hsuart", "nvidia,tegra20-hsuart".
> -	 */
> -	uarta: serial@70006000 {
> -		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006000 0x40>;
> -		reg-shift = <2>;
> -		interrupts = <0 36 0x04>;
> -		clock-frequency = <408000000>;
> -		nvidia,dma-request-selector = <&apbdma 8>;
> -		clocks = <&tegra_car 6>;
> -		status = "disabled";
> -	};
> -
> -	uartb: serial@70006040 {
> -		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006040 0x40>;
> -		reg-shift = <2>;
> -		clock-frequency = <408000000>;
> -		interrupts = <0 37 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 9>;
> -		clocks = <&tegra_car 160>;
> -		status = "disabled";
> -	};
> -
> -	uartc: serial@70006200 {
> -		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006200 0x100>;
> -		reg-shift = <2>;
> -		clock-frequency = <408000000>;
> -		interrupts = <0 46 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 10>;
> -		clocks = <&tegra_car 55>;
> -		status = "disabled";
> -	};
> -
> -	uartd: serial@70006300 {
> -		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006300 0x100>;
> -		reg-shift = <2>;
> -		clock-frequency = <408000000>;
> -		interrupts = <0 90 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 19>;
> -		clocks = <&tegra_car 65>;
> -		status = "disabled";
> -	};
> -
> -	uarte: serial@70006400 {
> -		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> -		reg = <0x70006400 0x100>;
> -		reg-shift = <2>;
> -		clock-frequency = <408000000>;
> -		interrupts = <0 91 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 20>;
> -		clocks = <&tegra_car 66>;
> -		status = "disabled";
> -	};
> -
> -	pwm: pwm {
> -		compatible = "nvidia,tegra30-pwm", "nvidia,tegra20-pwm";
> -		reg = <0x7000a000 0x100>;
> -		#pwm-cells = <2>;
> -		clocks = <&tegra_car 17>;
> -	};
> -
> -	rtc {
> -		compatible = "nvidia,tegra30-rtc", "nvidia,tegra20-rtc";
> -		reg = <0x7000e000 0x100>;
> -		interrupts = <0 2 0x04>;
> -	};
> -
> -	i2c@7000c000 {
> -		compatible =  "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> -		reg = <0x7000c000 0x100>;
> -		interrupts = <0 38 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 12>, <&tegra_car 182>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	i2c@7000c400 {
> -		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> -		reg = <0x7000c400 0x100>;
> -		interrupts = <0 84 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 54>, <&tegra_car 182>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	i2c@7000c500 {
> -		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> -		reg = <0x7000c500 0x100>;
> -		interrupts = <0 92 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 67>, <&tegra_car 182>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	i2c@7000c700 {
> -		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> -		reg = <0x7000c700 0x100>;
> -		interrupts = <0 120 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 103>, <&tegra_car 182>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	i2c@7000d000 {
> -		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> -		reg = <0x7000d000 0x100>;
> -		interrupts = <0 53 0x04>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 47>, <&tegra_car 182>;
> -		clock-names = "div-clk", "fast-clk";
> -		status = "disabled";
> -	};
> -
> -	spi@7000d400 {
> -		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> -		reg = <0x7000d400 0x200>;
> -		interrupts = <0 59 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 15>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 41>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000d600 {
> -		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> -		reg = <0x7000d600 0x200>;
> -		interrupts = <0 82 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 16>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 44>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000d800 {
> -		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> -		reg = <0x7000d480 0x200>;
> -		interrupts = <0 83 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 17>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 46>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000da00 {
> -		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> -		reg = <0x7000da00 0x200>;
> -		interrupts = <0 93 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 18>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 68>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000dc00 {
> -		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> -		reg = <0x7000dc00 0x200>;
> -		interrupts = <0 94 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 27>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 104>;
> -		status = "disabled";
> -	};
> -
> -	spi@7000de00 {
> -		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> -		reg = <0x7000de00 0x200>;
> -		interrupts = <0 79 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 28>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&tegra_car 105>;
> -		status = "disabled";
> -	};
> -
> -	kbc {
> -		compatible = "nvidia,tegra30-kbc", "nvidia,tegra20-kbc";
> -		reg = <0x7000e200 0x100>;
> -		interrupts = <0 85 0x04>;
> -		clocks = <&tegra_car 36>;
> -		status = "disabled";
> -	};
> -
> -	pmc {
> -		compatible = "nvidia,tegra20-pmc", "nvidia,tegra30-pmc";
> -		reg = <0x7000e400 0x400>;
> -	};
> -
> -	memory-controller {
> -		compatible = "nvidia,tegra30-mc";
> -		reg = <0x7000f000 0x010
> -		       0x7000f03c 0x1b4
> -		       0x7000f200 0x028
> -		       0x7000f284 0x17c>;
> -		interrupts = <0 77 0x04>;
> -	};
> -
> -	iommu {
> -		compatible = "nvidia,tegra30-smmu";
> -		reg = <0x7000f010 0x02c
> -		       0x7000f1f0 0x010
> -		       0x7000f228 0x05c>;
> -		nvidia,#asids = <4>;		/* # of ASIDs */
> -		dma-window = <0 0x40000000>;	/* IOVA start & length */
> -		nvidia,ahb = <&ahb>;
> -	};
> -
> -	ahub {
> -		compatible = "nvidia,tegra30-ahub";
> -		reg = <0x70080000 0x200
> -		       0x70080200 0x100>;
> -		interrupts = <0 103 0x04>;
> -		nvidia,dma-request-selector = <&apbdma 1>;
> -		clocks = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
> -			 <&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
> -			 <&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
> -			 <&tegra_car 110>, <&tegra_car 162>;
> -		clock-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
> -			      "i2s3", "i2s4", "dam0", "dam1", "dam2",
> -			      "spdif_in";
> -		ranges;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		tegra_i2s0: i2s@70080300 {
> -			compatible = "nvidia,tegra30-i2s";
> -			reg = <0x70080300 0x100>;
> -			nvidia,ahub-cif-ids = <4 4>;
> -			clocks = <&tegra_car 30>;
> -			status = "disabled";
> -		};
> -
> -		tegra_i2s1: i2s@70080400 {
> -			compatible = "nvidia,tegra30-i2s";
> -			reg = <0x70080400 0x100>;
> -			nvidia,ahub-cif-ids = <5 5>;
> -			clocks = <&tegra_car 11>;
> -			status = "disabled";
> -		};
> -
> -		tegra_i2s2: i2s@70080500 {
> -			compatible = "nvidia,tegra30-i2s";
> -			reg = <0x70080500 0x100>;
> -			nvidia,ahub-cif-ids = <6 6>;
> -			clocks = <&tegra_car 18>;
> -			status = "disabled";
> -		};
> -
> -		tegra_i2s3: i2s@70080600 {
> -			compatible = "nvidia,tegra30-i2s";
> -			reg = <0x70080600 0x100>;
> -			nvidia,ahub-cif-ids = <7 7>;
> -			clocks = <&tegra_car 101>;
> -			status = "disabled";
> -		};
> -
> -		tegra_i2s4: i2s@70080700 {
> -			compatible = "nvidia,tegra30-i2s";
> -			reg = <0x70080700 0x100>;
> -			nvidia,ahub-cif-ids = <8 8>;
> -			clocks = <&tegra_car 102>;
> -			status = "disabled";
> -		};
> -	};
> -
> -	sdhci@78000000 {
> -		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> -		reg = <0x78000000 0x200>;
> -		interrupts = <0 14 0x04>;
> -		clocks = <&tegra_car 14>;
> -		status = "disabled";
> -	};
> -
> -	sdhci@78000200 {
> -		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> -		reg = <0x78000200 0x200>;
> -		interrupts = <0 15 0x04>;
> -		clocks = <&tegra_car 9>;
> -		status = "disabled";
> -	};
> -
> -	sdhci@78000400 {
> -		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> -		reg = <0x78000400 0x200>;
> -		interrupts = <0 19 0x04>;
> -		clocks = <&tegra_car 69>;
> -		status = "disabled";
> -	};
> -
> -	sdhci@78000600 {
> -		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> -		reg = <0x78000600 0x200>;
> -		interrupts = <0 31 0x04>;
> -		clocks = <&tegra_car 15>;
> -		status = "disabled";
> -	};
> -
> -	cpus {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		cpu@0 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <0>;
> -		};
> -
> -		cpu@1 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <1>;
> -		};
> -
> -		cpu@2 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <2>;
> -		};
> -
> -		cpu@3 {
> -			device_type = "cpu";
> -			compatible = "arm,cortex-a9";
> -			reg = <3>;
> -		};
> -	};
> -
> -	pmu {
> -		compatible = "arm,cortex-a9-pmu";
> -		interrupts = <0 144 0x04
> -			      0 145 0x04
> -			      0 146 0x04
> -			      0 147 0x04>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/tegra30.dtsip b/arch/arm/boot/dts/tegra30.dtsip
> new file mode 100644
> index 0000000..d25975e
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra30.dtsip
> @@ -0,0 +1,579 @@
> +#include "skeleton.dtsi"
> +
> +/ {
> +	compatible = "nvidia,tegra30";
> +	interrupt-parent = <&intc>;
> +
> +	aliases {
> +		serial0 = &uarta;
> +		serial1 = &uartb;
> +		serial2 = &uartc;
> +		serial3 = &uartd;
> +		serial4 = &uarte;
> +	};
> +
> +	host1x {
> +		compatible = "nvidia,tegra30-host1x", "simple-bus";
> +		reg = <0x50000000 0x00024000>;
> +		interrupts = <0 65 0x04   /* mpcore syncpt */
> +			      0 67 0x04>; /* mpcore general */
> +		clocks = <&tegra_car 28>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		ranges = <0x54000000 0x54000000 0x04000000>;
> +
> +		mpe {
> +			compatible = "nvidia,tegra30-mpe";
> +			reg = <0x54040000 0x00040000>;
> +			interrupts = <0 68 0x04>;
> +			clocks = <&tegra_car 60>;
> +		};
> +
> +		vi {
> +			compatible = "nvidia,tegra30-vi";
> +			reg = <0x54080000 0x00040000>;
> +			interrupts = <0 69 0x04>;
> +			clocks = <&tegra_car 164>;
> +		};
> +
> +		epp {
> +			compatible = "nvidia,tegra30-epp";
> +			reg = <0x540c0000 0x00040000>;
> +			interrupts = <0 70 0x04>;
> +			clocks = <&tegra_car 19>;
> +		};
> +
> +		isp {
> +			compatible = "nvidia,tegra30-isp";
> +			reg = <0x54100000 0x00040000>;
> +			interrupts = <0 71 0x04>;
> +			clocks = <&tegra_car 23>;
> +		};
> +
> +		gr2d {
> +			compatible = "nvidia,tegra30-gr2d";
> +			reg = <0x54140000 0x00040000>;
> +			interrupts = <0 72 0x04>;
> +			clocks = <&tegra_car 21>;
> +		};
> +
> +		gr3d {
> +			compatible = "nvidia,tegra30-gr3d";
> +			reg = <0x54180000 0x00040000>;
> +			clocks = <&tegra_car 24 &tegra_car 98>;
> +			clock-names = "3d", "3d2";
> +		};
> +
> +		dc@54200000 {
> +			compatible = "nvidia,tegra30-dc";
> +			reg = <0x54200000 0x00040000>;
> +			interrupts = <0 73 0x04>;
> +			clocks = <&tegra_car 27>, <&tegra_car 179>;
> +			clock-names = "disp1", "parent";
> +
> +			rgb {
> +				status = "disabled";
> +			};
> +		};
> +
> +		dc@54240000 {
> +			compatible = "nvidia,tegra30-dc";
> +			reg = <0x54240000 0x00040000>;
> +			interrupts = <0 74 0x04>;
> +			clocks = <&tegra_car 26>, <&tegra_car 179>;
> +			clock-names = "disp2", "parent";
> +
> +			rgb {
> +				status = "disabled";
> +			};
> +		};
> +
> +		hdmi {
> +			compatible = "nvidia,tegra30-hdmi";
> +			reg = <0x54280000 0x00040000>;
> +			interrupts = <0 75 0x04>;
> +			clocks = <&tegra_car 51>, <&tegra_car 189>;
> +			clock-names = "hdmi", "parent";
> +			status = "disabled";
> +		};
> +
> +		tvo {
> +			compatible = "nvidia,tegra30-tvo";
> +			reg = <0x542c0000 0x00040000>;
> +			interrupts = <0 76 0x04>;
> +			clocks = <&tegra_car 169>;
> +			status = "disabled";
> +		};
> +
> +		dsi {
> +			compatible = "nvidia,tegra30-dsi";
> +			reg = <0x54300000 0x00040000>;
> +			clocks = <&tegra_car 48>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	timer@50004600 {
> +		compatible = "arm,cortex-a9-twd-timer";
> +		reg = <0x50040600 0x20>;
> +		interrupts = <1 13 0xf04>;
> +	};
> +
> +	intc: interrupt-controller {
> +		compatible = "arm,cortex-a9-gic";
> +		reg = <0x50041000 0x1000
> +		       0x50040100 0x0100>;
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +	};
> +
> +	cache-controller {
> +		compatible = "arm,pl310-cache";
> +		reg = <0x50043000 0x1000>;
> +		arm,data-latency = <6 6 2>;
> +		arm,tag-latency = <5 5 2>;
> +		cache-unified;
> +		cache-level = <2>;
> +	};
> +
> +	timer@60005000 {
> +		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> +		reg = <0x60005000 0x400>;
> +		interrupts = <0 0 0x04
> +			      0 1 0x04
> +			      0 41 0x04
> +			      0 42 0x04
> +			      0 121 0x04
> +			      0 122 0x04>;
> +	};
> +
> +	tegra_car: clock {
> +		compatible = "nvidia,tegra30-car";
> +		reg = <0x60006000 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
> +	apbdma: dma {
> +		compatible = "nvidia,tegra30-apbdma", "nvidia,tegra20-apbdma";
> +		reg = <0x6000a000 0x1400>;
> +		interrupts = <0 104 0x04
> +			      0 105 0x04
> +			      0 106 0x04
> +			      0 107 0x04
> +			      0 108 0x04
> +			      0 109 0x04
> +			      0 110 0x04
> +			      0 111 0x04
> +			      0 112 0x04
> +			      0 113 0x04
> +			      0 114 0x04
> +			      0 115 0x04
> +			      0 116 0x04
> +			      0 117 0x04
> +			      0 118 0x04
> +			      0 119 0x04
> +			      0 128 0x04
> +			      0 129 0x04
> +			      0 130 0x04
> +			      0 131 0x04
> +			      0 132 0x04
> +			      0 133 0x04
> +			      0 134 0x04
> +			      0 135 0x04
> +			      0 136 0x04
> +			      0 137 0x04
> +			      0 138 0x04
> +			      0 139 0x04
> +			      0 140 0x04
> +			      0 141 0x04
> +			      0 142 0x04
> +			      0 143 0x04>;
> +		clocks = <&tegra_car 34>;
> +	};
> +
> +	ahb: ahb {
> +		compatible = "nvidia,tegra30-ahb";
> +		reg = <0x6000c004 0x14c>; /* AHB Arbitration + Gizmo Controller */
> +	};
> +
> +	gpio: gpio {
> +		compatible = "nvidia,tegra30-gpio";
> +		reg = <0x6000d000 0x1000>;
> +		interrupts = <0 32 0x04
> +			      0 33 0x04
> +			      0 34 0x04
> +			      0 35 0x04
> +			      0 55 0x04
> +			      0 87 0x04
> +			      0 89 0x04
> +			      0 125 0x04>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +	};
> +
> +	pinmux: pinmux {
> +		compatible = "nvidia,tegra30-pinmux";
> +		reg = <0x70000868 0xd4    /* Pad control registers */
> +		       0x70003000 0x3e4>; /* Mux registers */
> +	};
> +
> +	/*
> +	 * There are two serial driver i.e. 8250 based simple serial
> +	 * driver and APB DMA based serial driver for higher baudrate
> +	 * and performace. To enable the 8250 based driver, the compatible
> +	 * is "nvidia,tegra30-uart", "nvidia,tegra20-uart" and to enable
> +	 * the APB DMA based serial driver, the comptible is
> +	 * "nvidia,tegra30-hsuart", "nvidia,tegra20-hsuart".
> +	 */
> +	uarta: serial@70006000 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006000 0x40>;
> +		reg-shift = <2>;
> +		interrupts = <0 36 0x04>;
> +		clock-frequency = <408000000>;
> +		nvidia,dma-request-selector = <&apbdma 8>;
> +		clocks = <&tegra_car 6>;
> +		status = "disabled";
> +	};
> +
> +	uartb: serial@70006040 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006040 0x40>;
> +		reg-shift = <2>;
> +		clock-frequency = <408000000>;
> +		interrupts = <0 37 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 9>;
> +		clocks = <&tegra_car 160>;
> +		status = "disabled";
> +	};
> +
> +	uartc: serial@70006200 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006200 0x100>;
> +		reg-shift = <2>;
> +		clock-frequency = <408000000>;
> +		interrupts = <0 46 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 10>;
> +		clocks = <&tegra_car 55>;
> +		status = "disabled";
> +	};
> +
> +	uartd: serial@70006300 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006300 0x100>;
> +		reg-shift = <2>;
> +		clock-frequency = <408000000>;
> +		interrupts = <0 90 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 19>;
> +		clocks = <&tegra_car 65>;
> +		status = "disabled";
> +	};
> +
> +	uarte: serial@70006400 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006400 0x100>;
> +		reg-shift = <2>;
> +		clock-frequency = <408000000>;
> +		interrupts = <0 91 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 20>;
> +		clocks = <&tegra_car 66>;
> +		status = "disabled";
> +	};
> +
> +	pwm: pwm {
> +		compatible = "nvidia,tegra30-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a000 0x100>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;
> +	};
> +
> +	rtc {
> +		compatible = "nvidia,tegra30-rtc", "nvidia,tegra20-rtc";
> +		reg = <0x7000e000 0x100>;
> +		interrupts = <0 2 0x04>;
> +	};
> +
> +	i2c@7000c000 {
> +		compatible =  "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000c000 0x100>;
> +		interrupts = <0 38 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 12>, <&tegra_car 182>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	i2c@7000c400 {
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000c400 0x100>;
> +		interrupts = <0 84 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 54>, <&tegra_car 182>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	i2c@7000c500 {
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000c500 0x100>;
> +		interrupts = <0 92 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 67>, <&tegra_car 182>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	i2c@7000c700 {
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000c700 0x100>;
> +		interrupts = <0 120 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 103>, <&tegra_car 182>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	i2c@7000d000 {
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000d000 0x100>;
> +		interrupts = <0 53 0x04>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 47>, <&tegra_car 182>;
> +		clock-names = "div-clk", "fast-clk";
> +		status = "disabled";
> +	};
> +
> +	spi@7000d400 {
> +		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> +		reg = <0x7000d400 0x200>;
> +		interrupts = <0 59 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 15>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 41>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000d600 {
> +		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> +		reg = <0x7000d600 0x200>;
> +		interrupts = <0 82 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 16>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 44>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000d800 {
> +		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> +		reg = <0x7000d480 0x200>;
> +		interrupts = <0 83 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 17>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 46>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000da00 {
> +		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> +		reg = <0x7000da00 0x200>;
> +		interrupts = <0 93 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 18>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 68>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000dc00 {
> +		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> +		reg = <0x7000dc00 0x200>;
> +		interrupts = <0 94 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 27>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 104>;
> +		status = "disabled";
> +	};
> +
> +	spi@7000de00 {
> +		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
> +		reg = <0x7000de00 0x200>;
> +		interrupts = <0 79 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 28>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&tegra_car 105>;
> +		status = "disabled";
> +	};
> +
> +	kbc {
> +		compatible = "nvidia,tegra30-kbc", "nvidia,tegra20-kbc";
> +		reg = <0x7000e200 0x100>;
> +		interrupts = <0 85 0x04>;
> +		clocks = <&tegra_car 36>;
> +		status = "disabled";
> +	};
> +
> +	pmc {
> +		compatible = "nvidia,tegra20-pmc", "nvidia,tegra30-pmc";
> +		reg = <0x7000e400 0x400>;
> +	};
> +
> +	memory-controller {
> +		compatible = "nvidia,tegra30-mc";
> +		reg = <0x7000f000 0x010
> +		       0x7000f03c 0x1b4
> +		       0x7000f200 0x028
> +		       0x7000f284 0x17c>;
> +		interrupts = <0 77 0x04>;
> +	};
> +
> +	iommu {
> +		compatible = "nvidia,tegra30-smmu";
> +		reg = <0x7000f010 0x02c
> +		       0x7000f1f0 0x010
> +		       0x7000f228 0x05c>;
> +		nvidia,#asids = <4>;		/* # of ASIDs */
> +		dma-window = <0 0x40000000>;	/* IOVA start & length */
> +		nvidia,ahb = <&ahb>;
> +	};
> +
> +	ahub {
> +		compatible = "nvidia,tegra30-ahub";
> +		reg = <0x70080000 0x200
> +		       0x70080200 0x100>;
> +		interrupts = <0 103 0x04>;
> +		nvidia,dma-request-selector = <&apbdma 1>;
> +		clocks = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
> +			 <&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
> +			 <&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
> +			 <&tegra_car 110>, <&tegra_car 162>;
> +		clock-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
> +			      "i2s3", "i2s4", "dam0", "dam1", "dam2",
> +			      "spdif_in";
> +		ranges;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		tegra_i2s0: i2s@70080300 {
> +			compatible = "nvidia,tegra30-i2s";
> +			reg = <0x70080300 0x100>;
> +			nvidia,ahub-cif-ids = <4 4>;
> +			clocks = <&tegra_car 30>;
> +			status = "disabled";
> +		};
> +
> +		tegra_i2s1: i2s@70080400 {
> +			compatible = "nvidia,tegra30-i2s";
> +			reg = <0x70080400 0x100>;
> +			nvidia,ahub-cif-ids = <5 5>;
> +			clocks = <&tegra_car 11>;
> +			status = "disabled";
> +		};
> +
> +		tegra_i2s2: i2s@70080500 {
> +			compatible = "nvidia,tegra30-i2s";
> +			reg = <0x70080500 0x100>;
> +			nvidia,ahub-cif-ids = <6 6>;
> +			clocks = <&tegra_car 18>;
> +			status = "disabled";
> +		};
> +
> +		tegra_i2s3: i2s@70080600 {
> +			compatible = "nvidia,tegra30-i2s";
> +			reg = <0x70080600 0x100>;
> +			nvidia,ahub-cif-ids = <7 7>;
> +			clocks = <&tegra_car 101>;
> +			status = "disabled";
> +		};
> +
> +		tegra_i2s4: i2s@70080700 {
> +			compatible = "nvidia,tegra30-i2s";
> +			reg = <0x70080700 0x100>;
> +			nvidia,ahub-cif-ids = <8 8>;
> +			clocks = <&tegra_car 102>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	sdhci@78000000 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000000 0x200>;
> +		interrupts = <0 14 0x04>;
> +		clocks = <&tegra_car 14>;
> +		status = "disabled";
> +	};
> +
> +	sdhci@78000200 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000200 0x200>;
> +		interrupts = <0 15 0x04>;
> +		clocks = <&tegra_car 9>;
> +		status = "disabled";
> +	};
> +
> +	sdhci@78000400 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000400 0x200>;
> +		interrupts = <0 19 0x04>;
> +		clocks = <&tegra_car 69>;
> +		status = "disabled";
> +	};
> +
> +	sdhci@78000600 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000600 0x200>;
> +		interrupts = <0 31 0x04>;
> +		clocks = <&tegra_car 15>;
> +		status = "disabled";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <0>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <1>;
> +		};
> +
> +		cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <2>;
> +		};
> +
> +		cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <3>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupts = <0 144 0x04
> +			      0 145 0x04
> +			      0 146 0x04
> +			      0 147 0x04>;
> +	};
> +};
> 
