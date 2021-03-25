Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F04C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A805E61A17
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhCYNDw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbhCYNDc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:03:32 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CACC06175F
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:31 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k8so2218900wrc.3
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bM4o41o0uKiCCdNc1xklJaXj4qpc+jHNYM7w+kQ4+qg=;
        b=U4V0FXpRhge+rQbpMnsw738aWFzOHoH9nKRQ4RFXGn0nboWX18kWT6XdIPwWm1vL6q
         atFtWWgo1paCfmqEG0tnLm0g4piD2/1VUCz+GW7iovm7yRT7Q11Sc2V+K1OqXSzFUojn
         vRh3CKFcVmUPtowChih/rZQvQnTFW/CLGtk4NISdm4rQMbi5t3wSdyjZaHne2bbFzJDX
         P5InDuLpPvf39kC28YMzmLianBflz3MRCbgb4Vi3lOEf0GvLXlpmj+8ALL2i4Igm7Pgq
         Jj+p7FirkxXuleA9m/OCJflpckBYjrdLw48EPsH0dcnlbPJKEbPPPobnFYhDDOGZHlbS
         AeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bM4o41o0uKiCCdNc1xklJaXj4qpc+jHNYM7w+kQ4+qg=;
        b=StR4usQDKuR0n9PyprXDZaDheinlzCtmCQ/6yAqal7usjuqG1xTo1oiYo/qUl2z4i1
         tgZ0Ydq7vFQwSWfcQRCCOjTgH33Zt5mKVlgOWv1+aZZAZzG2pLUgs/OaWFWerJcXnOTx
         TvqWmwFtXSXz59ObinP1jm6JCCFDAR5VUSkOO4kX0kLdUkPdMlmjRMHUynIXYYVxhSng
         fny1DrBRKljckHuQjEJy6ahPjtfS2GsjkTkoGwy/1gjlLVECdUE9PGSS52kTxk+49COg
         mGaGpV9RqFK/pXx4mBveg+CtEGDzU+n8qN90d+CZELD91qfURAT4471RZWf+/uela82L
         7nGw==
X-Gm-Message-State: AOAM530AWk3ZkOxxFwFxXJG/LPU4YvdSR4yX58fWJRE9ucRi0JQgTOA6
        wto/2/AjP7EHTtJntnjKg9A=
X-Google-Smtp-Source: ABdhPJx67P1LH5jgle7JqCerP8+RaNQGzDrk4nvFL4I+tYklmaeH1WswkVYp3xtEYZECCBUpdUTJUw==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr8907889wrn.17.1616677410043;
        Thu, 25 Mar 2021 06:03:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h25sm6904366wml.32.2021.03.25.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:03:28 -0700 (PDT)
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
Subject: [PATCH 3/9] memory: tegra: Implement SID override programming
Date:   Thu, 25 Mar 2021 14:03:26 +0100
Message-Id: <20210325130332.778208-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
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
 drivers/memory/tegra/tegra186.c | 70 +++++++++++++++++++++++++++++++++
 include/soc/tegra/mc.h          | 10 +++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index efa922d51d83..a89e8e40d875 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of_device.h>
@@ -19,6 +20,10 @@
 #include <dt-bindings/memory/tegra194-mc.h>
 #endif
 
+#define MC_SID_STREAMID_OVERRIDE_MASK GENMASK(7, 0)
+#define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
+#define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
+
 struct tegra186_mc_client {
 	const char *name;
 	unsigned int id;
@@ -1808,6 +1813,71 @@ static struct platform_driver tegra186_mc_driver = {
 };
 module_platform_driver(tegra186_mc_driver);
 
+static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
+					    const struct tegra186_mc_client *client,
+					    unsigned int sid)
+{
+	u32 value, old;
+
+	value = readl(mc->regs + client->regs.security);
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
+		writel(value, mc->regs + client->regs.security);
+	}
+
+	value = readl(mc->regs + client->regs.override);
+	old = value & MC_SID_STREAMID_OVERRIDE_MASK;
+
+	if (old != sid) {
+		dev_dbg(mc->dev, "overriding SID %x for %s with %x\n", old,
+			client->name, sid);
+		writel(sid, mc->regs + client->regs.override);
+	}
+}
+
+int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct of_phandle_args args;
+	unsigned int i, index = 0;
+
+	while (!of_parse_phandle_with_args(dev->of_node, "interconnects", "#interconnect-cells",
+					   index, &args)) {
+		if (args.np == mc->dev->of_node && args.args_count != 0) {
+			for (i = 0; i < mc->soc->num_clients; i++) {
+				const struct tegra186_mc_client *client = &mc->soc->clients[i];
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
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra186_mc_probe_device);
+
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra186 Memory Controller driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 7be8441c6e9e..73d5ecf0e76a 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -168,4 +168,14 @@ devm_tegra_memory_controller_get(struct device *dev)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);
+#else
+static inline int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
+{
+	return 0;
+}
+#endif
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.30.2

