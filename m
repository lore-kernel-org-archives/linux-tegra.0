From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_relocation)
Date: Fri, 26 Jun 2020 12:01:00 +0300
Message-ID: <9486b5c7-7588-34fd-bb60-a3b0f252f113@kapsi.fi>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
 <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
 <eb3cac23-cd8c-732b-684c-c2d531de00a2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eb3cac23-cd8c-732b-684c-c2d531de00a2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 6/26/20 1:50 AM, Dmitry Osipenko wrote:
> 25.06.2020 12:27, Mikko Perttunen пишет:
>> On 6/25/20 1:33 AM, Dmitry Osipenko wrote:
>>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>> struct drm_tegra_submit_relocation {
>>>>           /* [in] Index of GATHER or GATHER_UPTR command in commands. */
>>>>           __u32 gather_command_index;
>>>>
>>>>           /*
>>>>            * [in] Mapping handle (obtained through CHANNEL_MAP) of the
>>>> memory
>>>>            *   the address of which will be patched in.
>>>>            */
>>>>           __u32 mapping_id;
>>>>
>>>>           /*
>>>>            * [in] Offset in the gather that will be patched.
>>>>            */
>>>>           __u64 gather_offset;
>>>>
>>>>           /*
>>>>            * [in] Offset in target buffer whose paddr/IOVA will be
>>>> written
>>>>            *   to the gather.
>>>>            */
>>>>           __u64 target_offset;
>>>>
>>>>           /*
>>>>            * [in] Number of bits the resulting address will be logically
>>>>            *   shifted right before writing to gather.
>>>>            */
>>>>           __u32 shift;
>>>>
>>>>           __u32 reserved[1];
>>>> };
>>>
>>> We will also need read/write direction flag here for the
>>> DMA-reservations set up, it will be used for the implicit BO fencing by
>>> the job's scheduler.
>>>
>>
>> Ideally on newer chips with context isolation, we no longer know what
>> DMA-BUFs are being used by the job at submit time - they would just be
>> pointers after being MAPped.
> 
> The DMA-BUFs themselves shouldn't be needed, but GEMs should.

Yes, I meant to say GEM instead of DMA-BUF.

> 
>> Do you know how other GPUs deal with DMA reservations - I expect
>> separate MAP and SUBMIT steps would be pretty common?
> 
> I can't instantly recall what other drivers do, could be worthwhile to
> take a closer look.

I'll see if I can find some similar situations in other drivers.

Mikko

> 
>> Do you have to
>> pass the DMA-BUF to both steps (i.e. do IOMMU mapping during MAP, and
>> manage reservations at SUBMIT)?
> 
> Yes, this sounds good to me if DMA-BUF part is replaced with a GEM.
> 
> Please see my other reply regarding the MAP IOCTL where I'm suggesting
> to back mapping IDs with a GEM.
>
