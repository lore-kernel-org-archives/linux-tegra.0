From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpu: host1x: Reduce host1x job allocation size
Date: Fri, 23 Jan 2015 18:35:31 -0800
Message-ID: <1422066931-31580-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There is 2 set of num_relocs * sizeof(*) array at the end of host1x job.
Only the first is really used and with job->gather_addr_phys pointing
somewhere within the 1st set of reloc physical addresses.
During pin_job, job->gather_addr_phys array is set indirectly by indexing
num_relocs offset of job->reloc_addr_phys.
Correct the total job size, explicily set job->gather_addr_phys array in
2nd for loop of pin_job and record its physical address.

Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 63bd63f..37c67d2 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -46,8 +46,8 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 		(u64)num_unpins * sizeof(struct host1x_job_unpin_data) +
 		(u64)num_waitchks * sizeof(struct host1x_waitchk) +
 		(u64)num_cmdbufs * sizeof(struct host1x_job_gather) +
-		(u64)num_unpins * sizeof(dma_addr_t) +
-		(u64)num_unpins * sizeof(u32 *);
+		(u64)num_relocs * sizeof(dma_addr_t) +
+		(u64)num_cmdbufs * sizeof(dma_addr_t);
 	if (total > ULONG_MAX)
 		return NULL;
 
@@ -212,7 +212,8 @@ static unsigned int pin_job(struct host1x_job *job)
 		if (!phys_addr)
 			goto unpin;
 
-		job->addr_phys[job->num_unpins] = phys_addr;
+		g->base = phys_addr;
+		job->gather_addr_phys[i] = phys_addr;
 		job->unpins[job->num_unpins].bo = g->bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
@@ -536,8 +537,6 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		if (g->handled)
 			continue;
 
-		g->base = job->gather_addr_phys[i];
-
 		for (j = i + 1; j < job->num_gathers; j++)
 			if (job->gathers[j].bo == g->bo)
 				job->gathers[j].handled = true;
-- 
1.8.1.5
