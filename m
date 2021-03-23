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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9094BC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66850619D0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhCWPyk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232819AbhCWPy2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:28 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC928C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:27 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id l4so27911657ejc.10
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vLQx1Cfo6NMYGKyAzHlak3XDgfOSp0H1hbHr7UYGQH4=;
        b=N+mYceP9vCGRhM3PjsaOHNXvBi4uz1WxWLKOx9peAA38HYDQCVPyXnUTnSzQpB9J4i
         sk1f2x99Ya8yeXD9FTzn++cxVuAQpeFrWB7NqSIWOxldeIvjG/8/zPUhEz53OaD91unu
         dQOppyZBIqOr7f1AaXLtpYJNfL9X8asUyS4AHwiuvwM0juPwM1pIHmJ7kmoCVWrD0ru0
         oIKwoEnTWD5ByP1znDZNW+BgSnhVArsad8nCTeTqjbZSKFYvJ+H6BlJxDS+Lbd+rSUM3
         DhFbGaMJtMTngvicjq7fomk+KI601UwkvFV5CSKro21VFh9dW6tZ9eogiK3G1gEfYSRc
         mRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vLQx1Cfo6NMYGKyAzHlak3XDgfOSp0H1hbHr7UYGQH4=;
        b=ua1giZo6MX71mqKdO2lpzkC5XZMceqtVSfxfH9IKvm2IyrOnAI/trnQibRDPKwF4w1
         J6RgrlagXq3e+Ehpbj45tHFYhfsv6wKZCFJiAuZEHs5WOkW0zys/R6qigK+rq9doF1Hq
         Ktbou8qZGDVSHsZtYFv1pyTCg38uw26c0Fp21zKK3RRPZUj0B7pF0uguUhqBGwbZeVfg
         CRIhycqzhSi3naIuDiKtYjEq9UOsZO6cKEfDdvqavgRTQKBrDL+tURDeHZja5VN+rTen
         +SS7r/wYFaRZFOCv/HtpvqHkoO8yQfr95ryYWoLwBo32V/WUiaz6f/VrXwCiXwi7HRnL
         PaQQ==
X-Gm-Message-State: AOAM5311wdbGkcjPBKZQVu/qJVmoISotCNW4SYO83vTgvIxrdh+PdnD3
        G0jOFZegfpffLoThSZMd1SQ=
X-Google-Smtp-Source: ABdhPJyKfTt7s+hXj2wrI20wtzxyHA+LfKXIU00VLlyyCJrWQFHBCQThqvsryE6tm85XtLfRjUF3NQ==
X-Received: by 2002:a17:906:340d:: with SMTP id c13mr5692563ejb.29.1616514866665;
        Tue, 23 Mar 2021 08:54:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u13sm11560812ejn.59.2021.03.23.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/9] drm/tegra: dc: Inherit DMA mask
Date:   Tue, 23 Mar 2021 16:54:30 +0100
Message-Id: <20210323155437.513497-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
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
index 2585ba70b706..5737a0c4dc9f 100644
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

