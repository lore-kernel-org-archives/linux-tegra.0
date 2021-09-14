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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B933C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D950661157
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbhINBsu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 21:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbhINBst (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 21:48:49 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A13C061574;
        Mon, 13 Sep 2021 18:47:32 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 18so10610340pfh.9;
        Mon, 13 Sep 2021 18:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wQ6Mm6Od3iZGFWm/WLqOg5xt87Kp6fKq243+Rl2T0Ss=;
        b=Y3jNDyP5CI6DWQgOTU0M49Wstb31pavt5tOS+otoHQnjMSFa9KJZV0n3r0URBmy+aj
         dHu2DHI8mrtS9S94f3ihnUIdxz72VE+8O5d/pIpgzMcCENZB4ezUEdzQ8jBzobxT0eLd
         pS07Y8/A7jkA/45l/meCk5dnuYVeIwLfjGBdt07Sv/3VAFXuVpBSFbxOaMyGekI9KwAF
         tAmfPz49A6halWRQM6o/oYTIWrfd5oc2YDyw4vjbLYY5MOcZaotDlmZfzNdV4SpBDo/m
         ad4bP9w6ZW8YnFjB10bLLM02MIQKRgPgIMowhTKWabJAxpaoBQ9upnF3qCI2wtKnqO5a
         Y0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wQ6Mm6Od3iZGFWm/WLqOg5xt87Kp6fKq243+Rl2T0Ss=;
        b=QzW7CsZCX4zNqHiO4rHsPMtU0SV3uKlfMo2fqQzJ662oOAM+YRk9TJalomje7j5gHq
         FtP23/4tgj1EcnU6UfdD15hksg5QxFo8v07A7CAEDTrtrgdAWjTkR729hHe3lB7aT5yT
         NdKcypi6fAwKZ6LUXDZM2ym4jtWj0322cjYF6dIC8CIxjI2LFGnraP6mrjMIJvSiJJew
         6AhpL2poJOTyigqb1V6Ft+Ny39igNBFfy/w9RDdTkTXMp0WcqP+QZtRPcO83+LledXCj
         mKHzdBDH6tX4dckGpDm+1O+NzgDwRzVQmQ4/T2JCswJdqZMMFH+14DhWHyQttXhkRnqk
         Pn6g==
X-Gm-Message-State: AOAM532GWjkw5ifPjq6qdTeGliid4CJU3DtcCamsbmVzMX7varc9HfaB
        0LEVZiTIvIOvSWZRvN/2fak=
X-Google-Smtp-Source: ABdhPJx9ve/ePQnrtCNYhP2oKHonmJObjkJOsuiwdJNdamk7+cpUBV8DREVgCDqsp2R++Tggh3i5Cg==
X-Received: by 2002:a62:9241:0:b0:438:cdda:1aee with SMTP id o62-20020a629241000000b00438cdda1aeemr2368329pfd.36.1631584052234;
        Mon, 13 Sep 2021 18:47:32 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:47:31 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com
Subject: [PATCH v6 1/6] iommu/tegra-smmu: Rename struct iommu_group *group to *grp
Date:   Mon, 13 Sep 2021 18:38:53 -0700
Message-Id: <20210914013858.31192-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914013858.31192-1-nicoleotsuka@gmail.com>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are a few structs using "group" for their pointer instances.
This gets confusing sometimes. The instance of struct iommu_group
is used in local function with an alias "grp", which can separate
it from others.

So this patch simply renames "group" to "grp" as a cleanup.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0a281833f611..6ebae635d3aa 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -23,7 +23,7 @@ struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
 	const struct tegra_smmu_group_soc *soc;
-	struct iommu_group *group;
+	struct iommu_group *grp;
 	unsigned int swgroup;
 };
 
@@ -909,7 +909,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	/* Find existing iommu_group associating with swgroup or group_soc */
 	list_for_each_entry(group, &smmu->groups, list)
 		if ((group->swgroup == swgroup) || (soc && group->soc == soc)) {
-			grp = iommu_group_ref_get(group->group);
+			grp = iommu_group_ref_get(group->grp);
 			mutex_unlock(&smmu->lock);
 			return grp;
 		}
@@ -926,23 +926,23 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	group->soc = soc;
 
 	if (dev_is_pci(dev))
-		group->group = pci_device_group(dev);
+		group->grp = pci_device_group(dev);
 	else
-		group->group = generic_device_group(dev);
+		group->grp = generic_device_group(dev);
 
-	if (IS_ERR(group->group)) {
+	if (IS_ERR(group->grp)) {
 		devm_kfree(smmu->dev, group);
 		mutex_unlock(&smmu->lock);
 		return NULL;
 	}
 
-	iommu_group_set_iommudata(group->group, group, tegra_smmu_group_release);
+	iommu_group_set_iommudata(group->grp, group, tegra_smmu_group_release);
 	if (soc)
-		iommu_group_set_name(group->group, soc->name);
+		iommu_group_set_name(group->grp, soc->name);
 	list_add_tail(&group->list, &smmu->groups);
 	mutex_unlock(&smmu->lock);
 
-	return group->group;
+	return group->grp;
 }
 
 static int tegra_smmu_of_xlate(struct device *dev,
-- 
2.17.1

