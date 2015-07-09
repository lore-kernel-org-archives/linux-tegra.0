From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: enable GPU DT node
Date: Thu, 9 Jul 2015 16:32:59 +0900
Message-ID: <1436427181-23904-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra124 requires the bootloader to perform VPR initialization, otherwise the
GPU cannot be used by the system. Since using the GPU without that
initialization results in a hang, the GPU DT node is left disabled, and it is
the task of the bootloader to enable it after ensuring it is safe to use the
GPU.

VPR init is already performed since patch df3443dfa449, but the device tree was
left untouched. This patch series performs this last step and prepares the GPU
intialization code to receive more code for newer chips.

Patch 1 of this series moves the GPU initialization code to a more generic
place, since newer chips like T210 require extra steps to initialize the GPU
(e.g. WPR setup). It also performs VPR initialization at a later time of the
bootloader life, so that we can check the status variable right before booting
the kernel and patch the DT accordingly.

Patch 2 performs the DT patching using the ft_board_setup() hook.

Alexandre Courbot (2):
  ARM: tegra: move VPR configuration to a later stage
  ARM: tegra: enable GPU DT node when appropriate

 arch/arm/include/asm/arch-tegra/ap.h  |  9 -----
 arch/arm/include/asm/arch-tegra/gpu.h | 43 +++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile          |  2 +-
 arch/arm/mach-tegra/ap.c              |  3 --
 arch/arm/mach-tegra/board2.c          |  3 ++
 arch/arm/mach-tegra/gpu.c             | 66 +++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/vpr.c             | 35 -------------------
 board/nvidia/jetson-tk1/jetson-tk1.c  |  8 +++++
 board/nvidia/venice2/venice2.c        |  8 +++++
 include/configs/jetson-tk1.h          |  2 ++
 include/configs/tegra124-common.h     |  3 ++
 include/configs/venice2.h             |  2 ++
 12 files changed, 136 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-tegra/gpu.h
 create mode 100644 arch/arm/mach-tegra/gpu.c
 delete mode 100644 arch/arm/mach-tegra/vpr.c

-- 
2.4.4
