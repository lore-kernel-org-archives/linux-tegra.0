From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/3] gpu: host1x: Reduce host1x job allocation size
Date: Thu, 5 Mar 2015 17:51:50 -0800
Message-ID: <1425606712-15986-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There is 2 set of num_relocs * sizeof(*) array at the end of host1x job.
Only the 1st set is really used and with job->gather_addr_phys pointing
somewhere within the 1st set of reloc physical addresses.
This patch removes the 2nd set of unused addresses.

Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 63bd63f..9c11265 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -46,8 +46,9 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 		(u64)num_unpins * sizeof(struct host1x_job_unpin_data) +
 		(u64)num_waitchks * sizeof(struct host1x_waitchk) +
 		(u64)num_cmdbufs * sizeof(struct host1x_job_gather) +
-		(u64)num_unpins * sizeof(dma_addr_t) +
-		(u64)num_unpins * sizeof(u32 *);
+		(u64)num_relocs * sizeof(dma_addr_t) +
+		(u64)num_cmdbufs * sizeof(dma_addr_t);
+
 	if (total > ULONG_MAX)
 		return NULL;
 
-- 
1.8.1.5
