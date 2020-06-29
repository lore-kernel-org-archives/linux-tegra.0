From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/6] gpu: host1x: Optimize BOs usage when firewall is enabled
Date: Mon, 29 Jun 2020 06:18:39 +0300
Message-ID: <20200629031842.32463-4-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200629031842.32463-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

We don't need to hold and pin original BOs of the gathers in a case of
enabled firewall because in this case gather's content is copied and the
copy is used by the executed job.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a10643aa89aa..a954bd41aa79 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -27,10 +27,13 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 				    u32 num_cmdbufs, u32 num_relocs)
 {
 	struct host1x_job *job = NULL;
-	unsigned int num_unpins = num_cmdbufs + num_relocs;
+	unsigned int num_unpins = num_relocs;
 	u64 total;
 	void *mem;
 
+	if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		num_unpins += num_cmdbufs;
+
 	/* Check that we're not going to overflow */
 	total = sizeof(struct host1x_job) +
 		(u64)num_relocs * sizeof(struct host1x_reloc) +
@@ -183,6 +186,13 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		job->num_unpins++;
 	}
 
+	/*
+	 * We will copy gathers BO content later, so there is no need to
+	 * hold and pin them.
+	 */
+	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		return 0;
+
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
 		size_t gather_size = 0;
@@ -216,7 +226,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
+		if (host->domain) {
 			for_each_sg(sgt->sgl, sg, sgt->nents, j)
 				gather_size += sg->length;
 			gather_size = iova_align(&host->iova, gather_size);
-- 
2.26.0
