Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6ACDC4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C47520BED
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVYpadvL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgI2GTE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 02:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgI2GS6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 02:18:58 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55A9C061755;
        Mon, 28 Sep 2020 23:18:56 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so3500164pff.6;
        Mon, 28 Sep 2020 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=29m/WsHiomvftKkO4f2zYzL4z5u90lYqkPGhVYhCT8U=;
        b=sVYpadvLpMkkS4bEQ5e+A0z4ogXLC9YYnwmfGfHRrpyAPO+mNVYXnMFl122QKDJrGw
         vZnh8RsrTvECTSeKFo4A7mw6sqtceZx8oaZCQBIwbd4Lcxyo1hjJBp5zNtGJdMvODtjF
         2ScsoySk8y7L8dRABssQfFCxoNMnAoExuJEDmO+ROF+FRWWqn/ow40tkunGEVITa8ps8
         78YcrW2lIg0EFPMRKzaTKD+ESKNbtQkcoIr9CjC2MT4drf4E4dPQaNrKrb0Chi6OqUKD
         WTPYTD8DAmOd9WUmvd4oWbPugRTIbMrLQfgI+C4jkqzeavExEsJiLryMVMuvTOLBfsYh
         siGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=29m/WsHiomvftKkO4f2zYzL4z5u90lYqkPGhVYhCT8U=;
        b=lrtTNV/k3rrXjA7zkSF+rcQojDGOqtH27C2YKiMqyNTsPMOHoFMmBrG8RPQ7PnIGaa
         vNndgxdEtLOKyt9F5twe++HHTkyGknzSSpfiEcA1HwHahj9HJOc1hO+6QM+Esa3xD1HT
         XbP3CSySJvUPNTa0zQWHV0KyBn7oxeJ6j7cg6I9bRkqbvDGwn47mGGxVlwDFBz31+3cd
         5P57OopKFtbAySRIsZ5rPBZ6vlvJOKAp7FBCXiOIR2LgKd8eH8ZSKdsfA8DGZVq+UwYC
         lBbdp7lKv0Lhsimy3BFut4R3XPTQvEca+xUHJcT+gAk5W6Y2MymcIcXKBx9sW6UXf7mQ
         zI8g==
X-Gm-Message-State: AOAM530J+SNR4mhzpOi4dBWbzDwwX6JO5J7hmzjs3LHfIPwcYUwpaqG+
        9bGvK720Mhhzs5RRbiy77l4=
X-Google-Smtp-Source: ABdhPJz+ApO82+RbI3i9Xh25kUhL/M7Ed9+Bj/ABhHgIZjjh2iEQew+S6GYvefeS5GMP8D36tTkgZA==
X-Received: by 2002:a63:1a05:: with SMTP id a5mr2163913pga.145.1601360336284;
        Mon, 28 Sep 2020 23:18:56 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id cf7sm3280562pjb.52.2020.09.28.23.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, hch@infradead.org
Subject: [PATCH v4 2/2] iommu/tegra-smmu: Expand mutex protection range
Date:   Mon, 28 Sep 2020 23:13:25 -0700
Message-Id: <20200929061325.10197-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929061325.10197-1-nicoleotsuka@gmail.com>
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is used to protect potential race condition at use_count.
since probes of client drivers, calling attach_dev(), may run
concurrently.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v3->v4:
 * Fixed typo "Expend" => "Expand"
v2->v3:
 * Renamed label "err_unlock" to "unlock"
v1->v2:
 * N/A

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

