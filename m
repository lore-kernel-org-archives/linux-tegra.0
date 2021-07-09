Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC646C07E9E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9A06613D6
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhGITcT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhGITcS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:18 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90A5C0613E5
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:32 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id k16-20020a05600c1c90b02901f4ed0fcfe7so6950290wms.5
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fqNBjbH3rPHiYRwYwGOI/SzSmc1V4SyfxtAqmW62gNs=;
        b=gt8znewZZK6XKs/w5uBhJkXn5qEczq7wmCaJqFvE//zZfq7/PpR2j7JBETWRtGshtv
         zzXKZGutLrTgCDwiTYcMyimNt4UF1bg/yVMLb8g5nLC+B5OGek3TqCCKjagugR9dZny3
         RP/0G6Ns3ExkBDWMamvWkg8cFjASRM/U7J7H20A0lXXH6Ms2fwgpqNzOO7Q2ribongXx
         exs3BwZwJcH0c9YQ9+E3WQri3INd+P6ruLDeHn8AI5+9U/Mzchh89VB5G0AYfVEw+0QB
         ZIp9uIpWfx/8xr6ZDI1LwR5BrnsgDNQxU2OSK4DaJQnnIi2hk7FKrPLVre65OQyJrWuV
         ayXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fqNBjbH3rPHiYRwYwGOI/SzSmc1V4SyfxtAqmW62gNs=;
        b=OoLI9Ddu/Na9/aonefarfwQtiM9PMpXONyK/hvfFhdIOkySxmt9pvKiWyS1Saf806u
         HrTCQjt4cc4NxCeAXH34x7WI2elApbYvz6FBPwfQXfp8BF7vVYBWjhVB5TZcO4S2f0HF
         92WrbRnbNjd22bOHz+wNxlwH5sB55w9CTnr3DrBrmDftXNscU40gl9OWNUncjeUzHYjd
         7o3wQp9gQQD6XSNpqNK7Xcgxg4+LL5MKZLOPsF3ICbl+kCP9ApXH+dCiZYo39fHk11Cg
         kxQpcy8BB38c4/aMl9qEW/H6GrzjrUC6oUHU7U9KoAx4Lt9bf040lZUXxjDU/H51DHKr
         U+xA==
X-Gm-Message-State: AOAM531txV8AtXLY7FIr28NKCCpauLrS8fr2371rpH4USokCef7oIxtF
        4uMw/91MOM+Zl2ZFfiT2zAE=
X-Google-Smtp-Source: ABdhPJyyto22V4g+Vao8QFiXSt0LgkQ5bjzQPG4kbHF8Dw0WdX6zsdVNkGxmNxqReH81ilWmbfA1Tw==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr548591wmj.128.1625858971280;
        Fri, 09 Jul 2021 12:29:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f9sm6079953wrm.48.2021.07.09.12.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 07/14] drm/tegra: Boot VIC during runtime PM resume
Date:   Fri,  9 Jul 2021 21:31:39 +0200
Message-Id: <20210709193146.2859516-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

With the new UAPI implementation, engines are powered on and off
when there are active jobs, and the core code handles channel
allocation. To accommodate that, boot the engine as part of
runtime PM instead of using the open_channel callback, which is
not used by the new submit path.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 112 ++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c9d55a9a3180..c02010ff2b7f 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -29,7 +29,6 @@ struct vic_config {
 
 struct vic {
 	struct falcon falcon;
-	bool booted;
 
 	void __iomem *regs;
 	struct tegra_drm_client client;
@@ -52,48 +51,6 @@ static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
 	writel(value, vic->regs + offset);
 }
 
-static int vic_runtime_resume(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = clk_prepare_enable(vic->clk);
-	if (err < 0)
-		return err;
-
-	usleep_range(10, 20);
-
-	err = reset_control_deassert(vic->rst);
-	if (err < 0)
-		goto disable;
-
-	usleep_range(10, 20);
-
-	return 0;
-
-disable:
-	clk_disable_unprepare(vic->clk);
-	return err;
-}
-
-static int vic_runtime_suspend(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = reset_control_assert(vic->rst);
-	if (err < 0)
-		return err;
-
-	usleep_range(2000, 4000);
-
-	clk_disable_unprepare(vic->clk);
-
-	vic->booted = false;
-
-	return 0;
-}
-
 static int vic_boot(struct vic *vic)
 {
 #ifdef CONFIG_IOMMU_API
@@ -103,9 +60,6 @@ static int vic_boot(struct vic *vic)
 	void *hdr;
 	int err = 0;
 
-	if (vic->booted)
-		return 0;
-
 #ifdef CONFIG_IOMMU_API
 	if (vic->config->supports_sid && spec) {
 		u32 value;
@@ -168,8 +122,6 @@ static int vic_boot(struct vic *vic)
 		return err;
 	}
 
-	vic->booted = true;
-
 	return 0;
 }
 
@@ -323,35 +275,74 @@ static int vic_load_firmware(struct vic *vic)
 	return err;
 }
 
-static int vic_open_channel(struct tegra_drm_client *client,
-			    struct tegra_drm_context *context)
+
+static int vic_runtime_resume(struct device *dev)
 {
-	struct vic *vic = to_vic(client);
+	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
-	err = pm_runtime_resume_and_get(vic->dev);
+	err = clk_prepare_enable(vic->clk);
 	if (err < 0)
 		return err;
 
+	usleep_range(10, 20);
+
+	err = reset_control_deassert(vic->rst);
+	if (err < 0)
+		goto disable;
+
+	usleep_range(10, 20);
+
 	err = vic_load_firmware(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
 
 	err = vic_boot(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
+
+	return 0;
+
+assert:
+	reset_control_assert(vic->rst);
+disable:
+	clk_disable_unprepare(vic->clk);
+	return err;
+}
+
+static int vic_runtime_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_assert(vic->rst);
+	if (err < 0)
+		return err;
+
+	usleep_range(2000, 4000);
+
+	clk_disable_unprepare(vic->clk);
+
+	return 0;
+}
+
+static int vic_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	err = pm_runtime_resume_and_get(vic->dev);
+	if (err < 0)
+		return err;
 
 	context->channel = host1x_channel_get(vic->channel);
 	if (!context->channel) {
-		err = -ENOMEM;
-		goto rpm_put;
+		pm_runtime_put(vic->dev);
+		return -ENOMEM;
 	}
 
 	return 0;
-
-rpm_put:
-	pm_runtime_put(vic->dev);
-	return err;
 }
 
 static void vic_close_channel(struct tegra_drm_context *context)
@@ -359,7 +350,6 @@ static void vic_close_channel(struct tegra_drm_context *context)
 	struct vic *vic = to_vic(context->client);
 
 	host1x_channel_put(context->channel);
-
 	pm_runtime_put(vic->dev);
 }
 
-- 
2.32.0

