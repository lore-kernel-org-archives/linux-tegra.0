From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: Tegra: Move Harmony .dts file to correct place
Date: Fri, 29 Apr 2011 17:36:33 -0600
Message-ID: <20110429233633.GN7497@ponder.secretlab.ca>
References: <1303619404-27604-1-git-send-email-swarren@nvidia.com>
 <1303619404-27604-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303619404-27604-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 23, 2011 at 10:30:04PM -0600, Stephen Warren wrote:
> The following workflow:
> 
> make dtbs
> make dtbuImage # See my earlier patch which adds this based on
>                  Jeremy Kerr's patch to add a dtbImage target.
> 
> ... seems to require the *.dts file to be in arch/arm/boot/dts. I'm not
> sure if any other devicetree testing flows will be negatively affected by
> this change.

Yeah, I started on the tegra work quite a while ago before dts files
started getting put into arch/arm/boot/dts.  I'll also squash this
into the board support patch in devicetree/test.

Thanks,
g.

> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra-harmony.dts   |  110 +++++++++++++++++++++++++++++++-
>  arch/arm/mach-tegra/board-harmony.dts |  113 ---------------------------------
>  2 files changed, 108 insertions(+), 115 deletions(-)
>  delete mode 100644 arch/arm/mach-tegra/board-harmony.dts
> 
> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
> index 81032e7..82fa0c2 100644
> --- a/arch/arm/boot/dts/tegra-harmony.dts
> +++ b/arch/arm/boot/dts/tegra-harmony.dts
> @@ -1,7 +1,113 @@
> +
>  /dts-v1/;
> -/include/ "skeleton.dtsi"
>  
>  / {
> -	model = "NVIDIA Tegra2 Harmony evaluation board";
> +	model = "nVidia Harmony";
>  	compatible = "nvidia,harmony", "nvidia,tegra250";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	chosen {
> +		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootdelay=2";
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = < 0x00000000 0x1C000000
> +		        0x20000000 0x20000000 >;
> +	};
> +
> +	amba {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		intc: intc {
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +	};
> +
> +	gpio: gpio@6000d000 {
> +		compatible = "nvidia,tegra250-gpio";
> +		reg = < 0x6000d000 0x1000 >;
> +		interrupts = < 64 65 66 67 87 119 121 >;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	serial@70006000 {
> +		compatible = "nvidia,tegra250-uart";
> +		reg = <0x70006000 0x40>;
> +		reg-shift = <2>;
> +		interrupts = < 68 >;
> +		status = "disabled";
> +	};
> +
> +	serial@70006040 {
> +		compatible = "nvidia,tegra250-uart";
> +		reg = <0x70006040 0x40>;
> +		reg-shift = <2>;
> +		interrupts = < 69 >;
> +		status = "disabled";
> +	};
> +
> +	serial@70006200 {
> +		compatible = "nvidia,tegra250-uart";
> +		reg = <0x70006200 0x100>;
> +		reg-shift = <2>;
> +		interrupts = < 78 >;
> +		status = "disabled";
> +	};
> +
> +	serial@70006300 {
> +		compatible = "nvidia,tegra250-uart";
> +		reg = <0x70006300 0x100>;
> +		reg-shift = <2>;
> +		interrupts = < 122 >;
> +
> +		clock-frequency = < 216000000 >;
> +	};
> +
> +	serial@70006400 {
> +		compatible = "nvidia,tegra250-uart";
> +		reg = <0x70006400 0x100>;
> +		reg-shift = <2>;
> +		interrupts = < 123 >;
> +		status = "disabled";
> +	};
> +
> +	sdhci@c8000000 {
> +		compatible = "nvidia,tegra250-sdhci";
> +		reg = <0xc8000000 0x200>;
> +		interrupts = < 46 >;
> +		status = "disabled";
> +	};
> +
> +	sdhci@c8000200 {
> +		compatible = "nvidia,tegra250-sdhci";
> +		reg = <0xc8000200 0x200>;
> +		interrupts = < 47 >;
> +		gpios = <&gpio 69 0>, /* cd, gpio PI5 */
> +			<&gpio 57 0>, /* wp, gpio PH1 */
> +			<&gpio 155 0>; /* power, gpio PT3 */
> +	};
> +
> +	sdhci@c8000400 {
> +		compatible = "nvidia,tegra250-sdhci";
> +		reg = <0xc8000400 0x200>;
> +		interrupts = < 51 >;
> +		status = "disabled";
> +	};
> +
> +	sdhci@c8000600 {
> +		compatible = "nvidia,tegra250-sdhci";
> +		reg = <0xc8000600 0x200>;
> +		interrupts = < 63 >;
> +		gpios = <&gpio 58 0>, /* cd, gpio PH2 */
> +			<&gpio 59 0>, /* wp, gpio PH3 */
> +			<&gpio 70 0>; /* power, gpio PI6 */
> +	};
>  };
> diff --git a/arch/arm/mach-tegra/board-harmony.dts b/arch/arm/mach-tegra/board-harmony.dts
> deleted file mode 100644
> index 82fa0c2..0000000
> --- a/arch/arm/mach-tegra/board-harmony.dts
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -
> -/dts-v1/;
> -
> -/ {
> -	model = "nVidia Harmony";
> -	compatible = "nvidia,harmony", "nvidia,tegra250";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	interrupt-parent = <&intc>;
> -
> -	chosen {
> -		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootdelay=2";
> -	};
> -
> -	memory {
> -		device_type = "memory";
> -		reg = < 0x00000000 0x1C000000
> -		        0x20000000 0x20000000 >;
> -	};
> -
> -	amba {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		intc: intc {
> -			interrupt-controller;
> -			#interrupt-cells = <1>;
> -		};
> -	};
> -
> -	gpio: gpio@6000d000 {
> -		compatible = "nvidia,tegra250-gpio";
> -		reg = < 0x6000d000 0x1000 >;
> -		interrupts = < 64 65 66 67 87 119 121 >;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -	};
> -
> -	serial@70006000 {
> -		compatible = "nvidia,tegra250-uart";
> -		reg = <0x70006000 0x40>;
> -		reg-shift = <2>;
> -		interrupts = < 68 >;
> -		status = "disabled";
> -	};
> -
> -	serial@70006040 {
> -		compatible = "nvidia,tegra250-uart";
> -		reg = <0x70006040 0x40>;
> -		reg-shift = <2>;
> -		interrupts = < 69 >;
> -		status = "disabled";
> -	};
> -
> -	serial@70006200 {
> -		compatible = "nvidia,tegra250-uart";
> -		reg = <0x70006200 0x100>;
> -		reg-shift = <2>;
> -		interrupts = < 78 >;
> -		status = "disabled";
> -	};
> -
> -	serial@70006300 {
> -		compatible = "nvidia,tegra250-uart";
> -		reg = <0x70006300 0x100>;
> -		reg-shift = <2>;
> -		interrupts = < 122 >;
> -
> -		clock-frequency = < 216000000 >;
> -	};
> -
> -	serial@70006400 {
> -		compatible = "nvidia,tegra250-uart";
> -		reg = <0x70006400 0x100>;
> -		reg-shift = <2>;
> -		interrupts = < 123 >;
> -		status = "disabled";
> -	};
> -
> -	sdhci@c8000000 {
> -		compatible = "nvidia,tegra250-sdhci";
> -		reg = <0xc8000000 0x200>;
> -		interrupts = < 46 >;
> -		status = "disabled";
> -	};
> -
> -	sdhci@c8000200 {
> -		compatible = "nvidia,tegra250-sdhci";
> -		reg = <0xc8000200 0x200>;
> -		interrupts = < 47 >;
> -		gpios = <&gpio 69 0>, /* cd, gpio PI5 */
> -			<&gpio 57 0>, /* wp, gpio PH1 */
> -			<&gpio 155 0>; /* power, gpio PT3 */
> -	};
> -
> -	sdhci@c8000400 {
> -		compatible = "nvidia,tegra250-sdhci";
> -		reg = <0xc8000400 0x200>;
> -		interrupts = < 51 >;
> -		status = "disabled";
> -	};
> -
> -	sdhci@c8000600 {
> -		compatible = "nvidia,tegra250-sdhci";
> -		reg = <0xc8000600 0x200>;
> -		interrupts = < 63 >;
> -		gpios = <&gpio 58 0>, /* cd, gpio PH2 */
> -			<&gpio 59 0>, /* wp, gpio PH3 */
> -			<&gpio 70 0>; /* power, gpio PI6 */
> -	};
> -};
> -- 
> 1.7.1
> 
