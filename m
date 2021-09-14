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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4227C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD1DA61155
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 01:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhINBsu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 21:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234945AbhINBsu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 21:48:50 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76B8C061574;
        Mon, 13 Sep 2021 18:47:33 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id dw14so6824360pjb.1;
        Mon, 13 Sep 2021 18:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ew5xnrmFyu+fk66c1OetwqTjwKScTVybyCHV7UWwEpc=;
        b=YcKo+sUe+EYHZIUMHNG7ZJI7GBkp0MTRQfxFZdB0AC1JwnMTR0Sr1bJpkqLpTKAbDK
         wz2cZJ1a1RA/4LJE6bVb4Ixu05pAa9il4QBoVc7+NlQkMxYHW98JEgMneaEwyfbxZTco
         MNeQMpWYYnP76+jbWrFWGjssmC8P+qmLARFU1ryZnSglplkND0bn8s8gYOZ1ZcbPcZlE
         Y7GbJrq12e2MCnLarQgYEhdytygBKtEnS3ZNJ7zP4cZr9VVCugP6vdF7smv900OOwYsf
         7YPVGDLtZeFCWTd+XfH+7Ivz9Ac07TGKWxtZ4emGi/KGW1EbydMllzJeDcds0MOUAoFI
         YlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ew5xnrmFyu+fk66c1OetwqTjwKScTVybyCHV7UWwEpc=;
        b=PihWgYtp3yQCaHNzo6cVfLwvgf8cP2xwO5hpWaDoUp1CW75H1oQD7sVLishGyfEzdX
         9WyP4Vk67v8BFcXoei76UemuAky1R5BDDxmrfh3/XVFTt4aPltlvfVFZ36w8woJzy2FO
         Qwv9BUAnug8qOL0gcFsRIS7tFAbr4HrpxrjBwDUjOFZHhjiE2fHn+LdJMFG23ApiaJzq
         xdk6BMqhPtIsDtNIxuceY/2Wl9J+93amb1w9KDNQr4/T6IULD1VQZq+5T2vZ/9GSqQ2p
         345BDTvRlv9anc5ME1SB2cTV1Q5nQDeMihR1254b4HEGTTHHhP3Cq7VSQDiT2Jwsxlgs
         CKeA==
X-Gm-Message-State: AOAM5327D5Zihaz51pyIAa9EodMBXcIonsYaqpMsSLYGWZwXSsC6YRec
        NdzunhgqKaDfUE9876L3YaAOVIrfV8aVVQ==
X-Google-Smtp-Source: ABdhPJz7BqdhfAZPs7FKLDYKdrJbKTyffDe+Klcpi+4VxK3njmKpExDvslcVyriST0b3DKxShE71sA==
X-Received: by 2002:a17:90a:53:: with SMTP id 19mr2680037pjb.159.1631584053481;
        Mon, 13 Sep 2021 18:47:33 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:47:33 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com
Subject: [PATCH v6 2/6] iommu/tegra-smmu: Rename struct tegra_smmu_group_soc *soc to *group_soc
Date:   Mon, 13 Sep 2021 18:38:54 -0700
Message-Id: <20210914013858.31192-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914013858.31192-1-nicoleotsuka@gmail.com>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are both tegra_smmu_soc and tegra_smmu_group_soc using "soc"
for their pointer instances. This patch renames the one of struct
tegra_smmu_group_soc from "soc" to "group_soc" to distinguish it.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6ebae635d3aa..a32ed347e25d 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -22,7 +22,7 @@
 struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
-	const struct tegra_smmu_group_soc *soc;
+	const struct tegra_smmu_group_soc *group_soc;
 	struct iommu_group *grp;
 	unsigned int swgroup;
 };
@@ -870,7 +870,7 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 static void tegra_smmu_release_device(struct device *dev) {}
 
 static const struct tegra_smmu_group_soc *
-tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
+tegra_smmu_find_group_soc(struct tegra_smmu *smmu, unsigned int swgroup)
 {
 	unsigned int i, j;
 
@@ -896,19 +896,20 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
-	const struct tegra_smmu_group_soc *soc;
+	const struct tegra_smmu_group_soc *group_soc;
 	unsigned int swgroup = fwspec->ids[0];
 	struct tegra_smmu_group *group;
 	struct iommu_group *grp;
 
 	/* Find group_soc associating with swgroup */
-	soc = tegra_smmu_find_group(smmu, swgroup);
+	group_soc = tegra_smmu_find_group_soc(smmu, swgroup);
 
 	mutex_lock(&smmu->lock);
 
 	/* Find existing iommu_group associating with swgroup or group_soc */
 	list_for_each_entry(group, &smmu->groups, list)
-		if ((group->swgroup == swgroup) || (soc && group->soc == soc)) {
+		if ((group->swgroup == swgroup) ||
+		    (group_soc && group->group_soc == group_soc)) {
 			grp = iommu_group_ref_get(group->grp);
 			mutex_unlock(&smmu->lock);
 			return grp;
@@ -921,9 +922,9 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	}
 
 	INIT_LIST_HEAD(&group->list);
+	group->group_soc = group_soc;
 	group->swgroup = swgroup;
 	group->smmu = smmu;
-	group->soc = soc;
 
 	if (dev_is_pci(dev))
 		group->grp = pci_device_group(dev);
@@ -937,8 +938,8 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	}
 
 	iommu_group_set_iommudata(group->grp, group, tegra_smmu_group_release);
-	if (soc)
-		iommu_group_set_name(group->grp, soc->name);
+	if (group_soc)
+		iommu_group_set_name(group->grp, group_soc->name);
 	list_add_tail(&group->list, &smmu->groups);
 	mutex_unlock(&smmu->lock);
 
-- 
2.17.1

