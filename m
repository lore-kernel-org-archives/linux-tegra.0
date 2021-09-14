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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FEDC43217
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E25C561151
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhINBsz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 21:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbhINBsy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 21:48:54 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9CAC061574;
        Mon, 13 Sep 2021 18:47:37 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso877107pjh.5;
        Mon, 13 Sep 2021 18:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FAqoKbYCswJVkOTch12PwlqXExdb3kYI3vk6OlVyx9g=;
        b=gYBEGwhEWqK0u1Ir4IzJ5vtfdG6eyqheL1fWG7eZhyXjzYaRJuljD+x6xfVdsAcLy9
         w1nwv5KBwT13wTATYjeDWdrEnty6t1LzqTQXBPrWabwZOod9P3Zx4QnSSoWWez3kT4HN
         +dJXJ29R34Xr+qFuYOe5UxbVHWgqOOBrEaCb/qaACvNjZr3kHba+g3RsJPeiwdmRRV7r
         I7hJL8cz8fUphVmj6yqnXQNBMZC83hWrMxZXwLbwW1O13DUcTHt2T0ktb5Eh5CYEcl9T
         kVRkqNc0cFsKMq0UuUPUAEWzbfBhEX7y7/cCTaNExkd6lSjBGEjNmWsuq8BztNmvvtYm
         d6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FAqoKbYCswJVkOTch12PwlqXExdb3kYI3vk6OlVyx9g=;
        b=qYES/XDg0GJJn2xQeFErFhdsxCmku9RiePmZuQHXbtFkba1QzHPGmABshgCA2Ti//P
         +ZHC8D9sesQ5vvUoYO39sqDJr4d7KOIvfBUPIXgk7dGvZ/vuR8mxCSS3+4F28MrZ6Wu9
         EXwme5IMjgtFXwerfv6Xpy7c05MWTx88ApxzKuSVVN3vVt2XLp0KHa3ZnVSTytEEXfLQ
         9bA8AwDlF/CAr4E2Hg6D9fXiuXMPds9NQ/r1YiU9PyZ6wKwxq7N4UTzOPKsFHHBQuzy/
         MMW659k2VPu0MJrnmAjcRq1XTqvUFDiUakwVUkKNyl4n2Re2TulNutc1yT7JqPGXyn3L
         brZA==
X-Gm-Message-State: AOAM531v0nebCk9rJrOvUyjEL4Ge1o86LCJ54+EF0qZZDNYd0L+KX/+4
        bRJDCYv/dNQuv/9/L2x7RxCU4lwzikQ4qw==
X-Google-Smtp-Source: ABdhPJxT9Q+LrhFrM6LWf6ayAIEMVlks/2A/wH0cYC/M+Mdw1wQmAKPaZufoduY9WxdWoEVFb1jshg==
X-Received: by 2002:a17:902:a3cf:b0:13a:70c6:f911 with SMTP id q15-20020a170902a3cf00b0013a70c6f911mr12895659plb.42.1631584057258;
        Mon, 13 Sep 2021 18:47:37 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:47:36 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com
Subject: [PATCH v6 5/6] iommu/tegra-smmu: Attach as pointer to tegra_smmu_group
Date:   Mon, 13 Sep 2021 18:38:57 -0700
Message-Id: <20210914013858.31192-6-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914013858.31192-1-nicoleotsuka@gmail.com>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This could ease driver to access corresponding as pointer
when having tegra_smmu_group pointer only, which can help
new mappings debugfs nodes.

Also moving tegra_smmu_find_group_soc() upward, for using
it in new tegra_smmu_attach_as(); and it's better to have
all tegra_smmu_find_* functions together.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 94 +++++++++++++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 8fd4985ac91e..68c34a4a0ecc 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -24,6 +24,7 @@ struct tegra_smmu_group {
 	struct tegra_smmu *smmu;
 	const struct tegra_smmu_group_soc *group_soc;
 	const struct tegra_smmu_swgroup *swgrp;
+	struct tegra_smmu_as *as;
 	struct iommu_group *grp;
 };
 
@@ -349,6 +350,19 @@ tegra_smmu_find_swgrp(struct tegra_smmu *smmu, unsigned int swgroup)
 	return swgrp;
 }
 
