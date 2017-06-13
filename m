From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 22/22] gpu: host1x: At first try a non-blocking allocation for the gather copy
Date: Wed, 14 Jun 2017 02:16:01 +0300
Message-ID: <036615566011ab4d52190439a12d943df9e704ef.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The blocking gather copy allocation is a major performance downside of the
Host1x firewall, it may take hundreds milliseconds which is unacceptable
for the real-time graphics operations. Let's try a non-blocking allocation
first as a least invasive solution, it makes opentegra (Xorg driver)
performance indistinguishable with/without the firewall.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

The other much more invasive solution could be: to have a memory pool
reserved for the gather copy and performing the firewall checks (and the
gather copying) on the actual job submission to the CDMA, not on the job
allocation like it is done now. This solution reduces the overhead of a
gather copy allocations.

 drivers/gpu/host1x/job.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index fc194c676d91..ed0575f14093 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -594,12 +594,20 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
 		size += g->words * sizeof(u32);
 	}
 
+	/*
+	 * Try a non-blocking allocation from a higher priority pools first,
+	 * as awaiting for the allocation here is a major performance hit.
+	 */
 	job->gather_copy_mapped = dma_alloc_wc(dev, size, &job->gather_copy,
-					       GFP_KERNEL);
-	if (!job->gather_copy_mapped) {
-		job->gather_copy_mapped = NULL;
+					       GFP_NOWAIT);
+
+	/* the higher priority allocation failed, try the generic-blocking */
+	if (!job->gather_copy_mapped)
+		job->gather_copy_mapped = dma_alloc_wc(dev, size,
+						       &job->gather_copy,
+						       GFP_KERNEL);
+	if (!job->gather_copy_mapped)
 		return -ENOMEM;
-	}
 
 	job->gather_copy_size = size;
 
-- 
2.13.0
