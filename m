From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Tue, 3 Nov 2015 16:23:26 +0000
Message-ID: <5638DF7E.9080700@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <1444983957-18691-2-git-send-email-jonathanh@nvidia.com>
 <20151028070345.GF3041@vkoul-mobl.iind.intel.com>
 <5630CE5C.7070201@nvidia.com>
 <20151029015709.GE18368@vkoul-mobl.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151029015709.GE18368@vkoul-mobl.iind.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 29/10/15 01:57, Vinod Koul wrote:
> On Wed, Oct 28, 2015 at 01:32:12PM +0000, Jon Hunter wrote:
>>
>> On 28/10/15 07:03, Vinod Koul wrote:
>>> On Fri, Oct 16, 2015 at 09:25:52AM +0100, Jon Hunter wrote:
>>>> @@ -1182,14 +1182,11 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
>>>>  {
>>>>  	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
>>>>  	struct tegra_dma *tdma = tdc->tdma;
>>>> -	int ret;
>>>>  
>>>>  	dma_cookie_init(&tdc->dma_chan);
>>>>  	tdc->config_init = false;
>>>> -	ret = clk_prepare_enable(tdma->dma_clk);
>>>> -	if (ret < 0)
>>>> -		dev_err(tdc2dev(tdc), "clk_prepare_enable failed: %d\n", ret);
>>>> -	return ret;
>>>> +
>>>> +	return pm_runtime_get_sync(tdma->dev);
>>>
>>> Alloc channel is supposed to return number of descriptors allocated and if
>>> pm_runtime_get_sync() returns postive values we get wrong return!
>>
>> Yes I will fix. I assume that returning 0 is allowed if no descriptors
>> are allocated here. So much for correcting rpm usage ;-)
> 
> Yes 0 is allowed...
> 
>>>>  static int tegra_dma_pm_suspend(struct device *dev)
>>>>  {
>>>>  	struct tegra_dma *tdma = dev_get_drvdata(dev);
>>>> -	int i;
>>>> -	int ret;
>>>> +	int i, ret;
>>>>  
>>>>  	/* Enable clock before accessing register */
>>>> -	ret = tegra_dma_runtime_resume(dev);
>>>> +	ret = pm_runtime_get_sync(dev);
>>>
>>> If you are runtime suspended then core will runtime resume you before
>>> invoking suspend, so why do we need this
>>
>> Is this change now in the mainline? Do you have commit ID for that?
>>
>> I recall the last time we discussed this that Rafael said that they were
>> going to do that, but he said as a rule of thumb if you need to resume
>> it, resume it [0].
> 
> IIRC this has been always the behaviour, at least I see this when I test the
> devices

I have been doing some testing today and if the DMA is runtime
suspended, then I don't see it runtime resumed before suspend is called.

Can you elborate on "at least I see this when I test the devices"? What
are you looking at? Are you using kernel function tracers in some way?

Cheers
Jon
