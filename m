From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 15 Apr 2016 15:16:04 +0100
Message-ID: <5710F7A4.5070902@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/04/16 15:56, Laxman Dewangan wrote:
> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
> or 3.3V I/O voltage levels. Also IO pads can be configured for
> power down state if it is not in used. SW needs to configure the
> voltage level of IO pads based on IO rail voltage and its power
> state based on platform usage.
> 
> Add DT binding document for detailing the DT properties for
> configuring IO pads voltage levels and its power state.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

[snip]

> +Required subnode-properties:
> +==========================
> +- pins : An array of strings. Each string contains the name of an IO pads. Valid
> +	 values for these names are listed below.
> +
> +Optional subnode-properties:
> +==========================
> +-nvidia,io-rail-voltage:	Integer. The voltage level of IO pads. The
> +				valid values are 1.8V and 3.3V. Macros are
> +				defined for these voltage levels in
> +				<dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h>
> +					Use TEGRA210_IO_RAIL_1800000UV for 1.8V
> +					Use TEGRA210_IO_RAIL_3300000UV for 3.3V
> +
> +-nvidia,io-pad-deep-power-down: Integer, representing the deep power down state
> +				of the IO pads. If this is enable then IO pads
> +				will be in power down state and interface is not
> +				enabled for any transaction. This is power
> +				saving mode of the IO pads. The macros are
> +				defined for enable/disable in
> +				<dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h>
> +				  TEGRA210_IO_PAD_DEEP_POWER_DOWN_DISABLE for
> +					disable.
> +				  TEGRA210_IO_PAD_DEEP_POWER_DOWN_ENABLE for
> +					enable.
> +Valid values for pin are:
> +	audio, audio-hv, cam, csia, csib, csic, csid, csie, csif,
> +	dbg, debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2,
> +	gpio, hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2,
> +	pex-ctrl, sdmmc1, sdmmc3, spi, spi-hv, uart, usb-bias, usb0,
> +	usb1, usb2, usb3.

Thinking about this some more, the above are not IO pads but supply
pads, AFAICT. And these supply pads, are supplying the voltage to
various IO pads. I am not sure if these should be named vddio_xxx. The
'pins' properties says these are IO pads, but this does not seem correct.

We also need to think about how these supply pads are linked to the
actual IO pads. Or at least it seems they should be some how ...

Cheers
Jon
