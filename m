From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/6] ARM: tegra: add CPU hotplug support
Date: Thu, 16 Aug 2012 17:31:47 +0800
Message-ID: <1345109513-21553-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch set adds CPU hotplug support for Tegra20 and Tegra30 SoCs.

The first 3 patches make the CPU clock and reset control be a module and
the abstraction APIs for TegraXX SoCs. And clean up some codes for later
usage. Then add CPU hotplug support for Tegra20 and Tegra30.

Verified on Seaboard(Tegra20) and Cardhu(Tegra30)

V3:
* fix the build error when HOTPLUG_CPU disabled [4/6] [5/6]
V2:
* add one more patch for enable HOTPLUG_CPU [6/6]
* move all the SoC specific CPU shutdown code into platform_cpu_die [4/6]

Joseph Lo (6):
  ARM: tegra: introduce tegra_cpu_car_ops structures
  ARM: tegra: replace the CPU CAR access code by tegra_cpu_car_ops
  ARM: tegra: clean up the common assembly macros into sleep.h
  ARM: tegra30: add CPU hotplug support
  ARM: tegra20: add CPU hotplug support
  ARM: tegra: defconfig: enable HOTPLUG_CPU

 arch/arm/configs/tegra_defconfig          |    1 +
 arch/arm/mach-tegra/Makefile              |    2 +
 arch/arm/mach-tegra/clock.c               |    4 +
 arch/arm/mach-tegra/common.c              |    3 +
 arch/arm/mach-tegra/headsmp.S             |    6 +-
 arch/arm/mach-tegra/hotplug.c             |  118 ++++++++---------------------
 arch/arm/mach-tegra/platsmp.c             |   29 +------
 arch/arm/mach-tegra/sleep-t20.S           |   82 ++++++++++++++++++++
 arch/arm/mach-tegra/sleep-t30.S           |  107 ++++++++++++++++++++++++++
 arch/arm/mach-tegra/sleep.S               |   33 +--------
 arch/arm/mach-tegra/sleep.h               |   85 +++++++++++++++++++++
 arch/arm/mach-tegra/tegra20_clocks.c      |   70 +++++++++++++++++
 arch/arm/mach-tegra/tegra20_clocks_data.c |    2 +
 arch/arm/mach-tegra/tegra30_clocks.c      |   72 +++++++++++++++++
 arch/arm/mach-tegra/tegra30_clocks_data.c |    3 +
 arch/arm/mach-tegra/tegra_cpu_car.h       |   87 +++++++++++++++++++++
 16 files changed, 557 insertions(+), 147 deletions(-)
 create mode 100644 arch/arm/mach-tegra/sleep-t20.S
 create mode 100644 arch/arm/mach-tegra/sleep-t30.S
 create mode 100644 arch/arm/mach-tegra/sleep.h
 create mode 100644 arch/arm/mach-tegra/tegra_cpu_car.h
