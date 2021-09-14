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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB43C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C62D761151
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhINBsz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 21:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235632AbhINBsw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 21:48:52 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5751AC061574;
        Mon, 13 Sep 2021 18:47:36 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id j1so7727156pjv.3;
        Mon, 13 Sep 2021 18:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=02zpobwAZVhWVn00LMms1NVtUxIVvNcwQuQFmSxJIqI=;
        b=M8/sQJUs7N0OzKAY2DCxmlR3GBYs564L5za5zK+jgohVNjpkEz9fDPK98ZlYo+HNz6
         MRFzbV6KIn/tabOHKL731eSAmF+AIfk4kDVz9a0PaNG55aoaM/uCDVrx8qur3BNHAbzZ
         153EIoC1tpGwBa0H/xUdaDcJfzRA3L7Z59xGcExZuvbwtPSufqn0e9JGcNWv7jCkHwjw
         Z46rBci5kjqQWgI2zDxu5X/o43eX242FIz2McM4E1ERCWeHiFZgWOySfBZzL8LMGdXz+
         jMomLaTp64UjH/PuxjrnfpU8xDaawmyktizjG/8BhybHRFPuWNYqwQZX6gG4EROCnsEk
         XAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=02zpobwAZVhWVn00LMms1NVtUxIVvNcwQuQFmSxJIqI=;
        b=HNpmBw1yZrJz/yOfIRi5XVxcz8HcutKF5YlSLR6zlvWRWoG6TwaK6Cd4SZPZHxyF+y
         tRvHEmrjxIaVpdlZzlkZIADOXMw/MfJMIQgpzsL7OdACBvvl2MkIwMS63iPHPE46OYzA
         4MVB0wlEzQemm28AO12FpeMA8dORQ7MqHkPlWASvybjSUFjoESMNpj1dXAQIKQTU2lQW
         yazd/05SdC0lKHbIyTv+a0TCbQRXVjhq5EQESVi8w1LSY7Fn/xW+MEJ/L1MBOKvOioxm
         TndZ9J6tHp3uhRixwk/jEKaZPXcw1+2/sGX14AWG1MlD9r5Q5Jyegzw0beme8k4Rdc2l
         2D9w==
X-Gm-Message-State: AOAM5321DHsyiLhhxnTJgmqSiWFgS5IENmkEvzExeEa3FjrVoFHK95s3
        GdERlVDUZ0XlrYvTUfggoc0=
X-Google-Smtp-Source: ABdhPJz9jZlUnUZZrh3YG7ZA9O9HOg258enmoLZYvhKmRZNv133D2M10B9pFlaaXalDO9KLxJ8TdmQ==
X-Received: by 2002:a17:90a:9706:: with SMTP id x6mr2664790pjo.81.1631584055880;
        Mon, 13 Sep 2021 18:47:35 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:47:35 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com
Subject: [PATCH v6 4/6] iommu/tegra-smmu: Use swgrp pointer instead of swgroup id
Date:   Mon, 13 Sep 2021 18:38:56 -0700
Message-Id: <20210914013858.31192-5-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914013858.31192-1-nicoleotsuka@gmail.com>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch changes in struct tegra_smmu_group to use swgrp
pointer instead of swgroup, as a preparational change for
the "mappings" debugfs feature.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0f3883045ffa..8fd4985ac91e 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -23,8 +23,8 @@ struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
 	const struct tegra_smmu_group_soc *group_soc;
+	const struct tegra_smmu_swgroup *swgrp;
 	struct iommu_group *grp;
-	unsigned int swgroup;
 };
 
 struct tegra_smmu {
@@ -897,18 +897,22 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	const struct tegra_smmu_group_soc *group_soc;
+	const struct tegra_smmu_swgroup *swgrp;
 	unsigned int swgroup = fwspec->ids[0];
 	struct tegra_smmu_group *group;
 	struct iommu_group *grp;
 
+	/* Find swgrp according to the swgroup id */
+	swgrp = tegra_smmu_find_swgrp(smmu, swgroup);
+
 	/* Find group_soc associating with swgroup */
 	group_soc = tegra_smmu_find_group_soc(smmu, swgroup);
 
 	mutex_lock(&smmu->lock);
 
-	/* Find existing iommu_group associating with swgroup or group_soc */
+	/* Find existing iommu_group associating with swgrp or group_soc */
 	list_for_each_entry(group, &smmu->groups, list)
-		if ((group->swgroup == swgroup) ||
+		if ((swgrp && group->swgrp == swgrp) ||
 		    (group_soc && group->group_soc == group_soc)) {
 			grp = iommu_group_ref_get(group->grp);
 			mutex_unlock(&smmu->lock);
@@ -923,7 +927,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 
 	INIT_LIST_HEAD(&group->list);
 	group->group_soc = group_soc;
-	group->swgroup = swgroup;
+	group->swgrp = swgrp;
 	group->smmu = smmu;
 
 	if (dev_is_pci(dev))
-- 
2.17.1

