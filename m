From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Mon, 24 Jun 2013 11:19:33 -0600
Message-ID: <51C87FA5.3000306@wwwdotorg.org>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371994685-4997-1-git-send-email-chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/23/2013 07:38 AM, Chris Desjardins wrote:

A patch description would be useful; e.g. a brief description of the
CARMA board.

> diff --git a/arch/arm/boot/dts/tegra30-carma.dts b/arch/arm/boot/dts/tegra30-carma.dts

> +/dts-v1/;

All the other *.dts files have a blank line separating the line above
here and below.

> +#include "tegra30.dtsi"

> +/**
> + * This file contains common DT entry for Carma
> + */

I don't think that comment applies; I suspect it's copied from the
Cardhu file, where there actually are separate common and
version-specific files, but I don't think there will be separate files here.

> +/ {
> +	model = "NVIDIA Tegra30 Carma evaluation board";

This board is an actual product, so I'd remove the word "evaluation" here.

> +	pcie-controller {
> +		status = "okay";
> +		pex-clk-supply = <&pex_hvdd_3v3_reg>;
> +		vdd-supply = <&ldo1_reg>;
> +		avdd-supply = <&ldo2_reg>;
> +
> +		pci@1,0 {
> +			nvidia,num-lanes = <4>;
> +		};
> +
> +		pci@2,0 {
> +			nvidia,num-lanes = <1>;
> +		};
> +
> +		pci@3,0 {
> +			status = "okay";
> +			nvidia,num-lanes = <1>;
> +		};
> +	};

I would split the PCIe node out into a separate patch. I can take the
main patch to add Carma support directly into the linux-tegra tree, and
Thierry can carry the patch that adds the PCIe node in his tree, until
his PCIe driver makes it upstream.

A note on node ordering: I'd like the nodes in the following order:

1) Any nodes that existing in #included files, in the order they existed
in the #included files.

2) Any new nodes with a reg property, sorted in order of reg value.

3) Any new nodes without a reg property, sorted alphabetically.

So, this PCIe node should go between memory and pinmux.

> +	serial@70006200 {
> +		compatible = "ns16550";

You shouldn't need to set the compatible value for this node;
tegra30.dtsi has already set it.

> +		tps62361 {
...
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <1500000>;
...
> +		pmic: tps65911@2d {
...
> +			regulators {
> +				vdd1_reg: vdd1 {
> +					regulator-name = "vddio_ddr_1v2";
> +					regulator-min-microvolt = <1200000>;
> +					regulator-max-microvolt = <1200000>;

Have you validated all these voltage levels, and *-supply properties
against the schematic or other documentation for the board? I want to
avoid accepting a DT file that sets up any of the voltages incorrectly,
which could potentially cause damage to the board/components.

> +	ahub {
> +		i2s@70080400 {
> +			status = "okay";
> +		};
> +	};

I don't see any "sound" or "audio" node. As such, I don't believe any of
that "ahub" node is required.

> +	clocks {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		clk32k_in: clock {
> +			compatible = "fixed-clock";
> +			reg=<0>;
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};

That doesn't seem to be used anywhere.

> +	regulators {
...
> +		vdd_ac_bat_reg: regulator@0 {
...
> +		};
> +
> +
> +		cp_5v_reg: regulator@2 {

There's an extra blank line there, and there's also no regulator with
reg=<1>. Is there a reason for the numbering gap?

> +	};
> +
> +
> +};

There are a couple extra blank lines there.

Out of curiosity, do you have upstream U-Boot support for Carma, or are
you using our binary bootloader, or a downstream U-Boot?
