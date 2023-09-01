Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395A6CA0FE2
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Sep 2023 03:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344936AbjIADF4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 31 Aug 2023 23:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbjIADF4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 31 Aug 2023 23:05:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6916BE7E
        for <linux-tegra@vger.kernel.org>; Thu, 31 Aug 2023 20:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693537553; x=1725073553;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZzXYA1V6PpYaMUXnnXqgHItAdZIgoY/oUFS+CWsU6+I=;
  b=fnHkiSs9z89dUyjbbokwCBoXFeN3UhIQFQiifk0DSZ8jvff/+Iu5/dfY
   URymWY+FE7KjOuhrpPLffFFrXOeJCmTHddcw6QTXLCdFO/OysyNiN3XH0
   M/j0T6bZ50IY7qHhTToqSr0dArCHDZ3GC26BBjdyq6YDSaoEumFya9E0j
   kYsgCFd5MVoC6/TpJFCSMIR1+wq2x4pBXHQ2kQ04ZpnaHTAm2kbWVq1A8
   IjWQSW+c/YBlSD5lnjmfG+SFNUQxs0IAEpMKhqcbleUQh2clElrcbmyIQ
   ojUiSAjOsIIbSF8TCsfmN//tB/UdPDBp8wLiRwRoK9kFVYNDBKBMcKu3N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407118326"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="407118326"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 20:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070577731"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="1070577731"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.30.41]) ([10.255.30.41])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 20:05:50 -0700
Message-ID: <8830ecd1-f7a3-a708-66b1-2d9698d0d477@linux.intel.com>
Date:   Fri, 1 Sep 2023 11:05:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc:     baolu.lu@linux.intel.com
Subject: Re: [PATCH] iommu/tegra-smmu: Fix the NULL vs IS_ERR() bug for
 debugfs_create_dir()
Content-Language: en-US
To:     Jinjie Ruan <ruanjinjie@huawei.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
References: <20230831123846.3137304-1-ruanjinjie@huawei.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20230831123846.3137304-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2023/8/31 20:38, Jinjie Ruan wrote:
> The debugfs_create_dir() function returns error pointers.
> It never returns NULL. So use IS_ERR() to check it.
> 
> Fixes: d1313e7896e9 ("iommu/tegra-smmu: Add debugfs support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/iommu/tegra-smmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index e445f80d0226..cd1d80c4c673 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -1056,7 +1056,7 @@ DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
>   static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
>   {
>   	smmu->debugfs = debugfs_create_dir("smmu", NULL);
> -	if (!smmu->debugfs)
> +	if (IS_ERR(smmu->debugfs))
>   		return;

There is no need to check the return value of debugfs_create_dir(). This
change cannot fix anything as far as I can see. Just remove the check.

>   
>   	debugfs_create_file("swgroups", S_IRUGO, smmu->debugfs, smmu,

Best regards,
baolu
