From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_channel_map)
Date: Tue, 30 Jun 2020 22:48:36 +0300
Message-ID: <bad91732-1ae1-6c49-024c-d11e0e8d3579@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
 <20200626073430.GA3109062@ulmo>
 <4c243f7a-4c53-d995-88a1-0fe03d41fc3a@gmail.com>
 <f622c8ed-efe4-0889-bd26-dc22e96b8e4d@kapsi.fi>
 <b8a8b05e-de1c-400f-3f35-bb1ea49789e9@gmail.com>
 <76e46256-58d3-fdbe-41d6-8ac910fc7fd0@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <76e46256-58d3-fdbe-41d6-8ac910fc7fd0-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

30.06.2020 13:55, Mikko Perttunen пишет:
> 
> 
> On 6/29/20 1:59 AM, Dmitry Osipenko wrote:
>> 28.06.2020 14:16, Mikko Perttunen пишет:
>>> On 6/26/20 7:35 PM, Dmitry Osipenko wrote:
>>>> 26.06.2020 10:34, Thierry Reding пишет:
>>>>> On Fri, Jun 26, 2020 at 01:47:46AM +0300, Dmitry Osipenko wrote:
>>>>>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>>>>> ### DRM_TEGRA_CHANNEL_MAP
>>>>>>>
>>>>>>> Make memory accessible by the engine while executing work on the
>>>>>>> channel.
>>>>>>>
>>>>>>> ```
>>>>>>> #define DRM_TEGRA_CHANNEL_MAP_READWRITE        (1<<0)
>>>>>>>
>>>>>>> struct drm_tegra_channel_map {
>>>>>>>           /*
>>>>>>>            * [in] ID of the channel for which to map memory to.
>>>>>>>            */
>>>>>>>           __u32 channel_id;
>>>>>>>           /*
>>>>>>>            * [in] GEM handle of the memory to map.
>>>>>>>            */
>>>>>>>           __u32 handle;
>>>>>>>
>>>>>>>           /*
>>>>>>>            * [in] Offset in GEM handle of the memory area to map.
>>>>>>>            *
>>>>>>>            * Must be aligned by 4K.
>>>>>>>            */
>>>>>>>           __u64 offset;
>>>>>>
>>>>>> Could you please give a use-case example for this partial mapping?
>>>>>>
>>>>>> I vaguely recalling that maybe it was me who suggested this in the
>>>>>> past..
>>>>>>
>>>>>> I kinda see that this could be useful for a case where userspace
>>>>>> allocates a large chunk of memory and then performs
>>>>>> sub-allocations in
>>>>>> the userspace driver. But do we have a real-world example for this
>>>>>> right
>>>>>> now?
>>>>>
>>>>> I think the main point about this IOCTL was to make mapping/unmapping
>>>>> more efficient and avoid relocations for situations where we know
>>>>> it is
>>>>> safe to do so.
>>>>>
>>>>> The fact that this can be used to create partial mappings is mostly
>>>>> just
>>>>> an added bonus, in my opinion. Doing this doesn't create much
>>>>> complexity
>>>>> but in turn gives us a lot more flexibility.
>>>>>
>>>>> A couple of places where I think this could be useful are OpenGL and
>>>>> Vulkan, both of which support buffer suballocation. This has a
>>>>> couple of
>>>>> advantages on modern GPUs where sometimes you want to use very large
>>>>> allocation granularity, etc.
>>>>>
>>>>> Now, I don't think that we'll see much of that in Tegra DRM directly,
>>>>> although grate could certainly make use of this, I suspect. However, I
>>>>> think for interoperation of dGPU and Tegra DRM (with VIC for post-
>>>>> processing, or hopefully some of the other hardware acceleration
>>>>> engines at some point), this might come in handy.
>>>>>
>>>>> There are other possible use-cases within just Tegra DRM as well.
>>>>> We may
>>>>> want to only partially map planar buffers for video
>>>>> post-processing, for
>>>>> example. Or map each plane separately.
>>>>>
>>>>>> Please see more below.
>>>>>>
>>>>>>>           /*
>>>>>>>            * [in] Length of memory area to map in bytes.
>>>>>>>            *
>>>>>>>            * Must be aligned by 4K.
>>>>>>>            */
>>>>>>>           __u64 length;
>>>>>>>
>>>>>>>           /*
>>>>>>>            * [out] IOVA of mapped memory. Userspace can use this
>>>>>>> IOVA
>>>>>>>            *   directly to refer to the memory to skip using
>>>>>>> relocations.
>>>>>>>            *   Only available if hardware memory isolation is
>>>>>>> enabled.
>>>>>>>            *
>>>>>>>            *   Will be set to 0xffff_ffff_ffff_ffff if unavailable.
>>>>>>>            */
>>>>>>>           __u64 iova;
>>>>>>>
>>>>>>>           /*
>>>>>>>            * [out] ID corresponding to the mapped memory to be
>>>>>>> used for
>>>>>>>            *   relocations or unmapping.
>>>>>>>            */
>>>>>>>           __u32 mapping_id;
>>>>>>>           /*
>>>>>>>            * [in] Flags.
>>>>>>>            */
>>>>>>>           __u32 flags;
>>>>>>>
>>>>>>>           __u32 reserved[6];
>>>>>>> };
>>>>>>
>>>>>> It looks to me that we actually need a bit different thing here.
>>>>>>
>>>>>> This MAP IOCTL maps a portion of a GEM and then returns the
>>>>>> mapping_id.
>>>>>> And I think we need something more flexible that will allow us to use
>>>>>> GEM handles for the relocation IDs, which should fit nicely with the
>>>>>> DMA-reservations.
>>>>>>
>>>>>> What about an IOCTL that wraps GEM into another GEM? We could wrap a
>>>>>> portion of GEM_A into a GEM_B, and then map the GEM_B using the MAP
>>>>>> IOCTL.
>>>>>>
>>>>>> It could be something like this:
>>>>>>
>>>>>> ### DRM_TEGRA_BO_WRAP
>>>>>>
>>>>>> struct drm_tegra_wrap_bo {
>>>>>>      __u32 bo_handle_wrapped; // out
>>>>>>      __u32 bo_handle;         // in
>>>>>>      __u64 offset;
>>>>>>      __u64 length;
>>>>>> };
>>>>>>
>>>>>> ### DRM_TEGRA_CHANNEL_MAP
>>>>>>
>>>>>> struct drm_tegra_channel_map {
>>>>>>           __u32 channels_mask;
>>>>>>      __u32 mapping_id;
>>>>>>           __u32 bo_handle;
>>>>>>           __u32 flags;
>>>>>>           __u64 iova;
>>>>>> };
>>>>>>
>>>>>> ===
>>>>>>
>>>>>> This allows multiple mapping_ids to have the same backing GEM, so the
>>>>>> mapping_id could be resolved into a BO during of job's submission for
>>>>>> the DMA-reservations handling.
>>>>>
>>>>> That's pretty much what we have already above, isn't it? Just
>>>>> because we
>>>>> call the field "mapping_id" doesn't mean that in the background we
>>>>> can't
>>>>> create a GEM object and return it's handle as "mapping_id".
>>>>>
>>>>> One advantage of Mikko's proposal is that we have a single IOCTL
>>>>> rather
>>>>> than two to create the mapping, making it a bit more lightweight.
>>>>
>>>> Thinking a bit more about it, I now changed my mind.
>>>>
>>>> There is no need to perform implicit fencing on each suballocation,
>>>> instead explicit fencing should be used for the suballocations.
>>>>
>>>> So, we will need to add the relocation flags for the direction and
>>>> explicit (or implicit) fencing per-relocation. The direction will tell
>>>> how fence should be attached to the BO's DMA-reservation, while the
>>>> fence-flag will tell whether job's scheduler should wait for the BO's
>>>> reservation before executing job on hardware. This all will be needed
>>>> for a proper DRI implementation on older Tegras.
>>>>
>>>> Actually, during of my experiments with the UAPI, I added both these
>>>> flags for the relocations [1], but really used only the direction flag
>>>> so far, relying on the implicit fencing.
>>>>
>>>> [1]
>>>> https://github.com/grate-driver/linux/blob/master/include/uapi/drm/tegra_drm.h#L894
>>>>
>>>>
>>>>
>>>> So, let's keep the current variant of this MAP IOCTL as-is.
>>>>
>>>
>>> Let me rephrase to make sure I understand:
>>>
>>> For relocations, we should add flags for direction and fencing. This way
>>> at submit time we can do the proper fencing operations on the relocated
>>> BO's DMA reservation.
>>
>> Correct
>>
>>> This sounds good to me, and I think it makes the "relocation" concept a
>>> bit more general than it is currently. I think we could rename it to
>>> something like "buffer_usage" (open to bikeshedding), and it can have
>>> fence-related flags and relocation-related flags. For newer Tegra chips
>>> we don't necessarily need to relocate, but we still may need to handle
>>> DMA reservations, so in these cases only the fencing flags would be set.
>>
>> Kernel driver already knows whether relocation needs to be patched since
>> it returns 0xffffffff by the MAP if patching is needed, and thus,
>> patching could be auto-skipped by the driver.
>>
>> I don't think that a special flag is required for telling about whether
>> relocation needs to be done. The direction and fence flags should be
>> enough for now.
> 
> Yeah, I guess it's not really required.
> 
>>
>> ===
>>
>> I'm curios what do you think about another variant:
>>
>> In the grate-kernel I'm using a BO table which contains unique BO
>> entries for each job's relocation [1] and then IDs of this table and
>> target offsets are embedded into the cmdstream in-place of the memory
>> addresses [2]. This way, when cmdstream is fully firewalled, we're
>> reading the stream's data anyways, and thus, it's quite nice to embed
>> the BO table IDs and offsets into cmdstream itself [3].
>>
>> In a result:
>>
>>   - Each job's BO is resolved only once during submission.
>>
>>   - BO table is kept small if cmdstream contains duplicated relocations.
>>
>> [1]
>> https://github.com/grate-driver/linux/blob/master/include/uapi/drm/tegra_drm.h#L892
>>
>>
>> [2]
>> https://github.com/grate-driver/linux/blob/master/include/uapi/drm/tegra_drm.h#L783
>>
>>
>> [3]
>> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/patching.c#L43
>>
>>
>> Of course this limits the number of BOs per-job. In a case of
>> grate-kernel it's max 64 BOs per-job + max 64MB for target offset. I
>> guess the BOs number could be lowered to 32 per-job, which should be a
>> bit more realistic, and then max target offset will be 128MB.
>>
>> So, we could replace the BO table with a mapping table and have the
>> MAPPING_TABLE! :) And it doesn't matter whether cmdstream patched or
>> not, either way the MAPPING_TABLE will contain mapping ID + flags.
>>
>> There are 3 possible variants of how job could be processed, depending
>> on hardware generation and driver security configuration:
>>
>>    1. Job is fully-parsed and patched.
>>    2. Job is patched-only (with relocations).
>>    3. Job isn't parsed, nor patched.
>>
>> My variant covers 1 and 3. I guess we could just ignore the case 2 for
>> now and fall back to 1, for simplicity. It shouldn't be a problem to add
>> support for the RELOCS_TABLE in addition to MAPPING_TABLE later on, if
>> will be really needed.
>>
> 
> I think the bitfield will get a bit tight once we add the 'shift' field
> and 'blocklinear' flag to it :) (which made me notice that apparently my
> original proposal has the define for
> DRM_TEGRA_SUBMIT_RELOCATION_BLOCKLINEAR, but doesn't have a flags field
> in the relocation structure, oops!)
> Both of those affect the relocation value.

The flags will be in the MAPPING_TABLE. If you'll have two mappings that
use a different modifier flag, then it should be two different entries
in the table.

The MAPPING_TABLE is similar to a RELOCATION_TABLE, but it's a bit more
flexible since it allows to avoid the duplicated entries. For example,
if we have a job that copies one area of the mapping to another area of
the same mapping, then it will be a single entry in the table.

IIUC, the shift is always a constant value for each address register,
correct? Hence, the shift value could be looked up from the address
registers table of the kernel driver for each patched relocation during
of the patching process.

> FWIW, we should design option 1 to be functional for new chips as well,
> as we need to use it e.g. if IOMMU is disabled.

Firewall also could be useful for a debugging purposes. It should work
for all hardware versions universally.
