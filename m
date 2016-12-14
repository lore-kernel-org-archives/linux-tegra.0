From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 5/8] gpu: host1x: Add IOMMU support
Date: Wed, 14 Dec 2016 10:50:56 +0200
Message-ID: <434c56cd-a807-bf76-4a27-8188f442f95b@kapsi.fi>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161110182345.31777-6-mperttunen@nvidia.com>
 <20161205194924.GE22918@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205194924.GE22918-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.12.2016 21:49, Thierry Reding wrote:
> On Thu, Nov 10, 2016 at 08:23:42PM +0200, Mikko Perttunen wrote:
>> Add support for the Host1x unit to be located behind
>> an IOMMU. This is required when gather buffers may be
>> allocated non-contiguously in physical memory, as can
>> be the case when TegraDRM is also using the IOMMU.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/host1x/cdma.c       | 65 +++++++++++++++++++++++++++++------
>>  drivers/gpu/host1x/cdma.h       |  4 ++-
>>  drivers/gpu/host1x/dev.c        | 39 +++++++++++++++++++--
>>  drivers/gpu/host1x/dev.h        |  5 +++
>>  drivers/gpu/host1x/hw/cdma_hw.c | 10 +++---
>>  drivers/gpu/host1x/job.c        | 76 +++++++++++++++++++++++++++++++++++------
>>  drivers/gpu/host1x/job.h        |  1 +
>>  7 files changed, 171 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
>> index c5d82a8..14692446e 100644
>> --- a/drivers/gpu/host1x/cdma.c
>> +++ b/drivers/gpu/host1x/cdma.c
>> @@ -51,9 +51,15 @@ static void host1x_pushbuffer_destroy(struct push_buffer *pb)
>>  	struct host1x_cdma *cdma = pb_to_cdma(pb);
>>  	struct host1x *host1x = cdma_to_host1x(cdma);
>>
>> -	if (pb->phys != 0)
>> -		dma_free_wc(host1x->dev, pb->size_bytes + 4, pb->mapped,
>> -			    pb->phys);
>> +	if (!pb->phys)
>> +		return;
>> +
>> +	if (host1x->domain) {
>> +		iommu_unmap(host1x->domain, pb->dma, pb->alloc_size_bytes);
>> +		free_iova(&host1x->iova, iova_pfn(&host1x->iova, pb->dma));
>> +	}
>> +
>> +	dma_free_wc(host1x->dev, pb->alloc_size_bytes, pb->mapped, pb->phys);
>>
>>  	pb->mapped = NULL;
>>  	pb->phys = 0;
>> @@ -66,28 +72,65 @@ static int host1x_pushbuffer_init(struct push_buffer *pb)
>>  {
>>  	struct host1x_cdma *cdma = pb_to_cdma(pb);
>>  	struct host1x *host1x = cdma_to_host1x(cdma);
>> +	struct iova *alloc;
>> +	int err;
>>
>>  	pb->mapped = NULL;
>>  	pb->phys = 0;
>>  	pb->size_bytes = HOST1X_PUSHBUFFER_SLOTS * 8;
>> +	pb->alloc_size_bytes = pb->size_bytes + 4;
>>
>>  	/* initialize buffer pointers */
>>  	pb->fence = pb->size_bytes - 8;
>>  	pb->pos = 0;
>>
>> -	/* allocate and map pushbuffer memory */
>> -	pb->mapped = dma_alloc_wc(host1x->dev, pb->size_bytes + 4, &pb->phys,
>> -				  GFP_KERNEL);
>> -	if (!pb->mapped)
>> -		goto fail;
>> +	if (host1x->domain) {
>> +		unsigned long shift;
>> +
>> +		pb->alloc_size_bytes = iova_align(&host1x->iova,
>> +						  pb->alloc_size_bytes);
>> +
>> +		pb->mapped = dma_alloc_wc(host1x->dev, pb->alloc_size_bytes,
>> +					  &pb->phys, GFP_KERNEL);
>> +		if (!pb->mapped)
>> +			return -ENOMEM;
>> +
>> +		shift = iova_shift(&host1x->iova);
>> +		alloc = alloc_iova(
>> +			&host1x->iova, pb->alloc_size_bytes >> shift,
>> +			host1x->domain->geometry.aperture_end >> shift, true);
>
> Let's precompute some of these values to make this expression more
> compact. For example pb->alloc_size_bytes is used a couple of times, so
> it could be stored temporarily in a local variable with a nice and short
> name such as "size".
>
> If you store the aperture end, or limit_pfn, as I commented in an
> earlier patch, then this also becomes much more compact.

Made a local "size" variable and stored the aperture end and did some 
other cleanup as well.

>
>> +		if (!alloc) {
>> +			err = -ENOMEM;
>> +			goto iommu_free_mem;
>> +		}
>> +
>> +		err = iommu_map(host1x->domain,
>> +				iova_dma_addr(&host1x->iova, alloc),
>> +				pb->phys, pb->alloc_size_bytes,
>> +				IOMMU_READ);
>
> Same here.

Cleaned up.

>
>> +		if (err)
>> +			goto iommu_free_iova;
>> +
>> +		pb->dma = iova_dma_addr(&host1x->iova, alloc);
>> +	} else {
>> +		pb->mapped = dma_alloc_wc(host1x->dev, pb->alloc_size_bytes,
>> +					  &pb->phys, GFP_KERNEL);
>> +		if (!pb->mapped)
>> +			return -ENOMEM;
>> +
>> +		pb->dma = pb->phys;
>> +	}
>>
>>  	host1x_hw_pushbuffer_init(host1x, pb);
>>
>>  	return 0;
>>
>> -fail:
>> -	host1x_pushbuffer_destroy(pb);
>> -	return -ENOMEM;
>> +iommu_free_iova:
>> +	__free_iova(&host1x->iova, alloc);
>> +iommu_free_mem:
>> +	dma_free_wc(host1x->dev, pb->alloc_size_bytes, pb->mapped, pb->phys);
>> +
>> +	return err;
>>  }
>>
>>  /*
>> diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
>> index 470087a..4b3645f 100644
>> --- a/drivers/gpu/host1x/cdma.h
>> +++ b/drivers/gpu/host1x/cdma.h
>> @@ -43,10 +43,12 @@ struct host1x_job;
>>
>>  struct push_buffer {
>>  	void *mapped;			/* mapped pushbuffer memory */
>> -	dma_addr_t phys;		/* physical address of pushbuffer */
>> +	dma_addr_t dma;			/* device address of pushbuffer */
>> +	phys_addr_t phys;		/* physical address of pushbuffer */
>>  	u32 fence;			/* index we've written */
>>  	u32 pos;			/* index to write to */
>>  	u32 size_bytes;
>> +	u32 alloc_size_bytes;
>
> Maybe just "alloc_size"?

