From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Mon, 16 Nov 2015 09:34:49 +0000
Message-ID: <5649A339.20208@nvidia.com>
References: <1447432783-7466-1-git-send-email-jonathanh@nvidia.com>
 <1447432783-7466-2-git-send-email-jonathanh@nvidia.com>
 <CAHp75VdE0G9cpgrvisSp5_zM4hK27L-=bSLQZ5=+Pyj4HcSt6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdE0G9cpgrvisSp5_zM4hK27L-=bSLQZ5=+Pyj4HcSt6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 14/11/15 13:27, Andy Shevchenko wrote:
> On Fri, Nov 13, 2015 at 6:39 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> The tegra-apb DMA driver enables runtime-pm but never calls
>> pm_runtime_get/put and hence the runtime-pm callbacks are never invoked.
>> The driver manages the clocks by directly calling clk_prepare_enable()
>> and clk_unprepare_disable().
>>
>> Fix this by replacing the clk_prepare_enable() and clk_disable_unprepare()
>> with pm_runtime_get_sync() and pm_runtime_put(), respectively. Note that
>> the consequence of this is that if runtime-pm is disabled, then the clocks
>> will remain on the entire time the driver is loaded. However, if
>> runtime-pm is disabled, then power is not most likely not a concern.
>>
> 
> Have you tested these changes somehow?

Yes.

> See my comments below.
> 
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> V3 changes:
>> - Removed unnecessary update to local variables in suspend/resume
>> V2 changes:
>> - Fixed return value for allocating channel
>> - Fixed test for return value from pm_runtime_get_sync()
>>
>> drivers/dma/tegra20-apb-dma.c | 43 ++++++++++++++++++-------------------------
>>  1 file changed, 18 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index c8f79dcaaee8..f68bccf55a24 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -1186,10 +1186,12 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
>>
>>         dma_cookie_init(&tdc->dma_chan);
>>         tdc->config_init = false;
>> -       ret = clk_prepare_enable(tdma->dma_clk);
>> +
>> +       ret = pm_runtime_get_sync(tdma->dev);
>>         if (ret < 0)
>> -               dev_err(tdc2dev(tdc), "clk_prepare_enable failed: %d\n", ret);
>> -       return ret;
>> +               return ret;
>> +
> 
>> +       return 0;
> 
> This is a non-reachable code.

No it is not.

>>  }
>>
>>  static void tegra_dma_free_chan_resources(struct dma_chan *dc)
>> @@ -1232,7 +1234,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
>>                 list_del(&sg_req->node);
>>                 kfree(sg_req);
>>         }
>> -       clk_disable_unprepare(tdma->dma_clk);
>> +       pm_runtime_put(tdma->dev);
>>
>>         tdc->slave_id = 0;
>>  }
>> @@ -1356,20 +1358,14 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>         spin_lock_init(&tdma->global_lock);
>>
>>         pm_runtime_enable(&pdev->dev);
>> -       if (!pm_runtime_enabled(&pdev->dev)) {
>> +       if (!pm_runtime_enabled(&pdev->dev))
>>                 ret = tegra_dma_runtime_resume(&pdev->dev);
> 
> I didn't check, but does this bring device to powered on state?

Yes.

Jon
