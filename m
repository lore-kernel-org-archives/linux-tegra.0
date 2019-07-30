From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 00/13] Consolidate and improve NVIDIA Tegra CPUIDLE driver(s)
Date: Tue, 30 Jul 2019 20:09:42 +0300
Message-ID: <20190730170955.11987-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

I was spending quite some time recently trying to hunt down CPU-suspend
bug on Tegra30 SoC and in the end it was nailed. During that time I
realized that the CPU Idle drivers could get some polish and gain new
features, thus that's what this series does:

  1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
     into common drivers/cpuidle/ directory.

  2. Enables CPU cluster power-down idling state on Tegra30.

In the end there is a quite nice clean up of the Tegra CPUIDLE driver(s)
and of the Tegra's arch code in general. Please review, thanks!

Changelog:

v4: - Fixed compilation with !CONFIG_CACHE_L2X0 (and tested that it still
      works).

    - Replaced ktime_compare() with ktime_before() in the new driver,
      for consistency.

v3: - Addressed review comments that were made by Jon Hunter to v2 by
      splitting patches into smaller (and simpler) chunks, better
      documenting changes in the commit messages and using proper error
      codes in the code.

      Warnings are replaced with a useful error messages in the code of
      "Introduce unified driver for NVIDIA Tegra SoCs" patch.

      Secondary CPUs parking timeout increased to 100ms because I found
      that it actually may happen to take more than 1ms if CPU is running
      on a *very* low frequency.

      Added diagnostic messages that are reporting Flow Controller state
      when CPU parking fails.

      Further polished cpuidle driver's code.

      The coupled state entering is now aborted if there is a pending SGI
      (Software Generated Interrupt) because it will be lost after GIC's
      power-cycling. Like it was done by the old Tegra20 CPUIDLE driver.

v2: - Added patches to enable the new cpuidle driver in the defconfigs:

        ARM: multi_v7_defconfig: Enable Tegra cpuidle driver
        ARM: tegra: Enable Tegra cpuidle driver in tegra_defconfig

    - Dropped patches that removed CPUIDLE_FLAG_TIMER_STOP from the idling
      states because that flag actually doesn't have any negative effects,
      but still is correct for the case of a local CPU timer on older Tegra
      SoCs:

        cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP from Tegra114/124 idle-state
        cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP from all states

    - The "Add unified driver for NVIDIA Tegra SoCs" patch got more polish.
      Tegra30 and Terga114 states are now squashed into a single common C7
      state (following Parker TRM terminology, see 17.2.2.2 Power Management
      States), more comments added, etc minor changes.

Dmitry Osipenko (13):
  ARM: tegra: Remove cpuidle drivers to replace them with a new driver
  ARM: tegra: Change tegra_set_cpu_in_lp2() type to void
  ARM: tegra: Propagate error from tegra_idle_lp2_last()
  ARM: tegra: Compile sleep-tegra20/30.S unconditionally
  ARM: tegra: Expose PM functions required for new cpuidle driver
  ARM: tegra: Rename some of the newly exposed PM functions
  ARM: tegra: Add tegra_pm_park_secondary_cpu()
  clk: tegra: Add missing stubs for the case of !CONFIG_PM_SLEEP
  cpuidle: Introduce unified driver for NVIDIA Tegra SoCs
  cpuidle: tegra: Support CPU cluster power-down state on Tegra30
  ARM: tegra: Create simple platform device for cpuidle driver
  ARM: multi_v7_defconfig: Enable Tegra cpuidle driver
  ARM: tegra: Enable Tegra cpuidle driver in tegra_defconfig

 arch/arm/configs/multi_v7_defconfig           |   1 +
 arch/arm/configs/tegra_defconfig              |   1 +
 arch/arm/mach-tegra/Makefile                  |  23 +-
 arch/arm/mach-tegra/cpuidle-tegra114.c        |  89 -----
 arch/arm/mach-tegra/cpuidle-tegra20.c         | 212 -----------
 arch/arm/mach-tegra/cpuidle-tegra30.c         | 132 -------
 arch/arm/mach-tegra/cpuidle.c                 |  50 ---
 arch/arm/mach-tegra/cpuidle.h                 |  21 --
 arch/arm/mach-tegra/irq.c                     |   3 +-
 arch/arm/mach-tegra/pm.c                      |  50 +--
 arch/arm/mach-tegra/pm.h                      |   4 -
 arch/arm/mach-tegra/reset-handler.S           |  11 -
 arch/arm/mach-tegra/reset.h                   |   9 +-
 arch/arm/mach-tegra/sleep-tegra20.S           | 170 ---------
 arch/arm/mach-tegra/sleep-tegra30.S           |   6 +-
 arch/arm/mach-tegra/sleep.h                   |  15 -
 arch/arm/mach-tegra/tegra.c                   |   7 +-
 drivers/cpuidle/Kconfig.arm                   |   8 +
 drivers/cpuidle/Makefile                      |   1 +
 drivers/cpuidle/cpuidle-tegra.c               | 348 ++++++++++++++++++
 drivers/soc/tegra/Kconfig                     |   1 -
 include/linux/clk/tegra.h                     |  13 +
 include/soc/tegra/cpuidle.h                   |   2 +-
 .../mach-tegra => include/soc/tegra}/irq.h    |   8 +-
 include/soc/tegra/pm.h                        |  31 ++
 25 files changed, 452 insertions(+), 764 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra114.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra20.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra30.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.h
 create mode 100644 drivers/cpuidle/cpuidle-tegra.c
 rename {arch/arm/mach-tegra => include/soc/tegra}/irq.h (59%)

-- 
2.22.0
