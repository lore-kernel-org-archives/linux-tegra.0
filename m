From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpu: host1x: Store physical address to all bufs
Date: Fri, 16 Jan 2015 17:07:46 -0800
Message-ID: <1421456866-31670-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 63bd63f..7f3cfff 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
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
1.8.1.5
