From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 0/2] ARM: tegra: add clock source of PMC
Date: Wed, 3 Apr 2013 19:31:26 +0800
Message-ID: <1364988688-24613-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series add DT bindings for the source clocks of PMC. Then
getting the clok from DT and moving related code to PMC driver.

V4:
* re-organize the patch
* add the DT properties for Tegra114
V3:
* add the DT bindings for the clock source of PMC
* getting the clock from DT

Joseph Lo (2):
  ARM: dt: tegra: add clock source of PMC
  ARM: tegra: moving the CPU power timer function to PMC driver

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 29 ++++++++++++++++-
 arch/arm/boot/dts/tegra114-dalmore.dts             | 13 ++++++++
 arch/arm/boot/dts/tegra114-pluto.dts               | 13 ++++++++
 arch/arm/boot/dts/tegra114.dtsi                    |  2 ++
 arch/arm/boot/dts/tegra20-colibri-512.dtsi         | 13 ++++++++
 arch/arm/boot/dts/tegra20-harmony.dts              | 13 ++++++++
 arch/arm/boot/dts/tegra20-paz00.dts                | 13 ++++++++
 arch/arm/boot/dts/tegra20-seaboard.dts             | 13 ++++++++
 arch/arm/boot/dts/tegra20-tamonten.dtsi            | 13 ++++++++
 arch/arm/boot/dts/tegra20-trimslice.dts            | 13 ++++++++
 arch/arm/boot/dts/tegra20-ventana.dts              | 13 ++++++++
 arch/arm/boot/dts/tegra20-whistler.dts             | 13 ++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |  2 ++
 arch/arm/boot/dts/tegra30-beaver.dts               | 13 ++++++++
 arch/arm/boot/dts/tegra30-cardhu.dtsi              | 13 ++++++++
 arch/arm/boot/dts/tegra30.dtsi                     |  2 ++
 arch/arm/mach-tegra/common.c                       |  2 +-
 arch/arm/mach-tegra/pm.c                           | 37 +---------------------
 arch/arm/mach-tegra/pmc.c                          | 35 ++++++++++++++++++++
 arch/arm/mach-tegra/pmc.h                          |  4 +++
 20 files changed, 231 insertions(+), 38 deletions(-)

-- 
1.8.2
