From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] pinctrl: tegra124: add pinctrl driver for NVIDIA's
 Tegra124 SoC
Date: Mon, 11 Nov 2013 18:01:24 +0000
Message-ID: <20131111180124.GA27735@e106331-lin.cambridge.arm.com>
References: <1384191718-16817-1-git-send-email-aghuge@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384191718-16817-1-git-send-email-aghuge@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ashwini Ghuge <aghuge@nvidia.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "rob@landley.net" <rob@landley.net>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 11, 2013 at 05:41:58PM +0000, Ashwini Ghuge wrote:
> The driver uses the common Tegra pinctrl driver utility functions to
> implement the majority of the driver. It is based on the similar Tegra114
> pinctrl
> 
> Signed-off-by: Ashwini Ghuge <aghuge@nvidia.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra124-pinctrl.txt   |  120 +
>  drivers/pinctrl/Kconfig                            |    4 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-tegra124.c                 | 3125 ++++++++++++++++++++
>  4 files changed, 3250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinctrl.txt
>  create mode 100644 drivers/pinctrl/pinctrl-tegra124.c
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinctrl.txt
> new file mode 100644
> index 0000000..9d39ab9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinctrl.txt
> @@ -0,0 +1,120 @@
> +NVIDIA Tegra124 pinmux controller
> +
> +The Tegra124 pinctrl binding is very similar to the Tegra114
> +pinctrl binding, as described in nvidia,tegra114-pinmux.txt. In fact, this
> +document assumes that binding as a baseline, and only documents the
> +differences between the two bindings.
> +
> +Required properties:
> +- compatible: "nvidia,tegra124-pinmux"
> +- reg: Should contain the register physical address and length for each of
> +  the pad control and mux registers. The first bank of address must be the
> +  driver strength pad control register address and second bank address must
> +  be pinmux register address.

It might be worth using reg-names here, in case a future hardware
variant builds atop of this.

> +
> +Tegra124 has the following optional properties for pin configuration subnodes:
> +- nvidia,enable-input: Integer. Enable the pin's input path. 0: no, 1: yes.

Why are the properties representing boolean values not empty / boolean
properties (as can be handled in the kernel with of_property_read_bool)?

> +- nvidia,open-drain: Integer. Enable open drain mode. 0: no, 1: yes.
> +- nvidia,lock: Integer. Lock the pin configuration against further changes
> +    until reset. 0: no, 1: yes.
> +- nvidia,io-reset: Integer. Reset the IO path. 0: no, 1: yes.
> +- nvidia,rcv-sel: Integer. Select VIL/VIH receivers. 0: normal, 1: high.

Why not just have nvidia,rcv-high as a boolean property, and default to
normal?

> +- nvidia,drive-type: Integer. Valid range 0...3.

What do these values mean?

> +
> +As with Tegra114, see the Tegra TRM for complete details regarding which
> +groups support which functionality.

Where can I find this TRM?

[...]

> +Example:
> +
> +       pinmux: pinmux {
> +               compatible = "nvidia,tegra124-pinmux";
> +               reg = <0x70000868 0x148         /* Pad control registers */
> +                       0x70003000 0x40c>;      /* PinMux registers */

For consistency, please bracket entries in lists individually:

reg = <0x70000868 0x148>,      /* Pad control registers */
      <0x70003000 0x40c>;      /* PinMux registers */

Cheers,
Mark.
