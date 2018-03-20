From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2] drm/tegra: dc: use correct format array for Tegra124.
Date: Tue, 20 Mar 2018 10:11:44 +0100
Message-ID: <20180320091144.22421-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, Stefan Agner <stefan@agner.ch>, thierry.reding@gmail.com, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org

From: Stefan Agner <stefan@agner.ch>

Use tegra124_(primary|overlay)_formats for Tegra124.

Fixes: 511c7023cf23 ("drm/tegra: dc: Support more formats")

Signed-off-by: Stefan Agner <stefan@agner.ch>
Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- re-based on top of today's next
- added my ACK

 drivers/gpu/drm/tegra/dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 71152776b04c..e0ea5a46ecc9 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2015,9 +2015,9 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.coupled_pm = false,
 	.has_nvdisplay = false,
 	.num_primary_formats = ARRAY_SIZE(tegra124_primary_formats),
-	.primary_formats = tegra114_primary_formats,
+	.primary_formats = tegra124_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra124_overlay_formats),
-	.overlay_formats = tegra114_overlay_formats,
+	.overlay_formats = tegra124_overlay_formats,
 	.modifiers = tegra124_modifiers,
 };
 
-- 
2.14.3
