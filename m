Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E113C47092
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EA05613BD
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234643AbhFASAN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFASAN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:13 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C90C06174A
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:30 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gb17so23054550ejc.8
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rXKSoIE3w80E2TCiGFgj4A7CPg5o8NjEWHDxCGB0AbU=;
        b=C7fDqwBhb+pe3Lxll0U9SkVtJPFB8K6PeuFAjcCYIgOMHew/YvFgub4SzOkQd3rYgv
         Q0t6kse6O9u4i98b7M57fSAmSfFEakc+Tp3nVoq2x2+H1K17mSRcwf4hOaQ0RCa1aaMg
         Adxr+KLy7Tv48fEY6gJzuAYpTKCgz3Ic75xTL/fRuPvMIqQ0miYQVQB727W0fux0dr3w
         lMqN2ygC4vN3NTVSpNoeT2ZBwtrs6K/7nRxkWB+dt2WeYEi7GqJ1EopRGB26N3SWnW5K
         TvbAXKNYvvG/nhbbF6OIZdxUUP20wLuuyFXyMF4VbVawosyi2mansnOJB6OZRfDzjQaa
         ktyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rXKSoIE3w80E2TCiGFgj4A7CPg5o8NjEWHDxCGB0AbU=;
        b=la9yOuzMVA3+2xa+jBHbG/NUyAYBAbT/HJkOmRiE8xJO/Ov7IkAlTN0zJuL4a8GwH+
         BgawBerViKfN0BidGyhVoVWqxiD2Sx1hb11+GMDoQhQxMBTPjx3Xy0/615M6yacb/PKJ
         eyYunRiEbQt0bODHpfm2DzzlTm/Jkit25G2z9w/g9QGTkN3dWs5bhVcTGIB1M1J8D+LZ
         YUMogrLXO7AvfKLWkmXfUTjmXgToj6TQpHougE5u0R5YzuQPcETs4oBN7sGfvwO4R/6/
         1I8xh3oXQdymCUKnSf1UFDPkd48Paq0fnUIMUmtpkQDMkRQbMIEAvj8xBXln33EuAUNY
         B2mw==
X-Gm-Message-State: AOAM531mT52d6kDwyQ5pMkuPuJG/Js++So4Njd6U5HPFz8d8Mxy6hXui
        hSerZGr178XsDwCykDmsnbM=
X-Google-Smtp-Source: ABdhPJyxBO+RCnGSlbA+or5V5Y3xY/GEzH26JfwsjKJe9riNdMOLiXmfOrIPBFOwDX3Bsa5sibcDmg==
X-Received: by 2002:a17:906:148f:: with SMTP id x15mr29695362ejc.535.1622570309000;
        Tue, 01 Jun 2021 10:58:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id wq10sm238768ejb.79.2021.06.01.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/12] memory: tegra: Parameterize interrupt handler
Date:   Tue,  1 Jun 2021 19:59:37 +0200
Message-Id: <20210601175942.1920588-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
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
Changes in v2:
- use tegra_mc_ prefix for status and error names arrays
- keep IRQ handling mandatory in this patch
- fix build on Tegra20

 drivers/memory/tegra/mc.c      | 136 +++++++--------------------------
 drivers/memory/tegra/mc.h      |   4 +
 drivers/memory/tegra/tegra20.c |  74 ++++++++++++++++++
 include/soc/tegra/mc.h         |   2 +
 4 files changed, 107 insertions(+), 109 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index edb3c4a25365..6725df851079 100644
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
index 731896169cf3..cff8479e9d90 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -135,9 +135,13 @@ extern const struct tegra_mc_soc tegra210_mc_soc;
     defined(CONFIG_ARCH_TEGRA_132_SOC) || \
     defined(CONFIG_ARCH_TEGRA_210_SOC)
 int tegra30_mc_probe(struct tegra_mc *mc);
+irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
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

