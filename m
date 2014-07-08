From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 3/4] drm/tegra: dsi - Handle non-continuous clock flag
Date: Tue,  8 Jul 2014 21:32:13 +0900
Message-ID: <1404822734-8603-4-git-send-email-acourbot@nvidia.com>
References: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Handle the MIPI_DSI_CLOCK_NONCONTINUOUS flag and only set TX-only
clock behavior when this flag is present to allow panels requiring
continuous clock mode to operate with this driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index bd56f2a..eadfeaf 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -474,7 +474,8 @@ static int tegra_output_dsi_enable(struct tegra_output *output)
 	tegra_dsi_writel(dsi, value, DSI_HOST_CONTROL);
 
 	value = tegra_dsi_readl(dsi, DSI_CONTROL);
-	value |= DSI_CONTROL_HS_CLK_CTRL;
+	if (dsi->flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+		value |= DSI_CONTROL_HS_CLK_CTRL;
 	value &= ~DSI_CONTROL_TX_TRIG(3);
 	value &= ~DSI_CONTROL_DCS_ENABLE;
 	value |= DSI_CONTROL_VIDEO_ENABLE;
-- 
2.0.0
