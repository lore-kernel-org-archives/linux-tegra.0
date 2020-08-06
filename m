Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152E9C433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AB8720786
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EanimBfT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgHFRIr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730049AbgHFRGV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:06:21 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F4FC002153
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:54:15 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id m19so10337750ejd.8
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UHM7NrOeh2iQ0mr8lE8C+H1rDTyZhW846howQnzmmso=;
        b=EanimBfT/WgajAIB3u1A3iBG9JEfttCiNI4/b2mLS3LDpcOHaoEzg5NwcDZjwy3F/4
         2+8hqioyGVh8kPTtan451m+cp/w7HVWAJyFkATdglqDptfIe0noU9vsmxbhE0XQs4Xgq
         YmPniWhdRSYWx5q9UCbFxpkshPhhCmCPmbZQgTSlgOIrkGk8D0VeEAzu/BNVng2Yi/nm
         f6jh5Q+BS0E6exQaFrJPQSjTdk6N6WLlbzbSn/nQgLAPcoBByx/xymqjgDHVdRVtPWao
         KcsFRWzqK4IF+gLWeddZlORJsrz578WHCBcSAZkW6b/rnDiGLMPfRTdXpgFg8jTGPSJB
         ipRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UHM7NrOeh2iQ0mr8lE8C+H1rDTyZhW846howQnzmmso=;
        b=WMepQwtjpN+so5iAIHqdmXtXDYI3VkM4WT2OHtS7P82zE9cz+yz8+2VzeAeoOrEg6+
         7ed9qgzrlrMe2doGul8X0XRgFkbGMDbReSgHD3GSrHhYNYHIjcnVm1ToIpGwSiJfRcCb
         3DYdg4aozJXpChVPj0Xh0EtmOP6100pWtKKAnjT1rCmTzWwXt57nlVO0hn0T4WyzzD5P
         Gaq9ZcqNG4byBFNSMOmM7xVjNh/BpY1Pm5/9TdlAt/AL8p5BDK2qbCTWthl53r1iElFd
         4A/fWzJjqb020WHdsieWUJWLooreyXNHR3KlSL8l3Ofo8hpXArNUQxa/3hK5GYdhWH8F
         iZxw==
X-Gm-Message-State: AOAM531XhuMfmju34b9jgNH+ToSwgwfejh5zIixfyetxoEKGkSqDHsK0
        dp8x1I02/M5/CduyqLscH2Y=
X-Google-Smtp-Source: ABdhPJyS5VFo4rwNX3VlJZqao9YiV3jX+fDzIHN5dP0+0vpr5zAZ6By09k6fuYjcdV0RfC2TVc5ZHg==
X-Received: by 2002:a17:906:3756:: with SMTP id e22mr5204598ejc.487.1596729254164;
        Thu, 06 Aug 2020 08:54:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g25sm3955136ejh.110.2020.08.06.08.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:54:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] iommu/tegra-smmu: Prune IOMMU group when it is released
Date:   Thu,  6 Aug 2020 17:54:04 +0200
Message-Id: <20200806155404.3936074-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806155404.3936074-1-thierry.reding@gmail.com>
References: <20200806155404.3936074-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to share groups between multiple devices we keep track of them
in a per-SMMU list. When an IOMMU group is released, a dangling pointer
to it stays around in that list. Fix this by implementing an IOMMU data
release callback for groups where the dangling pointer can be removed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index c439c0929ef8..2574e716086b 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -19,6 +19,7 @@
 
 struct tegra_smmu_group {
 	struct list_head list;
+	struct tegra_smmu *smmu;
 	const struct tegra_smmu_group_soc *soc;
 	struct iommu_group *group;
 };
@@ -813,6 +814,16 @@ tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
 	return NULL;
 }
 
+static void tegra_smmu_group_release(void *iommu_data)
+{
+	struct tegra_smmu_group *group = iommu_data;
+	struct tegra_smmu *smmu = group->smmu;
+
+	mutex_lock(&smmu->lock);
+	list_del(&group->list);
+	mutex_unlock(&smmu->lock);
+}
+
 static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 						unsigned int swgroup)
 {
@@ -840,6 +851,7 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 	}
 
 	INIT_LIST_HEAD(&group->list);
+	group->smmu = smmu;
 	group->soc = soc;
 
 	group->group = iommu_group_alloc();
@@ -849,6 +861,7 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 		return NULL;
 	}
 
+	iommu_group_set_iommudata(group->group, group, tegra_smmu_group_release);
 	iommu_group_set_name(group->group, soc->name);
 	list_add_tail(&group->list, &smmu->groups);
 	mutex_unlock(&smmu->lock);
-- 
2.27.0

