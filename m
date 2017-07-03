From: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/atomic: Change
 drm_atomic_helper_swap_state to return an error.
Date: Mon, 3 Jul 2017 13:01:55 +0200
Message-ID: <76319124-3497-f941-73c7-ce6abf084551@linux.intel.com>
References: <20170628132812.14927-1-maarten.lankhorst@linux.intel.com>
 <20170630135621.c2xlunjaepne2vqt@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170630135621.c2xlunjaepne2vqt-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Op 30-06-17 om 15:56 schreef Daniel Vetter:
> On Wed, Jun 28, 2017 at 03:28:11PM +0200, Maarten Lankhorst wrote:
>> We want to change swap_state to wait indefinitely, but to do this
>> swap_state should wait interruptibly. This requires propagating
>> the error to each driver. All drivers have changes to deal with the
>> clean up. In order to allow easy reverting, the commit that changes
>> behavior is separate so someone only has to revert that for testing.
>>
>> Nouveau has a small bugfix, if drm_atomic_helper_wait_for_fences
>> failed cleanup_planes was not called.
>>
>> Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
>> Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Cc: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
>> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
>> Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> We kinda need to backport this to older kernels, but I don't really see
> how :( Maybe we should split this up:
> patch 1: Change to int return type
> patches 2-(n-1): Driver conversions
> patch n: __must_check addition
>
> That would at least somewhat make this backportable ...
>
>> ---
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 14 ++++++++++++--
>>  drivers/gpu/drm/drm_atomic_helper.c          | 18 ++++++++++++------
>>  drivers/gpu/drm/i915/intel_display.c         | 10 +++++++++-
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c       |  7 ++++++-
>>  drivers/gpu/drm/msm/msm_atomic.c             | 14 +++++++++-----
>>  drivers/gpu/drm/nouveau/nv50_display.c       | 10 ++++++++--
>>  drivers/gpu/drm/tegra/drm.c                  |  7 ++++++-
>>  drivers/gpu/drm/tilcdc/tilcdc_drv.c          |  6 +++++-
>>  drivers/gpu/drm/vc4/vc4_kms.c                | 21 +++++++++++++--------
>>  include/drm/drm_atomic_helper.h              |  4 ++--
>>  10 files changed, 82 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index 516d9547d331..d4f787bf1d4a 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -544,9 +544,11 @@ static int atmel_hlcdc_dc_atomic_commit(struct drm_device *dev,
>>  		goto error;
>>  	}
>>  
>> -	/* Swap the state, this is the point of no return. */
>> -	drm_atomic_helper_swap_state(state, true);
> Push the swap_state up over the commit setup (but after the allocation)
> and there's no more a problem with unrolling.
This can't be done higher up because of the interruptible wait.

Unless we change the patch series to move the waiting for hw_done to a separate step and get rid of the stall argument to swap_state once everything is converted. This could be useful for all drivers that have some kind of setup, because we could move the wait up slightly to suit the drivers needs.

~Maarten
