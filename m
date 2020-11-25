Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A21C5519F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A69D420857
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:11:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6nUj0KM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbgKYKLv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728957AbgKYKLv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 05:11:51 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C9BC0613D6;
        Wed, 25 Nov 2020 02:11:50 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id y7so1826986pfq.11;
        Wed, 25 Nov 2020 02:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZwD1ohCfAW402dFGnNEhoT+UZSg/Ym6HaUWM7XjPb6E=;
        b=b6nUj0KM55Y0PVBvob1TXOFsayKdQ6c2UoMg//1VHDUIkcyBQB5iKg8uMrUTBhx38t
         MEYFrzymL6aeb5hNEihOquS2P8aXpGy/AwQwVg1MKuqOTxORVZXaIk1A/3E3QIoL8lHC
         ziwT2GhsZdWVKiKXOKaxF5pYou0afT4ThyhjXpt43mvPLpBMFL/so7v4ci0hV9IrIbr8
         Q9kD2BvbxdEmCJmhgTymRNgi/4ft+Z2KOqqs6/G2QI6SpEvJdNI22WtQd2AKg5iEVO/n
         Kr71Qh/WKWk/FKlFRmgEgW/dhKFfY4wzsb44zi+Lvltvtd9GeB8NkddrGnk75FLpEefL
         q7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZwD1ohCfAW402dFGnNEhoT+UZSg/Ym6HaUWM7XjPb6E=;
        b=W1Wn5OmSu1la61MQGlfLyx0fyzaDSJ9NBBfLs9V9sr/otfDuP+M7AlHSXruPBSETN/
         BY0qEGNMbn+qnSZ3iz7KfrNkwypJhknt7IilcF+PoQ16vXllBQ+9jjqCdTFSctnN1a5M
         aAZORBCaluKXWyA6pyRDo8h/6RaM4nFFn5zliV90Lhy1w9OEP5dUw+hvJNoAUvgEts0q
         aBtyhDNYnmpzGJCks1nTRwdLg+33sIZgLSyTatR7B4j6OEgNYIaoNsN4YlumPSp8tWc/
         s2m0f2rceiHTZqPPJ5IkvnjQbdb16bj1e4Z3rzsj2tXtG1pFH+zzdgtd2weH6PlTeiu8
         BFUQ==
X-Gm-Message-State: AOAM532VXgF1+FUbU2cI5jMF4sI7MqU1bezcDRcgT/YEWPmuIx42v+bK
        l6HffX448NwAlpdrADFGXpk=
X-Google-Smtp-Source: ABdhPJzXq9plSmgdN0gkNTqyIlIJeAiNGmi+jhJigzBpoKf/a6q9hsHbjDMmyGkoPqsJhmVvDq95oQ==
X-Received: by 2002:a65:404b:: with SMTP id h11mr2437208pgp.379.1606299110454;
        Wed, 25 Nov 2020 02:11:50 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id r130sm1599496pfc.41.2020.11.25.02.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 02:11:50 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     will@kernel.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, thierry.reding@gmail.com, joro@8bytes.org
Subject: [PATCH RESEND v2 1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date:   Wed, 25 Nov 2020 02:10:09 -0800
Message-Id: <20201125101013.14953-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125101013.14953-1-nicoleotsuka@gmail.com>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
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

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0becdbfea306..ec4c9dafff95 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -903,10 +903,12 @@ static void tegra_smmu_group_release(void *iommu_data)
 	mutex_unlock(&smmu->lock);
 }
 
-static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
-						unsigned int swgroup)
+static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	const struct tegra_smmu_group_soc *soc;
+	unsigned int swgroup = fwspec->ids[0];
 	struct tegra_smmu_group *group;
 	struct iommu_group *grp;
 
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

