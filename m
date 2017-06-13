From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 13/22] gpu: host1x: Do not leak BO's phys address to userspace
Date: Wed, 14 Jun 2017 02:15:52 +0300
Message-ID: <6409d5e32a30d9e30e402f4638c0d41a233602e2.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Perform gathers coping before patching them, so that original gathers are
left untouched. That's not as bad as leaking kernel addresses, but still
doesn't feel right.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 14f3f957ffab..4208329ca2af 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -137,8 +137,9 @@ static void host1x_syncpt_patch_offset(struct host1x_syncpt *sp,
  * avoid a wrap condition in the HW).
  */
 static int do_waitchks(struct host1x_job *job, struct host1x *host,
-		       struct host1x_bo *patch)
+		       struct host1x_job_gather *g)
 {
+	struct host1x_bo *patch = g->bo;
 	int i;
 
 	/* compare syncpt vs wait threshold */
@@ -165,7 +166,8 @@ static int do_waitchks(struct host1x_job *job, struct host1x *host,
 				wait->syncpt_id, sp->name, wait->thresh,
 				host1x_syncpt_read_min(sp));
 
-			host1x_syncpt_patch_offset(sp, patch, wait->offset);
+			host1x_syncpt_patch_offset(sp, patch,
+						   g->offset + wait->offset);
 		}
 
 		wait->bo = NULL;
@@ -269,11 +271,12 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	return err;
 }
 
-static int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
+static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
 {
 	int i = 0;
 	u32 last_page = ~0;
 	void *cmdbuf_page_addr = NULL;
+	struct host1x_bo *cmdbuf = g->bo;
 
 	/* pin & patch the relocs for one gather */
 	for (i = 0; i < job->num_relocs; i++) {
@@ -286,6 +289,13 @@ static int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
 		if (cmdbuf != reloc->cmdbuf.bo)
 			continue;
 
+		if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
+			target = (u32 *)job->gather_copy_mapped +
+					reloc->cmdbuf.offset / sizeof(u32) +
+						g->offset / sizeof(u32);
+			goto patch_reloc;
+		}
+
 		if (last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
 			if (cmdbuf_page_addr)
 				host1x_bo_kunmap(cmdbuf, last_page,
@@ -302,6 +312,7 @@ static int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
 		}
 
 		target = cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
+patch_reloc:
 		*target = reloc_addr;
 	}
 
@@ -573,6 +584,12 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 	if (err)
 		goto out;
 
+	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
+		err = copy_gathers(job, dev);
+		if (err)
+			goto out;
+	}
+
 	/* patch gathers */
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
@@ -581,7 +598,9 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		if (g->handled)
 			continue;
 
-		g->base = job->gather_addr_phys[i];
+		/* copy_gathers() sets gathers base if firewall is enabled */
+		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+			g->base = job->gather_addr_phys[i];
 
 		for (j = i + 1; j < job->num_gathers; j++) {
 			if (job->gathers[j].bo == g->bo) {
@@ -590,19 +609,15 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 			}
 		}
 
-		err = do_relocs(job, g->bo);
+		err = do_relocs(job, g);
 		if (err)
-			goto out;
+			break;
 
-		err = do_waitchks(job, host, g->bo);
+		err = do_waitchks(job, host, g);
 		if (err)
-			goto out;
+			break;
 	}
 
-	if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
-		goto out;
-
-	err = copy_gathers(job, dev);
 out:
 	if (err)
 		host1x_job_unpin(job);
-- 
2.13.0
