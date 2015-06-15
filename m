From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 2/2] drm/nouveau: add GEM_SET_TILING staging
 ioctl
Date: Mon, 15 Jun 2015 18:08:21 +0900
Message-ID: <557E9605.9040406@nvidia.com>
References: <1434352169-10501-1-git-send-email-acourbot@nvidia.com> <1434352169-10501-3-git-send-email-acourbot@nvidia.com> <20150615075618.GH8341@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150615075618.GH8341-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/15/2015 04:56 PM, Daniel Vetter wrote:
> On Mon, Jun 15, 2015 at 04:09:29PM +0900, Alexandre Courbot wrote:
>> From: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add new NOUVEAU_GEM_SET_TILING ioctl to set correct tiling
>> mode for imported dma-bufs. This ioctl is staging for now
>> and enabled with the "staging_tiling" module option.
>>
>> Signed-off-by: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> [acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org: carry upstream, many fixes]
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drm/nouveau/nouveau_bo.c           | 18 ++++++++++++
>>   drm/nouveau/nouveau_bo.h           |  2 ++
>>   drm/nouveau/nouveau_drm.c          |  6 ++++
>>   drm/nouveau/nouveau_gem.c          | 58 ++++++++++++++++++++++++++++++++++++++
>>   drm/nouveau/nouveau_gem.h          |  2 ++
>>   drm/nouveau/nouveau_ttm.c          | 13 +--------
>>   drm/nouveau/uapi/drm/nouveau_drm.h |  8 ++++++
>>   7 files changed, 95 insertions(+), 12 deletions(-)
>>
>> diff --git a/drm/nouveau/nouveau_bo.c b/drm/nouveau/nouveau_bo.c
>> index 6edcce1658b7..2a2ebbeb4fc0 100644
>> --- a/drm/nouveau/nouveau_bo.c
>> +++ b/drm/nouveau/nouveau_bo.c
>> @@ -178,6 +178,24 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 flags,
>>   	*size = roundup(*size, PAGE_SIZE);
>>   }
>>
>> +void
>> +nouveau_bo_update_tiling(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
>> +			 struct nvkm_mem *mem)
>> +{
>> +	switch (drm->device.info.family) {
>> +	case NV_DEVICE_INFO_V0_TESLA:
>> +		if (drm->device.info.chipset != 0x50)
>> +			mem->memtype = (nvbo->tile_flags & 0x7f00) >> 8;
>> +		break;
>> +	case NV_DEVICE_INFO_V0_FERMI:
>> +	case NV_DEVICE_INFO_V0_KEPLER:
>> +		mem->memtype = (nvbo->tile_flags & 0xff00) >> 8;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>>   int
>>   nouveau_bo_new(struct drm_device *dev, int size, int align,
>>   	       uint32_t flags, uint32_t tile_mode, uint32_t tile_flags,
>> diff --git a/drm/nouveau/nouveau_bo.h b/drm/nouveau/nouveau_bo.h
>> index e42360983229..87d07e3533eb 100644
>> --- a/drm/nouveau/nouveau_bo.h
>> +++ b/drm/nouveau/nouveau_bo.h
>> @@ -69,6 +69,8 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo **pnvbo)
>>   extern struct ttm_bo_driver nouveau_bo_driver;
>>
>>   void nouveau_bo_move_init(struct nouveau_drm *);
>> +void nouveau_bo_update_tiling(struct nouveau_drm *, struct nouveau_bo *,
>> +			      struct nvkm_mem *);
>>   int  nouveau_bo_new(struct drm_device *, int size, int align, u32 flags,
>>   		    u32 tile_mode, u32 tile_flags, struct sg_table *sg,
>>   		    struct reservation_object *robj,
>> diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
>> index 28860268cf38..45a2c88ebf8e 100644
>> --- a/drm/nouveau/nouveau_drm.c
>> +++ b/drm/nouveau/nouveau_drm.c
>> @@ -75,6 +75,10 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1
>>   int nouveau_runtime_pm = -1;
>>   module_param_named(runpm, nouveau_runtime_pm, int, 0400);
>>
>> +MODULE_PARM_DESC(staging_tiling, "enable staging GEM_SET_TILING ioctl");
>> +int nouveau_staging_tiling = 0;
>> +module_param_named(staging_tiling, nouveau_staging_tiling, int, 0600);
>
> Please use _unsafe here to make sure that setting this option taints the
> kernel and gives at least a bit of a deterrent. But in the end the policy
> is still that you can't regress anything if people complain, which means
> you might end up with a staging ioctl locked down forever.

That would kind of kill the whole purpose of this patchset. But at the 
same time the point of having staging ioctls is to say "don't use them 
in production", so hopefully the message is clear.

> The other part I don't like with this plan is that it looks a bit like it
> could be easily abused to evade the open source userspace requirement
> upstream has for new interfaces. Doesn't help that your first staging
> ioctl doesn't come with links to mesa/hwc/whatever patches attached ;-)

Well, you could abuse it - no more than 8 times though. ;)

The point is not to evade anything though, but rather to have the 
necessary kernel code land in such a way that we can experiment with 
Mesa and other user-space.

> Overall I don't think this will help - you need internal branch management
> anyway, and upstreaming new ABI is somewhat painful for a reason: Screwing
> things up is really expensive long-term, and the drm community has paid
> that price a few too many times.

It seems to me that this staging feature can exactly help with that: 
allow new ioctls to mature a bit (no longer than a kernel release cycle) 
and avoid that "ah, I wish we did this differently" moment. But 
considering the number of ABIs I have driven so far (0), someone more 
experienced may challenge that belief.
