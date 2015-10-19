From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] ARM: tegra: GPU WPR region support
Date: Mon, 19 Oct 2015 13:57:00 +0900
Message-ID: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series makes U-boot program the write-protected (WPR) region of T210 chips,
allowing the kernel to perform GPU secure firmware loading.

Tegra 210's GPU requires its firmware to be loaded though a write-protected
region. An area of physical memory is carved-out, programmed into the
corresponding memory controller registers, and locked such as only the GPU can
write into it. This area needs to be set up by the bootloader since it cannot
be re-claimed for normal use after being locked.

The first 3 patches of this series are cleanup patches. Patch 2 implements a
suggestion made by Stephen, patch 3 renames GPU-related functions to sound less
generic.

The last patch adds support for the GPU WPR region. The top 256KB of memory are
removed from the available memory, and the corresponding MC registers are
programmed to point to it, which allows the kernel to initiate secure firmware
loading.

Alexandre Courbot (4):
  ARM: tegra: remove vpr_configured() function
  ARM: tegra: simplify GPU setup
  ARM: tegra: rename GPU functions
  ARM: tegra210: gpu: configure WPR region

 arch/arm/include/asm/arch-tegra/gpu.h   | 14 +++------
 arch/arm/include/asm/arch-tegra210/mc.h | 12 ++++++++
 arch/arm/mach-tegra/board.c             |  4 +++
 arch/arm/mach-tegra/board2.c            | 22 +++++++++++++-
 arch/arm/mach-tegra/gpu.c               | 52 +++++++++++++++++++++++++++++----
 board/nvidia/jetson-tk1/jetson-tk1.c    |  8 -----
 board/nvidia/p2571/p2571.c              |  7 -----
 board/nvidia/venice2/venice2.c          |  8 -----
 include/configs/jetson-tk1.h            |  2 --
 include/configs/p2571.h                 |  2 --
 include/configs/tegra-common.h          |  2 ++
 include/configs/venice2.h               |  2 --
 12 files changed, 89 insertions(+), 46 deletions(-)

-- 
2.6.1
