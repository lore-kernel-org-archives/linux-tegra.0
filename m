From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 03/20] drm/tegra: Check for malformed offsets and sizes in the 'submit' IOCTL
Date: Thu, 15 Jun 2017 02:18:26 +0300
Message-ID: <57b9f4f8d6276170559dd06f6ae99d034de138e3.1497480755.git.digetx@gmail.com>
References: <cover.1497480751.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If commands buffer claims a number of words that is higher than its BO can
fit, a kernel OOPS will be fired on the out-of-bounds BO access. This was
triggered by an opentegra Xorg driver that erroneously pushed too many
commands to the pushbuf.

The CDMA commands buffer address is 4 bytes aligned, so check its alignment.

The maximum number of the CDMA gather fetches is 16383, add a check for it.

Add a sanity check for the relocations in a same way.

[   46.829393] Unable to handle kernel paging request at virtual address f09b2000
...
[<c04a3ba4>] (host1x_job_pin) from [<c04dfcd0>] (tegra_drm_submit+0x474/0x510)
[<c04dfcd0>] (tegra_drm_submit) from [<c04deea0>] (tegra_submit+0x50/0x6c)
[<c04deea0>] (tegra_submit) from [<c04c07c0>] (drm_ioctl+0x1e4/0x3ec)
[<c04c07c0>] (drm_ioctl) from [<c02541a0>] (do_vfs_ioctl+0x9c/0x8e4)
[<c02541a0>] (do_vfs_ioctl) from [<c0254a1c>] (SyS_ioctl+0x34/0x5c)
[<c0254a1c>] (SyS_ioctl) from [<c0107640>] (ret_fast_syscall+0x0/0x3c)

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 49 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/gem.c |  5 -----
 drivers/gpu/drm/tegra/gem.h |  5 +++++
 3 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index f9282da94a1f..c9246405fc7b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -26,6 +26,7 @@
 #define DRIVER_PATCHLEVEL 0
 
 #define CARVEOUT_SZ SZ_64M
+#define CDMA_GATHER_FETCHES_MAX_NB 16383
 
 struct tegra_drm_file {
 	struct idr contexts;
@@ -383,18 +384,42 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	while (num_cmdbufs) {
 		struct drm_tegra_cmdbuf cmdbuf;
 		struct host1x_bo *bo;
+		struct tegra_bo *obj;
+		u64 offset;
 
 		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
 			err = -EFAULT;
 			goto fail;
 		}
 
+		/*
+		 * The maximum number of CDMA gather fetches is 16383, a higher
+		 * value means the words count is malformed.
+		 */
+		if (cmdbuf.words > CDMA_GATHER_FETCHES_MAX_NB) {
+			err = -EINVAL;
+			goto fail;
+		}
+
 		bo = host1x_bo_lookup(file, cmdbuf.handle);
 		if (!bo) {
 			err = -ENOENT;
 			goto fail;
 		}
 
+		offset = (u64)cmdbuf.offset + (u64)cmdbuf.words * sizeof(u32);
+		obj = host1x_to_tegra_bo(bo);
+
+		/*
+		 * Gather buffer base address must be 4-bytes aligned,
+		 * unaligned offset is malformed and cause commands stream
+		 * corruption on the buffer address relocation.
+		 */
+		if (offset & 3 || offset >= obj->gem.size) {
+			err = -EINVAL;
+			goto fail;
+		}
+
 		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
 		num_cmdbufs--;
 		cmdbufs++;
@@ -402,11 +427,35 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 	/* copy and resolve relocations from submit */
 	while (num_relocs--) {
+		struct host1x_reloc *reloc;
+		struct tegra_bo *obj;
+
 		err = host1x_reloc_copy_from_user(&job->relocarray[num_relocs],
 						  &relocs[num_relocs], drm,
 						  file);
 		if (err < 0)
 			goto fail;
+
+		reloc = &job->relocarray[num_relocs];
+		obj = host1x_to_tegra_bo(reloc->cmdbuf.bo);
+
+		/*
+		 * The unaligned cmdbuf offset will cause an unaligned write
+		 * during of the relocations patching, corrupting the commands
+		 * stream.
+		 */
+		if (reloc->cmdbuf.offset & 3 ||
+		    reloc->cmdbuf.offset >= obj->gem.size) {
+			err = -EINVAL;
+			goto fail;
+		}
+
+		obj = host1x_to_tegra_bo(reloc->target.bo);
+
+		if (reloc->target.offset >= obj->gem.size) {
+			err = -EINVAL;
+			goto fail;
+		}
 	}
 
 	if (copy_from_user(job->waitchk, waitchks,
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 424569b53e57..7a39a355678a 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -20,11 +20,6 @@
 #include "drm.h"
 #include "gem.h"
 
-static inline struct tegra_bo *host1x_to_tegra_bo(struct host1x_bo *bo)
-{
-	return container_of(bo, struct tegra_bo, base);
-}
-
 static void tegra_bo_put(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index 6c5f12ac0087..8b32a6fd586d 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -52,6 +52,11 @@ static inline struct tegra_bo *to_tegra_bo(struct drm_gem_object *gem)
 	return container_of(gem, struct tegra_bo, gem);
 }
 
+static inline struct tegra_bo *host1x_to_tegra_bo(struct host1x_bo *bo)
+{
+	return container_of(bo, struct tegra_bo, base);
+}
+
 struct tegra_bo *tegra_bo_create(struct drm_device *drm, size_t size,
 				 unsigned long flags);
 struct tegra_bo *tegra_bo_create_with_handle(struct drm_file *file,
-- 
2.13.0
