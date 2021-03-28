Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D55C433DB
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BF846188B
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhC1Xet (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 19:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhC1Xei (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 19:34:38 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6A4C061756;
        Sun, 28 Mar 2021 16:34:38 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id y18so10862013qky.11;
        Sun, 28 Mar 2021 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=utR9Ua8PasQv/qM4orgEKume/FeHhlE56ieKCoQZzf8=;
        b=CU9ivXrg2DYVFljOnN+YtABR/taupBmETagCLavCliciPvfDyHuUYSjjvWw16wAhhu
         moIalC15lKpeeZnufYNzBLqNbWxLxz23itVfLCbBmV5udE5DJLnFBEqg6DjsCr9gdoDy
         HOdGG6K6St9bO4t+lQ7y78rZ2Gt0g5HZDaU328m6CjlUlHKt4qIvqvxqnAfsK/3J5uQX
         f/46tGH08UyZQhNMjsGXxZVEGQNQ2bqKz2K8vX32meCyWqb/SZiyZOHhQGr/0RnCTtPL
         OL74/lTsHLTSkA4h8eEXIh8r/NNK8SYL+8M7ufmn0TebTNV9P+5ujdz9C3/T0wsyKOZ0
         rs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=utR9Ua8PasQv/qM4orgEKume/FeHhlE56ieKCoQZzf8=;
        b=TGiaIZh/3ngg5O4Xq7aauGyIxoXQHbdN3qyF1YwthJ3uhXyvCcvMfuEA9SBCJWI1c4
         Nym+lQZV5LtRF9NV2o/Ob8HDE0M7QYWmTGlVQDyw5W5TVOxp14PxB5c6BZr/sETPcrhD
         Cmh3miAxDnnL3zOOuD0EXCw8vcDGrDPy2nfKGIT/rF9GzDzeTRi0KhNQ36nDetOVw4Sn
         74heX0Ek3bVPnl8vGP+w9RUIAuFccmLvRiNDAXKYK/bJy5E2DlyWbpDAx8XJD7AmWaE1
         J/0EV3p8b0YEsdH7HaemEvtv5OfvdQpI/oqEgL9kOpWN7QSivxvuayyNS6l0JxG7z/dp
         IZ0g==
X-Gm-Message-State: AOAM531ZY/AM8DN/LUAXYZNQ6wVoAcn0ujgh1mdEFFF55P0A8+k2nPVr
        4wOrS5dhi7jq3SUsLXQPvaZNHOgGpW8=
X-Google-Smtp-Source: ABdhPJz4mD3jUksqqD9/XrLKQu8py5npXtytv1j0f1hmNJ31dgMwOw2zHiMSuKpP3/WpcAhNZELOcg==
X-Received: by 2002:a05:620a:15b4:: with SMTP id f20mr15849272qkk.175.1616974477751;
        Sun, 28 Mar 2021 16:34:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id g2sm10117905qtu.0.2021.03.28.16.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 16:34:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was needed for Nyan Big Chromebook
Date:   Mon, 29 Mar 2021 02:32:56 +0300
Message-Id: <20210328233256.20494-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210328233256.20494-1-digetx@gmail.com>
References: <20210328233256.20494-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The previous commit fixes problem where display client was attaching too
early to IOMMU during kernel boot in a multi-platform kernel configuration
which enables CONFIG_ARM_DMA_USE_IOMMU=y. The workaround that helped to
defer the IOMMU attachment for Nyan Big Chromebook isn't needed anymore,
revert it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 71 +-------------------------------------
 1 file changed, 1 insertion(+), 70 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index af1e4b5adb27..572a4544ae88 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -869,69 +869,10 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
 }
 
-static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
-{
-	struct platform_device *pdev;
-	struct tegra_mc *mc;
-
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return NULL;
-
-	mc = platform_get_drvdata(pdev);
-	if (!mc)
-		return NULL;
-
-	return mc->smmu;
-}
-
-static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
-				struct of_phandle_args *args)
-{
-	const struct iommu_ops *ops = smmu->iommu.ops;
-	int err;
-
-	err = iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
-	if (err < 0) {
-		dev_err(dev, "failed to initialize fwspec: %d\n", err);
-		return err;
-	}
-
-	err = ops->of_xlate(dev, args);
-	if (err < 0) {
-		dev_err(dev, "failed to parse SW group ID: %d\n", err);
-		iommu_fwspec_free(dev);
-		return err;
-	}
-
-	return 0;
-}
-
 static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
-	struct device_node *np = dev->of_node;
-	struct tegra_smmu *smmu = NULL;
-	struct of_phandle_args args;
-	unsigned int index = 0;
-	int err;
-
-	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					  &args) == 0) {
-		smmu = tegra_smmu_find(args.np);
-		if (smmu) {
-			err = tegra_smmu_configure(smmu, dev, &args);
-
-			if (err < 0) {
-				of_node_put(args.np);
-				return ERR_PTR(err);
-			}
-		}
-
-		of_node_put(args.np);
-		index++;
-	}
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 
-	smmu = dev_iommu_priv_get(dev);
 	if (!smmu)
 		return ERR_PTR(-ENODEV);
 
@@ -1158,16 +1099,6 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	if (!smmu)
 		return ERR_PTR(-ENOMEM);
 
-	/*
-	 * This is a bit of a hack. Ideally we'd want to simply return this
-	 * value. However the IOMMU registration process will attempt to add
-	 * all devices to the IOMMU when bus_set_iommu() is called. In order
-	 * not to rely on global variables to track the IOMMU instance, we
-	 * set it here so that it can be looked up from the .probe_device()
-	 * callback via the IOMMU device's .drvdata field.
-	 */
-	mc->smmu = smmu;
-
 	size = BITS_TO_LONGS(soc->num_asids) * sizeof(long);
 
 	smmu->asids = devm_kzalloc(dev, size, GFP_KERNEL);
-- 
2.30.2

