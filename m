From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: only select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
Date: Tue, 26 Jul 2011 10:15:59 +0200
Message-ID: <1311668159-11337-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF52B@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF52B-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This fixes:
	warning: (MACH_HARMONY && MACH_KAEN && MACH_SEABOARD) selects MACH_HAS=
_SND_SOC_TEGRA_WM8903 which has unmet direct dependencies (SOUND && !M6=
8K && SND && SND_SOC)

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since (implicit) v1:
 - correctly depend on SND_SOC instead of the non-existent SOUND_SOC
 - fix commit log accordingly

Thanks to Stephen Warren for noticing.

Best regards
Uwe

 arch/arm/mach-tegra/Kconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 5ec1846..fec64f3 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -27,14 +27,14 @@ comment "Tegra board type"
=20
 config MACH_HARMONY
        bool "Harmony board"
-       select MACH_HAS_SND_SOC_TEGRA_WM8903
+       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
        help
          Support for nVidia Harmony development platform
=20
 config MACH_KAEN
        bool "Kaen board"
        select MACH_SEABOARD
-       select MACH_HAS_SND_SOC_TEGRA_WM8903
+       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
        help
          Support for the Kaen version of Seaboard
=20
@@ -45,7 +45,7 @@ config MACH_PAZ00
=20
 config MACH_SEABOARD
        bool "Seaboard board"
-       select MACH_HAS_SND_SOC_TEGRA_WM8903
+       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
        help
          Support for nVidia Seaboard development platform. It will
 	 also be included for some of the derivative boards that
--=20
1.7.5.4
