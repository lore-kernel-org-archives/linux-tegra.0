From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Wed, 13 Apr 2016 19:19:17 +0530
Message-ID: <20160413134917.GP2274@localhost>
References: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com>
 <1458057390-20756-3-git-send-email-jonathanh@nvidia.com>
 <20160405213649.GA11586@vkoul-mobl.iind.intel.com>
 <570BB001.3020202@nvidia.com>
 <20160412141025.GJ2274@localhost>
 <570D2104.1040607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570D2104.1040607-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 12, 2016 at 05:23:32PM +0100, Jon Hunter wrote:
> >>> why should this be hard coded in kernel and not queried from something like
> >>> DT? This case seems to be hardware property
> >>
> >> Originally, I did have this in DT, however, the Tegra maintainers prefer
> >> this and this is consistent with the other Tegra DMA driver (see
> >> driver/dma/tegra20-apb-dma.c) [0].
> > 
> > But this creates a problem when you have next generation of controller with
> > different channel count!
> > How do we solve then?
> 
> Same way we solve this for the tegra20-apb-dma driver by having
> different chip data per SoC in the driver ...
> 
> 1259 /* Tegra20 specific DMA controller information */
> 1260 static const struct tegra_dma_chip_data tegra20_dma_chip_data = {
> 1261         .nr_channels            = 16,
> 1262         .channel_reg_size       = 0x20,
> 1263         .max_dma_count          = 1024UL * 64,
> 1264         .support_channel_pause  = false,
> 1265         .support_separate_wcount_reg = false,
> 1266 };
> 1267
> 1268 /* Tegra30 specific DMA controller information */
> 1269 static const struct tegra_dma_chip_data tegra30_dma_chip_data = {
> 1270         .nr_channels            = 32,
> 1271         .channel_reg_size       = 0x20,
> 1272         .max_dma_count          = 1024UL * 64,
> 1273         .support_channel_pause  = false,
> 1274         .support_separate_wcount_reg = false,
> 1275 };
> 1276
> 1277 /* Tegra114 specific DMA controller information */
> 1278 static const struct tegra_dma_chip_data tegra114_dma_chip_data = {
> 1279         .nr_channels            = 32,
> 1280         .channel_reg_size       = 0x20,
> 1281         .max_dma_count          = 1024UL * 64,
> 1282         .support_channel_pause  = true,
> 1283         .support_separate_wcount_reg = false,
> 1284 };
> 1285
> 1286 /* Tegra148 specific DMA controller information */
> 1287 static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
> 1288         .nr_channels            = 32,
> 1289         .channel_reg_size       = 0x40,
> 1290         .max_dma_count          = 1024UL * 64,
> 1291         .support_channel_pause  = true,
> 1292         .support_separate_wcount_reg = true,
> 1293 };
> 
> You may still say this should be in the DT, but the Tegra maintainers
> prefer this data in the driver.

Okay I don't see a a rationale behind this not being in DT, Stephan?

> 
> >>>> +	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
> >>>> +	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
> >>>> +	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
> >>>
> >>> I think you should not set DMA_SLAVE, do you need caps to be exported. I
> >>> think that should be exported for cyclic too, let me know if that was the
> >>> issue?
> >>>
> >>
> >> Why should I not be setting DMA_SLAVE? Should I not be calling
> >> dma_get_any_slave_channel() in the xlate?
> >>
> >> I think that I do want to set DMA_CYCLIC as well to ensure that we check
> >> that the device->device_prep_dma_cyclic() function pointer is populated
> >> when registering the DMA controller.
> > 
> > Only setting DMA_CYCLIC should do, if you see any issues around that please
> > get back, we cna fix those :)
> 
> It did not work for me because dma_get_any_slave_channel() wants a DMA
> device with the DMA_SLAVE bit capability set. So if I remove this above,
> then requesting the channel fails via dma_get_any_slave_channel() fails.
> Is there something I don't understand here?

You should use dma_request_channel() we cleaned up the APIs and recommend to
use dma_request_channel() for slave usages. See Documentation update in 
a8135d0d79e9: (dmaengine: core: Introduce new, universal API to request a
channel)

Thanks
-- 
~Vinod
