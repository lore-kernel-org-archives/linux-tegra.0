From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] gpu: host1x: Add locking to syncpt
Date: Tue,  8 Nov 2016 19:51:33 +0200
Message-ID: <20161108175135.32004-2-mperttunen@nvidia.com>
References: <20161108175135.32004-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108175135.32004-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Currently syncpoints are not locked by mutex and this causes races
if we are aggressively freeing and allocating syncpoints.

This patch adds missing mutex protection to syncpoint structures.

Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Shridhar Rasal <srasal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/dev.h    |  3 ++-
 drivers/gpu/host1x/syncpt.c | 25 +++++++++++++++++++++----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 5220510..06dd4f8 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2012-2013, NVIDIA Corporation.
+ * Copyright (c) 2012-2015, NVIDIA Corporation.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -120,6 +120,7 @@ struct host1x {
 
 	struct host1x_syncpt *nop_sp;
 
+	struct mutex syncpt_mutex;
 	struct mutex chlist_mutex;
 	struct host1x_channel chlist;
 	unsigned long allocated_channels;
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 9558932..f3b04ed 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -1,7 +1,7 @@
 /*
  * Tegra host1x Syncpoints
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Copyright (c) 2010-2015, NVIDIA Corporation.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -61,22 +61,24 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 	struct host1x_syncpt *sp = host->syncpt;
 	char *name;
 
+	mutex_lock(&host->syncpt_mutex);
+
 	for (i = 0; i < host->info->nb_pts && sp->name; i++, sp++)
 		;
 
 	if (i >= host->info->nb_pts)
-		return NULL;
+		goto err_alloc_syncpt;
 
 	if (flags & HOST1X_SYNCPT_HAS_BASE) {
 		sp->base = host1x_syncpt_base_request(host);
 		if (!sp->base)
-			return NULL;
+			goto err_alloc_base;
 	}
 
 	name = kasprintf(GFP_KERNEL, "%02u-%s", sp->id,
 			dev ? dev_name(dev) : NULL);
 	if (!name)
-		return NULL;
+		goto err_alloc_name;
 
 	sp->dev = dev;
 	sp->name = name;
@@ -86,7 +88,17 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 	else
 		sp->client_managed = false;
 
+	mutex_unlock(&host->syncpt_mutex);
 	return sp;
+
+err_alloc_name:
+	host1x_syncpt_base_free(sp->base);
+	sp->base = NULL;
+err_alloc_base:
+	sp = NULL;
+err_alloc_syncpt:
+	mutex_unlock(&host->syncpt_mutex);
+	return NULL;
 }
 
 u32 host1x_syncpt_id(struct host1x_syncpt *sp)
@@ -378,6 +390,7 @@ int host1x_syncpt_init(struct host1x *host)
 	for (i = 0; i < host->info->nb_bases; i++)
 		bases[i].id = i;
 
+	mutex_init(&host->syncpt_mutex);
 	host->syncpt = syncpt;
 	host->bases = bases;
 
@@ -405,12 +418,16 @@ void host1x_syncpt_free(struct host1x_syncpt *sp)
 	if (!sp)
 		return;
 
+	mutex_lock(&sp->host->syncpt_mutex);
+
 	host1x_syncpt_base_free(sp->base);
 	kfree(sp->name);
 	sp->base = NULL;
 	sp->dev = NULL;
 	sp->name = NULL;
 	sp->client_managed = false;
+
+	mutex_unlock(&sp->host->syncpt_mutex);
 }
 EXPORT_SYMBOL(host1x_syncpt_free);
 
-- 
2.9.3
