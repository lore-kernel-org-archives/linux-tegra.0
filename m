From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: add staging module option
Date: Wed, 20 May 2015 14:56:18 +0900
Message-ID: <1432101379-9515-2-git-send-email-acourbot@nvidia.com>
References: <1432101379-9515-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432101379-9515-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a module option allowing to enable staging/unstable APIs. This will
allow us to experiment freely with experimental APIs for a while before
setting them in stone.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nouveau_drm.c          | 18 ++++++++++++++++++
 drm/nouveau/uapi/drm/nouveau_drm.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
index 89049335b738..e4bd6ed51e73 100644
--- a/drm/nouveau/nouveau_drm.c
+++ b/drm/nouveau/nouveau_drm.c
@@ -75,6 +75,10 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1
 int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
 
+MODULE_PARM_DESC(staging, "enable staging APIs");
+int nouveau_staging = 0;
+module_param_named(staging, nouveau_staging, int, 0400);
+
 static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
 static struct drm_driver driver_platform;
@@ -895,6 +899,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
+	/* Staging ioctls */
 };
 
 long
@@ -1027,6 +1032,7 @@ static void nouveau_display_options(void)
 	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
 	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
 	DRM_DEBUG_DRIVER("... pstate       : %d\n", nouveau_pstate);
+	DRM_DEBUG_DRIVER("... staging      : %d\n", nouveau_staging);
 }
 
 static const struct dev_pm_ops nouveau_pm_ops = {
@@ -1088,6 +1094,18 @@ err_free:
 static int __init
 nouveau_drm_init(void)
 {
+	/* Do not register staging ioctsl if option not specified */
+	if (!nouveau_staging) {
+		unsigned i;
+
+		/* This keeps us safe is no staging ioctls are defined */
+		i = min(driver_stub.num_ioctls, DRM_NOUVEAU_STAGING_IOCTL);
+		while (!nouveau_ioctls[i - 1].func)
+			i--;
+
+		driver_stub.num_ioctls = i;
+	}
+
 	driver_pci = driver_stub;
 	driver_pci.set_busid = drm_pci_set_busid;
 	driver_platform = driver_stub;
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
2.4.0
