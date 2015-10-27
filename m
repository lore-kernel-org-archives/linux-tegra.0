From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 2/2] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 27 Oct 2015 09:24:01 +0000
Message-ID: <562F42B1.30102@nvidia.com>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <1444980919-20331-3-git-send-email-jonathanh@nvidia.com>
 <20151027021008.GD11691@vkoul-mobl.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151027021008.GD11691-bQVUxfxUtC13uc1i7fC1zK2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 27/10/15 02:10, Vinod Koul wrote:
> On Fri, Oct 16, 2015 at 08:35:19AM +0100, Jon Hunter wrote:
>> +static inline void tdma_ch_write(struct tegra_adma_chan *tdc,
>> +		u32 reg, u32 val)
> 
> Coding style issue here

Yes will correct.

>> +static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
>> +{
>> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +	int ret;
>> +
>> +	ret = pm_runtime_get_sync(tdc2dev(tdc));
>> +	if (ret)
>> +		return ret;
> 
> pm_runtime_get_sync() return postive values on success too, so this can
> fail. This check should be for less than zero case

I stumbled upon that recently and will also fix up.

Cheers
Jon
