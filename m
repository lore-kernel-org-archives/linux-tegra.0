From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 7/7] drm/tegra: tegra: remove redundant "depends on RESET_CONTROLLER"
Date: Thu,  5 Nov 2015 20:15:28 +0900
Message-ID: <1446722128-11961-8-git-send-email-yamada.masahiro@socionext.com>
References: <1446722128-11961-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446722128-11961-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, David Airlie <airlied@linux.ie>
List-Id: linux-tegra@vger.kernel.org

ARCH_TEGRA selects RESET_CONTROLLER.
The dependency "depends on RESET_CONTROLLER" is already met.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpu/drm/tegra/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 74d9d62..a188994 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -3,7 +3,6 @@ config DRM_TEGRA
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
 	depends on COMMON_CLK
 	depends on DRM
-	depends on RESET_CONTROLLER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
-- 
1.9.1
