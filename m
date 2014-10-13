From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 10/14] drm/tegra: dc: Add powergate support
Date: Mon, 13 Oct 2014 12:21:51 +0200
Message-ID: <1413195715-4719-10-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Both display controllers are in their own power partition. Currently the
driver relies on the assumption that these partitions are on (which is
the hardware default). However some bootloaders may disable them, so the
driver must make sure to turn them back on to avoid hangs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 45 ++++++++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/drm.h |  1 +
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6553fd238685..4a015232e2e8 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -11,6 +11,8 @@
 #include <linux/debugfs.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/pmc.h>
+
 #include "dc.h"
 #include "drm.h"
 #include "gem.h"
@@ -20,6 +22,7 @@ struct tegra_dc_soc_info {
 	bool supports_cursor;
 	bool supports_block_linear;
 	unsigned int pitch_align;
+	bool has_powergate;
 };
 
 struct tegra_plane {
@@ -1357,6 +1360,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_cursor = false,
 	.supports_block_linear = false,
 	.pitch_align = 8,
+	.has_powergate = false,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -1364,6 +1368,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_cursor = false,
 	.supports_block_linear = false,
 	.pitch_align = 8,
+	.has_powergate = false,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -1371,6 +1376,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_cursor = false,
 	.supports_block_linear = false,
 	.pitch_align = 64,
+	.has_powergate = true,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -1378,6 +1384,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_cursor = true,
 	.supports_block_linear = true,
 	.pitch_align = 64,
+	.has_powergate = true,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
@@ -1385,6 +1392,9 @@ static const struct of_device_id tegra_dc_of_match[] = {
 		.compatible = "nvidia,tegra124-dc",
 		.data = &tegra124_dc_soc_info,
 	}, {
+		.compatible = "nvidia,tegra114-dc",
+		.data = &tegra114_dc_soc_info,
+	}, {
 		.compatible = "nvidia,tegra30-dc",
 		.data = &tegra30_dc_soc_info,
 	}, {
@@ -1467,9 +1477,34 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->rst);
 	}
 
-	err = clk_prepare_enable(dc->clk);
-	if (err < 0)
-		return err;
+	if (dc->soc->has_powergate) {
+		if (dc->pipe == 0)
+			dc->powergate = TEGRA_POWERGATE_DIS;
+		else
+			dc->powergate = TEGRA_POWERGATE_DISB;
+
+		err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
+							dc->rst);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to power partition: %d\n",
+				err);
+			return err;
+		}
+	} else {
+		err = clk_prepare_enable(dc->clk);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to enable clock: %d\n",
+				err);
+			return err;
+		}
+
+		err = reset_control_deassert(dc->rst);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to deassert reset: %d\n",
+				err);
+			return err;
+		}
+	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dc->regs = devm_ioremap_resource(&pdev->dev, regs);
@@ -1523,6 +1558,10 @@ static int tegra_dc_remove(struct platform_device *pdev)
 	}
 
 	reset_control_assert(dc->rst);
+
+	if (dc->soc->has_powergate)
+		tegra_powergate_power_off(dc->powergate);
+
 	clk_disable_unprepare(dc->clk);
 
 	return 0;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index e89c70fa82d5..b994c017971d 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -101,6 +101,7 @@ struct tegra_dc {
 	spinlock_t lock;
 
 	struct drm_crtc base;
+	int powergate;
 	int pipe;
 
 	struct clk *clk;
-- 
2.1.2
