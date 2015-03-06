From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/3] gpu: host1x: Remove addr_phys member from host1x_job
Date: Thu, 5 Mar 2015 17:51:51 -0800
Message-ID: <1425606712-15986-2-git-send-email-davidu@nvidia.com>
References: <1425606712-15986-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425606712-15986-1-git-send-email-davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We are using addr_phys and gather_addr_phys/reloc_addr_phys interchangeably
which points to the same set of memory. Using only gather/reloc_addr_phys
make the code clearer and less error prone.

Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 11 +++++------
 include/linux/host1x.h   |  1 -
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 9c11265..7ecbefd 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -69,10 +69,9 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 	mem += num_waitchks * sizeof(struct host1x_waitchk);
 	job->gathers = num_cmdbufs ? mem : NULL;
 	mem += num_cmdbufs * sizeof(struct host1x_job_gather);
-	job->addr_phys = num_unpins ? mem : NULL;
-
-	job->reloc_addr_phys = job->addr_phys;
-	job->gather_addr_phys = &job->addr_phys[num_relocs];
+	job->reloc_addr_phys = num_unpins ? mem : NULL;
+	mem += num_relocs * sizeof(dma_addr_t);
+	job->gather_addr_phys = num_unpins ? mem : NULL;
 
 	return job;
 }
@@ -194,7 +193,7 @@ static unsigned int pin_job(struct host1x_job *job)
 		if (!phys_addr)
 			goto unpin;
 
-		job->addr_phys[job->num_unpins] = phys_addr;
+		job->reloc_addr_phys[i] = phys_addr;
 		job->unpins[job->num_unpins].bo = reloc->target.bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
@@ -213,7 +212,7 @@ static unsigned int pin_job(struct host1x_job *job)
 		if (!phys_addr)
 			goto unpin;
 
-		job->addr_phys[job->num_unpins] = phys_addr;
+		job->gather_addr_phys[i] = phys_addr;
 		job->unpins[job->num_unpins].bo = g->bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index bb9840f..a722c4b 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -202,7 +202,6 @@ struct host1x_job {
 	struct host1x_job_unpin_data *unpins;
 	unsigned int num_unpins;
 
-	dma_addr_t *addr_phys;
 	dma_addr_t *gather_addr_phys;
 	dma_addr_t *reloc_addr_phys;
 
-- 
1.8.1.5
