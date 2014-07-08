From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 2/4] drm/panel: Set non-continuous clock flag on supporting
 panels
Date: Tue,  8 Jul 2014 21:32:12 +0900
Message-ID: <1404822734-8603-3-git-send-email-acourbot@nvidia.com>
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

The LG LD070WX3-SL01 and Panasonic VVX10F004B00 are DSI support
non-continuous clock mode. Set the MIPI_DSI_CLOCK_NON_CONTINUOUS
to their definition so host drivers become aware of this capability.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a251361..869a84e3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -545,7 +545,7 @@ static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
 			.height = 151,
 		},
 	},
-	.flags = MIPI_DSI_MODE_VIDEO,
+	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
 	.format = MIPI_DSI_FMT_RGB888,
 	.lanes = 4,
 };
@@ -599,7 +599,8 @@ static const struct panel_desc_dsi panasonic_vvx10f004b00 = {
 			.height = 136,
 		},
 	},
-	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		 MIPI_DSI_CLOCK_NON_CONTINUOUS,
 	.format = MIPI_DSI_FMT_RGB888,
 	.lanes = 4,
 };
-- 
2.0.0
