From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Date: Thu, 30 Jan 2020 07:36:36 +0300
Message-ID: <d69df90f-37c9-0242-708a-689a8789a30b@gmail.com>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
 <20200129123935.GG2479935@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200129123935.GG2479935@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

29.01.2020 15:39, Thierry Reding пишет:
> On Mon, Jan 20, 2020 at 05:53:03AM +0300, Dmitry Osipenko wrote:
>> 13.12.2019 18:35, Dmitry Osipenko пишет:
...
>> Hello Thierry,
>>
>> I took another look at the problem and here what was found:
>>
>> 1) The "Optionally attach clients to the IOMMU" patch is wrong because:
>>
>>     1. host1x_drm_probe() is invoked *before* any of the
>>        host1x_client_iommu_attach() happens, so there is no way
>>        on earth the 'use_explicit_iommu' could ever be true.
> 
> That's not correct. host1x_client_iommu_attach() happens during
> host1x_device_init(), which is called during host1x_drm_probe().

Looks like I previously got confused by accident, my bad.

> The idea is that host1x_drm_probe() sets up the minimum IOMMU so that all
> devices can attach, if they want to. If any of them connect (because
> they aren't already attached via something like the DMA/IOMMU glue)
> then the tegra->use_explicit_iommu is set to true, in which case the
> IOMMU domain setup for explicit IOMMU API usage is completed. If, on
> the other hand, none of the clients have a need for the explicit IOMMU
> domain, there's no need to set it up and host1x_drm_probe() will just
> discard it.

This matches my understanding of what you wanted to achieve, thanks.

>>     2. Not attaching DRM clients to IOMMU if HOST1x isn't
>>        attached is wrong because it never attached in the case
>>        of CONFIG_TEGRA_HOST1X_FIREWALL=y [1] and this also
>>        makes no sense for T20/30 that do not support LPAE.
> 
> It's not at all wrong. Take for example the case of Tegra124 and
> Tegra210 where host1x and its clients can address 34 bits. In those
> cases, allocating individual pages via shmem has a high probability of
> hitting physical addresses beyond the 32-bit range, which means that the
> host1x can not access them unless it is also attached to an IOMMU where
> physical addresses to >= 4 GiB addresses can be translated into < 4 GiB
> virtual addresses. This is a very real problem that I was running into
> when testing on Tegra124 and Tegra210.

Why not to set the DMA mask to 32bits if IOMMU is unavailable?

I'm a bit puzzled by the actual need to support the case where Host1x is
backed by IOMMU and clients not.. How we could ever end up with this
scenario in the upstream kernel?

What about the reverse scenario? You won't be able to patch cmdstream
properly for >32bit addresses.

The root of the problem is that Tegra DRM UAPI doesn't support 64bit
addresses, so you can't use "wide" opcodes and can't patch cmdstream.

Perhaps it is better not to add any new things or quirks to the Host1x /
Tegra DRM for now. The drivers need a serious clean up, otherwise mess
only continues to grow up. Don't you think so?

> But I agree that this shouldn't be necessary on Tegra20 and Tegra30. We
> should be able to remedy the situation on Tegra20 and Tegra30 by adding
> another check, based on the DMA mask. Something like the below should
> work:
> 
> --- >8 ---
[snip]
> --- >8 ---

This works, thanks.

>> [1]
>> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/gpu/host1x/dev.c#L205
>>
>> 2) Because of the above problems, the DRM clients are erroneously not
>> getting attached to IOMMU at all and thus CMA is getting used for the BO
>> allocations. Here comes the problems introduced by the "gpu: host1x:
>> Support DMA mapping of buffers" patch, which makes DMA API to perform
>> CPU cache maintenance on each job submission and apparently this is
>> super bad for performance. This also makes no sense in comparison to the
>> case of enabled IOMMU, where cache maintenance isn't performed at all
>> (like it should be).
> 
> It actually does make a lot of sense. Very strictly speaking we were
> violating the DMA API prior to the above patch because we were not DMA
> mapping the buffers at all. Whenever you pass a buffer to hardware you
> need to map it for the device. At that point, the kernel does not know
> whether or not the buffer is dirty, so it has to perform a cache flush.
> Similarily, when the hardware is done with a buffer, we need to unmap it
> so that the CPU can access it again. This typically requires a cache
> invalidate.
> 
> That things even worked to begin with more by accident than by design.
> 
> So yes, this is different from what we were doing before, but it's
> actually the right thing to do. That said, I'm sure we can find ways to
> optimize this. For example, as part of the DMA API conversion series I
> added the possibility to set direction flags for relocation buffers. In
> cases where it is known that a certain buffer will only be used for
> reading, we should be able to avoid at least the cache invalidate
> operation after a job is done, since the hardware won't have modified
> the contents (when using an SMMU this can even be enforced). It's
> slightly trickier to avoid cache flushes. For buffers that are only
> going to be written, there's no need to flush the cache because the CPUs
> changes can be assumed to be overwritten by the hardware anyway. However
> we still need to make sure that we invalidate the caches in that case to
> ensure subsequent cache flushes don't overwrite data already written by
> hardware.
> 
> One other potential optimization I can imagine is to add flags to make
> cache maintenance optional on buffers when we know it's safe to do so.
> I'm not sure we can always know, so this is going to require further
> thought.

