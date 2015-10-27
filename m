From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/2] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 27 Oct 2015 11:10:09 +0900
Message-ID: <20151027021008.GD11691@vkoul-mobl.iind.intel.com>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <1444980919-20331-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444980919-20331-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2015 at 08:35:19AM +0100, Jon Hunter wrote:
> +static inline void tdma_ch_write(struct tegra_adma_chan *tdc,
> +		u32 reg, u32 val)

Coding style issue here

> +static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
> +{
> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(tdc2dev(tdc));
> +	if (ret)
> +		return ret;

pm_runtime_get_sync() return postive values on success too, so this can
fail. This check should be for less than zero case

-- 
~Vinod
