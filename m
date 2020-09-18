Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACECAC43463
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 09:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 602CB21973
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 09:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgIRJHe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 05:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRJHe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 05:07:34 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657A7C06174A
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 02:07:33 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 99E44396; Fri, 18 Sep 2020 11:07:30 +0200 (CEST)
Date:   Fri, 18 Sep 2020 11:07:29 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com, thierry.reding@gmail.com
Subject: Re: [RESEND][PATCH 0/2] iommu/tegra-smmu: Fix TLB line for Tegra210
Message-ID: <20200918090728.GL31590@8bytes.org>
References: <20200917113155.13438-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917113155.13438-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 17, 2020 at 04:31:53AM -0700, Nicolin Chen wrote:
> These two patches fix ACTIVE_TLB_LINES field setting in tegra-smmu
> driver for Tegra210 platforms.
> 
> This resend in series groups two previous seperate changes that're
> corelated, being pointed out by Thierry. Also adding his Acked-by.
> 
> Nicolin Chen (2):
>   iommu/tegra-smmu: Fix tlb_mask
>   memory: tegra: Correct num_tlb_lines for tegra210
> 
>  drivers/iommu/tegra-smmu.c      | 2 +-
>  drivers/memory/tegra/tegra210.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.
