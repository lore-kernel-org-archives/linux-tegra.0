From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: fix of_irq_get() error check
Date: Mon, 31 Jul 2017 12:57:57 +0300
Message-ID: <0102e75c-d1be-e274-808b-f9d3f434924d@cogentembedded.com>
References: <20170730181051.733168837@cogentembedded.com>
 <20170731093057.GA26667@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170731093057.GA26667@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello!

On 7/31/2017 12:30 PM, Thierry Reding wrote:

>> of_irq_get() may return 0 as well as negative error number on failure,
>> while the driver only checks for the negative values. The driver would then
>> call request_irq(0, ...) in tegra_adma_alloc_chan_resources() and never get
>> valid channel interrupt.
>>
>> Check for 'tdc->irq <= 0' instead and return -ENXIO from the driver's probe
>> iff of_irq_get() returned 0.
>>
>> Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADMA")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>>   drivers/dma/tegra210-adma.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Yeah, that interface isn't very optimal. The problem with it, and we've
> had this kind before, is that every driver ends up having to implement a
> fallback for == 0 with the result of everyone returning a different
> error code.

    Agreed.

> Perhaps a good long-term solution would be to fix of_irq_get() to only
> return positive for valid interrupts and negative error codes, so that
> nobody has to deal with == 0 anymore.

     See http://marc.info/?t=146447243300002&r=1 for my attempt to do this 
back in 2016.

> That's obviously going to be a fairly big undertaking, so I'm fine with
> fixing up the individual callsites first.
> 
>> Index: slave-dma/drivers/dma/tegra210-adma.c
>> ===================================================================
>> --- slave-dma.orig/drivers/dma/tegra210-adma.c
>> +++ slave-dma/drivers/dma/tegra210-adma.c
>> @@ -717,8 +717,8 @@ static int tegra_adma_probe(struct platf
>>   		tdc->chan_addr = tdma->base_addr + ADMA_CH_REG_OFFSET(i);
>>   
>>   		tdc->irq = of_irq_get(pdev->dev.of_node, i);
>> -		if (tdc->irq < 0) {
>> -			ret = tdc->irq;
>> +		if (tdc->irq <= 0) {
>> +			ret = tdc->irq ?: -ENXIO;
>>   			goto irq_dispose;
>>   		}
>>   
> 
> I think in this particular case it would be better to just call
> platform_get_irq(), which already implements the equivalent.

    OK, I'll try looking into that...

> Thierry

MBR, Sergei
