From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 17/20] gpu: host1x: Remove unused 'struct host1x_cmdbuf'
Date: Thu, 15 Jun 2017 02:18:40 +0300
Message-ID: <6049d63dc68b8b3b915477ad510e6a86694fd5a0.1497480758.git.digetx@gmail.com>
References: <cover.1497480751.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The struct host1x_cmdbuf is unused, let's remove it.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index 0debd93a1849..4bda51d503ec 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -27,13 +27,6 @@ struct host1x_job_gather {
 	bool handled;
 };
 
-struct host1x_cmdbuf {
-	u32 handle;
-	u32 offset;
-	u32 words;
-	u32 pad;
-};
-
 struct host1x_job_unpin_data {
 	struct host1x_bo *bo;
 	struct sg_table *sgt;
-- 
2.13.0
