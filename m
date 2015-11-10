From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Tue, 10 Nov 2015 09:57:19 +0000
Message-ID: <5641BF7F.9000809@nvidia.com>
References: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
 <1447075429-27311-2-git-send-email-jonathanh@nvidia.com>
 <CAHp75Vd2SgjvCe+8buU98EawVDXGHk8hqWCLFVvVpshTFZSKHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75Vd2SgjvCe+8buU98EawVDXGHk8hqWCLFVvVpshTFZSKHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 09/11/15 13:57, Andy Shevchenko wrote:
> On Mon, Nov 9, 2015 at 3:23 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
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
> 
> Nitpick
> 
>> @@ -1539,11 +1534,10 @@ static int tegra_dma_runtime_resume(struct device *dev)
>>  static int tegra_dma_pm_suspend(struct device *dev)
>>  {
>>         struct tegra_dma *tdma = dev_get_drvdata(dev);
>> -       int i;
>> -       int ret;
>> +       int i, ret;
> 
>>  static int tegra_dma_pm_resume(struct device *dev)
>>  {
>>         struct tegra_dma *tdma = dev_get_drvdata(dev);
>> -       int i;
>> -       int ret;
>> +       int i, ret;
> 
> Do you really need that?

Rhetorical question? ;-)

I can drop that.

Jon
