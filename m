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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D1CC47425
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 621BD20897
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijRT4nTY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgI2E6X (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 00:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI2E6W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 00:58:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFC3C061755;
        Mon, 28 Sep 2020 21:58:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id fa1so2024412pjb.0;
        Mon, 28 Sep 2020 21:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=saP3o3/ZHmG3y2rYGxjiPv6CDY9HgD7NIJX7AD4zLNk=;
        b=ijRT4nTYkzL+krkNzgBJBgV7Gtqxk57xn/BWwJrbRz57EwjDcNUNnTnEPN6MBfLHbM
         cjED5iKz+1W3nOnIYuCSgObHcZJZtrK2gJL9psKylSctrKw+9xLbyxSHLx3/ES77BTet
         beg4WJQYkuGpcj2VkN8/BBZZ6zM0Ri4JF+BbEyoOgFK9kbe5q5dMYmUPyDYlGRfLygjk
         wzmXLKYI8RHT0SbqNxOtdjatrDiEnhZkTNuHbMrrMDwhcnurh7uzA7K4/sn4+xKYVM8L
         BMjUTQI+6g0vB17wEGpjuDrCv88htF+afJCScFFXu4GAher9LnN0swvqxF/EXym+0zek
         68gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=saP3o3/ZHmG3y2rYGxjiPv6CDY9HgD7NIJX7AD4zLNk=;
        b=BTKOF9NncbHS50OTDfko7Zh21UgWTuYyu3hzhe1j5/ocwTdD461/rMRZn6myqiRQtf
         fVNnk1ojgF6+WO/XemHMuWpVFaOIex9NfYGnS4q9rMJVII48fdshtthVdkN2jtkzzARN
         K3c5ycEGENU/xusRrj89lvXEzyrfvZur+Am7PpQbEsgTv9pWC8R3gHtlHiq/EUjmvhyZ
         5eM/38YFCG52fxv1rxStvdjKSYf3Yb2mVFxuI2CYCsjGNsYZAEkNyDvtyPhiiYDy5gCs
         H5PFVrIc8jgtMvP0UMg+d3pJXAJeS9mOmP+AEaHDeZsw32658iLXAOB6G/V+5EqbJVtY
         GncA==
X-Gm-Message-State: AOAM533rYCofEew1ls+GLL/zqdWjt0U7eGaeBt0wbfjbKMunzqI0oOTf
        4eP14wNbT72lAmiFwU4YCkk=
X-Google-Smtp-Source: ABdhPJzihHuO7NA53SKJQEP1zPJvMkzlo0VSdnlGlqgUkP7Qocxjntpw+PhEqiDIB0fA0OC7aivJuQ==
X-Received: by 2002:a17:90a:d311:: with SMTP id p17mr2264474pju.135.1601355502135;
        Mon, 28 Sep 2020 21:58:22 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id f207sm3739028pfa.54.2020.09.28.21.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 21:58:21 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date:   Mon, 28 Sep 2020 21:52:46 -0700
Message-Id: <20200929045247.15596-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929045247.15596-1-nicoleotsuka@gmail.com>
References: <20200929045247.15596-1-nicoleotsuka@gmail.com>
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
v2->v3:
 * N/A
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

