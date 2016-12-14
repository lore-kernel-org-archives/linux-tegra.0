From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] drm/tegra: Add Tegra DRM allocation API
Date: Wed, 14 Dec 2016 15:01:56 +0100
Message-ID: <1481724116.2313.39.camel@pengutronix.de>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
         <20161214111617.24548-2-mperttunen@nvidia.com>
         <1481715331.2313.28.camel@pengutronix.de>
         <20161214134833.GA29981@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214134833.GA29981-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 14.12.2016, 14:48 +0100 schrieb Thierry Reding:
> On Wed, Dec 14, 2016 at 12:35:31PM +0100, Lucas Stach wrote:
> > Am Mittwoch, den 14.12.2016, 13:16 +0200 schrieb Mikko Perttunen:
> > > Add a new IO virtual memory allocation API to allow clients to
> > > allocate non-GEM memory in the Tegra DRM IOMMU domain. This is
> > > required e.g. for loading client firmware when clients are attached
> > > to the IOMMU domain.
> > > 
> > > The allocator allocates contiguous physical pages that are then
> > > mapped contiguously to the IOMMU domain using the iova_domain
> > > library provided by the kernel. Contiguous physical pages are
> > > used so that the same allocator works also when IOMMU support
> > > is disabled and therefore devices access physical memory directly.
> > > 
> > Why is this needed? If you use the DMA API for those buffers you should
> > end up with CMA memory in the !IOMMU case and normal paged memory with
> > IOMMU enabled. From my understanding this should match the requirements.
> 
> We can't currently use the DMA API for these allocations because it
> doesn't allow (or at least didn't back when this was first implemented)
> us to share a mapping between two devices.

Hm, maybe I'm overlooking something, but isn't this just a matter of
allocating on one device, then constructing a SG list (dma_get_sgtable)
from the buffer you got and use that to dma_map_sg() the buffer on the
other device?

Maybe doing the firmware buffer allocation on host1x (with a 4GB upper
bound) and then sharing the SG list to the devices?

> The reason why we need these patches is that when IOMMU is enabled, then
> the units' falcons will read memory through the IOMMU, so we must have
> allocations for GEM buffers and the firmware go through the same
> mechanism.

Sorry for maybe dumb questions.

Do you have any engines other than the GPU that can handle SG
themselves? Wouldn't you want the GEM objects to be backed by CMA in
the !MMU case? How are ordinary GEM objects different from the falcon
firmware?

Regards,
Lucas
