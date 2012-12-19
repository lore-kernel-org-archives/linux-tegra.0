From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=205/6=5D=20drm=3A=20tegra=3A=20clean=20out=20old=20gem=20prototypes?=
Date: Wed, 19 Dec 2012 22:38:56 +0100
Message-ID: <1355953137-31563-6-git-send-email-dev@lynxeye.de>
References: <1355953137-31563-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355953137-31563-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There is no gem.c anymore, those functions are implemented by the
drm_cma_helpers now.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.h | 18 ------------------
 1 Datei ge=C3=A4ndert, 18 Zeilen entfernt(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index eae1f56..71e61f2 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -205,24 +205,6 @@ extern int tegra_output_parse_dt(struct tegra_outp=
ut *output);
 extern int tegra_output_init(struct drm_device *drm, struct tegra_outp=
ut *output);
 extern int tegra_output_exit(struct tegra_output *output);
=20
-/* from gem.c */
-extern struct tegra_gem_object *tegra_gem_alloc(struct drm_device *drm=
,
-						size_t size);
-extern int tegra_gem_handle_create(struct drm_device *drm,
-				   struct drm_file *file, size_t size,
-				   unsigned long flags, uint32_t *handle);
-extern int tegra_gem_dumb_create(struct drm_file *file, struct drm_dev=
ice *drm,
-				 struct drm_mode_create_dumb *args);
-extern int tegra_gem_dumb_map_offset(struct drm_file *file,
-				     struct drm_device *drm, uint32_t handle,
-				     uint64_t *offset);
-extern int tegra_gem_dumb_destroy(struct drm_file *file,
-				  struct drm_device *drm, uint32_t handle);
-extern int tegra_drm_gem_mmap(struct file *filp, struct vm_area_struct=
 *vma);
-extern int tegra_gem_init_object(struct drm_gem_object *obj);
-extern void tegra_gem_free_object(struct drm_gem_object *obj);
-extern struct vm_operations_struct tegra_gem_vm_ops;
-
 /* from fb.c */
 extern int tegra_drm_fb_init(struct drm_device *drm);
 extern void tegra_drm_fb_exit(struct drm_device *drm);
--=20
1.7.11.7
