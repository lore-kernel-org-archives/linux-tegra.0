From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Date: Mon, 3 Feb 2020 00:00:49 +0300
Message-ID: <7b710148-15db-f2d8-4221-62b032542426@gmail.com>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
 <20200129123935.GG2479935@ulmo>
 <d69df90f-37c9-0242-708a-689a8789a30b@gmail.com>
 <20200130120806.GA2582317@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200130120806.GA2582317@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

30.01.2020 15:08, Thierry Reding пишет:
...
>> Why not to set the DMA mask to 32bits if IOMMU is unavailable?
> 
> We already do that. If you look at host1x_iommu_init() in
> drivers/gpu/host1x/dev.c, you'll see that when no IOMMU support is
> available and the host1x doesn't support wide GATHER opcodes, then
> we limit the DMA Mask to 32 bits.
> 
> But that's not enough, see below.
> 
>> I'm a bit puzzled by the actual need to support the case where Host1x is
>> backed by IOMMU and clients not.. How we could ever end up with this
>> scenario in the upstream kernel?
> 
> That's not what we're doing here. The fundamental problem is that we
> have a couple of generations where the hardware is mismatched in that
> clients support 34-bit addresses while host1x can only use 32-bit
> addresses in the GATHER opcode. The only way to get around this mismatch
> is by using an IOMMU.

