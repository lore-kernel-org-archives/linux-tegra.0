Return-Path: <SRS0=Wy30=DW=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741DEC433E7
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 09:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F02F206D4
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 09:55:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731095AbgJOJz5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Oct 2020 05:55:57 -0400
Received: from foss.arm.com ([217.140.110.172]:53614 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727165AbgJOJzz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Oct 2020 05:55:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ED2FD6E;
        Thu, 15 Oct 2020 02:55:54 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01A7C3F66B;
        Thu, 15 Oct 2020 02:55:52 -0700 (PDT)
Subject: Re: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
 <20201009161936.23122-4-nicoleotsuka@gmail.com>
 <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
 <20201015041346.GA13936@Asurada-Nvidia>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <340afbc0-5513-0742-d2d2-1ab908248af3@arm.com>
Date:   Thu, 15 Oct 2020 10:55:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201015041346.GA13936@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-15 05:13, Nicolin Chen wrote:
> On Wed, Oct 14, 2020 at 06:42:36PM +0100, Robin Murphy wrote:
>> On 2020-10-09 17:19, Nicolin Chen wrote:
>>> This patch simply adds support for PCI devices.
>>>
>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>>> ---
>>>
>>> Changelog
>>> v6->v7
>>>    * Renamed goto labels, suggested by Thierry.
>>> v5->v6
>>>    * Added Dmitry's Reviewed-by and Tested-by.
>>> v4->v5
>>>    * Added Dmitry's Reviewed-by
>>> v3->v4
>>>    * Dropped !iommu_present() check
>>>    * Added CONFIG_PCI check in the exit path
>>> v2->v3
>>>    * Replaced ternary conditional operator with if-else in .device_group()
>>>    * Dropped change in tegra_smmu_remove()
>>> v1->v2
>>>    * Added error-out labels in tegra_smmu_probe()
>>>    * Dropped pci_request_acs() since IOMMU core would call it.
>>>
>>>    drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
>>>    1 file changed, 25 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
>>> index be29f5977145..2941d6459076 100644
>>> --- a/drivers/iommu/tegra-smmu.c
>>> +++ b/drivers/iommu/tegra-smmu.c
>>> @@ -10,6 +10,7 @@
>>>    #include <linux/kernel.h>
>>>    #include <linux/of.h>
>>>    #include <linux/of_device.h>
>>> +#include <linux/pci.h>
>>>    #include <linux/platform_device.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/spinlock.h>
>>> @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
>>>    	group->smmu = smmu;
>>>    	group->soc = soc;
>>> -	group->group = iommu_group_alloc();
>>> +	if (dev_is_pci(dev))
>>> +		group->group = pci_device_group(dev);
>>
>> Just to check, is it OK to have two or more swgroups "owning" the same
>> iommu_group if an existing one gets returned here? It looks like that might
>> not play nice with the use of iommu_group_set_iommudata().
> 
> Do you mean by "gets returned here" the "IS_ERR" check below?

I mean that unlike iommu_group_alloc()/generic_device_group(), 
pci_device_group() may give you back a group that already contains 
another device and has already been set up from that device's 
perspective. This can happen for topological reasons like requester ID 
aliasing through a PCI-PCIe bridge or lack of isolation between functions.

Robin.

>>> +	else
>>> +		group->group = generic_device_group(dev);
>>> +
>>>    	if (IS_ERR(group->group)) {
>>>    		devm_kfree(smmu->dev, group);
>>>    		mutex_unlock(&smmu->lock);
