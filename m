From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/7] pinctrl: soc/tegra: Add support to configure IO rail voltage and pad power states
Date: Tue, 12 Apr 2016 20:26:40 +0530
Message-ID: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
or 3.3V I/O voltage levels. Also the IO pads can be configured
for power down state if it is not used. SW needs to configure the
voltage level of IO pads based on IO rail voltage and its power
state based on platform usage.
    
The voltage rail configuration and pad power states are done in
Tegra PMC registers.

This series add the required interface in soc/tegra/pmc for required
configruations.  This series also add the pincontrol driver for tegra210
IO pads conifguration. This will helps to provide framework for IO pad
configurations via pincontrol DT support and pincontrol dynamic
configruations.

Laxman Dewangan (7):
  soc/tegra: pmc: Use BIT macro for register field definition
  soc/tegra: pmc: Add new Tegra210 IO rails
  soc/tegra: pmc: Add interface to get IO rail power status
  soc/tegra: pmc: Add interface to set voltage of IO rails
  soc/tegra: pmc: Register sub-devices of PMC
  pinctrl: tegra: Add DT binding for io pads control
  pinctrl: tegra: Add driver to configure voltage and power state of io
    pads

 .../bindings/pinctrl/nvidia,tegra210-io-pad.txt    | 102 +++++++
 drivers/pinctrl/tegra/Kconfig                      |  11 +
 drivers/pinctrl/tegra/Makefile                     |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c    | 302 +++++++++++++++++++++
 drivers/soc/tegra/pmc.c                            | 159 +++++++++--
 .../dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h  |  24 ++
 include/soc/tegra/pmc.h                            |  52 ++++
 7 files changed, 630 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
