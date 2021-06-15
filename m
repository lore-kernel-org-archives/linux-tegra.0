Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C54C48BDF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 18:08:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D747C610A0
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 18:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhFOSKt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 14:10:49 -0400
Received: from foss.arm.com ([217.140.110.172]:42508 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230370AbhFOSKr (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 14:10:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCFD4ED1;
        Tue, 15 Jun 2021 11:08:41 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A32B3F694;
        Tue, 15 Jun 2021 11:08:40 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] iommu/arm-smmu: Implement ->probe_finalize()
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-4-thierry.reding@gmail.com>
 <CGME20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778@eucas1p2.samsung.com>
 <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <b070bca8-f8e8-8f58-5b3c-2b587e93d9e5@arm.com>
Date:   Tue, 15 Jun 2021 19:08:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-06-15 19:01, Marek Szyprowski wrote:
> Hi,
> 
> On 03.06.2021 18:46, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Implement a ->probe_finalize() callback that can be used by vendor
>> implementations to perform extra programming necessary after devices
>> have been attached to the SMMU.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> This patch landed recently in linux-next as commit 0d97174aeadf
> ("iommu/arm-smmu: Implement ->probe_finalize()"). It causes the
> following issue on ARM Juno R1 board:

[...]

>> +static void arm_smmu_probe_finalize(struct device *dev)
>> +{
>> +	struct arm_smmu_master_cfg *cfg;
>> +	struct arm_smmu_device *smmu;
>> +
>> +	cfg = dev_iommu_priv_get(dev);
>> +	smmu = cfg->smmu;
>> +
>> +	if (smmu->impl->probe_finalize)

Oops, indeed that needs to check smmu->impl first.

Robin.

>> +		smmu->impl->probe_finalize(smmu, dev);
>> +}
>> +
