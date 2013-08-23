From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 1/2] gpu: host1x: fix an integer overflow check
Date: Fri, 23 Aug 2013 13:18:25 +0300
Message-ID: <20130823101825.GA1765@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra is a 32 bit arch.  On 32 bit systems then size_t is 32 bits so
"total" will never be higher than UINT_MAX because of integer overflows.
We need cast to u64 first before doing the math.

Also the addition earlier:

        unsigned int num_unpins = num_cmdbufs + num_relocs;

That can overflow as well, but I think it's still safe because we check
both "num_cmdbufs" and "num_relocs" again in this test.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is something I spotted in code review.  I can't actually compile
this code.  I assume this overflow test has security implications.

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index cc80766..18a47f9 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -42,12 +42,12 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 
 	/* Check that we're not going to overflow */
 	total = sizeof(struct host1x_job) +
-		num_relocs * sizeof(struct host1x_reloc) +
-		num_unpins * sizeof(struct host1x_job_unpin_data) +
-		num_waitchks * sizeof(struct host1x_waitchk) +
-		num_cmdbufs * sizeof(struct host1x_job_gather) +
-		num_unpins * sizeof(dma_addr_t) +
-		num_unpins * sizeof(u32 *);
+		(u64)num_relocs * sizeof(struct host1x_reloc) +
+		(u64)num_unpins * sizeof(struct host1x_job_unpin_data) +
+		(u64)num_waitchks * sizeof(struct host1x_waitchk) +
+		(u64)num_cmdbufs * sizeof(struct host1x_job_gather) +
+		(u64)num_unpins * sizeof(dma_addr_t) +
+		(u64)num_unpins * sizeof(u32 *);
 	if (total > ULONG_MAX)
 		return NULL;
 
