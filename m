From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL 5/6] ARM: tegra: Tegra 30 SMP support
Date: Sun,  4 Mar 2012 12:14:01 -0800
Message-ID: <1330892042-32065-6-git-send-email-olof@lixom.net>
References: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330892042-32065-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 0f830e5c902106e7fe51460fd1e3263bea72bf41:

  Merge branch 'for-3.4/soc-drivers' into for-3.4/t30-smp (2012-02-26 14:43:43 -0800)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git tags/tegra-soc2

for you to fetch changes up to 8c690fdf465be9d97229f6bb0e6346624d6753a9:

  ARM: dt: Explicitly configure all serial ports on Tegra Cardhu (2012-03-04 10:47:30 -0800)

----------------------------------------------------------------
Tegra 30 SMP support

I did this as a separate topic branch because it depends on both the
soc and the soc-drivers branch, so it brings both of those in as a base.

This branch contains work to enable SMP support on Tegra30 and reworks
some of the SMP bringup for T20 as well.

It also contains a device tree patch that builds on top of the SMP/clock
changes in the rest of the branch, so it made more sense to apply it
here than deal with the merge conflicts back and forth.

----------------------------------------------------------------
Peter De Schrijver (10):
      ARM: tegra: cleanup use of chipid register
      ARM: tegra: export Tegra chipid
      ARM: tegra: initialize Tegra chipid early
      ARM: tegra: functions to access the flowcontroller
      ARM: tegra: rework Tegra secondary CPU core bringup
      ARM: tegra: prepare powergate.c for multiple variants
      ARM: tegra: export tegra_powergate_is_powered()
      ARM: tegra: add support for Tegra30 powerdomains
      ARM: tegra: support for Tegra30 CPU powerdomains
      ARM: tegra: support for secondary cores on Tegra30

Stephen Warren (1):
      ARM: dt: Explicitly configure all serial ports on Tegra Cardhu

 arch/arm/boot/dts/tegra-cardhu.dts           |   16 +++
 arch/arm/mach-tegra/Makefile                 |    2 +
 arch/arm/mach-tegra/board-dt-tegra30.c       |    2 +-
 arch/arm/mach-tegra/common.c                 |    4 +
 arch/arm/mach-tegra/flowctrl.c               |   62 ++++++++++
 arch/arm/mach-tegra/flowctrl.h               |    5 +
 arch/arm/mach-tegra/fuse.c                   |   18 ++-
 arch/arm/mach-tegra/fuse.h                   |    4 +
 arch/arm/mach-tegra/headsmp.S                |  167 ++++++++++++++++++++++++--
 arch/arm/mach-tegra/include/mach/iomap.h     |    3 +
 arch/arm/mach-tegra/include/mach/powergate.h |   15 ++-
 arch/arm/mach-tegra/platsmp.c                |  137 +++++++++++++++-------
 arch/arm/mach-tegra/powergate.c              |   53 +++++++-
 arch/arm/mach-tegra/reset.c                  |   84 +++++++++++++
 arch/arm/mach-tegra/reset.h                  |   50 ++++++++
 15 files changed, 558 insertions(+), 64 deletions(-)
 create mode 100644 arch/arm/mach-tegra/flowctrl.c
 create mode 100644 arch/arm/mach-tegra/reset.c
 create mode 100644 arch/arm/mach-tegra/reset.h
