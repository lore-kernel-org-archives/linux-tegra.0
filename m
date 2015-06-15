From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] drm/nouveau: placeholders for staging ioctls
Date: Mon, 15 Jun 2015 16:09:28 +0900
Message-ID: <1434352169-10501-2-git-send-email-acourbot@nvidia.com>
References: <1434352169-10501-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434352169-10501-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reserve the 8 highest ioctls for "staging" features, i.e. ioctls that
may change or be dropped altogether and that thus should not be given a
definite number. This will allow us to experiment with experimental APIs
for a while before setting them in stone.

Staging ioctls are not expected to stay there for a long time, so we
limit their number. Besides, each staging ioctls needs to be explicitly
enabled through its own module option.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nouveau_drm.c          | 1 +
 drm/nouveau/uapi/drm/nouveau_drm.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
index 63f1d39e8358..28860268cf38 100644
--- a/drm/nouveau/nouveau_drm.c
+++ b/drm/nouveau/nouveau_drm.c
@@ -896,6 +896,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
+	/* Staging ioctls */
 };
 
 long
diff --git a/drm/nouveau/uapi/drm/nouveau_drm.h b/drm/nouveau/uapi/drm/nouveau_drm.h
index 5507eead5863..4e7e21f41b5c 100644
--- a/drm/nouveau/uapi/drm/nouveau_drm.h
+++ b/drm/nouveau/uapi/drm/nouveau_drm.h
@@ -140,11 +140,14 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
+/* range 0x98..DRM_COMMAND_END (8 entries) is reserved for staging, unstable ioctls */
+#define DRM_NOUVEAU_STAGING_IOCTL      0x58
 
 #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
 #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
+/* staging ioctls */
 
 #endif /* __NOUVEAU_DRM_H__ */
-- 
2.4.2
