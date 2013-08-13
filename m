From: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/host1x: stop casting VMA offsets to 32bit
Date: Tue, 13 Aug 2013 14:19:58 +0200
Message-ID: <1376396398-13515-1-git-send-email-dh.herrmann@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

VMA offsets are 64bit so do not cast them to "unsigned int". Also remov=
e
the (now useless) offset-retrieval helper. The VMA manager provides sim=
ple
enough helpers.

Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Terje Bergstr=C3=B6m" <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/drm/drm.c | 2 +-
 drivers/gpu/host1x/drm/gem.c | 7 +------
 drivers/gpu/host1x/drm/gem.h | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.=
c
index 1371a2b..397ed3f 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -356,7 +356,7 @@ static int tegra_gem_mmap(struct drm_device *drm, v=
oid *data,
=20
 	bo =3D to_tegra_bo(gem);
=20
-	args->offset =3D tegra_bo_get_mmap_offset(bo);
+	args->offset =3D drm_vma_node_offset_addr(&bo->gem.vma_node);
=20
 	drm_gem_object_unreference(gem);
=20
diff --git a/drivers/gpu/host1x/drm/gem.c b/drivers/gpu/host1x/drm/gem.=
c
index 3c35622..59623de 100644
--- a/drivers/gpu/host1x/drm/gem.c
+++ b/drivers/gpu/host1x/drm/gem.c
@@ -106,11 +106,6 @@ static void tegra_bo_destroy(struct drm_device *dr=
m, struct tegra_bo *bo)
 	dma_free_writecombine(drm->dev, bo->gem.size, bo->vaddr, bo->paddr);
 }
=20
-unsigned int tegra_bo_get_mmap_offset(struct tegra_bo *bo)
-{
-	return (unsigned int)drm_vma_node_offset_addr(&bo->gem.vma_node);
-}
-
 struct tegra_bo *tegra_bo_create(struct drm_device *drm, unsigned int =
size)
 {
 	struct tegra_bo *bo;
@@ -227,7 +222,7 @@ int tegra_bo_dumb_map_offset(struct drm_file *file,=
 struct drm_device *drm,
=20
 	bo =3D to_tegra_bo(gem);
=20
-	*offset =3D tegra_bo_get_mmap_offset(bo);
+	*offset =3D drm_vma_node_offset_addr(&bo->gem.vma_node);
=20
 	drm_gem_object_unreference(gem);
=20
diff --git a/drivers/gpu/host1x/drm/gem.h b/drivers/gpu/host1x/drm/gem.=
h
index 2e93b03..492533a 100644
--- a/drivers/gpu/host1x/drm/gem.h
+++ b/drivers/gpu/host1x/drm/gem.h
@@ -44,7 +44,6 @@ struct tegra_bo *tegra_bo_create_with_handle(struct d=
rm_file *file,
 					    unsigned int size,
 					    unsigned int *handle);
 void tegra_bo_free_object(struct drm_gem_object *gem);
-unsigned int tegra_bo_get_mmap_offset(struct tegra_bo *bo);
 int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm=
,
 			 struct drm_mode_create_dumb *args);
 int tegra_bo_dumb_map_offset(struct drm_file *file, struct drm_device =
*drm,
--=20
1.8.3.4
