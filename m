From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/7] gpu: host1x: Add IOMMU support
Date: Wed, 14 Dec 2016 13:16:14 +0200
Message-ID: <20161214111617.24548-5-mperttunen@nvidia.com>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214111617.24548-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the Host1x unit to be located behind
an IOMMU. This is required when gather buffers may be
allocated non-contiguously in physical memory, as can
be the case when TegraDRM is also using the IOMMU.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/cdma.c       | 74 ++++++++++++++++++++++++++++++++---------
 drivers/gpu/host1x/cdma.h       |  6 ++--
 drivers/gpu/host1x/dev.c        | 40 ++++++++++++++++++++--
 drivers/gpu/host1x/dev.h        |  6 ++++
 drivers/gpu/host1x/hw/cdma_hw.c | 16 ++++-----
 drivers/gpu/host1x/job.c        | 72 +++++++++++++++++++++++++++++++++------
 drivers/gpu/host1x/job.h        |  1 +
 7 files changed, 176 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index c5d82a8..28541b2 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -51,9 +51,15 @@ static void host1x_pushbuffer_destroy(struct push_buffer *pb)
 	struct host1x_cdma *cdma = pb_to_cdma(pb);
 	struct host1x *host1x = cdma_to_host1x(cdma);
 
-	if (pb->phys != 0)
-		dma_free_wc(host1x->dev, pb->size_bytes + 4, pb->mapped,
-			    pb->phys);
+	if (!pb->phys)
+		return;
+
+	if (host1x->domain) {
+		iommu_unmap(host1x->domain, pb->dma, pb->alloc_size);
+		free_iova(&host1x->iova, iova_pfn(&host1x->iova, pb->dma));
+	}
+
+	dma_free_wc(host1x->dev, pb->alloc_size, pb->mapped, pb->phys);
 
 	pb->mapped = NULL;
 	pb->phys = 0;
@@ -66,28 +72,64 @@ static int host1x_pushbuffer_init(struct push_buffer *pb)
 {
 	struct host1x_cdma *cdma = pb_to_cdma(pb);
 	struct host1x *host1x = cdma_to_host1x(cdma);
+	struct iova *alloc;
+	u32 size;
+	int err;
 
 	pb->mapped = NULL;
 	pb->phys = 0;
-	pb->size_bytes = HOST1X_PUSHBUFFER_SLOTS * 8;
+	pb->size = HOST1X_PUSHBUFFER_SLOTS * 8;
+
+	size = pb->size + 4;
 
 	/* initialize buffer pointers */
-	pb->fence = pb->size_bytes - 8;
+	pb->fence = pb->size - 8;
 	pb->pos = 0;
 
-	/* allocate and map pushbuffer memory */
-	pb->mapped = dma_alloc_wc(host1x->dev, pb->size_bytes + 4, &pb->phys,
-				  GFP_KERNEL);
-	if (!pb->mapped)
-		goto fail;
+	if (host1x->domain) {
+		unsigned long shift;
+
+		size = iova_align(&host1x->iova, size);
+
+		pb->mapped = dma_alloc_wc(host1x->dev, size, &pb->phys,
+					  GFP_KERNEL);
+		if (!pb->mapped)
+			return -ENOMEM;
+
+		shift = iova_shift(&host1x->iova);
+		alloc = alloc_iova(&host1x->iova, size >> shift,
+				   host1x->iova_end >> shift, true);
+		if (!alloc) {
+			err = -ENOMEM;
+			goto iommu_free_mem;
+		}
+
+		pb->dma = iova_dma_addr(&host1x->iova, alloc);
+		err = iommu_map(host1x->domain, pb->dma, pb->phys, size,
+				IOMMU_READ);
+		if (err)
+			goto iommu_free_iova;
+	} else {
+		pb->mapped = dma_alloc_wc(host1x->dev, size, &pb->phys,
+					  GFP_KERNEL);
+		if (!pb->mapped)
+			return -ENOMEM;
+
+		pb->dma = pb->phys;
+	}
+
+	pb->alloc_size = size;
 
 	host1x_hw_pushbuffer_init(host1x, pb);
 
 	return 0;
 
-fail:
-	host1x_pushbuffer_destroy(pb);
-	return -ENOMEM;
+iommu_free_iova:
+	__free_iova(&host1x->iova, alloc);
+iommu_free_mem:
+	dma_free_wc(host1x->dev, pb->alloc_size, pb->mapped, pb->phys);
+
+	return err;
 }
 
 /*
@@ -101,7 +143,7 @@ static void host1x_pushbuffer_push(struct push_buffer *pb, u32 op1, u32 op2)
 	WARN_ON(pb->pos == pb->fence);
 	*(p++) = op1;
 	*(p++) = op2;
-	pb->pos = (pb->pos + 8) & (pb->size_bytes - 1);
+	pb->pos = (pb->pos + 8) & (pb->size - 1);
 }
 
 /*
@@ -111,7 +153,7 @@ static void host1x_pushbuffer_push(struct push_buffer *pb, u32 op1, u32 op2)
 static void host1x_pushbuffer_pop(struct push_buffer *pb, unsigned int slots)
 {
 	/* Advance the next write position */
