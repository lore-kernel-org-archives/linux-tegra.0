Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9010C432BE
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93C4A60F51
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhHBWOD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 18:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbhHBWOC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 18:14:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4D0C061764;
        Mon,  2 Aug 2021 15:13:51 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id h2so36435530lfu.4;
        Mon, 02 Aug 2021 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lPTrNcy7eW8V+f86VfUDIcZ6axj+L/oplvI8TCRgAIo=;
        b=czIUMxsi8u3Dm3NPLy5Pj6ZBxVzdvdRqIGc+SLZt++SLAENkAmvNV0BzJ8CcYHH2kj
         HKd4CG9T6yvJOky9NRLZE8k2kkrBYpnGWP9b/p+LNP/POYzWLAtw25Nyk4cbgfk2VaYe
         ewfZrTeV1jZLtsqOc+ZWtt7wvgwR1xKduKwWGIDiuhC4qx4HHD4X3rvjIwtRUycCaQAC
         HpGEJtBWMIvNQCKHcv2nohyfvW6UUkcxfR7jd5+llfrh7+5vhCXs/9IdNDUPifoXb2fB
         Dtn8Cy0WqRps+vszM0KDEZaUaEwI6lO8RilC/bkJBxD8o1Ms/zxXaG3EIpk1m8g7DoRt
         NTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lPTrNcy7eW8V+f86VfUDIcZ6axj+L/oplvI8TCRgAIo=;
        b=AI46ylS875n+jlpacuijij+NEKEnPBBSY2cCUjJNApykLcOHe8RlFZCM6iUnUpFUGl
         tLaKRurqlXozhq6s7edRw0c/TqT/CZYLLvtx5v4fuDs/G0RqCG+6giSErfNjTPXZvORO
         kbvB/93qcjtq3DqGg4iSoQYeCyAP2O2wjwC2n6+/4YkapMnvI/TRUZ7YZUF87KQr23iY
         3tFke1NoZUmkjzzlVDtI3UhPxHFcTGxDKzL2v4gPkeKDZMkQkCJxbBl+o8Trp4EXmcbG
         hZpKusUDqrM3z56N17WZsIRXeq5ZKofoe1J/civgnsilBNkSm0SOIOR6Thr+OegMJ0t3
         e24w==
X-Gm-Message-State: AOAM53308ZN28ZpuOcuZsqnxtc4jJCu1+atnYThqSOIAlW35GM3JAUDN
        LKxu0nAE/hvbgRIPwCRuA7g=
X-Google-Smtp-Source: ABdhPJydTeB/gzPihZU5lX235HA1fYTVUmiOZkMvFvvJMfi6+czCAD7EzjxY3f7sq6WHIkPBj0Aieg==
X-Received: by 2002:a05:6512:2618:: with SMTP id bt24mr14176952lfb.180.1627942429908;
        Mon, 02 Aug 2021 15:13:49 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id c10sm960167ljn.11.2021.08.02.15.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:13:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] soc/tegra: fuse: Enable fuse clock on suspend for Tegra124
Date:   Tue,  3 Aug 2021 01:13:35 +0300
Message-Id: <20210802221336.32016-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802221336.32016-1-digetx@gmail.com>
References: <20210802221336.32016-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The FUSE clock should be enabled during suspend on Tegra124. Currently
clk driver enables it on all SoCs, but FUSE may require a higher core
voltage on Tegra30 while enabled. Move the quirk into the FUSE driver
and make it specific to Tegra124.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c   | 29 +++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra20.c |  1 +
 drivers/soc/tegra/fuse/fuse-tegra30.c |  7 +++++++
 drivers/soc/tegra/fuse/fuse.h         |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 747237865aff..f2151815db58 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -275,9 +275,38 @@ static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused tegra_fuse_suspend(struct device *dev)
