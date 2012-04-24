From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCH 2/3] iommu/tegra: smmu: Add device tree support for SMMU
Date: Tue, 24 Apr 2012 10:59:48 +0200
Message-ID: <20120424.115948.399395507020458456.hdoyu@nvidia.com>
References: <1335182340-17237-1-git-send-email-hdoyu@nvidia.com><1335182340-17237-2-git-send-email-hdoyu@nvidia.com><4F959F10.9010908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F959F10.9010908@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "joerg.roedel@amd.com" <joerg.roedel@amd.com>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/3] iommu/tegra: smmu: Add device tree support for SMMU
Date: Mon, 23 Apr 2012 20:27:28 +0200
Message-ID: <4F959F10.9010908@wwwdotorg.org>

> On 04/23/2012 05:58 AM, Hiroshi DOYU wrote:
> > Add device tree support for Tegra30 IOMMU(SMMU).
> 
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> 
> > +	err = of_parse_dma_window(dev->of_node, "dma-window", 0, NULL,
> > +				  &base, &size);
> 
> This patch also depends on "dt: Add general DMA window parser" that you
> sent earlier.
> 
> > +	asids = be32_to_cpup(of_get_property(dev->of_node, "asids", NULL));
> > +	if (!asids)
> > +		return -ENODEV;
> 
> What if of_get_property() fails?

Ok, need to be checked. I'll fix.

> BTW, does the # ASIDs vary? I wonder if it's worth representing it in
> the device tree or not. If this driver has a chance of working
> unmodified on some future chip just by updating this DT property without
> any code changes, then it seems reasonable to have it in DT.

Yes, ASID should be passed from DT.
