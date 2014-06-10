From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: Make job submission 64-bit safe
Date: Tue, 10 Jun 2014 13:07:39 +0200
Message-ID: <1402398459-10500-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Job submission currently relies on the fact that struct drm_tegra_reloc
and struct host1x_reloc are the same size and uses a simple call to the
copy_from_user() function to copy them to kernel space. This causes the
handle to be stored in the buffer object field, which then needs a cast
to a 32 bit integer to resolve it to a proper buffer object pointer and
store it back in the buffer object field.

On 64-bit architectures that will no longer work, since pointers are 64
bits wide whereas handles will remain 32 bits. This causes the sizes of
both structures to because different and copying will no longer work.

Fix this by adding a new function, host1x_reloc_get_user(), that copies
the structures field by field.

While at it, use substructures for the command and target buffers in
struct host1x_reloc for better readability. Also use unsized types to
make it more obvious that this isn't part of userspace ABI.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 62 ++++++++++++++++++++++++++++++++-------------
 drivers/gpu/host1x/job.c    | 22 ++++++++--------
 include/linux/host1x.h      | 15 ++++++-----
 3 files changed, 64 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 56ef81a6f28f..57a774b8402a 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -132,6 +132,45 @@ host1x_bo_lookup(struct drm_device *drm, struct drm_file *file, u32 handle)
 	return &bo->base;
 }
 
+static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
+				       struct drm_tegra_reloc __user *src,
+				       struct drm_device *drm,
+				       struct drm_file *file)
+{
+	u32 cmdbuf, target;
+	int err;
+
+	err = get_user(cmdbuf, &src->cmdbuf.handle);
+	if (err < 0)
+		return err;
+
+	err = get_user(dest->cmdbuf.offset, &src->cmdbuf.offset);
+	if (err < 0)
+		return err;
+
+	err = get_user(target, &src->target.handle);
+	if (err < 0)
+		return err;
+
+	err = get_user(dest->target.offset, &src->cmdbuf.offset);
+	if (err < 0)
+		return err;
+
+	err = get_user(dest->shift, &src->shift);
+	if (err < 0)
+		return err;
+
+	dest->cmdbuf.bo = host1x_bo_lookup(drm, file, cmdbuf);
+	if (!dest->cmdbuf.bo)
+		return -ENOENT;
+
+	dest->target.bo = host1x_bo_lookup(drm, file, target);
+	if (!dest->target.bo)
+		return -ENOENT;
+
+	return 0;
+}
+
 int tegra_drm_submit(struct tegra_drm_context *context,
 		     struct drm_tegra_submit *args, struct drm_device *drm,
 		     struct drm_file *file)
@@ -184,26 +223,13 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		cmdbufs++;
 	}
 
-	if (copy_from_user(job->relocarray, relocs,
-			   sizeof(*relocs) * num_relocs)) {
-		err = -EFAULT;
-		goto fail;
-	}
-
+	/* copy and resolve relocations from submit */
 	while (num_relocs--) {
-		struct host1x_reloc *reloc = &job->relocarray[num_relocs];
-		struct host1x_bo *cmdbuf, *target;
-
-		cmdbuf = host1x_bo_lookup(drm, file, (u32)reloc->cmdbuf);
-		target = host1x_bo_lookup(drm, file, (u32)reloc->target);
-
-		reloc->cmdbuf = cmdbuf;
-		reloc->target = target;
-
-		if (!reloc->target || !reloc->cmdbuf) {
-			err = -ENOENT;
+		err = host1x_reloc_copy_from_user(&job->relocarray[num_relocs],
+						  &relocs[num_relocs], drm,
+						  file);
+		if (err < 0)
 			goto fail;
-		}
 	}
 
 	if (copy_from_user(job->waitchk, waitchks,
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 6f72b6e01d36..e115bf22e5d8 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -185,16 +185,16 @@ static unsigned int pin_job(struct host1x_job *job)
 		struct sg_table *sgt;
 		dma_addr_t phys_addr;
 
-		reloc->target = host1x_bo_get(reloc->target);
-		if (!reloc->target)
+		reloc->target.bo = host1x_bo_get(reloc->target.bo);
+		if (!reloc->target.bo)
 			goto unpin;
 
-		phys_addr = host1x_bo_pin(reloc->target, &sgt);
+		phys_addr = host1x_bo_pin(reloc->target.bo, &sgt);
 		if (!phys_addr)
 			goto unpin;
 
 		job->addr_phys[job->num_unpins] = phys_addr;
-		job->unpins[job->num_unpins].bo = reloc->target;
+		job->unpins[job->num_unpins].bo = reloc->target.bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
 	}
@@ -235,21 +235,21 @@ static unsigned int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
 	for (i = 0; i < job->num_relocs; i++) {
 		struct host1x_reloc *reloc = &job->relocarray[i];
 		u32 reloc_addr = (job->reloc_addr_phys[i] +
-			reloc->target_offset) >> reloc->shift;
+				  reloc->target.offset) >> reloc->shift;
 		u32 *target;
 
 		/* skip all other gathers */
-		if (cmdbuf != reloc->cmdbuf)
+		if (cmdbuf != reloc->cmdbuf.bo)
 			continue;
 
-		if (last_page != reloc->cmdbuf_offset >> PAGE_SHIFT) {
+		if (last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
 			if (cmdbuf_page_addr)
 				host1x_bo_kunmap(cmdbuf, last_page,
 						 cmdbuf_page_addr);
 
 			cmdbuf_page_addr = host1x_bo_kmap(cmdbuf,
-					reloc->cmdbuf_offset >> PAGE_SHIFT);
-			last_page = reloc->cmdbuf_offset >> PAGE_SHIFT;
+					reloc->cmdbuf.offset >> PAGE_SHIFT);
+			last_page = reloc->cmdbuf.offset >> PAGE_SHIFT;
 
 			if (unlikely(!cmdbuf_page_addr)) {
 				pr_err("Could not map cmdbuf for relocation\n");
@@ -257,7 +257,7 @@ static unsigned int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
 			}
 		}
 
-		target = cmdbuf_page_addr + (reloc->cmdbuf_offset & ~PAGE_MASK);
+		target = cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
 		*target = reloc_addr;
 	}
 
@@ -272,7 +272,7 @@ static bool check_reloc(struct host1x_reloc *reloc, struct host1x_bo *cmdbuf,
 {
 	offset *= sizeof(u32);
 
-	if (reloc->cmdbuf != cmdbuf || reloc->cmdbuf_offset != offset)
+	if (reloc->cmdbuf.bo != cmdbuf || reloc->cmdbuf.offset != offset)
 		return false;
 
 	return true;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index b432b3ddbc13..f4f65e23cfcc 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -165,12 +165,15 @@ int host1x_job_submit(struct host1x_job *job);
  */
 
 struct host1x_reloc {
-	struct host1x_bo *cmdbuf;
-	u32 cmdbuf_offset;
-	struct host1x_bo *target;
-	u32 target_offset;
-	u32 shift;
-	u32 pad;
+	struct {
+		struct host1x_bo *bo;
+		unsigned long offset;
+	} cmdbuf;
+	struct {
+		struct host1x_bo *bo;
+		unsigned long offset;
+	} target;
+	unsigned long shift;
 };
 
 struct host1x_job {
-- 
1.9.2
