Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1239FC433E7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:10:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A772E20848
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408583AbgJPOKb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:10:31 -0400
Received: from foss.arm.com ([217.140.110.172]:37960 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408582AbgJPOKb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 10:10:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E61D930E;
        Fri, 16 Oct 2020 07:10:29 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D89C13F71F;
        Fri, 16 Oct 2020 07:10:27 -0700 (PDT)
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
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1431eba3-d0b3-8460-2c12-573dc148e0df@arm.com>
Date:   Fri, 16 Oct 2020 15:10:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201016035347.GA28140@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-16 04:53, Nicolin Chen wrote:
> On Thu, Oct 15, 2020 at 10:55:52AM +0100, Robin Murphy wrote:
>> On 2020-10-15 05:13, Nicolin Chen wrote:
>>> On Wed, Oct 14, 2020 at 06:42:36PM +0100, Robin Murphy wrote:
>>>> On 2020-10-09 17:19, Nicolin Chen wrote:
>>>>> This patch simply adds support for PCI devices.
>>>>>
>>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>>>>> ---
>>>>>
>>>>> Changelog
>>>>> v6->v7
>>>>>     * Renamed goto labels, suggested by Thierry.
>>>>> v5->v6
>>>>>     * Added Dmitry's Reviewed-by and Tested-by.
>>>>> v4->v5
>>>>>     * Added Dmitry's Reviewed-by
>>>>> v3->v4
>>>>>     * Dropped !iommu_present() check
>>>>>     * Added CONFIG_PCI check in the exit path
>>>>> v2->v3
>>>>>     * Replaced ternary conditional operator with if-else in .device_group()
>>>>>     * Dropped change in tegra_smmu_remove()
>>>>> v1->v2
>>>>>     * Added error-out labels in tegra_smmu_probe()
>>>>>     * Dropped pci_request_acs() since IOMMU core would call it.
>>>>>
>>>>>     drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
>>>>>     1 file changed, 25 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
>>>>> index be29f5977145..2941d6459076 100644
>>>>> --- a/drivers/iommu/tegra-smmu.c
>>>>> +++ b/drivers/iommu/tegra-smmu.c
>>>>> @@ -10,6 +10,7 @@
>>>>>     #include <linux/kernel.h>
>>>>>     #include <linux/of.h>
>>>>>     #include <linux/of_device.h>
>>>>> +#include <linux/pci.h>
>>>>>     #include <linux/platform_device.h>
>>>>>     #include <linux/slab.h>
>>>>>     #include <linux/spinlock.h>
>>>>> @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
>>>>>     	group->smmu = smmu;
>>>>>     	group->soc = soc;
>>>>> -	group->group = iommu_group_alloc();
>>>>> +	if (dev_is_pci(dev))
>>>>> +		group->group = pci_device_group(dev);
>>>>
>>>> Just to check, is it OK to have two or more swgroups "owning" the same
>>>> iommu_group if an existing one gets returned here? It looks like that might
>>>> not play nice with the use of iommu_group_set_iommudata().
>>>
>>> Do you mean by "gets returned here" the "IS_ERR" check below?
>>
>> I mean that unlike iommu_group_alloc()/generic_device_group(),
>> pci_device_group() may give you back a group that already contains another
>> device and has already been set up from that device's perspective. This can
>> happen for topological reasons like requester ID aliasing through a PCI-PCIe
>> bridge or lack of isolation between functions.
> 
> Okay..but we don't really have two swgroups owning the same groups
> in case of PCI devices. For Tegra210, all PCI devices inherit the
> same swgroup from the PCI controller. And I'd think previous chips
> do the same. The only use case currently of 2+ swgroups owning the
> same iommu_group is for display controller.
> 
> Or do you suggest we need an additional check for pci_device_group?

Ah, OK - I still don't have the best comprehension of what exactly 
swgroups are, and the path through .of_xlate looked like you might be 
using the PCI requester ID as the swgroup identifier, but I guess that 
ultimately depends on what your "iommu-map" is supposed to look like. If 
pci_device_group() will effectively only ever get called once regardless 
of how many endpoints exist, then indeed this won't be a concern 
(although if that's *guaranteed* to be the case then you may as well 
just stick with calling iommu_group_alloc() directly). Thanks for 
clarifying.

Robin.
