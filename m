From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 05/10] ARM: tegra: Core changes for v5.7-rc1
Date: Fri, 13 Mar 2020 17:58:43 +0100
Message-ID: <20200313165848.2915133-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm-core

for you to fetch changes up to 650a941c341b880dae451e36dd8e47f3762a3909:

  ARM: tegra: cpuidle: Remove unnecessary memory barrier (2020-03-13 11:23:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.7-rc1

These patches a preparatory work to move the CPU idle drivers into
drivers/cpuidle.

----------------------------------------------------------------
Dmitry Osipenko (11):
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

 arch/arm/mach-tegra/Makefile                     |   6 +-
 arch/arm/mach-tegra/cpuidle-tegra114.c           |   9 +-
 arch/arm/mach-tegra/cpuidle-tegra20.c            | 111 ++++++++-------
 arch/arm/mach-tegra/cpuidle-tegra30.c            |  27 ++--
 arch/arm/mach-tegra/irq.c                        |   3 +-
 arch/arm/mach-tegra/pm.c                         |  54 ++++---
 arch/arm/mach-tegra/pm.h                         |   4 -
 arch/arm/mach-tegra/reset-handler.S              |  11 --
 arch/arm/mach-tegra/reset.h                      |   9 +-
 arch/arm/mach-tegra/sleep-tegra20.S              | 170 -----------------------
 arch/arm/mach-tegra/sleep-tegra30.S              |   6 +-
 arch/arm/mach-tegra/sleep.h                      |  15 --
 arch/arm/mach-tegra/tegra.c                      |   1 -
 {arch/arm/mach-tegra => include/soc/tegra}/irq.h |   8 +-
 include/soc/tegra/pm.h                           |  31 +++++
 15 files changed, 150 insertions(+), 315 deletions(-)
 rename {arch/arm/mach-tegra => include/soc/tegra}/irq.h (59%)
