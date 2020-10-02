Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6148EC4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 06:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23F16206FA
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 06:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiNn9YOF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgJBGO7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 02:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBGO5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 02:14:57 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F97C0613D0;
        Thu,  1 Oct 2020 23:14:57 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 34so142110pgo.13;
        Thu, 01 Oct 2020 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=otBTCe7FmPQpy2tpJulWyCh/L21TRYmKYwygp5uY5sM=;
        b=IiNn9YOF7gQlrxMVfWz9a45RjQ8ZpT8dsEZyB+XJJRtwkq4f8wY23jnobrIqSdOqx6
         QRcLSd51ugIn4RvBwRzjVAQZYdyxatqdsdCQ+DJwyAroz6oWTKDkOhaIaTFpIKsZGrj4
         jzcmAho4qW51NnXgAREkyhvPfLHvgnO5WRzX9UnV8nWvrbwzVq0Z2LsF0kZu1VU8gbff
         kz4r4dVxkNsgEKp9NynCV/E53fpTBLZKucMtOvCo986F6b7zqL/wnk4gA0pexFdrsLr6
         DKo8q125M7pxor1FIQgfGeq04henvfBrXaYjhfNnHLoBVzwExvney1APaQvvgkVB0x8N
         EtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=otBTCe7FmPQpy2tpJulWyCh/L21TRYmKYwygp5uY5sM=;
        b=b5kK0gVOHbj9cX3XAl5TBT+bhw9NIZyWWVYwenGEZmUr2wrbz39uNqEnyvSz2Ljzfo
         L/Rz7KCvTue91hLqgxSsgxZlPGWUHgYDcdLBMTgXS5Xgyz9+8bWQd+paSzzTa6c9uMvW
         252k6ApBaJtbIAB+vW4bB8rgqfJs1a0dg5MBKfSR5b8gl9LEpB1/NPp2nU7oWKPP+z+N
         UYinDUxFdbXjHwO4k+/Itqms4zOQXs+3Wdb5HvlGoER2O/DK7K+18+exazBmJ1GUqg/R
         jDw488usQ0WHuUiaxyY++LhAPwJC60Q3tAfj0BXl1YdzCh2OSqDzsE79rTDepz34Pn92
         xc7w==
X-Gm-Message-State: AOAM533WDuSNNZ+z5FzMe3Jsr+HmK+y3TZlfTInNtsJF+rBYy0twBl5d
        t0wrnAUWLg1ecCOc5pKTdB8=
X-Google-Smtp-Source: ABdhPJw0/xNRhqMlzGo7CYzef4g/ryDTUJSZR6RSekt5Etnqv4SfEqrkTxsB5aeDznWXgFXfU1ZOng==
X-Received: by 2002:a65:4987:: with SMTP id r7mr624113pgs.228.1601619297100;
        Thu, 01 Oct 2020 23:14:57 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id x4sm577429pfm.86.2020.10.01.23.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 23:14:56 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
Date:   Thu,  1 Oct 2020 23:08:05 -0700
Message-Id: <20201002060807.32138-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002060807.32138-1-nicoleotsuka@gmail.com>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In tegra_smmu_(de)attach_dev() functions, we poll DTB for each
client's iommus property to get swgroup ID in order to prepare
"as" and enable smmu. Actually tegra_smmu_configure() prepared
an fwspec for each client, and added to the fwspec all swgroup
IDs of client DT node in DTB.

So this patch uses fwspec in tegra_smmu_(de)attach_dev() so as
to replace the redundant DT polling code.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v3->v4:
 * Seperated the change, as a cleanup, from the rework patch
v1->v3:
 * N/A

 drivers/iommu/tegra-smmu.c | 50 +++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6a3ecc334481..a573a5151c69 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -484,60 +484,50 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
 	unsigned int index = 0;
 	int err = 0;
 
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
-
-		of_node_put(args.np);
+	if (!fwspec)
+		return -ENOENT;
 
+	for (index = 0; index < fwspec->num_ids; index++) {
 		err = tegra_smmu_as_prepare(smmu, as);
-		if (err < 0)
-			return err;
+		if (err)
+			goto disable;
 
-		tegra_smmu_enable(smmu, swgroup, as->id);
-		index++;
+		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
 
 	if (index == 0)
 		return -ENODEV;
 
 	return 0;
+
+disable:
+	while (index--) {
+		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
+		tegra_smmu_as_unprepare(smmu, as);
+	}
+
+	return err;
 }
 
 static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
 	struct tegra_smmu *smmu = as->smmu;
-	struct of_phandle_args args;
 	unsigned int index = 0;
 
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
-
-		of_node_put(args.np);
+	if (!fwspec)
+		return;
 
-		tegra_smmu_disable(smmu, swgroup, as->id);
+	for (index = 0; index < fwspec->num_ids; index++) {
+		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
-		index++;
 	}
 }
 
-- 
2.17.1

