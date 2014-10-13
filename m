From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/14] drm/tegra: dsi: Make FIFO depths host parameters
Date: Mon, 13 Oct 2014 12:21:53 +0200
Message-ID: <1413195715-4719-12-git-send-email-thierry.reding@gmail.com>
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

Rather than hardcoding them as macros, make the host and video FIFO
depths parameters so that they can be more easily adjusted if a new
generation of the Tegra SoC changes them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f7874458926a..584b771d8b2f 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -26,9 +26,6 @@
 #include "dsi.h"
 #include "mipi-phy.h"
 
-#define DSI_VIDEO_FIFO_DEPTH (1920 / 4)
-#define DSI_HOST_FIFO_DEPTH 64
-
 struct tegra_dsi {
 	struct host1x_client client;
 	struct tegra_output output;
@@ -54,6 +51,9 @@ struct tegra_dsi {
 
 	struct regulator *vdd;
 	bool enabled;
+
+	unsigned int video_fifo_depth;
+	unsigned int host_fifo_depth;
 };
 
 static inline struct tegra_dsi *
@@ -467,7 +467,7 @@ static int tegra_output_dsi_enable(struct tegra_output *output)
 		DSI_CONTROL_SOURCE(dc->pipe);
 	tegra_dsi_writel(dsi, value, DSI_CONTROL);
 
-	tegra_dsi_writel(dsi, DSI_VIDEO_FIFO_DEPTH, DSI_MAX_THRESHOLD);
+	tegra_dsi_writel(dsi, dsi->video_fifo_depth, DSI_MAX_THRESHOLD);
 
 	value = DSI_HOST_CONTROL_HS | DSI_HOST_CONTROL_CS |
 		DSI_HOST_CONTROL_ECC;
@@ -843,6 +843,8 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dsi->output.dev = dsi->dev = &pdev->dev;
+	dsi->video_fifo_depth = 1920;
+	dsi->host_fifo_depth = 64;
 
 	err = tegra_output_probe(&dsi->output);
 	if (err < 0)
-- 
2.1.2
