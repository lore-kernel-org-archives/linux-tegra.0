Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1424C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 15 May 2022 11:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbiEOLKs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 15 May 2022 07:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236513AbiEOLKq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 15 May 2022 07:10:46 -0400
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A19104;
        Sun, 15 May 2022 04:10:40 -0700 (PDT)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id E1D0026EA99; Sun, 15 May 2022 13:10:38 +0200 (CEST)
Date:   Sun, 15 May 2022 13:10:38 +0200
From:   Janne Grunau <j@jannau.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        asahi@lists.linux.dev
Subject: Re: [PATCH v5 2/5] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <20220515111038.GE26732@jannau.net>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
 <20220512190052.1152377-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512190052.1152377-3-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-05-12 21:00:49 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is an implementation that IOMMU drivers can use to obtain reserved
> memory regions from a device tree node. It uses the reserved-memory DT
> bindings to find the regions associated with a given device. If these
> regions are marked accordingly, identity mappings will be created for
> them in the IOMMU domain that the devices will be attached to.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - update for new "iommu-addresses" device tree bindings
> 
> Changes in v4:
> - fix build failure on !CONFIG_OF_ADDRESS
> 
> Changes in v3:
> - change "active" property to identity mapping flag that is part of the
>   memory region specifier (as defined by #memory-region-cells) to allow
>   per-reference flags to be used
> 
> Changes in v2:
> - use "active" property to determine whether direct mappings are needed
> 
>  drivers/iommu/of_iommu.c | 90 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_iommu.h |  8 ++++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 5696314ae69e..9e341b5e307f 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -11,12 +11,15 @@
>  #include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_iommu.h>
>  #include <linux/of_pci.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/fsl/mc.h>
>  
> +#include <dt-bindings/reserved-memory.h>
> +
>  #define NO_IOMMU	1
>  
>  static int of_iommu_xlate(struct device *dev,
> @@ -172,3 +175,90 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>  
>  	return ops;
>  }
> +
> +/**
> + * of_iommu_get_resv_regions - reserved region driver helper for device tree
> + * @dev: device for which to get reserved regions
> + * @list: reserved region list
> + *
> + * IOMMU drivers can use this to implement their .get_resv_regions() callback
> + * for memory regions attached to a device tree node. See the reserved-memory
> + * device tree bindings on how to use these:
> + *
> + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> + */
> +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> +{
> +#if IS_ENABLED(CONFIG_OF_ADDRESS)
> +	struct of_phandle_iterator it;
> +	int err;
> +
> +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
> +		struct iommu_resv_region *region;
> +		struct resource res;
> +		const __be32 *maps;
> +		int size;

Adding 'if (!of_device_is_available(it.node)) continue;' here would help 
backwards compatibility. My plan was to add the reserved regions with 
"iommu-addresses" with all zero adresses and sizes with status = 
"disabled" to the devicetree. A bootloader update is required to fill 
those.

> +
> +		memset(&res, 0, sizeof(res));
> +
> +		/*
> +		 * The "reg" property is optional and can be omitted by reserved-memory regions
> +		 * that represent reservations in the IOVA space, which are regions that should
> +		 * not be mapped.
> +		 */
> +		if (of_find_property(it.node, "reg", NULL)) {
> +			err = of_address_to_resource(it.node, 0, &res);
> +			if (err < 0) {
> +				dev_err(dev, "failed to parse memory region %pOF: %d\n",
> +					it.node, err);
> +				continue;
> +			}
> +		}
> +
> +		maps = of_get_property(it.node, "iommu-addresses", &size);
> +		if (maps) {
> +			const __be32 *end = maps + size / sizeof(__be32);
> +			struct device_node *np;
> +			unsigned int index = 0;
> +			u32 phandle;
> +			int na, ns;
> +
> +			while (maps < end) {
> +				phys_addr_t start, end;
> +				size_t length;
> +
> +				phandle = be32_to_cpup(maps++);
> +				np = of_find_node_by_phandle(phandle);
> +				na = of_n_addr_cells(np);
> +				ns = of_n_size_cells(np);
> +
> +				start = of_translate_dma_address(np, maps);
> +				length = of_read_number(maps + na, ns);

alternatively we could handle mappings/reservations with length 0 as 
error and skip them.

> +				end = start + length - 1;
> +
> +				if (np == dev->of_node) {
> +					int prot = IOMMU_READ | IOMMU_WRITE;
> +					enum iommu_resv_type type;
> +
> +					/*
> +					 * IOMMU regions without an associated physical region
> +					 * cannot be mapped and are simply reservations.
> +					 */
> +					if (res.end > res.start)
> +						type = IOMMU_RESV_DIRECT_RELAXABLE;
> +					else
> +						type = IOMMU_RESV_RESERVED;
> +
> +					region = iommu_alloc_resv_region(start, length, prot, type);
> +					if (region)
> +						list_add_tail(&region->list, list);
> +				}
> +
> +				maps += na + ns;
> +				index++;
> +			}
> +		}
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL(of_iommu_get_resv_regions);
> diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
> index 55c1eb300a86..9a5e6b410dd2 100644
> --- a/include/linux/of_iommu.h
> +++ b/include/linux/of_iommu.h
> @@ -12,6 +12,9 @@ extern const struct iommu_ops *of_iommu_configure(struct device *dev,
>  					struct device_node *master_np,
>  					const u32 *id);
>  
> +extern void of_iommu_get_resv_regions(struct device *dev,
> +				      struct list_head *list);
> +
>  #else
>  
>  static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
> @@ -21,6 +24,11 @@ static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
>  	return NULL;
>  }
>  
> +static inline void of_iommu_get_resv_regions(struct device *dev,
> +					     struct list_head *list)
> +{
> +}
> +
>  #endif	/* CONFIG_OF_IOMMU */
>  
>  #endif /* __OF_IOMMU_H */
> -- 
> 2.36.1
> 

Janne
