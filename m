From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Sat, 19 Aug 2017 14:51:37 +0300
Message-ID: <605615e6-2981-1443-03ad-ed37177b017c@gmail.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-2-mperttunen@nvidia.com>
 <d6d10aec-3d2a-99b3-a23d-41147478f412@gmail.com>
 <5ff98485-e8ac-75e0-ca8f-3887f8593ec4@kapsi.fi>
 <0c3682ea-3faf-0f36-eec0-3b5cf49c855c@gmail.com>
 <6979443e-ad2b-1da6-f71c-61913242f257@kapsi.fi>
 <ed7f2987-062a-fa53-6243-bd81a600e96e@gmail.com>
 <72fc513b-2626-fd86-1b98-5d2f8e89dc5f@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <72fc513b-2626-fd86-1b98-5d2f8e89dc5f-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 19.08.2017 14:32, Mikko Perttunen wrote:
> 
> 
> On 08/19/2017 02:11 PM, Dmitry Osipenko wrote:
>> On 19.08.2017 13:35, Mikko Perttunen wrote:
>>> On 08/19/2017 01:09 PM, Dmitry Osipenko wrote:
>>>> On 19.08.2017 11:10, Mikko Perttunen wrote:
>>>> [snip]
>>>>>>> +    host1x_hw_syncpt_set_protection(host, true);
>>>>>>
>>>>>> Is it really okay to force the protection? Maybe protection should be enabled
>>>>>> with a respect to CONFIG_TEGRA_HOST1X_FIREWALL? In that case we would have to
>>>>>> avoid software jobs validation for Tegra124+.
>>>>>
>>>>> I don't quite get your comment. The hardware syncpt protection layer being
>>>>> enabled should never hurt - it doesn't mess with any valid jobs. It's also
>>>>> only
>>>>> on Tegra186 so I'm not sure where the Tegra124 comes from.
>>>>
>>>> Right, it's the gather filter on T124+, my bad. This raises several questions.
>>>>
>>>> 1) Why we have CONFIG_TEGRA_HOST1X_FIREWALL? Should it be always enforced or we
>>>> actually want to be a bit more flexible and allow to disable it. Imagine that
>>>> you are making a custom application and want to utilize channels in a
>>>> different way.
>>>
>>> I think it should be up to the user to decide whether they want the firewall or
>>> not. It's clearly the most useful on the older chips - especially Tegra20 due to
>>> lack of IOMMU. The performance penalty is too great to force it on always.
>>>
>>
>> Of course there is some overhead but is not that great. Usually command buffer
>> contains just a dozen of commands. It should be an interesting challenge to
>> optimize its performance though.
>>
>>> The programming model should always be considered the same - the rules of what
>>> you are allowed to do are the same whether the firewall, or any
>>> hardware-implemented protection features, are on or not.
>>>
>>
>> Well, okay.
>>
>>>>
>>>> 2) Since syncpoint protection is a T186 feature, what about previous
>>>> generations? Should we validate syncpoints in software for them? We have
>>>> 'syncpoint validation' patch staged in grate's kernel
>>>> https://github.com/grate-driver/linux/commit/c8b6c82173f2ee9fead23380e8330b8099e7d5e7
>>>>
>>>>
>>>> (I'll start sending out this and other patches after a bit more thorough
>>>> testing.) Improperly used syncpoints potentially could allow one program to
>>>> damage others.
>>>
>>> Yes, I think the firewall should have this feature for older generations. We
>>> could disable the check on Tegra186, as you point towards in question 4.
>>>
>>>>
>>>> 3) What exactly does gather filter? Could you list all the commands that it
>>>> filters out, please?
>>>
>>> According to the Tegra186 TRM (section 16.8.32), SETCLASS, SETSTRMID and EXTEND
>>> are filtered.
>>>
>>
>> Okay, then what about SETSTRMID command, I don't see its disassembly in the
>> host1x gather debug dump. Is it accidentally missed?
>>
> 
> True, it's a new command in Tegra186 and I missed adding it to the disassembler.
> It's probably fine to add it in another patch since it's only intended for
> kernel use and it's useless without IOMMU support anyway (which we don't have
> currently on Tegra186).
> 

Yeah, but it probably would be more preferable that this patch would predate the
"gather filter" enabling.

>>>>
>>>> 4) What about T30/T114 that do not have gather filter? Should we validate those
>>>> commands for them in a software firewall?
>>>
>>> Yes, the firewall should validate that.
>>>
>>>>
>>>> So maybe we should implement several layers of validation in the SW firewall.
>>>> Like all layers for T20 (memory boundaries validation etc), software gather
>>>> filter for T30/114 and software syncpoint validation for T30/114/124/210.
>>>>
>>>
>>> That seems like a good idea.
>>
>> Alright, factoring out firewall from job.c probably should be the first step.
>>


-- 
Dmitry
