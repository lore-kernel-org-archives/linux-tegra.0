From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 09/14] dmaengine: tegra-apb: Clean up runtime PM
 teardown
Date: Thu, 16 Jan 2020 20:18:11 +0300
Message-ID: <11cdf32b-23d5-8a4e-0832-3c75e90b8abe@gmail.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-10-digetx@gmail.com>
 <9a5c4f82-5653-8d81-e304-76675aff5d8f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9a5c4f82-5653-8d81-e304-76675aff5d8f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.01.2020 12:57, Jon Hunter пишет:
> 
> On 12/01/2020 17:30, Dmitry Osipenko wrote:
>> It's cleaner to teardown RPM by revering the enable sequence, which makes
>> code much easier to follow.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/dma/tegra20-apb-dma.c | 22 +++++++++++++---------
>>  1 file changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index 7158bd3145c4..cc4a9ca20780 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -1429,13 +1429,15 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>  	spin_lock_init(&tdma->global_lock);
>>  
>>  	pm_runtime_enable(&pdev->dev);
>> -	if (!pm_runtime_enabled(&pdev->dev))
>> +	if (!pm_runtime_enabled(&pdev->dev)) {
>>  		ret = tegra_dma_runtime_resume(&pdev->dev);
>> -	else
>> +		if (ret)
>> +			return ret;
>> +	} else {
>>  		ret = pm_runtime_get_sync(&pdev->dev);
>> -
>> -	if (ret < 0)
>> -		goto err_pm_disable;
>> +		if (ret < 0)
>> +			goto err_pm_disable;
>> +	}
>>  
>>  	/* Reset DMA controller */
>>  	reset_control_assert(tdma->rst);
>> @@ -1545,9 +1547,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>  	dma_async_device_unregister(&tdma->dma_dev);
>>  
>>  err_pm_disable:
>> -	pm_runtime_disable(&pdev->dev);
>> -	if (!pm_runtime_status_suspended(&pdev->dev))
>> +	if (!pm_runtime_enabled(&pdev->dev))
>>  		tegra_dma_runtime_suspend(&pdev->dev);
>> +	else
>> +		pm_runtime_disable(&pdev->dev);
>>  
>>  	return ret;
>>  }
>> @@ -1558,9 +1561,10 @@ static int tegra_dma_remove(struct platform_device *pdev)
>>  
>>  	dma_async_device_unregister(&tdma->dma_dev);
>>  
>> -	pm_runtime_disable(&pdev->dev);
>> -	if (!pm_runtime_status_suspended(&pdev->dev))
>> +	if (!pm_runtime_enabled(&pdev->dev))
>>  		tegra_dma_runtime_suspend(&pdev->dev);
>> +	else
>> +		pm_runtime_disable(&pdev->dev);
> 
> Looks like dma_async_device_unregister() will warn if a client still has
> a channel requested but does not prevent the unregister from completing.
> So it could be possible that we could be leaving the controller active now.

It's a drivers dependency bug if DMA driver's module isn't properly
refcounted and thus could be removed while it has active users. Nothing
we can do about it here, the actual source of the bug needs to be fixed.

Perhaps Tegra DMA driver could inc/dec module's refcounf on channel's
request/free, but I think it should be responsibility of the DMA core to
care about the refcounting (if it doesn't do it already).
