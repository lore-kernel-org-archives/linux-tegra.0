From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/7] dmaengine: tegra-apb: Prevent race conditions on
 channel's freeing
Date: Thu, 2 Jan 2020 18:03:08 +0300
Message-ID: <4ac0c861-0497-3961-026b-8c05b739df7d@gmail.com>
References: <20191228204640.25163-1-digetx@gmail.com>
 <20191228204640.25163-4-digetx@gmail.com>
 <20191230204555.GB24135@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191230204555.GB24135@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.12.2019 23:45, Michał Mirosław пишет:
> On Sat, Dec 28, 2019 at 11:46:36PM +0300, Dmitry Osipenko wrote:
>> It's unsafe to check the channel's "busy" state without taking a lock,
>> it is also unsafe to assume that tasklet isn't in-fly.
> 
> 'in-flight'. Also, the patch seems to have two independent bug-fixes
> in it. Second one doesn't look right, at least not without an explanation.

Technically, this all shouldn't be needed at all since it should be a
responsibility of the DMA client drivers to make sure that channel is
idling before releasing it. But, AFAIK, the behavior of channel's
releasing isn't strictly defined by the DMA API, so it should be better
to keep the original behavior in place.

> First:
> 
>> -	if (tdc->busy)
>> -		tegra_dma_terminate_all(dc);
>> +	tegra_dma_terminate_all(dc);
> 
> Second:
> 
>> +	tasklet_kill(&tdc->tasklet);

Yes, it could be a separate change. Actually, this is not a fix, but a
clean-up change that simply stops tasklet instead of trying to work
around the fact that tasklet could be scheduled at the time channel's
freeing.

>>  	spin_lock_irqsave(&tdc->lock, flags);

I now see that missed to remove this locking since it's not needed now,
given that tasklet is already stopped after killing it by the above change.

I'll update and split this patch into two in v3.

>>  	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
>> @@ -1543,7 +1543,6 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>  		struct tegra_dma_channel *tdc = &tdma->channels[i];
>>  
>>  		free_irq(tdc->irq, tdc);
>> -		tasklet_kill(&tdc->tasklet);
>>  	}
>>  
>>  	pm_runtime_disable(&pdev->dev);
>> @@ -1563,7 +1562,6 @@ static int tegra_dma_remove(struct platform_device *pdev)
>>  	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
>>  		tdc = &tdma->channels[i];
>>  		free_irq(tdc->irq, tdc);
>> -		tasklet_kill(&tdc->tasklet);
>>  	}
>>  
>>  	pm_runtime_disable(&pdev->dev);

Thank you very much for taking a look at it!
