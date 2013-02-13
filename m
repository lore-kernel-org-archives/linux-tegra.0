From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v3 0/3] ARM: tegra: Unify board-dt-tegra{20,30,114}
Date: Wed, 13 Feb 2013 19:15:47 +0200
Message-ID: <1360775751-23850-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, marvin24-Mmb7MZpHnFY@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

This series unifies "board-dt-tegra{20,30,114}.c" to "tegra.c".

The following changes since commit d5b00d3fd920d8f2b1c35140212e66948ab9f6f3:
(Stephen's next-20130211-fixed)

  of: fix recursive locking in of_get_next_available_child() (2013-02-11 14:08:15 -0700)

are available in the git repository at:

  git://nv-tegra.nvidia.com/user/hdoyu/linux unify-board-dt

for you to fetch changes up to 7804a741550584b93b7f092d4d7b265cee52a4b0:

  ARM: tegra: Unify Device tree board files (2013-02-13 18:59:07 +0200)

v2:
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/148860.html

v1:
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/148380.html

----------------------------------------------------------------
Hiroshi Doyu (3):
      ARM: tegra: Unify tegra{20,30,114}_init_early()
      ARM: tegra: Rename board-dt-tegra20.c to tegra.c
      ARM: tegra: Unify Device tree board files

 arch/arm/mach-tegra/Makefile                       |    4 +-
 arch/arm/mach-tegra/board-dt-tegra114.c            |   46 ---------------
 arch/arm/mach-tegra/board-dt-tegra30.c             |   60 --------------------
 arch/arm/mach-tegra/board.h                        |    4 +-
 arch/arm/mach-tegra/common.c                       |   26 +--------
 arch/arm/mach-tegra/hotplug.c                      |   23 +++-----
 arch/arm/mach-tegra/sleep.h                        |   10 ++--
 .../arm/mach-tegra/{board-dt-tegra20.c => tegra.c} |   16 ++++--
 8 files changed, 28 insertions(+), 161 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/board-dt-tegra114.c
 delete mode 100644 arch/arm/mach-tegra/board-dt-tegra30.c
 rename arch/arm/mach-tegra/{board-dt-tegra20.c => tegra.c} (89%)
