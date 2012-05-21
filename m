From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] iommu/tegra: gart: Reserve iomem resource
Date: Mon, 21 May 2012 19:05:35 +0200
Message-ID: <1337619935.1621.13.camel@tellur>
References: <1337019127-6863-1-git-send-email-hdoyu@nvidia.com>
	 <1337019127-6863-2-git-send-email-hdoyu@nvidia.com>
	 <20120521141152.GA21513@avionic-0098.mockup.avionic-design.de>
	 <4FBA702A.1010203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FBA702A.1010203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>, Bharat Nihalani <bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vandana Salve <vsalve-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 21.05.2012, 10:41 -0600 schrieb Stephen Warren:
> On 05/21/2012 08:11 AM, Thierry Reding wrote:
> > * Hiroshi DOYU wrote:
> >> GART Register/Aperture range should be reserved.
> ...
> >> diff --git a/drivers/iommu/tegra-gart.c
> >> b/drivers/iommu/tegra-gart.c
> ...
> >> +	if (!devm_request_mem_region(dev, res_remap->start, +
> >> resource_size(res_remap), dev_name(dev))) { +		dev_err(dev,
> >> "failed to reserve GART aperture\n"); +		return -EBUSY; +	} +
> > 
> > I'm not so sure that this is a good idea. If the GART driver
> > requests the GART aperture, then users of the GART aperture (e.g.
> > the DRM driver) will no longer be able to use it.
> 
> Presumably the DRM driver would be obtaining access to parts of the
> GART aperture through the GART driver, rather than just grabbing the
> IO region and using it for itself?

With a TTM-like memory manager the DRM driver will take over the address
space management of the GART aperture. The GART driver is only used to
set up the mappings in the IOMMU. The DRM driver is the one that sets
up/tears down the CPU mappings on demand, so the aperture should be
claimed in the DRM driver.

-- Lucas
