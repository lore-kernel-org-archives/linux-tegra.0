From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: Check offsets of a submitted command buffer and of relocations
Date: Sun, 14 May 2017 23:47:33 +0300
Message-ID: <20170514204734.22130-3-digetx@gmail.com>
References: <20170514204734.22130-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170514204734.22130-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If commands buffer claims a number of words that is higher than its BO can
fit, a kernel OOPS will be fired on the out-of-bounds BO access. This was
triggered by an opentegra Xorg driver that erroneously pushed too many
commands to the pushbuf. The CMDA commands buffer address is 4 bytes
aligned, so check the alignment as well.

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
---
 drivers/gpu/drm/tegra/drm.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/gem.c |  5 -----
 drivers/gpu/drm/tegra/gem.h |  5 +++++
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 768750226452..c5844a065681 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -362,6 +362,8 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	while (num_cmdbufs) {
 		struct drm_tegra_cmdbuf cmdbuf;
 		struct host1x_bo *bo;
+		struct tegra_bo *obj;
+		u64 offset;
 
 		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
 			err = -EFAULT;
@@ -374,6 +376,14 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 			goto fail;
 		}
 
+		offset = (u64)cmdbuf.offset + (u64)cmdbuf.words * sizeof(u32);
+		obj = host1x_to_tegra_bo(bo);
+
+		if (offset & 3 || offset > obj->gem.size) {
+			err = -EINVAL;
+			goto fail;
+		}
+
 		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
 		num_cmdbufs--;
 		cmdbufs++;
@@ -381,11 +391,31 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
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
+		if (reloc->cmdbuf.offset & 3 ||
+		    reloc->cmdbuf.offset > obj->gem.size) {
+			err = -EINVAL;
+			goto fail;
+		}
+
+		obj = host1x_to_tegra_bo(reloc->target.bo);
+
+		if (reloc->target.offset & 3 ||
+		    reloc->target.offset > obj->gem.size) {
+			err = -EINVAL;
+			goto fail;
+		}
 	}
 
 	if (copy_from_user(job->waitchk, waitchks,
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index b76d7ac75696..a0ff30c01ac1 100644
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
