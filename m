From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/10] gpu: host1x: Lock classes during job submission
Date: Tue, 5 Dec 2017 16:43:27 +0300
Message-ID: <13306780-4a59-dda0-bf46-ecdf92d66e14@gmail.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-5-mperttunen@nvidia.com>
 <97ce4873-fdc1-5197-17bc-74505beadfc4@gmail.com>
 <ef08d3d8-94a7-8804-c339-5310719333f3@kapsi.fi>
 <dc39398b-ea49-6e97-28ba-652f8b49db44@gmail.com>
 <2b4d9283-dabe-9e1f-f8cb-6ddbc16e3f0f@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2b4d9283-dabe-9e1f-f8cb-6ddbc16e3f0f-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.12.2017 16:21, Mikko Perttunen wrote:
> On 07.11.2017 23:23, Dmitry Osipenko wrote:
>> On 07.11.2017 15:28, Mikko Perttunen wrote:
>>> On 05.11.2017 18:46, Dmitry Osipenko wrote:
>>>> On 05.11.2017 14:01, Mikko Perttunen wrote:
>>>>> ...
>>>>>
>>>>> +static int mlock_id_for_class(unsigned int class)
>>>>> +{
>>>>> +#if HOST1X_HW >= 6
>>>>> +    switch (class)
>>>>> +    {
>>>>> +    case HOST1X_CLASS_HOST1X:
>>>>> +        return 0;
>>>>> +    case HOST1X_CLASS_VIC:
>>>>> +        return 17;
>>>>
>>>> What is the meaning of returned ID values that you have defined here? Why VIC
>>>> should have different ID on T186?
>>>
>>> On T186, MLOCKs are not "generic" - the HW knows that each MLOCK corresponds to
>>> a specific class. Therefore we must map that correctly.
>>>
>>
>> Okay.
>>
>>>>
>>>>> +    default:
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +#else
>>>>> +    switch (class)
>>>>> +    {
>>>>> +    case HOST1X_CLASS_HOST1X:
>>>>> +        return 0;
>>>>> +    case HOST1X_CLASS_GR2D:
>>>>> +        return 1;
>>>>> +    case HOST1X_CLASS_GR2D_SB:
>>>>> +        return 2;
>>>>
>>>> Note that we are allowing to switch 2d classes in the same jobs context and
>>>> currently jobs class is somewhat hardcoded to GR2D.
>>>>
>>>> Even though that GR2D and GR2D_SB use different register banks, is it okay to
>>>> trigger execution of different classes simultaneously? Would syncpoint
>>>> differentiate classes on OP_DONE event?
>>>
>>> Good point, we might need to use the same lock for these two.
>>>
>>>>
>>>> I suppose that MLOCK (the module lock) implies the whole module locking,
>>>> wouldn't it make sense to just use the module ID's defined in the TRM?
>>>
>>> Can you point out where these are defined?
>>
>> See INDMODID / REGF_MODULEID fields of HOST1X_CHANNEL_INDOFF2_0 /
>> HOST1X_SYNC_REGF_ADDR_0 registers, bit numbers of HOST1X_SYNC_INTSTATUS_0 /
>> HOST1X_SYNC_INTC0MASK_0 / HOST1X_SYNC_MOD_TEARDOWN_0.
> 
> These values look like they would work on T20, but at least on T124 the module
> numbering for modules we want to lock goes above the number of MLOCKs so the
> indexing scheme would not work there..
> 

Indeed, for some reason I was thinking that there are 32 MLOCK's instead of 16.
