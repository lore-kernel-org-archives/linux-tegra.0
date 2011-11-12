From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 01/10] arm/tegra: initial device tree for tegra30
Date: Fri, 11 Nov 2011 21:26:30 -0600
Message-ID: <4EBDE766.5080505@gmail.com>
References: <1321010541-31337-1-git-send-email-pdeschrijver@nvidia.com> <1321010541-31337-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321010541-31337-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/11/2011 05:22 AM, Peter De Schrijver wrote:
> This patch adds the initial device tree for tegra30
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra30.dtsi |  127 ++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 127 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/tegra30.dtsi
> 
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> new file mode 100644
> index 0000000..fabe243
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -0,0 +1,127 @@
> +/include/ "skeleton.dtsi"
> +
> +/ {
> +	compatible = "nvidia,tegra30";

Needs documentation.

> +	interrupt-parent = <&intc>;
> +
> +	intc: interrupt-controller@50041000 {
> +		compatible = "nvidia,tegra30-gic", "nvidia,tegra20-gic";
> +		interrupt-controller;
> +		#interrupt-cells = <1>;

Is the Tegra GIC really different from a standard A9 gic? You need to
update to use the gic binding. The cells should be 3 for example.

Rob

> +		reg = < 0x50041000 0x1000 >,
> +		      < 0x50040100 0x0100 >;
> +	};
> +
> +	i2c@7000c000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible =  "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000C000 0x100>;
> +		interrupts = < 70 >;
> +	};
> +
> +	i2c@7000c400 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000C400 0x100>;
> +		interrupts = < 116 >;
> +	};
> +
> +	i2c@7000c500 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000C500 0x100>;
> +		interrupts = < 124 >;
> +	};
> +
> +	i2c@7000c700 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000c700 0x100>;
> +		interrupts = < 152 >;
> +	};
> +
> +	i2c@7000d000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
> +		reg = <0x7000D000 0x100>;
> +		interrupts = < 85 >;
> +	};
> +
> +	gpio: gpio@6000d000 {
> +		compatible = "nvidia,tegra30-gpio", "nvidia,tegra20-gpio";
> +		reg = < 0x6000d000 0x1000 >;
> +		interrupts = < 64 65 66 67 87 119 121 >;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	serial@70006000 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006000 0x40>;
> +		reg-shift = <2>;
> +		interrupts = < 68 >;
> +	};
> +
> +	serial@70006040 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006040 0x40>;
> +		reg-shift = <2>;
> +		interrupts = < 69 >;
> +	};
> +
> +	serial@70006200 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006200 0x100>;
> +		reg-shift = <2>;
> +		interrupts = < 78 >;
> +	};
> +
> +	serial@70006300 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006300 0x100>;
> +		reg-shift = <2>;
> +		interrupts = < 122 >;
> +	};
> +
> +	serial@70006400 {
> +		compatible = "nvidia,tegra30-uart", "nvidia,tegra20-uart";
> +		reg = <0x70006400 0x100>;
> +		reg-shift = <2>;
> +		interrupts = < 123 >;
> +	};
> +
> +	sdhci@78000000 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000000 0x200>;
> +		interrupts = < 46 >;
> +	};
> +
> +	sdhci@78000200 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000200 0x200>;
> +		interrupts = < 47 >;
> +	};
> +
> +	sdhci@78000400 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000400 0x200>;
> +		interrupts = < 51 >;
> +	};
> +
> +	sdhci@78000600 {
> +		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> +		reg = <0x78000600 0x200>;
> +		interrupts = < 63 >;
> +	};
> +
> +	pinmux: pinmux@70000000 {
> +		compatible = "nvidia,tegra30-pinmux";
> +		reg = < 0x70000868 0xd0     /* Pad control registers */
> +			0x70003000 0x3e0 >; /* Mux registers */
> +	};
> +};
