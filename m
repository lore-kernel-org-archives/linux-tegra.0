From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 12/16] drm/nouveau/fifo: add GK20A support
Date: Wed, 5 Feb 2014 10:21:58 +0900
Message-ID: <52F19236.5010101@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com> <1391224618-3794-13-git-send-email-acourbot@nvidia.com> <20140204091518.GZ17001@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140204091518.GZ17001-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Daniel,

On 02/04/2014 06:15 PM, Daniel Vetter wrote:
> On Sat, Feb 01, 2014 at 12:16:54PM +0900, Alexandre Courbot wrote:
>> GK20A's FIFO is compatible with NVE0, but only features 128 channels and
>> 1 runlist.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/nouveau/Makefile                   |  1 +
>>   drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h    |  1 +
>>   drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c    | 27 ++++++++++++++++++++++
>>   drivers/gpu/drm/nouveau/core/include/engine/fifo.h |  1 +
>>   4 files changed, 30 insertions(+)
>>   create mode 100644 drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c
>>
>> diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
>> index e88145b..6c4b76d 100644
>> --- a/drivers/gpu/drm/nouveau/Makefile
>> +++ b/drivers/gpu/drm/nouveau/Makefile
>> @@ -236,6 +236,7 @@ nouveau-y += core/engine/fifo/nv50.o
>>   nouveau-y += core/engine/fifo/nv84.o
>>   nouveau-y += core/engine/fifo/nvc0.o
>>   nouveau-y += core/engine/fifo/nve0.o
>> +nouveau-y += core/engine/fifo/nvea.o
>>   nouveau-y += core/engine/fifo/nv108.o
>>   nouveau-y += core/engine/graph/ctxnv40.o
>>   nouveau-y += core/engine/graph/ctxnv50.o
>> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h
>> index 014344e..e96b32b 100644
>> --- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h
>> +++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h
>> @@ -8,6 +8,7 @@ int  nve0_fifo_ctor(struct nouveau_object *, struct nouveau_object *,
>>   		    struct nouveau_object **);
>>   void nve0_fifo_dtor(struct nouveau_object *);
>>   int  nve0_fifo_init(struct nouveau_object *);
>> +int  nve0_fifo_fini(struct nouveau_object *, bool);
>>
>>   struct nve0_fifo_impl {
>>   	struct nouveau_oclass base;
>> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c
>> new file mode 100644
>> index 0000000..16f8905
>> --- /dev/null
>> +++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c
>> @@ -0,0 +1,27 @@
>> +/*
>> + * Copyright (c) 2014, NVIDIA Corporation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>
> Just stumbled over this lincense header: Generally drm is mit/gpl dual
> lincensed. The important part for me is the drm core, but due to all the
> refactoring we tend to do and code extraction from drivers those are
> rather relevant imo, too. Was this just an oversight or are you still
> working with your legap people on this?

Thanks for pointing this out. This was an oversight on my part indeed. 
The following revisions will use the correct MIT copyright header.

In case someone wants to contribute significant fixes to this patchset, 
please be aware that MIT is the license that will apply from now on.

Thanks,
Alex.
