From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dmaengine: tegra: Use relaxed versions of readl/writel
Date: Tue, 30 Apr 2019 15:25:45 +0300
Message-ID: <cbe75689-fb54-6d5d-c7d0-91bf7ea50cbb@gmail.com>
References: <20190424231708.21219-1-digetx@gmail.com>
 <d789f1bc-44d1-abf6-a046-7cf835416e8f@nvidia.com>
 <4a315b63-bc71-3c3e-f1ae-8638bcf4033d@gmail.com>
 <bff59709-426b-32d2-08eb-d8f51cd7d5c1@nvidia.com>
 <49392c02-6dcc-9a95-0035-27c4c0d14820@gmail.com>
 <242863b9-b75e-4b37-178a-5aa03e56d3e1@gmail.com>
 <d6d1e420-6707-f446-a531-4b38e4e82c19@gmail.com>
 <20190426151157.GA19559@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426151157.GA19559@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

26.04.2019 18:11, Thierry Reding пишет:
> On Fri, Apr 26, 2019 at 04:03:08PM +0300, Dmitry Osipenko wrote:
>> 26.04.2019 15:42, Dmitry Osipenko пишет:
>>> 26.04.2019 15:18, Dmitry Osipenko пишет:
>>>> 26.04.2019 14:13, Jon Hunter пишет:
>>>>>
>>>>> On 26/04/2019 11:45, Dmitry Osipenko wrote:
>>>>>> 26.04.2019 12:52, Jon Hunter пишет:
>>>>>>>
>>>>>>> On 25/04/2019 00:17, Dmitry Osipenko wrote:
>>>>>>>> The readl/writel functions are inserting memory barrier in order to
>>>>>>>> ensure that memory stores are completed. On Tegra20 and Tegra30 this
>>>>>>>> results in L2 cache syncing which isn't a cheapest operation. The
>>>>>>>> tegra20-apb-dma driver doesn't need to synchronize generic memory
>>>>>>>> accesses, hence use the relaxed versions of the functions.
>>>>>>>
>>>>>>> Do you mean device-io accesses here as this is not generic memory?
>>>>>>
>>>>>> Yes. The IOMEM accesses within are always ordered and uncached, while
>>>>>> generic memory accesses are out-of-order and cached.
>>>>>>
>>>>>>> Although there may not be any issues with this change, I think I need a
>>>>>>> bit more convincing that we should do this given that we have had it
>>>>>>> this way for sometime and I would not like to see us introduce any
>>>>>>> regressions as this point without being 100% certain we would not.
>>>>>>> Ideally, if I had some good extensive tests I could run to hammer the
>>>>>>> DMA for all configurations with different combinations of channels
>>>>>>> running simultaneously then we could test this, but right now I don't :-(
>>>>>>>
>>>>>>> Have you ...
>>>>>>> 1. Tested both cyclic and scatter-gather transfers?
>>>>>>> 2. Stress tested simultaneous transfers with various different
>>>>>>>    configurations?
>>>>>>> 3. Quantified the actual performance benefit of this change so we can
>>>>>>>    understand how much of a performance boost this offers?
>>>>>>
>>>>>> Actually I found a case where this change causes a problem, I'm seeing
>>>>>> I2C transfer timeout for touchscreen and it breaks the touch input.
>>>>>> Indeed, I haven't tested this patch very well.
>>>>>>
>>>>>> And the fix is this:
>>>>>>
>>>>>> @@ -1592,6 +1592,8 @@ static int tegra_dma_runtime_suspend(struct device
>>>>>> *dev)
>>>>>>  						  TEGRA_APBDMA_CHAN_WCOUNT);
>>>>>>  	}
>>>>>>
>>>>>> +	dsb();
>>>>>> +
>>>>>>  	clk_disable_unprepare(tdma->dma_clk);
>>>>>>
>>>>>>  	return 0;
>>>>>>
>>>>>>
>>>>>> Apparently the problem is that CLK/DMA (PPSB/APB) accesses are
>>>>>> incoherent and CPU disables clock before writes are reaching DMA controller.
>>>>>>
>>>>>> I'd say that cyclic and scatter-gather transfers are now tested. I also
>>>>>> made some more testing of simultaneous transfers.
>>>>>>
>>>>>> Quantifying performance probably won't be easy to make as the DMA
>>>>>> read/writes are not on any kind of code's hot-path.
>>>>>
>>>>> So why make the change?
>>>>
>>>> For consistency.
>>>>
>>>>>> Jon, are you still insisting about to drop this patch or you will be
>>>>>> fine with the v2 that will have the dsb() in place?
>>>>>
>>>>> If we can't quantify the performance gain, then it is difficult to
>>>>> justify the change. I would also be concerned if that is the only place
>>>>> we need an explicit dsb.
>>>>
>>>> Maybe it won't hurt to add dsb to the ISR as well. But okay, let's drop
>>>> this patch for now.
>>>>
>>>
>>> Jon, it occurred to me that there still should be a problem with the
>>> writel() ordering in the driver because writel() ensures that memory
>>> stores are completed *before* the write occurs and hence translates into
>>> iowmb() + writel_relaxed() [0]. Thus the last write will always happen
>>> asynchronously in regards to clk accesses.
>>>
>>> [0]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/include/asm/io.h#n311
>>>
>>
>> Also please note that iowmb() translates into wmb() if
>> CONFIG_ARM_DMA_MEM_BUFFERABLE=y and sometime ago I was profiling host1x
>> driver job submission performance and have seen cases where wmb() could
>> take up to 1ms on T20 due to L2 syncing if there are outstanding memory
>> writes in the cache (or even more, I don't remember exactly already how
>> bad it was..).
> 
> This looks to be primarily caused by the fact that we have the L2X0
> cache on Tegra20. So there's not really anything that can be done there
> without potentially compromising correctness of the code.
> 
>> Altogether, I think the usage of readl/writel in pretty much all of
>> Tegra drivers is plainly wrong and explicit dsb() shall be used in
>> places where hardware synchronization is really needed.
> 
> I don't think that's an accurate observation. readl()/writel() are more
> likely to be correct than the relaxed versions. You already saw yourself
> that using the relaxed versions can easily introduce regressions.
> 
> Granted, readl()/writel() might add more memory barriers than strictly
> necessary, and therefore they might in many cases be suboptimal. But, we
> can't just go and engage in a wholesale conversion of all drivers. If we
> do this, we need to very carefully audit every conversion to make sure
> no regressions are introduced. This is especially complicated because
> these would be subtle regressions and may be difficult to catch or
> reproduce.
> 
> Also, we should avoid using primitives such as dsb in driver code to
> avoid making the code too architecture specific.

I was testing this a bit more for a couple of days and my current
conclusion that there is likely some problem that is getting masked by
writel/readl because I tried to manually insert the syncing that
writel/readl does for the relaxed versions (and more) and that slight
shuffling of the code makes the problem to occur intermittently. My
observations show that it's only the I2C-DMA that has the trouble, other
DMA clients are working fine. Maybe there is some timing problem or
missing ready-state polling somewhere, for now I don't know what's the
actual problem is.
