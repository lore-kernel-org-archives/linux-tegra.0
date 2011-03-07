From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: tegra: Add Toshiba AC100 support
Date: Mon,  7 Mar 2011 21:01:30 +0100
Message-ID: <cover.1299526691.git.marvin24@gmx.de>
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
  Add PAZ00 to tegra_defconfig

 arch/arm/configs/tegra_defconfig         |    1 +
 arch/arm/mach-tegra/Kconfig              |    5 +
 arch/arm/mach-tegra/Makefile             |    3 +
 arch/arm/mach-tegra/board-paz00-pinmux.c |  157 ++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-paz00.c        |  128 ++++++++++++++++++++++++
 arch/arm/mach-tegra/board-paz00.h        |   29 ++++++
 6 files changed, 323 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/board-paz00-pinmux.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.h

From 61b663e8bb53158f928f3ae97c1f891a9885445b Mon Sep 17 00:00:00 2001
Message-Id: <cover.1299433839.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Date: Sun, 6 Mar 2011 18:50:39 +0100
Subject: [PATCH v2 0/2] ARM: tegra: Add Toshiba AC100 support

Marc Dietrich (2):
  Add initial support for the Toshiba AC100/Dynabook AZ netbook
  Add PAZ00 to tegra_defconfig

 arch/arm/configs/tegra_defconfig         |    1 +
 arch/arm/mach-tegra/Kconfig              |    5 +
 arch/arm/mach-tegra/Makefile             |    3 +
 arch/arm/mach-tegra/board-paz00-pinmux.c |  157 ++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-paz00.c        |  128 ++++++++++++++++++++++++
 arch/arm/mach-tegra/board-paz00.h        |   22 ++++
 6 files changed, 316 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/board-paz00-pinmux.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