-	pb->fence = (pb->fence + slots * 8) & (pb->size_bytes - 1);
+	pb->fence = (pb->fence + slots * 8) & (pb->size - 1);
 }
 
 /*
@@ -119,7 +161,7 @@ static void host1x_pushbuffer_pop(struct push_buffer *pb, unsigned int slots)
  */
 static u32 host1x_pushbuffer_space(struct push_buffer *pb)
 {
-	return ((pb->fence - pb->pos) & (pb->size_bytes - 1)) / 8;
+	return ((pb->fence - pb->pos) & (pb->size - 1)) / 8;
 }
 
 /*
diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
index 470087a..ec170a7 100644
--- a/drivers/gpu/host1x/cdma.h
+++ b/drivers/gpu/host1x/cdma.h
@@ -43,10 +43,12 @@ struct host1x_job;
 
 struct push_buffer {
 	void *mapped;			/* mapped pushbuffer memory */
-	dma_addr_t phys;		/* physical address of pushbuffer */
+	dma_addr_t dma;			/* device address of pushbuffer */
+	phys_addr_t phys;		/* physical address of pushbuffer */
 	u32 fence;			/* index we've written */
 	u32 pos;			/* index to write to */
-	u32 size_bytes;
+	u32 size;
+	u32 alloc_size;
 };
 
 struct buffer_timeout {
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index a62317a..a8234bb 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -168,16 +168,37 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (iommu_present(&platform_bus_type)) {
+		struct iommu_domain_geometry *geometry;
+		unsigned long order;
+
+		host->domain = iommu_domain_alloc(&platform_bus_type);
+		if (!host->domain)
+			return -ENOMEM;
+
+		err = iommu_attach_device(host->domain, &pdev->dev);
+		if (err)
+			goto fail_free_domain;
+
+		geometry = &host->domain->geometry;
+
+		order = __ffs(host->domain->pgsize_bitmap);
+		init_iova_domain(&host->iova, 1UL << order,
+				 geometry->aperture_start >> order,
+				 geometry->aperture_end >> order);
+		host->iova_end = geometry->aperture_end;
+	}
+
 	err = host1x_channel_list_init(host);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize channel list\n");
-		return err;
+		goto fail_detach_device;
 	}
 
 	err = clk_prepare_enable(host->clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable clock\n");
-		return err;
+		goto fail_detach_device;
 	}
 
 	err = host1x_syncpt_init(host);
@@ -206,6 +227,15 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_syncpt_deinit(host);
 fail_unprepare_disable:
 	clk_disable_unprepare(host->clk);
+fail_detach_device:
+	if (host->domain) {
+		put_iova_domain(&host->iova);
+		iommu_detach_device(host->domain, &pdev->dev);
+	}
+fail_free_domain:
+	if (host->domain)
+		iommu_domain_free(host->domain);
+
 	return err;
 }
 
