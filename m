Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2012C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Apr 2022 08:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355414AbiD2I0R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Apr 2022 04:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbiD2I0Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 04:26:16 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F60C12E6
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:56 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q185so9634618ljb.5
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PAlN+PTUyqks6hqGrW+qckqB/lH9aZjKYWgmrQYYHa4=;
        b=fUqJrWvtrx8Af1i1dIKCvDN65PW96rX20FLwt+ie7pGKrJuRIq5FJhHpdmjo8bNp2a
         hjNQjVLxsxnZ7pQMF4RKdt1pcwonGXo2nE2ewIIj/yvzYz/MYLAlN3bPZFD1jKGlinaq
         IGk+NWifc1meAHo1k0pEZT3pdD/EneCDx4HJ46ltwQSZuGycNQT2r6H4awyAuYWys/Nt
         76Odh6+ZOWivq3i++ViCecadNgQiH642RERe4sQWEga5G8yYfCjN1mdNywPsoPAIQC4F
         LAAy7+r8mJGOHpI8G7LidTTD/kZDEqvrv+ZpoAz1Syv140gdhf65HqzMpe2tSvM3y5Cm
         NGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PAlN+PTUyqks6hqGrW+qckqB/lH9aZjKYWgmrQYYHa4=;
        b=h4+HcTZUQlfFIBKsP5VtVC37j/grlJlyDk2oDY30/UJahHF57YoYTpH5utAIcJiAcR
         7IkH2QzsmBIspHD2g0XGSwCk8WDXWsmEM8oirZfLDqgrC+YcKC17CG3+CJVuCTkuRptp
         IuqfMTVLIRzxlKqcyvY/dErzNRnESMdqWYotrfFkF1dpieKEzyfWvNUUhCw1C1yHAFd3
         hS8RGIcAnscxl9zy2zyCl7wESqGNMzKLfwFpDpXsOFjUMsnf4Pn0nobwH9Iih0cXoR1V
         v+ox+f1l+N4HmnNfRBA/tm3vB7s+YmFRrA/PJdQe/YtxkSILGxP69sUIELFBDFkL1fq0
         zK8g==
X-Gm-Message-State: AOAM532oVxVzWoOJVOoNfgHOqWjirxe9+reaNFb1Ului5BWSSk74b7tC
        EOoWVYurrvFKqe5noZaflfgDLJyrSPs=
X-Google-Smtp-Source: ABdhPJxQNk6WVaoL+9t7XN7z10p4srU1Oi91euacYwvlEX3pKTPyIRh42d6HgZfmjfH3BSEQY0XflQ==
X-Received: by 2002:a05:651c:893:b0:249:4023:3818 with SMTP id d19-20020a05651c089300b0024940233818mr24408230ljq.44.1651220575123;
        Fri, 29 Apr 2022 01:22:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d11-20020a19f24b000000b0047224d546adsm178803lfk.132.2022.04.29.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 01:22:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] iommu/arm-smmu: Support Tegra234 SMMU
Date:   Fri, 29 Apr 2022 10:22:43 +0200
Message-Id: <20220429082243.496000-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429082243.496000-1-thierry.reding@gmail.com>
References: <20220429082243.496000-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Allow the NVIDIA-specific ARM SMMU implementation to bind to the SMMU
instances found on Tegra234.

Acked-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 2c25cce38060..658f3cc83278 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
-	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
+	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
+	    of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
 	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
-- 
2.35.1

