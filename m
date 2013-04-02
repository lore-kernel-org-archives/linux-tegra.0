From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/3] ARM: tegra: add clock source for PMC
Date: Tue, 2 Apr 2013 19:19:40 +0800
Message-ID: <1364901583-24867-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series was original introduced to clean up the PM related code after
the system suspending support series. The information about the origianl
patch set is below.

[1/3] ARM: tegra: moving the CPU power timer function to PMC driver
[2/3] ARM: tegra: refactor the pmc_pm_set function
[3/3] ARM: tegra: cpuidle: remove redundant parameters for powered-down mode

I split them up in V2. The [1/3] is integrated into this series. And should
be merged before the system suspending support series.

The [2/3] is squashed into the system suspending support v4 series.

The [3/3] become a stand alone clean up patah right after the system suspending
support series.

V3:
* add the DT bindings for the clock source of PMC
* getting the clock from DT

Joseph Lo (3):
  ARM: tegra: get PMC clock source from DT
  ARM: dts: tegra: add clock source for PMC
  ARM: tegra: moving the CPU power timer function to PMC driver

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 23 ++++++++++++++
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
 arch/arm/mach-tegra/pmc.c                          | 36 +++++++++++++++++++++
 arch/arm/mach-tegra/pmc.h                          |  4 +++
 17 files changed, 199 insertions(+), 37 deletions(-)

-- 
1.8.2
