Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08119C43461
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C282761076
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbhDTR0S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233417AbhDTR0R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:17 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286D1C06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id x12so38692128ejc.1
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vYLUVZhwumDd6iKqlvn3vWsQCDgb86syRKsPwDitvKM=;
        b=MrQzk8xsX/zig2TNikMkG/b+PJY2QfTGcsvUoQ5y26uS9va8coblKQPbgaS8kOGMHb
         xmCsGMllAzPwJhSr70PtB1ZDjsqrZHRksVsgu6KSLSe584UVW/eZrmiEaYcnLx76raP5
         RDfGVyxn9MTVo+6eVUNerw/TguDRLoWjXElDLdADXjmHAtZ2w+iY5r/4N+nJzJhu6Jq4
         3u1/f73oz8G8r5wYgv5mKhVTtZuqUiDL/o4L705D+D3asKLlCMPQtytPBjrsTOohKfsT
         x4UP8kJ6I1UjfZ+byHhGY1N/7y12q09oWHro0zoq6KPk5fb1xBZuqju7aZL2BZrO7KmF
         co2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vYLUVZhwumDd6iKqlvn3vWsQCDgb86syRKsPwDitvKM=;
        b=cy0XVFR0cfQ/pTBuxo3/GdXnGQk6Jby+W4EmYqzotDgdKdSNZqRA38/pJryiu2OxsE
         4Hs956DLtjtqjOKndtUl/XQVz6doUeMNU4xP3FeznzKocUtJPZas11rX3Gl8GDL8ABLV
         ehxJBWjstWXKaOjGNBVarptK5VGOJu0zFAjah73R5HGUPDCKsiJj1KaJIuSAGO5aasCo
         cccN8km4tOb96gmEXQ9U8wpq/xBpBMftGcH0HvKTx9WIaYOcoTkY7SEuDgNW/Wc3S+vr
         jpDPrVvoDbpv7J30q+dyZhykTqVObkgtPdxVLakB5GginUFkoq9DmyMJm34IWuYWQ7jW
         0aQw==
X-Gm-Message-State: AOAM531hIr/JLceiU0wqg7piH+GgWN2zqvqFvNRLkzAuDiE+iFOgWAtg
        BLKIIJsJfNLrrLhmkddDVPA=
X-Google-Smtp-Source: ABdhPJzTOoaDZ6q+yYNmSPXPlq9tSYmOoDWfckBljTEm8mgC71rzmaANjq8LT4+KoVyI4ceEso+rbA==
X-Received: by 2002:a17:907:e8a:: with SMTP id ho10mr28819689ejc.110.1618939542924;
        Tue, 20 Apr 2021 10:25:42 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n11sm16791090edo.15.2021.04.20.10.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:41 -0700 (PDT)
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
Subject: [PATCH v2 03/10] iommu/arm-smmu: Implement ->probe_finalize()
Date:   Tue, 20 Apr 2021 19:26:12 +0200
Message-Id: <20210420172619.3782831-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
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
-remove unnecessarily paranoid check
---
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
2.30.2

