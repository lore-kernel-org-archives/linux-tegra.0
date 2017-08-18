From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 4/4] drm/tegra: Use u64_to_user_ptr helper
Date: Fri, 18 Aug 2017 19:15:53 +0300
Message-ID: <20170818161553.27597-5-mperttunen@nvidia.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170818161553.27597-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use the u64_to_user_ptr helper macro to cast IOCTL argument u64 values
to user pointers instead of writing out the cast manually.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e3331a2bc082..78c98736b0a5 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -389,11 +389,10 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	unsigned int num_relocs = args->num_relocs;
 	unsigned int num_waitchks = args->num_waitchks;
 	struct drm_tegra_cmdbuf __user *cmdbufs =
-		(void __user *)(uintptr_t)args->cmdbufs;
-	struct drm_tegra_reloc __user *relocs =
-		(void __user *)(uintptr_t)args->relocs;
+		u64_to_user_ptr(args->cmdbufs);
+	struct drm_tegra_reloc __user *relocs = u64_to_user_ptr(args->relocs);
 	struct drm_tegra_waitchk __user *waitchks =
-		(void __user *)(uintptr_t)args->waitchks;
+		u64_to_user_ptr(args->waitchks);
 	struct drm_tegra_syncpt syncpt;
 	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
 	struct host1x_syncpt *sp;
@@ -520,7 +519,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		}
 	}
 
-	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
+	if (copy_from_user(&syncpt, u64_to_user_ptr(args->syncpts),
 			   sizeof(syncpt))) {
 		err = -EFAULT;
 		goto fail;
-- 
2.14.1
