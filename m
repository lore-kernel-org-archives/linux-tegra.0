From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Thermal reset support in PMC
Date: Tue, 5 Aug 2014 11:12:57 +0300
Message-ID: <1407226380-747-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

this series adds support for hardware-triggered thermal reset to the PMC
driver. Namely, it adds device tree properties for specifying the I2C
command to be sent when thermtrip is triggered. It is to be noted
that thermtrip won't be ever triggered without a soctherm driver to
calibrate the sensors, but I'll follow up with that patch.

pmc.c required some juggling around to make the match data usable in
probe, since I didn't want to put the code into the initcall either, since
the soctherm driver won't be initialized by that point anyway.

Series tested on Jetson-TK1. Should work on Tegra30 and Tegra114 too.

Thanks,
Mikko

Mikko Perttunen (3):
  of: Add descriptions of thermtrip properties to Tegra PMC bindings
  ARM: tegra: Add PMC thermtrip programming to Jetson TK1 device tree
  ARM: tegra: Add thermal reset (thermtrip) support to PMC

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |  13 +
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   5 +
 drivers/soc/tegra/pmc.c                            | 348 +++++++++++++--------
 3 files changed, 234 insertions(+), 132 deletions(-)

-- 
1.8.1.5
