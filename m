Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1BCC4363D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B65BA2396E
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgIXKdI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 06:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgIXKdI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 06:33:08 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079B2C0613CE;
        Thu, 24 Sep 2020 03:33:08 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 3723B295; Thu, 24 Sep 2020 12:33:06 +0200 (CEST)
Date:   Thu, 24 Sep 2020 12:33:04 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com
Subject: Re: [PATCH 0/3] iommu/tegra-smmu: Some small fixes
Message-ID: <20200924103304.GN27174@8bytes.org>
References: <20200911071643.17212-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911071643.17212-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 11, 2020 at 12:16:40AM -0700, Nicolin Chen wrote:
> These are a series of small fixes for tegra-smmu driver.
> They might not be critial bugs as current mainline does
> not enable a lot of clients, but be nicer to have since
> we are going to enable the DMA domain for other clients
> in the near future.
> 
> Nicolin Chen (3):
>   iommu/tegra-smmu: Do not use PAGE_SHIFT and PAGE_MASK
>   iommu/tegra-smmu: Fix iova->phys translation
>   iommu/tegra-smmu: Allow to group clients in same swgroup
> 
>  drivers/iommu/tegra-smmu.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)

Applied, thanks.
