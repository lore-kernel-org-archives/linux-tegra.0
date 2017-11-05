From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 09/10] drm/tegra: Boot VIC in runtime resume
Date: Sun,  5 Nov 2017 13:01:17 +0200
Message-ID: <20171105110118.15142-10-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171105110118.15142-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This ensures that there are no concurrency issues when multiple users
are trying to use VIC concurrently, and also simplifies the code
slightly.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 47 +++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 0cacf023a890..3de20f287112 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -29,7 +29,6 @@ struct vic_config {
 
 struct vic {
 	struct falcon falcon;
-	bool booted;
 
 	void __iomem *regs;
 	struct tegra_drm_client client;
@@ -51,33 +50,12 @@ static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
 	writel(value, vic->regs + offset);
 }
 
-static int vic_runtime_resume(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-
-	return clk_prepare_enable(vic->clk);
-}
-
-static int vic_runtime_suspend(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-
-	clk_disable_unprepare(vic->clk);
-
-	vic->booted = false;
-
-	return 0;
-}
-
 static int vic_boot(struct vic *vic)
 {
 	u32 fce_ucode_size, fce_bin_data_offset;
 	void *hdr;
 	int err = 0;
 
-	if (vic->booted)
-		return 0;
-
 	/* setup clockgating registers */
 	vic_writel(vic, CG_IDLE_CG_DLY_CNT(4) |
 			CG_IDLE_CG_EN |
@@ -108,7 +86,26 @@ static int vic_boot(struct vic *vic)
 		return err;
 	}
 
-	vic->booted = true;
+	return 0;
+}
+
+static int vic_runtime_resume(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(vic->clk);
+	if (err < 0)
+		return err;
+
+	return vic_boot(vic);
+}
+
+static int vic_runtime_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(vic->clk);
 
 	return 0;
 }
@@ -225,10 +222,6 @@ static int vic_submit(struct tegra_drm_context *context,
 	if (err < 0)
 		return err;
 
-	err = vic_boot(vic);
-	if (err < 0)
-		goto put_vic;
-
 	err = tegra_drm_context_get_channel(context);
 	if (err < 0)
 		goto put_vic;
-- 
2.14.2
