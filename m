From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [patch 2/2] gpu: host1x: returning success instead of -ENOMEM
Date: Fri, 23 Aug 2013 13:19:11 +0300
Message-ID: <20130823101911.GA1824@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There is a mistake here so it returns PTR_ERR(NULL) which is success
instead of -ENOMEM.

Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
I can't compile this.

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index cc80766..6cf41da 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -466,9 +466,8 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
 							 &job->gather_copy,
 							 GFP_KERNEL);
 	if (!job->gather_copy_mapped) {
-		int err = PTR_ERR(job->gather_copy_mapped);
 		job->gather_copy_mapped = NULL;
-		return err;
+		return -ENOMEM;
 	}
 
 	job->gather_copy_size = size;