Isn't it possible to limit DMA mask to 32-bit for both clients and Host1x?

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 6a995db51d6d..4253dd53ea2e 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -190,12 +190,28 @@ static void host1x_subdev_unregister(struct
host1x_device *device,
  */
 int host1x_device_init(struct host1x_device *device)
 {
+	struct host1x *host = dev_get_drvdata(device->dev.parent);
+	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
 	struct host1x_client *client;
+	u64 mask;
 	int err;

 	mutex_lock(&device->clients_lock);

 	list_for_each_entry(client, &device->clients, list) {
+		mask = dma_get_mask(client->dev);
+
+		if (!domain && !host->info->has_wide_gather &&
+		    mask > DMA_BIT_MASK(32)) {
+			err = dma_coerce_mask_and_coherent(client->dev,
+							   DMA_BIT_MASK(32));
+			if (err < 0) {
+				dev_err(&device->dev,
+					"failed to set DMA mask: %d\n", err);
+				goto teardown;
+			}
+		}
+
 		if (client->ops && client->ops->init) {
 			err = client->ops->init(client);
 			if (err < 0) {

> However, with an IOMMU enabled for clients, we can run into the case
> where sparse pages would be allocated via shmem and end up beyond the
> 32-bit boundary. If the host1x is not attached to an IOMMU, there's no
> way for it to access these pages with standard GATHER opcodes.
> 
> This is what used to happen prior to this change when the host1x
> firewall was enabled.

I assume you're meaning the *disabled* firewall because gathers are
copied into the Host1x's DMA buffer if firewall is enabled.

> Since we were not attaching it to an IOMMU in that
> case, we would end up with sparse buffers allocated from pages that the
> host1x couldn't address.

Could you please clarify what do you mean by the shmem? If you mean the
get_pages(), then one option will be to simply enforce Host1x firewall
in order to get gathers always copied, and thus, we can remove the
TEGRA_HOST1X_FIREWALL Kconfig option.

The other option could be *not* to use get_pages() whenever it can't work.

It also should be worthwhile to simply restrict kernel's configuration
by disabling all functionality which requires IOMMU if IOMMU is not
available. Just error out with informative message in that case, telling
that kernel/device-tree configuration is wrong.

Please notice that grate-drivers do not work with the disabled firewall
anyways, because it's simply impractical/unusable from a userspace
perspective to track liveness of the gather BO.

Also, take a look at the grate-kernel's WIP patch where Host1x is
separated from Tegra DRM and Host1x maintains gather buffer allocations
by itself. In the case of legacy UAPI, the gather commands are copied
from DRM GEM to the Host1x's BO, similarly to what we have now in
upstream for the case of the enabled firewall, but in a more optimized
manner (using pre-allocated pool and etc). I'd like to see the upstream
driver doing the same if we won't end up dropping the legacy staging
UAPI entirely.

>> What about the reverse scenario? You won't be able to patch cmdstream
>> properly for >32bit addresses.
> 
> I don't think that scenario exists. I'm not aware of a Tegra device that
> has system memory outside of the CPU-addressable region.
> 
>> The root of the problem is that Tegra DRM UAPI doesn't support 64bit
>> addresses, so you can't use "wide" opcodes and can't patch cmdstream.
> 
> There's nothing in the UAPI that deals with addresses directly. We only
> pass around handles and these are resolved to buffer objects in the
> kernel where the address of the buffers can be 32-bit or 64-bit.

If buffer is 64-bit, then client's address-registers take two 32-bit
hardware registers, and thus, cmdstream should reserve two words for the
patched handles.

Host1x driver doesn't support patching of 64-bit addresses and there is
no way to tell userspace to reserve two words per-address using the
current UAPI.

> And we do in fact support wide opcodes and patch command streams just
> fine on 64-bit systems.
> 
> I mean, it's not like I've been doing this just for the fun of it. There
> are actual configurations where this is needed in order for it to work.
> 
>> Perhaps it is better not to add any new things or quirks to the Host1x /
>> Tegra DRM for now. The drivers need a serious clean up, otherwise mess
>> only continues to grow up. Don't you think so?
> 
> This isn't anything new or a quirk. This is bug fixes to ensure that the
> driver works in (now hopefully) all configurations. Previously it was a
> matter of getting the configuration just right in order for it to work.
> All the work I did here (starting with the wide opcode support and then
> the DMA API and IOMMU work) was to make sure it would safely work in any
> setup.
> 
> And I do consider these changes to also be cleanups and incremental
> improvements of what the state was before. Again, I don't consider a
> rewrite a serious cleanup.
> 
> I'm fully aware that the driver has been collecting dust for a while and
> it isn't perfect. But it's also not overly messy. It's perhaps a bit
> more complex than your average driver, but it's also some pretty complex
> hardware.
...
>> Doesn't sound good to me.. this is not going to be good for GPU drivers.
>> All cache maintenance should be in control of userspace, the userspace
>> should be telling kernel driver when it needs to get CPU access and when
>> to finish the access. DMABUF has generic UAPI for the synchronizations,
>> although a mature GPU driver may need more than that.
> 
> I agree. But that's not something that we can do at this point. We don't
> have a way of passing information such as this to the driver, so the
> driver has to assume that caches are dirty for all buffers, otherwise it
> will not be able to guarantee that random cache flushes won't corrupt
> the data that it's passing to the hardware.
> 
> So yes, when we do have a way of explicitly flushing the caches for
> buffers, then we can add a mechanism to pass that information to the
> kernel so that it can optimize. But until then we just can't be sure.

It worked fine for the last 7 years on T20/30 and continues to work if
the offending patches are reverted, no problems here.

> And I prefer a kernel driver that gives me slow and reliable, rather
> than fast but unpredictable results.

Your changes introduced regression on Tegra20/30 without solving any
problem. This is unacceptable, it's not an improvement, please don't do
it :)

Apparently some problem exists only for later Tegra generations, but I
still can't recognize what it's is from your words.

Please give a concrete real-world example of the trouble you're trying
to solve.

>> Today Tegra DRM driver supports only write-combined BO allocations, and
>> thus, we don't need to do more than to flush CPU buffers before
>> executing HW job.
> 
> That's only true when you allocate with the DMA API. When you allocate
> from a shmem mapping you don't get write-combined memory, so we do have
> to perform cache maintenance on the pages.

In all cases GEM's memory mappings are write-combined, including the
case of get_pages(). Host1x driver performs the maintenance by doing
wmb() before executing job.

If you're meaning that imported buffers could be backed by cacheable
pages, then userspace must use DMABUF syncing UAPI or any other means to
sync CPU cache, there is no way around it. You should assume that yours
userpspace is broken if it doesn't do it.

>>>> Please let me know if you're going to fix the problems or if you'd
>>>> prefer me to create the patches.
>>>>
>>>> Here is a draft of the fix for #2, it doesn't cover case of imported
>>>> buffers (which should be statically mapped, IIUC):
>>>>
>>>> @@ -38,7 +38,7 @@ static struct sg_table *tegra_bo_pin(struct device
>>>> *dev, struct host1x_bo *bo,
>>>>          * If we've manually mapped the buffer object through the IOMMU,
>>>> make
>>>>          * sure to return the IOVA address of our mapping.
>>>>          */
>>>> -       if (phys && obj->mm) {
>>>> +       if (phys && (obj->mm || obj->vaddr)) {
>>>>                 *phys = obj->iova;
>>>
>>> This doesn't work for the case where we use the DMA API for mapping. Or
>>> at least it isn't going to work in the general case.
>>
>> Right, looks like I'll need to update my memory about the DMA API usage.
>>
>>> The reason is because obj->iova is only valid for whatever the device was that mapped
>>> or allocated the buffer, which in this case is the host1x device, which
>>> isn't even a real device, so it won't work. The only case where it does
>>> work is if we're not behind an IOMMU, so obj->iova will actually be the
>>> physical address.
>>
>> But why do you need to dynamically map/unmap the statically-allocated
>> buffers on each job submission, could you please explain what is the
>> point? Perhaps it's a temporary workaround just to get a minimum of
>> things working for the case of implicit IOMMU?
> 
> It's primarily because we don't really know if a buffer has been mapped
> for a specific device. We always map at allocation time for the Tegra
> DRM parent device (which isn't a real device) but before it's used by
> any other host1x client, it has to be mapped for that device as well.

> That's important in case any of these devices have different IOMMU
> domains.

This case should be covered by the solution I'm proposing below.

Today's mainline kernel has all clients in the same shared IOMMU domain.
Please note that I'm focused on solving the primary regression problem,
the potential future problems are secondary.

> Actually, given that the device isn't a real device, the DMA handle
> returned from dma_alloc_wc() is actually a physical address and not
> valid for any device behind an IOMMU. So even in the case where we
> share an IOMMU domain among multiple device, the mapping created by
> dma_alloc_wc() is useless for them.

What about to pick any DRM sub-device and then statically map DMA buffer
for this picked device during of BO allocation / import? All other DRM
sub-devices can access that mapping because of the shared domain.

> Because of the above and probably a bunch of other reasons, it's also a
> requirement of the DMA API. If you enable CONFIG_DMA_API_DEBUG, the DMA
> API will start printing a bunch of errors if you violate those and they
> typically indicate that what you're doing may not work. That doesn't
> mean it can't work, but it usually only does so accidentally.
> 
>> All buffers should be statically allocated and statically mapped, and
>> when there is a need to sync an already mapped buffer, the dma_sync_*
>> API should be used.
> 
> That's my understanding as well. However, it's slightly more complicated
> than that. Once you move away from the assumption that a mapping for a
> buffer the same for all devices, you can no longer do that. For example,
> while the statically allocated buffer may be mapped for the Tegra DRM
> device (again, it's not a real device), it's not mapped for any of the
> clients yet.

The same what I wrote above. Just pick any DRM sub-device and map buffer
for that device during allocation / import.

> So before a client can use it, its driver has to go and map
> the buffer for the device. The logical point to do that is during
> host1x_job_pin(). Once the client no longer has a use for the buffer it
> should also unmap the buffer again because it will otherwise occupy the
> IOVA space unnecessarily. The logical point to do that is during
> host1x_job_unpin().

The IOVA space problem really exists only for Tegra20.

I suppose that page table size is ~10-20MB per 1GB of allocations, this
is not something to worry about.

> host1x_job_unpin() is also the point at which the job releases its
> reference to the buffer, so the backing memory could go away at any
> point after that, which means that the IOVA mapping could point at
> invalid memory if we didn't unmap the buffer.

Backing memory can't go away before buffer is unmapped, it is a refcount
bug otherwise.

> I'm not aware of an easy way to optimize this while at the same time
> making sure that everything is still consistent. I suppose one way to do
> this would be to keep a cache of buffer objects and their mappings for
> each device and avoid mapping/unmapping them for every job. The problem
> with that is that we also don't want to hold on to buffer objects
> indefinitely because that will potentially cause a lot of memory and
> IOVA space to be used.

The case of explicit IOMMU is nicer because we can use DRM's MM scanner
to maintain a limited window of IOMMU mappings. Take a look at
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/gart.c
for example.

The LRU cache should be easy to implement, it also should be useful if
we'll get around to supporting memory shrinker (BO swap-out).

>> Like I said above, the syncing should be done by userspace for the
>> buffers that are in control of userspace.
> 
> Yes, I agree. We already have an implementation of the .begin_cpu_access
> and .end_cpu_access callbacks for DMA-BUF, so it should be easy to add
> something like that for native buffers. Alternatively, I suppose user-
> space could be required to flush/invalidate using the DMA-BUF, but that
> potentially has the drawback of having to export a DMA-BUF for every
> single buffer.> A better option may be to add a driver-specific IOCTL to do cache
> maintenance. I think other drivers already do that.
Perhaps.. but it needs a real-world use-case first.

>>> So what this basically ends up doing is avoid dma_map_*() all the time,
>>> which I guess is what you're trying to achieve. But it also gives you
>>> the wrong I/O virtual address in any case where an IOMMU is involved.
>>> Also, as discussed above, avoiding cache maintenance isn't correct.
>>
>> Alright, then right now we need to bypass the dma_map_*() in a case of a
>> non-implicit IOMMU, in order to bring back the good old behavior (at
>> least temporary, until there will be a more comprehensive solution).
> 
> But it's not good old behaviour. You're still going to side-step the
> cache maintenance and violate the DMA API semantics.

The DMA API usage that you introduced in the v5.5 is wrong too because
it makes driver unusable :)

From a user's perspective it is exactly the good old behaviour. I tried
to load KDE Plasma 5 using Xorg Opentegra driver, which worked perfectly
fine before, and now it is absolutely unusable.

There are couple things we could do in order to prevent this situation
in the future:

  1. Better automated testing. The grate-tests could be useful for this
particular case, once it will get support for the offscreen testing.

  2. Better review and real-world testing of the patches. Don't you mind
if I'll propose myself as a reviewer for the Tegra DRM / Host1x drivers?

I'm suggesting to take a step back and revert to the old behaviour for
now, at least on T20/30. I don't know about ARM64, but ARM32 permits to
violate the DMA API semantics for the case of unavailable IOMMU, of
course that may change in the future and by that time I hope we'll
manage to get the DMA API usage done right.

The solution below restores old behavior for the case of unavailable
IOMMU and for the case of explicit IOMMU domain, it should work in the
case of implicit IOMMU as well.

>> What do you think about this variant:
>>
>> --- >8 ---
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>> index 1237df157e05..555a6424e9fa 100644
>> --- a/drivers/gpu/drm/tegra/gem.c
>> +++ b/drivers/gpu/drm/tegra/gem.c
>> @@ -54,16 +54,25 @@ static struct sg_table *tegra_bo_pin(struct device
>> *dev, struct host1x_bo *bo,
>>  				     dma_addr_t *phys)
>>  {
>>  	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
>> +	struct tegra_drm *tegra = obj->gem.dev->dev_private;
>>  	struct sg_table *sgt;
>>  	int err;
>>
>> -	/*
>> -	 * If we've manually mapped the buffer object through the IOMMU, make
>> -	 * sure to return the IOVA address of our mapping.
>> -	 */
>> -	if (phys && obj->mm) {
>> -		*phys = obj->iova;
>> -		return NULL;
>> +	if (phys && iommu_get_domain_for_dev(dev) == tegra->domain) {
>> +		/* if IOMMU isn't available, return IOVA=PHYS of the mapping */

>> +		if (obj->vaddr) {

If this is unacceptable on ARM64 (dma_handle != phys_addr), then it
could be:

		if (obj->vaddr && IS_ENABLED(CONFIG_ARM)) {

>> +			*phys = obj->iova;
>> +			return NULL;
>> +		}
>> +
>> +		/*
>> +		 * If we've manually mapped the buffer object through the
>> +		 * IOMMU, make sure to return the IOVA address of our mapping.
>> +		 */
>> +		if (obj->mm) {
>> +			*phys = obj->iova;
>> +			return NULL;
>> +		}
>>  	}
>>
>>  	/*
>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
>> index 6d1872ddef17..91304b9034fa 100644
>> --- a/drivers/gpu/drm/tegra/plane.c
>> +++ b/drivers/gpu/drm/tegra/plane.c
>> @@ -97,16 +97,15 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
>> tegra_plane_state *state)
>>
>>  	for (i = 0; i < state->base.fb->format->num_planes; i++) {
>>  		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
>> +		struct sg_table *sgt;
>>
>> -		if (!dc->client.group) {
>> -			struct sg_table *sgt;
>> -
>> -			sgt = host1x_bo_pin(dc->dev, &bo->base, NULL);
>> -			if (IS_ERR(sgt)) {
>> -				err = PTR_ERR(sgt);
>> -				goto unpin;
>> -			}
>> +		sgt = host1x_bo_pin(dc->dev, &bo->base, &state->iova[i]);
>> +		if (IS_ERR(sgt)) {
>> +			err = PTR_ERR(sgt);
>> +			goto unpin;
>> +		}
>>
>> +		if (sgt) {
>>  			err = dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
>>  					 DMA_TO_DEVICE);
>>  			if (err == 0) {
>> @@ -127,8 +126,6 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
>> tegra_plane_state *state)
>>
>>  			state->iova[i] = sg_dma_address(sgt->sgl);
>>  			state->sgt[i] = sgt;
>> -		} else {
>> -			state->iova[i] = bo->iova;
>>  		}
>>  	}
>>
>> @@ -141,8 +138,11 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
>> tegra_plane_state *state)
>>  		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
>>  		struct sg_table *sgt = state->sgt[i];
>>
>> -		dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
>> -		host1x_bo_unpin(dc->dev, &bo->base, sgt);
>> +		if (sgt) {
>> +			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
>> +				     DMA_TO_DEVICE);
>> +			host1x_bo_unpin(dc->dev, &bo->base, sgt);
>> +		}
>>
>>  		state->iova[i] = DMA_MAPPING_ERROR;
>>  		state->sgt[i] = NULL;
>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>> index 60b2fedd0061..538c0f0b40a4 100644
>> --- a/drivers/gpu/host1x/job.c
>> +++ b/drivers/gpu/host1x/job.c
>> @@ -108,7 +108,7 @@ static unsigned int pin_job(struct host1x *host,
>> struct host1x_job *job)
>>
>>  	for (i = 0; i < job->num_relocs; i++) {
>>  		struct host1x_reloc *reloc = &job->relocs[i];
>> -		dma_addr_t phys_addr, *phys;
>> +		dma_addr_t phys_addr;
>>  		struct sg_table *sgt;
>>
>>  		reloc->target.bo = host1x_bo_get(reloc->target.bo);
>> @@ -117,12 +117,7 @@ static unsigned int pin_job(struct host1x *host,
>> struct host1x_job *job)
>>  			goto unpin;
>>  		}
>>
>> -		if (client->group)
>> -			phys = &phys_addr;
>> -		else
>> -			phys = NULL;
>> -
>> -		sgt = host1x_bo_pin(dev, reloc->target.bo, phys);
>> +		sgt = host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
>>  		if (IS_ERR(sgt)) {
>>  			err = PTR_ERR(sgt);
>>  			goto unpin;
>> @@ -168,6 +163,13 @@ static unsigned int pin_job(struct host1x *host,
>> struct host1x_job *job)
>>  		job->num_unpins++;
>>  	}
>>
>> +	/*
>> +	 * In a case of enabled firewall, all user gathers are copied into
>> +	 * the secured job->gather_copy_mapped.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
>> +		return 0;
>> +
>>  	for (i = 0; i < job->num_gathers; i++) {
>>  		struct host1x_job_gather *g = &job->gathers[i];
>>  		size_t gather_size = 0;
>> @@ -184,13 +186,13 @@ static unsigned int pin_job(struct host1x *host,
>> struct host1x_job *job)
>>  			goto unpin;
>>  		}
>>
>> -		sgt = host1x_bo_pin(host->dev, g->bo, NULL);
>> +		sgt = host1x_bo_pin(host->dev, g->bo, &phys_addr);
>>  		if (IS_ERR(sgt)) {
>>  			err = PTR_ERR(sgt);
>>  			goto unpin;
>>  		}
>>
>> -		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
>> +		if (host->domain) {
>>  			for_each_sg(sgt->sgl, sg, sgt->nents, j)
>>  				gather_size += sg->length;
>>  			gather_size = iova_align(&host->iova, gather_size);
>> @@ -214,7 +216,7 @@ static unsigned int pin_job(struct host1x *host,
>> struct host1x_job *job)
>>
>>  			job->unpins[job->num_unpins].size = gather_size;
>>  			phys_addr = iova_dma_addr(&host->iova, alloc);
>> -		} else {
>> +		} else if (sgt) {
>>  			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
>>  					 DMA_TO_DEVICE);
>>  			if (!err) {
>>
>> --- >8 ---
