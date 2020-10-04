Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BB1C4727D
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:45:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94B51206C3
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jW+udd2/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgJDWpG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 18:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgJDWpG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 18:45:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB1AC0613CE;
        Sun,  4 Oct 2020 15:45:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so5326731pfo.12;
        Sun, 04 Oct 2020 15:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qf45Jazhnw0AWQkWquvjrDOvbvMExg67USrpZGI37ZQ=;
        b=jW+udd2/4F14aVvfzcWbJlMOSrs29d/NsRoba0M2iNM8OvKRpPM7ivzeR1SjpywUrL
         8vD359RzcgC1zDQry8L2yBd7Yrt+VO62WYfTFOVRqlcUIwMpUwrCcX/SwA7l9tPd/TrK
         vHvbvWdOjEvxkNYi9t6bgFdnqVSjKZfTIKEKKvxmVeC7YaUExGyBhzGRL6kwxoWr6nFM
         ey5fFiaMo1T9X0Wwn+tfWHxS1Aug1sNN3vy3d+kF+f6+z/LjYDk/RQWrUWs8owvFxvSK
         gXlXCvY/YQDeBXiVH+q4swCpWaif7jJSPeJHQ9E97hs1zEBSSfClkMtK/DllJIxzPGw/
         pnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qf45Jazhnw0AWQkWquvjrDOvbvMExg67USrpZGI37ZQ=;
        b=CF4DBm18Z5CJ5ez8qkX1/FTLzsEcqDNHj6izGlh/zeeMxnQWPjC8XcIgPEyyy7a+97
         184F568qUvFKEwY1dzbpjXLnSOzwFUU5TR1CQlLFRbEDMOczsvqSlP4IJXwM7ghB8+93
         5Wgr7JKaU7phkJ08xH0dK9s1BKMDAcHC36y6JRHVWuszX++W9WHX/USxbLKwXiT/baWj
         nIf3vvVaELQdVjrnONaWbTZ5m7EqT731+6sN8+D6uulgoljALnMPnlnJiyPda6jRujnj
         KRh+8jyi8mk4ldMGVJxhIxL8zoQwh0RH6MoEscAA8GIbe4W9q/N2HagSXVFxGtYhO8Zw
         5p3g==
X-Gm-Message-State: AOAM533NCwOSi0jxCX7hfHGt/N3bDSzAzMHudQSBSKcJKG89pz90cOsJ
        QtKPX8HRnfjjaIRjKAY/SOs=
X-Google-Smtp-Source: ABdhPJwg1OstrsEfqzgNeEikSkjxOX/tqMbxN7Jr5u8AUcZlZkRbcrp2egWbxXa1TEHG1uLkevZhbA==
X-Received: by 2002:aa7:8885:0:b029:142:2501:39ea with SMTP id z5-20020aa788850000b0290142250139eamr4427245pfe.57.1601851505561;
        Sun, 04 Oct 2020 15:45:05 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d129sm9073236pfc.161.2020.10.04.15.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 15:45:05 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
Date:   Sun,  4 Oct 2020 15:38:35 -0700
Message-Id: <20201004223837.15303-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004223837.15303-1-nicoleotsuka@gmail.com>
References: <20201004223837.15303-1-nicoleotsuka@gmail.com>
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

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v5->v6:
 * Added Dmitry's Reviewed-by and Tested-by
v4->v5:
 * Removed "index" and "err" assigning to 0
v3->v4:
 * Seperated the change, as a cleanup, from the rework patch
v1->v3:
 * N/A

 drivers/iommu/tegra-smmu.c | 56 ++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6a3ecc334481..297d49f3f80e 100644
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
-	unsigned int index = 0;
-	int err = 0;
-
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
+	unsigned int index;
+	int err;
 
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
-	unsigned int index = 0;
-
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
+	unsigned int index;
 
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

