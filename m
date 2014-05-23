From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/nouveau: hook up cache sync functions
Date: Fri, 23 May 2014 15:00:15 +0900
Message-ID: <CAAVeFuJYDpSpmsu42EZkxypNePWDDhOb71hV+CstSmO632mtaw@mail.gmail.com>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
 <1400483458-9648-4-git-send-email-acourbot@nvidia.com>
 <20140519084620.GB7138@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140519084620.GB7138@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 19, 2014 at 5:46 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, May 19, 2014 at 04:10:57PM +0900, Alexandre Courbot wrote:
>> From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>>
>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> [acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org: make conditional and platform-friendly]
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Perhaps having a propery commit message here would be good.
>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> [...]
>> +#ifdef NOUVEAU_NEED_CACHE_SYNC
>> +void
>> +nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
>> +{
>> +     struct nouveau_device *device;
>> +     struct ttm_tt *ttm = nvbo->bo.ttm;
>> +
>> +     device = nouveau_dev(nouveau_bdev(ttm->bdev)->dev);
>> +
>> +     if (nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)
>> +             ttm_dma_tt_cache_sync_for_cpu((struct ttm_dma_tt *)nvbo->bo.ttm,
>> +                                           nv_device_base(device));
>
> Can we be certain at this point that the struct ttm_tt is in fact a
> struct ttm_dma_tt?
>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
> [...]
>> +#if IS_ENABLED(CONFIG_ARCH_TEGRA)
>> +#define NOUVEAU_NEED_CACHE_SYNC
>> +#endif
>
> I know I gave this as an example myself when we discussed this offline,
> but I'm now thinking that this might actually be better off in Kconfig.
>
>> +#ifdef NOUVEAU_NEED_CACHE_SYNC
>> +void nouveau_bo_sync_for_cpu(struct nouveau_bo *);
>> +void nouveau_bo_sync_for_device(struct nouveau_bo *);
>> +#else
>> +static inline void
>> +nouveau_bo_sync_for_cpu(struct nouveau_bo *)
>> +{
>> +}
>> +
>> +static inline void
>> +nouveau_bo_sync_for_device(struct nouveau_bo *)
>> +{
>> +}
>> +#endif
>> +
>> +
>
> There's a gratuituous blank line here.

Fixed.

>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index c90c0dc0afe8..b7e42fdc9634 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -897,7 +897,13 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
>>       ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
>>       spin_unlock(&nvbo->bo.bdev->fence_lock);
>>       drm_gem_object_unreference_unlocked(gem);
>> -     return ret;
>> +
>> +     if (ret)
>> +             return ret;
>> +
>> +     nouveau_bo_sync_for_cpu(nvbo);
>> +
>> +     return 0;
>>  }
>
> This could be rewritten as:
>
>         if (!ret)
>                 nouveau_bo_sync_for_cpu(nvbo);
>
>         return ret;
>
> Which would be slightly shorter.

I prefer to have a clear, easy to read code flow here by keeping
error-handling within conditions (and not the other way round). This
kind of optimization is very well done by the compiler.

>
> On second thought, perhaps part of nouveau_gem_ioctl_cpu_prep() could be
> refactored into a separate function to make this more symmetric. If we
> put that in nouveau_bo.c and name it nouveau_bo_wait() for example, the
> dummies can go away and both nouveau_bo_sync_for_{cpu,device}() can be
> made static. I also think that's cleaner because it has both variants of
> the nouveau_bo_sync_for_*() calls in the same file.

Yep, agreed. I will give it a try in the next version of the series.

Thanks,
Alex.
