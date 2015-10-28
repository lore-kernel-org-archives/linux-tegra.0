From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Wed, 28 Oct 2015 13:32:12 +0000
Message-ID: <5630CE5C.7070201@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <1444983957-18691-2-git-send-email-jonathanh@nvidia.com>
 <20151028070345.GF3041@vkoul-mobl.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151028070345.GF3041-bQVUxfxUtC13uc1i7fC1zK2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 28/10/15 07:03, Vinod Koul wrote:
> On Fri, Oct 16, 2015 at 09:25:52AM +0100, Jon Hunter wrote:
>> @@ -1182,14 +1182,11 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
>>  {
>>  	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
>>  	struct tegra_dma *tdma = tdc->tdma;
>> -	int ret;
>>  
>>  	dma_cookie_init(&tdc->dma_chan);
>>  	tdc->config_init = false;
>> -	ret = clk_prepare_enable(tdma->dma_clk);
>> -	if (ret < 0)
>> -		dev_err(tdc2dev(tdc), "clk_prepare_enable failed: %d\n", ret);
>> -	return ret;
>> +
>> +	return pm_runtime_get_sync(tdma->dev);
> 
> Alloc channel is supposed to return number of descriptors allocated and if
> pm_runtime_get_sync() returns postive values we get wrong return!

Yes I will fix. I assume that returning 0 is allowed if no descriptors
are allocated here. So much for correcting rpm usage ;-)

>>  	pm_runtime_enable(&pdev->dev);
>> -	if (!pm_runtime_enabled(&pdev->dev)) {
>> +	if (!pm_runtime_enabled(&pdev->dev))
>>  		ret = tegra_dma_runtime_resume(&pdev->dev);
>> -		if (ret) {
>> -			dev_err(&pdev->dev, "dma_runtime_resume failed %d\n",
>> -				ret);
>> -			goto err_pm_disable;
>> -		}
>> -	}
>> +	else
>> +		ret = pm_runtime_get_sync(&pdev->dev);
> 
> do we need pm_runtime_get() here, should we use pm_request_resume() ?

We definitely want pm_runtime_get_sync() because pm_request_resume() is
an ASYNC resume and so does not guarantee the device is accessible after
the call returns. The pm_runtime_get variant is nice too because it
keeps track of the number of gets and puts that have occurred.

>>  static int tegra_dma_pm_suspend(struct device *dev)
>>  {
>>  	struct tegra_dma *tdma = dev_get_drvdata(dev);
>> -	int i;
>> -	int ret;
>> +	int i, ret;
>>  
>>  	/* Enable clock before accessing register */
>> -	ret = tegra_dma_runtime_resume(dev);
>> +	ret = pm_runtime_get_sync(dev);
> 
> If you are runtime suspended then core will runtime resume you before
> invoking suspend, so why do we need this

Is this change now in the mainline? Do you have commit ID for that?

I recall the last time we discussed this that Rafael said that they were
going to do that, but he said as a rule of thumb if you need to resume
it, resume it [0].

Cheers
Jon

[0] https://lkml.org/lkml/2015/8/24/845
