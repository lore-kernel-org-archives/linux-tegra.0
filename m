From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 1/2] drm/tegra: return -EFAULT if copy_from_user() fails
Date: Fri, 8 Nov 2013 13:07:37 +0300
Message-ID: <20131108100737.GX27977@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

copy_from_user() returns the number of bytes remaining if it fails, but
we want to return -EFAULT here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 28e1781..fd3ff3b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -163,9 +163,10 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		struct drm_tegra_cmdbuf cmdbuf;
 		struct host1x_bo *bo;
 
-		err = copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf));
-		if (err)
+		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
+			err = -EFAULT;
 			goto fail;
+		}
 
 		bo = host1x_bo_lookup(drm, file, cmdbuf.handle);
 		if (!bo) {
@@ -178,10 +179,11 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		cmdbufs++;
 	}
 
-	err = copy_from_user(job->relocarray, relocs,
-			     sizeof(*relocs) * num_relocs);
-	if (err)
+	if (copy_from_user(job->relocarray, relocs,
+			   sizeof(*relocs) * num_relocs)) {
+		err = -EFAULT;
 		goto fail;
+	}
 
 	while (num_relocs--) {
 		struct host1x_reloc *reloc = &job->relocarray[num_relocs];
@@ -199,15 +201,17 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		}
 	}
 
-	err = copy_from_user(job->waitchk, waitchks,
-			     sizeof(*waitchks) * num_waitchks);
-	if (err)
+	if (copy_from_user(job->waitchk, waitchks,
+			   sizeof(*waitchks) * num_waitchks)) {
+		err = -EFAULT;
 		goto fail;
+	}
 
-	err = copy_from_user(&syncpt, (void * __user)(uintptr_t)args->syncpts,
-			     sizeof(syncpt));
-	if (err)
+	if (copy_from_user(&syncpt, (void * __user)(uintptr_t)args->syncpts,
+			   sizeof(syncpt))) {
+		err = -EFAULT;
 		goto fail;
+	}
 
 	job->is_addr_reg = context->client->ops->is_addr_reg;
 	job->syncpt_incrs = syncpt.incrs;
