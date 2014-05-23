From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/nouveau: hook up cache sync functions
Date: Fri, 23 May 2014 15:01:26 +0900
Message-ID: <CAAVeFuJ_Z1Qv6uEy=i7mXJ18cdnN=O27Ad_b3tdtixA2p1qcJw@mail.gmail.com>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
 <1400483458-9648-4-git-send-email-acourbot@nvidia.com>
 <1400491887.8467.15.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400491887.8467.15.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 19, 2014 at 6:31 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Am Montag, den 19.05.2014, 16:10 +0900 schrieb Alexandre Courbot:
>> From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>>
>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> [acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org: make conditional and platform-friendly]
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_bo.c  | 32 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/nouveau/nouveau_bo.h  | 20 ++++++++++++++++++++
>>  drivers/gpu/drm/nouveau/nouveau_gem.c |  8 +++++++-
>>  3 files changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index b6dc85c614be..0886f47e5244 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -407,6 +407,8 @@ nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
>>  {
>>       int ret;
>>
>> +     nouveau_bo_sync_for_device(nvbo);
>> +
>>       ret = ttm_bo_validate(&nvbo->bo, &nvbo->placement,
>>                             interruptible, no_wait_gpu);
>>       if (ret)
>> @@ -487,6 +489,36 @@ nouveau_bo_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
>>       return 0;
>>  }
>>
>> +#ifdef NOUVEAU_NEED_CACHE_SYNC
>
> I don't like this ifdef at all. I know calling this functions will add a
> little overhead to x86 where it isn't strictly required, but I think
> it's negligible.
>
> When I looked at them the dma_sync_single_for_[device|cpu] functions
> which are called here map out to just a drain of the PCI store buffer on
> x86, which should be fast enough to be done unconditionally. They won't
> so any time-consuming cache synchronization on PCI coherent arches.

If Ben agrees with it I am also perfectly fine with getting rid of this #ifdef.
