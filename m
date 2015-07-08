From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] host1x: Store device address to all bufs
Date: Wed, 8 Jul 2015 14:27:44 +0300
Message-ID: <1436354868-24309-2-git-send-email-mperttunen@nvidia.com>
References: <1436354868-24309-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436354868-24309-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
index 63bd63f..b72aa91 100644
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
@@ -538,9 +538,12 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 
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
2.1.4
