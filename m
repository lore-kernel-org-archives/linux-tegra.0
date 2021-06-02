Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBF3C4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4445D6195D
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhFBQeh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:34:37 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:43857 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFBQeh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:34:37 -0400
Received: by mail-ed1-f50.google.com with SMTP id s6so3642600edu.10
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRg8O+9zll/j0PE5QWnr41BHXNtakhNHmtlE262LWnM=;
        b=ILMb4LVw/q3edcZGtbJyj8KzbYv3BUJFAzlTi4++0zos0zAQkpcc5mb2FugVWC1cqp
         61Vh2KXKMVspjIlh5xQp5yN4zn3j6mNmLaNBVjL6HGewczdo/b7kBPSi+GYhodJuDrTA
         LsikrNBEm65gUk+yywQNpRUmq1M8NQMYwKbhU+efaDgXXae4LCzn5on5aXn0TzgC+cay
         Ol+Jq8MmEzZ0NFJvwL5jvHbTKMhYvHlzSjbKWd3xekeRRAHZMfK9fQTuWsptNHFtsoiA
         Dz7kLe367voLxUFrvuprmU8xgBLsp6oOLVWxQruBiSW16nLh+PTPrxQSszrFPKr9eR3Y
         mNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRg8O+9zll/j0PE5QWnr41BHXNtakhNHmtlE262LWnM=;
        b=QK1kd0pcer/aB8ZJg8X7yxOAYcBy+X7snmxvJusYpq+olsXeT5/PvUYgoHID2PGj/A
         HETaorkQaSLsRuvCeYWslwHNoqpeNG1LN1ZoJ6ogP6VREUKAooLdPCKDdQcRPjSnI6kH
         m16hJ2mbvGDs4kiDZQujHJz540sdhywm2o7zTuV8tvZCFsscqNTqi1WF6LLHTklpzJ/2
         yggdfgVEJslw1JLuapwHBzff2E3ygdhSkQxFvxMNhdr6o0DNarMm/msKXHxcitSm3UjM
         eoYm41XeY1ZMIvY8U2kwXww7uoZek15jcK2V7qk7Vyf32MqJL900+45bpDKhsZj6J4KX
         208A==
X-Gm-Message-State: AOAM530WpvzmdMJLC3rYtSGMFJ+8tK6NPhpyN/fqRfTcu8YestYxhcWZ
        VnaLTKO6ugkaWEU8qIL7Y/LNZL5gR50=
X-Google-Smtp-Source: ABdhPJy0nOQhEPfJYFO5ApBBeHEULu7C7hz706xUq/kbLqZsvRAYvKUbWMKKkB1Lo/RWalsbyKyinQ==
X-Received: by 2002:aa7:c441:: with SMTP id n1mr39721313edr.6.1622651505147;
        Wed, 02 Jun 2021 09:31:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y25sm247876edt.17.2021.06.02.09.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:44 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 07/12] memory: tegra: Parameterize interrupt handler
Date:   Wed,  2 Jun 2021 18:32:57 +0200
Message-Id: <20210602163302.120041-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra20 requires a slightly different interrupt handler than Tegra30 and
later, so parameterize the handler, so that each SoC implementation can
provide its own.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- make tegra30_mc_handle_irq() static

Changes in v2:
- use tegra_mc_ prefix for status and error names arrays
- keep IRQ handling mandatory in this patch

 drivers/memory/tegra/mc.c      | 136 +++++++--------------------------
 drivers/memory/tegra/mc.h      |   3 +
 drivers/memory/tegra/tegra20.c |  74 ++++++++++++++++++
 include/soc/tegra/mc.h         |   2 +
 4 files changed, 106 insertions(+), 109 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index edb3c4a25365..e6c928633b12 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -492,32 +492,7 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 	return 0;
 }
 
