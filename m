From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: fix of_irq_get() error check
Date: Mon, 31 Jul 2017 21:11:50 +0100
Message-ID: <7f45e718-bf46-fde7-5811-c29221360cfb@nvidia.com>
References: <20170730181051.733168837@cogentembedded.com>
 <20170731093057.GA26667@ulmo>
 <0102e75c-d1be-e274-808b-f9d3f434924d@cogentembedded.com>
 <49996233-5ccd-58e6-db00-b5d402ff6e74@cogentembedded.com>
 <20170731165616.GC27815@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170731165616.GC27815@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 31/07/17 17:56, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Jul 31, 2017 at 03:59:35PM +0300, Sergei Shtylyov wrote:
>> On 07/31/2017 12:57 PM, Sergei Shtylyov wrote:
>>
>>>>> of_irq_get() may return 0 as well as negative error number on failure,
>>>>> while the driver only checks for the negative values. The driver would then
>>>>> call request_irq(0, ...) in tegra_adma_alloc_chan_resources() and never get
>>>>> valid channel interrupt.
>>>>>
>>>>> Check for 'tdc->irq <= 0' instead and return -ENXIO from the driver's probe
>>>>> iff of_irq_get() returned 0.
>>>>>
>>>>> Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADMA")
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> [...]
>>
>>>>> Index: slave-dma/drivers/dma/tegra210-adma.c
>>>>> ===================================================================
>>>>> --- slave-dma.orig/drivers/dma/tegra210-adma.c
>>>>> +++ slave-dma/drivers/dma/tegra210-adma.c
>>>>> @@ -717,8 +717,8 @@ static int tegra_adma_probe(struct platf
>>>>>           tdc->chan_addr = tdma->base_addr + ADMA_CH_REG_OFFSET(i);
>>>>>             tdc->irq = of_irq_get(pdev->dev.of_node, i);
>>>>> -        if (tdc->irq < 0) {
>>>>> -            ret = tdc->irq;
>>>>> +        if (tdc->irq <= 0) {
>>>>> +            ret = tdc->irq ?: -ENXIO;
>>>>>               goto irq_dispose;
>>>>>           }
>>>>>
>>>>
>>>> I think in this particular case it would be better to just call
>>>> platform_get_irq(), which already implements the equivalent.
>>
>>    Not that platform_get_irq() was no better (if not worse indeed, as it
>> could return 0 both on failure ad success), until I fixed it back in 2016:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e330b9a6bb35dc7097a4f02cb1ae7b6f96df92af
>>
>>>
>>>    OK, I'll try looking into that...
>>
>>    I've looked at the commit history and no, I don't agree to use
>> platform_get_irq(): my platform_get_irq() fix landed in mainline later than
>> this driver, so fixing this bug in stable kernels would ensue an extra
>> dependency...
> 
> Well, surely the platform_get_irq() function should also be fixed in
> stable kernels, so that all callers can be fixed at the same time.
> 
> That said, this does fix a bug, and it fixes it in the least invasive
> way, and the damage I'm complaining about is preexisting, so:
> 
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

FWIW ...

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks!
Jon

-- 
nvpublic
