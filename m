Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B416AECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Sep 2022 16:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiIIQK4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiIIQK4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Sep 2022 12:10:56 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B433DBD1F5;
        Fri,  9 Sep 2022 09:10:54 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1408165C;
        Fri,  9 Sep 2022 09:11:00 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41FEA3F73D;
        Fri,  9 Sep 2022 09:10:50 -0700 (PDT)
Message-ID: <0af66506-3368-6882-2b42-f2e9c2d436b7@arm.com>
Date:   Fri, 9 Sep 2022 17:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v8 2/5] iommu: Implement of_iommu_get_resv_regions()
Content-Language: en-GB
To:     Janne Grunau <j@jannau.net>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        asahi@lists.linux.dev, Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
 <20220905170833.396892-3-thierry.reding@gmail.com>
 <cdac209d-16b3-6c95-6387-4ffeed97178c@arm.com>
 <20220909151621.GB4024@jannau.net>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220909151621.GB4024@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-09-09 16:16, Janne Grunau wrote:
> On 2022-09-09 11:56:32 +0100, Robin Murphy wrote:
>> On 2022-09-05 18:08, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> This is an implementation that IOMMU drivers can use to obtain reserved
>>> memory regions from a device tree node. It uses the reserved-memory DT
>>> bindings to find the regions associated with a given device. If these
>>> regions are marked accordingly, identity mappings will be created for
>>> them in the IOMMU domain that the devices will be attached to.
>>>
>>> Cc: Frank Rowand <frowand.list@gmail.com>
>>> Cc: devicetree@vger.kernel.org
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>> Changes in v8:
>>> - cleanup set-but-unused variables
>>>
>>> Changes in v6:
>>> - remove reference to now unused dt-bindings/reserved-memory.h include
>>>
>>> Changes in v5:
>>> - update for new "iommu-addresses" device tree bindings
>>>
>>> Changes in v4:
>>> - fix build failure on !CONFIG_OF_ADDRESS
>>>
>>> Changes in v3:
>>> - change "active" property to identity mapping flag that is part of the
>>>     memory region specifier (as defined by #memory-region-cells) to allow
>>>     per-reference flags to be used
>>>
>>> Changes in v2:
>>> - use "active" property to determine whether direct mappings are needed
>>>
>>>    drivers/iommu/of_iommu.c | 85 ++++++++++++++++++++++++++++++++++++++++
>>>    include/linux/of_iommu.h |  8 ++++
>>>    2 files changed, 93 insertions(+)
>>>
>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>>> index 5696314ae69e..6617096ad15f 100644
>>> --- a/drivers/iommu/of_iommu.c
>>> +++ b/drivers/iommu/of_iommu.c
>>> @@ -11,6 +11,7 @@
>>>    #include <linux/module.h>
>>>    #include <linux/msi.h>
>>>    #include <linux/of.h>
>>> +#include <linux/of_address.h>
>>>    #include <linux/of_iommu.h>
>>>    #include <linux/of_pci.h>
>>>    #include <linux/pci.h>
>>> @@ -172,3 +173,87 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>>>    	return ops;
>>>    }
>>> +
>>> +/**
>>> + * of_iommu_get_resv_regions - reserved region driver helper for device tree
>>> + * @dev: device for which to get reserved regions
>>> + * @list: reserved region list
>>> + *
>>> + * IOMMU drivers can use this to implement their .get_resv_regions() callback
>>> + * for memory regions attached to a device tree node. See the reserved-memory
>>> + * device tree bindings on how to use these:
>>> + *
>>> + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> + */
>>> +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>> +{
>>> +#if IS_ENABLED(CONFIG_OF_ADDRESS)
>>> +	struct of_phandle_iterator it;
>>> +	int err;
>>> +
>>> +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
>>> +		struct iommu_resv_region *region;
>>> +		struct resource res;
>>> +		const __be32 *maps;
>>> +		int size;
>>> +
>>> +		memset(&res, 0, sizeof(res));
>>> +
>>> +		/*
>>> +		 * The "reg" property is optional and can be omitted by reserved-memory regions
>>> +		 * that represent reservations in the IOVA space, which are regions that should
>>> +		 * not be mapped.
>>> +		 */
>>> +		if (of_find_property(it.node, "reg", NULL)) {
>>> +			err = of_address_to_resource(it.node, 0, &res);
>>> +			if (err < 0) {
>>> +				dev_err(dev, "failed to parse memory region %pOF: %d\n",
>>> +					it.node, err);
>>> +				continue;
>>> +			}
>>> +		}
>>> +
>>> +		maps = of_get_property(it.node, "iommu-addresses", &size);
>>> +		if (maps) {
>>
>> Nit: "if (!maps) continue;" and save some indentation.
>>
>>> +			const __be32 *end = maps + size / sizeof(__be32);
>>> +			struct device_node *np;
>>> +			u32 phandle;
>>> +			int na, ns;
>>> +
>>> +			while (maps < end) {
>>> +				phys_addr_t start;
>>> +				size_t length;
>>> +
>>> +				phandle = be32_to_cpup(maps++);
>>> +				np = of_find_node_by_phandle(phandle);
>>> +				na = of_n_addr_cells(np);
>>> +				ns = of_n_size_cells(np);
>>> +
>>> +				start = of_translate_dma_address(np, maps);
>>> +				length = of_read_number(maps + na, ns);
>>
>> Nit: these could go inside the if condition.
>>
>>> +
>>> +				if (np == dev->of_node) {
>>> +					int prot = IOMMU_READ | IOMMU_WRITE;
> 
> would it be reasonable to infer IOMMU_CACHE here from "dma-coherrent"?

Hmm, good point, it really depends on what the device wants - even if it 
is coherent, we don't necessarily know how it intends to use any 
particular reservation; allowing MSI writes or similar to allocate in a 
system cache wouldn't go too well, for instance.

Empirically, making the wrong assumption in this area can lead to people 
preferring to spend a year being unfairly rude on Twitter instead of 
providing timely productive feedback :(

>>> +					enum iommu_resv_type type;
>>> +
>>> +					/*
>>> +					 * IOMMU regions without an associated physical region
>>> +					 * cannot be mapped and are simply reservations.
>>> +					 */
>>> +					if (res.end > res.start)
>>> +						type = IOMMU_RESV_DIRECT_RELAXABLE;
>>
>> There may be reservations that have a PA but are expected to live beyond
>> boot-time handover, like device firmware or a shared-memory communication
>> buffer which the kernel driver can't reconfigure, or some kind of black hole
>> that needs a PA because it's also "no-map" for the CPUs. Those are not
>> relaxable. Might it be reasonable to expect to infer this from the
>> compatible, or should we have an additional explicit flag to distinguish
>> ephemeral boot-time mappings from permanent ones?
> 
>  From which compatible? the device's? That's not possible for the display
> processor on apple silicon machines. They will carry mappings for their
> firmware's data and heap and the boot framebuffer. That are however not
> direct mappings so it doesn't apply directly to
> IOMMU_RESV_DIRECT_RELAXABLE. There are probably other ways we could
> identify the boot framebuffer but so far I'm not even convinced that we
> want to reuse it.

I mean the compatibles of the reserved-memory nodes themselves. 
Semantically that should be the perfect way to identify their individual 
purposes, but in practice does mean that we might end up with a big 
match table to say that e.g. "apple,framebuffer" is relaxable and wants 
IOMMU_CACHE, and so on, and old kernels still have to have some default 
behaviour for new things they don't understand. It's not *too* far off 
the general situation for drivers, so if we expect these to be fairly 
rare, maybe that's OK? Particularly if it might be feasible to have some 
semi-generic compatibles to encapsulate the most common behaviours? I'm 
inclined to defer to Rob and Frank on this one.

>> Furthermore, we should only use IOMMU_RESV_DIRECT (in either form) if
>> start
>> and length actually match res here; if not then we should warn that we're
>> reserving the IOVA space but not actually honouring the specified mapping
>> (we'd need a new resv_region type for arbitrary translations).
> 
> This would be needed for Asahi's dcp driver. So far I worked around this
> problem by direct reserved-memory parsing from apple-dart.
> Probably best to postpone the extension until it's needed.

Indeed, as long as the binding is good from the outset, we can fill in 
support for the more specialised cases as and when.

Thanks,
Robin.
