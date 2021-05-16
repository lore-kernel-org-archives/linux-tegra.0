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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AEEC433B4
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 20:52:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FDAA6105A
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 20:52:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbhEPUx1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 16:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhEPUx0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 16:53:26 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820E6C06174A;
        Sun, 16 May 2021 13:52:10 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v5so4758416ljg.12;
        Sun, 16 May 2021 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zUnOs8AsZ2nPRQr3boQyf3olo3z3nSK6MyBY9MTRAJk=;
        b=BJXv5ixdsSqJFazCvx7veJt/oOKeCPVXm+9Vlcfz7fwZqRy739nZ3Zx+9sis4aCHFd
         NHsK1dadB9d+W8xdVAiHwoVAN/hGO4OY6iZfSTe5H1YK6wJp9JSeHh1UThVM6k50rOzC
         yOnKlWJOFSLy5PPUFYbM7LFQK/mzT7figsfw2hX6eEu/1WsBhcsmYmQ703+zjx/jnoWz
         fbTovMDhpqRwEHcQ4dYh/8G04GGNI/WNNio5KqkVImEItYRAvnhsXfmYMkcMe0bZpA36
         hBDJYf5qI0MTV80NDNI6FFIdBj4bqmCr6ksd/E6cx7bEuXLRAN20q26Gd2lF1wnjSC97
         Sc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zUnOs8AsZ2nPRQr3boQyf3olo3z3nSK6MyBY9MTRAJk=;
        b=fworIRFGvXJ3dVC/yryyyVkIOFDeuWVk9/VC/repVWYy2lLY6viGOAzNTwAdUBerU7
         CoujU2Rs1Mw6EXa4Nd78XjKaLalyPkW2qeUcbRtAwVl7JOuCQg6MpCYM9+ywGcNPFv1w
         G9rZk3Y2CXJe6h5WLa7yADCRrqAhbIm3XrIcg5e2DgCsILtTPoLFMbCOZH/9n+whCZR/
         7ASzgIwAOCc+IM3FAc9NjQUh6IDAtN/xJw/ixlWDSWflEirSy3TzDIrfiGuemPus7o0z
         OydOgb7CKshahN/GYtRSA9q9krgLqQ1vRtRIHj1X337XrKuMMdBqh7xLI5VtwDXz38lZ
         yKeA==
X-Gm-Message-State: AOAM532SnFLpZ3ekxz2MhSuqUzgxyxlMsz7pkJYhSbt57IEiiJmgV0/a
        j3Yib7RAbtuRvt3VwPcxXFY=
X-Google-Smtp-Source: ABdhPJyJxLzM78gqfg1umFfa0YnooE5+sVUFbaWNwMNsbvxWAXpr6b2okDnubPbP2/RJLZXUwz2waA==
X-Received: by 2002:a05:651c:2121:: with SMTP id a33mr38280094ljq.281.1621198328981;
        Sun, 16 May 2021 13:52:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id b125sm1429570lfd.196.2021.05.16.13.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 13:52:08 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] soc/tegra: Add devm_tegra_core_dev_init_opp_table()
