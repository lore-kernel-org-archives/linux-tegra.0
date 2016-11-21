From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Mon, 21 Nov 2016 21:01:29 +0000
Message-ID: <29e19381-9250-3059-b083-49e8ab56ea7f@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com>
 <1478696782-11657-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478696782-11657-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/11/16 13:06, Laxman Dewangan wrote:
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
> This driver adds the IO pad driver to configure the power state and
> IO pad voltage based on the usage and power tree via pincontrol
> framework. The configuration can be static and dynamic.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes from V1:
> - Dropped the custom properties to set pad voltage and use regulator.
> - Added support for regulator to get vottage in boot and configure IO
>   pad voltage.
> - Add support for callback to handle regulator notification and configure
>   IO pad voltage based on voltage change.
> ---
>  drivers/pinctrl/tegra/Kconfig                |  12 +
>  drivers/pinctrl/tegra/Makefile               |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c | 488 +++++++++++++++++++++++++++
>  3 files changed, 501 insertions(+)
>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c

...

> +#define TEGRA124_PAD_INFO_TABLE(_entry_)			\
> +	_entry_(0, "audio", AUDIO, true, NULL),			\
> +	_entry_(1, "bb", BB, true, NULL),			\
> +	_entry_(2, "cam", CAM, true, NULL),			\
> +	_entry_(3, "comp", COMP, true, NULL),			\
> +	_entry_(4, "csia", CSIA, true, NULL),			\
> +	_entry_(5, "csib", CSIB, true, NULL),			\
> +	_entry_(6, "csie", CSIE, true, NULL),			\
> +	_entry_(7, "dsi", DSI, true, NULL),			\
> +	_entry_(8, "dsib", DSIB, true, NULL),			\
> +	_entry_(9, "dsic", DSIC, true, NULL),			\
> +	_entry_(10, "dsid", DSID, true, NULL),			\
> +	_entry_(11, "hdmi", HDMI, true, NULL),			\
> +	_entry_(12, "hsic", HSIC, true, NULL),			\
> +	_entry_(13, "hv", HV, true, NULL),			\
> +	_entry_(14, "lvds", LVDS, true, NULL),			\
> +	_entry_(15, "mipi-bias", MIPI_BIAS, true, NULL),	\
> +	_entry_(16, "nand", NAND, true, NULL),			\
> +	_entry_(17, "pex-bias", PEX_BIAS, true, NULL),		\
> +	_entry_(18, "pex-clk1", PEX_CLK1, true, NULL),		\
> +	_entry_(19, "pex-clk2", PEX_CLK2, true, NULL),		\
> +	_entry_(20, "pex-ctrl", PEX_CNTRL, true, NULL),		\
> +	_entry_(21, "sdmmc1", SDMMC1, true, NULL),		\
> +	_entry_(22, "sdmmc3", SDMMC3, true, NULL),		\
> +	_entry_(23, "sdmmc4", SDMMC4, true, NULL),		\
> +	_entry_(24, "sys-ddc", SYS_DDC, true, NULL),		\
> +	_entry_(25, "uart", UART, true, NULL),			\
> +	_entry_(26, "usb0", USB0, true, NULL),			\
> +	_entry_(27, "usb1", USB1, true, NULL),			\
> +	_entry_(28, "usb2", USB2, true, NULL),			\
> +	_entry_(29, "usb-bias", USB_BIAS, true, NULL)
> +
> +#define TEGRA210_PAD_INFO_TABLE(_entry_)			\
> +	_entry_(0, "audio", AUDIO, true, "vddio-audio"),	\
> +	_entry_(1, "audio-hv", AUDIO_HV, true, "vddio-audio-hv"), \
> +	_entry_(2, "cam", CAM, true, "vddio-cam"),		\
> +	_entry_(3, "csia", CSIA, true, NULL),			\
> +	_entry_(4, "csib", CSIB, true, NULL),			\
> +	_entry_(5, "csic", CSIC, true, NULL),			\
> +	_entry_(6, "csid", CSID, true, NULL),			\
> +	_entry_(7, "csie", CSIE, true, NULL),			\
> +	_entry_(8, "csif", CSIF, true, NULL),			\
> +	_entry_(9, "dbg", DBG, true, "vddio-dbg"),		\
> +	_entry_(10, "debug-nonao", DEBUG_NONAO, true, NULL),	\
> +	_entry_(11, "dmic", DMIC, true, "vddio-dmic"),		\
> +	_entry_(12, "dp", DP, true, NULL),			\
> +	_entry_(13, "dsi", DSI, true, NULL),			\
> +	_entry_(14, "dsib", DSIB, true, NULL),			\
> +	_entry_(15, "dsic", DSIC, true, NULL),			\
> +	_entry_(16, "dsid", DSID, true, NULL),			\
> +	_entry_(17, "emmc", SDMMC4, true, NULL),		\
> +	_entry_(18, "emmc2", EMMC2, true, NULL),		\
> +	_entry_(19, "gpio", GPIO, true, "vddio-gpio"),		\
> +	_entry_(20, "hdmi", HDMI, true, NULL),			\
> +	_entry_(21, "hsic", HSIC, true, NULL),			\
> +	_entry_(22, "lvds", LVDS, true, NULL),			\
> +	_entry_(23, "mipi-bias", MIPI_BIAS, true, NULL),	\
> +	_entry_(24, "pex-bias", PEX_BIAS, true, NULL),		\
> +	_entry_(25, "pex-clk1", PEX_CLK1, true, NULL),		\
> +	_entry_(26, "pex-clk2", PEX_CLK2, true, NULL),		\
> +	_entry_(27, "pex-ctrl", PEX_CNTRL, false, "vddio-pex-ctrl"), \
> +	_entry_(28, "sdmmc1", SDMMC1, true, "vddio-sdmmc1"),	\
> +	_entry_(29, "sdmmc3", SDMMC3, true, "vddio-sdmmc3"),	\
> +	_entry_(30, "spi", SPI, true, "vddio-spi"),		\
> +	_entry_(31, "spi-hv", SPI_HV, true, "vddio-spi-hv"),	\
> +	_entry_(32, "uart", UART, true, "vddio-uart"),		\
> +	_entry_(33, "usb0", USB0, true, NULL),			\
> +	_entry_(34, "usb1", USB1, true, NULL),			\
> +	_entry_(35, "usb2", USB2, true, NULL),			\
> +	_entry_(36, "usb3", USB3, true, NULL),			\
> +	_entry_(37, "usb-bias", USB_BIAS, true, NULL)

Can you also fix these checkpatch errors ...

ERROR: Macros with complex values should be enclosed in parentheses
#424: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:350:

ERROR: Macros with complex values should be enclosed in parentheses
#456: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:382:

Cheers
Jon

-- 
nvpublic
