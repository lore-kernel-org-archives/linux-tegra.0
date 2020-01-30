From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 10/16] dmaengine: tegra-apb: Remove assumptions about
 unavailable runtime PM
Date: Thu, 30 Jan 2020 19:09:10 +0300
Message-ID: <742415f3-8ef5-415d-e34d-eebd893235cb@gmail.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-11-digetx@gmail.com>
 <24ca0a86-032f-2686-4dd2-6e4c5cf60223@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <24ca0a86-032f-2686-4dd2-6e4c5cf60223@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.01.2020 17:09, Jon Hunter пишет:
> 
> On 30/01/2020 04:37, Dmitry Osipenko wrote:
>> The runtime PM is always available on all Tegra SoCs since the commit
>> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"), so there is no
>> need to handle the case of unavailable RPM in the code anymore.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/dma/tegra20-apb-dma.c | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index 7158bd3145c4..22b88ccff05d 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -1429,11 +1429,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>  	spin_lock_init(&tdma->global_lock);
>>  
>>  	pm_runtime_enable(&pdev->dev);
>> -	if (!pm_runtime_enabled(&pdev->dev))
>> -		ret = tegra_dma_runtime_resume(&pdev->dev);
>> -	else
>> -		ret = pm_runtime_get_sync(&pdev->dev);
>>  
>> +	ret = pm_runtime_get_sync(&pdev->dev);
>>  	if (ret < 0)
>>  		goto err_pm_disable;
>>  
>> @@ -1546,8 +1543,6 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>  
>>  err_pm_disable:
>>  	pm_runtime_disable(&pdev->dev);
>> -	if (!pm_runtime_status_suspended(&pdev->dev))
>> -		tegra_dma_runtime_suspend(&pdev->dev);
>>  
>>  	return ret;
>>  }
>> @@ -1557,10 +1552,7 @@ static int tegra_dma_remove(struct platform_device *pdev)
>>  	struct tegra_dma *tdma = platform_get_drvdata(pdev);
>>  
>>  	dma_async_device_unregister(&tdma->dma_dev);
>> -
>>  	pm_runtime_disable(&pdev->dev);
>> -	if (!pm_runtime_status_suspended(&pdev->dev))
>> -		tegra_dma_runtime_suspend(&pdev->dev);
>>  
>>  	return 0;
>>  }
> 
> I wonder if we need to make the pm_runtime_put a pm_runtime_put_sync or
> call pm_runtime_barrier() here, to ensure it has called the callback
> when freeing the channel? Otherwise this is fine.

The explicit RPM syncing shouldn't be needed because
pm_runtime_disable() takes care of doing that for us, please take a look at:

https://elixir.bootlin.com/linux/v5.5/source/drivers/base/power/runtime.c#L1360
