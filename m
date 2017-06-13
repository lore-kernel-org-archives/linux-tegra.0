From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 13/22] gpu: host1x: Do not leak BO's phys address to
 userspace
Date: Tue, 13 Jun 2017 22:56:49 +0300
Message-ID: <7f48b716-cff3-3fbb-a5c4-083c0c00e8b3@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <0a7594fdecc4298f684ed55fda5c5b1be9c443ec.1495498184.git.digetx@gmail.com>
 <00e5e6d5-def4-a4f6-df93-9505be13c4be@kapsi.fi>
 <5e197807-ef57-604f-879d-7be691785a60@gmail.com>
 <3c0df318-d1d9-60fc-81e4-0cfa871b28e1@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3c0df318-d1d9-60fc-81e4-0cfa871b28e1-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13.06.2017 22:03, Mikko Perttunen wrote:
> 
> 
> On 06/13/2017 09:21 PM, Dmitry Osipenko wrote:
>> On 13.06.2017 20:31, Mikko Perttunen wrote:
>>> On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
>>>> Do gathers coping before patching them, so the original gathers are left
>>>> untouched. That's not as bad as leaking a kernel addresses, but still
>>>> doesn't feel right.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>    drivers/gpu/host1x/job.c | 44 ++++++++++++++++++++++++++++++--------------
>>>>    1 file changed, 30 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>>>> index 14f3f957ffab..190353944d23 100644
>>>> --- a/drivers/gpu/host1x/job.c
>>>> +++ b/drivers/gpu/host1x/job.c
>>>> @@ -137,8 +137,9 @@ static void host1x_syncpt_patch_offset(struct
>>>> host1x_syncpt *sp,
>>>>     * avoid a wrap condition in the HW).
>>>>     */
>>>>    static int do_waitchks(struct host1x_job *job, struct host1x *host,
>>>> -               struct host1x_bo *patch)
>>>> +               struct host1x_job_gather *g)
>>>>    {
>>>> +    struct host1x_bo *patch = g->bo;
>>>>        int i;
>>>>          /* compare syncpt vs wait threshold */
>>>> @@ -165,7 +166,8 @@ static int do_waitchks(struct host1x_job *job, struct
>>>> host1x *host,
>>>>                    wait->syncpt_id, sp->name, wait->thresh,
>>>>                    host1x_syncpt_read_min(sp));
>>>>    -            host1x_syncpt_patch_offset(sp, patch, wait->offset);
>>>> +            host1x_syncpt_patch_offset(sp, patch,
>>>> +                           g->offset + wait->offset);
>>>>            }
>>>>              wait->bo = NULL;
>>>> @@ -269,11 +271,12 @@ static unsigned int pin_job(struct host1x *host, struct
>>>> host1x_job *job)
>>>>        return err;
>>>>    }
>>>>    -static int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
>>>> +static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
>>>>    {
>>>>        int i = 0;
>>>>        u32 last_page = ~0;
>>>>        void *cmdbuf_page_addr = NULL;
>>>> +    struct host1x_bo *cmdbuf = g->bo;
>>>>          /* pin & patch the relocs for one gather */
>>>>        for (i = 0; i < job->num_relocs; i++) {
>>>> @@ -286,7 +289,8 @@ static int do_relocs(struct host1x_job *job, struct
>>>> host1x_bo *cmdbuf)
>>>>            if (cmdbuf != reloc->cmdbuf.bo)
>>>>                continue;
>>>>    -        if (last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
>>>> +        if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) &&
>>>> +            last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
>>>>                if (cmdbuf_page_addr)
>>>>                    host1x_bo_kunmap(cmdbuf, last_page,
>>>>                             cmdbuf_page_addr);
>>>> @@ -301,11 +305,20 @@ static int do_relocs(struct host1x_job *job, struct
>>>> host1x_bo *cmdbuf)
>>>>                }
>>>>            }
>>>>    +        if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
>>>> +            cmdbuf_page_addr = job->gather_copy_mapped;
>>>> +            cmdbuf_page_addr += g->offset;
>>>> +        }
>>>> +
>>>>            target = cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
>>>> +
>>>> +        if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
>>>> +            target += (reloc->cmdbuf.offset & PAGE_MASK) >> 2;
>>>> +
>>>>            *target = reloc_addr;
>>>
>>> I think this logic would be cleaner like ..
>>>
>>> if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
>>>    target = job->gather_copy_mapped + g->offset + reloc->cmdbuf.offset;
>>>    ...
>>> } else {
>>>    if (last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
>>>      ...
>>>    }
>>>    target = cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
>>> }
>>> *target = reloc_addr
>>>
>>
>> What about this variant?
>>
>> -static int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
>> +static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
>>   {
>>       int i = 0;
>>       u32 last_page = ~0;
>>       void *cmdbuf_page_addr = NULL;
>> +    struct host1x_bo *cmdbuf = g->bo;
>>
>>       /* pin & patch the relocs for one gather */
>>       for (i = 0; i < job->num_relocs; i++) {
>> @@ -286,6 +289,12 @@ static int do_relocs(struct host1x_job *job, struct
>> host1x_bo *cmdbuf)
>>           if (cmdbuf != reloc->cmdbuf.bo)
>>               continue;
>>
>> +        if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
>> +            cmdbuf_page_addr = job->gather_copy_mapped + g->offset;
> 
> This no longer represents the address of a page, so I think it would be better
> to just assign the final value to target.
> 
>> +            target = cmdbuf_page_addr + reloc->cmdbuf.offset;
>> +            goto patch_reloc;
>> +        }
>> +
>>           if (last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
>>               if (cmdbuf_page_addr)
>>                   host1x_bo_kunmap(cmdbuf, last_page,
>> @@ -302,10 +311,11 @@ static int do_relocs(struct host1x_job *job, struct
>> host1x_bo *cmdbuf)
>>           }
>>
>>           target = cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
>> +patch_reloc:
>>           *target = reloc_addr;
>>       }
>>
>> -    if (cmdbuf_page_addr)
>> +    if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && cmdbuf_page_addr)
> 
> And then we wouldn't need the IS_ENABLED here
> 
>>           host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
>>
>>       return 0;
>>
> with that change, looks good to me
> 

Thank you very much for the suggestion.

>>>>        }
>>>>    -    if (cmdbuf_page_addr)
>>>> +    if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && cmdbuf_page_addr)
>>>>            host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
>>>>          return 0;
>>>> @@ -573,6 +586,12 @@ int host1x_job_pin(struct host1x_job *job, struct device
>>>> *dev)
>>>>        if (err)
>>>>            goto out;
>>>>    +    if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
>>>> +        err = copy_gathers(job, dev);
>>>> +        if (err)
>>>> +            goto out;
>>>> +    }
>>>> +
>>>>        /* patch gathers */
>>>>        for (i = 0; i < job->num_gathers; i++) {
>>>>            struct host1x_job_gather *g = &job->gathers[i];
>>>> @@ -581,7 +600,8 @@ int host1x_job_pin(struct host1x_job *job, struct device
>>>> *dev)
>>>>            if (g->handled)
>>>>                continue;
>>>>    -        g->base = job->gather_addr_phys[i];
>>>> +        if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
>>>> +            g->base = job->gather_addr_phys[i];
>>>
>>> Perhaps add a comment here like "copy_gathers sets base when firewall is
>>> enabled"
>>>
>>
>> Okay, added. Thank you for the review comments!
>>


-- 
Dmitry
