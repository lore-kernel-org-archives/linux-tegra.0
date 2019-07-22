From: Viswanath L <viswanathl@nvidia.com>
Subject: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
Date: Mon, 22 Jul 2019 14:57:12 +0530
Message-ID: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Viswanath L <viswanathl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

HDMI plugout calls runtime suspend, which clears interrupt registers
and causes audio functionality to break on subsequent plugin; setting
interrupt registers in sor_audio_prepare() solves the issue

Signed-off-by: Viswanath L <viswanathl@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 5be5a08..0470cfe 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2164,6 +2164,15 @@ static void tegra_sor_audio_prepare(struct tegra_sor *sor)
 
 	value = SOR_AUDIO_HDA_PRESENSE_ELDV | SOR_AUDIO_HDA_PRESENSE_PD;
 	tegra_sor_writel(sor, value, SOR_AUDIO_HDA_PRESENSE);
+
+	/*
+	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
+	 * is used for interoperability between the HDA codec driver and the
+	 * HDMI/DP driver.
+	 */
+	value = SOR_INT_CODEC_SCRATCH1 | SOR_INT_CODEC_SCRATCH0;
+	tegra_sor_writel(sor, value, SOR_INT_ENABLE);
+	tegra_sor_writel(sor, value, SOR_INT_MASK);
 }
 
 static void tegra_sor_audio_unprepare(struct tegra_sor *sor)
@@ -2913,15 +2922,6 @@ static int tegra_sor_init(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	/*
-	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
-	 * is used for interoperability between the HDA codec driver and the
-	 * HDMI/DP driver.
-	 */
-	value = SOR_INT_CODEC_SCRATCH1 | SOR_INT_CODEC_SCRATCH0;
-	tegra_sor_writel(sor, value, SOR_INT_ENABLE);
-	tegra_sor_writel(sor, value, SOR_INT_MASK);
-
 	return 0;
 }
 
-- 
2.7.4
