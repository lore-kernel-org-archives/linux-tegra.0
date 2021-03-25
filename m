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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D102AC433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8953F61A11
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhCYNDv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbhCYNDW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:03:22 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F72C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:22 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id o16so2261938wrn.0
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKTLVgXnpvjbazWRAvYU9QVKhpZ/RAu3/Gpz9BY4uVw=;
        b=KFeothr6D71F3V2OXxn/HRBCWxvrTBYpmNGhPi9V+JxZhJ6pWCxgAP1aaMrEhmZ07i
         6oScVl+zTvPEAN8yn1CbSk/xdcdGUQr+q02kWeBad3OFf3/tpMYiuVMJ9VlknYt1J5MS
         +97xz9GH00xHbJCW68FlbyFaxNoFm+EKzwRbmMotU7phTKMxQEL9JaVEuhc+3IFciyZ2
         vwwIAQ3ifi1NX6n3BRLudXPV7heZmfJheZHUMymDcjYBhXVr92M3wLpqwnE2TFj2g4Nv
         EV3dqewe9iIQOX0Q6W0fwGT5j+wVmgNMJ2N9712sviOpK6ZYGNUpzSjKOQXBfaLk5Kzd
         8LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eKTLVgXnpvjbazWRAvYU9QVKhpZ/RAu3/Gpz9BY4uVw=;
        b=R94fvIT5cFH0Y2fVybkaqoLb2bhMU5jQeNRtWVwBlbrteczXOlQBRRlNmqJ3Frti5W
         QmR1SKUBvI1MMh5rYmY/L+Z4nNy45QQF0bcb7D4Y3+ZUA1TzE0+og+Ahlpw+Ge6Amjkq
         nJdzs7beXSmHwEwK+UCMvdjAQpE36I7ZaBZdrep+ryyu+JOhlK5GuO1qnRSGI3vRZtUb
         LwteJabX6TkfHPo0eAx8Ystojn9cfLm4jRpn/N2SudOQie8OOWdIkQmgNVnnZ6QmcMvJ
         ll8t8vxLUBFbcG7jYj8iaTGKScR+g/YT1Hupyy/DM1r0KxV04HqH9KNRFU9r3UnzuE0k
         IuKA==
X-Gm-Message-State: AOAM530JeRH0ANFWbxk1ipuZuFB+3zZ3DkgfvgKbeBqyj6WnQeluL8Yh
        1q39vCNpN/c6mJfKY4t7GX4=
X-Google-Smtp-Source: ABdhPJx3GmEqYfvOBuvZb2Uk9r0KJU7t8FHVQTFIZtLY/uBVG5wGedbz/YmLbwu74t9njeQ0AJUQpg==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr8997953wrd.104.1616677400702;
        Thu, 25 Mar 2021 06:03:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u63sm6494706wmg.24.2021.03.25.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:03:19 -0700 (PDT)
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
Subject: [PATCH 1/9] memory: tegra: Move internal data structures into separate header
Date:   Thu, 25 Mar 2021 14:03:24 +0100
Message-Id: <20210325130332.778208-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

From Tegra20 through Tegra210, either the GART or SMMU drivers need
access to the internals of the memory controller driver because they are
tightly coupled (in fact, the GART and SMMU are part of the memory
controller). On later chips, a separate hardware block implements the
SMMU functionality, so this is no longer needed. However, we still want
to reuse some of the existing infrastructure on later chips, so split
the memory controller internals into a separate header file to avoid
conflicts with the implementation on newer chips.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-gart.c      |  2 +-
 drivers/iommu/tegra-smmu.c      |  2 +-
 drivers/memory/tegra/mc.h       |  2 +-
 drivers/memory/tegra/tegra186.c | 12 ++++---
 include/soc/tegra/mc-internal.h | 62 +++++++++++++++++++++++++++++++++
 include/soc/tegra/mc.h          | 50 --------------------------
 6 files changed, 72 insertions(+), 58 deletions(-)
 create mode 100644 include/soc/tegra/mc-internal.h

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 6f130e51f072..716185234b2a 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -17,7 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 
-#include <soc/tegra/mc.h>
+#include <soc/tegra/mc-internal.h>
 
 #define GART_REG_BASE		0x24
 #define GART_CONFIG		(0x24 - GART_REG_BASE)
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 602aab98c079..fdb798c62596 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -17,7 +17,7 @@
 #include <linux/dma-mapping.h>
 
 #include <soc/tegra/ahb.h>
