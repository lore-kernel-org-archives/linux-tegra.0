From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 12/16] dmaengine: tegra-apb: Clean up suspend-resume
Date: Thu, 30 Jan 2020 18:58:37 +0000
Message-ID: <08b6a1f7-3c4d-ce6a-0d00-450f7bd4eeb3@nvidia.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-13-digetx@gmail.com>
 <e787bee2-4b52-1643-b3a5-8c4e70f6fdca@nvidia.com>
 <394014f3-011a-d6b6-b5f2-f8c86834ec70@gmail.com>
 <ffd9dbd0-be74-7bb4-9ca9-a97ee8023fc2@gmail.com>
 <3d8f599d-a46f-a7e5-8816-e0c44e2aceff@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3d8f599d-a46f-a7e5-8816-e0c44e2aceff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/01/2020 18:26, Dmitry Osipenko wrote:
> 30.01.2020 21:06, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 30.01.2020 19:08, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 30.01.2020 17:09, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>> On 30/01/2020 04:38, Dmitry Osipenko wrote:
>>>>> It is enough to check whether hardware is busy on suspend and to rese=
t
>>>>> it across of suspend-resume because channel's configuration is fully
>>>>> re-programmed on each DMA transaction anyways and because save-restor=
e
>>>>> of an active channel won't end up well without pausing transfer prior=
 to
>>>>> saving of the state (note that all channels shall be idling at the ti=
me of
>>>>> suspend, so save-restore is not needed at all).
>>>>
>>>> I guess if we ever wanted to support SNDRV_PCM_INFO_PAUSE for audio an=
d
>>>> support the pause callback, then saving and restoring the channels cou=
ld
>>>> be needed. Right now I believe that it will just terminate_all transfe=
rs
>>>> for audio on entering suspend. Any value in keeping this?
>>>
>>> Indeed, looks like [1] pauses DMA during suspend if SNDRV_PCM_INFO_PAUS=
E
>>> is supported.
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/v5.5/source/sound/core/pcm_dmaengine.c=
#L199
>>>
>>> So we'll need to save-restore context only if DMA is in a paused state
>>> during suspend, I'll adjust this patch to do that and will see if
>>> enabling SNDRV_PCM_INFO_PAUSE works.
>>
>> I started to look at it and found that the .device_pause() hook isn't
>> implemented by the driver. So, it's fine to remove the context's
>> save-restore for now.
>>
>> Jon, what about to keep this patch as-is? Later on I'll take a look at
>> implementing the proper pausing functionality and try to cleanup code a
>> bit further (remove the free list usage, etc).
>=20
> Ah, only T114+ supports the per-channel pausing. So, I won't care about
> implementing the device_pause(), let's leave it to somebody else :)

That's fine. We have lived with out it for this long.

Jon

--=20
nvpublic
