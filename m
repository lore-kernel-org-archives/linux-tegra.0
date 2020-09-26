Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81139C4741F
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30FF222B2D
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNClZS+5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbgIZIMc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 04:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZIMa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 04:12:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F43C0613CE;
        Sat, 26 Sep 2020 01:12:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so674307pji.1;
        Sat, 26 Sep 2020 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VVVAr+184BtvhzMD2Murp/xUE/D9g6IJfB0eGMqFFJo=;
        b=MNClZS+5VS7Fi2JhH3w96/QGLwQcMIqywqi1LZAlT7HAi2Ju30laqpwGxe+F7gf6yO
         KouvmZ12cKgduFowL2xaO6G61KDcj88T8oXykfBXIDrPkmhSfAroXYZUzTh/dQP1R8VQ
         c+92n7rD6XgF1rP6g+oSg+IS68DIF+2hg0CYO/rZdnoX8bknL/B5uIyU0C3YhrEhjyae
         1urWNWsLcwBp1Xii9L7mTsjabjAYD/hGTPdTkdRsV/EQPwdAHoW290yIU9FYqRsykgoB
         LUt00uDR2vknXuRVarJEY4AfsgNMDG+ogE2pTqSya20ftzfQiRiOzVunh595DzBzSDLo
         J2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VVVAr+184BtvhzMD2Murp/xUE/D9g6IJfB0eGMqFFJo=;
        b=qLGdkrAgulgxQFHmEfeBf3ZoOTbyPl4iq+moJoc6q9knsgnbe+of37ij4pE4Y+Wblg
         Fqq1dS/7G7UGxyd1IMhDfQ4ajVE2LzFp6b3FFzCNPe2gvbHKFj7u7SNbiUwUBdKzJnTC
         AM3y39EfBylpqlep/a9Uo39t21LT1whNrHkdNHKDhmcB/4B3cWHkVXOcVZshoL+a2HBl
         Qe9zHBkiiS97+1npwLu6A/pC6unMGSJ9Eg0wHe5k1JTGStU2peQr3Zpok6lC+AWU8N4w
         seQILT8vtppMhAKBAB1Q0qhr6jmyRnkEuAUj38P7OqOmTWM4Hv64JMITMfPs4kMiNLIk
         R1cw==
X-Gm-Message-State: AOAM532l/7cXrt7ewniE5KxEI+zh2tF7Cr3LnYmaL4dkhKH6cVSUm52i
        sgW/7XIvgmqcZz+Bl+6LTt0=
X-Google-Smtp-Source: ABdhPJzFEpRxK4TIMy7eeSxXQ5/Eg30XdZ30+RRKKAZ5PSoWLT+DA9tbqMm51WQggzz5mT65ofrDsQ==
X-Received: by 2002:a17:902:7b93:b029:d2:172:7d9e with SMTP id w19-20020a1709027b93b02900d201727d9emr3074529pll.83.1601107949943;
        Sat, 26 Sep 2020 01:12:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id i1sm4833497pfk.21.2020.09.26.01.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 01:12:29 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date:   Sat, 26 Sep 2020 01:07:15 -0700
Message-Id: <20200926080719.6822-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926080719.6822-1-nicoleotsuka@gmail.com>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_smmu_group_get was added to group devices in different
SWGROUPs and it'd return a NULL group pointer upon a mismatch at
tegra_smmu_find_group(), so for most of clients/devices, it very
likely would mismatch and need a fallback generic_device_group().

But now tegra_smmu_group_get handles devices in same SWGROUP too,
which means that it would allocate a group for every new SWGROUP
or would directly return an existing one upon matching a SWGROUP,
i.e. any device will go through this function.

So possibility of having a NULL group pointer in device_group()
is upon failure of either devm_kzalloc() or iommu_group_alloc().
In either case, calling generic_device_group() no longer makes a
sense. Especially for devm_kzalloc() failing case, it'd cause a
problem if it fails at devm_kzalloc() yet succeeds at a fallback
generic_device_group(), because it does not create a group->list
for other devices to match.

This patch simply unwraps the function to clean it up.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0becdbfea306..6335285dc373 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -903,11 +903,13 @@ static void tegra_smmu_group_release(void *iommu_data)
 	mutex_unlock(&smmu->lock);
 }
 
-static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
-						unsigned int swgroup)
+static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	const struct tegra_smmu_group_soc *soc;
 	struct tegra_smmu_group *group;
+	int swgroup = fwspec->ids[0];
 	struct iommu_group *grp;
 
 	/* Find group_soc associating with swgroup */
@@ -950,19 +952,6 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 	return group->group;
 }
 
-static struct iommu_group *tegra_smmu_device_group(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
-	struct iommu_group *group;
-
-	group = tegra_smmu_group_get(smmu, fwspec->ids[0]);
-	if (!group)
-		group = generic_device_group(dev);
-
-	return group;
-}
-
 static int tegra_smmu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
-- 
2.17.1

