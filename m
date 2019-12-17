From: James Jones <jajones@nvidia.com>
Subject: [PATCH] drm/tegra: Use more descriptive format modifiers
Date: Mon, 16 Dec 2019 16:52:05 -0800
Message-ID: <20191217005205.2573-1-jajones@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Advertise and accept both the existing
DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()-based format
modifiers and the more descriptive
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D()-based
format modifiers, preserving backwards
compatibility with existing userspace drivers, but
providing forwards compatibility with future
userspace drivers that also make use of the more
descriptive modifiers to enable differentiation
between desktop and tegra, as well as compressed
and non-compressed surfaces.

This patch depends on the "[PATCH v3] drm: Generalized NV Block Linear DRM
format mod" patch submitted to dri-devel.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 10 ++++++++++
 drivers/gpu/drm/tegra/fb.c  | 14 +++++++-------
 drivers/gpu/drm/tegra/hub.c | 10 ++++++++++
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fbf57bc3cdab..a2cc687dc2d8 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -588,6 +588,16 @@ static const u32 tegra124_primary_formats[] = {
 
 static const u64 tegra124_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
+	/*
+	 * For backwards compatibility with older userspace that may have
+	 * baked in usage of the less-descriptive modifiers
+	 */
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index e34325c83d28..d04e0b1c61ea 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -44,7 +44,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 {
 	uint64_t modifier = framebuffer->modifier;
 
-	switch (modifier) {
+	switch (drm_fourcc_canonicalize_nvidia_format_mod(modifier)) {
 	case DRM_FORMAT_MOD_LINEAR:
 		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
 		tiling->value = 0;
@@ -55,32 +55,32 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 		tiling->value = 0;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 0;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 1;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 2;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 3;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 4;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 5;
 		break;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 839b49c40e51..03c97b10b122 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -49,6 +49,16 @@ static const u32 tegra_shared_plane_formats[] = {
 
 static const u64 tegra_shared_plane_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
+	/*
+	 * For backwards compatibility with older userspace that may have
+	 * baked in usage of the less-descriptive modifiers
+	 */
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
-- 
2.17.1
