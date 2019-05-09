From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [Patch-V2 1/4] dt-binding: Tegra194 pinctrl support
Date: Thu, 9 May 2019 10:41:40 +0100
Message-ID: <41dbf606-0a15-a0bc-07fd-2c7101d7f6a1@nvidia.com>
References: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>, linus.walleij@linaro.org, thierry.reding@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org


On 09/05/2019 09:08, Krishna Yarlagadda wrote:
> Add binding doc for Tegra 194 pinctrl driver
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
> Changes in V2:
> created new binding doc to handle Tegra194 pinctrl driver
> 
>  .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> new file mode 100644
> index 0000000..80e36c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> @@ -0,0 +1,116 @@
> +NVIDIA Tegra194 pinmux controller
> +
> +Required properties:
> +- compatible: "nvidia,tegra194-pinmux"
> +- reg: Should contain a list of base address and size pairs for:
> +  - first entry: The APB_MISC_GP_*_PADCTRL registers (pad control)
> +  - second entry: The PINMUX_AUX_* registers (pinmux)
> +
> +Please refer to pinctrl-bindings.txt in this directory for details of the
> +common pinctrl bindings used by client devices, including the meaning of the
> +phrase "pin configuration node".
> +
> +Tegra's pin configuration nodes act as a container for an arbitrary number of
> +subnodes. Each of these subnodes represents some desired configuration for a
> +pin, a group, or a list of pins or groups. This configuration can include the
> +mux function to select on those pin(s)/group(s), and various pin configuration
> +parameters, such as pull-up, tristate, drive strength, etc.
> +
> +See the TRM to determine which properties and values apply to each pin/group.
> +Macro values for property values are defined in
> +include/dt-binding/pinctrl/pinctrl-tegra.h.
> +
> +Required subnode-properties:
> +- nvidia,pins : An array of strings. Each string contains the name of a pin or
> +    group. Valid values for these names are listed below.
> +
> +Optional subnode-properties:
> +- nvidia,function: A string containing the name of the function to mux to the
> +    pin or group.
> +- nvidia,pull: Integer, representing the pull-down/up to apply to the pin.
> +    0: none, 1: down, 2: up.
> +- nvidia,tristate: Integer.
> +    0: drive, 1: tristate.
> +- nvidia,enable-input: Integer. Enable the pin's input path.
> +    enable :TEGRA_PIN_ENABLE and
> +    disable or output only: TEGRA_PIN_DISABLE.
> +- nvidia,open-drain: Integer.
> +    enable: TEGRA_PIN_ENABLE.
> +    disable: TEGRA_PIN_DISABLE.
> +- nvidia,lock: Integer. Lock the pin configuration against further changes
> +    until reset.
> +    enable: TEGRA_PIN_ENABLE.
> +    disable: TEGRA_PIN_DISABLE.
> +- nvidia,io-hv: Integer. Select high-voltage receivers.
> +    normal: TEGRA_PIN_DISABLE
> +    high: TEGRA_PIN_ENABLE
> +- nvidia,high-speed-mode: Integer. Enable high speed mode the pins.
> +    normal: TEGRA_PIN_DISABLE
> +    high: TEGRA_PIN_ENABLE
> +- nvidia,schmitt: Integer. Enables Schmitt Trigger on the input.
> +    normal: TEGRA_PIN_DISABLE
> +    high: TEGRA_PIN_ENABLE
> +- nvidia,drive-type: Integer. Valid range 0...3.
> +- nvidia,pull-down-strength: Integer. Controls drive strength. 0 is weakest.
> +    The range of valid values depends on the pingroup. See "CAL_DRVDN" in the
> +    Tegra TRM.
> +- nvidia,pull-up-strength: Integer. Controls drive strength. 0 is weakest.
> +    The range of valid values depends on the pingroup. See "CAL_DRVUP" in the
> +    Tegra TRM.
> +- nvidia,slew-rate-rising: Integer. Controls rising signal slew rate. 0 is
> +    fastest. The range of valid values depends on the pingroup. See
> +    "DRVDN_SLWR" in the Tegra TRM.
> +- nvidia,slew-rate-falling: Integer. Controls falling signal slew rate. 0 is
> +    fastest. The range of valid values depends on the pingroup. See
> +    "DRVUP_SLWF" in the Tegra TRM.

Are all these properties applicable to the pex_l5_clkreq and pex_l5_rst
pins? Particularly the slew-rate properties?

Cheers
Jon

-- 
nvpublic
