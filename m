Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B01C77B75
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 11:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjEPLpm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 07:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjEPLpm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 07:45:42 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9D6426B5
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 04:45:40 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C4082F4;
        Tue, 16 May 2023 04:46:25 -0700 (PDT)
Received: from [10.57.83.102] (unknown [10.57.83.102])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72E6B3F663;
        Tue, 16 May 2023 04:45:39 -0700 (PDT)
Message-ID: <11d8adf1-75f5-5728-2139-e32aae6e6c49@arm.com>
Date:   Tue, 16 May 2023 12:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/4] iommu: tegra-gart cleanups
Content-Language: en-GB
To:     Nicolas Chauvet <kwizart@gmail.com>
Cc:     joro@8bytes.org, iommu@lists.linux.dev, will@kernel.org,
        jgg@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
References: <cover.1684154219.git.robin.murphy@arm.com>
 <CABr+WTnzNPfOGbAmy-E3pH9U5XR0y2PdVmDd2gtnv67ByEb_0w@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CABr+WTnzNPfOGbAmy-E3pH9U5XR0y2PdVmDd2gtnv67ByEb_0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2023-05-16 10:53, Nicolas Chauvet wrote:
> Le lun. 15 mai 2023 à 14:57, Robin Murphy <robin.murphy@arm.com> a écrit :
>>
>> Hi all,
>>
>> For the sake of discussion, here's my irrational pet project to bring
>> the tegra-gart driver right up to date as an example of a
>> properly-implemented IOMMU driver for a non-isolated address space. Part
>> of that irrationality is that I don't even own any hardware which uses
>> this driver, so it's only build-tested :)
>>
>> Thanks,
>> Robin.
>>
>>
>> Robin Murphy (4):
>>    iommu/tegra-gart: Add default identity domain support
>>    iommu/tegra-gart: Improve domain support
>>    iommu/tegra-gart: Generalise domain support
>>    iommu: Clean up force_aperture confusion
>>
>>   drivers/iommu/dma-iommu.c    |  19 ++--
>>   drivers/iommu/mtk_iommu_v1.c |   4 +
>>   drivers/iommu/sprd-iommu.c   |   1 +
>>   drivers/iommu/tegra-gart.c   | 162 +++++++++++++++++++----------------
>>   4 files changed, 99 insertions(+), 87 deletions(-)
> 
> 
> For what it worth, I've tried to test this serie with "grate patches"
> (1) rebased on top on 6.4-rc2, that would make use of the tegra-gart.
> That was on PAZ00 (with only 512M of RAM and 96M CMA still allocated).
> Unfortunately, this lead to the following errors with display problems
> (no character displayed in lxt-terminal and etc)

Thanks for testing - it's quite possible I've made a silly mistake 
somewhere, but just to double-check, does the same happen with the 
existing driver if you boot with "tegra-gart.gart_debug=1" (or at least 
enable the parameter via sysfs before the DRM driver gets going)?

Thanks,
Robin.

> [  888.691348] tegra-mc 7000f000.memory-controller: gart: Page entry is in-use
> [  888.698400] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> mapping failed 4294967274 262144
> [  888.707365] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> failed size 262144: -12
> [  888.716735] tegra-mc 7000f000.memory-controller: gart: Page entry is in-use
> [  888.723800] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> mapping failed 4294967274 262144
> [  888.733156] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> failed size 262144: -12
> [  889.055247] tegra-mc 7000f000.memory-controller: gart: Page entry is in-use
> [  889.062296] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> mapping failed 4294967274 262144
> [  889.071266] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> failed size 262144: -12
> 
> (1) https://github.com/grate-driver/linux
