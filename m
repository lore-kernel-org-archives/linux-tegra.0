From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 18/22] gpu: host1x: Check waits in the firewall
Date: Wed, 14 Jun 2017 02:15:57 +0300
Message-ID: <bd57829e74c6554c46ab761d013e6d9d3c39b693.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Check waits in the firewall in a way it is done for relocations.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 32d3300bcf99..fc194c676d91 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -31,6 +31,8 @@
 #include "job.h"
 #include "syncpt.h"
 
+#define HOST1X_WAIT_SYNCPT_OFFSET 0x8
+
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 				    u32 num_cmdbufs, u32 num_relocs,
 				    u32 num_waitchks)
@@ -354,6 +356,17 @@ static bool check_reloc_shift(struct device *dev, struct host1x_reloc *reloc)
 	return true;
 }
 
+static bool check_wait(struct host1x_waitchk *wait, struct host1x_bo *cmdbuf,
+		       unsigned int offset)
+{
+	offset *= sizeof(u32);
+
+	if (wait->bo != cmdbuf || wait->offset != offset)
+		return false;
+
+	return true;
+}
+
 struct host1x_firewall {
 	struct host1x_job *job;
 	struct device *dev;
@@ -361,6 +374,9 @@ struct host1x_firewall {
 	unsigned int num_relocs;
 	struct host1x_reloc *reloc;
 
+	unsigned int num_waitchks;
+	struct host1x_waitchk *waitchk;
+
 	struct host1x_bo *cmdbuf;
 	unsigned int offset;
 
@@ -390,6 +406,20 @@ static int check_register(struct host1x_firewall *fw, unsigned long offset)
 		fw->reloc++;
 	}
 
+	if (offset == HOST1X_WAIT_SYNCPT_OFFSET) {
+		if (fw->class != HOST1X_CLASS_HOST1X)
+			return -EINVAL;
+
+		if (!fw->num_waitchks)
+			return -EINVAL;
+
+		if (!check_wait(fw->waitchk, fw->cmdbuf, fw->offset))
+			return -EINVAL;
+
+		fw->num_waitchks--;
+		fw->waitchk++;
+	}
+
 	return 0;
 }
 
@@ -554,6 +584,8 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
 	fw.dev = dev;
 	fw.reloc = job->relocarray;
 	fw.num_relocs = job->num_relocs;
+	fw.waitchk = job->waitchk;
+	fw.num_waitchks = job->num_waitchk;
 	fw.class = job->class;
 
 	for (i = 0; i < job->num_gathers; i++) {
@@ -592,8 +624,8 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
 		offset += g->words * sizeof(u32);
 	}
 
-	/* No relocs should remain at this point */
-	if (fw.num_relocs)
+	/* No relocs and waitchks should remain at this point */
+	if (fw.num_relocs || fw.num_waitchks)
 		return -EINVAL;
 
 	return 0;
-- 
2.13.0
