From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] drm/prime: Export more helpers for drivers
Date: Thu, 11 Jan 2018 22:44:17 +0100
Message-ID: <20180111214420.26203-2-thierry.reding@gmail.com>
References: <20180111214420.26203-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111214420.26203-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Export some more of the helpers in order to allow drivers to more fine-
grainedly select which helpers to use. This gives drivers an easy way to
reuse a lot of the code in the helpers while at the same time allowing
them to provide their own implementation for other functions in struct
dma_buf_ops.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/drm_prime.c | 23 +++++++++++++----------
 include/drm/drm_prime.h     | 12 ++++++++++++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 9a17725b0f7a..f9903e6b59f6 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -180,9 +180,8 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
 	return -ENOENT;
 }
 
-static int drm_gem_map_attach(struct dma_buf *dma_buf,
-			      struct device *target_dev,
-			      struct dma_buf_attachment *attach)
+int drm_gem_map_attach(struct dma_buf *dma_buf, struct device *target_dev,
+		       struct dma_buf_attachment *attach)
 {
 	struct drm_prime_attachment *prime_attach;
 	struct drm_gem_object *obj = dma_buf->priv;
@@ -200,9 +199,10 @@ static int drm_gem_map_attach(struct dma_buf *dma_buf,
 
 	return dev->driver->gem_prime_pin(obj);
 }
+EXPORT_SYMBOL(drm_gem_map_attach);
 
-static void drm_gem_map_detach(struct dma_buf *dma_buf,
-			       struct dma_buf_attachment *attach)
+void drm_gem_map_detach(struct dma_buf *dma_buf,
+			struct dma_buf_attachment *attach)
 {
 	struct drm_prime_attachment *prime_attach = attach->priv;
 	struct drm_gem_object *obj = dma_buf->priv;
@@ -228,6 +228,7 @@ static void drm_gem_map_detach(struct dma_buf *dma_buf,
 	kfree(prime_attach);
 	attach->priv = NULL;
 }
+EXPORT_SYMBOL(drm_gem_map_detach);
 
 void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
 					struct dma_buf *dma_buf)
@@ -254,8 +255,8 @@ void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpr
 	}
 }
 
-static struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
-					    enum dma_data_direction dir)
+struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
+				     enum dma_data_direction dir)
 {
 	struct drm_prime_attachment *prime_attach = attach->priv;
 	struct drm_gem_object *obj = attach->dmabuf->priv;
@@ -291,13 +292,15 @@ static struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 
 	return sgt;
 }
+EXPORT_SYMBOL(drm_gem_map_dma_buf);
 
-static void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
-				  struct sg_table *sgt,
-				  enum dma_data_direction dir)
+void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
+			   struct sg_table *sgt,
+			   enum dma_data_direction dir)
 {
 	/* nothing to be done here */
 }
+EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
 
 /**
  * drm_gem_dmabuf_export - dma_buf export implementation for GEM
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 59ccab402e85..3a9706815773 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -50,8 +50,10 @@ struct drm_prime_file_private {
 	struct rb_root handles;
 };
 
+enum dma_data_direction;
 struct device;
 
+struct dma_buf_attachment;
 struct dma_buf_export_info;
 struct dma_buf;
 
@@ -59,6 +61,16 @@ struct drm_device;
 struct drm_gem_object;
 struct drm_file;
 
+int drm_gem_map_attach(struct dma_buf *dma_buf, struct device *target_dev,
+		       struct dma_buf_attachment *attach);
+void drm_gem_map_detach(struct dma_buf *dma_buf,
+			struct dma_buf_attachment *attach);
+struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
+				     enum dma_data_direction dir);
+void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
+			   struct sg_table *sgt,
+			   enum dma_data_direction dir);
+
 struct dma_buf *drm_gem_prime_export(struct drm_device *dev,
 				     struct drm_gem_object *obj,
 				     int flags);
-- 
2.15.1
