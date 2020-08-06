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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA84C433E1
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2129920786
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs9jpI8O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730024AbgHFRIs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730050AbgHFRGV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:06:21 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F02DC002151
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:54:13 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i26so32189100edv.4
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ra7sVw9Kh8tnvSjnd2ltU1Y6A0f4SezxStS7Eqwdlew=;
        b=Fs9jpI8OHTh4O3JuPupPCNpWwqeLYfQD2fjFeknL5BDr+CNULtleTR0tWol603eVj6
         NKyM43EFuCaPg4TBGOWMMDkhUTiKmifeMRvGZGU0crlFI5VSbaMKhhAL1saOxcGBnYAh
         nxmhbDLNo/Enxwe7DP1p7cXw0JQ/iRw0c4XFEhzIkvW9D94JILDyac0EyfG3OPRwT3sL
         1AjMsQQ6T0nZoGYZOIZRqqggf7EsOe6BQPgbiwaMAowxYjl8eJ1SoKld2qm4jnfcwKhT
         WXAHNW8WklDB5zQJ1LD2MaoQST+mmigfIE8cMRas2B5KCvvpQBvrQ4B40g49IwG0xpLs
         4lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ra7sVw9Kh8tnvSjnd2ltU1Y6A0f4SezxStS7Eqwdlew=;
        b=N5EYdUghS+16PZFsl24W/3bjP0K6ruUB97ER9bA/bsbnN4MaG0shJBg5gJsZ0s5FnD
         jMXj4Q+OXKrIlMGMuEDKft2d+ecqn7cJS0gWm/Uclb5/Z4crqL0JKhKd0V3/N9oyF1Kx
         /V9D0lq8tZ7PWUPr9PCIQwO9qksRZeZyaxdaP7WmbJUv7A5lk7RTIJG/mSHMeHXPkt3z
         YgSRRgCKibNwql/MQAsKBBrNsKLl5HvocukyiJYOEaEarLXdYY1WUL6SortbVVt2quP/
         hRpi3rRAQ2jQHS1yWNJjZ2JXhhzL2V8VqwQrW9Wjf2qU9SFUkMKlMTZfrftO9JuDofw1
         kJyw==
X-Gm-Message-State: AOAM530l1xHZwXX7og2ZaMEHZede2BOH+/AmMcIhYC3vxtLgWEq5PbRq
        hQALbC+muzlTR1yslJQUiOg=
X-Google-Smtp-Source: ABdhPJzelerkywGQia0TyhZIDgT+LtbdW8VzQhBc+TGZg2GH9m2YlhlyWc0zGeZ8hdztDithEUrb1w==
X-Received: by 2002:a05:6402:308e:: with SMTP id de14mr4597139edb.344.1596729252218;
        Thu, 06 Aug 2020 08:54:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s21sm3892209ejc.16.2020.08.06.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:54:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] iommu/tegra-smmu: Balance IOMMU group reference count
Date:   Thu,  6 Aug 2020 17:54:03 +0200
Message-Id: <20200806155404.3936074-3-thierry.reding@gmail.com>
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

For groups that are shared between multiple devices, care must be taken
to acquire a reference for each device, otherwise the IOMMU core ends up
dropping the last reference too early, which will cause the group to be
released while consumers may still be thinking that they're holding a
reference to it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1ffdafe892d9..c439c0929ef8 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -818,6 +818,7 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 {
 	const struct tegra_smmu_group_soc *soc;
 	struct tegra_smmu_group *group;
+	struct iommu_group *grp;
 
 	soc = tegra_smmu_find_group(smmu, swgroup);
 	if (!soc)
@@ -827,8 +828,9 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 
 	list_for_each_entry(group, &smmu->groups, list)
 		if (group->soc == soc) {
+			grp = iommu_group_ref_get(group->group);
 			mutex_unlock(&smmu->lock);
-			return group->group;
+			return grp;
 		}
 
 	group = devm_kzalloc(smmu->dev, sizeof(*group), GFP_KERNEL);
-- 
2.27.0

