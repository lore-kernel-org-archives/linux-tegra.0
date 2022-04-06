Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FD3C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 20:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234034AbiDFUPc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 16:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbiDFUOe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 16:14:34 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1667A10A7E7
        for <linux-tegra@vger.kernel.org>; Wed,  6 Apr 2022 11:07:03 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CDC912FC;
        Wed,  6 Apr 2022 11:07:03 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A4A23F718;
        Wed,  6 Apr 2022 11:07:01 -0700 (PDT)
Message-ID: <0f7bf1c2-7a21-13a0-8734-c53f624e1edd@arm.com>
Date:   Wed, 6 Apr 2022 19:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/tegra: Stop using iommu_present()
Content-Language: en-GB
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
References: <25247f43672df0aa58c1952bf3df2bf948e9f8ae.1649168393.git.robin.murphy@arm.com>
 <49165024-5f33-b6e6-7ec9-1ede6f562748@collabora.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <49165024-5f33-b6e6-7ec9-1ede6f562748@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-04-06 15:32, Dmitry Osipenko wrote:
> On 4/5/22 17:19, Robin Murphy wrote:
>> Remove the pointless check. host1x_drm_wants_iommu() cannot return true
>> unless an IOMMU exists for the host1x platform device, which at the moment
>> means the iommu_present() test could never fail.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index 9464f522e257..bc4321561400 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -1149,7 +1149,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>>   		goto put;
>>   	}
>>   
>> -	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
>> +	if (host1x_drm_wants_iommu(dev)) {
>>   		tegra->domain = iommu_domain_alloc(&platform_bus_type);
>>   		if (!tegra->domain) {
>>   			err = -ENOMEM;
> 
> host1x_drm_wants_iommu() returns true if there is no IOMMU for the
> host1x platform device of Tegra20/30 SoCs.

Ah, apparently this is another example of what happens when I write 
patches late on a Friday night...

So on second look, what we want to ascertain here is whether dev has an 
IOMMU, but only if the host1x parent is not addressing-limited, either 
because it can also use the IOMMU, or because all possible addresses are 
small enough anyway, right? Are we specifically looking for the host1x 
having a DMA-API-managed domain, or can that also end up using the 
tegra->domain or another unmanaged domain too? I can't quite figure out 
from the comments whether it's physical addresses, IOVAs, or both that 
we're concerned with here.

Thanks,
Robin.
