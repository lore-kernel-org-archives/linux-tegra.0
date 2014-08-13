From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/5] Thermal reset support in PMC
Date: Wed, 13 Aug 2014 15:41:20 +0300
Message-ID: <1407933685-12404-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

this series adds support for hardware-triggered thermal reset to the PMC
driver. Namely, it adds device tree properties for specifying the I2C
command to be sent when thermtrip is triggered. It is to be noted
that thermtrip won't be ever triggered without a soctherm driver to
calibrate the sensors.

Git repo at
  git://github.com/cyndis/linux.git pmc-thermtrip-v2

Testing script at https://gist.github.com/cyndis/66126c9c176b5f94a76f.
If your fan stops it is working.

Mikko Perttunen (5):
  of: Add descriptions of thermtrip properties to Tegra PMC bindings
  of: Add nvidia,controller-id property to Tegra I2C bindings
  ARM: tegra124: Add I2C controller ids to device tree
  ARM: tegra: Add PMC thermtrip programming to Jetson TK1 device tree
  ARM: tegra: Add thermal reset (thermtrip) support to PMC

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |  21 ++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |   5 +
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   6 +
 arch/arm/boot/dts/tegra124.dtsi                    |   6 +
 drivers/soc/tegra/pmc.c                            | 379 ++++++++++++++-------
 5 files changed, 285 insertions(+), 132 deletions(-)

-- 
1.8.1.5
