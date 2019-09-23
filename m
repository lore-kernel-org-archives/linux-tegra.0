From: Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 14/36] drm/tegra: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:47:38 +0800
Message-ID: <1569242880-182878-4-git-send-email-hjc@rock-chips.com>
References: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: hjc@rock-chips.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

cpp[BytePerPlane] can't describe the 10bit data format correctly,
So we use bpp[BitPerPlane] to instead cpp.

Signed-off-by: Sandy Huang <hjc@rock-chips.com>
---
 drivers/gpu/drm/tegra/dc.c  | 2 +-
 drivers/gpu/drm/tegra/drm.c | 2 +-
 drivers/gpu/drm/tegra/fb.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fbf57bc..850aef2 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -705,7 +705,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.dst.y = plane->state->dst.y1;
 	window.dst.w = drm_rect_width(&plane->state->dst);
 	window.dst.h = drm_rect_height(&plane->state->dst);
-	window.bits_per_pixel = fb->format->cpp[0] * 8;
+	window.bits_per_pixel = fb->format->bpp[0];
 	window.bottom_up = tegra_fb_is_bottom_up(fb) || state->bottom_up;
 
 	/* copy from state */
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6fb7d74..ec6c5a2 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -973,7 +973,7 @@ static int tegra_debugfs_framebuffers(struct seq_file *s, void *data)
 		seq_printf(s, "%3d: user size: %d x %d, depth %d, %d bpp, refcount %d\n",
 			   fb->base.id, fb->width, fb->height,
 			   fb->format->depth,
-			   fb->format->cpp[0] * 8,
+			   fb->format->bpp[0],
 			   drm_framebuffer_read_refcount(fb));
 	}
 
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index e34325c..d5f5e1a 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -148,7 +148,7 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 			goto unreference;
 		}
 
-		bpp = info->cpp[i];
+		bpp = info->bpp[i] / 8;
 
 		size = (height - 1) * cmd->pitches[i] +
 		       width * bpp + cmd->offsets[i];
-- 
2.7.4
