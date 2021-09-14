Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99642C43217
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8478961155
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhINBsx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 21:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbhINBsv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 21:48:51 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2898AC061574;
        Mon, 13 Sep 2021 18:47:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so223897pjb.2;
        Mon, 13 Sep 2021 18:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xhb7cG3FXLCm4Z4ICTIF/90XZZ6Iro0K8KQdd4HxIGM=;
        b=oyvnmQsT6ijC+1swiq+sqhrVa5AexA4umH9CBR38uH4E/+jZZwyQo2toADpiASMjuu
         dhN8yI365m8nZQrWEgr4jlc710taZgYjho0HvXjQy73XjmDVNHtNNbO7SkUWHlSBUsVO
         rnmDRcBU75l2+ZhCVvceWxV39vP0vBXCiNBu4vijxZFWTUA3zHQsoGnWPh7V9xB4/BR6
         Y6b3yAEWpE/EWnRzF99ATWgPbvK3HXvzVr7CZSRiGcr9rlC/z168tqDvjlEqcs2b0wrN
         j0vYkXceL8Yp2sm0fhx22f1nml2u1oqipq69MRWGcTHjtSr0yPx5sYtmAMFy+sdxAIpQ
         +ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xhb7cG3FXLCm4Z4ICTIF/90XZZ6Iro0K8KQdd4HxIGM=;
        b=MlPYiNKQTc8SfNJnHzZyew05M6EJgPP8+bcOey/Ml11YKIBmcHMzJ0w3YNuNFa3IuN
         7fmS3DTjup8WLOE5R5HbHiUnPrnv4l341A5T789Bdh125S7J6m2bqpPR7XHNTUim1i4v
         7U2N8qf8ydxmWCIZIwLs6zo5vUfvGlNA31KYC8JpqKksHiDVxpmEQPgw1k2rS39wquGd
         e/aaxhcoLM1FLJSTNZr9onGK+Luljm2YAGml/f1BelbYUNjIGnz+//69nxzJcfpui15B
         8cuTLjn0F0ttDxFgoC29ahoAurA+Ma6iBnYk0VZBzxQqWklchA+FQ0T5YAN/7Scfdz9q
         UMhQ==
X-Gm-Message-State: AOAM530XnLFL8yNJ3inHsetbPG+ZNvt6NgNV36eCPeoIbTEKm5wDhTFC
        5Dck59keaTsunFMYVtZXh8RBSTVJZGFaQA==
X-Google-Smtp-Source: ABdhPJy94W1uW8sDKMd+DL+UWEzsAJK+kPnDL/7sqvbVJu0v/fitkXT3dDLg0zdzMQXvpqOdFhB+1w==
X-Received: by 2002:a17:90a:8817:: with SMTP id s23mr2663594pjn.181.1631584054659;
        Mon, 13 Sep 2021 18:47:34 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:47:34 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com
Subject: [PATCH v6 3/6] iommu/tegra-smmu: Rename struct tegra_smmu_swgroup *group to *swgrp
Date:   Mon, 13 Sep 2021 18:38:55 -0700
Message-Id: <20210914013858.31192-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914013858.31192-1-nicoleotsuka@gmail.com>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are both tegra_smmu_swgroup and tegra_smmu_group structs
using "group" for their pointer instances. This gets confusing
to read the driver sometimes.

So this patch renames "group" of struct tegra_smmu_swgroup to
"swgrp" as a cleanup. Also renames its "find" function.

Note that we already have "swgroup" being used for an unsigned
int type variable that is inside struct tegra_smmu_swgroup, so
it's not able to use "swgroup" but only something like "swgrp".

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index a32ed347e25d..0f3883045ffa 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -334,35 +334,35 @@ static void tegra_smmu_domain_free(struct iommu_domain *domain)
 }
 
 static const struct tegra_smmu_swgroup *
-tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
+tegra_smmu_find_swgrp(struct tegra_smmu *smmu, unsigned int swgroup)
 {
-	const struct tegra_smmu_swgroup *group = NULL;
+	const struct tegra_smmu_swgroup *swgrp = NULL;
 	unsigned int i;
 
 	for (i = 0; i < smmu->soc->num_swgroups; i++) {
 		if (smmu->soc->swgroups[i].swgroup == swgroup) {
-			group = &smmu->soc->swgroups[i];
+			swgrp = &smmu->soc->swgroups[i];
 			break;
 		}
 	}
 
-	return group;
+	return swgrp;
 }
 
 static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 			      unsigned int asid)
 {
-	const struct tegra_smmu_swgroup *group;
+	const struct tegra_smmu_swgroup *swgrp;
 	unsigned int i;
 	u32 value;
 
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
-	if (group) {
-		value = smmu_readl(smmu, group->reg);
+	swgrp = tegra_smmu_find_swgrp(smmu, swgroup);
+	if (swgrp) {
+		value = smmu_readl(smmu, swgrp->reg);
 		value &= ~SMMU_ASID_MASK;
 		value |= SMMU_ASID_VALUE(asid);
 		value |= SMMU_ASID_ENABLE;
-		smmu_writel(smmu, value, group->reg);
+		smmu_writel(smmu, value, swgrp->reg);
 	} else {
 		pr_warn("%s group from swgroup %u not found\n", __func__,
 				swgroup);
@@ -385,17 +385,17 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
 			       unsigned int asid)
 {
-	const struct tegra_smmu_swgroup *group;
+	const struct tegra_smmu_swgroup *swgrp;
 	unsigned int i;
 	u32 value;
 
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
-	if (group) {
-		value = smmu_readl(smmu, group->reg);
+	swgrp = tegra_smmu_find_swgrp(smmu, swgroup);
+	if (swgrp) {
+		value = smmu_readl(smmu, swgrp->reg);
 		value &= ~SMMU_ASID_MASK;
 		value |= SMMU_ASID_VALUE(asid);
 		value &= ~SMMU_ASID_ENABLE;
-		smmu_writel(smmu, value, group->reg);
+		smmu_writel(smmu, value, swgrp->reg);
 	}
 
 	for (i = 0; i < smmu->soc->num_clients; i++) {
@@ -1008,11 +1008,11 @@ static int tegra_smmu_swgroups_show(struct seq_file *s, void *data)
 	seq_printf(s, "------------------------\n");
 
 	for (i = 0; i < smmu->soc->num_swgroups; i++) {
-		const struct tegra_smmu_swgroup *group = &smmu->soc->swgroups[i];
+		const struct tegra_smmu_swgroup *swgrp = &smmu->soc->swgroups[i];
 		const char *status;
 		unsigned int asid;
 
-		value = smmu_readl(smmu, group->reg);
+		value = smmu_readl(smmu, swgrp->reg);
 
 		if (value & SMMU_ASID_ENABLE)
 			status = "yes";
@@ -1021,7 +1021,7 @@ static int tegra_smmu_swgroups_show(struct seq_file *s, void *data)
 
 		asid = value & SMMU_ASID_MASK;
 
-		seq_printf(s, "%-9s  %-7s  %#04x\n", group->name, status,
+		seq_printf(s, "%-9s  %-7s  %#04x\n", swgrp->name, status,
 			   asid);
 	}
 
-- 
2.17.1

