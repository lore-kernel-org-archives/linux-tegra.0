From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/10] drm/tegra: Make syncpoints be per-context
Date: Sun,  5 Nov 2017 13:01:15 +0200
Message-ID: <20171105110118.15142-8-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105110118.15142-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

As a preparation for each context potentially being able to have a
separate hardware channel, and thus requiring a separate syncpoint,
move syncpoints to be stored inside each context instead of global
client data.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c  | 8 ++++----
 drivers/gpu/drm/tegra/drm.h  | 1 +
 drivers/gpu/drm/tegra/gr2d.c | 2 ++
 drivers/gpu/drm/tegra/gr3d.c | 2 ++
 drivers/gpu/drm/tegra/vic.c  | 2 ++
 5 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 3e2a4a19412e..b964e18e3058 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -783,12 +783,12 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 		goto unlock;
 	}
 
-	if (args->index >= context->client->base.num_syncpts) {
+	if (args->index >= 1) {
 		err = -EINVAL;
 		goto unlock;
 	}
 
-	syncpt = context->client->base.syncpts[args->index];
+	syncpt = context->syncpt;
 	args->id = host1x_syncpt_id(syncpt);
 
 unlock:
@@ -837,12 +837,12 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
 		goto unlock;
 	}
 
-	if (args->syncpt >= context->client->base.num_syncpts) {
+	if (args->syncpt >= 1) {
 		err = -EINVAL;
 		goto unlock;
 	}
 
-	syncpt = context->client->base.syncpts[args->syncpt];
+	syncpt = context->syncpt;
 
 	base = host1x_syncpt_get_base(syncpt);
 	if (!base) {
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 079aebb3fb38..11d690846fd0 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -79,6 +79,7 @@ struct tegra_drm_context {
 
 	struct tegra_drm_client *client;
 	struct host1x_channel *channel;
+	struct host1x_syncpt *syncpt;
 	unsigned int id;
 };
 
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 6ea070da7718..3db3bcac48b9 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -76,6 +76,8 @@ static int gr2d_open_channel(struct tegra_drm_client *client,
 	if (!context->channel)
 		return -ENOMEM;
 
+	context->syncpt = client->base.syncpts[0];
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index cee2ab645cde..279438342c8c 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -86,6 +86,8 @@ static int gr3d_open_channel(struct tegra_drm_client *client,
 	if (!context->channel)
 		return -ENOMEM;
 
+	context->syncpt = client->base.syncpts[0];
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 6697a21a250d..efe5f3af933e 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -240,6 +240,8 @@ static int vic_open_channel(struct tegra_drm_client *client,
 		return -ENOMEM;
 	}
 
+	context->syncpt = client->base.syncpts[0];
+
 	return 0;
 }
 
-- 
2.14.2
