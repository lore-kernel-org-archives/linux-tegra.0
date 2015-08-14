From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/9] ARM: tegra: Core SoC changes for v4.3-rc1
Date: Fri, 14 Aug 2015 16:48:35 +0200
Message-ID: <1439563720-13189-5-git-send-email-thierry.reding@gmail.com>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439563720-13189-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.3-soc

for you to fetch changes up to 1ec0e115f8604940491861d207cc1e1478db97b3:

  ARM: tegra: cpuidle: implement cpuidle_state.enter_freeze() (2015-08-13 16:53:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core SoC changes for v4.3-rc1

This contains a bit more of Tegra210 support, which is shaping up pretty
nicely. Other than that there are a couple of cleanup patches here, too.

----------------------------------------------------------------
Masahiro Yamada (1):
      soc: tegra: Remove redundant $(CONFIG_ARCH_TEGRA) in Makefile

Thierry Reding (15):
      soc/tegra: Add Tegra132 support
      soc/tegra: Add Tegra210 support
      soc/tegra: pmc: Avoid usage of uninitialized variable
      soc/tegra: pmc: Restrict legacy code to 32-bit ARM
      soc/tegra: pmc: Add Tegra210 support
      soc/tegra: fuse: Restrict legacy code to 32-bit ARM
      soc/tegra: fuse: Unify Tegra20 and Tegra30 drivers
      soc/tegra: fuse: Add Tegra210 support
      soc/tegra: fuse: Rename core_* to soc_*
      soc/tegra: fuse: Add spare bit offset for Tegra114
      soc/tegra: fuse: Add spare bit offset for Tegra124
      soc/tegra: fuse: Add spare bit offset for Tegra210
      soc/tegra: pmc: Remove unnecessary return statement
      soc/tegra: pmc: Use existing pclk reference
      ARM: tegra: Disable cpuidle if PSCI is available

Tomeu Vizoso (1):
      ARM: tegra: cpuidle: implement cpuidle_state.enter_freeze()

 arch/arm/mach-tegra/cpuidle-tegra114.c   |  19 ++-
 arch/arm/mach-tegra/iomap.h              |   3 -
 drivers/soc/tegra/Makefile               |   6 +-
 drivers/soc/tegra/common.c               |   2 +
 drivers/soc/tegra/fuse/Makefile          |   2 +
 drivers/soc/tegra/fuse/fuse-tegra.c      | 257 ++++++++++++++++++++++++-------
 drivers/soc/tegra/fuse/fuse-tegra20.c    | 175 ++++++++-------------
 drivers/soc/tegra/fuse/fuse-tegra30.c    | 232 ++++++++++------------------
 drivers/soc/tegra/fuse/fuse.h            |  95 ++++++++----
 drivers/soc/tegra/fuse/speedo-tegra114.c |  22 +--
 drivers/soc/tegra/fuse/speedo-tegra124.c |  26 ++--
 drivers/soc/tegra/fuse/speedo-tegra20.c  |  28 ++--
 drivers/soc/tegra/fuse/speedo-tegra210.c | 184 ++++++++++++++++++++++
 drivers/soc/tegra/fuse/speedo-tegra30.c  |  48 +++---
 drivers/soc/tegra/fuse/tegra-apbmisc.c   |  76 +++++++--
 drivers/soc/tegra/pmc.c                  | 125 +++++++++++----
 include/soc/tegra/fuse.h                 |   6 +-
 include/soc/tegra/pmc.h                  |   5 +
 18 files changed, 853 insertions(+), 458 deletions(-)
 create mode 100644 drivers/soc/tegra/fuse/speedo-tegra210.c
