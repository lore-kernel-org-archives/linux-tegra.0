From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 3/4] iommu/tegra: smmu: Refrain from accessing to AHB
Date: Fri, 4 May 2012 08:36:37 +0200
Message-ID: <20120504.093637.894939287045949033.hdoyu@nvidia.com>
References: <1336061147-10245-3-git-send-email-hdoyu@nvidia.com><4FA2C4E9.2080509@wwwdotorg.org><4FA2C746.5080000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FA2C746.5080000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "joerg.roedel-5C7GfCeVMHo@public.gmane.org" <joerg.roedel-5C7GfCeVMHo@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv3 3/4] iommu/tegra: smmu: Refrain from accessing to AHB
Date: Thu, 3 May 2012 19:58:30 +0200
Message-ID: <4FA2C746.5080000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

> On 05/03/2012 11:48 AM, Stephen Warren wrote:
> > On 05/03/2012 10:05 AM, Hiroshi DOYU wrote:
> >> Use "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
> >> ready, instead of directly aceessing AHB registers.
> 
> Oh, that should be "accessing".
> 
> >> @@ -911,14 +899,16 @@ static int tegra_smmu_probe(struct platform_device *pdev)
> > 
> >> +	smmu->ahb = of_parse_phandle(pdev->dev.of_node, "ahb", 0);
> > 
> > Hmm, "ahb" should probably be "nvidia,ahb".
> > 
> > I see that neither this patch nor the next patch include binding
> > documentation that describe this property. Can you please add documentation.
> 
> Oh, the next patch is just adding the entry to the .dtsi file for the
> AHB, so no surprise it doesn't add a binding document for the SMMU!
> 
> I see that with this patch, the driver still expects the DMA window to
> be represented as a reg property (IORESOURCE_MEM), so if we add a
> binding document to this patch it won't be very consistent either:-( And
> then, there's the issue of whether the SMMU should be it's own device or
> a child of some MC device, since there's non-SMMU functionality in these
> registers too. This makes all the SMMU rework need a little more thought.
> 
> So, I propose dropping this patch from this series, since this series is
> all about adding the AHB driver. We should move this patch to a series
> relating to the SMMU driver.

Ok, I'll post the first 3 patches.
