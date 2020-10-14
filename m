Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5FCC433DF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 17:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D389421D7F
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 17:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgJNRmk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 13:42:40 -0400
Received: from foss.arm.com ([217.140.110.172]:54806 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgJNRmk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 13:42:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52C11D6E;
        Wed, 14 Oct 2020 10:42:39 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E31D33F71F;
        Wed, 14 Oct 2020 10:42:37 -0700 (PDT)
Subject: Re: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, digetx@gmail.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
 <20201009161936.23122-4-nicoleotsuka@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
Date:   Wed, 14 Oct 2020 18:42:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201009161936.23122-4-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-09 17:19, Nicolin Chen wrote:
> This patch simply adds support for PCI devices.
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> 
> Changelog
> v6->v7
>   * Renamed goto labels, suggested by Thierry.
> v5->v6
>   * Added Dmitry's Reviewed-by and Tested-by.
> v4->v5
>   * Added Dmitry's Reviewed-by
> v3->v4
>   * Dropped !iommu_present() check
>   * Added CONFIG_PCI check in the exit path
> v2->v3
>   * Replaced ternary conditional operator with if-else in .device_group()
>   * Dropped change in tegra_smmu_remove()
> v1->v2
>   * Added error-out labels in tegra_smmu_probe()
>   * Dropped pci_request_acs() since IOMMU core would call it.
> 
>   drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
>   1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index be29f5977145..2941d6459076 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -10,6 +10,7 @@
>   #include <linux/kernel.h>
>   #include <linux/of.h>
>   #include <linux/of_device.h>
> +#include <linux/pci.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
>   	group->smmu = smmu;
>   	group->soc = soc;
>   
> -	group->group = iommu_group_alloc();
> +	if (dev_is_pci(dev))
> +		group->group = pci_device_group(dev);

Just to check, is it OK to have two or more swgroups "owning" the same 
iommu_group if an existing one gets returned here? It looks like that 
might not play nice with the use of iommu_group_set_iommudata().

Robin.

> +	else
> +		group->group = generic_device_group(dev);
> +
>   	if (IS_ERR(group->group)) {
>   		devm_kfree(smmu->dev, group);
>   		mutex_unlock(&smmu->lock);
> @@ -1075,22 +1080,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
>   	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
>   
>   	err = iommu_device_register(&smmu->iommu);
> -	if (err) {
> -		iommu_device_sysfs_remove(&smmu->iommu);
> -		return ERR_PTR(err);
> -	}
> +	if (err)
> +		goto remove_sysfs;
>   
>   	err = bus_set_iommu(&platform_bus_type, &tegra_smmu_ops);
> -	if (err < 0) {
> -		iommu_device_unregister(&smmu->iommu);
> -		iommu_device_sysfs_remove(&smmu->iommu);
> -		return ERR_PTR(err);
> -	}
> +	if (err < 0)
> +		goto unregister;
> +
> +#ifdef CONFIG_PCI
> +	err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
> +	if (err < 0)
> +		goto unset_platform_bus;
> +#endif
>   
>   	if (IS_ENABLED(CONFIG_DEBUG_FS))
>   		tegra_smmu_debugfs_init(smmu);
>   
>   	return smmu;
> +
> +unset_platform_bus: __maybe_unused;
> +	bus_set_iommu(&platform_bus_type, NULL);
> +unregister:
> +	iommu_device_unregister(&smmu->iommu);
> +remove_sysfs:
> +	iommu_device_sysfs_remove(&smmu->iommu);
> +
> +	return ERR_PTR(err);
>   }
>   
>   void tegra_smmu_remove(struct tegra_smmu *smmu)
> 
