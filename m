Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA751C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCEAD60F46
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbhKLNqs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:46:48 -0500
Received: from foss.arm.com ([217.140.110.172]:37606 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231848AbhKLNqr (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:46:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5207CED1;
        Fri, 12 Nov 2021 05:43:56 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 359863F70D;
        Fri, 12 Nov 2021 05:43:55 -0800 (PST)
Subject: Re: [PATCH 0/4] iommu/arm-smmu: Support Tegra234 SMMU
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e19479d9-f0b4-5347-1a43-2fcf5224a090@arm.com>
Date:   Fri, 12 Nov 2021 13:43:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112131231.3683098-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/11/2021 1:12 pm, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this series of patches adds and enables support for the ARM SMMU
> instances found on the new Tegra234 SoC. This is mostly similar to what
> can be found on Tegra194 except that there are a few more instances to
> meet increased bandwidth needs.
> 
> In addition to adding support for the new Tegra234 compatible string,
> this also adds a missing description for the nvidia,memory-controller
> property to the ARM SMMU device tree binding.

Besides a nitpick about the inconsistent enum ordering in patch #2,

Acked-by: Robin Murphy <robin.murphy@arm.com>

for patches #1-3.

Cheers,
Robin.

> I plan on picking up patch 4 into the Tegra tree because it has a
> dependency (for the stream ID definitions) on a separate patch series
> for the memory controller that I sent out earlier.
> 
> Thanks,
> Thierry
> 
> Thierry Reding (4):
>    dt-bindings: arm-smmu: Document nvidia,memory-controller property
>    dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
>    iommu/arm-smmu: Support Tegra234 SMMU
>    arm64: tegra: Add Tegra234 IOMMUs
> 
>   .../devicetree/bindings/iommu/arm,smmu.yaml   |  13 +-
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 426 ++++++++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   3 +-
>   3 files changed, 440 insertions(+), 2 deletions(-)
> 
