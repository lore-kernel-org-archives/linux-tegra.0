Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF92C47097
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCF34613B1
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFCQrG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhFCQrG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:47:06 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19971C061756
        for <linux-tegra@vger.kernel.org>; Thu,  3 Jun 2021 09:45:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w21so7806268edv.3
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VlNxvqMh2IT7k8GWqSLT7kJqPAFU4Cya45iZg+g4Vc4=;
        b=Zu/ezZh0v9MeUs3qS/pHQ9pRZvTfL/Cqwv4R0B6/VuXkpBg1uWUXtbDZlI3hXXKBGX
         OwVzW52158BlV3RzQpM8MFlBoDtFQsNlTv0orvpZoI8kGGuVBlj6+P6Uv+vRCoA3Tzox
         7QW7pTrBQ6Mfsq0SKQ+dJ+yuTvKMhcIVFrnlUxrHjIbMQ8fFZU7qyB5yxUfJz7qIZfzd
         3bwdKSNUycLAafoaEnEnRyT2SyvG8CJdJSBM5IaS2gCrtFxJbymhtrbXWkuk2Di3/9Sp
         NrS+kmNwVw/gfVNS2uf2k49gsYQtyuh7Qyj18zOPtmjaSGtf1iNaJzZjIARoFqvgVdnI
         SgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VlNxvqMh2IT7k8GWqSLT7kJqPAFU4Cya45iZg+g4Vc4=;
        b=lCWszgy3Q3XADCeRkIAVOICGdFPUPTWdx2CuCn14S8UAAX9MZXhHWZwWFG/dzL35Uq
         ejmDnqIqhTmnJ5gqTe2OE3yNoep3A3kW7LVD8T0gKathn6Si6dDMxsulBU9PqgyIcCZA
         d/NO+P8WpiEdj+1XPFCsg2CKitk8XDWtzRIeVEi1ZYeThOvD0PVLdfW9TSobqdufVzFf
         qiTgHNr8AJwC71NgYvTZvay9QeOvCUdUX+VIsRk/rWKa8UZjiMJVyDZI989S52X4ab/9
         imoEDm6DduqAUqsx+KDlXBtrQkGETa6FgQ7roLlA7yF9TC0IafSm8MlX8OWu4EF8aoYQ
         JYuw==
X-Gm-Message-State: AOAM533DMF2rOfKpGJXlI6MK8g/qsRiETSrq9q6EzxmYfOw/pu/GFlTu
        5NeRIoaCBbjTEZCftyUMB8vtvyvWW1Y=
X-Google-Smtp-Source: ABdhPJxXrXwWK4QFgB5nUksaiKnWR+sh8XjHBPlh2ZAs/Xu5vH2IbScqCAAZFdw1SPRaf2s7vskTHQ==
X-Received: by 2002:a05:6402:b17:: with SMTP id bm23mr411771edb.236.1622738705681;
        Thu, 03 Jun 2021 09:45:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id cz14sm1972696edb.84.2021.06.03.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/9] iommu/arm-smmu: Implement ->probe_finalize()
Date:   Thu,  3 Jun 2021 18:46:26 +0200
Message-Id: <20210603164632.1000458-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Implement a ->probe_finalize() callback that can be used by vendor
implementations to perform extra programming necessary after devices
have been attached to the SMMU.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- remove unnecessarily paranoid check

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208ca..d20ce4d57df2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1450,6 +1450,18 @@ static void arm_smmu_release_device(struct device *dev)
 	iommu_fwspec_free(dev);
 }
 
+static void arm_smmu_probe_finalize(struct device *dev)
+{
+	struct arm_smmu_master_cfg *cfg;
+	struct arm_smmu_device *smmu;
+
+	cfg = dev_iommu_priv_get(dev);
+	smmu = cfg->smmu;
+
+	if (smmu->impl->probe_finalize)
+		smmu->impl->probe_finalize(smmu, dev);
+}
+
 static struct iommu_group *arm_smmu_device_group(struct device *dev)
 {
 	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
@@ -1569,6 +1581,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.iova_to_phys		= arm_smmu_iova_to_phys,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
+	.probe_finalize		= arm_smmu_probe_finalize,
 	.device_group		= arm_smmu_device_group,
 	.enable_nesting		= arm_smmu_enable_nesting,
 	.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index c31a59d35c64..147c95e7c59c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -439,6 +439,7 @@ struct arm_smmu_impl {
 				  struct device *dev, int start);
 	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
 	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
+	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
 };
 
 #define INVALID_SMENDX			-1
-- 
2.31.1

