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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0A1C43461
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 373C160FEA
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhDTQwm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhDTQwl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 12:52:41 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C3DC06138C
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:08 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y3so9635017eds.5
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbNREM9MVRvngBbGCYPgnKQCGnFytKAM5BhbBeZouuE=;
        b=PjVEpdhPAe3tsBQZyTjeZFssfhYRm0QDGJSE3yB4q4ems3So8BoLn+nLbFEIgkpa8R
         6kABPAx2alsIRecYr56j8fdw5E/m0PtBSg45NNLEWM6KS7jqc0LToOwAdSAh6XNSNNi+
         wEIcC52uMuNgOqNPmomV5OhbCPBuv3jurnPN99rXCB6X04G4JGoDbICV0TfU1+/WwicK
         RVKH9ToxLuZwyT1q8BilEGDjbZUjF5m8LV4m+wGoa3sO+sApgCleG+nn4Uo9hLouto/Q
         FmDo+oYN8N8swVMwD0nwXF9vLoA3Qr/ckcw+YVnfj7lOWJOZlNda3D5QH/lY+bppeNX7
         R92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbNREM9MVRvngBbGCYPgnKQCGnFytKAM5BhbBeZouuE=;
        b=KBvOlGU+JngBT/6xWdrsBrKhUAa4eN3u16nOAPCV3e9nhpS7Vm2IgJAWzTltfn7kmb
         ZzWyZNJKkJaPFq8wjYcS28h0CE67vl0EsqbUrwJgcqegwdGNsEqYTjWPShfFXj4djB9r
         QjQ2a0+dxTAeBQPOVQTfFz7yEFQKszNlTGNjL4yPnD0pWg6HQuiJlqLfF21wqY1z0249
         pt8jdqRaNnzP0DOatB4Dr1Q4o2/3TBfocx4jqhsQIRHHgRwsjV8arf9glPGG9hOQ5CqM
         0QdbGJB/+0Y2dC9IoijJ/DxugmSKJLxvynS49EYliFDTkOWK7iqMFDjT89hlV0tqZ8Na
         4S7g==
X-Gm-Message-State: AOAM530Xa9tfHbRqIG9userge+S1Qa6yC4bAYbSI/HVhazt2ZE50LeDt
        EO8tBF4TFXOB8grmWUd0GCI=
X-Google-Smtp-Source: ABdhPJxjNp6QYS0dZX/GCb5ZdTdF+vUy+D94Gtt9a8OBJDjp2jRDbIFviZQckm+5lMoqGD+6DSxuOA==
X-Received: by 2002:aa7:dd4d:: with SMTP id o13mr34306002edw.53.1618937527482;
        Tue, 20 Apr 2021 09:52:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bm13sm13437537ejb.75.2021.04.20.09.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:52:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/10] memory: tegra: Parameterize interrupt handler
Date:   Tue, 20 Apr 2021 18:52:34 +0200
Message-Id: <20210420165237.3523732-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420165237.3523732-1-thierry.reding@gmail.com>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra20 requires a slightly different interrupt handler than Tegra30 and
later, so parameterize the handler, so that each SoC implementation can
provide its own.

While at it, also make IRQ support optional, which will help unify the
Tegra186 memory controller driver with this one.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/mc.c      | 154 ++++++++-------------------------
 drivers/memory/tegra/mc.h      |   4 +
 drivers/memory/tegra/tegra20.c |  74 ++++++++++++++++
 include/soc/tegra/mc.h         |   2 +
 4 files changed, 117 insertions(+), 117 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 36eac0a0df3c..515ffd948a37 100644
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
+irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 {
 	struct tegra_mc *mc = data;
 	unsigned long status;
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
+const char *const status_names[32] = {
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
+const char *const error_names[8] = {
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
 
@@ -823,29 +750,22 @@ static int tegra_mc_probe(struct platform_device *pdev)
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
-	mc->irq = platform_get_irq(pdev, 0);
-	if (mc->irq < 0)
-		return mc->irq;
+	if (mc->soc->ops && mc->soc->ops->handle_irq) {
+		mc->irq = platform_get_irq(pdev, 0);
+		if (mc->irq < 0)
+			return mc->irq;
 
-	WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
+		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
-	mc_writel(mc, mc->soc->intmask, MC_INTMASK);
+		mc_writel(mc, mc->soc->intmask, MC_INTMASK);
 
-	err = devm_request_irq(&pdev->dev, mc->irq, isr, 0,
-			       dev_name(&pdev->dev), mc);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
-			err);
-		return err;
+		err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
+				       dev_name(&pdev->dev), mc);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
+				err);
+			return err;
+		}
 	}
 
 	err = tegra_mc_reset_setup(mc);
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 731896169cf3..5459018541e1 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -135,9 +135,13 @@ extern const struct tegra_mc_soc tegra210_mc_soc;
     defined(CONFIG_ARCH_TEGRA_132_SOC) || \
     defined(CONFIG_ARCH_TEGRA_210_SOC)
 int tegra30_mc_probe(struct tegra_mc *mc);
+irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
 extern const struct tegra_mc_ops tegra30_mc_ops;
 #endif
 
+extern const char * const status_names[32];
+extern const char * const error_names[8];
+
 /*
  * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
  * chosen such that they don't conflict with the device-tree ICC node IDs.
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 2c86c0d70d59..300f99dd0077 100644
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
+		const char *direction = "read", *secure = "";
+		const char *error = status_names[bit];
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
+			desc = error_names[2];
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
+			desc = error_names[2];
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
+			desc = error_names[type];
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
index fd19df3eb529..ce3cdcc7b596 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interconnect-provider.h>
+#include <linux/irq.h>
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 
@@ -173,6 +174,7 @@ struct tegra_mc_ops {
 	int (*probe)(struct tegra_mc *mc);
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
+	irqreturn_t (*handle_irq)(int irq, void *data);
 };
 
 struct tegra_mc_soc {
-- 
2.30.2

