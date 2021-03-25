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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AC8C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EADA5619E4
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhCYNDx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhCYNDe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:03:34 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9DAC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:34 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g25so1158743wmh.0
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sKlX6lxFZZDQx81KHxlBAuS3KXxxabdkg7deqsQD9E8=;
        b=Q6MDJba0++Cqa2FqTPpBKYmteCnTmb4Qj0MNVThccjPAfe15l8jJHB4MfP1IhSBvAd
         oPEObUu5jLZZMLijGS4X/S5BqL4OxtVllLkwGG7MM5SSHYYAqBQDawvPV3OwbScjr0Yn
         AVBqjKfgS7IuniJewPzzMgK/pm2odVCKwZdFXnZj8vDDMMcvHsej5IMPLgju9BC4Cr4r
         tc0smQFkTOhHAusLixUPjzS1lfptjzJwjKpxOZoiSpR0QlE4ayuY9Jz4ZARnDHX184jH
         ebhG9llOkxRw6sMsZsgTQBSTdGl8G9vKOOZthtsvQFvC7IfdHGnQgTVhmojD2fU2dJUT
         xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sKlX6lxFZZDQx81KHxlBAuS3KXxxabdkg7deqsQD9E8=;
        b=QSqhBk4w0QIYCPVVvNZXRCnZ95ke8yQwMySNsjaBeZ8fyNad0mhUCA/D6xmmr6CxNN
         MXsK6lSuCEnTebzvj7ubR38JVHhsi4cT97+vgKnZpokpg33NHkCfuHrH9+Ta/IovZG0H
         CWNXKK+e32iUHTKKekNUSoh3uuVw4KeYZ09cIiJCPDFnW6fTbY9AxmqqNW1XV/exmKjc
         MiWKv5ULH7nri2Jy7pPZfM2C5RVWiuS4abokjKKwCGkPqCSS00c7zAAdQ/bzMd38d6ea
         LYFuBExaFgQ9nRkhHkhgGoxvSzEL+zsGRq3CKCvslhFhP61Y2djOv2C8kfThz8M9Nwa0
         4AGw==
X-Gm-Message-State: AOAM530c0uLkyy+1Gu0OslTHrpuMYDvK22zPdS+7GAFhJlyqiqF7OpkJ
        6EjWP4Dqa9B8EDCW4LusBnjX0YnHJhM=
X-Google-Smtp-Source: ABdhPJzB3TMNW+Kkz/jNUXXcFJCRi95WiLM+uNOvGfihjgYU+d8eM8S/suCmJcW+aLLKKTBKPIBLwg==
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr7822026wmq.183.1616677412792;
        Thu, 25 Mar 2021 06:03:32 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h13sm5678667wmq.29.2021.03.25.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:03:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] iommu/arm-smmu: Implement ->probe_finalize()
Date:   Thu, 25 Mar 2021 14:03:27 +0100
Message-Id: <20210325130332.778208-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
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
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 +++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index d8c6bfde6a61..4589e76543a8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1447,6 +1447,22 @@ static void arm_smmu_release_device(struct device *dev)
 	iommu_fwspec_free(dev);
 }
 
+static void arm_smmu_probe_finalize(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_master_cfg *cfg;
+	struct arm_smmu_device *smmu;
+
+	if (!fwspec || fwspec->ops != &arm_smmu_ops)
+		return;
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
@@ -1630,6 +1646,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.iova_to_phys		= arm_smmu_iova_to_phys,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
+	.probe_finalize		= arm_smmu_probe_finalize,
 	.device_group		= arm_smmu_device_group,
 	.domain_get_attr	= arm_smmu_domain_get_attr,
 	.domain_set_attr	= arm_smmu_domain_set_attr,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d2a2d1bc58ba..6779db30cebb 100644
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
2.30.2

