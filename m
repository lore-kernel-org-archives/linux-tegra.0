From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: check relocs after all gathers are consumed
Date: Fri,  4 Oct 2013 20:18:33 +0000
Message-ID: <1380917913-20482-1-git-send-email-kusmabite@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The num_relocs count are passed to the kernel per job, not per gather.

For multi-gather jobs, we would previously fail if there were relocs in
other gathers aside from the first one.

Fix this by simply moving the check until all gathers have been
consumed.

Signed-off-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/job.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index c4e1050..c9ddff8 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -436,10 +436,6 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
 		}
 	}
 
-	/* No relocs should remain at this point */
-	if (fw->num_relocs)
-		err = -EINVAL;
-
 out:
 	return err;
 }
@@ -493,6 +489,10 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
 		offset += g->words * sizeof(u32);
 	}
 
+	/* No relocs should remain at this point */
+	if (fw.num_relocs)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
1.7.9.5
