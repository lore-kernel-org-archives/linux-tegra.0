From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: Initialize firewall class to the jobs one
Date: Sun, 14 May 2017 00:01:14 +0300
Message-ID: <20170513210114.31680-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The commands stream is prepended by the jobs class on the CDMA submission,
so that explicitly setting a module class in the commands stream isn't
necessary. The firewall initializes its class to 0 and the command stream
that doesn't explicitly specify the class effectively bypasses the firewall.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 5f5f8ee6143d..d9933828fe87 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -504,7 +504,7 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
 	fw.dev = dev;
 	fw.reloc = job->relocarray;
 	fw.num_relocs = job->num_relocs;
-	fw.class = 0;
+	fw.class = job->class;
 
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
-- 
2.12.2