Renamed. Also renamed size_bytes to size for consistency.

>
>>  };
>>
>>  struct buffer_timeout {
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index a62317a..ca4527e 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -168,16 +168,36 @@ static int host1x_probe(struct platform_device *pdev)
>>  		return err;
>>  	}
>>
>> +	if (iommu_present(&platform_bus_type)) {
>> +		struct iommu_domain_geometry *geometry;
>> +		unsigned long order;
>> +
>> +		host->domain = iommu_domain_alloc(&platform_bus_type);
>> +		if (!host->domain)
>> +			return -ENOMEM;
>> +
>> +		err = iommu_attach_device(host->domain, &pdev->dev);
>> +		if (err)
>> +			goto fail_free_domain;
>> +
>> +		geometry = &host->domain->geometry;
>> +
>> +		order = __ffs(host->domain->pgsize_bitmap);
>> +		init_iova_domain(&host->iova, 1UL << order,
>> +				 geometry->aperture_start >> order,
>> +				 geometry->aperture_end >> order);
>> +	}
>> +
>>  	err = host1x_channel_list_init(host);
>>  	if (err) {
>>  		dev_err(&pdev->dev, "failed to initialize channel list\n");
>> -		return err;
>> +		goto fail_detach_device;
>>  	}
>>
>>  	err = clk_prepare_enable(host->clk);
>>  	if (err < 0) {
>>  		dev_err(&pdev->dev, "failed to enable clock\n");
>> -		return err;
>> +		goto fail_detach_device;
>>  	}
>>
>>  	err = host1x_syncpt_init(host);
>> @@ -206,6 +226,15 @@ static int host1x_probe(struct platform_device *pdev)
>>  	host1x_syncpt_deinit(host);
>>  fail_unprepare_disable:
>>  	clk_disable_unprepare(host->clk);
>> +fail_detach_device:
>> +	if (host->domain) {
>> +		put_iova_domain(&host->iova);
>> +		iommu_detach_device(host->domain, &pdev->dev);
>> +	}
>> +fail_free_domain:
>> +	if (host->domain)
>> +		iommu_domain_free(host->domain);
>> +
>>  	return err;
>>  }
>>
>> @@ -218,6 +247,12 @@ static int host1x_remove(struct platform_device *pdev)
>>  	host1x_syncpt_deinit(host);
>>  	clk_disable_unprepare(host->clk);
>>
>> +	if (host->domain) {
>> +		put_iova_domain(&host->iova);
>> +		iommu_detach_device(host->domain, &pdev->dev);
>> +		iommu_domain_free(host->domain);
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
>> index 5220510..6189825 100644
>> --- a/drivers/gpu/host1x/dev.h
>> +++ b/drivers/gpu/host1x/dev.h
>> @@ -19,6 +19,8 @@
>>
>>  #include <linux/platform_device.h>
>>  #include <linux/device.h>
>> +#include <linux/iommu.h>
>> +#include <linux/iova.h>
>>
>>  #include "channel.h"
>>  #include "syncpt.h"
>> @@ -108,6 +110,9 @@ struct host1x {
>>  	struct device *dev;
>>  	struct clk *clk;
>>
>> +	struct iommu_domain *domain;
>> +	struct iova_domain iova;
>> +
>>  	struct mutex intr_mutex;
>>  	int intr_syncpt_irq;
>>
>> diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
>> index 659c1bb..b8c0348 100644
>> --- a/drivers/gpu/host1x/hw/cdma_hw.c
>> +++ b/drivers/gpu/host1x/hw/cdma_hw.c
>> @@ -55,7 +55,7 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *cdma, u32 getptr,
>>  		*(p++) = HOST1X_OPCODE_NOP;
>>  		*(p++) = HOST1X_OPCODE_NOP;
>>  		dev_dbg(host1x->dev, "%s: NOP at %pad+%#x\n", __func__,
>> -			&pb->phys, getptr);
>> +			&pb->dma, getptr);
>>  		getptr = (getptr + 8) & (pb->size_bytes - 1);
>>  	}
>>
>> @@ -78,9 +78,9 @@ static void cdma_start(struct host1x_cdma *cdma)
>>  			 HOST1X_CHANNEL_DMACTRL);
>>
>>  	/* set base, put and end pointer */
>> -	host1x_ch_writel(ch, cdma->push_buffer.phys, HOST1X_CHANNEL_DMASTART);
>> +	host1x_ch_writel(ch, cdma->push_buffer.dma, HOST1X_CHANNEL_DMASTART);
>>  	host1x_ch_writel(ch, cdma->push_buffer.pos, HOST1X_CHANNEL_DMAPUT);
>> -	host1x_ch_writel(ch, cdma->push_buffer.phys +
>> +	host1x_ch_writel(ch, cdma->push_buffer.dma +
>>  			 cdma->push_buffer.size_bytes + 4,
>>  			 HOST1X_CHANNEL_DMAEND);
>>
>> @@ -115,8 +115,8 @@ static void cdma_timeout_restart(struct host1x_cdma *cdma, u32 getptr)
>>  			 HOST1X_CHANNEL_DMACTRL);
>>
>>  	/* set base, end pointer (all of memory) */
>> -	host1x_ch_writel(ch, cdma->push_buffer.phys, HOST1X_CHANNEL_DMASTART);
>> -	host1x_ch_writel(ch, cdma->push_buffer.phys +
>> +	host1x_ch_writel(ch, cdma->push_buffer.dma, HOST1X_CHANNEL_DMASTART);
>> +	host1x_ch_writel(ch, cdma->push_buffer.dma +
>>  			 cdma->push_buffer.size_bytes,
>>  			 HOST1X_CHANNEL_DMAEND);
>>
>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>> index a91b7c4..222d930 100644
>> --- a/drivers/gpu/host1x/job.c
>> +++ b/drivers/gpu/host1x/job.c
>> @@ -174,8 +174,9 @@ static int do_waitchks(struct host1x_job *job, struct host1x *host,
>>  	return 0;
>>  }
>>
>> -static unsigned int pin_job(struct host1x_job *job)
>> +static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>>  {
>> +	int err;
>>  	unsigned int i;
>
> Maybe use an inverse christmas tree for variables as in other parts of
> this driver? That is, add the new int err belowe the existing unsined
> int i.

Fixed.

>
>>
>>  	job->num_unpins = 0;
>> @@ -186,12 +187,16 @@ static unsigned int pin_job(struct host1x_job *job)
>>  		dma_addr_t phys_addr;
>>
>>  		reloc->target.bo = host1x_bo_get(reloc->target.bo);
>> -		if (!reloc->target.bo)
>> +		if (!reloc->target.bo) {
>> +			err = -EINVAL;
>>  			goto unpin;
>> +		}
>>
>>  		phys_addr = host1x_bo_pin(reloc->target.bo, &sgt);
>> -		if (!phys_addr)
>> +		if (!phys_addr) {
>> +			err = -EINVAL;
>>  			goto unpin;
>> +		}
>>
>>  		job->addr_phys[job->num_unpins] = phys_addr;
>>  		job->unpins[job->num_unpins].bo = reloc->target.bo;
>> @@ -204,25 +209,68 @@ static unsigned int pin_job(struct host1x_job *job)
>>  		struct sg_table *sgt;
>>  		dma_addr_t phys_addr;
>>
>> +		size_t gather_size = 0;
>> +		struct scatterlist *sg;
>> +		struct iova *alloc;
>> +		unsigned long shift;
>> +		int j;
>
> There should be no blank line between blocks of variable declarations.
> Also, make j an unsigned int.

Fixed.

>
>> +
>>  		g->bo = host1x_bo_get(g->bo);
>> -		if (!g->bo)
>> +		if (!g->bo) {
>> +			err = -EINVAL;
>>  			goto unpin;
>> +		}
>>
>>  		phys_addr = host1x_bo_pin(g->bo, &sgt);
>> -		if (!phys_addr)
>> +		if (!phys_addr) {
>> +			err = -EINVAL;
>>  			goto unpin;
>> +		}
>> +
>> +		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
>> +			for_each_sg(sgt->sgl, sg, sgt->nents, j) {
>> +				gather_size += sg->length;
>> +			}
>
> No need for curly brackets here.

Fixed.

>
>> +			gather_size = iova_align(&host->iova, gather_size);
>> +
>> +			shift = iova_shift(&host->iova);
>> +			alloc = alloc_iova(
>> +				&host->iova, gather_size >> shift,
>> +				host->domain->geometry.aperture_end >> shift,
>> +				true);
>
> This could be made a little more compact as well.

Fixed.

>
> Thierry
>

Thanks,
Mikko.
