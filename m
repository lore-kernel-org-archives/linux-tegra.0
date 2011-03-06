From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: Add Toshiba AC100 support
Date: Sun,  6 Mar 2011 15:31:44 +0100
Message-ID: <1299421906-7366-1-git-send-email-marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

These patches add initial support for the Toshiba AC100 / Dynabook AZ netbook.
The code will not be able to boot the machine as the proprietary bootloader
uses a different machine type (V1 bl: tegra_generic, V2 bl: harmony). Support
for u-boot is being worked on.

The patches are intended for 2.6.40. Depending on the review (and community
progress), I hope to be able to submit more hardware support patches.

Marc Dietrich (2):
  Add initial support for the Toshiba AC100/Dynabook AZ netbook
  Add a default config for PAZ00

 arch/arm/configs/paz00_defconfig         | 1209 ++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Kconfig              |    5 +
 arch/arm/mach-tegra/Makefile             |    3 +
 arch/arm/mach-tegra/board-paz00-pinmux.c |  157 ++++
 arch/arm/mach-tegra/board-paz00.c        |  128 ++++
 arch/arm/mach-tegra/board-paz00.h        |   22 +
 6 files changed, 1524 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/configs/paz00_defconfig
 create mode 100644 arch/arm/mach-tegra/board-paz00-pinmux.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
