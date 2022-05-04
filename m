Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD590C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 11:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbiEDLzq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 May 2022 07:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235325AbiEDLzp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 May 2022 07:55:45 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5ABD62CCA5
        for <linux-tegra@vger.kernel.org>; Wed,  4 May 2022 04:52:10 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D8121042;
        Wed,  4 May 2022 04:52:10 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E39163FA50;
        Wed,  4 May 2022 04:52:08 -0700 (PDT)
Message-ID: <63c021c4-57de-38fe-e48f-a308088d235b@arm.com>
Date:   Wed, 4 May 2022 12:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/tegra: Stop using iommu_present()
Content-Language: en-GB
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
References: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
 <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-05-04 01:52, Dmitry Osipenko wrote:
> On 4/11/22 16:46, Robin Murphy wrote:
>> @@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
>>   	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>>   	struct iommu_domain *domain;
>>   
>> +	/* For starters, this is moot if no IOMMU is available */
>> +	if (!device_iommu_mapped(&dev->dev))
>> +		return false;
> 
> Unfortunately this returns false on T30 with enabled IOMMU because we
> don't use IOMMU for Host1x on T30 [1] to optimize performance. We can't
> change it until we will update drivers to support Host1x-dedicated buffers.

Huh, so is dev->dev here not the DRM device? If it is, and 
device_iommu_mapped() returns false, then the later iommu_attach_group() 
call is going to fail anyway, so there's not much point allocating a 
domain. If it's not, then what the heck is host1x_drm_wants_iommu() 
actually testing for?

In the not-too-distant future we'll need to pass an appropriate IOMMU 
client device to iommu_domain_alloc() as well, so the sooner we can get 
this code straight the better.

Thanks,
Robin.

> 
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/host1x/dev.c#L258
> 
