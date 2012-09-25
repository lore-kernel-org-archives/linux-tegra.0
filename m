From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Tue, 25 Sep 2012 16:46:49 -0600
Message-ID: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra's uncompress and debug-macro.S communicate to each-other. Hence,
we can't be left without uncompress.h in a multi-platform enabled kernel,
or we'll lose features. This series allows uncompress.h to be used in a
multi-platform kernel, restores the mvebu uncompress.h, and finally moves
the Tegra debug macros into the common location. The series as mainly an
RFC due to the outstanding question of where to put Tegra's <mach/iomap.h>
in the final patch.

Stephen Warren (3):
  ARM: move ICEDCC uncompress.h to common location
  ARM: mvebu: restore uncompress.h
  ARM: tegra: move debug macros to include/debug

 arch/arm/Kconfig.debug                             |   20 ++++++
 arch/arm/boot/compressed/misc.c                    |   64 +-------------------
 arch/arm/include/debug/icedcc-uncompress.h         |   61 +++++++++++++++++++
 arch/arm/include/debug/mvebu-uncompress.h          |   43 +++++++++++++
 arch/arm/include/debug/none-uncompress.h           |    3 +
 .../debug/tegra-uncompress.h}                      |    6 +-
 .../mach/debug-macro.S => include/debug/tegra.S}   |    6 +-
 7 files changed, 132 insertions(+), 71 deletions(-)
 create mode 100644 arch/arm/include/debug/icedcc-uncompress.h
 create mode 100644 arch/arm/include/debug/mvebu-uncompress.h
 create mode 100644 arch/arm/include/debug/none-uncompress.h
 rename arch/arm/{mach-tegra/include/mach/uncompress.h => include/debug/tegra-uncompress.h} (98%)
 rename arch/arm/{mach-tegra/include/mach/debug-macro.S => include/debug/tegra.S} (96%)
