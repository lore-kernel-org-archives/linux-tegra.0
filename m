From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: Fix window[0] base address corruption
Date: Sun, 21 Aug 2016 11:57:58 +0300
Message-ID: <20160821085915.9424-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Window uses shared stride for UV planes and tegra_dc_window struct
defines array of 2 strides per window. That's not taken in account
during setting up of the window addresses and strides, resulting in
out-of-bounds write of the 3-rd (non-existent) V plane stride that
overwrites Y plane base address.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 39940f5..a98dd3e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -590,7 +590,9 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 		struct tegra_bo *bo = tegra_fb_get_plane(fb, i);
 
 		window.base[i] = bo->paddr + fb->offsets[i];
-		window.stride[i] = fb->pitches[i];
+
+		if (i < 2)
+			window.stride[i] = fb->pitches[i];
 	}
 
 	tegra_dc_setup_window(dc, p->index, &window);
-- 
2.9.3
