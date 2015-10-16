From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/6] dmaengine: tegra-apb: Disable interrupts on removal
Date: Fri, 16 Oct 2015 11:57:02 +0100
Message-ID: <5620D7FE.2010205@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <1444983957-18691-7-git-send-email-jonathanh@nvidia.com>
 <5620BB0E.9040400@metafoo.de> <5620C383.3060104@nvidia.com>
 <5620D42A.8060007@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5620D42A.8060007@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 16/10/15 11:40, Lars-Peter Clausen wrote:
> On 10/16/2015 11:29 AM, Jon Hunter wrote:
>>
>> On 16/10/15 09:53, Lars-Peter Clausen wrote:
>>> On 10/16/2015 10:25 AM, Jon Hunter wrote:
>>>> On driver removal, before killing any tasklets, ensure that the channel
>>>> interrupts are disabled so that the tasklet will not try to run during
>>>> or after the removal of the driver.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>  drivers/dma/tegra20-apb-dma.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>>>> index 2bfab8d28b53..0dd6e7deaa8e 100644
>>>> --- a/drivers/dma/tegra20-apb-dma.c
>>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>>> @@ -1492,6 +1492,7 @@ static int tegra_dma_remove(struct platform_device *pdev)
>>>>  
>>>>  	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
>>>>  		tdc = &tdma->channels[i];
>>>> +		disable_irq(tdc->irq);
>>>
>>> How about just calling free_irq()? That's how you'd typically handle this.
>>
>> Yes, however, the interrupt is requested by devm_request_irq(). I guess
>> I could call devm_free_irq() here?
> 
> Just use request_irq() instead of devm_request_irq(). You have the same
> issue on the error path in the probe function anyway and also need to add
> the free_irq() before the tasklet_kill() there as well.

I was wondering about that but the tasklets should never be scheduled if
the probe does not succeed, so I think it is ok.

Jon
