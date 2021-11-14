Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D4CC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B4F161152
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236178AbhKNUHt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 15:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234667AbhKNUHq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 15:07:46 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAFDC061767;
        Sun, 14 Nov 2021 12:04:50 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 13so30809669ljj.11;
        Sun, 14 Nov 2021 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQZiCP3YzsvmkZD6Z7bgEa5sOkxvqLSTLRbNZEye2ZI=;
        b=difuj7H0lMKtMdGpF58hKW0rW15oFUmE9nHNa5fgB5JyPAIwrd/q4KDiFFNYJmgRUV
         ezka4FNHAL0Pt/N/ezShb39s1xCVjJlTj/LwrL/hXvd3LOZdu7pSIHALHzWciZrQGKxp
         XSuxmd2b39Z4fQhAi+cjCQtwDUK/YwGdpx3yo2hlKIcOmfAXgrZvK/hWmoP1nKii75kf
         qJLKfLEswgB+hjxT+fRFRiMWSFEcnD4eiLmk9CqRVtj8x6Gc2m4oA5qlgCGqi8F39vk8
         azDOwp0/9s2sg9HxdPjZ9dQOsIEXahSFJ2LnsiPsTid9TMPFUxMFYzvam8TbHKEmEeVX
         5PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQZiCP3YzsvmkZD6Z7bgEa5sOkxvqLSTLRbNZEye2ZI=;
        b=Fe1kMZq46CUnf5gYwfL6c/CapBj1yaCfNXDR0GCeiEW+wDoQyKLcRa/zfbXs/rFwma
         Vm1toNZyu0ah7OI8gUrCGjFDZRyOkH1dBNfYgwcFVsEpgvyeNE9JS6yIFXdPIsM1dh9t
         pRzTh6zHoE6RP5/2KYrJzagytejvAXXv7CxfzO7OYTdQvb776l1ZrcSDURLFawQXXkl4
         SDsvcoSWXAyHztfjmr1mRBkOq8nFXLX97QxUJWoKL1B02yjEa061Nxn81q9HndSl31g5
         gpm1LqHKXxkKdXnyjq6xc+lIk/8ByV1SdML0o0YpF/tsnJW6AQ2TIp0phD2bjsMFkug9
         PHMQ==
X-Gm-Message-State: AOAM533QozcKVwNALPsNO30/7lpMQXtRS3mSAUGFbxF9AH76I5lhwfpk
        H0D2UA3l4tHLsWNoGNFO4zw=
X-Google-Smtp-Source: ABdhPJz2wSMbwjLGs/janFR3xlIJsEDFVX/vf7X8IKymWar31yaYnOoG+z12y9naoTLURsf8eNZu7g==
X-Received: by 2002:a2e:890d:: with SMTP id d13mr32746484lji.396.1636920288791;
        Sun, 14 Nov 2021 12:04:48 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id g4sm1193914lfv.288.2021.11.14.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:04:48 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] drm/panel: simple: Add support for HannStar HSD101PWW2 panel
Date:   Sun, 14 Nov 2021 23:04:31 +0300
Message-Id: <20211114200431.28484-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200431.28484-1-digetx@gmail.com>
References: <20211114200431.28484-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add definition of the HannStar HSD101PWW2 Rev0-A00/A01 LCD
SuperIPS+ HD panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index eb475a3a774b..8b7033048f83 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1927,6 +1927,31 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing hannstar_hsd101pww2_timing = {
+	.pixelclock = { 64300000, 71100000, 82000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 1, 1, 10 },
+	.hback_porch = { 1, 1, 10 },
+	.hsync_len = { 58, 158, 661 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 1, 1, 10 },
+	.vback_porch = { 1, 1, 10 },
+	.vsync_len = { 1, 21, 203 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc hannstar_hsd101pww2 = {
+	.timings = &hannstar_hsd101pww2_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -3725,6 +3750,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "hannstar,hsd100pxn1",
 		.data = &hannstar_hsd100pxn1,
+	}, {
+		.compatible = "hannstar,hsd101pww2",
+		.data = &hannstar_hsd101pww2,
 	}, {
 		.compatible = "hit,tx23d38vm0caa",
 		.data = &hitachi_tx23d38vm0caa
-- 
2.33.1