+{
+	int ret;
+
+	/*
+	 * Critical for RAM re-repair operation, which must occur on resume
+	 * from LP1 system suspend and as part of CCPLEX cluster switching.
+	 */
+	if (fuse->soc->clk_suspend_on)
+		ret = pm_runtime_resume_and_get(dev);
+	else
+		ret = pm_runtime_force_suspend(dev);
+
+	return ret;
+}
+
+static int __maybe_unused tegra_fuse_resume(struct device *dev)
+{
+	int ret = 0;
+
+	if (fuse->soc->clk_suspend_on)
+		pm_runtime_put(dev);
+	else
+		ret = pm_runtime_force_resume(dev);
+
+	return ret;
+}
+
 static const struct dev_pm_ops tegra_fuse_pm = {
 	SET_RUNTIME_PM_OPS(tegra_fuse_runtime_suspend, tegra_fuse_runtime_resume,
 			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_fuse_suspend, tegra_fuse_resume)
 };
 
 static struct platform_driver tegra_fuse_driver = {
diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index cd6a273707fe..8ec9fc5e5e4b 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -167,4 +167,5 @@ const struct tegra_fuse_soc tegra20_fuse_soc = {
 	.probe = tegra20_fuse_probe,
 	.info = &tegra20_fuse_info,
 	.soc_attr_group = &tegra_soc_attr_group,
+	.clk_suspend_on = false,
 };
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index dd03565a39a4..b071d433d74f 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -112,6 +112,7 @@ const struct tegra_fuse_soc tegra30_fuse_soc = {
 	.speedo_init = tegra30_init_speedo_data,
 	.info = &tegra30_fuse_info,
 	.soc_attr_group = &tegra_soc_attr_group,
+	.clk_suspend_on = false,
 };
 #endif
 
@@ -127,6 +128,7 @@ const struct tegra_fuse_soc tegra114_fuse_soc = {
 	.speedo_init = tegra114_init_speedo_data,
 	.info = &tegra114_fuse_info,
 	.soc_attr_group = &tegra_soc_attr_group,
+	.clk_suspend_on = false,
 };
 #endif
 
@@ -208,6 +210,7 @@ const struct tegra_fuse_soc tegra124_fuse_soc = {
 	.lookups = tegra124_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra124_fuse_lookups),
 	.soc_attr_group = &tegra_soc_attr_group,
+	.clk_suspend_on = true,
 };
 #endif
 
@@ -294,6 +297,7 @@ const struct tegra_fuse_soc tegra210_fuse_soc = {
 	.lookups = tegra210_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra210_fuse_lookups),
 	.soc_attr_group = &tegra_soc_attr_group,
+	.clk_suspend_on = false,
 };
 #endif
 
@@ -324,6 +328,7 @@ const struct tegra_fuse_soc tegra186_fuse_soc = {
 	.lookups = tegra186_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra186_fuse_lookups),
 	.soc_attr_group = &tegra_soc_attr_group,
+	.clk_suspend_on = false,
 };
 #endif
 
@@ -354,6 +359,7 @@ const struct tegra_fuse_soc tegra194_fuse_soc = {
 	.lookups = tegra194_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra194_fuse_lookups),
 	.soc_attr_group = &tegra194_soc_attr_group,
+	.clk_suspend_on = false,
 };
 #endif
 
@@ -384,5 +390,6 @@ const struct tegra_fuse_soc tegra234_fuse_soc = {
 	.lookups = tegra234_fuse_lookups,
 	.num_lookups = ARRAY_SIZE(tegra234_fuse_lookups),
 	.soc_attr_group = &tegra194_soc_attr_group,
+	.clk_suspend_on = false,
 };
 #endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index e057a58e2060..de58feba0435 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -34,6 +34,8 @@ struct tegra_fuse_soc {
 	unsigned int num_lookups;
 
 	const struct attribute_group *soc_attr_group;
+
+	bool clk_suspend_on;
 };
 
 struct tegra_fuse {
-- 
2.32.0

