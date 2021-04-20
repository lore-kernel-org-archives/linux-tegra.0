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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3821BC43462
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 054B0613B8
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbhDTR0S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbhDTR0S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:18 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEBCC06138A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:46 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id g5so52753850ejx.0
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fK4kfWRtqlQ6vIoyRrov57PspjW7vhkuyE8BA4mAeb8=;
        b=WhL1BPNeZ5a2IX9j90mRpN+imU32bNQi4SzreJr9Wg5mQk8JTllq0LdVMUkoN6kS5A
         vDJzGPvH/mFNaKSGROA9dGN2hAH5lgk9YCwUUWsD9FQh5b8iLR9XLSHdMrR+MgyQB9Jh
         8lHqtmk4UbzklAZ4VKghHdPCdBowFTXCA2E53dPsAE4EcetOI7AqZ2CEyimR7TNs4LZt
         lTQfh9x86lLWAOmsf33Nt4biMSdvjL7R/yDBjbdnoSvqUORSbja521klVVFUV1lgXlCY
         Cp5pB1ol77HfSVwr5wPt1EUfHrrV0yD/aq+vzAmE5S3nP8sestMEspJgAEBQBYMY/sq8
         Ztbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fK4kfWRtqlQ6vIoyRrov57PspjW7vhkuyE8BA4mAeb8=;
        b=hc/5NSiMToZBiynAHx9yL5C7/hBvR0CAS4ZAIFeM+6304d3bwpwwxnQ9naHTh6gE9G
         /M9PhaAmMm91aiCNuweqOWjxKRryYwm/YLWR9V6mR0cUeTurF+6sc+0UHuWiJKsegQlW
         KvG0v0X+8xqcuBNHFd3/drgfWEJhprSl7Xk/mgMLqgiYoXGPBqo8MVPlq4LJCwtmtCpH
         m6ZK8PvN+RrWLW2UjTCAblgc7ymBMoYRCUxZZ4zlhgH4B8QzdTwvYQhhtA+dw0nHzgJa
         5ZppcbuCGyvdRaPGR9p69s0rq1WN7c35Qef1XuhkFaGuWHBhO5KymxNEYHwoYwhjRYii
         HNjg==
X-Gm-Message-State: AOAM533Fp/fxt9f5Mds5jnnWRuEYKEs40HloJZqgnabh49B8vBBrWFG5
        Uk9BRtS+Yj7Olr62B7Q8jRU=
X-Google-Smtp-Source: ABdhPJy0IRuIdzcHJGqqBHme2I09VtTa+12s85CdaDkVuGUyC0rSBvQ77xOu2JZezYZ6RqULbBxobQ==
X-Received: by 2002:a17:906:a0d4:: with SMTP id bh20mr28752997ejb.348.1618939545017;
        Tue, 20 Apr 2021 10:25:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b22sm16377719edv.96.2021.04.20.10.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:44 -0700 (PDT)
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
Subject: [PATCH v2 04/10] iommu/arm-smmu: tegra: Detect number of instances at runtime
Date:   Tue, 20 Apr 2021 19:26:13 +0200
Message-Id: <20210420172619.3782831-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
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
Changes in v2:
- provide a separate implementation to simplify single instances
---
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 58 ++++++++++++++------
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 29117444e5a0..0e547b29143d 100644
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
@@ -235,12 +248,17 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.context_fault = nvidia_smmu_context_fault,
 };
 
+static const struct arm_smmu_impl nvidia_smmu_single_impl = {
+	.probe_finalize = nvidia_smmu_probe_finalize,
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
@@ -248,16 +266,24 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 
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
2.30.2

