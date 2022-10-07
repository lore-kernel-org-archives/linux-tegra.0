Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2519C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 14:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJGOV5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 10:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiJGOV4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 10:21:56 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61E381204F6;
        Fri,  7 Oct 2022 07:21:55 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66DE4106F;
        Fri,  7 Oct 2022 07:22:01 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC9253F67D;
        Fri,  7 Oct 2022 07:21:52 -0700 (PDT)
Message-ID: <75bebf10-6b89-464c-f9ad-c53f9f830c20@arm.com>
Date:   Fri, 7 Oct 2022 15:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
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
        Rob Herring <robh@kernel.org>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-2-thierry.reding@gmail.com>
 <3fb949ad-74c4-1bac-7e14-5d056afcef5f@arm.com> <Y0AvkshNYmqc3UGo@orome>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Y0AvkshNYmqc3UGo@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-10-07 14:54, Thierry Reding wrote:
> On Fri, Oct 07, 2022 at 02:45:31PM +0100, Robin Murphy wrote:
>> On 2022-09-23 13:35, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> This adds the "iommu-addresses" property to reserved-memory nodes, which
>>> allow describing the interaction of memory regions with IOMMUs. Two use-
>>> cases are supported:
>>>
>>>     1. Static mappings can be described by pairing the "iommu-addresses"
>>>        property with a "reg" property. This is mostly useful for adopting
>>>        firmware-allocated buffers via identity mappings. One common use-
>>>        case where this is required is if early firmware or bootloaders
>>>        have set up a bootsplash framebuffer that a display controller is
>>>        actively scanning out from during the operating system boot
>>>        process.
>>>
>>>     2. If an "iommu-addresses" property exists without a "reg" property,
>>>        the reserved-memory node describes an IOVA reservation. Such memory
>>>        regions are excluded from the IOVA space available to operating
>>>        system drivers and can be used for regions that must not be used to
>>>        map arbitrary buffers.
>>
>> Bah, I've only just realised: don't we also need to change the "oneOf:
>> required: ..." schema to permit "iommu-addresses" without "reg" or "size"?
> 
> Hm... good point. I think at least we'll want another:
> 
>       - required:
>           - iommu-addresses
> 
> in there. I wonder if we also need to avoid the combination of "size"
> and "iommu-addresses". When "size" is specified, is it guaranteed that
> those regions will be allocated before the direct mapping needs to be
> created?

Well, it couldn't really be a direct mapping anyway. In general I don't 
think that combination makes any sense, since the presence of 
"iommu-addresses" means one of two things; either it says the IOVA range 
is carved out for some special purpose or just unusable, in which case 
allocating any memory to back it would surely be pointless, or it's 
saying don't touch these addresses because the device is already 
accessing them, thus the underlying physical memory must be allocated 
somewhere already.

Thanks,
Robin.
