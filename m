From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: initial add of Colibri T30
Date: Tue, 13 May 2014 13:49:12 -0600
Message-ID: <53727738.4080901@wwwdotorg.org>
References: <cover.1400001937.git.stefan@agner.ch> <d45ec5351ce8ef03256061bdc4b0ba673bd40c66.1400001937.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d45ec5351ce8ef03256061bdc4b0ba673bd40c66.1400001937.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stefan-XLVq0VzYD2Y@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/13/2014 11:27 AM, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
> This patch adds the device tree to support Toradex Colibri T30, a
> computer on module which can be used on different carrier boards.
> 
> The module consists of a Tegra 30 SoC, two PMIC, DDR3L RAM, eMMC,
> a LM95245 temperature sensor and an AX88772B USB Ethernet
> Controller. Furthermore, there is a STMPE811 and SGTL5000 audio
> codec which are not yet supported. Anything that is not self
> contained on the module is disabled by default.
> 
> The device tree for the Evaluation Board includes the modules
> device tree and enables the supported pheripherials of the carrier
> board (the Evaluation Board supports almost all of them).

> diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts

> +#include "tegra30-colibri.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri T30 on Colibri Evaluation Board";
> +	compatible = "toradex,colibri_t30-eval-v3", "nvidia,tegra30";

That should include all the compatible values "inherited" from the
Colibri T30 module .dtsi file too.

> +	aliases {
> +		rtc0 = "/i2c@7000c000/rtc@68";
> +		rtc1 = "/i2c@7000d000/tps65911@2d";
> +		rtc2 = "/rtc@7000e000";
> +	};

Wow, no shortage of RTCs!

> +	/* SPI1: Colibri SSP */
> +	spi@7000d400 {
> +		status = "okay";
> +		spi-max-frequency = <25000000>;
> +		can0: can@0 {
> +			compatible = "microchip,mcp2515";
> +			reg = <0>;
> +			clocks = <&clk16m>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
> +			spi-max-frequency = <10000000>;

So this chip doesn't get confused by a faster clock frequency when its
chip-select line isn't asserted? I would have expected spi-max-frequency
for the bus to be the minimum value that any device on the bus would
tolerate.

> +	/* EHCI instance 0: USB1_DP/N -> USBC_P/N */
> +	usb@7d000000 {
> +		status = "okay";
> +		dr_mode = "otg";

The dr_mode property is only for the PHY node.

> +	panel: panel {
> +		compatible = "edt,et057090dhu", "simple-panel";

The panel-simple driver doesn't seem to know about that EDT panel. How
will it work out the display timings?

> diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi

> +/ {
> +	model = "Toradex Colibri T30";
> +	compatible = "toradex,colibri_t30-v11b",
> +		     "toradex,colibri_t30-v11c",
> +		     "toradex,colibri_t30-v11d",
> +		     "toradex,colibri_t30", "nvidia,tegra30";

Do we really need all those compatible values? If those board revisions
are all SW-compatible, then you may as well write just:

	compatible = "toradex,colibri_t30", "nvidia,tegra30";

> +	aliases {
> +		serial0 = &uarta;
> +		serial1 = &uartd;
> +		serial2 = &uartb;
> +	};

tegra20.dtsi already sets the alias names for the serial ports. Previous
discussions settled on giving each on-chip UART a static name, rather
than renaming them per board.

> +	pmc@7000e400 {
> +		status = "okay";

The PMC node isn't disabled in tegra20.dtsi, so you don't need the
status property here.
