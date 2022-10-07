Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0393C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 16:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiJGQf5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 12:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJGQfw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 12:35:52 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 360C99E2F7;
        Fri,  7 Oct 2022 09:35:49 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CF3A106F;
        Fri,  7 Oct 2022 09:35:55 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CFF13F67D;
        Fri,  7 Oct 2022 09:35:45 -0700 (PDT)
Message-ID: <be053004-2d51-5d06-58b2-00e44dd93034@arm.com>
Date:   Fri, 7 Oct 2022 17:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 2/5] iommu: Implement of_iommu_get_resv_regions()
Content-Language: en-GB
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-3-thierry.reding@gmail.com>
 <c95801a2-4d37-ecd9-fc01-e2c32b6a6fdc@arm.com> <Y0BFkudEGLlAqeFj@orome>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Y0BFkudEGLlAqeFj@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-10-07 16:28, Thierry Reding wrote:
[...]
>>> @@ -172,3 +173,106 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>>>    	return ops;
>>>    }
>>> +
>>> +static inline bool check_direct_mapping(struct device *dev, struct resource *phys,
>>
>> Where "phys" is the virtual address, right? :(
> 
> No, phys is actually res passed in from of_iommu_get_resv_regions()
> where it is the address read from the "reg" property. So that's the
> physical address of the reserved region. Perhaps it'd be useful to
> rename "res" to "phys" in that function to be a little more consistent.
> It's actually the "start" and "end" values that are passed into this
> function that refer to the I/O virtual addresses from iommu-addresses.

Oh, so it's the phys_addr_t's that aren't physical addresses - well, it 
had to be wrong one way or the other :)

I agree that s/res/phys/ in the main function, and maybe s/start/iova/ 
too, would be helpful.

Thanks,
Robin.
