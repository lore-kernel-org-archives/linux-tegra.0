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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3673FC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 021DA61076
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbhDTR0N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTR0N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:13 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E372C06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:40 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id d21so25957502edv.9
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZ//zvH1oExXC6NdRY4vaLjjFNQjXYZUU6cfp2n03+o=;
        b=rHn9GWVDRBb1kZKubWm/JU/UY+T8xtm4x/5LVGd5faKtfkrZhEfEP4rvxe2MqMin9v
         v2w7U8+WXW8blyIQeGUcjVJgLkFi4NVhZi/Y1mimDfeMR0/ObbChTQVhCx+OMx3z31kU
         U4cgANwhPcMKff756I/V12R33kXgPpsslVPfNB/QpZzLsefVnO7kVySL8d8SubfbMIWM
         mj9S7u353nPlriS36GbyeXDcUNfxijiXf0o9L8ZqIENmzwzAAQLCOXobKtjfXS+FeYfB
         +ePfSYBnRExFZ3/sLE5MyKSN6RyD3aE82mHQnRBe+Ad1TWOKi+xQNw7Kcdfp7tX1sajL
         feLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZ//zvH1oExXC6NdRY4vaLjjFNQjXYZUU6cfp2n03+o=;
        b=LJNWBVJS5MqoWt1rbylFtNXv9E62ksTYNBTyndVbwKqYE7O1R+Mr/Khc23aME+vTyf
         1msfUruBbX7CXK2Sezf7RDAzs3l7cDKDKOCsIvJFgUge2TjKu4pO9mHEG7pIndesLEp+
         2tUx0YhK/gXuKbooV6UuwnMqv4xiO/eAVOa/ON8fRkRlCSH9gIkdb7CJbNA6k6PgGHR9
         UTQNMVm6YmJL9eCBjGvp3AUvEc3miNjfcXNyezfmBbSs5p7lNy4AJWN2+uhrJ9kRE92u
         wj2tdCKCo2eKlgrcBKATpP3ueIwAGPOezuWGN377aaAxD3hKImJ/NMutJV4LddLbZFhG
         Yt8g==
X-Gm-Message-State: AOAM5334oln1OY5r2g8+cVI582n8rOA0wz3nXzh0Vee5fVfykt4MYmnH
        rr7qMxL3IavTBJLN4dkpZtc=
X-Google-Smtp-Source: ABdhPJxYnkX2BWyNbe8kR/8FB4ZlUdVx7Ru01wQwcu9ekn3l/FpJ+2uW7CZeNSw3bKZ9nEoitl9XXw==
X-Received: by 2002:a05:6402:cb3:: with SMTP id cn19mr25892145edb.206.1618939538855;
        Tue, 20 Apr 2021 10:25:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c12sm13436079eja.12.2021.04.20.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:37 -0700 (PDT)
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
Subject: [PATCH v2 01/10] memory: tegra: Implement SID override programming
Date:   Tue, 20 Apr 2021 19:26:10 +0200
Message-Id: <20210420172619.3782831-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
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
index c854639cf30c..bace5ecfe770 100644
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
index 1387747d574b..bbad6330008b 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -176,6 +176,7 @@ struct tegra_mc_ops {
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
 	irqreturn_t (*handle_irq)(int irq, void *data);
+	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
 struct tegra_mc_soc {
@@ -240,4 +241,6 @@ devm_tegra_memory_controller_get(struct device *dev)
 }
 #endif
 
+int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev);
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.30.2

