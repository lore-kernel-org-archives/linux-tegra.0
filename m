Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8DCC4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 13:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiJGNrd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 09:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiJGNrc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 09:47:32 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F0CE2BBE28;
        Fri,  7 Oct 2022 06:47:30 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0407C106F;
        Fri,  7 Oct 2022 06:47:37 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 355233F67D;
        Fri,  7 Oct 2022 06:47:27 -0700 (PDT)
Message-ID: <c95801a2-4d37-ecd9-fc01-e2c32b6a6fdc@arm.com>
Date:   Fri, 7 Oct 2022 14:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 2/5] iommu: Implement of_iommu_get_resv_regions()
Content-Language: en-GB
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-3-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220923123557.866972-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-09-23 13:35, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is an implementation that IOMMU drivers can use to obtain reserved
> memory regions from a device tree node. It uses the reserved-memory DT
> bindings to find the regions associated with a given device. If these
> regions are marked accordingly, identity mappings will be created for
> them in the IOMMU domain that the devices will be attached to.
> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
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
>   drivers/iommu/of_iommu.c | 104 +++++++++++++++++++++++++++++++++++++++
>   include/linux/of_iommu.h |   8 +++
>   2 files changed, 112 insertions(+)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 5696314ae69e..0bf2b08bca0a 100644
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
> @@ -172,3 +173,106 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>   
>   	return ops;
>   }
> +
> +static inline bool check_direct_mapping(struct device *dev, struct resource *phys,

Where "phys" is the virtual address, right? :(

> +					phys_addr_t start, phys_addr_t end)
> +{
> +	if (start != phys->start || end != phys->end) {
> +		dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n",
> +			 &phys, &start, &end);
> +		return false;
> +	}
> +
> +	return true;
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
> +		struct resource res;
> +		int size;
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
> +		if (!maps)
> +			continue;
> +
> +		end = maps + size / sizeof(__be32);
> +
> +		while (maps < end) {
> +			struct device_node *np;
> +			u32 phandle;
> +			int na, ns;
> +
> +			phandle = be32_to_cpup(maps++);
> +			np = of_find_node_by_phandle(phandle);
> +			na = of_n_addr_cells(np);
> +			ns = of_n_size_cells(np);
> +
> +			if (np == dev->of_node) {
> +				int prot = IOMMU_READ | IOMMU_WRITE;
> +				struct iommu_resv_region *region;
> +				enum iommu_resv_type type;
> +				phys_addr_t start;
> +				size_t length;
> +
> +				start = of_translate_dma_address(np, maps);
> +				length = of_read_number(maps + na, ns);
> +
> +				/*
> +				 * IOMMU regions without an associated physical region cannot be
> +				 * mapped and are simply reservations.
> +				 */
> +				if (res.end > res.start) {
> +					phys_addr_t end = start + length - 1;
> +
> +					if (check_direct_mapping(dev, &res, start, end))
> +						type = IOMMU_RESV_DIRECT_RELAXABLE;

Again I really don't think we should assume relaxable by default.

Looking at the shape of things now, it seems like 
check_direct_mappings() wants to subsume the check on res as well and 
grow in to a more general function for determining the iommu_resv_type. 
Then we've got a clear place to start special-casing things like 
simple-framebuffer that we do know a bit more about.

Thanks,
Robin.

> +					else
> +						type = IOMMU_RESV_RESERVED;
> +				} else {
> +					type = IOMMU_RESV_RESERVED;
> +				}
> +
> +				region = iommu_alloc_resv_region(start, length, prot, type);
> +				if (region)
> +					list_add_tail(&region->list, list);
> +			}
> +
> +			maps += na + ns;
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
