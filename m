Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED572C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C460961A2E
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhCYO2H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:28:07 -0400
Received: from foss.arm.com ([217.140.110.172]:50822 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231236AbhCYO1z (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:27:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C119D1476;
        Thu, 25 Mar 2021 07:27:54 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C9983F792;
        Thu, 25 Mar 2021 07:27:52 -0700 (PDT)
Subject: Re: [PATCH 7/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-8-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <4df4edff-9aa6-a742-8f6b-87a86f7eaba6@arm.com>
Date:   Thu, 25 Mar 2021 14:27:47 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-03-25 13:03, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra186 requires the same SID override programming as Tegra194 in order
> to seamlessly transition from the firmware framebuffer to the Linux
> framebuffer, so the Tegra implementation needs to be used on Tegra186
> devices as well.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 136872e77195..9f465e146799 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
>   		smmu->impl = &calxeda_impl;
>   
> -	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
> +	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
> +	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))

Binding update?

Robin.

>   		return nvidia_smmu_impl_init(smmu);
>   
>   	smmu = qcom_smmu_impl_init(smmu);
> 
