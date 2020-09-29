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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54F8C47423
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CF5320BED
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRdIbos8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgI2E6Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 00:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI2E6Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 00:58:24 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B091C061755;
        Mon, 28 Sep 2020 21:58:23 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d6so3328692pfn.9;
        Mon, 28 Sep 2020 21:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mmefgTkltOTlGpxCH/8jD3oM/MLFQKQB+1ziLN9r+E4=;
        b=jRdIbos8PnUoWY/ZHI0L9C/yTUuvHRl0JRVfH9DY3lhyAaUbGcIZDwJj/89c2pDSyr
         kQ5eupL6X8cAce8aboB9HPcoTLygyxOgY9bbarX1mpW+LUYE3ZL6yxX1HfnPHofYVdMc
         2BVUMFg+K2j9Fe9dt80gm3VDBMiNONfJQvpzezxWLJLECgYr2IWC1Fplgvv7ognB9y02
         t6w8Kc6q0FUym67bhq24Q+W4ZfW8CTZhLrwFfzsehNrTKcWhVhTZgibeShs6IjSx41u7
         I5aZZ+fz+caqTNVJreupzS1mPLmDXvRouJHD1RUBjGyzOGTCBhplRoehpx5hEgSjd7sm
         dDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mmefgTkltOTlGpxCH/8jD3oM/MLFQKQB+1ziLN9r+E4=;
        b=gXvizQ9sDAPSVZIyBdG+zUYy04JawNuZTABIPpux6N0pA5L8L949VWsN4X6XwbtVj2
         VYep9gEiyg0TRE03d2bg/m9z+RsULHmJY3lxoyE/okm7a+9ZlPP/IVf1M8q3j8kzvuS0
         mpdbsAxTxL02ZAzFclOrg1ULRtIdndbUeTuvJZhL8VwYtAt+cfopm/hOca1PmMVYuRaD
         3/f9DeBSPRUXg2Sld/R8cLTSrZS02+EssEMqdevdhp/gCm5w8i5Ap2FdbSESahtaxeDN
         Hf0Fq5zI+AX1lMjEXP0z82u+yJkfFjqWAv6EBPvEQNnkwMKnj5AalZpgotKoYKt9Leb6
         ITFg==
X-Gm-Message-State: AOAM532YgyciXFG/asnZJnLXHSriC1U+1FWY+io+I5GoWPuq5Gqy6v45
        NdLfnrEIqvJiUH8JQOpzMWU=
X-Google-Smtp-Source: ABdhPJzdavvYcdQY0CSLoQ88JBVa4a4hECmVUyuJ9YRA2KZEsC3udWNgPG7IhpPEcmQ/k5SCES3lHg==
X-Received: by 2002:a63:d242:: with SMTP id t2mr1955901pgi.47.1601355503208;
        Mon, 28 Sep 2020 21:58:23 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id f207sm3739028pfa.54.2020.09.28.21.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 21:58:22 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] iommu/tegra-smmu: Expend mutex protection range
Date:   Mon, 28 Sep 2020 21:52:47 -0700
Message-Id: <20200929045247.15596-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929045247.15596-1-nicoleotsuka@gmail.com>
References: <20200929045247.15596-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is used to protect potential race condition at use_count.
since probes of client drivers, calling attach_dev(), may run
concurrently.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
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

