Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE5CC388F9
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C642C20665
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qF8QRgIn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgKLBbB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbgKKWnn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 17:43:43 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE2CC061A52;
        Wed, 11 Nov 2020 14:34:46 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id r10so2411730pgb.10;
        Wed, 11 Nov 2020 14:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8bTVyElsSpuTUt20RFLCESMaCBBDWhl3lYIjpcXmpjs=;
        b=qF8QRgInLUJ6nxv1YqYd2h7acY6CwOqS82SzhLzwvbJMqAYcIo4RG/AdKezSneNW+k
         7MUyfBUl50QLRJ+ocEFbsukAg+yvHg3BGX5JEjuNPLU41jIgphptsmsK51OzErjbtyKh
         Gb2ealSjfgrh7I9Bt8m5s5xslM9iMlui9xLxna+oyNL2+idzNoxTp5vfUCOzPmQ8WnqF
         gU2BxdN14zdYptDqaXPnIRYA1fOjeABeOYCTCT6D9qRR8QInBP+FVAwNBkWVt6RM9M0+
         EnmV9UaOgZyT2fBQZr/cbmitXICSS+xLfLQe+OXQa+jaSMnnqFhFKj5eMK81sJuqWBOl
         Q0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8bTVyElsSpuTUt20RFLCESMaCBBDWhl3lYIjpcXmpjs=;
        b=ONA0FHArWpFIN7O7sGAk3bTQa07vntAzM46gwmQgDk7LeQ45KhuKKvtIc6rcb0fsPP
         F+PRVGC+PLIS9q4HIU5VAJv22pIA/SfYe51E+0ppCBc9MwXwj2dTDTHT9T2EnHa3cT42
         S/IUXV8ZQgkuTNH64Mhr2fJ78c/++6GtE0G7SVAIXNHPKr7+t7POHVp8gRKau1hQy78m
         8acFrg2BlGCgsSVimRBwfuvoN2n/+7y1mcmknYHyfKFa/jvwlMthW/Dv9veqLgZDA4ts
         h6cmxImda6o2dnfpmz3MA0c3ETCgRjpWQmS5P38kWJxIZBtfWOjHBmdxy/uUxbE74h2k
         RJnA==
X-Gm-Message-State: AOAM531k3ypbUgIZ0LJSTxCFgXoIY5DC2h+wWuu+LF3enMkUqtbEN1WT
        UIrwp6Wd/w4F4VfJ8eNo3v0=
X-Google-Smtp-Source: ABdhPJyaqszgXv76DnT1Jw2EmV61u27RVj+XayDix4agS49Yxzg8HwtQ2wn26GK0uudvJeI+oaGtfQ==
X-Received: by 2002:a17:90a:609:: with SMTP id j9mr5927740pjj.121.1605134086023;
        Wed, 11 Nov 2020 14:34:46 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a20sm3605096pff.118.2020.11.11.14.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:34:45 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com
Subject: [PATCH RESEND 3/5] iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
Date:   Wed, 11 Nov 2020 14:21:27 -0800
Message-Id: <20201111222129.15736-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111222129.15736-1-nicoleotsuka@gmail.com>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
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

