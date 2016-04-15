From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 15 Apr 2016 16:14:40 +0100
Message-ID: <57110560.80004@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
 <5710F7A4.5070902@nvidia.com> <5710F6CA.6060700@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5710F6CA.6060700-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 15/04/16 15:12, Laxman Dewangan wrote:
> 
> On Friday 15 April 2016 07:46 PM, Jon Hunter wrote:
>> On 12/04/16 15:56, Laxman Dewangan wrote:
>>> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
>>> or 3.3V I/O voltage levels. Also IO pads can be configured for
>>> power down state if it is not in used. SW needs to configure the
>>> voltage level of IO pads based on IO rail voltage and its power
>>> state based on platform usage.
>>>
>>> Add DT binding document for detailing the DT properties for
>>> configuring IO pads voltage levels and its power state.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> [snip]
>>
>>> +Required subnode-properties:
>>> +==========================
>>> +- pins : An array of strings. Each string contains the name of an IO
>>> pads. Valid
>>> +     values for these names are listed below.
>>> +
>>> +Optional subnode-properties:
>>> +==========================
>>> +-nvidia,io-rail-voltage:    Integer. The voltage level of IO pads. The
>>> +                valid values are 1.8V and 3.3V. Macros are
>>> +                defined for these voltage levels in
>>> +                <dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h>
>>> +                    Use TEGRA210_IO_RAIL_1800000UV for 1.8V
>>> +                    Use TEGRA210_IO_RAIL_3300000UV for 3.3V
>>> +
>>> +-nvidia,io-pad-deep-power-down: Integer, representing the deep power
>>> down state
>>> +                of the IO pads. If this is enable then IO pads
>>> +                will be in power down state and interface is not
>>> +                enabled for any transaction. This is power
>>> +                saving mode of the IO pads. The macros are
>>> +                defined for enable/disable in
>>> +                <dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h>
>>> +                  TEGRA210_IO_PAD_DEEP_POWER_DOWN_DISABLE for
>>> +                    disable.
>>> +                  TEGRA210_IO_PAD_DEEP_POWER_DOWN_ENABLE for
>>> +                    enable.
>>> +Valid values for pin are:
>>> +    audio, audio-hv, cam, csia, csib, csic, csid, csie, csif,
>>> +    dbg, debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2,
>>> +    gpio, hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2,
>>> +    pex-ctrl, sdmmc1, sdmmc3, spi, spi-hv, uart, usb-bias, usb0,
>>> +    usb1, usb2, usb3.
>> Thinking about this some more, the above are not IO pads but supply
>> pads, AFAICT. And these supply pads, are supplying the voltage to
>> various IO pads. I am not sure if these should be named vddio_xxx. The
>> 'pins' properties says these are IO pads, but this does not seem correct.
> 
> These are IO pads. One IO rail  have multiple sub pads to power down
> some of interface when not used. Like if CSIA is active, we can power
> down CSIB, CSIC etc.

To me, 'IO rail' implies a supply rail, but this is not the same as an
IO pad (or pin/ball). And hence, I think the terminology here is confusing.

For example, audio_hv powers the following IO pads ...

DAP1_DIN
DAP1_DOUT
DAP1_FS
DAP1_SCLK
SPI2_MOSI
SPI2_MISO
SPI2_SCK
SPI2_CS0
SPI2_CS1

And sdmmc1 powers the following IO pads ...

SDMMC1_CLK
SDMMC1_CMD
SDMMC1_DAT0
SDMMC1_DAT1
SDMMC1_DAT2
SDMMC1_DAT3
SDMMC1_COMP

As for CSIA, I don't think this is a pin/pad at all, but a software
means to control the power down for the CSI_A_xxx pads. If CSIA is an IO
pad then what is the ball number for Tegra210? In the datasheet I only
see ...

CSI_A_CLK_N Y6
CSI_A_CLK_P Y7
CSI_A_D0_N Y4
CSI_A_D0_P Y5
CSI_A_D1_N Y1
CSI_A_D1_P AA1

> All CSI pads are lined to single IO rail.

I agree with this and from the data-sheet I see the rail that powers the
CSI (and DSI) interfaces is called AVDD_DSI_CSI. But again, in the DT
document you are referring to csia, csib, csic, csid, csie, csif as
pins, but these don't appear to be physical pins, and this appears to be
more of a software means to control power to the various csi_x pins.

It seems to me that each of the existing CSI_A_xxx pins/pads should be
mapped to or register with the appropriate power-down control and when
all pads are set to inactive this then triggers the power-down of all
the CSI_A_xxx pads.

Cheers
Jon
