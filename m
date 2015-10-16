From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] dmaengine: tegra-apb: Disable interrupts on removal
Date: Fri, 16 Oct 2015 10:29:39 +0100
Message-ID: <5620C383.3060104@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <1444983957-18691-7-git-send-email-jonathanh@nvidia.com>
 <5620BB0E.9040400@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5620BB0E.9040400-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/10/15 09:53, Lars-Peter Clausen wrote:
> On 10/16/2015 10:25 AM, Jon Hunter wrote:
>> On driver removal, before killing any tasklets, ensure that the channel
>> interrupts are disabled so that the tasklet will not try to run during
>> or after the removal of the driver.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/dma/tegra20-apb-dma.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index 2bfab8d28b53..0dd6e7deaa8e 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -1492,6 +1492,7 @@ static int tegra_dma_remove(struct platform_device *pdev)
>>  
>>  	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
>>  		tdc = &tdma->channels[i];
>> +		disable_irq(tdc->irq);
> 
> How about just calling free_irq()? That's how you'd typically handle this.

Yes, however, the interrupt is requested by devm_request_irq(). I guess
I could call devm_free_irq() here?

Cheers
Jon