Doesn't sound good to me.. this is not going to be good for GPU drivers.
All cache maintenance should be in control of userspace, the userspace
should be telling kernel driver when it needs to get CPU access and when
to finish the access. DMABUF has generic UAPI for the synchronizations,
although a mature GPU driver may need more than that.

Today Tegra DRM driver supports only write-combined BO allocations, and
thus, we don't need to do more than to flush CPU buffers before
executing HW job.

>> Please let me know if you're going to fix the problems or if you'd
>> prefer me to create the patches.
>>
>> Here is a draft of the fix for #2, it doesn't cover case of imported
>> buffers (which should be statically mapped, IIUC):
>>
>> @@ -38,7 +38,7 @@ static struct sg_table *tegra_bo_pin(struct device
>> *dev, struct host1x_bo *bo,
>>          * If we've manually mapped the buffer object through the IOMMU,
>> make
>>          * sure to return the IOVA address of our mapping.
>>          */
>> -       if (phys && obj->mm) {
>> +       if (phys && (obj->mm || obj->vaddr)) {
>>                 *phys = obj->iova;
> 
> This doesn't work for the case where we use the DMA API for mapping. Or
> at least it isn't going to work in the general case.

Right, looks like I'll need to update my memory about the DMA API usage.

> The reason is because obj->iova is only valid for whatever the device was that mapped
> or allocated the buffer, which in this case is the host1x device, which
> isn't even a real device, so it won't work. The only case where it does
> work is if we're not behind an IOMMU, so obj->iova will actually be the
> physical address.

But why do you need to dynamically map/unmap the statically-allocated
buffers on each job submission, could you please explain what is the
point? Perhaps it's a temporary workaround just to get a minimum of
things working for the case of implicit IOMMU?

All buffers should be statically allocated and statically mapped, and
when there is a need to sync an already mapped buffer, the dma_sync_*
API should be used.

Like I said above, the syncing should be done by userspace for the
buffers that are in control of userspace.

> So what this basically ends up doing is avoid dma_map_*() all the time,
> which I guess is what you're trying to achieve. But it also gives you
> the wrong I/O virtual address in any case where an IOMMU is involved.
> Also, as discussed above, avoiding cache maintenance isn't correct.

Alright, then right now we need to bypass the dma_map_*() in a case of a
non-implicit IOMMU, in order to bring back the good old behavior (at
least temporary, until there will be a more comprehensive solution).

What do you think about this variant:

--- >8 ---
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 1237df157e05..555a6424e9fa 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -54,16 +54,25 @@ static struct sg_table *tegra_bo_pin(struct device
*dev, struct host1x_bo *bo,
 				     dma_addr_t *phys)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
+	struct tegra_drm *tegra = obj->gem.dev->dev_private;
 	struct sg_table *sgt;
 	int err;

-	/*
-	 * If we've manually mapped the buffer object through the IOMMU, make
-	 * sure to return the IOVA address of our mapping.
-	 */
-	if (phys && obj->mm) {
-		*phys = obj->iova;
-		return NULL;
+	if (phys && iommu_get_domain_for_dev(dev) == tegra->domain) {
+		/* if IOMMU isn't available, return IOVA=PHYS of the mapping */
+		if (obj->vaddr) {
+			*phys = obj->iova;
+			return NULL;
+		}
+
+		/*
+		 * If we've manually mapped the buffer object through the
+		 * IOMMU, make sure to return the IOVA address of our mapping.
+		 */
+		if (obj->mm) {
+			*phys = obj->iova;
+			return NULL;
+		}
 	}

 	/*
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 6d1872ddef17..91304b9034fa 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -97,16 +97,15 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
tegra_plane_state *state)

 	for (i = 0; i < state->base.fb->format->num_planes; i++) {
 		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
+		struct sg_table *sgt;

-		if (!dc->client.group) {
-			struct sg_table *sgt;
-
-			sgt = host1x_bo_pin(dc->dev, &bo->base, NULL);
-			if (IS_ERR(sgt)) {
-				err = PTR_ERR(sgt);
-				goto unpin;
-			}
+		sgt = host1x_bo_pin(dc->dev, &bo->base, &state->iova[i]);
+		if (IS_ERR(sgt)) {
+			err = PTR_ERR(sgt);
+			goto unpin;
+		}

+		if (sgt) {
 			err = dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
 					 DMA_TO_DEVICE);
 			if (err == 0) {
@@ -127,8 +126,6 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
tegra_plane_state *state)

 			state->iova[i] = sg_dma_address(sgt->sgl);
 			state->sgt[i] = sgt;
-		} else {
-			state->iova[i] = bo->iova;
 		}
 	}

@@ -141,8 +138,11 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
tegra_plane_state *state)
 		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
 		struct sg_table *sgt = state->sgt[i];

-		dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
-		host1x_bo_unpin(dc->dev, &bo->base, sgt);
+		if (sgt) {
+			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
+				     DMA_TO_DEVICE);
+			host1x_bo_unpin(dc->dev, &bo->base, sgt);
+		}

 		state->iova[i] = DMA_MAPPING_ERROR;
 		state->sgt[i] = NULL;
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 60b2fedd0061..538c0f0b40a4 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -108,7 +108,7 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)

 	for (i = 0; i < job->num_relocs; i++) {
 		struct host1x_reloc *reloc = &job->relocs[i];
-		dma_addr_t phys_addr, *phys;
+		dma_addr_t phys_addr;
 		struct sg_table *sgt;

 		reloc->target.bo = host1x_bo_get(reloc->target.bo);
@@ -117,12 +117,7 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)
 			goto unpin;
 		}

-		if (client->group)
-			phys = &phys_addr;
-		else
-			phys = NULL;
-
-		sgt = host1x_bo_pin(dev, reloc->target.bo, phys);
+		sgt = host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
 			goto unpin;
@@ -168,6 +163,13 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)
 		job->num_unpins++;
 	}

+	/*
+	 * In a case of enabled firewall, all user gathers are copied into
+	 * the secured job->gather_copy_mapped.
+	 */
+	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		return 0;
+
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
 		size_t gather_size = 0;
@@ -184,13 +186,13 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)
 			goto unpin;
 		}

-		sgt = host1x_bo_pin(host->dev, g->bo, NULL);
+		sgt = host1x_bo_pin(host->dev, g->bo, &phys_addr);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
 			goto unpin;
 		}

-		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
+		if (host->domain) {
 			for_each_sg(sgt->sgl, sg, sgt->nents, j)
 				gather_size += sg->length;
 			gather_size = iova_align(&host->iova, gather_size);
@@ -214,7 +216,7 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)

 			job->unpins[job->num_unpins].size = gather_size;
 			phys_addr = iova_dma_addr(&host->iova, alloc);
-		} else {
+		} else if (sgt) {
 			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
 					 DMA_TO_DEVICE);
 			if (!err) {

--- >8 ---
