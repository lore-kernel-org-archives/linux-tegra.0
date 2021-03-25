Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C43C433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 819CD61A25
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCYO2F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:28:05 -0400
Received: from foss.arm.com ([217.140.110.172]:50798 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231400AbhCYO1n (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:27:43 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BD9A143D;
        Thu, 25 Mar 2021 07:27:43 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88173F792;
        Thu, 25 Mar 2021 07:27:41 -0700 (PDT)
Subject: Re: [PATCH 4/9] iommu/arm-smmu: Implement ->probe_finalize()
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-5-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <57ffa62b-76da-c643-fa68-aed92b1e92e0@arm.com>
Date:   Thu, 25 Mar 2021 14:27:34 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-03-25 13:03, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Implement a ->probe_finalize() callback that can be used by vendor
> implementations to perform extra programming necessary after devices
> have been attached to the SMMU.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 +++++++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d8c6bfde6a61..4589e76543a8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1447,6 +1447,22 @@ static void arm_smmu_release_device(struct device *dev)
>   	iommu_fwspec_free(dev);
>   }
>   
> +static void arm_smmu_probe_finalize(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct arm_smmu_master_cfg *cfg;
> +	struct arm_smmu_device *smmu;
> +
> +	if (!fwspec || fwspec->ops != &arm_smmu_ops)
> +		return;

I think we can trust the IOMMU core not to call things in the wrong 
order, and if the fwspec has changed since it was validated in 
.probe_device then the world is probably on fire anyway.

Robin.

> +
> +	cfg = dev_iommu_priv_get(dev);
> +	smmu = cfg->smmu;
> +
> +	if (smmu->impl->probe_finalize)
> +		smmu->impl->probe_finalize(smmu, dev);
> +}
> +
>   static struct iommu_group *arm_smmu_device_group(struct device *dev)
>   {
>   	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> @@ -1630,6 +1646,7 @@ static struct iommu_ops arm_smmu_ops = {
>   	.iova_to_phys		= arm_smmu_iova_to_phys,
>   	.probe_device		= arm_smmu_probe_device,
>   	.release_device		= arm_smmu_release_device,
> +	.probe_finalize		= arm_smmu_probe_finalize,
>   	.device_group		= arm_smmu_device_group,
>   	.domain_get_attr	= arm_smmu_domain_get_attr,
>   	.domain_set_attr	= arm_smmu_domain_set_attr,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index d2a2d1bc58ba..6779db30cebb 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -439,6 +439,7 @@ struct arm_smmu_impl {
>   				  struct device *dev, int start);
>   	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>   	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
> +	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
>   };
>   
>   #define INVALID_SMENDX			-1
> 
