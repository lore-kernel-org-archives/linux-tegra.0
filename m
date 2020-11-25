Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59E1C64E7A
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 14:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A61020684
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 14:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="urmeyfJA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbgKYOFe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 09:05:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:36324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgKYOFe (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 09:05:34 -0500
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 047E720684;
        Wed, 25 Nov 2020 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606313133;
        bh=nlropR2GVshViNQ37mRXiDY92PPVrpHL27XsaeQ2YQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=urmeyfJAGKiqg0PdUHFJzhGcTKe5Nb2ymqRQJpmLq1BY+8OJlFntcjnjMjO3ksliE
         pMnsTccb9vj9awndZMZjxQA85RPe+X2PrUtn33+WI3AcDJcaNTWEj1M1cqY9+pc93+
         2+pjUsoWb/N+LmmpW+osDxnaZ3JePZNdLJLQwNjg=
From:   Will Deacon <will@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, thierry.reding@gmail.com
Subject: Re: [PATCH RESEND v2 0/5] iommu/tegra-smmu: Some pending reviewed changes
Date:   Wed, 25 Nov 2020 14:05:18 +0000
Message-Id: <160630228218.3309190.17273821531692081062.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201125101013.14953-1-nicoleotsuka@gmail.com>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 25 Nov 2020 02:10:08 -0800, Nicolin Chen wrote:
> Changelog
> v1->v2:
>  * Added Thierry's acks to PATCH-3~5
> 
> This is a merged set of resend for previously two series of patches
> that were reviewed/acked a month ago yet have not got applied.
> 
> [...]

Applied to arm64 (for-next/iommu/tegra-smmu), thanks!

[1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
      https://git.kernel.org/arm64/c/cf910f61aff3
[2/5] iommu/tegra-smmu: Expand mutex protection range
      https://git.kernel.org/arm64/c/d5f583bf8654
[3/5] iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
      https://git.kernel.org/arm64/c/8750d207dc98
[4/5] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
      https://git.kernel.org/arm64/c/25938c73cd79
[5/5] iommu/tegra-smmu: Add PCI support
      https://git.kernel.org/arm64/c/541f29bb0643

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
