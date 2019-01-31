From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 18:02:45 +0300
Message-ID: <bdb5ab9f-b047-6b9e-696a-8d6ef4065c77@gmail.com>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
 <1548864096-20974-3-git-send-email-skomatineni@nvidia.com>
 <1f10cb76-59a1-93c5-ae03-ccc0cd8db1a3@gmail.com>
 <20190131120640.GF23438@ulmo>
 <0e832fa6-f143-7b24-2685-b88a55e77e51@gmail.com>
 <20190131144344.GP23438@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131144344.GP23438@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.01.2019 17:43, Thierry Reding пишет:
> On Thu, Jan 31, 2019 at 05:06:18PM +0300, Dmitry Osipenko wrote:
>> 31.01.2019 15:06, Thierry Reding пишет:
>>> On Thu, Jan 31, 2019 at 03:05:48AM +0300, Dmitry Osipenko wrote:
>>>> 30.01.2019 19:01, Sowjanya Komatineni пишет:
>>> [...]
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> [...]
>>>>> +		return -EIO;
>>>>> +	}
>>>>> +
>>>>> +	dma_desc->callback = tegra_i2c_dma_complete;
>>>>> +	dma_desc->callback_param = i2c_dev;
>>>>> +	dmaengine_submit(dma_desc);
>>>>> +	dma_async_issue_pending(chan);
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int tegra_i2c_init_dma_param(struct tegra_i2c_dev *i2c_dev,
>>>>> +				    bool dma_to_memory)
>>>>> +{
>>>>> +	struct dma_chan *dma_chan;
>>>>> +	u32 *dma_buf;
>>>>> +	dma_addr_t dma_phys;
>>>>> +	int ret;
>>>>> +	const char *chan_name = dma_to_memory ? "rx" : "tx";
>>>>
>>>> What about to move out chan_name into the function arguments?
>>>
>>> That opens up the possibility of passing dma_to_memory = true and
>>> chan_name as "tx" and create an inconsistency.
>>>
>>>>> @@ -884,6 +1187,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>>>>>  
>>>>>  	i2c_dev->is_multimaster_mode = of_property_read_bool(np,
>>>>>  			"multi-master");
>>>>> +
>>>>> +	i2c_dev->has_dma = of_property_read_bool(np, "dmas");
>>>>
>>>> Not only the existence of "dmas" property defines whether DMA is available. DMA subsystem could be disabled in the kernels configuration.
>>>>
>>>> Hence there is a need to check for DMA driver presence in the code:
>>>>
>>>> 	if (IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
>>>> 		i2c_dev->has_dma = of_property_read_bool(np, "dmas");
>>>
>>> Do we even need the ->has_dma at all? We can just go ahead and request
>>> the channels at probe time and respond accordingly. If there's no dmas
>>> property in DT, dma_request_slave_channel_reason() returns an error so
>>> we can just deal with it at that time.
>>>
>>> So if we get -EPROBE_DEFER we can propagate that, for any other errors
>>> we can simply fallback to PIO. Or perhaps we want to restrict fallback
>>> to PIO for -ENODEV?
>>>
>>> I wouldn't want to add an IS_ENABLED(CONFIG_TEGRA20_APB_DMA) in here.
>>> The purpose of these subsystems it to abstract all of that away.
>>> Otherwise we could just as well use custom APIs, if we're tying together
>>> drivers in this way anyway.
>>
>> DMA API doesn't fully abstract the dependencies between drivers, hence
>> I disagree.
> 
> Why not? The dependency we're talking about here is a runtime dependency
> rather than a build time dependency. Kconfig is really all about build-
> time dependencies.

My understanding is that Kconfig is also about runtime dependencies, do you know if it's explicitly documented anywhere?

>>>> Also Tegra I2C driver should select DMA driver in Kconfig to make DMA
>>>> driver built-in when I2C driver is built-in:
>>>
>>> I don't think there's a requirement for that. The only dependency we
>>> really have here is the one on the DMA engine API. Since dmaengine.h
>>> already provides dummy implementations, there's really no need for
>>> us to have the dependency. If the DMA engine API is completely disabled,
>>> a call to dma_request_slave_channel_reason() will return -ENODEV and we
>>> should just deal with that the same way we would if there was no "dmas"
>>> property present.
>>
>> In my opinion it is much better to avoid I2C driver probe failing with
>> -EPROBE_DEFER if we could. It's just one line in code and one in
>> Kconfig.. really. 
> 
> The problem is that from a theoretical point of view we don't know that
> APB DMA is the provider for the DMA channels. This provider could be a
> completely different device on a different Tegra generation (in fact,
> the DMA engine on Tegra186 is a different one, so we'd have to add that
> to the list of checks to make sure we don't disable DMA there). And the
> fact that we're tightly integrated is really only by accident. We could
> have the same situation on a SoC that incorporates IP from multiple
> different sources and multiple combinations thereof as well, so how
> would you want to deal with those cases?
> 
> Agreed, failing with -EPROBE_DEFER is suboptimal in that case, but that
> is really more of an integration problem. Ideally of course there'd be
> some way for the DMA engine subsystem to know that the provider for the
> given device node will never show up and give us -ENODEV instead, but,
> alas, I don't even think that would be possible. That's the price to pay
> for abstraction.

It's not a big problem to solve for this case, there is of_machine_is_compatible(). To me it's more a question about the will to invest some extra effort to support all of possible combinations. If there is no such will, then at least those unpopular combinations shouldn't hurt and thus it should make sense to add an explicit build-dependency on the DMA drivers.
