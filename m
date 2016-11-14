From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Mon, 14 Nov 2016 13:34:32 -0600
Message-ID: <20161114193432.wi5ljtp3t46wt2c7@rob-hp-laptop>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com>
 <1478696782-11657-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478696782-11657-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, yamada.masahiro@socionext.com, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 09, 2016 at 06:36:21PM +0530, Laxman Dewangan wrote:
> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
> sources. When IO interfaces are not used then IO pads can be
> configure in low power state to reduce the power consumption from
> that IO pads.
> 
> On Tegra124, the voltage level of IO power rail source is auto
> detected by hardware(SoC) and hence it is only require to configure
> in low power mode if IO pads are not used.
> 
> On T210 onwards, the auto-detection of voltage level from IO power
> rail is removed from SoC and hence SW need to configure the PMC
> register explicitly to set proper voltage in IO pads based on
> IO rail power source voltage.
> 
> Add DT binding document for detailing the DT properties for
> configuring IO pads voltage levels and its power state.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> Changes from V1:
>  The DT binding document is modified to explain the regulator handle
>  for different IOs and how can it be passed from the DT.
> ---
>  .../bindings/pinctrl/nvidia,tegra-io-pad.txt       | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> new file mode 100644
> index 0000000..6ca961f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> @@ -0,0 +1,126 @@
> +NVIDIA Tegra PMC IO pad controller
> +
> +NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> +low power state of some of its IO pads. When IO interface are not
> +used then IO pads can be configure in low power state to reduce
> +the power from that IO pads. The IO pads can work in the voltage
> +of the 1.8V and 3.3V of IO voltage from power rail sources.
> +
> +On Tegra124, the voltage of IO power rail source is auto detected by
> +SoC and hence it is only require to configure in low power mode if
> +IO pads are not used.
> +
> +On T210 onwards, the HW based auto-detection for IO voltage is removed
> +and hence SW need to configure the PMC register explicitly, to set proper
> +voltage in IO pads, based on IO rail power source voltage.
> +
> +The voltage configurations and low power state of IO pads should be done
> +in boot if it is not going to change other wise dynamically based on IO
> +rail voltage on that IO pads and usage of IO pads

s/other wise/otherwise/

The end of the sentence is not clear and missing a period.

> +
> +The DT property of the io pads must be under the node of pmc i.e.
> +pmc@7000e400 for Tegra124 onwards.

s/io/IO/

> +
> +Please refer to <pinctrl-bindings.txt> in this directory for details of the
> +common pinctrl bindings used by client devices, including the meaning of the
> +phrase "pin configuration node".
> +
> +Tegra's pin configuration nodes act as a container for an arbitrary number of
> +subnodes. Each of these subnodes represents some desired configuration for an
> +IO pads, or a list of IO pads. This configuration can include the voltage and
> +power enable/disable control
> +
> +The name of each subnode is not important; all subnodes should be enumerated
> +and processed purely based on their content. Each subnode only affects those
> +parameters that are explicitly listed. Unspecified is represented as an absent
> +property,
> +
> +See the TRM to determine which properties and values apply to each IO pads.
> +
> +Required subnode-properties:
> +==========================
> +- pins : An array of strings. Each string contains the name of an IO pads. Valid
> +	 values for these names are listed below.
> +
> +Optional subnode-properties:
> +==========================
> +Following properties are supported from generic pin configuration explained
> +in <dt-bindings/pinctrl/pinctrl-binding.txt>.
> +low-power-enable:		enable low power mode.
> +low-power-disable:		disable low power mode.
> +
> +Valid values for pin for T124 are:
> +	audio, bb, cam, comp, csia, csib, csie, dsi, dsib, dsic, dsid, hdmi,
> +	hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2,
> +	pex-ctrl, sdmmc1, sdmmc3, sdmmc4, sys-ddc, uart, usb0, usb1, usb2,
> +	usb-bias
> +
> +Valid values for pin for T210 are:
> +	audio, audio-hv, cam, csia, csib, csic, csid, csie, csif,
> +	dbg, debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2,
> +	gpio, hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2,
> +	pex-ctrl, sdmmc1, sdmmc3, spi, spi-hv, uart, usb-bias, usb0,
> +	usb1, usb2, usb3.
> +
> +To find out the IO rail voltage for setting the voltage of IO pad by SW,
> +the regulator supply handle must provided from the DT and it is explained
> +in the regulator DT binding document
> +	<devicetree/bindings/regulator/regulator.txt>.
> +For example, for GPIO rail the supply name is vddio-gpio and regulator
> +handle is supplied from DT as
> +	vddio-gpio-supply = <&regulator_xyz>;
> +
> +For T210, following IO pads support the 1.8V/3.3V and the corresponding
> +io voltage pin names are as follows:
> +	audio -> vddio-audio
> +	audio-hv -> vddio-audio-hv
> +	cam ->vddio-cam
> +	dbg -> vddio-dbg
> +	dmic -> vddio-dmic
> +	gpio -> vddio-gpio
> +	pex-ctrl -> vddio-pex-ctrl
> +	sdmmc1 -> vddio-sdmmc1
> +	sdmmc3 -> vddio-sdmmc3
> +	spi -> vddio-spi
> +	spi-hv -> vddio-spi-hv
> +	uart -> vddio-uart
> +
> +Example:
> +	i2c@7000d000 {
> +		pmic@3c {
> +			regulators {
> +				vddio_sdmmc1: ldo2 {
> +					/* Regulator entries for LDO2 */
> +				};
> +
> +				vdd_cam: ldo3 {
> +					/* Regulator entries for LDO3 */
> +				};
> +			};
> +		};
> +	};
> +
> +	pmc@7000e400 {
> +		vddio-cam = <&vdd_cam>;

Missing -supply.

> +		vddio-sdmmc1-supply = <&vddio_sdmmc1>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tegra_io_pad_volt_default>;
> +		tegra_io_pad_volt_default: common {
> +			audio-hv {
> +				pins = "audio-hv";
> +				low-power-disable;
> +			};
> +
> +			gpio {
> +				pins = "gpio";
> +				low-power-disable;
> +			};
> +
> +			audio {
> +				pins = "audio", "dmic", "sdmmc3";

What's the purpose of grouping these?

> +				low-power-enable;
> +			};
> +		};
> +
> +	};
> -- 
> 2.1.4
> 