+static const struct tegra_smmu_group_soc *
+tegra_smmu_find_group_soc(struct tegra_smmu *smmu, unsigned int swgroup)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < smmu->soc->num_groups; i++)
+		for (j = 0; j < smmu->soc->groups[i].num_swgroups; j++)
+			if (smmu->soc->groups[i].swgroups[j] == swgroup)
+				return &smmu->soc->groups[i];
+
+	return NULL;
+}
+
 static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 			      unsigned int asid)
 {
@@ -482,6 +496,57 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 	mutex_unlock(&smmu->lock);
 }
 
+static void tegra_smmu_attach_as(struct tegra_smmu *smmu,
+				 struct tegra_smmu_as *as,
+				 unsigned int swgroup)
+{
+	const struct tegra_smmu_swgroup *swgrp;
+	struct tegra_smmu_group *group;
+
+	/* Find swgrp according to the swgroup id */
+	swgrp = tegra_smmu_find_swgrp(smmu, swgroup);
+	if (!swgrp)
+		return;
+
+	mutex_lock(&smmu->lock);
+
+	list_for_each_entry(group, &smmu->groups, list) {
+		if (group->swgrp != swgrp)
+			continue;
+		if (group->as)
+			dev_warn(smmu->dev,
+				 "overwriting group->as for swgroup: %s\n", swgrp->name);
+		group->as = as;
+		break;
+	}
+
+	mutex_unlock(&smmu->lock);
+}
+
+static void tegra_smmu_detach_as(struct tegra_smmu *smmu,
+				 unsigned int swgroup)
+{
+	const struct tegra_smmu_swgroup *swgrp;
+	struct tegra_smmu_group *group;
+	struct dentry *d;
+
+	/* Find swgrp according to the swgroup id */
+	swgrp = tegra_smmu_find_swgrp(smmu, swgroup);
+	if (!swgrp)
+		return;
+
+	mutex_lock(&smmu->lock);
+
+	list_for_each_entry(group, &smmu->groups, list) {
+		if (group->swgrp != swgrp)
+			continue;
+		group->as = NULL;
+		break;
+	}
+
+	mutex_unlock(&smmu->lock);
+}
+
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev)
 {
@@ -495,11 +560,15 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 		return -ENOENT;
 
 	for (index = 0; index < fwspec->num_ids; index++) {
+		unsigned int swgroup = fwspec->ids[index];
+
 		err = tegra_smmu_as_prepare(smmu, as);
 		if (err)
 			goto disable;
 
-		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
+		tegra_smmu_attach_as(smmu, as, swgroup);
+
+		tegra_smmu_enable(smmu, swgroup, as->id);
 	}
 
 	if (index == 0)
@@ -509,7 +578,10 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 
 disable:
 	while (index--) {
-		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
+		unsigned int swgroup = fwspec->ids[index];
+
+		tegra_smmu_disable(smmu, swgroup, as->id);
+		tegra_smmu_detach_as(smmu, swgroup);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
 
@@ -527,7 +599,10 @@ static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct device *de
 		return;
 
 	for (index = 0; index < fwspec->num_ids; index++) {
-		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
+		unsigned int swgroup = fwspec->ids[index];
+
+		tegra_smmu_disable(smmu, swgroup, as->id);
+		tegra_smmu_detach_as(smmu, swgroup);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
 }
@@ -869,19 +944,6 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 
 static void tegra_smmu_release_device(struct device *dev) {}
 
-static const struct tegra_smmu_group_soc *
-tegra_smmu_find_group_soc(struct tegra_smmu *smmu, unsigned int swgroup)
-{
-	unsigned int i, j;
-
-	for (i = 0; i < smmu->soc->num_groups; i++)
-		for (j = 0; j < smmu->soc->groups[i].num_swgroups; j++)
-			if (smmu->soc->groups[i].swgroups[j] == swgroup)
-				return &smmu->soc->groups[i];
-
-	return NULL;
-}
-
 static void tegra_smmu_group_release(void *iommu_data)
 {
 	struct tegra_smmu_group *group = iommu_data;
-- 
2.17.1

