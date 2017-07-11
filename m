From: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v2 08/12] drm/tegra: Handle drm_atomic_helper_swap_state failure
Date: Tue, 11 Jul 2017 16:33:10 +0200
Message-ID: <20170711143314.2148-9-maarten.lankhorst@linux.intel.com>
References: <20170711143314.2148-1-maarten.lankhorst@linux.intel.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711143314.2148-1-maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

drm_atomic_helper_swap_state() will be changed to interruptible waiting
in the next few commits, so all drivers have to be changed to handling
failure.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/gpu/drm/tegra/drm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ad3d124a972d..3ba659a5940d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -100,7 +100,12 @@ static int tegra_atomic_commit(struct drm_device *drm,
 	 * the software side now.
 	 */
 
-	drm_atomic_helper_swap_state(state, true);
+	err = drm_atomic_helper_swap_state(state, true);
+	if (err) {
+		mutex_unlock(&tegra->commit.lock);
+		drm_atomic_helper_cleanup_planes(drm, state);
+		return err;
+	}
 
 	drm_atomic_state_get(state);
 	if (nonblock)
-- 
2.11.0
