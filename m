Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10424C4708D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 18:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbiLESkz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 13:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232831AbiLESkP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 13:40:15 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5ECDE2608;
        Mon,  5 Dec 2022 10:37:38 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFA2D23A;
        Mon,  5 Dec 2022 10:37:44 -0800 (PST)
Received: from [10.57.71.118] (unknown [10.57.71.118])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9AE63F73B;
        Mon,  5 Dec 2022 10:37:35 -0800 (PST)
Message-ID: <0da1d3d0-6543-b352-7561-de0a483f2c22@arm.com>
Date:   Mon, 5 Dec 2022 18:37:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v12 4/4] iommu: dma: Use of_iommu_get_resv_regions()
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
        Frank Rowand <frowand.list@gmail.com>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
 <20221117185424.2359687-5-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221117185424.2359687-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-11-17 18:54, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For device tree nodes, use the standard of_iommu_get_resv_regions()
> implementation to obtain the reserved memory regions associated with a
> device.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/dma-iommu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 9297b741f5e8..709b05d3aad2 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -23,6 +23,7 @@
>   #include <linux/memremap.h>
>   #include <linux/mm.h>
>   #include <linux/mutex.h>
> +#include <linux/of_iommu.h>
>   #include <linux/pci.h>
>   #include <linux/scatterlist.h>
>   #include <linux/spinlock.h>
> @@ -391,6 +392,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
>   	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
>   		iort_iommu_get_resv_regions(dev, list);
>   
> +	if (dev->of_node)
> +		of_iommu_get_resv_regions(dev, list);
>   }
>   EXPORT_SYMBOL(iommu_dma_get_resv_regions);
>   
