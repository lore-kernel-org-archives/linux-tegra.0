From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 2/2] drm/tegra: silence some sparse complaints
Date: Fri, 8 Nov 2013 13:08:03 +0300
Message-ID: <20131108100803.GY27977@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I've shifted the __user markup to make Sparse happy.

drivers/gpu/drm/tegra/drm.c:138:18: warning: incorrect type in initializer (different address spaces)
drivers/gpu/drm/tegra/drm.c:138:18:    expected struct drm_tegra_cmdbuf [noderef] <asn:1>*cmdbufs
drivers/gpu/drm/tegra/drm.c:138:18:    got void *[noderef] <asn:1><noident>

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index fd3ff3b..96a9207 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -135,11 +135,11 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	unsigned int num_relocs = args->num_relocs;
 	unsigned int num_waitchks = args->num_waitchks;
 	struct drm_tegra_cmdbuf __user *cmdbufs =
-		(void * __user)(uintptr_t)args->cmdbufs;
+		(void __user *)(uintptr_t)args->cmdbufs;
 	struct drm_tegra_reloc __user *relocs =
-		(void * __user)(uintptr_t)args->relocs;
+		(void __user *)(uintptr_t)args->relocs;
 	struct drm_tegra_waitchk __user *waitchks =
-		(void * __user)(uintptr_t)args->waitchks;
+		(void __user *)(uintptr_t)args->waitchks;
 	struct drm_tegra_syncpt syncpt;
 	struct host1x_job *job;
 	int err;
@@ -207,7 +207,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		goto fail;
 	}
 
-	if (copy_from_user(&syncpt, (void * __user)(uintptr_t)args->syncpts,
+	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
 			   sizeof(syncpt))) {
 		err = -EFAULT;
 		goto fail;
