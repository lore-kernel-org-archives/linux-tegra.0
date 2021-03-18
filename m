Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4955DC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 10:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E87D764F18
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 10:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhCRKcG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 06:32:06 -0400
Received: from 8bytes.org ([81.169.241.247]:59686 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhCRKbd (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 06:31:33 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id B26D72D8; Thu, 18 Mar 2021 11:31:32 +0100 (CET)
Date:   Thu, 18 Mar 2021 11:31:31 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/tegra-smmu: Make tegra_smmu_probe_device() to
 handle all IOMMU phandles
Message-ID: <YFMsAzmkd0Mauj1t@8bytes.org>
References: <20210312155439.18477-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312155439.18477-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 12, 2021 at 06:54:39PM +0300, Dmitry Osipenko wrote:
> The tegra_smmu_probe_device() handles only the first IOMMU device-tree
> phandle, skipping the rest. Devices like 3D module on Tegra30 have
> multiple IOMMU phandles, one for each h/w block, and thus, only one
> IOMMU phandle is added to fwspec for the 3D module, breaking GPU.
> Previously this problem was masked by tegra_smmu_attach_dev() which
> didn't use the fwspec, but parsed the DT by itself. The previous commit
> to tegra-smmu driver partially reverted changes that caused problems for
> T124 and now we have tegra_smmu_attach_dev() that uses the fwspec and
> the old-buggy variant of tegra_smmu_probe_device() which skips secondary
> IOMMUs.
> 
> Make tegra_smmu_probe_device() not to skip the secondary IOMMUs. This
> fixes a partially attached IOMMU of the 3D module on Tegra30 and now GPU
> works properly once again.
> 
> Fixes: 765a9d1d02b2 ("iommu/tegra-smmu: Fix mc errors on tegra124-nyan")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied for v5.12, thanks.
