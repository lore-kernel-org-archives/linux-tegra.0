From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Fri, 28 Dec 2012 17:04:24 +0800
Message-ID: <50DD6098.60900@gmail.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-2-git-send-email-amerilainen@nvidia.com> <50DD407B.3030306@gmail.com> <50DD4E2C.2070104@nvidia.com> <50DD50E1.80006@gmail.com> <50DD5D6D.3090504@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50DD5D6D.3090504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/28/2012 04:50 PM, Arto Merilainen wrote:
> On 12/28/2012 09:57 AM, Mark Zhang wrote:
>> On 12/28/2012 03:45 PM, Arto Merilainen wrote:
>>> On 12/28/2012 08:47 AM, Mark Zhang wrote:
>>>>> +
>>>>> +    /* Add fences */
>>>>> +    if (num_fences) {
>>>>> +
>>>>> +        tegra_stream_push(stream,
>>>>> +            nvhost_opcode_setclass(NV_HOST1X_CLASS_ID,
>>>>> +            host1x_uclass_wait_syncpt_r(), num_fences));
>>>>> +
>>>>> +        for (; num_fences; num_fences--, fence++) {
>>>>> +            assert(tegra_fence_is_valid(fence));
>>>>
>>>> This is useless. We already add "1 + num_fences" to num_words above. So
>>>> move this "assert" before adding "1 + num_fences" to num_words makes
>>>> sense.
>>>>
>>>
>>> The assertion checks the validity of a single fence - not if there is
>>> room in the command buffer.
>>>
>>> The goal is to prevent having invalid fences in the command stream. If
>>> this check were not here it would be possible to initialise a fence with
>>> tegra_fence_clear() and put that fence into the stream.
>>
>> My idea is, if one fence is invalid, then we should not count this in
>> "num_words". In current code, if one fence is invalid, then this fence
>> will not be pushed into the command stream, and the "num_words" shows a
>> wrong command buffer size.
>>
>> So I think we should:
>> - validate the fences, remove the invalid fence
>> - update num_words
>> - then you don't need to check fence here - I mean, before push a host1x
>> syncpt wait command into the active buffer of stream.
>>
> 
> In my opinion asking tegra_stream_begin() to put a bad fence into the
> stream is a case we should never be. assert() kills the application
> immediately (in debug builds) and usually this helps the programmer for
> 1) finding bugs 2) not doing bad code.
> 

Yep, I agree. But in release builds, assert does nothing. So this
checking doesn't make sense and also a wrong fence will be pushed into
command buffer silently. And we always use release version in real
products, so we can't count on this "assert".

> "Silencing" is not a good solution especially in this case:
> tegra_stream_flush() returns an invalid fence when flushing fails. If
> the application chains submits (i.e. do a blit and then do another using
> the output of the first blit) it is crucial to be sure the first submit
> has been performed before starting the second one.
>

Yes. So I suggest doing fence checking at the beginning of the
"tegra_stream_begin", if invalid fence found, return an error.


> - Arto
