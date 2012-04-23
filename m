From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/3] iommu/tegra: smmu: Add device tree support for SMMU
Date: Mon, 23 Apr 2012 12:27:28 -0600
Message-ID: <4F959F10.9010908@wwwdotorg.org>
References: <1335182340-17237-1-git-send-email-hdoyu@nvidia.com> <1335182340-17237-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1335182340-17237-2-git-send-email-hdoyu@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hiroshi DOYU <hdoyu@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Joerg Roedel <joerg.roedel@amd.com>, Thierry Reding <thierry.reding@avionic-design.de>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/23/2012 05:58 AM, Hiroshi DOYU wrote:
> Add device tree support for Tegra30 IOMMU(SMMU).

> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c

> +	err = of_parse_dma_window(dev->of_node, "dma-window", 0, NULL,
> +				  &base, &size);

This patch also depends on "dt: Add general DMA window parser" that you
sent earlier.

> +	asids = be32_to_cpup(of_get_property(dev->of_node, "asids", NULL));
> +	if (!asids)
> +		return -ENODEV;

What if of_get_property() fails?

BTW, does the # ASIDs vary? I wonder if it's worth representing it in
the device tree or not. If this driver has a chance of working
unmodified on some future chip just by updating this DT property without
any code changes, then it seems reasonable to have it in DT.
