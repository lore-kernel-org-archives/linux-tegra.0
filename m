Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B5DC388F9
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:56:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E0E3206CA
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHWxrjDk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgKLBbC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgKKWno (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 17:43:44 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3985DC061A51;
        Wed, 11 Nov 2020 14:34:45 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id x15so1307560pfm.9;
        Wed, 11 Nov 2020 14:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=toapRqQqRGs9x7o2KwSF6rY51ZrkrSfT/AsrgzJ6gOM=;
        b=UHWxrjDkFEPCvuDe7aH9FuPVaei3xOeWyJGSl922440hNCi5WsxM7H1oamYrnhNj4t
         Su23i8QerGzzRPcSpQ+wIylWv0jd2Nd8eiBNrdam2RUp3ygJuGhDduP+Zpt+qs8Zb2v3
         QL0NWPVqCFaArESDr++odnwiGpf8JdmJQ+nm+VSEByAssV96BzuOnw/KMSYTrxDhk6da
         I2tjxr6e/giyUOAiGqbpZUOuebS8kpm9ZHSlwzfqjV/etuEfvFEJl21FW/vcnTktwouf
         JMnvkWhrleCAXtvFRYiNYKeK5KuOHAnthuey6QS/eYC7D7s661t+TzSEMmFHYvyk0GEu
         zB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=toapRqQqRGs9x7o2KwSF6rY51ZrkrSfT/AsrgzJ6gOM=;
        b=mxCOJXWYxCZn1A67JPNrsaZt0A4/pxGZTSm36AA/LzH8Yrvj57PMFncZkaFukb9hq8
         NAWSkUysnaz68ZwdQfunaY0NBxEHiJysLidgfj1ZUgl/+g0M+m/8FKuqu5Rj3bwDoVOD
         HXwBgujz0iO3clrMg5BAL4CwrwsoiDYogHpMtwSs9uXyU4K4xjshDee4ZntAy0vLhwXJ
         kO+UmT6TLLbxF8Z66bd9v5XDjM8U6j2Ba66BdQRnSNiluDpa1srgKNZdyJSAs2bV9qrE
         03bN9RPkGa3fpHD8+kUeqjBYDkXigmG5O+F1FNDHwCmxHpDeqqzgUYZhEJxs8sI3iLA9
         zyHw==
X-Gm-Message-State: AOAM532JCFIpXg17rW9RzRod/h5BVphbD2HV2QcjUsWK2oqqJq0uqjFl
        oO8YwfnpIeck2jjS1fSyhW0=
X-Google-Smtp-Source: ABdhPJyo41Y4x1kxQIPV881/38ZwmCjvI/c5M2DQtlIvm2gvWakTUHFcWcOAeMwciU8rYXgH4/uBQw==
X-Received: by 2002:a17:90a:d301:: with SMTP id p1mr6077664pju.49.1605134084803;
        Wed, 11 Nov 2020 14:34:44 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a20sm3605096pff.118.2020.11.11.14.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:34:44 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com
Subject: [PATCH RESEND 2/5] iommu/tegra-smmu: Expand mutex protection range
Date:   Wed, 11 Nov 2020 14:21:26 -0800
Message-Id: <20201111222129.15736-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111222129.15736-1-nicoleotsuka@gmail.com>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
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

