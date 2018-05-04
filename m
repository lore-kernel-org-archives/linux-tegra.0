From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 3/3] drm/tegra: dc: Rename supports_blending to has_legacy_blending
Date: Fri,  4 May 2018 17:40:00 +0300
Message-ID: <20180504144000.8597-4-digetx@gmail.com>
References: <20180504144000.8597-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504144000.8597-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Older Tegra's support blending. Rename SoC info entry supports_blending
to has_legacy_blending to eliminate confusion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 20 ++++++++++----------
 drivers/gpu/drm/tegra/dc.h |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be624ac700a8..c28a0a2d496b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -508,10 +508,10 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 
 	tegra_plane_writel(plane, value, DC_WIN_WIN_OPTIONS);
 
-	if (dc->soc->supports_blending)
-		tegra_plane_setup_blending(plane, window);
-	else
+	if (dc->soc->has_legacy_blending)
 		tegra_plane_setup_blending_legacy(plane);
+	else
+		tegra_plane_setup_blending(plane, window);
 }
 
 static const u32 tegra20_primary_formats[] = {
@@ -617,7 +617,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	 * the corresponding opaque formats. However, the opaque formats can
 	 * be emulated by disabling alpha blending for the plane.
 	 */
-	if (!dc->soc->supports_blending) {
+	if (dc->soc->has_legacy_blending) {
 		err = tegra_plane_setup_legacy_state(tegra, plane_state);
 		if (err < 0)
 			return err;
@@ -2099,7 +2099,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
-	.supports_blending = false,
+	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
 	.coupled_pm = true,
@@ -2118,7 +2118,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
-	.supports_blending = false,
+	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
 	.coupled_pm = false,
@@ -2137,7 +2137,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
-	.supports_blending = false,
+	.has_legacy_blending = true,
 	.pitch_align = 64,
 	.has_powergate = true,
 	.coupled_pm = false,
@@ -2156,7 +2156,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
-	.supports_blending = true,
+	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
 	.coupled_pm = false,
@@ -2175,7 +2175,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
-	.supports_blending = true,
+	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
 	.coupled_pm = false,
@@ -2228,7 +2228,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
-	.supports_blending = true,
+	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = false,
 	.coupled_pm = false,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 8673cd97afc3..0774356c845a 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -55,7 +55,7 @@ struct tegra_dc_soc_info {
 	bool supports_interlacing;
 	bool supports_cursor;
 	bool supports_block_linear;
-	bool supports_blending;
+	bool has_legacy_blending;
 	unsigned int pitch_align;
 	bool has_powergate;
 	bool coupled_pm;
-- 
2.17.0
