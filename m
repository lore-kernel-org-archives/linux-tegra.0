From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] soc/tegra: fuse: Fix reading registers using DMA
 on Tegra20
Date: Thu, 5 Oct 2017 15:41:28 +0300
Message-ID: <284d012b-1a73-3e2e-7094-f63c413780dc@gmail.com>
References: <cover.1507068874.git.digetx@gmail.com>
 <1fe535d4655ae00199a8d60768b384e87df3ed51.1507068874.git.digetx@gmail.com>
 <d0e89b75-a223-2509-e8f5-bc38736346aa@nvidia.com>
 <9398d8e6-5a8d-7965-ebf8-9825c1fb3a06@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9398d8e6-5a8d-7965-ebf8-9825c1fb3a06-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.10.2017 15:22, Jon Hunter wrote:
> 
> On 04/10/17 11:47, Jon Hunter wrote:
>>
>> On 03/10/17 23:35, Dmitry Osipenko wrote:
>>> DMA config is incorrect, because of it DMA transfer is never issued and
>>> tegra20_fuse_read() always returns 0x0.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/soc/tegra/fuse/fuse-tegra.c   | 1 +
>>>  drivers/soc/tegra/fuse/fuse-tegra20.c | 3 ++-
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
>>> index b7c552e3133c..73a3a2c74021 100644
>>> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
>>> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
>>> @@ -132,6 +132,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
>>>  
>>>  	/* take over the memory region from the early initialization */
>>>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	fuse->phys = res->start;
>>>  	fuse->base = devm_ioremap_resource(&pdev->dev, res);
>>>  	if (IS_ERR(fuse->base))
>>>  		return PTR_ERR(fuse->base);
>>> diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
>>> index 294413a969a0..a33f48c06771 100644
>>> --- a/drivers/soc/tegra/fuse/fuse-tegra20.c
>>> +++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
>>> @@ -59,7 +59,7 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
>>>  
>>>  	mutex_lock(&fuse->apbdma.lock);
>>>  
>>> -	fuse->apbdma.config.src_addr = fuse->apbdma.phys + FUSE_BEGIN + offset;
>>> +	fuse->apbdma.config.src_addr = fuse->phys + FUSE_BEGIN + offset;
>>>  
>>>  	err = dmaengine_slave_config(fuse->apbdma.chan, &fuse->apbdma.config);
>>>  	if (err)
>>> @@ -119,6 +119,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
>>>  	fuse->apbdma.config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>  	fuse->apbdma.config.src_maxburst = 1;
>>>  	fuse->apbdma.config.dst_maxburst = 1;
>>> +	fuse->apbdma.config.direction = DMA_DEV_TO_MEM;
>>>  
>>>  	init_completion(&fuse->apbdma.wait);
>>>  	mutex_init(&fuse->apbdma.lock);
>>
>> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> BTW, if you do rev this series, then maybe it is worth explicitly
> setting 'fuse->apbdma.config.device_fc = false'.
> 

I'll make v3 for sure. Setting device_fc isn't strictly needed, but it is good
to have for expressiveness. I'll add it to v3, thanks.
