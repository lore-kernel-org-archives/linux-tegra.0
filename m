Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFF2C2D0A8
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 00:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4856221775
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 00:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgGdK8Ox"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgI2AEr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 20:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgI2AEr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 20:04:47 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6785EC0613D3;
        Mon, 28 Sep 2020 17:04:47 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f1so3089plo.13;
        Mon, 28 Sep 2020 17:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C/2uCZ+b3JDX5POeuiJcjwGtwJq2owg7pPnLmk6OF2c=;
        b=FgGdK8Ox4KmfRnLlsUDtVNk39OBCNrwR2zslti3e2U+iK2s0i0CWt/nvnfujSfyjD4
         mRxIDzd59HOdREeeNFR1+8rTnTkqX3HRQopS2MXO9dnYnfpTDnoch209ZQyC4TeEqtBG
         CQYGEpQOvAX8NPUyaP5SfLMPc+OdOzAqVtOSgpTVeWUIcugKK6Hkblr0bYn5JxcaKdEl
         7D37Ku+SfdA+yGhjcwJbnP9TSremXnFip3ITB0D2C+KhF+yYRkGWJnl5oIMGKL5fElet
         V0IpUaFyX1gQy1fbyHbpKjngjE1I2MbqVb08W7+Fp/FsIcmEjJ4rH7iJWFJNwB0pqA2J
         RuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C/2uCZ+b3JDX5POeuiJcjwGtwJq2owg7pPnLmk6OF2c=;
        b=kqtCpIQY3FhRZLLtaX14d1uYdWIOuYCBDWwrLIh4wcidgoHemsTXrVoyw4fcTldr8T
         NK5ImgX+tPOlmBewI+c7UeQEI8Zn2zulVDwddoqEoY3Gfqs4HYGjhXp5z7iyPg1hr62O
         tz+QgeKMRVRv88o7raI6vbJ70zs1wIDQ58eL6Ep0gNAjKnH15PWZQjuTyPYpfFLu0R1u
         Z3LOmZ0S9YrfrGb4TjexFNVfYGMB2BF1qTlijvmJOkz/xD7mymloazqevBENP41dsP++
         bog5Xek+j6I8NhL9a90msz+kM1nUD9m9c69J3szSS+7Q3HACTqJ0aNtO4jfsR7BQWHqq
         N13A==
X-Gm-Message-State: AOAM531z/FAzMuG08FqesNbAEwzVQSaKBW/CCG4hC49RXjffy2HlvVoq
        5s9lezaRfv4Z4NZtowRvmkDy3Uai9Yk=
X-Google-Smtp-Source: ABdhPJw1JD+0yORoCok+gamYtL0khtKydIQiDxk27/3l2F5HWucqnW4RdjfC+RJ9HrQewH+66pZsCw==
X-Received: by 2002:a17:902:7c0e:b029:d0:89f3:28d4 with SMTP id x14-20020a1709027c0eb02900d089f328d4mr1837914pll.16.1601337886912;
        Mon, 28 Sep 2020 17:04:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id fz23sm2392814pjb.36.2020.09.28.17.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 17:04:46 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date:   Mon, 28 Sep 2020 16:59:00 -0700
Message-Id: <20200928235901.28337-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928235901.28337-1-nicoleotsuka@gmail.com>
References: <20200928235901.28337-1-nicoleotsuka@gmail.com>
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

Changelog
v1->v2:
 * Changed type of swgroup to "unsigned int", following Thierry's
   commnets.

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

