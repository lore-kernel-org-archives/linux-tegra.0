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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46D4C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E1BB61A26
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhCZOwD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhCZOvb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:31 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405C7C0613B1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:31 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g20so3124792wmk.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mYZHwCwRW4nMunvHncCTe6a/rr8wamJxRARNjK2ntJo=;
        b=eyC59KwUVdj4wh2qXTUJoBU3hvwj73JNBUYOV5f2GE2l+3SN23gCe08mELuBhiLJE4
         GqA9uoVijwFH+qNNoRxiPskJLyzAo1AWVatJSYz3HFw1P1itlX1KqK6Mvr2bLZmmvwLa
         SfBrKW8/I+yNF5AJWvA+XiMvv99XG6PKOhGcKwCzaFf6nzgMo3/dXPOPCgpo6aKrNxmn
         61it3+EqyzN026gBOG1ad5cLyujK120R0ogms9o/4yN4nSwANOffc3vF8207ztuqExD+
         LW/iGlNdHdzADGgbDDEzIsAvlEr4X9Owu0z91Q6tRk0I7utQt2aeJEb0MOvAZAnH6l5f
         A7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mYZHwCwRW4nMunvHncCTe6a/rr8wamJxRARNjK2ntJo=;
        b=k6F9D05aLxU0+bO5UzB8ZNOkEYzWgYY4w8zjIk5h5KN3p51LPlR8GqJR+blqb+1c4R
         MfEPwngboB2sUoUos9hGVkM+CU11XBTGtAFkE8CgP2JSxnwQqnC69prIyNVNvlfC3xE+
         gPBg/F6+OjoU8kxYtZ35rcNauTsbqI/l62HQsT5EPsESQ2zAKmyghpLv8L056MGVww6Z
         u3pRCl0Aig++NpMijJdquO3T0IR3z/1FEWCs3tAJQC8Q4yT8OdgBm7y7RoRSHuZRgveN
         0qjhoTiZY6ZV+j5QRrPHYno9OV9WR4e6xlCTxGbyAeYdNcbp+bKpN/aOU/rRUKKc+Jh7
         oREQ==
X-Gm-Message-State: AOAM532G4+Zwuvmag302HdoafR/ZhiaFO8Wc0RHEv+tkGsYv+BoGXURM
        DJe3CMH6H01vxVYNPe3fEAo=
X-Google-Smtp-Source: ABdhPJylGou6xdZQHDcpDelq2ymSU1tXgTq3g9SINF4tCi4n383YKtC9pWSPljq9f+EY+naLSxSDLg==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr13752722wmg.171.1616770290034;
        Fri, 26 Mar 2021 07:51:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l8sm13147469wrx.83.2021.03.26.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 03/10] drm/tegra: dc: Inherit DMA mask
Date:   Fri, 26 Mar 2021 15:51:32 +0100
Message-Id: <20210326145139.467072-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Inherit the DMA mask from host1x (on Tegra210 and earlier) or the
display hub (on Tegra186 and later). This is necessary in order to
properly map buffers without SMMU support and use the maximum IOVA
space available with SMMU support.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 7 +++++++
 drivers/gpu/drm/tegra/hub.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 40bf8f33a2ae..935717e7410d 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2538,9 +2538,16 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
+	u64 dma_mask = dma_get_mask(pdev->dev.parent);
 	struct tegra_dc *dc;
 	int err;
 
+	err = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
 	dc = devm_kzalloc(&pdev->dev, sizeof(*dc), GFP_KERNEL);
 	if (!dc)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8e6d329d062b..617240032c37 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -848,12 +848,19 @@ static const struct host1x_client_ops tegra_display_hub_ops = {
 
 static int tegra_display_hub_probe(struct platform_device *pdev)
 {
+	u64 dma_mask = dma_get_mask(pdev->dev.parent);
 	struct device_node *child = NULL;
 	struct tegra_display_hub *hub;
 	struct clk *clk;
 	unsigned int i;
 	int err;
 
+	err = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
 	hub = devm_kzalloc(&pdev->dev, sizeof(*hub), GFP_KERNEL);
 	if (!hub)
 		return -ENOMEM;
-- 
2.30.2

