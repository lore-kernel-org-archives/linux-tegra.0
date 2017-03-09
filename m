From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 0/3] Tegra Host1x dma_fence/sync_file support
Date: Thu, 9 Mar 2017 21:09:52 +0200
Message-ID: <cf797fd2-f4f2-f7e5-bb48-6486d7930e11@kapsi.fi>
References: <20170309175718.14843-1-mperttunen@nvidia.com>
 <CAKMK7uH=_9wXDS+yN4e60878j7kDSo+isrePOeDBP5HnHu-tjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uH=_9wXDS+yN4e60878j7kDSo+isrePOeDBP5HnHu-tjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/09/2017 08:58 PM, Daniel Vetter wrote:
> On Thu, Mar 9, 2017 at 6:57 PM, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi everyone,
>>
>> this series adds support for using sync fences as prefences and
>> postfences for host1x job submissions. The patches are available
>> as a git repository at
>>
>>   https://github.com/cyndis/linux/tree/host1x-fence-1
>>
>> and testing code is available at
>>
>>   https://github.com/cyndis/host1x_test
>>
>> though you may want to edit the main function to disable the
>> timeout tests for now as they cause a deadlock (not caused
>> by this series; fix upcoming).
>>
>> Verified on a Jetson TX1; should go on top of the earlier
>> VIC series.
>>
>> Some additional points:
>> * I noticed that the waitchk_mask field in the submit UAPI is completely
>>   useless, and has never had any effect in the upstream kernel.
>>   It has also not existed in the downstream kernel for many years.
>>   We could replace it with the flags field if that is deemed
>>   acceptable, though of course it is possible there exists some
>>   application that fills it with some non-zero value.
>
> If open source userspace (nouveau_dri.so) never used it, then you can
> freely change it. Backwards compat guarantee in drm is only for open
> source userspace (and by implication ofc anything that uses the ioctl
> the same way). See:
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

nouveau doesn't have any host1x related code - so no, there is no 
pre-existing open-source userspace that uses this :)

>
> On that topic, do we have the nouveau patches to enable the
> egl_android extension for this already published?

I assume you are referring to EGL_ANDROID_native_fence_sync; I don't 
know what nouveau's status is regarding that. With this series, the 
host1x driver does not yet allow other drivers access to the raw 
syncpoint values behind host1x fences but that can be fixed pretty 
easily if/when nouveau wants to support native syncpoint waits on Tegra.
Host1x jobs do use native waits already with this series, though.

>
>> * Signaling is enabled for all host1x fences, not just those for
>>   which enable_signaling has been called. This is because
>>   enable_signaling is called from atomic context and we cannot set
>>   up an action waiter in atomic context.
>
> Yeah, this was some good fun getting it all sorted in i915 too :-)
> -Daniel

:)

Cheers,
Mikko

>
>>
>> Thanks,
>> Mikko
>>
>> Mikko Perttunen (3):
>>   gpu: host1x: Add support for DMA fences
>>   drm/tegra: Add sync file support to submit interface
>>   drm/tegra: Support for sync file-based fences in submit
>>
>>  drivers/gpu/drm/tegra/drm.c        |  69 +++++++++++--
>>  drivers/gpu/host1x/Kconfig         |   1 +
>>  drivers/gpu/host1x/Makefile        |   1 +
>>  drivers/gpu/host1x/dev.h           |  12 ++-
>>  drivers/gpu/host1x/fence.c         | 202 +++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/host1x/fence.h         |  28 +++++
>>  drivers/gpu/host1x/hw/channel_hw.c |  36 +++++--
>>  drivers/gpu/host1x/intr.c          |  11 +-
>>  drivers/gpu/host1x/intr.h          |   8 +-
>>  drivers/gpu/host1x/syncpt.c        |   2 +
>>  include/linux/host1x.h             |  12 ++-
>>  include/uapi/drm/tegra_drm.h       |   8 +-
>>  12 files changed, 367 insertions(+), 23 deletions(-)
>>  create mode 100644 drivers/gpu/host1x/fence.c
>>  create mode 100644 drivers/gpu/host1x/fence.h
>>
>> --
>> 2.11.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
