Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38178C63777
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2511208B8
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTmPpz/T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgKYKLw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728953AbgKYKLw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 05:11:52 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D92FC0613D6;
        Wed, 25 Nov 2020 02:11:52 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 62so2003835pgg.12;
        Wed, 25 Nov 2020 02:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=toapRqQqRGs9x7o2KwSF6rY51ZrkrSfT/AsrgzJ6gOM=;
        b=QTmPpz/TMCBzqxaF/voXER8FjZCtSFUVivXTnfgYi4MuRvCBjP/nhjlgWyN2d3A/F6
         fhkRcchaEkr6jjawBJYTedi2nIeT0mgad5RfGMjV8xOu/5P2KDKylbo1WENBm2BPd/+R
         aPJbF2hqCPQc/c+hvYIb/bzi4lLhN9hr2mdo+HlIIbjOeoip55jDTgkqjunT3Z1cDGi1
         T1Z5eKRbUrbgF/7p6J/cnd86/f8TAFZdTBtJnju2LHQxMRNdxxk6wCFpqEZUxeKFqwYY
         CXKBMx0X4kU57H94XvVYPja7m6U2eunRphYMeP+/PUAg/4yMSL54LVexvZyAOBH7D9Og
         2HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=toapRqQqRGs9x7o2KwSF6rY51ZrkrSfT/AsrgzJ6gOM=;
        b=AQzKw0SvkOtxv5MpDHojQJ+OYIrC4ELBNAY2tITS8v0B5oqEJ5FshTZICq7LzuwfxZ
         RGBaZIP3v7yyX/saDjUWhTXJwwm3NDO+OMnjuBK8sh8hvzXZUJuJEBM0+q+H5vQdPeFi
         ZkizHTUBYkzyAjEt/tifeXnsOtFTtK6I3N92vPzVe1QzibZU9U1M4NWiVfvGuSZoVqb4
         7qdjVX4+9VGiZD3Aw92nrbOqJVr14popliKGwl8ILxBolxyFymX2UoxOKnVpYd/UIgdv
         LlIeFfm84cZN4FisIg7vfUwcQ8HQZZi8Zjnlv2YdcLMvDqocVaxyHVf2X+GjI5IChlCP
         GUxg==
X-Gm-Message-State: AOAM530pehLweM3WiPywKb3qh7AYppl+pqTcBu14kjeYuf4Cq2wjd2IH
        8Uac31GMC1RZdch3TCXYCLQ=
X-Google-Smtp-Source: ABdhPJz+kgK1SKaSlG/GMd9ykGwk9JVNcMAReP3VoDPyzikb8KWLjFhUjCowmXvV+MgomXLlOPfcMw==
X-Received: by 2002:a63:5864:: with SMTP id i36mr2541877pgm.68.1606299111623;
        Wed, 25 Nov 2020 02:11:51 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id r130sm1599496pfc.41.2020.11.25.02.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 02:11:51 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     will@kernel.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, thierry.reding@gmail.com, joro@8bytes.org
Subject: [PATCH RESEND v2 2/5] iommu/tegra-smmu: Expand mutex protection range
Date:   Wed, 25 Nov 2020 02:10:10 -0800
Message-Id: <20201125101013.14953-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125101013.14953-1-nicoleotsuka@gmail.com>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is used to protect potential race condition at use_count.
since probes of client drivers, calling attach_dev(), may run
concurrently.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index ec4c9dafff95..6a3ecc334481 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -256,26 +256,19 @@ static int tegra_smmu_alloc_asid(struct tegra_smmu *smmu, unsigned int *idp)
 {
 	unsigned long id;
 
-	mutex_lock(&smmu->lock);
-
 	id = find_first_zero_bit(smmu->asids, smmu->soc->num_asids);
-	if (id >= smmu->soc->num_asids) {
-		mutex_unlock(&smmu->lock);
+	if (id >= smmu->soc->num_asids)
 		return -ENOSPC;
-	}
 
 	set_bit(id, smmu->asids);
 	*idp = id;
 
-	mutex_unlock(&smmu->lock);
 	return 0;
 }
 
 static void tegra_smmu_free_asid(struct tegra_smmu *smmu, unsigned int id)
 {
-	mutex_lock(&smmu->lock);
 	clear_bit(id, smmu->asids);
-	mutex_unlock(&smmu->lock);
 }
 
 static bool tegra_smmu_capable(enum iommu_cap cap)
@@ -420,17 +413,21 @@ static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
 				 struct tegra_smmu_as *as)
 {
 	u32 value;
-	int err;
+	int err = 0;
+
+	mutex_lock(&smmu->lock);
 
 	if (as->use_count > 0) {
 		as->use_count++;
-		return 0;
+		goto unlock;
 	}
 
 	as->pd_dma = dma_map_page(smmu->dev, as->pd, 0, SMMU_SIZE_PD,
 				  DMA_TO_DEVICE);
-	if (dma_mapping_error(smmu->dev, as->pd_dma))
-		return -ENOMEM;
+	if (dma_mapping_error(smmu->dev, as->pd_dma)) {
+		err = -ENOMEM;
+		goto unlock;
+	}
 
 	/* We can't handle 64-bit DMA addresses */
 	if (!smmu_dma_addr_valid(smmu, as->pd_dma)) {
@@ -453,24 +450,35 @@ static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
 	as->smmu = smmu;
 	as->use_count++;
 
+	mutex_unlock(&smmu->lock);
+
 	return 0;
 
 err_unmap:
 	dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
+unlock:
+	mutex_unlock(&smmu->lock);
+
 	return err;
 }
 
 static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 				    struct tegra_smmu_as *as)
 {
-	if (--as->use_count > 0)
+	mutex_lock(&smmu->lock);
+
+	if (--as->use_count > 0) {
+		mutex_unlock(&smmu->lock);
 		return;
+	}
 
 	tegra_smmu_free_asid(smmu, as->id);
 
 	dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
 
 	as->smmu = NULL;
+
+	mutex_unlock(&smmu->lock);
 }
 
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
-- 
2.17.1

