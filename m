From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 09/10] cpuidle: tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 17:58:47 +0100
Message-ID: <20200313165848.2915133-9-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313165848.2915133-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-cpuidle

for you to fetch changes up to 382ac8e22b90e6334d373da03c17b319458b258e:

  cpuidle: tegra: Disable CC6 state if LP2 unavailable (2020-03-13 11:32:01 +0100)

This set of changes was acked by Daniel Lezcano and the preference is to
take this through the ARM SoC tree because it has a dependency on one of
the other branches (tegra-for-5.7-arm-core) that also goes through the
ARM SoC tree.

Thanks,
Thierry

----------------------------------------------------------------
cpuidle: tegra: Changes for v5.7-rc1

These changes unify CPU idle support for Tegra20, Tegra30 and Tegra114.

----------------------------------------------------------------
Dmitry Osipenko (15):
      ARM: tegra: Compile sleep-tegra20/30.S unconditionally
      ARM: tegra: Add tegra_pm_park_secondary_cpu()
      ARM: tegra: Remove pen-locking from cpuidle-tegra20
      ARM: tegra: Change tegra_set_cpu_in_lp2() type to void
      ARM: tegra: Propagate error from tegra_idle_lp2_last()
      ARM: tegra: Expose PM functions required for new cpuidle driver
      ARM: tegra: Rename some of the newly exposed PM functions
      ARM: tegra: Make outer_disable() open-coded
      ARM: tegra: cpuidle: Handle case where secondary CPU hangs on entering LP2
      ARM: tegra: cpuidle: Make abort_flag atomic
      ARM: tegra: cpuidle: Remove unnecessary memory barrier
      cpuidle: Refactor and move out NVIDIA Tegra20 driver into drivers/cpuidle
      cpuidle: tegra: Squash Tegra30 driver into the common driver
      cpuidle: tegra: Squash Tegra114 driver into the common driver
      cpuidle: tegra: Disable CC6 state if LP2 unavailable

Thierry Reding (1):
      Merge branch 'for-5.7/arm/core' into for-5.7/cpuidle

 arch/arm/mach-tegra/Makefile                     |  19 +-
 arch/arm/mach-tegra/cpuidle-tegra114.c           |  89 -----
 arch/arm/mach-tegra/cpuidle-tegra20.c            | 212 ------------
 arch/arm/mach-tegra/cpuidle-tegra30.c            | 132 --------
 arch/arm/mach-tegra/cpuidle.c                    |  50 ---
 arch/arm/mach-tegra/cpuidle.h                    |  21 --
 arch/arm/mach-tegra/irq.c                        |   3 +-
 arch/arm/mach-tegra/pm.c                         |  54 ++--
 arch/arm/mach-tegra/pm.h                         |   4 -
 arch/arm/mach-tegra/reset-handler.S              |  11 -
 arch/arm/mach-tegra/reset.h                      |   9 +-
 arch/arm/mach-tegra/sleep-tegra20.S              | 170 ----------
 arch/arm/mach-tegra/sleep-tegra30.S              |   6 +-
 arch/arm/mach-tegra/sleep.h                      |  15 -
 arch/arm/mach-tegra/tegra.c                      |   7 +-
 drivers/cpuidle/Kconfig.arm                      |   8 +
 drivers/cpuidle/Makefile                         |   1 +
 drivers/cpuidle/cpuidle-tegra.c                  | 392 +++++++++++++++++++++++
 include/soc/tegra/cpuidle.h                      |   2 +-
 {arch/arm/mach-tegra => include/soc/tegra}/irq.h |   8 +-
 include/soc/tegra/pm.h                           |  31 ++
 21 files changed, 483 insertions(+), 761 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra114.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra20.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra30.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.h
 create mode 100644 drivers/cpuidle/cpuidle-tegra.c
 rename {arch/arm/mach-tegra => include/soc/tegra}/irq.h (59%)
