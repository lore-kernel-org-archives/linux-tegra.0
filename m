Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BC6C4727D
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06571206B8
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:06:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZaZjrjq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgJCHGB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 03:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJCHGA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 03:06:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2204C0613D0;
        Sat,  3 Oct 2020 00:05:59 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id nl2so508658pjb.1;
        Sat, 03 Oct 2020 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ITcNsj0frcf6ba+U5N6YTBYHdy6jlF8yFmr3eDHiTDI=;
        b=JZaZjrjqBurL37rT8S021dL+8ODBcTw+hEEigDuWhvzFUR3DTFAvp2g/aCiW21xrWn
         tqPRtwDA2ue6X0BjSisRLDccOMhHaWTQx4Ip/XZlSAAWNJKedI69ZoiYq0VQtS5uZ/GQ
         g9wRaUcsRzunzj17xEqVW+K8SFL8djbMcALr0EJs7lBWLZVGUzgwn3SL8PoAralmYdTz
         /uFGAapYN25CUlHa4nTrOrHmIbZ8MgwvnPVJ5BggOWH3NjlwhSOERhKkcv9AurZSjzZ7
         AU39vGQrZgqOZnWUoRbOjlmyi6ObvwYVwf1oZbvkLlpQ37fcuneOF700bQbZ7hm7FK/Q
         96lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ITcNsj0frcf6ba+U5N6YTBYHdy6jlF8yFmr3eDHiTDI=;
        b=gsNWEK89KNBH+TvJQ6Fh8Eu2RuRTzgVoVd/FA1AScv2SW3FPPEaiZs3OYOPzi7F7AB
         dTd+mcXWiWxbQtotkBdqV+dyWUVJ2mdSwcBiXqLWyEhwavT6vwd9qGerDqVA5gAFfWBF
         Np2uxo3NTbfp8SFST1j1rgv1dSD/qWZaFORzQWm0QwS1bPwX2Bv9sR8z1kDn+aTsoUcL
         9qiP0BE/76TZWkC56wN0SjIzI725bC9I4t69UMUjNaxjSJoKJdN3LO8RDyBUWYJ83vG/
         QZSBAf1tIlVvayPbyEQOs6QvjYLP+UBXAbEjaKpry7c3ckcmFAf73P001SP9a6JrSmim
         l7iQ==
X-Gm-Message-State: AOAM531vXhBcHgzAZmC4q7H1aSOTFga2gUjSIxX2j8uv6QDb3oFkYmRv
        tYWm7hgTKV/cb/qCMeX84BQ=
X-Google-Smtp-Source: ABdhPJwZbx7Vvic7ZEDOtwSwFXE20lmDUjTs6AmR0cHM3vrfN1iJ42X+AYhc+/JM4XdspwwEiKMnKg==
X-Received: by 2002:a17:90b:1804:: with SMTP id lw4mr345357pjb.9.1601708759488;
        Sat, 03 Oct 2020 00:05:59 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d25sm3854498pgl.23.2020.10.03.00.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 00:05:58 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
Date:   Fri,  2 Oct 2020 23:59:45 -0700
Message-Id: <20201003065947.18671-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201003065947.18671-1-nicoleotsuka@gmail.com>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
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