Date:   Sun, 16 May 2021 23:51:38 +0300
Message-Id: <20210516205138.22501-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516205138.22501-1-digetx@gmail.com>
References: <20210516205138.22501-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add common helper which initializes OPP table for Tegra SoC core devices.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 112 +++++++++++++++++++++++++++++++++++++
 include/soc/tegra/common.h |  30 ++++++++++
 2 files changed, 142 insertions(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 3dc54f59cafe..c3fd2facfc2d 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -3,9 +3,16 @@
  * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#define dev_fmt(fmt)	"tegra-soc: " fmt
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/export.h>
 #include <linux/of.h>
+#include <linux/pm_opp.h>
 
 #include <soc/tegra/common.h>
+#include <soc/tegra/fuse.h>
 
 static const struct of_device_id tegra_machine_match[] = {
 	{ .compatible = "nvidia,tegra20", },
@@ -31,3 +38,108 @@ bool soc_is_tegra(void)
 
 	return match != NULL;
 }
+
+static int tegra_core_dev_init_opp_state(struct device *dev)
+{
+	struct dev_pm_opp *opp;
+	unsigned long rate;
+	struct clk *clk;
+	int err;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "failed to get clk: %pe\n", clk);
+		return PTR_ERR(clk);
+	}
+
+	rate = clk_get_rate(clk);
+	if (!rate) {
+		dev_err(dev, "failed to get clk rate\n");
+		return -EINVAL;
+	}
+
+	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
+
+	if (opp == ERR_PTR(-ERANGE))
+		opp = dev_pm_opp_find_freq_floor(dev, &rate);
+
+	err = PTR_ERR_OR_ZERO(opp);
+	if (err) {
+		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
+			rate, err);
+		return err;
+	}
+
+	dev_pm_opp_put(opp);
+
+	/* first dummy rate-setting initializes voltage vote */
+	err = dev_pm_opp_set_rate(dev, rate);
+	if (err) {
+		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * devm_tegra_core_dev_init_opp_table() - initialize OPP table
+ * @dev: device for which OPP table is initialized
+ * @params: pointer to the OPP table configuration
+ *
+ * This function will initialize OPP table and sync OPP state of a Tegra SoC
+ * core device.
+ *
+ * Return: 0 on success or errorno.
+ */
+int devm_tegra_core_dev_init_opp_table(struct device *dev,
+				       struct tegra_core_opp_params *params)
+{
+	u32 hw_version;
+	int err;
+
+	err = devm_pm_opp_set_clkname(dev, NULL);
+	if (err) {
+		dev_err(dev, "failed to set OPP clk: %d\n", err);
+		return err;
+	}
+
+	/* Tegra114+ doesn't support OPP yet */
+	if (!of_machine_is_compatible("nvidia,tegra20") &&
+	    !of_machine_is_compatible("nvidia,tegra30"))
+		return -ENODEV;
+
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		hw_version = BIT(tegra_sku_info.soc_process_id);
+	else
+		hw_version = BIT(tegra_sku_info.soc_speedo_id);
+
+	err = devm_pm_opp_set_supported_hw(dev, &hw_version, 1);
+	if (err) {
+		dev_err(dev, "failed to set OPP supported HW: %d\n", err);
+		return err;
+	}
+
+	/*
+	 * Older device-trees have an empty OPP table, we will get
+	 * -ENODEV from devm_pm_opp_of_add_table() in this case.
+	 */
+	err = devm_pm_opp_of_add_table(dev);
+	if (err) {
+		if (err == -ENODEV)
+			dev_err_once(dev, "OPP table not found, please update device-tree\n");
+		else
+			dev_err(dev, "failed to add OPP table: %d\n", err);
+
+		return err;
+	}
+
+	if (params->init_state) {
+		err = tegra_core_dev_init_opp_state(dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_tegra_core_dev_init_opp_table);
diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index 98027a76ce3d..e8eab13aa199 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -6,6 +6,36 @@
 #ifndef __SOC_TEGRA_COMMON_H__
 #define __SOC_TEGRA_COMMON_H__
 
+#include <linux/errno.h>
+#include <linux/types.h>
+
+struct device;
+
+/**
+ * Tegra SoC core device OPP table configuration
+ *
+ * @init_state: pre-initialize OPP state of a device
+ */
+struct tegra_core_opp_params {
+	bool init_state;
+};
+
+#ifdef CONFIG_ARCH_TEGRA
 bool soc_is_tegra(void);
+int devm_tegra_core_dev_init_opp_table(struct device *dev,
+				       struct tegra_core_opp_params *params);
+#else
+static inline bool soc_is_tegra(void)
+{
+	return false;
+}
+
+static inline int
+devm_tegra_core_dev_init_opp_table(struct device *dev,
+				   struct tegra_core_opp_params *params)
+{
+	return -ENODEV;
+}
+#endif
 
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.30.2

