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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5930AC433E0
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 20:44:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32D7564E51
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 20:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233806AbhCNUns (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 16:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbhCNUnh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 16:43:37 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D73C061574
        for <linux-tegra@vger.kernel.org>; Sun, 14 Mar 2021 13:43:36 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id e7so53785532lft.2
        for <linux-tegra@vger.kernel.org>; Sun, 14 Mar 2021 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ctqx999c7Wo5eqbQNlgMEem8uToy6UzHW11+ccWT80=;
        b=VvC6GNfOBC9bnBMl2B3lSvLlOiuSbJpYGZg6/fBddK7wARVtmWmWe1SJCILyfnXZws
         o9qcthjGNl0CmThCBHAx2dPNij6+DZ9vH2CaoL/UJQKhOKSSYYTuSZ1sOxtVOrKNzMkh
         SXPccpZGUwvZdnO1ylv1+j8MIQOTks3U1ToGLHRUZ+WcHBVccv/m3fdqatc8Ev3ZD0+j
         mXDut2QCdVo/7fqVAWh0Pmd7unMkMV39NODEjFPyc0Wq7M7flexh+Zan5MBF8zBHGFqy
         6Tox/J94LbEeyG0vd8DujbVHfTyEL33Y3ydQ41UIOmS7jDV3DFvMFL7e33IkXGdOnY9H
         0IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ctqx999c7Wo5eqbQNlgMEem8uToy6UzHW11+ccWT80=;
        b=V7kjRRPW4LBg6DK0LFTbWSJKfTF253uWtF2hpRuMLGGgRZWS6/AvvRztAfPrO1tgFf
         y2BesgBokO8pCZMZpg4FKdzXxJqGbdDTTHcpk+/F9FlvWXDk2U+Q5gzc3u5RK80+piPg
         /t/HPKUWi9Magl16GFtUlFPX49spXMRvieXuKuDJh2OA3WGZrZoOspg+BkDiH1qyyHiW
         LffTZxZdXXA8PRv8UP4OXu+imIQ72Hdm9zztkdC4dL2nO11wxNw1KgUyN3hdgodeiw5H
         +F42GzXn9ZJ6WR8rF/V02CG6qz484sOvIAO2TTC2Xo27VxYiiKuoSQbVihmKxZXbo/JL
         LZIQ==
X-Gm-Message-State: AOAM532Xf3DdTxIZuoFcEWXHpCnzEdEFovNxF2w1fyLNHDvA3507a6s0
        5BURROnViWDTYcxzZhE2IcaZW0b9hMs=
X-Google-Smtp-Source: ABdhPJwG3bsT9cAuukhN80RhHx5Cixj+uv/rapZtn+2AynFR5Xx6aA17GDDgyTzWSKprQ0E5DyEchg==
X-Received: by 2002:a19:f001:: with SMTP id p1mr6229440lfc.447.1615754614533;
        Sun, 14 Mar 2021 13:43:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id c19sm2622319ljk.60.2021.03.14.13.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 13:43:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: Use dev_err_probe()
Date:   Sun, 14 Mar 2021 23:43:11 +0300
Message-Id: <20210314204311.10572-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use generic dev_err_probe() helper which silences noisy error messages
about deferred probe of the Tegra DRM drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 13 +++----------
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++-------------------------
 2 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0ae3a025efe9..ff7968200d4e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2589,16 +2589,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return -ENXIO;
 
 	err = tegra_dc_rgb_probe(dc);
-	if (err < 0 && err != -ENODEV) {
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, dc->dev, "failed to probe RGB output: %d\n",
-			   err);
-		return err;
-	}
+	if (err < 0 && err != -ENODEV)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to probe RGB output\n");
 
 	platform_set_drvdata(pdev, dc);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..f5abb73d20ad 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1635,7 +1635,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
-	const char *level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1675,36 +1674,21 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
 	err = PTR_ERR_OR_ZERO(hdmi->hdmi);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get HDMI regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get HDMI regulator\n");
 
 	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
 	err = PTR_ERR_OR_ZERO(hdmi->pll);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get PLL regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get PLL regulator\n");
 
 	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
 	err = PTR_ERR_OR_ZERO(hdmi->vdd);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get VDD regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get VDD regulator\n");
 
 	hdmi->output.dev = &pdev->dev;
 
-- 
2.30.2

