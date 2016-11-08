From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] gpu: host1x: Store device address to all bufs
Date: Tue,  8 Nov 2016 19:51:32 +0200
Message-ID: <20161108175135.32004-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Currently job pinning is optimized to handle only the first buffer
using a certain host1x_bo object and all subsequent buffers using
the same host1x_bo are considered done.

In most cases this is correct, however, in case the same host1x_bo
is used in multiple gathers inside the same job, we skip also
storing the device address (physical or iova) to this buffer.

This patch reworks the host1x_job_pin() to store the device address
to all gathers.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a91b7c4..92c3df9 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -1,7 +1,7 @@
 /*
  * Tegra host1x Job
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Copyright (c) 2010-2015, NVIDIA Corporation.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -539,9 +539,12 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 
 		g->base = job->gather_addr_phys[i];
 
-		for (j = i + 1; j < job->num_gathers; j++)
-			if (job->gathers[j].bo == g->bo)
+		for (j = i + 1; j < job->num_gathers; j++) {
+			if (job->gathers[j].bo == g->bo) {
 				job->gathers[j].handled = true;
+				job->gathers[j].base = g->base;
+			}
+		}
 
 		err = do_relocs(job, g->bo);
 		if (err)
-- 
2.9.3
