From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Fri, 28 Dec 2012 09:45:48 +0200
Message-ID: <50DD4E2C.2070104@nvidia.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-2-git-send-email-amerilainen@nvidia.com> <50DD407B.3030306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50DD407B.3030306-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/28/2012 08:47 AM, Mark Zhang wrote:
>> +int tegra_fence_is_valid(const struct tegra_fence *fence)
>> +{
>> +    int valid = fence ? 1 : 0;
>> +    valid = valid && fence->id != (uint32_t) -1;
>> +    valid = valid && fence->id < 32;
>
> Hardcode here. Assume always has 32 syncpts.
> Change to a micro wrapped with tegra version ifdef will be better.
>

You are correct. I will fix this.

>> +    return valid;
>> +}
>> +
> [...]
>> +
>> +    /* Add fences */
>> +    if (num_fences) {
>> +
>> +        tegra_stream_push(stream,
>> +            nvhost_opcode_setclass(NV_HOST1X_CLASS_ID,
>> +            host1x_uclass_wait_syncpt_r(), num_fences));
>> +
>> +        for (; num_fences; num_fences--, fence++) {
>> +            assert(tegra_fence_is_valid(fence));
>
> This is useless. We already add "1 + num_fences" to num_words above. So
> move this "assert" before adding "1 + num_fences" to num_words makes sense.
>

The assertion checks the validity of a single fence - not if there is 
room in the command buffer.

The goal is to prevent having invalid fences in the command stream. If 
this check were not here it would be possible to initialise a fence with 
tegra_fence_clear() and put that fence into the stream.

>> +
>> +            tegra_stream_push(stream, nvhost_class_host_wait_syncpt(fence->id,
>> +                fence->value));
>> +        }
>> +    }
>> +
>> +    if (class_id)
>> +        tegra_stream_push(stream, nvhost_opcode_setclass(class_id, 0, 0));
>> +
>> +    return 0;
>> +}
>> +
> [...]
>> +
>> +#endif /* TEGRA_DRMIF_H */
>>

- Arto
