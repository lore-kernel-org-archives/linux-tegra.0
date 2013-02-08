From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] ARM: tegra: Unify board-dt-tegra{20,30,114}
Date: Fri, 8 Feb 2013 09:29:30 +0200
Message-ID: <1360308574-19658-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Common Clock Framework(CCF) has been introduced in Tegra recently,
which could allow us to unify board-dt-tegra{20,30,114} and to have a
single DT board file as Arnd Bergmann suggested originally[1]. Still
there are some driver specific code from USB/PCIE. They would be
reverted/removed as the new DT supports are coming soon.

Verified that Dalmore(Tegra114) booted. Testing with Tegra20/Tegra30
based board would be appreciated.

The following changes since commit 82c2958263492ca8d23c5f07e183600f951edbe5:

  ARM: set evt->broadcast for clock_event devices (2013-02-06 14:11:09 -0700)

are available in the git repository at:

  git://nv-tegra.nvidia.com/user/hdoyu/linux unify-board-dt

for you to fetch changes up to b2c8557932fbe558fbec2932c98882e47478bdf1:

  ARM: tegra: Restore USB/PCIE info in new DT board file (2013-02-08 09:23:13 +0200)

----------------------------------------------------------------
Hiroshi Doyu (4):
      ARM: tegra: Unify tegra{20,30,114}_init_early()
      ARM: tegra: Unify board-dt-tegra{30,114}.c
      ARM: tegra: Unify board-dt-tegra{20,30}.c to tegra.c
      ARM: tegra: Restore USB/PCIE info in new DT board file

 arch/arm/mach-tegra/Makefile            |    5 +-
 arch/arm/mach-tegra/board-dt-tegra114.c |   46 ----------
 arch/arm/mach-tegra/board-dt-tegra20.c  |    2 +-
 arch/arm/mach-tegra/board-dt-tegra30.c  |   60 -------------
 arch/arm/mach-tegra/board.h             |    4 +-
 arch/arm/mach-tegra/common.c            |   26 +-----
 arch/arm/mach-tegra/hotplug.c           |   31 ++++---
 arch/arm/mach-tegra/sleep.h             |   10 +--
 arch/arm/mach-tegra/tegra.c             |  148 +++++++++++++++++++++++++++++++
 9 files changed, 176 insertions(+), 156 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/board-dt-tegra114.c
 delete mode 100644 arch/arm/mach-tegra/board-dt-tegra30.c
 create mode 100644 arch/arm/mach-tegra/tegra.c

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139451.html
