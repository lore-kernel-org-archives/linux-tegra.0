From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: enable rtc driver in defconfig
Date: Mon, 25 Jul 2011 17:47:54 +0200
Message-ID: <1311608874-31863-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1311608874-31863-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1311608874-31863-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_=
defconfig
index 8845f1c..d87631f 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -98,6 +98,8 @@ CONFIG_MMC=3Dy
 CONFIG_MMC_SDHCI=3Dy
 CONFIG_MMC_SDHCI_PLTFM=3Dy
 CONFIG_MMC_SDHCI_TEGRA=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_DRV_TEGRA=3Dm
 CONFIG_STAGING=3Dy
 # CONFIG_STAGING_EXCLUDE_BUILD is not set
 CONFIG_IIO=3Dy
--=20
1.7.5.4