@@ -218,6 +248,12 @@ static int host1x_remove(struct platform_device *pdev)
 	host1x_syncpt_deinit(host);
 	clk_disable_unprepare(host->clk);
 
+	if (host->domain) {
+		put_iova_domain(&host->iova);
+		iommu_detach_device(host->domain, &pdev->dev);
+		iommu_domain_free(host->domain);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 5220510..d81eb92 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -19,6 +19,8 @@
 
 #include <linux/platform_device.h>
 #include <linux/device.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
 
 #include "channel.h"
 #include "syncpt.h"
@@ -108,6 +110,10 @@ struct host1x {
 	struct device *dev;
 	struct clk *clk;
 
+	struct iommu_domain *domain;
+	struct iova_domain iova;
+	dma_addr_t iova_end;
+
 	struct mutex intr_mutex;
 	int intr_syncpt_irq;
 
diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
index 659c1bb..6b23111 100644
--- a/drivers/gpu/host1x/hw/cdma_hw.c
+++ b/drivers/gpu/host1x/hw/cdma_hw.c
@@ -30,7 +30,7 @@
  */
 static void push_buffer_init(struct push_buffer *pb)
 {
-	*(u32 *)(pb->mapped + pb->size_bytes) = host1x_opcode_restart(0);
+	*(u32 *)(pb->mapped + pb->size) = host1x_opcode_restart(0);
 }
 
 /*
@@ -55,8 +55,8 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *cdma, u32 getptr,
 		*(p++) = HOST1X_OPCODE_NOP;
 		*(p++) = HOST1X_OPCODE_NOP;
 		dev_dbg(host1x->dev, "%s: NOP at %pad+%#x\n", __func__,
-			&pb->phys, getptr);
-		getptr = (getptr + 8) & (pb->size_bytes - 1);
+			&pb->dma, getptr);
+		getptr = (getptr + 8) & (pb->size - 1);
 	}
 
 	wmb();
@@ -78,10 +78,9 @@ static void cdma_start(struct host1x_cdma *cdma)
 			 HOST1X_CHANNEL_DMACTRL);
 
 	/* set base, put and end pointer */
-	host1x_ch_writel(ch, cdma->push_buffer.phys, HOST1X_CHANNEL_DMASTART);
+	host1x_ch_writel(ch, cdma->push_buffer.dma, HOST1X_CHANNEL_DMASTART);
 	host1x_ch_writel(ch, cdma->push_buffer.pos, HOST1X_CHANNEL_DMAPUT);
-	host1x_ch_writel(ch, cdma->push_buffer.phys +
-			 cdma->push_buffer.size_bytes + 4,
+	host1x_ch_writel(ch, cdma->push_buffer.dma + cdma->push_buffer.size + 4,
 			 HOST1X_CHANNEL_DMAEND);
 
 	/* reset GET */
@@ -115,9 +114,8 @@ static void cdma_timeout_restart(struct host1x_cdma *cdma, u32 getptr)
 			 HOST1X_CHANNEL_DMACTRL);
 
 	/* set base, end pointer (all of memory) */
-	host1x_ch_writel(ch, cdma->push_buffer.phys, HOST1X_CHANNEL_DMASTART);
-	host1x_ch_writel(ch, cdma->push_buffer.phys +
-			 cdma->push_buffer.size_bytes,
+	host1x_ch_writel(ch, cdma->push_buffer.dma, HOST1X_CHANNEL_DMASTART);
+	host1x_ch_writel(ch, cdma->push_buffer.dma + cdma->push_buffer.size,
 			 HOST1X_CHANNEL_DMAEND);
 
 	/* set GET, by loading the value in PUT (then reset GET) */
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a91b7c4..5434be9 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -174,9 +174,10 @@ static int do_waitchks(struct host1x_job *job, struct host1x *host,
 	return 0;
 }
 
-static unsigned int pin_job(struct host1x_job *job)
+static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
 	unsigned int i;
+	int err;
 
 	job->num_unpins = 0;
 
@@ -186,12 +187,16 @@ static unsigned int pin_job(struct host1x_job *job)
 		dma_addr_t phys_addr;
 
 		reloc->target.bo = host1x_bo_get(reloc->target.bo);
-		if (!reloc->target.bo)
+		if (!reloc->target.bo) {
+			err = -EINVAL;
 			goto unpin;
+		}
 
 		phys_addr = host1x_bo_pin(reloc->target.bo, &sgt);
-		if (!phys_addr)
+		if (!phys_addr) {
+			err = -EINVAL;
 			goto unpin;
+		}
 
 		job->addr_phys[job->num_unpins] = phys_addr;
 		job->unpins[job->num_unpins].bo = reloc->target.bo;
@@ -201,28 +206,67 @@ static unsigned int pin_job(struct host1x_job *job)
 
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
+		size_t gather_size = 0;
+		struct scatterlist *sg;
 		struct sg_table *sgt;
 		dma_addr_t phys_addr;
+		unsigned long shift;
+		struct iova *alloc;
+		unsigned int j;
 
 		g->bo = host1x_bo_get(g->bo);
-		if (!g->bo)
+		if (!g->bo) {
+			err = -EINVAL;
 			goto unpin;
+		}
 
 		phys_addr = host1x_bo_pin(g->bo, &sgt);
-		if (!phys_addr)
+		if (!phys_addr) {
+			err = -EINVAL;
 			goto unpin;
+		}
+
+		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
+			for_each_sg(sgt->sgl, sg, sgt->nents, j)
+				gather_size += sg->length;
+			gather_size = iova_align(&host->iova, gather_size);
+
+			shift = iova_shift(&host->iova);
+			alloc = alloc_iova(&host->iova, gather_size >> shift,
+					   host->iova_end >> shift, true);
+			if (!alloc) {
+				err = -ENOMEM;
+				goto unpin;
+			}
+
+			err = iommu_map_sg(host->domain,
+					iova_dma_addr(&host->iova, alloc),
+					sgt->sgl, sgt->nents, IOMMU_READ);
+			if (err == 0) {
+				__free_iova(&host->iova, alloc);
+				err = -EINVAL;
+				goto unpin;
+			}
+
+			job->addr_phys[job->num_unpins] =
+				iova_dma_addr(&host->iova, alloc);
+			job->unpins[job->num_unpins].size = gather_size;
+		} else {
+			job->addr_phys[job->num_unpins] = phys_addr;
+		}
+
+		job->gather_addr_phys[i] = job->addr_phys[job->num_unpins];
 
-		job->addr_phys[job->num_unpins] = phys_addr;
 		job->unpins[job->num_unpins].bo = g->bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
 	}
 
-	return job->num_unpins;
+	return 0;
 
 unpin:
 	host1x_job_unpin(job);
-	return 0;
+	return err;
 }
 
 static int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
