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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5343C47082
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B92A6613B1
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFCQsA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:48:00 -0400
Received: from mail-ej1-f45.google.com ([209.85.218.45]:34722 "EHLO
        mail-ej1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhFCQsA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:48:00 -0400
Received: by mail-ej1-f45.google.com with SMTP id g8so10262106ejx.1
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xzw2TUXY9p93oZxbwZKb0YQTzrG6r+scUnZo7x9ZCuU=;
        b=BLkLvFdApNPPc1q9dm6SyDGGREAVsuQgmtHybL+4Ju9BI2Ouw4EuFvuzh5TFfljaou
         rSdJmPTj7DJQs6BwlK35x8RuCodKVxouDgYyVI9FYSHyorPWgQAgDQ5F7HW4EzrXLvu+
         Ly6zoAVjCiGWNEMseWyo5jTpij6fj2skQMnRL69EqYkc/X/JLUeJkRkI7el1HsVFoMjd
         cs4MLhUVZrLxR1+BVMQvpMxPU8EZ4DP0ilgpqyQbZohdATLha6u0uQAOzKhnu4JSSKXv
         1mX+ILdrIkOayYuTPRONvrYaX/zjOaMqqkTo38mjcT3xFuhqtN5YshKcq0viUUS8CG4D
         bOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xzw2TUXY9p93oZxbwZKb0YQTzrG6r+scUnZo7x9ZCuU=;
        b=KVZbctvdUDm9QLk1OYpXK9OBv+FlxbJx1JP+tF+rILdVB1R/6KGtMQzy8Q9clmMvF4
         7y0OvTjLqvhUwngSC9erHcElcJB8jvA4q/lR8+/S4+EbOLlTYP8yVwzHHrgdPt/+PV8K
         xydT6ZWe9UPc4iWCAg2FPE05fI8KQjhNMz4s6A2wckeSyzpT357TR1MJul+eFgFq40AZ
         GL6VJK2VvVvl2l2qbRe9jFkr/OxOeplx7GFCezy2MRPvjYwPnbjBLYI5J5aT3mrTr1KO
         GeuDno9qvNFJilwv/48C6XGDxpIYOmPABkMDa9dDraZuV3YrT3GMuh8XFi1g1EO361L3
         9Zag==
X-Gm-Message-State: AOAM533Pvau6sME5kvC9JEaztopAt5uvPF+YYZGPYcICxlDE5g7XZyO3
        CzDN+qnvGsi0usUKyuY7bBQ=
X-Google-Smtp-Source: ABdhPJxskXVbfgGBiwrxr5agPcu7F5QArOGLc64A8ytnD19xBd4ogTRNhjMOLdBL+Va4ArqBKjwpGw==
X-Received: by 2002:a17:906:5407:: with SMTP id q7mr302416ejo.158.1622738701180;
        Thu, 03 Jun 2021 09:45:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c19sm2079710edv.36.2021.06.03.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:00 -0700 (PDT)
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
Subject: [PATCH v3 1/9] memory: tegra: Implement SID override programming
Date:   Thu,  3 Jun 2021 18:46:24 +0200
Message-Id: <20210603164632.1000458-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of programming all SID overrides during early boot, perform the
operation on-demand after the SMMU translations have been set up for a
device. This reuses data from device tree to match memory clients for a
device and programs the SID specified in device tree, which corresponds
to the SID used for the SMMU context banks for the device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/mc.c       |  9 +++++
 drivers/memory/tegra/tegra186.c | 72 +++++++++++++++++++++++++++++++++
 include/soc/tegra/mc.h          |  3 ++
 3 files changed, 84 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 11b83de9361c..3c5aae7abf35 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -97,6 +97,15 @@ struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_tegra_memory_controller_get);
 
+int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev)
+{
+	if (mc->soc->ops && mc->soc->ops->probe_device)
+		return mc->soc->ops->probe_device(mc, dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_mc_probe_device);
+
 static int tegra_mc_block_dma_common(struct tegra_mc *mc,
 				     const struct tegra_mc_reset *rst)
 {
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 1f87915ccd62..e65eac5764d4 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of_device.h>
@@ -15,6 +16,10 @@
 #include <dt-bindings/memory/tegra186-mc.h>
 #endif
 
+#define MC_SID_STREAMID_OVERRIDE_MASK GENMASK(7, 0)
+#define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
+#define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
+
 static void tegra186_mc_program_sid(struct tegra_mc *mc)
 {
 	unsigned int i;
@@ -66,10 +71,77 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
 	return 0;
 }
 
+static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
+					    const struct tegra_mc_client *client,
+					    unsigned int sid)
+{
+	u32 value, old;
+
+	value = readl(mc->regs + client->regs.sid.security);
+	if ((value & MC_SID_STREAMID_SECURITY_OVERRIDE) == 0) {
+		/*
+		 * If the secure firmware has locked this down the override
+		 * for this memory client, there's nothing we can do here.
+		 */
+		if (value & MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED)
+			return;
+
+		/*
+		 * Otherwise, try to set the override itself. Typically the
+		 * secure firmware will never have set this configuration.
+		 * Instead, it will either have disabled write access to
+		 * this field, or it will already have set an explicit
+		 * override itself.
+		 */
+		WARN_ON((value & MC_SID_STREAMID_SECURITY_OVERRIDE) == 0);
+
+		value |= MC_SID_STREAMID_SECURITY_OVERRIDE;
+		writel(value, mc->regs + client->regs.sid.security);
+	}
+
+	value = readl(mc->regs + client->regs.sid.override);
+	old = value & MC_SID_STREAMID_OVERRIDE_MASK;
+
+	if (old != sid) {
+		dev_dbg(mc->dev, "overriding SID %x for %s with %x\n", old,
+			client->name, sid);
+		writel(sid, mc->regs + client->regs.sid.override);
+	}
+}
+
+static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
+{
+#if IS_ENABLED(CONFIG_IOMMU_API)
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct of_phandle_args args;
+	unsigned int i, index = 0;
+
+	while (!of_parse_phandle_with_args(dev->of_node, "interconnects", "#interconnect-cells",
+					   index, &args)) {
+		if (args.np == mc->dev->of_node && args.args_count != 0) {
+			for (i = 0; i < mc->soc->num_clients; i++) {
+				const struct tegra_mc_client *client = &mc->soc->clients[i];
+
+				if (client->id == args.args[0]) {
+					u32 sid = fwspec->ids[0] & MC_SID_STREAMID_OVERRIDE_MASK;
+
+					tegra186_mc_client_sid_override(mc, client, sid);
+				}
+			}
+		}
+
+		index++;
+	}
+#endif
+
+	return 0;
+}
+
 const struct tegra_mc_ops tegra186_mc_ops = {
 	.probe = tegra186_mc_probe,
 	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
+	.probe_device = tegra186_mc_probe_device,
 };
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1bd5aed81868..e19c2504a14b 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -180,6 +180,7 @@ struct tegra_mc_ops {
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
 	irqreturn_t (*handle_irq)(int irq, void *data);
+	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
 struct tegra_mc_soc {
@@ -244,4 +245,6 @@ devm_tegra_memory_controller_get(struct device *dev)
 }
 #endif
 
+int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev);
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.31.1