-const struct tegra_mc_ops tegra30_mc_ops = {
-	.probe = tegra30_mc_probe,
-};
-#endif
-
-static const char *const status_names[32] = {
-	[ 1] = "External interrupt",
-	[ 6] = "EMEM address decode error",
-	[ 7] = "GART page fault",
-	[ 8] = "Security violation",
-	[ 9] = "EMEM arbitration error",
-	[10] = "Page fault",
-	[11] = "Invalid APB ASID update",
-	[12] = "VPR violation",
-	[13] = "Secure carveout violation",
-	[16] = "MTS carveout violation",
-};
-
-static const char *const error_names[8] = {
-	[2] = "EMEM decode error",
-	[3] = "TrustZone violation",
-	[4] = "Carveout violation",
-	[6] = "SMMU translation error",
-};
-
-static irqreturn_t tegra_mc_irq(int irq, void *data)
+static irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 {
 	struct tegra_mc *mc = data;
 	unsigned long status;
@@ -529,7 +504,7 @@ static irqreturn_t tegra_mc_irq(int irq, void *data)
 		return IRQ_NONE;
 
 	for_each_set_bit(bit, &status, 32) {
-		const char *error = status_names[bit] ?: "unknown";
+		const char *error = tegra_mc_status_names[bit] ?: "unknown";
 		const char *client = "unknown", *desc;
 		const char *direction, *secure;
 		phys_addr_t addr = 0;
@@ -569,7 +544,7 @@ static irqreturn_t tegra_mc_irq(int irq, void *data)
 
 		type = (value & MC_ERR_STATUS_TYPE_MASK) >>
 		       MC_ERR_STATUS_TYPE_SHIFT;
-		desc = error_names[type];
+		desc = tegra_mc_error_names[type];
 
 		switch (value & MC_ERR_STATUS_TYPE_MASK) {
 		case MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE:
@@ -614,78 +589,31 @@ static irqreturn_t tegra_mc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
-{
-	struct tegra_mc *mc = data;
-	unsigned long status;
-	unsigned int bit;
-
-	/* mask all interrupts to avoid flooding */
-	status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
-	if (!status)
-		return IRQ_NONE;
-
-	for_each_set_bit(bit, &status, 32) {
-		const char *direction = "read", *secure = "";
-		const char *error = status_names[bit];
-		const char *client, *desc;
-		phys_addr_t addr;
-		u32 value, reg;
-		u8 id, type;
-
-		switch (BIT(bit)) {
-		case MC_INT_DECERR_EMEM:
-			reg = MC_DECERR_EMEM_OTHERS_STATUS;
-			value = mc_readl(mc, reg);
-
-			id = value & mc->soc->client_id_mask;
-			desc = error_names[2];
-
-			if (value & BIT(31))
-				direction = "write";
-			break;
-
-		case MC_INT_INVALID_GART_PAGE:
-			reg = MC_GART_ERROR_REQ;
-			value = mc_readl(mc, reg);
-
-			id = (value >> 1) & mc->soc->client_id_mask;
-			desc = error_names[2];
-
-			if (value & BIT(0))
-				direction = "write";
-			break;
-
-		case MC_INT_SECURITY_VIOLATION:
-			reg = MC_SECURITY_VIOLATION_STATUS;
-			value = mc_readl(mc, reg);
-
-			id = value & mc->soc->client_id_mask;
-			type = (value & BIT(30)) ? 4 : 3;
-			desc = error_names[type];
-			secure = "secure ";
-
-			if (value & BIT(31))
-				direction = "write";
-			break;
-
-		default:
-			continue;
-		}
-
-		client = mc->soc->clients[id].name;
-		addr = mc_readl(mc, reg + sizeof(u32));
-
-		dev_err_ratelimited(mc->dev, "%s: %s%s @%pa: %s (%s)\n",
-				    client, secure, direction, &addr, error,
-				    desc);
-	}
+const struct tegra_mc_ops tegra30_mc_ops = {
+	.probe = tegra30_mc_probe,
+	.handle_irq = tegra30_mc_handle_irq,
+};
+#endif
 
-	/* clear interrupts */
-	mc_writel(mc, status, MC_INTSTATUS);
+const char *const tegra_mc_status_names[32] = {
+	[ 1] = "External interrupt",
+	[ 6] = "EMEM address decode error",
+	[ 7] = "GART page fault",
+	[ 8] = "Security violation",
+	[ 9] = "EMEM arbitration error",
+	[10] = "Page fault",
+	[11] = "Invalid APB ASID update",
+	[12] = "VPR violation",
+	[13] = "Secure carveout violation",
+	[16] = "MTS carveout violation",
+};
 
-	return IRQ_HANDLED;
-}
+const char *const tegra_mc_error_names[8] = {
+	[2] = "EMEM decode error",
+	[3] = "TrustZone violation",
+	[4] = "Carveout violation",
+	[6] = "SMMU translation error",
+};
 
 /*
  * Memory Controller (MC) has few Memory Clients that are issuing memory
@@ -786,7 +714,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct tegra_mc *mc;
-	void *isr;
 	u64 mask;
 	int err;
 
@@ -823,15 +750,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			return err;
 	}
 
-#ifdef CONFIG_ARCH_TEGRA_2x_SOC
-	if (mc->soc == &tegra20_mc_soc) {
-		isr = tegra20_mc_irq;
-	} else
-#endif
-	{
-		isr = tegra_mc_irq;
-	}
-
 	mc->irq = platform_get_irq(pdev, 0);
 	if (mc->irq < 0)
 		return mc->irq;
@@ -840,7 +758,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 
 	mc_writel(mc, mc->soc->intmask, MC_INTMASK);
 
-	err = devm_request_irq(&pdev->dev, mc->irq, isr, 0,
+	err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
 			       dev_name(&pdev->dev), mc);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 731896169cf3..83c605e42e9a 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -138,6 +138,9 @@ int tegra30_mc_probe(struct tegra_mc *mc);
 extern const struct tegra_mc_ops tegra30_mc_ops;
 #endif
 
+extern const char * const tegra_mc_status_names[32];
+extern const char * const tegra_mc_error_names[8];
+
 /*
  * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
  * chosen such that they don't conflict with the device-tree ICC node IDs.
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 2c86c0d70d59..fcd7738fcb53 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -713,10 +713,84 @@ static int tegra20_mc_resume(struct tegra_mc *mc)
 	return 0;
 }
 
+static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
+{
+	struct tegra_mc *mc = data;
+	unsigned long status;
+	unsigned int bit;
+
+	/* mask all interrupts to avoid flooding */
+	status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
+	if (!status)
+		return IRQ_NONE;
+
+	for_each_set_bit(bit, &status, 32) {
+		const char *error = tegra_mc_status_names[bit];
+		const char *direction = "read", *secure = "";
+		const char *client, *desc;
+		phys_addr_t addr;
+		u32 value, reg;
+		u8 id, type;
+
+		switch (BIT(bit)) {
+		case MC_INT_DECERR_EMEM:
+			reg = MC_DECERR_EMEM_OTHERS_STATUS;
+			value = mc_readl(mc, reg);
+
+			id = value & mc->soc->client_id_mask;
+			desc = tegra_mc_error_names[2];
+
+			if (value & BIT(31))
+				direction = "write";
+			break;
+
+		case MC_INT_INVALID_GART_PAGE:
+			reg = MC_GART_ERROR_REQ;
+			value = mc_readl(mc, reg);
+
+			id = (value >> 1) & mc->soc->client_id_mask;
+			desc = tegra_mc_error_names[2];
+
+			if (value & BIT(0))
+				direction = "write";
+			break;
+
+		case MC_INT_SECURITY_VIOLATION:
+			reg = MC_SECURITY_VIOLATION_STATUS;
+			value = mc_readl(mc, reg);
+
+			id = value & mc->soc->client_id_mask;
+			type = (value & BIT(30)) ? 4 : 3;
+			desc = tegra_mc_error_names[type];
+			secure = "secure ";
+
+			if (value & BIT(31))
+				direction = "write";
+			break;
+
+		default:
+			continue;
+		}
+
+		client = mc->soc->clients[id].name;
+		addr = mc_readl(mc, reg + sizeof(u32));
+
+		dev_err_ratelimited(mc->dev, "%s: %s%s @%pa: %s (%s)\n",
+				    client, secure, direction, &addr, error,
+				    desc);
+	}
+
+	/* clear interrupts */
+	mc_writel(mc, status, MC_INTSTATUS);
+
+	return IRQ_HANDLED;
+}
+
 static const struct tegra_mc_ops tegra20_mc_ops = {
 	.probe = tegra20_mc_probe,
 	.suspend = tegra20_mc_suspend,
 	.resume = tegra20_mc_resume,
+	.handle_irq = tegra20_mc_handle_irq,
 };
 
 const struct tegra_mc_soc tegra20_mc_soc = {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 00d16c356db8..87668ebab2a1 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interconnect-provider.h>
+#include <linux/irq.h>
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 
@@ -177,6 +178,7 @@ struct tegra_mc_ops {
 	int (*probe)(struct tegra_mc *mc);
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
+	irqreturn_t (*handle_irq)(int irq, void *data);
 };
 
 struct tegra_mc_soc {
-- 
2.31.1

