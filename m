From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/7] DMA: tegra-apb: Correct runtime-pm usage
Date: Mon, 24 Aug 2015 09:47:13 +0100
Message-ID: <55DADA11.5040306@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com> <1439905755-25150-2-git-send-email-jonathanh@nvidia.com> <20150823141707.GB13546@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150823141707.GB13546@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 23/08/15 15:17, Vinod Koul wrote:
> On Tue, Aug 18, 2015 at 02:49:09PM +0100, Jon Hunter wrote:
> 
>> @@ -1543,7 +1531,7 @@ static int tegra_dma_pm_suspend(struct device *dev)
>>  	int ret;
>>  
>>  	/* Enable clock before accessing register */
>> -	ret = tegra_dma_runtime_resume(dev);
>> +	ret = pm_runtime_get_sync(dev);
> 
> why is this required ?

Because the clock could be disabled when this function is called. This
function saves the DMA context so that if the context is lost during
suspend, it can be restored.

Cheers
Jon
