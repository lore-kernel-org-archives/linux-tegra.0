Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4946DC4727F
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 038EB2177B
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmkUGQOx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgIZIMc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 04:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbgIZIMb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 04:12:31 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412E8C0613D3;
        Sat, 26 Sep 2020 01:12:31 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so676432pjd.3;
        Sat, 26 Sep 2020 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cQy5r4UWby+Vec3bHtXW3n4G3fBT+msNMsjI9PpDyho=;
        b=hmkUGQOxgKIIyd8RLw/iYtrNnngZVsFSDi3UNm49yNZvc9/e5SaLtgUORdlPu/tUrW
         WPVYP1/4TVOB3PvNL4ogHylbdwdIOrd/b99aYyaU8j+G5J/m+8L4Vi2AECD1elfyRnIV
         W+1bnmZNKiiLDkw6XWqRy16clWzv64ECP1J11No6VVt6XHEjlWTt8ChdqgFfn94U6VHI
         AzkNPal30me6t9+ZI1I6G/8VltIivzMCd2k/W859yV82tLJJslA5prJ6oglFzgPVvNFG
         yoKE+ruxqH54BTOKR6ZZFBcxNVs53OWovo8wstDioYEKZTRf4Mso9ZujbHQiCBVwnV+j
         HXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cQy5r4UWby+Vec3bHtXW3n4G3fBT+msNMsjI9PpDyho=;
        b=MgJl+mDaAT4kMQhMDZdihjYG0Nk8ZjbTRHz09+IaXkQ8HZF1Ra10OoWlW4EJKsMd2v
         /hmALmQbHACtwYRPftZLqQgJPfw5vQebIjNieADbIE5QnuHQym+oFaHfOKtzueUcHlx+
         5YciA06REztzfepu+mWDOuEGkGHrHPWh02Nr51oDuJoYLWxQCJ/SNeWqsIoGRhQlKHeb
         4eAdezTHf1M56JzBlhKMg+s8vP/L4dAlygQ/93mYlZgaQpU3sAFMw8ufXjPlkF7DuM1c
         JnSDQPkh9hLidWjkAhL92khO9ZNq8FHptSKg0d5iuprIMxiTIiR0iaKVuHe6YihGfbex
         eGwQ==
X-Gm-Message-State: AOAM533asN+zycCYqcPVcQUP7y3ShMDgGeTiJYeoCVjPTmzQX+UJSjTA
        tW3+H/47w79GDngRvJHwH1c=
X-Google-Smtp-Source: ABdhPJzPsRm9Rhazt7BinH4NVa9O18uaL9DvZqntqAKhVGdEb1LQI9AysWQn9R25hWM3cMtqpMTQVw==
X-Received: by 2002:a17:902:b7c4:b029:d2:173:34ba with SMTP id v4-20020a170902b7c4b02900d2017334bamr3029562plz.57.1601107950759;
        Sat, 26 Sep 2020 01:12:30 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id i1sm4833497pfk.21.2020.09.26.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 01:12:30 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] iommu/tegra-smmu: Expend mutex protection range
Date:   Sat, 26 Sep 2020 01:07:16 -0700
Message-Id: <20200926080719.6822-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926080719.6822-1-nicoleotsuka@gmail.com>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is used to protect potential race condition at use_count.
since probes of client drivers, calling attach_dev(), may run
concurrently.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6335285dc373..b10e02073610 100644
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
+		goto err_unlock;
 	}
 
 	as->pd_dma = dma_map_page(smmu->dev, as->pd, 0, SMMU_SIZE_PD,
 				  DMA_TO_DEVICE);
-	if (dma_mapping_error(smmu->dev, as->pd_dma))
-		return -ENOMEM;
+	if (dma_mapping_error(smmu->dev, as->pd_dma)) {
+		err = -ENOMEM;
+		goto err_unlock;
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
+err_unlock:
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

