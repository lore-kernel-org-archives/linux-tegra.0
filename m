Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FAFC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE72A6113B
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhINBss (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 21:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhINBss (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 21:48:48 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BA3C061574;
        Mon, 13 Sep 2021 18:47:31 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id n30so7936419pfq.5;
        Mon, 13 Sep 2021 18:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=wZqHoyadq44npl8Iti+BxptrXlSWbYpcF970LVVeoyc=;
        b=X6j9hu+tKaHtxvWbiO9+nifx3OR+ly2BXHSI8eMNTy5q9sShGeM79vednhO1IYoZe4
         boIbuzhe2kioia/W9WZKr/a6/5CSi6TeXrE21Brb3EWJE7yQJruYU0twe6Je+Qrmp47H
         8JyjQZxAV9sQ1eA+S8wHYtPHcnbAcGWJQz3dFwCHEt+WMsjEPQzLz+QSzF01efusBX0X
         gdev54VoEAb49LbS+h6Fa8vokgP7uCAhH3TNkXxWk3RXZEqhU8s2GhH3uSI6q2rc9jWk
         SkOcclxJTyDeVvuCPcatnrYMRndsdD01+sWJ/1OQ/Kfn1pc8+CQ1W9GISY5RW29FWc0Q
         n/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wZqHoyadq44npl8Iti+BxptrXlSWbYpcF970LVVeoyc=;
        b=b2nIXRugYR+nNmgunLo+m1KrxLdTLuOLj6e4qY1hC8Rf2mNcEGqSBxFC4lb0ilgGEU
         6rokpQsgqB3RehnKgkwA1JriLQ4LsL5A+YKPHmxO89Ly85KYHrEkRkMRZTDEe/PWJXbi
         lnwr6/wtk++Ll0BMJ9bRa+gYPuRjtXiKekuaY1Po0oJdTgvNoVMYLpme7y/BKyH38sGs
         O3NqwnxQg+XeYBk0vvmvvDSOVlcsHtTMZD5efgButWjLW1CuAIaBHpn0RWaGEox/TfSh
         ubqZ8lrdZDPQpSOLopxP2JVZrj8SW7A8HrmrBbiOOVZlRWI4R2e4rKyFe4X1/EmLdkZ4
         PYaA==
X-Gm-Message-State: AOAM530NApZEv6Hlg226CVHCM++0/VvlkxrifDVEQfIB6eW9hIp5uwPI
        hOMnbzry572z/dc7o5dmlJjlJy424VL6SQ==
X-Google-Smtp-Source: ABdhPJyR7k/9948k7wHoMhA2p1sY4Jl5beEBsCLL1KcVjdQ+hMH4nAx2veJWCzYMXRPAU6Y9KSMdgw==
X-Received: by 2002:aa7:9056:0:b0:412:444e:f601 with SMTP id n22-20020aa79056000000b00412444ef601mr2282788pfo.84.1631584050925;
        Mon, 13 Sep 2021 18:47:30 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:47:30 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com
Subject: [PATCH v6 0/6] iommu/tegra-smmu: Add pagetable mappings to debugfs
Date:   Mon, 13 Sep 2021 18:38:52 -0700
Message-Id: <20210914013858.31192-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series of patches adds a new mappings node to debugfs for
tegra-smmu driver. The first five patches are all preparational
changes for PATCH-6, based on Thierry's review feedback against
v5: https://lkml.org/lkml/2021/3/16/447

Changelog
v6:
 * Added PATCH1-3 for better naming conventions
 * Added PATCH4-5 to embed previous struct tegra_smmu_group_debug
   into struct tegra_smmu_group
 * Dropped parentheses at SMMU_PTE_ATTR_SHIFT
 * Dropped swgrp->reg print
 * Replaced ptb_reg contents with as->attr and as->pd_dma
 * Added "index" and "count" in the PD entries for readability
 * Removed Dmitry's Tested-by and Reviewed-by for the big change
   from v5 to v6.
v5: https://lkml.org/lkml/2021/3/15/2473
 * Fixed a typo in commit message
 * Split a long line into two lines
 * Rearranged variable defines by length
 * Added Tested-by and Reviewed-by from Dmitry
v4: https://lkml.org/lkml/2021/3/14/429
 * Changed %d to %u for unsigned variables
 * Fixed print format mismatch warnings on ARM32
v3: https://lkml.org/lkml/2021/3/14/30
 * Fixed PHYS and IOVA print formats
 * Changed variables to unsigned int type
 * Changed the table outputs to be compact
v2: https://lkml.org/lkml/2021/3/9/1382
 * Expanded mutex range to the entire function
 * Added as->lock to protect pagetable walkthrough
 * Replaced devm_kzalloc with devm_kcalloc for group_debug
 * Added "PTE RANGE" and "SIZE" columns to group contiguous mappings
 * Dropped as->count check
 * Added WARN_ON when as->count mismatches pd[pd_index]
v1: https://lkml.org/lkml/2020/9/26/70

Nicolin Chen (6):
  iommu/tegra-smmu: Rename struct iommu_group *group to *grp
  iommu/tegra-smmu: Rename struct tegra_smmu_group_soc *soc to
    *group_soc
  iommu/tegra-smmu: Rename struct tegra_smmu_swgroup *group to *swgrp
  iommu/tegra-smmu: Use swgrp pointer instead of swgroup id
  iommu/tegra-smmu: Attach as pointer to tegra_smmu_group
  iommu/tegra-smmu: Add pagetable mappings to debugfs

 drivers/iommu/tegra-smmu.c | 312 +++++++++++++++++++++++++++++++------
 1 file changed, 262 insertions(+), 50 deletions(-)

-- 
2.17.1

