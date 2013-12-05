From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] pinctrl: tegra: Add pincontrol driver for Tegra124 SoC
Date: Thu, 5 Dec 2013 16:27:46 +0530
Message-ID: <1386241070-4350-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add pincontrol driver for NVIDIA's Tegra124 SoCs.
This series add pincontrol driver which contains the pinmux tables
for tegra124, pincontrol dt binding doc, dtsi file change for adding
pinmux node, selecting pincontrol config for Tegra124.

Ashwini Ghuge (1):
  pinctrl: tegra: add pinmux controller driver for Tegra124

Laxman Dewangan (3):
  pinctrl: tegra: Add devicetree binding document for Tegra124
  ARM: tegra: add pinmux controller to tegra124.dtsi
  ARM: tegra: select PINCTRL_TEGRA124 for Tegra124 SoC

 .../bindings/pinctrl/nvidia,tegra124-pinmux.txt    |  137 +
 arch/arm/boot/dts/tegra124.dtsi                    |    6 +
 arch/arm/mach-tegra/Kconfig                        |    1 +
 drivers/pinctrl/Kconfig                            |    4 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-tegra124.c                 | 3147 ++++++++++++++++++++
 6 files changed, 3296 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
 create mode 100644 drivers/pinctrl/pinctrl-tegra124.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
