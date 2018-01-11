From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] drm/tegra: Support for sync file-based fences in submit
Date: Thu, 11 Jan 2018 23:22:49 +0100
Message-ID: <20180111222249.29105-4-thierry.reding@gmail.com>
References: <20180111222249.29105-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111222249.29105-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add support for sync file-based prefences and postfences
to job submission. Fences are passed to the Host1x implementation.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 82 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index d50bddb2e447..c40175c32dd7 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -11,6 +11,7 @@
 #include <linux/host1x.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
+#include <linux/sync_file.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -374,6 +375,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		     struct drm_tegra_submit *args, struct drm_device *drm,
 		     struct drm_file *file)
 {
+	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
 	unsigned int num_cmdbufs = args->num_cmdbufs;
 	unsigned int num_relocs = args->num_relocs;
 	unsigned int num_waitchks = args->num_waitchks;
@@ -382,7 +384,6 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	struct drm_tegra_waitchk __user *user_waitchks;
 	struct drm_tegra_syncpt __user *user_syncpt;
 	struct drm_tegra_syncpt syncpt;
-	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
 	struct drm_gem_object **refs;
 	struct host1x_syncpt *sp;
 	struct host1x_job *job;
@@ -402,6 +403,10 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	if (args->num_waitchks != 0)
 		return -EINVAL;
 
+	/* Check for unrecognized flags */
+	if (args->flags & ~DRM_TEGRA_SUBMIT_FLAGS)
+		return -EINVAL;
+
 	job = host1x_job_alloc(context->channel, args->num_cmdbufs,
 			       args->num_relocs, args->num_waitchks);
 	if (!job)
@@ -413,6 +418,14 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	job->class = context->client->base.class;
 	job->serialize = true;
 
+	if (args->flags & DRM_TEGRA_SUBMIT_WAIT_FENCE_FD) {
+		job->prefence = sync_file_get_fence(args->fence);
+		if (!job->prefence) {
+			err = -ENOENT;
+			goto put;
+		}
+	}
+
 	/*
 	 * Track referenced BOs so that they can be unreferenced after the
 	 * submission is complete.
@@ -436,7 +449,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 		if (copy_from_user(&cmdbuf, user_cmdbufs, sizeof(cmdbuf))) {
 			err = -EFAULT;
-			goto fail;
+			goto put_bos;
 		}
 
 		/*
@@ -445,13 +458,13 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		 */
 		if (cmdbuf.words > CDMA_GATHER_FETCHES_MAX_NB) {
 			err = -EINVAL;
-			goto fail;
+			goto put_bos;
 		}
 
 		bo = host1x_bo_lookup(file, cmdbuf.handle);
 		if (!bo) {
 			err = -ENOENT;
-			goto fail;
+			goto put_bos;
 		}
 
 		offset = (u64)cmdbuf.offset + (u64)cmdbuf.words * sizeof(u32);
@@ -465,7 +478,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		 */
 		if (offset & 3 || offset >= obj->gem.size) {
 			err = -EINVAL;
-			goto fail;
+			goto put_bos;
 		}
 
 		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
@@ -482,7 +495,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 						  &user_relocs[num_relocs], drm,
 						  file);
 		if (err < 0)
-			goto fail;
+			goto put_bos;
 
 		reloc = &job->relocarray[num_relocs];
 		obj = host1x_to_tegra_bo(reloc->cmdbuf.bo);
@@ -496,7 +509,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		if (reloc->cmdbuf.offset & 3 ||
 		    reloc->cmdbuf.offset >= obj->gem.size) {
 			err = -EINVAL;
-			goto fail;
+			goto put_bos;
 		}
 
 		obj = host1x_to_tegra_bo(reloc->target.bo);
@@ -504,7 +517,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 		if (reloc->target.offset >= obj->gem.size) {
 			err = -EINVAL;
-			goto fail;
+			goto put_bos;
 		}
 	}
 
@@ -516,7 +529,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		err = host1x_waitchk_copy_from_user(
 			wait, &user_waitchks[num_waitchks], file);
 		if (err < 0)
-			goto fail;
+			goto put_bos;
 
 		obj = host1x_to_tegra_bo(wait->bo);
 		refs[num_refs++] = &obj->gem;
@@ -528,20 +541,20 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		if (wait->offset & 3 ||
 		    wait->offset >= obj->gem.size) {
 			err = -EINVAL;
-			goto fail;
+			goto put_bos;
 		}
 	}
 
 	if (copy_from_user(&syncpt, user_syncpt, sizeof(syncpt))) {
 		err = -EFAULT;
-		goto fail;
+		goto put_bos;
 	}
 
 	/* check whether syncpoint ID is valid */
 	sp = host1x_syncpt_get(host1x, syncpt.id);
 	if (!sp) {
 		err = -ENOENT;
-		goto fail;
+		goto put_bos;
 	}
 
 	job->is_addr_reg = context->client->ops->is_addr_reg;
@@ -555,23 +568,60 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 	err = host1x_job_pin(job, context->client->base.dev);
 	if (err)
-		goto fail;
+		goto put_bos;
 
 	err = host1x_job_submit(job);
 	if (err) {
 		host1x_job_unpin(job);
-		goto fail;
+		goto put_bos;
 	}
 
-	args->fence = job->syncpt_end;
+	if (args->flags & DRM_TEGRA_SUBMIT_CREATE_FENCE_FD) {
+		struct host1x_syncpt *syncpt;
+		struct dma_fence *fence;
+		struct sync_file *file;
+
+		syncpt = host1x_syncpt_get(host1x, job->syncpt_id);
+		if (!syncpt) {
+			err = -EINVAL;
+			goto put_bos;
+		}
 
-fail:
+		fence = host1x_fence_create(host1x, syncpt, job->syncpt_end);
+		if (!fence) {
+			err = -ENOMEM;
+			goto put_bos;
+		}
+
+		file = sync_file_create(fence);
+		if (!file) {
+			dma_fence_put(fence);
+			err = -ENOMEM;
+			goto put_bos;
+		}
+
+		err = get_unused_fd_flags(O_CLOEXEC);
+		if (err < 0) {
+			dma_fence_put(fence);
+			goto put_bos;
+		}
+
+		fd_install(err, file->file);
+		args->fence = err;
+	} else {
+		args->fence = job->syncpt_end;
+	}
+
+put_bos:
 	while (num_refs--)
 		drm_gem_object_put_unlocked(refs[num_refs]);
 
 	kfree(refs);
 
 put:
+	if (job->prefence)
+		dma_fence_put(job->prefence);
+
 	host1x_job_put(job);
 	return err;
 }
-- 
2.15.1
