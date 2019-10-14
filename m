From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 07/11] dts: arm64: layerscape: add dma-ranges property to
 qoric-mc node
Date: Mon, 14 Oct 2019 19:09:12 +0800
Message-ID: <20191014110911.GL12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-8-nsaenzjulienne@suse.de>
 <20191014082847.GH12262@dragon>
 <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f6262e61f858c6f50164416f4ea816e203c0704f.camel-l3A5Bk7waGM@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Yang <leoyang.li-3arQi8VN3Tc@public.gmane.org>, mbrugger-IBi9RG/b67k@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, james.quinlan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, wahrenst-hi6Y0CQ0nG0@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 14, 2019 at 12:00:25PM +0200, Nicolas Saenz Julienne wrote:
> On Mon, 2019-10-14 at 16:28 +0800, Shawn Guo wrote:
> > On Tue, Sep 24, 2019 at 08:12:38PM +0200, Nicolas Saenz Julienne wrote:
> > > qoriq-mc's dpmacs DMA configuration is inherited from their parent node,
> > > which acts a bus in this regard. So far it maked all devices as
> > > dma-coherent but no dma-ranges recommendation is made.
> > > 
> > > The truth is that the underlying interconnect has DMA constraints, so
> > > add an empty dma-ranges in qoriq-mc's node in order for DT's DMA
> > > configuration code to get the DMA constraints from it.
> > > 
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
> > 
> > Updated subject prefix as 'arm64: dts: ...', and applied the patch.
> 
> Hi Shawn,
> these two patches are no longer needed. This series has been superseded by this
> patch[1] 951d48855d ('of: Make of_dma_get_range() work on bus nodes', available
> in linux-next) which fixed the issue directly in OF code.
> 
> Sorry for the noise.

Okay, thanks for letting me know.  Dropped them.

Shawn
