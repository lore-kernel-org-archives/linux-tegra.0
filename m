From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] ARM: tegra_defconfig: enable APB DMA support
Date: Wed, 29 Aug 2012 11:00:00 +0200
Message-ID: <1346230800-3167-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Additionally DMADEVICES needs to be enabled as TEGRA20_APB_DMA depends
on that.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_=
defconfig
index db22453..0d6bb73 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -145,6 +145,8 @@ CONFIG_MMC_SDHCI_TEGRA=3Dy
 CONFIG_RTC_CLASS=3Dy
 CONFIG_RTC_DRV_EM3027=3Dy
 CONFIG_RTC_DRV_TEGRA=3Dy
+CONFIG_DMADEVICES=3Dy
+CONFIG_TEGRA20_APB_DMA=3Dy
 CONFIG_STAGING=3Dy
 CONFIG_SENSORS_ISL29018=3Dy
 CONFIG_SENSORS_ISL29028=3Dy
--=20
1.7.10.4
