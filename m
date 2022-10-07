Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB083C4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 13:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJGNsd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 09:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiJGNs1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 09:48:27 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 261FC114DC6;
        Fri,  7 Oct 2022 06:48:26 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1555C106F;
        Fri,  7 Oct 2022 06:48:32 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A48653F67D;
        Fri,  7 Oct 2022 06:48:23 -0700 (PDT)
Message-ID: <b541eb50-fd9d-1105-4ae1-640ec7df1c68@arm.com>
Date:   Fri, 7 Oct 2022 14:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 5/5] iommu/tegra-smmu: Support managed domains
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
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-6-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220923123557.866972-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-09-23 13:35, Thierry Reding wrote:
> From: Navneet Kumar <navneetk@nvidia.com>
> 
> Allow creating identity and DMA API compatible IOMMU domains. When
> creating a DMA API compatible domain, make sure to also create the
> required cookie.

Nit: this description is now confusingly outdated.

> Signed-off-by: Navneet Kumar <navneetk@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - remove DMA cookie initialization that's now no longer needed
> 
>   drivers/iommu/tegra-smmu.c | 38 +++++++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 57b4f2b37447..7ad993330634 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -20,6 +20,8 @@
>   #include <soc/tegra/ahb.h>
>   #include <soc/tegra/mc.h>
>   
> +#include "dma-iommu.h"
> +
>   struct tegra_smmu_group {
>   	struct list_head list;
>   	struct tegra_smmu *smmu;
> @@ -277,7 +279,9 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
>   {
>   	struct tegra_smmu_as *as;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> +	if (type != IOMMU_DOMAIN_UNMANAGED &&
> +	    type != IOMMU_DOMAIN_DMA &&
> +	    type != IOMMU_DOMAIN_IDENTITY)

Since there's apparently no actual handling of IOMMU_DOMAIN_IDENTITY 
being added anywhere, AFAICS it's still going to set up an address space 
for translation with nothing mapped in its pagetable, which is pretty 
much the opposite of what's required :/

>   		return NULL;
>   
>   	as = kzalloc(sizeof(*as), GFP_KERNEL);
> @@ -287,25 +291,16 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
>   	as->attr = SMMU_PD_READABLE | SMMU_PD_WRITABLE | SMMU_PD_NONSECURE;
>   
>   	as->pd = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
> -	if (!as->pd) {
> -		kfree(as);
> -		return NULL;
> -	}
> +	if (!as->pd)
> +		goto free_as;
>   
>   	as->count = kcalloc(SMMU_NUM_PDE, sizeof(u32), GFP_KERNEL);
> -	if (!as->count) {
> -		__free_page(as->pd);
> -		kfree(as);
> -		return NULL;
> -	}
> +	if (!as->count)
> +		goto free_pd_range;
>   
>   	as->pts = kcalloc(SMMU_NUM_PDE, sizeof(*as->pts), GFP_KERNEL);
> -	if (!as->pts) {
> -		kfree(as->count);
> -		__free_page(as->pd);
> -		kfree(as);
> -		return NULL;
> -	}
> +	if (!as->pts)
> +		goto free_pts;

Nit: all this part is now just unrelated refactoring.

Thanks,
Robin.

>   
>   	spin_lock_init(&as->lock);
>   
> @@ -315,6 +310,15 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
>   	as->domain.geometry.force_aperture = true;
>   
>   	return &as->domain;
> +
> +free_pts:
> +	kfree(as->pts);
> +free_pd_range:
> +	__free_page(as->pd);
> +free_as:
> +	kfree(as);
> +
> +	return NULL;
>   }
>   
>   static void tegra_smmu_domain_free(struct iommu_domain *domain)
> @@ -1012,7 +1016,7 @@ static const struct iommu_ops tegra_smmu_ops = {
>   	.probe_device = tegra_smmu_probe_device,
>   	.release_device = tegra_smmu_release_device,
>   	.device_group = tegra_smmu_device_group,
> -	.get_resv_regions = of_iommu_get_resv_regions,
> +	.get_resv_regions = iommu_dma_get_resv_regions,
>   	.of_xlate = tegra_smmu_of_xlate,
>   	.pgsize_bitmap = SZ_4K,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
