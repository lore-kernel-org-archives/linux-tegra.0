From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 3/3] gpu: host1x: Record the physical address for gathers
Date: Thu, 5 Mar 2015 17:51:52 -0800
Message-ID: <1425606712-15986-3-git-send-email-davidu@nvidia.com>
References: <1425606712-15986-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425606712-15986-1-git-send-email-davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The gather's base physical address is recorded during patching of gathers,
but only the 1st one within the same buffer object has it set, subsequent
gathers in the same buffer are being skipped.
This patch records the phys addr during pin_job for all gathers.

Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 7ecbefd..6b374bc 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -202,17 +202,16 @@ static unsigned int pin_job(struct host1x_job *job)
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
 		struct sg_table *sgt;
-		dma_addr_t phys_addr;
 
 		g->bo = host1x_bo_get(g->bo);
 		if (!g->bo)
 			goto unpin;
 
-		phys_addr = host1x_bo_pin(g->bo, &sgt);
-		if (!phys_addr)
+		g->base = host1x_bo_pin(g->bo, &sgt);
+		if (!g->base)
 			goto unpin;
 
-		job->gather_addr_phys[i] = phys_addr;
+		job->gather_addr_phys[i] = g->base;
 		job->unpins[job->num_unpins].bo = g->bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
@@ -536,8 +535,6 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		if (g->handled)
 			continue;
 
-		g->base = job->gather_addr_phys[i];
-
 		for (j = i + 1; j < job->num_gathers; j++)
 			if (job->gathers[j].bo == g->bo)
 				job->gathers[j].handled = true;
-- 
1.8.1.5
