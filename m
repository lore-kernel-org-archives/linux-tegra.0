From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL 3/6] ARM: tegra: SoC updates
Date: Sun,  4 Mar 2012 12:13:59 -0800
Message-ID: <1330892042-32065-4-git-send-email-olof@lixom.net>
References: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330892042-32065-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 62aa2b537c6f5957afd98e29f96897419ed5ebab:

  Linux 3.3-rc2 (2012-01-31 13:31:54 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git tags/tegra-soc

for you to fetch changes up to e186ad74c0941f5caeda28bde76dab903b342c1c:

  ARM: tegra: Demote EMC clock inconsistency BUG to WARN (2012-02-26 14:16:28 -0800)

----------------------------------------------------------------
SoC new development for tegra SoCs, mostly tegra30 core support.

It also includes one stray bugfix that was misapplied (should have been
in soc-drivers), but it went out to the stable branches before I noticed
so I've left it in.

----------------------------------------------------------------
Peter De Schrijver (9):
      ARM: tegra: add support for tegra30 interrupts
      ARM: tegra: add support for new clock framework features
      ARM: tegra: implement basic tegra30 clock framework
      ARM: tegra: enable tegra30 clock framework
      ARM: tegra: initialize basic system clocks
      ARM: tegra: definitions for flow controller
      ARM: tegra: assembler code for LP3
      ARM: tegra: cpuidle driver for tegra
      ARM: tegra: Avoid compiling cpuidle code when not configured

Stephen Warren (1):
      ARM: tegra: Demote EMC clock inconsistency BUG to WARN

 arch/arm/mach-tegra/Makefile             |    3 +
 arch/arm/mach-tegra/board-dt-tegra30.c   |   24 +-
 arch/arm/mach-tegra/clock.c              |   22 +
 arch/arm/mach-tegra/clock.h              |   15 +
 arch/arm/mach-tegra/common.c             |    1 +
 arch/arm/mach-tegra/cpuidle.c            |  107 +
 arch/arm/mach-tegra/flowctrl.h           |   37 +
 arch/arm/mach-tegra/include/mach/clk.h   |   10 +
 arch/arm/mach-tegra/include/mach/iomap.h |    3 +
 arch/arm/mach-tegra/include/mach/irqs.h  |    7 +-
 arch/arm/mach-tegra/irq.c                |   20 +-
 arch/arm/mach-tegra/sleep.S              |   91 +
 arch/arm/mach-tegra/tegra2_clocks.c      |   30 +-
 arch/arm/mach-tegra/tegra30_clocks.c     | 3099 ++++++++++++++++++++++++++++++
 14 files changed, 3456 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/mach-tegra/cpuidle.c
 create mode 100644 arch/arm/mach-tegra/flowctrl.h
 create mode 100644 arch/arm/mach-tegra/sleep.S
 create mode 100644 arch/arm/mach-tegra/tegra30_clocks.c
