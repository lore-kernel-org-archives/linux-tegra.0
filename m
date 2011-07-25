From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: only select MACH_HAS_SND_SOC_TEGRA_WM8903 if SOUND_SOC
Date: Mon, 25 Jul 2011 17:47:53 +0200
Message-ID: <1311608874-31863-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This fixes:
	warning: (MACH_HARMONY && MACH_KAEN && MACH_SEABOARD) selects MACH_HAS=
_SND_SOC_TEGRA_WM8903 which has unmet direct dependencies (SOUND && !M6=
8K && SND && SND_SOC)

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/mach-tegra/Kconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 5ec1846..33acbd9 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -27,14 +27,14 @@ comment "Tegra board type"
=20
 config MACH_HARMONY
        bool "Harmony board"
-       select MACH_HAS_SND_SOC_TEGRA_WM8903
+       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SOUND_SOC
        help
          Support for nVidia Harmony development platform
=20
 config MACH_KAEN
        bool "Kaen board"
        select MACH_SEABOARD
-       select MACH_HAS_SND_SOC_TEGRA_WM8903
+       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SOUND_SOC
        help
          Support for the Kaen version of Seaboard
=20
@@ -45,7 +45,7 @@ config MACH_PAZ00
=20
 config MACH_SEABOARD
        bool "Seaboard board"
-       select MACH_HAS_SND_SOC_TEGRA_WM8903
+       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SOUND_SOC
        help
          Support for nVidia Seaboard development platform. It will
 	 also be included for some of the derivative boards that
--=20
1.7.5.4
