From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of: Rework and simplify phandle cache to use a fixed size
Date: Mon, 13 Jan 2020 11:12:23 +0000
Message-ID: <93314ff5-aa89-cd99-393c-f75f31d9d6e5@nvidia.com>
References: <20191211232345.24810-1-robh@kernel.org>
 <5386e959-f9c4-2748-ed08-34ab361aee2c@nvidia.com>
 <CAL_JsqLmth0bYcG2VnxU-jk_VoC4TgvWD8_e6r1_8WqVwYGq0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLmth0bYcG2VnxU-jk_VoC4TgvWD8_e6r1_8WqVwYGq0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 10/01/2020 23:50, Rob Herring wrote:
> On Tue, Jan 7, 2020 at 4:22 AM Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> Hi Rob,
>>
>> On 11/12/2019 23:23, Rob Herring wrote:
>>> The phandle cache was added to speed up of_find_node_by_phandle() by
>>> avoiding walking the whole DT to find a matching phandle. The
>>> implementation has several shortcomings:
>>>
>>>   - The cache is designed to work on a linear set of phandle values.
>>>     This is true for dtc generated DTs, but not for other cases such as
>>>     Power.
>>>   - The cache isn't enabled until of_core_init() and a typical system
>>>     may see hundreds of calls to of_find_node_by_phandle() before that
>>>     point.
>>>   - The cache is freed and re-allocated when the number of phandles
>>>     changes.
>>>   - It takes a raw spinlock around a memory allocation which breaks on
>>>     RT.
>>>
>>> Change the implementation to a fixed size and use hash_32() as the
>>> cache index. This greatly simplifies the implementation. It avoids
>>> the need for any re-alloc of the cache and taking a reference on nodes
>>> in the cache. We only have a single source of removing cache entries
>>> which is of_detach_node().
>>>
>>> Using hash_32() removes any assumption on phandle values improving
>>> the hit rate for non-linear phandle values. The effect on linear values
>>> using hash_32() is about a 10% collision. The chances of thrashing on
>>> colliding values seems to be low.
>>>
>>> To compare performance, I used a RK3399 board which is a pretty typical
>>> system. I found that just measuring boot time as done previously is
>>> noisy and may be impacted by other things. Also bringing up secondary
>>> cores causes some issues with measuring, so I booted with 'nr_cpus=1'.
>>> With no caching, calls to of_find_node_by_phandle() take about 20124 us
>>> for 1248 calls. There's an additional 288 calls before time keeping is
>>> up. Using the average time per hit/miss with the cache, we can calculate
>>> these calls to take 690 us (277 hit / 11 miss) with a 128 entry cache
>>> and 13319 us with no cache or an uninitialized cache.
>>>
>>> Comparing the 3 implementations the time spent in
>>> of_find_node_by_phandle() is:
>>>
>>> no cache:        20124 us (+ 13319 us)
>>> 128 entry cache:  5134 us (+ 690 us)
>>> current cache:     819 us (+ 13319 us)
>>>
>>> We could move the allocation of the cache earlier to improve the
>>> current cache, but that just further complicates the situation as it
>>> needs to be after slab is up, so we can't do it when unflattening (which
>>> uses memblock).
>>>
>>> Reported-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>>> Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
>>> Cc: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>>> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> With next-20200106 I have noticed a regression on Tegra210 where it
>> appears that only one of the eMMC devices is being registered. Bisect is
>> pointing to this patch and reverting on top of next fixes the problem.
>> That is as far as I have got so far, so if you have any ideas, please
>> let me know. Unfortunately, there do not appear to be any obvious errors
>> from the bootlog.
> 
> I guess that's tegra210-p2371-2180.dts because none of the others have
> 2 SD hosts enabled. I don't see anything obvious though. Are you doing
> any runtime mods to the DT?

I have noticed that the bootloader is doing some runtime mods and so
checking if this is the cause. I will let you know, but most likely,
seeing as I cannot find anything wrong with this change itself.

Cheers
Jon

-- 
nvpublic
