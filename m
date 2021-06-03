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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73183C47097
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56754613F5
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbhFCQrK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhFCQrK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:47:10 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52338C06175F
        for <linux-tegra@vger.kernel.org>; Thu,  3 Jun 2021 09:45:09 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id dg27so7868971edb.12
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+HPQE7Wu/U0PWuANbUnRRMUxt8XYMXfvMeqtWgsxX2A=;
        b=DWF1ND1JoYhbiNCUKUNApwzdJwbAPEEjKJCscMNFabqzF0tNNXz7EcVUvM1Tu4YRBn
         2yvREMF0gPfCEqXIj3VITXosJ7x4mqAfHFUIF4saEgKMCDPuTr4luvSAw3NLt3uyaCsD
         zSRt6d1AAvqam5MRDt0PVUfvuRkUshgG8UNWbtq4RY5Qjud+PKV7ncvC5MlLcoEC+vOQ
         kBNatm2qVH9LKug8VOBfojI1yfvtyfwCl6KP/HwEx0pUWmr3pv8hgyQHVWmM7Wzf2HY4
         Ccko9vjgsRbuqVaw+GwvlJmG1rKA3p2TNiI5MVsk9rovNCzTmn6PxEFmpYknh9BQKKIj
         Nb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+HPQE7Wu/U0PWuANbUnRRMUxt8XYMXfvMeqtWgsxX2A=;
        b=WB7A7vW/OgrKVuwW//COTAdxzc/OPoVW1FrzRCwCyaBneKuHsWL9b9LHJiJ1MbaBc8
         Nnx2Iw3CndD6FT1CqbLF6+EMh39SexSlQaLSKJkXZMvBtNdOtSLWQizM9lsuoXShWNw5
         m4c1qcgMAIgmu2ZvzJZbNmVGRJd4rrUTUZwQGRJFl1vimY3++uF3/MOTd9o6g5kIpvlf
         6D//GGLUotFsDvqLTwZLcbLr7YC9O7+n3UuVDcvWiBsW0sAX+S6hRGbhmxi4xPMrA669
         IRmEke1elZ+SfxM0OChwBnPUb8svewkpElbiWuI6ouna1QqcR4Vn4kDrLrLn77WS3MeQ
         MAHA==
X-Gm-Message-State: AOAM530YAVc7DJwOGJzJLgmGHdb1Qz1ZaieBS0dMsbrD2PU1cNj1DyKT
        ncB7pjuJWH+NvmOVLNg5deE=
X-Google-Smtp-Source: ABdhPJyAuiwn93zwB01paf3aYl4lIS4qBDAzg3kRCeqosdXGXGE/rGMikrDkYrapoNqHcGJ3U/ZmSA==
X-Received: by 2002:aa7:cdd8:: with SMTP id h24mr407362edw.276.1622738707944;
        Thu, 03 Jun 2021 09:45:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i15sm1743989ejk.30.2021.06.03.09.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:06 -0700 (PDT)
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
Subject: [PATCH v3 4/9] iommu/arm-smmu: tegra: Detect number of instances at runtime
Date:   Thu,  3 Jun 2021 18:46:27 +0200
Message-Id: <20210603164632.1000458-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Parse the reg property in device tree and detect the number of instances
represented by a device tree node. This is subsequently needed in order
to support single-instance SMMUs with the Tegra implementation because
additional programming is needed to properly configure the SID override
registers in the memory controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- move .probe_finalize initialization to later patch

Changes in v2:
- provide a separate implementation to simplify single instances

 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 57 ++++++++++++++------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 29117444e5a0..23889090eb01 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -20,13 +20,19 @@
  * The third instance usage is through standard arm-smmu driver itself and
  * is out of scope of this implementation.
  */
-#define NUM_SMMU_INSTANCES 2
+#define MAX_SMMU_INSTANCES 2
 
 struct nvidia_smmu {
-	struct arm_smmu_device	smmu;
-	void __iomem		*bases[NUM_SMMU_INSTANCES];
+	struct arm_smmu_device smmu;
+	void __iomem *bases[MAX_SMMU_INSTANCES];
+	unsigned int num_instances;
 };
 
