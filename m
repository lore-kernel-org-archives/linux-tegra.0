From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Fix runtime PM imbalance on
 error
Date: Fri, 22 May 2020 12:27:39 +0100
Message-ID: <e2274ef7-2c33-cd3a-319f-45c5c27cff3e@nvidia.com>
References: <20200522075846.30706-1-dinghao.liu@zju.edu.cn>
 <967c17d2-6b57-27f0-7762-cd0835caaec9@nvidia.com>
 <45d18e3c.bfdab.1723c07b7d3.Coremail.dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <45d18e3c.bfdab.1723c07b7d3.Coremail.dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Cc: kjlu-OJFnDUYgAso@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 22/05/2020 11:57, dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org wrote:
>>
>> On 22/05/2020 08:58, Dinghao Liu wrote:
>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>> when it returns an error code. Thus a pairing decrement is needed on
>>> the error handling path to keep the counter balanced.
>>>
>>> Signed-off-by: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
>>> ---
>>>  drivers/dma/tegra210-adma.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
>>> index c4ce5dfb149b..803e1f4d5dac 100644
>>> --- a/drivers/dma/tegra210-adma.c
>>> +++ b/drivers/dma/tegra210-adma.c
>>> @@ -658,6 +658,7 @@ static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
>>>  
>>>  	ret = pm_runtime_get_sync(tdc2dev(tdc));
>>>  	if (ret < 0) {
>>> +		pm_runtime_put_sync(tdc2dev(tdc));
>>>  		free_irq(tdc->irq, tdc);
>>>  		return ret;
>>>  	}
>>>
>>
>>
>> There is another place in probe that needs to be fixed as well. Can you
>> correct this while you are at it?
>>
>> Thanks
>> Jon
>>
>> -- 
>> nvpublic
> 
> Sure. I have sent a patch to fix PM imbalance in tegra_adma_probe().


You should only send one patch to fix both instances as it is the same
driver. It is impossible to figure out that two patches with the same
$subject are different.

Jon

-- 
nvpublic
