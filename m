From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] drm/tegra: Add sync file support to submit interface
Date: Thu, 11 Jan 2018 23:22:48 +0100
Message-ID: <20180111222249.29105-3-thierry.reding@gmail.com>
References: <20180111222249.29105-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111222249.29105-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Adds ability to pass sync file based prefences and get back
sync file based postfences during job submission. Both
fence fd's are passed in the `fence` field. A new `flags`
field is used to specify if the prefence should be waited
or a postfence created.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/uapi/drm/tegra_drm.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index d954f8c33321..03492d6670a5 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -117,6 +117,11 @@ struct drm_tegra_waitchk {
 	__u32 thresh;
 };
 
+#define DRM_TEGRA_SUBMIT_WAIT_FENCE_FD		(1 << 0)
+#define DRM_TEGRA_SUBMIT_CREATE_FENCE_FD	(1 << 1)
+#define DRM_TEGRA_SUBMIT_FLAGS (DRM_TEGRA_SUBMIT_WAIT_FENCE_FD | \
+				DRM_TEGRA_SUBMIT_CREATE_FENCE_FD)
+
 struct drm_tegra_submit {
 	__u64 context;
 	__u32 num_syncpts;
@@ -129,9 +134,10 @@ struct drm_tegra_submit {
 	__u64 cmdbufs;
 	__u64 relocs;
 	__u64 waitchks;
-	__u32 fence;		/* Return value */
+	__u32 fence;
+	__u32 flags;
 
-	__u32 reserved[5];	/* future expansion */
+	__u32 reserved[4];	/* future expansion */
 };
 
 #define DRM_TEGRA_GEM_TILING_MODE_PITCH 0
-- 
2.15.1