-#include <soc/tegra/mc.h>
+#include <soc/tegra/mc-internal.h>
 
 struct tegra_smmu_group {
 	struct list_head list;
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1ee34f0da4f7..116bf68325b7 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -10,7 +10,7 @@
 #include <linux/io.h>
 #include <linux/types.h>
 
-#include <soc/tegra/mc.h>
+#include <soc/tegra/mc-internal.h>
 
 #define MC_INTSTATUS					0x00
 #define MC_INTMASK					0x04
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index e25c954dde2e..aa676c45650b 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -9,6 +9,8 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+#include <soc/tegra/mc.h>
+
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
 #include <dt-bindings/memory/tegra186-mc.h>
 #endif
@@ -31,14 +33,14 @@ struct tegra186_mc_soc {
 	unsigned int num_clients;
 };
 
-struct tegra186_mc {
+struct tegra_mc {
 	struct device *dev;
 	void __iomem *regs;
 
 	const struct tegra186_mc_soc *soc;
 };
 
-static void tegra186_mc_program_sid(struct tegra186_mc *mc)
+static void tegra186_mc_program_sid(struct tegra_mc *mc)
 {
 	unsigned int i;
 
@@ -1523,8 +1525,8 @@ static const struct tegra186_mc_soc tegra194_mc_soc = {
 
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
-	struct tegra186_mc *mc;
 	struct resource *res;
+	struct tegra_mc *mc;
 	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
@@ -1552,7 +1554,7 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 static int tegra186_mc_remove(struct platform_device *pdev)
 {
-	struct tegra186_mc *mc = platform_get_drvdata(pdev);
+	struct tegra_mc *mc = platform_get_drvdata(pdev);
 
 	of_platform_depopulate(mc->dev);
 
@@ -1577,7 +1579,7 @@ static int __maybe_unused tegra186_mc_suspend(struct device *dev)
 
 static int __maybe_unused tegra186_mc_resume(struct device *dev)
 {
-	struct tegra186_mc *mc = dev_get_drvdata(dev);
+	struct tegra_mc *mc = dev_get_drvdata(dev);
 
 	tegra186_mc_program_sid(mc);
 
diff --git a/include/soc/tegra/mc-internal.h b/include/soc/tegra/mc-internal.h
new file mode 100644
index 000000000000..4f327695d58c
--- /dev/null
+++ b/include/soc/tegra/mc-internal.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (C) 2021 NVIDIA Corporation
+ */
+
+#ifndef __SOC_TEGRA_MC_INTERNAL_H__
+#define __SOC_TEGRA_MC_INTERNAL_H__
+
+#include <soc/tegra/mc.h>
+
+struct tegra_mc_soc {
+	const struct tegra_mc_client *clients;
+	unsigned int num_clients;
+
+	const unsigned long *emem_regs;
+	unsigned int num_emem_regs;
+
+	unsigned int num_address_bits;
+	unsigned int atom_size;
+
+	u8 client_id_mask;
+
+	const struct tegra_smmu_soc *smmu;
+
+	u32 intmask;
+
+	const struct tegra_mc_reset_ops *reset_ops;
+	const struct tegra_mc_reset *resets;
+	unsigned int num_resets;
+
+	const struct tegra_mc_icc_ops *icc_ops;
+
+	int (*init)(struct tegra_mc *mc);
+};
+
+struct tegra_mc {
+	struct device *dev;
+	struct tegra_smmu *smmu;
+	struct gart_device *gart;
+	void __iomem *regs;
+	struct clk *clk;
+	int irq;
+
+	const struct tegra_mc_soc *soc;
+	unsigned long tick;
+
+	struct tegra_mc_timing *timings;
+	unsigned int num_timings;
+
+	struct reset_controller_dev reset;
+
+	struct icc_provider provider;
+
+	spinlock_t lock;
+
+	struct {
+		struct dentry *root;
+	} debugfs;
+};
+
+#endif /* __SOC_TEGRA_MC_INTERNAL_H__ */
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d2fbe6a8b25b..7be8441c6e9e 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -155,56 +155,6 @@ struct tegra_mc_icc_ops {
 						void *data);
 };
 
-struct tegra_mc_soc {
-	const struct tegra_mc_client *clients;
-	unsigned int num_clients;
-
-	const unsigned long *emem_regs;
-	unsigned int num_emem_regs;
-
-	unsigned int num_address_bits;
-	unsigned int atom_size;
-
-	u8 client_id_mask;
-
-	const struct tegra_smmu_soc *smmu;
-
-	u32 intmask;
-
-	const struct tegra_mc_reset_ops *reset_ops;
-	const struct tegra_mc_reset *resets;
-	unsigned int num_resets;
-
-	const struct tegra_mc_icc_ops *icc_ops;
-
-	int (*init)(struct tegra_mc *mc);
-};
-
-struct tegra_mc {
-	struct device *dev;
-	struct tegra_smmu *smmu;
-	struct gart_device *gart;
-	void __iomem *regs;
-	struct clk *clk;
-	int irq;
-
-	const struct tegra_mc_soc *soc;
-	unsigned long tick;
-
-	struct tegra_mc_timing *timings;
-	unsigned int num_timings;
-
-	struct reset_controller_dev reset;
-
-	struct icc_provider provider;
-
-	spinlock_t lock;
-
-	struct {
-		struct dentry *root;
-	} debugfs;
-};
-
 int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 
-- 
2.30.2

