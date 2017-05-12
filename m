From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] drm/tegra: Check size of a submitted command buffer
Date: Fri, 12 May 2017 22:02:12 +0300
Message-ID: <20170512190212.17798-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If command buffer claims a number of words that is higher than its BO can
fit and a relocation lays past the BO, a kernel OOPS will be fired on that
relocation address patching. This was triggered by an opentegra Xorg driver
that erroneously pushed too many commands to the pushbuf.

[   46.829393] Unable to handle kernel paging request at virtual address f09b2000
...
[<c04a3ba4>] (host1x_job_pin) from [<c04dfcd0>] (tegra_drm_submit+0x474/0x510)
[<c04dfcd0>] (tegra_drm_submit) from [<c04deea0>] (tegra_submit+0x50/0x6c)
[<c04deea0>] (tegra_submit) from [<c04c07c0>] (drm_ioctl+0x1e4/0x3ec)
[<c04c07c0>] (drm_ioctl) from [<c02541a0>] (do_vfs_ioctl+0x9c/0x8e4)
[<c02541a0>] (do_vfs_ioctl) from [<c0254a1c>] (SyS_ioctl+0x34/0x5c)
[<c0254a1c>] (SyS_ioctl) from [<c0107640>] (ret_fast_syscall+0x0/0x3c)

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 732c8d98044f..e9c74a7780e7 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -361,20 +361,30 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 	while (num_cmdbufs) {
 		struct drm_tegra_cmdbuf cmdbuf;
-		struct host1x_bo *bo;
+		struct drm_gem_object *gem;
+		struct tegra_bo *bo;
 
 		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
 			err = -EFAULT;
 			goto fail;
 		}
 
-		bo = host1x_bo_lookup(file, cmdbuf.handle);
-		if (!bo) {
+		gem = drm_gem_object_lookup(file, cmdbuf.handle);
+		if (!gem) {
 			err = -ENOENT;
 			goto fail;
 		}
 
-		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
+		drm_gem_object_unreference_unlocked(gem);
+
+		if (cmdbuf.words * 4 > gem->size) {
+			err = -EINVAL;
+			goto fail;
+		}
+
+		bo = to_tegra_bo(gem);
+		host1x_job_add_gather(job, &bo->base,
+				      cmdbuf.words, cmdbuf.offset);
 		num_cmdbufs--;
 		cmdbufs++;
 	}
-- 
2.12.2
