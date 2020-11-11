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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ED0C56202
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:31:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 556A82076E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U640QIdo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgKLBbI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgKKWnr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 17:43:47 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11716C061A4F;
        Wed, 11 Nov 2020 14:34:44 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id i13so2420106pgm.9;
        Wed, 11 Nov 2020 14:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZwD1ohCfAW402dFGnNEhoT+UZSg/Ym6HaUWM7XjPb6E=;
        b=U640QIdoFg2QG3xihbfQE0u71b3stsi/H2Zy2gCGk4cz4t7+j8ElHfQx7ufBQMQdn9
         0PuuYrkCwevEosQBCGQ6vBrtwv4A8QSpgo2cgZH/N9Ro6F/aIlv2jUsFu0oBBpyuDDYV
         Qj7dWArL7VM8nzYPK+kUJ0w+TA5UGBwWYK1unj/wxM4MpVUNdLSH1/xB8pCAVozv95DI
         /h1nnW04mVfKJ9bE291K4/MaWn7n+CgWFDgXj5LiDLBJJZsXLTbXg2R4c8oNJS9su31Z
         5ei6omVBSC0m/ha8GflhXOQ6pSCSvB9KjSAZ2dkGLpoHWOlNkuBd3w0YxCptvObQ9/gv
         Isew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZwD1ohCfAW402dFGnNEhoT+UZSg/Ym6HaUWM7XjPb6E=;
        b=nB3TTP8A9gcN2nPOXvz1taXX1ojBea20mCWSMH7MkI7Gb/AEKA8+ReiLIFreGN4LUh
         W5S5ORQxNV4TCoibwoLAb/GY3/9/pjpqxrnudSzZIPTPTS+KslgeukIRzpL1wWWkpd2o
         vR7Z0YGAV6hlph/D2BQHw/EOJaCPFB3DiotvNh3Tl9OdOx1fDl3M7VTUCUNCn7Y2+Qkd
         8rtzYHuE9o6Zf3TWZaoFkM+LTssoN+kSnrFe/WPE/fFSpvJheZ27jCD7tvR79YfgvJRJ
         oaiFxbF0EjptuJFlZwIPI0Xh9Tu+tLXEoFBhdTmA5/lpcfTcBiDZYRwppSXSXW5u3/h5
         //cw==
X-Gm-Message-State: AOAM53045E1I0YBTPrPjWFXvZb585a4Ic9s/JkJFri6kdI5x11Q3SEjc
        T1qOHCP8H4XMKLzV5zuXHIsO77rNjEotDg==
X-Google-Smtp-Source: ABdhPJzU3SRBsWCo/X+VGSnCodJ+e5+64F0QcgDgQaPvykVq0olGHQnqAqWbQj1QKdIFXrf/0xInnw==
X-Received: by 2002:a17:90a:7d06:: with SMTP id g6mr5913021pjl.113.1605134083643;
        Wed, 11 Nov 2020 14:34:43 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a20sm3605096pff.118.2020.11.11.14.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:34:43 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com
Subject: [PATCH RESEND 1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date:   Wed, 11 Nov 2020 14:21:25 -0800
Message-Id: <20201111222129.15736-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111222129.15736-1-nicoleotsuka@gmail.com>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
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

