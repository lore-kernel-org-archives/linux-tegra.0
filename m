From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] dma: tegra: set DMA_CYCLIC capability
Date: Wed, 27 Jun 2012 19:12:14 +0530
Message-ID: <4FEB0DB6.7040105@nvidia.com>
References: <1340365364-16276-1-git-send-email-ldewangan@nvidia.com> <1340803748.1562.244.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340803748.1562.244.camel@vkoul-udesk3>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 27 June 2012 06:59 PM, Vinod Koul wrote:
> On Fri, 2012-06-22 at 17:12 +0530, Laxman Dewangan wrote:
>> Tegra's APB DMA driver support the cyclic mode of data
>> transfer and hence setting the DMA_CYCLIC caps for dma
>> channels.
>>
>> This is require when generic sound dmaengine pcm driver
>> request for dma channel with CYCLIC capability.
>>
>> Signed-off-by: Laxman Dewangan<ldewangan@nvidia.com>
>> ---
>>   drivers/dma/tegra20-apb-dma.c |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index 134ea7c..b4bd50c 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -1306,6 +1306,8 @@ static int __devinit tegra_dma_probe(struct platform_device *pdev)
>>
>>   	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
>>   	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
>> +	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
>> +
>>   	tdma->dma_dev.dev =&pdev->dev;
>>   	tdma->dma_dev.device_alloc_chan_resources =
>>   					tegra_dma_alloc_chan_resources;
> What sort of testing went into this.

I used the function snd_dmaengine_pcm_open() in 
sound/soc/soc-dmaengine-pcm.c.
This fails because dmaengine_pcm_request_channel() require caps of 
DMA_CYCLIC
which is called by snd_dmaengine_pcm_open().


> I can see that you are marking descriptor complete even for cyclic case,
> that is wrong you should fix that as well. See the other drivers for
> cyclic handling of descriptors.
>

Not really,
I called dma_cookie_complete() only from the isr handle_once_dma_done() 
which is only called if it is non-cyclic mode.
