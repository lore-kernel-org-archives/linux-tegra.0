Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B47C43457
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 10:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 906F222276
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 10:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgJSKz5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Oct 2020 06:55:57 -0400
Received: from foss.arm.com ([217.140.110.172]:55082 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgJSKz5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 06:55:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D12630E;
        Mon, 19 Oct 2020 03:55:56 -0700 (PDT)
Received: from [10.57.51.3] (unknown [10.57.51.3])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96F4A3F719;
        Mon, 19 Oct 2020 03:55:50 -0700 (PDT)
Subject: Re: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
 <20201009161936.23122-4-nicoleotsuka@gmail.com>
 <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
 <20201015041346.GA13936@Asurada-Nvidia>
 <340afbc0-5513-0742-d2d2-1ab908248af3@arm.com>
 <20201016035347.GA28140@Asurada-Nvidia>
 <1431eba3-d0b3-8460-2c12-573dc148e0df@arm.com>
 <20201017015607.GC7203@Asurada-Nvidia>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <9452ee18-4f85-a744-6520-bdd43fe137a9@arm.com>
Date:   Mon, 19 Oct 2020 11:55:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201017015607.GC7203@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-17 02:56, Nicolin Chen wrote:
> On Fri, Oct 16, 2020 at 03:10:26PM +0100, Robin Murphy wrote:
>> On 2020-10-16 04:53, Nicolin Chen wrote:
>>> On Thu, Oct 15, 2020 at 10:55:52AM +0100, Robin Murphy wrote:
>>>> On 2020-10-15 05:13, Nicolin Chen wrote:
>>>>> On Wed, Oct 14, 2020 at 06:42:36PM +0100, Robin Murphy wrote:
>>>>>> On 2020-10-09 17:19, Nicolin Chen wrote:
>>>>>>> This patch simply adds support for PCI devices.
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Changelog
>>>>>>> v6->v7
>>>>>>>      * Renamed goto labels, suggested by Thierry.
>>>>>>> v5->v6
>>>>>>>      * Added Dmitry's Reviewed-by and Tested-by.
>>>>>>> v4->v5
>>>>>>>      * Added Dmitry's Reviewed-by
>>>>>>> v3->v4
>>>>>>>      * Dropped !iommu_present() check
>>>>>>>      * Added CONFIG_PCI check in the exit path
>>>>>>> v2->v3
>>>>>>>      * Replaced ternary conditional operator with if-else in .device_group()
>>>>>>>      * Dropped change in tegra_smmu_remove()
>>>>>>> v1->v2
>>>>>>>      * Added error-out labels in tegra_smmu_probe()
>>>>>>>      * Dropped pci_request_acs() since IOMMU core would call it.
>>>>>>>
>>>>>>>      drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
>>>>>>>      1 file changed, 25 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
>>>>>>> index be29f5977145..2941d6459076 100644
>>>>>>> --- a/drivers/iommu/tegra-smmu.c
>>>>>>> +++ b/drivers/iommu/tegra-smmu.c
>>>>>>> @@ -10,6 +10,7 @@
>>>>>>>      #include <linux/kernel.h>
>>>>>>>      #include <linux/of.h>
>>>>>>>      #include <linux/of_device.h>
>>>>>>> +#include <linux/pci.h>
>>>>>>>      #include <linux/platform_device.h>
>>>>>>>      #include <linux/slab.h>
>>>>>>>      #include <linux/spinlock.h>
>>>>>>> @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
>>>>>>>      	group->smmu = smmu;
>>>>>>>      	group->soc = soc;
>>>>>>> -	group->group = iommu_group_alloc();
>>>>>>> +	if (dev_is_pci(dev))
>>>>>>> +		group->group = pci_device_group(dev);
>>>>>>
>>>>>> Just to check, is it OK to have two or more swgroups "owning" the same
>>>>>> iommu_group if an existing one gets returned here? It looks like that might
>>>>>> not play nice with the use of iommu_group_set_iommudata().
>>>>>
>>>>> Do you mean by "gets returned here" the "IS_ERR" check below?
>>>>
>>>> I mean that unlike iommu_group_alloc()/generic_device_group(),
>>>> pci_device_group() may give you back a group that already contains another
>>>> device and has already been set up from that device's perspective. This can
>>>> happen for topological reasons like requester ID aliasing through a PCI-PCIe
>>>> bridge or lack of isolation between functions.
>>>
>>> Okay..but we don't really have two swgroups owning the same groups
>>> in case of PCI devices. For Tegra210, all PCI devices inherit the
>>> same swgroup from the PCI controller. And I'd think previous chips
>>> do the same. The only use case currently of 2+ swgroups owning the
>>> same iommu_group is for display controller.
>>>
>>> Or do you suggest we need an additional check for pci_device_group?
>>
>> Ah, OK - I still don't have the best comprehension of what exactly swgroups
> 
> The "swgroup" stands for "software group", which associates with
> an ASID (Address Space Identifier) for SMMU to determine whether
> this client is going through SMMU translation or not.

So in Arm SMMU analogy terms it's more like a context bank index than a 
stream ID - got it.

>> are, and the path through .of_xlate looked like you might be using the PCI
>> requester ID as the swgroup identifier, but I guess that ultimately depends
>> on what your "iommu-map" is supposed to look like. If pci_device_group()
> 
> This is copied from pcie node in our downstream dtsi file:
> 
> 		iommus = <&mc TEGRA_SWGROUP_AFI>;
> 		iommu-map = <0x0 &mc TEGRA_SWGROUP_AFI 0x1000>;
> 		iommu-map-mask = <0x0>;

Aha, indeed that iommu-map-mask is the trick :)

>> will effectively only ever get called once regardless of how many endpoints
>> exist, then indeed this won't be a concern (although if that's *guaranteed*
>> to be the case then you may as well just stick with calling
>> iommu_group_alloc() directly). Thanks for clarifying.
> 
> All PCI devices are supposed to get this swgroup of the pcie node
> above. So the function will return the existing group of the pcie
> controller, before giving a chance to call iommu_group_alloc().

Yes, the "iommus" property will mean that the group always gets created 
first for the platform device owning the host bridge, and thus won't be 
visible to pci_device_group() anyway. Subsequent tegra_smmu_group_get() 
calls for the PCI devices (including the PCI side of the host bridge 
itself) are then going to match TEGRA_SWGROUP_AFI in the smmu->groups 
list lookup and return early, so the dev_is_pci() condition will never 
be true, and the call to pci_device_group() is in fact entirely dead code.

(I was assuming a case where you didn't have the "iommus" property, in 
which case you would reach that path exactly once for the first PCI 
device probed, wherein pci_device_group() is still only going to fall 
through to calling iommu_group_alloc() anyway).

Cheers,
Robin.
