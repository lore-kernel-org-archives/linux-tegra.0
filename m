Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1CAC4332F
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 18:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbiLESkd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 13:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiLESj7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 13:39:59 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA48620BD9;
        Mon,  5 Dec 2022 10:36:13 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25D2323A;
        Mon,  5 Dec 2022 10:36:20 -0800 (PST)
Received: from [10.57.71.118] (unknown [10.57.71.118])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3C193F73B;
        Mon,  5 Dec 2022 10:36:10 -0800 (PST)
Message-ID: <d3a64bcb-870b-76fb-884b-2beaeaf3af66@arm.com>
Date:   Mon, 5 Dec 2022 18:36:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v12 3/4] iommu: Implement of_iommu_get_resv_regions()
Content-Language: en-GB
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
 <20221117185424.2359687-4-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221117185424.2359687-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-11-17 18:54, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is an implementation that IOMMU drivers can use to obtain reserved
> memory regions from a device tree node. It uses the reserved-memory DT
> bindings to find the regions associated with a given device. If these
> regions are marked accordingly, identity mappings will be created for
> them in the IOMMU domain that the devices will be attached to.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v10:
> - extract more code into the new iommu_resv_region_get_type() function
> - rename variables for physical and I/O virtual addresses for clarity
> - default to IOMMU_RESV_DIRECT instead of IOMMU_RESV_DIRECT_RELAXABLE
> - use newly introduced of_translate_dma_region()
> 
> Changes in v9:
> - address review comments by Robin Murphy:
>    - warn about non-direct mappings since they are not supported yet
>    - cleanup code to require less indentation
>    - narrow scope of variables
> 
> Changes in v8:
> - cleanup set-but-unused variables
> 
> Changes in v6:
> - remove reference to now unused dt-bindings/reserved-memory.h include
> 
> Changes in v5:
> - update for new "iommu-addresses" device tree bindings
> 
> Changes in v4:
> - fix build failure on !CONFIG_OF_ADDRESS
> 
> Changes in v3:
> - change "active" property to identity mapping flag that is part of the
>    memory region specifier (as defined by #memory-region-cells) to allow
>    per-reference flags to be used
> 
> Changes in v2:
> - use "active" property to determine whether direct mappings are needed
> 
>   drivers/iommu/of_iommu.c | 94 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/of_iommu.h |  8 ++++
>   2 files changed, 102 insertions(+)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 5696314ae69e..fa7c63a4abbf 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/msi.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/of_iommu.h>
>   #include <linux/of_pci.h>
>   #include <linux/pci.h>
> @@ -172,3 +173,96 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>   
>   	return ops;
>   }
> +
> +static enum iommu_resv_type iommu_resv_region_get_type(struct device *dev, struct resource *phys,
> +						       phys_addr_t start, size_t length)
> +{
> +	phys_addr_t end = start + length - 1;
> +
> +	/*
> +	 * IOMMU regions without an associated physical region cannot be
> +	 * mapped and are simply reservations.
> +	 */
> +	if (phys->start >= phys->end)
> +		return IOMMU_RESV_RESERVED;
> +
> +	/* may be IOMMU_RESV_DIRECT_RELAXABLE for certain cases */
> +	if (start == phys->start && end == phys->end)
> +		return IOMMU_RESV_DIRECT;
> +
> +	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", &phys,
> +		 &start, &end);
> +	return IOMMU_RESV_RESERVED;
> +}
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
> +		const __be32 *maps, *end;
> +		struct resource phys;
> +		int size;
> +
> +		memset(&phys, 0, sizeof(phys));
> +
> +		/*
> +		 * The "reg" property is optional and can be omitted by reserved-memory regions
> +		 * that represent reservations in the IOVA space, which are regions that should
> +		 * not be mapped.
> +		 */
> +		if (of_find_property(it.node, "reg", NULL)) {
> +			err = of_address_to_resource(it.node, 0, &phys);
> +			if (err < 0) {
> +				dev_err(dev, "failed to parse memory region %pOF: %d\n",
> +					it.node, err);
> +				continue;
> +			}
> +		}
> +
> +		maps = of_get_property(it.node, "iommu-addresses", &size);
> +		if (!maps)
> +			continue;
> +
> +		end = maps + size / sizeof(__be32);
> +
> +		while (maps < end) {
> +			struct device_node *np;
> +			u32 phandle;
> +
> +			phandle = be32_to_cpup(maps++);
> +			np = of_find_node_by_phandle(phandle);
> +
> +			if (np == dev->of_node) {
> +				int prot = IOMMU_READ | IOMMU_WRITE;
> +				struct iommu_resv_region *region;
> +				enum iommu_resv_type type;
> +				phys_addr_t iova;
> +				size_t length;
> +
> +				maps = of_translate_dma_region(np, maps, &iova, &length);
> +				type = iommu_resv_region_get_type(dev, &phys, iova, length);
> +
> +				region = iommu_alloc_resv_region(iova, length, prot, type,
> +								 GFP_KERNEL);
> +				if (region)
> +					list_add_tail(&region->list, list);
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
>   					struct device_node *master_np,
>   					const u32 *id);
>   
> +extern void of_iommu_get_resv_regions(struct device *dev,
> +				      struct list_head *list);
> +
>   #else
>   
>   static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
> @@ -21,6 +24,11 @@ static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
>   	return NULL;
>   }
>   
> +static inline void of_iommu_get_resv_regions(struct device *dev,
> +					     struct list_head *list)
> +{
> +}
> +
>   #endif	/* CONFIG_OF_IOMMU */
>   
>   #endif /* __OF_IOMMU_H */
