From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] dmaengine: tegra-apb: Disable interrupts on removal
Date: Wed, 28 Oct 2015 13:34:06 +0000
Message-ID: <5630CECE.2000600@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <1444983957-18691-7-git-send-email-jonathanh@nvidia.com>
 <5620BB0E.9040400@metafoo.de> <5620C383.3060104@nvidia.com>
 <5620D42A.8060007@metafoo.de> <5620D7FE.2010205@nvidia.com>
 <20151028065339.GE3041@vkoul-mobl.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151028065339.GE3041-bQVUxfxUtC13uc1i7fC1zK2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 28/10/15 06:53, Vinod Koul wrote:
> On Fri, Oct 16, 2015 at 11:57:02AM +0100, Jon Hunter wrote:
>>>>> How about just calling free_irq()? That's how you'd typically handle this.
>>>>
>>>> Yes, however, the interrupt is requested by devm_request_irq(). I guess
>>>> I could call devm_free_irq() here?
>>>
>>> Just use request_irq() instead of devm_request_irq(). You have the same
>>> issue on the error path in the probe function anyway and also need to add
>>> the free_irq() before the tasklet_kill() there as well.
>>
>> I was wondering about that but the tasklets should never be scheduled if
>> the probe does not succeed, so I think it is ok.
> 
> This is actually very racy, if probe fails but due to devm_ calls your irq
> is alive till it freed by core
> 
> And a faulty device triggering irq can complicate matters, so for irq IMHO
> we don't get much benefit with devm_ variant

That's fine, I will drop the devm_ usage here then.

Jon