+static inline struct nvidia_smmu *to_nvidia_smmu(struct arm_smmu_device *smmu)
+{
+	return container_of(smmu, struct nvidia_smmu, smmu);
+}
+
 static inline void __iomem *nvidia_smmu_page(struct arm_smmu_device *smmu,
 					     unsigned int inst, int page)
 {
@@ -47,9 +53,10 @@ static u32 nvidia_smmu_read_reg(struct arm_smmu_device *smmu,
 static void nvidia_smmu_write_reg(struct arm_smmu_device *smmu,
 				  int page, int offset, u32 val)
 {
+	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
 	unsigned int i;
 
-	for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
+	for (i = 0; i < nvidia->num_instances; i++) {
 		void __iomem *reg = nvidia_smmu_page(smmu, i, page) + offset;
 
 		writel_relaxed(val, reg);
@@ -67,9 +74,10 @@ static u64 nvidia_smmu_read_reg64(struct arm_smmu_device *smmu,
 static void nvidia_smmu_write_reg64(struct arm_smmu_device *smmu,
 				    int page, int offset, u64 val)
 {
+	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
 	unsigned int i;
 
-	for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
+	for (i = 0; i < nvidia->num_instances; i++) {
 		void __iomem *reg = nvidia_smmu_page(smmu, i, page) + offset;
 
 		writeq_relaxed(val, reg);
@@ -79,6 +87,7 @@ static void nvidia_smmu_write_reg64(struct arm_smmu_device *smmu,
 static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
 				 int sync, int status)
 {
+	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
 	unsigned int delay;
 
 	arm_smmu_writel(smmu, page, sync, 0);
@@ -90,7 +99,7 @@ static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
 			u32 val = 0;
 			unsigned int i;
 
-			for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
+			for (i = 0; i < nvidia->num_instances; i++) {
 				void __iomem *reg;
 
 				reg = nvidia_smmu_page(smmu, i, page) + status;
@@ -112,9 +121,10 @@ static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
 
 static int nvidia_smmu_reset(struct arm_smmu_device *smmu)
 {
+	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
 	unsigned int i;
 
-	for (i = 0; i < NUM_SMMU_INSTANCES; i++) {
+	for (i = 0; i < nvidia->num_instances; i++) {
 		u32 val;
 		void __iomem *reg = nvidia_smmu_page(smmu, i, ARM_SMMU_GR0) +
 				    ARM_SMMU_GR0_sGFSR;
@@ -157,8 +167,9 @@ static irqreturn_t nvidia_smmu_global_fault(int irq, void *dev)
 	unsigned int inst;
 	irqreturn_t ret = IRQ_NONE;
 	struct arm_smmu_device *smmu = dev;
+	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
 
-	for (inst = 0; inst < NUM_SMMU_INSTANCES; inst++) {
+	for (inst = 0; inst < nvidia->num_instances; inst++) {
 		irqreturn_t irq_ret;
 
 		irq_ret = nvidia_smmu_global_fault_inst(irq, smmu, inst);
@@ -202,11 +213,13 @@ static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
 	struct arm_smmu_device *smmu;
 	struct iommu_domain *domain = dev;
 	struct arm_smmu_domain *smmu_domain;
+	struct nvidia_smmu *nvidia;
 
 	smmu_domain = container_of(domain, struct arm_smmu_domain, domain);
 	smmu = smmu_domain->smmu;
+	nvidia = to_nvidia_smmu(smmu);
 
-	for (inst = 0; inst < NUM_SMMU_INSTANCES; inst++) {
+	for (inst = 0; inst < nvidia->num_instances; inst++) {
 		irqreturn_t irq_ret;
 
 		/*
@@ -235,12 +248,16 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.context_fault = nvidia_smmu_context_fault,
 };
 
+static const struct arm_smmu_impl nvidia_smmu_single_impl = {
+};
+
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	struct resource *res;
 	struct device *dev = smmu->dev;
 	struct nvidia_smmu *nvidia_smmu;
 	struct platform_device *pdev = to_platform_device(dev);
+	unsigned int i;
 
 	nvidia_smmu = devm_krealloc(dev, smmu, sizeof(*nvidia_smmu), GFP_KERNEL);
 	if (!nvidia_smmu)
@@ -248,16 +265,24 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 
 	/* Instance 0 is ioremapped by arm-smmu.c. */
 	nvidia_smmu->bases[0] = smmu->base;
+	nvidia_smmu->num_instances++;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		return ERR_PTR(-ENODEV);
+	for (i = 1; i < MAX_SMMU_INSTANCES; i++) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
+			break;
 
-	nvidia_smmu->bases[1] = devm_ioremap_resource(dev, res);
-	if (IS_ERR(nvidia_smmu->bases[1]))
-		return ERR_CAST(nvidia_smmu->bases[1]);
+		nvidia_smmu->bases[i] = devm_ioremap_resource(dev, res);
+		if (IS_ERR(nvidia_smmu->bases[i]))
+			return ERR_CAST(nvidia_smmu->bases[i]);
+
+		nvidia_smmu->num_instances++;
+	}
 
-	nvidia_smmu->smmu.impl = &nvidia_smmu_impl;
+	if (nvidia_smmu->num_instances == 1)
+		nvidia_smmu->smmu.impl = &nvidia_smmu_single_impl;
+	else
+		nvidia_smmu->smmu.impl = &nvidia_smmu_impl;
 
 	return &nvidia_smmu->smmu;
 }
-- 
2.31.1

