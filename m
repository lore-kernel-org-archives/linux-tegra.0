Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDA2C77B7F
	for <linux-tegra@archiver.kernel.org>; Wed, 17 May 2023 11:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjEQLEY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 May 2023 07:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjEQLEX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 May 2023 07:04:23 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0CC70ED
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 04:03:55 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923431FB;
        Wed, 17 May 2023 03:55:46 -0700 (PDT)
Received: from [10.57.84.7] (unknown [10.57.84.7])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 903B73F793;
        Wed, 17 May 2023 03:55:00 -0700 (PDT)
Message-ID: <864d2de3-a2d7-9d59-a24a-27fd33e29497@arm.com>
Date:   Wed, 17 May 2023 11:54:56 +0100
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
 <11d8adf1-75f5-5728-2139-e32aae6e6c49@arm.com>
 <CABr+WTm=SehaNVaFym5FM-tpCvh93Ma_xG3xX5PuGt6n9+xh4Q@mail.gmail.com>
 <aadb69ff-732d-cffc-ab44-398269a11d4e@arm.com>
 <CABr+WT=qZvvW5QqCW_J0V20-56d_2+xkdPs0FcgiJZiY6K0CCg@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CABr+WT=qZvvW5QqCW_J0V20-56d_2+xkdPs0FcgiJZiY6K0CCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2023-05-16 16:15, Nicolas Chauvet wrote:
> Le mar. 16 mai 2023 à 14:31, Robin Murphy <robin.murphy@arm.com> a écrit :
>>
>> On 2023-05-16 13:16, Nicolas Chauvet wrote:
>>> Le mar. 16 mai 2023 à 13:45, Robin Murphy <robin.murphy@arm.com> a écrit :
>>>>
>>>> On 2023-05-16 10:53, Nicolas Chauvet wrote:
>>> ...
>>>>> For what it worth, I've tried to test this serie with "grate patches"
>>>>> (1) rebased on top on 6.4-rc2, that would make use of the tegra-gart.
>>>>> That was on PAZ00 (with only 512M of RAM and 96M CMA still allocated).
>>>>> Unfortunately, this lead to the following errors with display problems
>>>>> (no character displayed in lxt-terminal and etc)
>>>>
>>>> Thanks for testing - it's quite possible I've made a silly mistake
>>>> somewhere, but just to double-check, does the same happen with the
>>>> existing driver if you boot with "tegra-gart.gart_debug=1" (or at least
>>>> enable the parameter via sysfs before the DRM driver gets going)?
>>>
>>> Using echo 1 > /sys/module/tegra_gart/parameters/gart_debug shows the
>>> same messages and the same artefacts (missing refreshed window
>>> content).
>>> Using "echo 0 > /sys/module/tegra_gart/parameters/gart_debug" revert
>>> back to normal...
>>
>> OK, cool, so it looks like a pre-existing bug in the caller, but I guess
>> it does mean that unconditionally enabling the checks isn't ideal until
>> that can be sorted out.
> 
> Seems like I had a non-default option with tegra-drm that was
> controlling the way tegra-gart is used:
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/grate/gart.c#L19-L29
> 
> With option 4, occurrences of failing allocation are experienced more
> often than the default 0 options when only "scattered BOs are mapped".
> Also with the default option, no noticeable failure is seen.

Oh, I see it now - the logic around tegra_bo_mm_evict_something() 
actually depends on being able to map new PTEs over the top of existing 
ones without an unmap :/

The map/unmap overhead that that's trying to avoid could probably be 
reduced quite significantly anyway by converting GART to the new 
map_pages/unmap_pages callbacks.

Thanks,
Robin.
