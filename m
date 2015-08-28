From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/7] DMA: tegra-apb: Correct runtime-pm usage
Date: Fri, 28 Aug 2015 11:30:50 +0100
Message-ID: <55E0385A.6070203@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
 <55DB1AA9.7090906@nvidia.com> <20150824142143.GK13546@localhost>
 <13590312.K3yoQT5YDc@vostro.rjw.lan> <55DC375F.1070907@nvidia.com>
 <55DCF056.40004@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DCF056.40004-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/08/15 23:46, Rafael J. Wysocki wrote:
> On 8/25/2015 11:37 AM, Jon Hunter wrote:

[snip]

>> Vinod, thinking about this some more, I am wondering if it is just
>> better to get rid of the suspend/resume callbacks and simply handling
>> the state in the runtime suspend/resume callbacks. I think that would be
>> safe too, because once the clock has been disabled, then who knows what
>> the context state will be.
> 
> One caveat here: system suspend may be invoked at any time, so you need
> to ensure that the device is properly suspended when that happens.
> 
> I believe you at least need a ->suspend callback for that.

Thanks, makes sense.

On a related note, I see a few drivers, including this DMA driver doing
the following in the driver ->remove callback.

    pm_runtime_disable(&pdev->dev);
        !pm_runtime_status_suspended(&pdev->dev))
            tegra_dma_runtime_suspend(&pdev->dev);

I understand that the code is trying to ensure that the device is
suspended regardless of whether rpm is enabled or not in the kernel
config. However, looking at the pm_runtime_status_suspended() function,
AFAICT, it will always return false above as the disable_depth will be
greater than 0. So I am concerned that the tegra_dma_runtime_suspend()
is called even when not needed? However, I could also be missing
something here.

Cheers
Jon