@@ -525,8 +569,8 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		host1x_syncpt_load(host->syncpt + i);
 
 	/* pin memory */
-	err = pin_job(job);
-	if (!err)
+	err = pin_job(host, job);
+	if (err)
 		goto out;
 
 	/* patch gathers */
@@ -569,11 +613,19 @@ EXPORT_SYMBOL(host1x_job_pin);
 
 void host1x_job_unpin(struct host1x_job *job)
 {
+	struct host1x *host = dev_get_drvdata(job->channel->dev->parent);
 	unsigned int i;
 
 	for (i = 0; i < job->num_unpins; i++) {
 		struct host1x_job_unpin_data *unpin = &job->unpins[i];
 
+		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
+			iommu_unmap(host->domain, job->addr_phys[i],
+				    unpin->size);
+			free_iova(&host->iova,
+				iova_pfn(&host->iova, job->addr_phys[i]));
+		}
+
 		host1x_bo_unpin(unpin->bo, unpin->sgt);
 		host1x_bo_put(unpin->bo);
 	}
diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index 8b3c15d..878239c4 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -44,6 +44,7 @@ struct host1x_waitchk {
 struct host1x_job_unpin_data {
 	struct host1x_bo *bo;
 	struct sg_table *sgt;
+	size_t size;
 };
 
 /*
-- 
2.10.2
