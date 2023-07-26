Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351DDC04A94
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 18:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjGZStG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjGZStF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 14:49:05 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E374C26BC;
        Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9891c73e0fbso11497166b.1;
        Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690397342; x=1691002142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPI2zan0vB60L24M8VngPtTHJpRLNCz44Rgi3kK/geg=;
        b=FDEvCueTvD5/2wdPIbWP/l6cfT8RoRQD+x+FwClNM6YqipoTAWhrMoM1khODOU3Ckp
         sT5oiLc0ocdWxQgAWf8XMxo0SkUpf617JRAR8pHYggcRxxiKOsG3yimzwDfJylVCpBmi
         7yNTY7qj4kkRIqFrA5PaCuUcWorZVXzcMjVry+NvUQXCmxhxnCS5WLj11Yon5KyeoLks
         9RmV9Gg9H53yyAH7YQORsLKBvm/u1YKIxxqu/RDWSJeNQ7RHyIvcRBx+biV6/xxIvf+w
         aN6C5CoBbPw64D/loWnS7YudOO2rO79LMKPKE4+p92mc9XrE8WTcSMzxozRKuEoyjQAD
         3Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690397342; x=1691002142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPI2zan0vB60L24M8VngPtTHJpRLNCz44Rgi3kK/geg=;
        b=Z5bOwnyDCKLA/UdRaa+JqhoQZ5v3WCB5wSfsZnGXpjow1hGmvPg7xiEHF5ADBUfZ4h
         un90QMm7kP8rNhjDG4VkErSwILpO50zyFwZbA8D+HLvmIRqoeO/Cga99mx+h/0DxYC2J
         uXc8zZsqqNpM/H4pjPJx1QEbhE06TIzHEeR/kzS35o97qBNsU3O+5aMEdFB1Lz7Cl6PG
         0CJyiMpno6aT5cMh+2UuB6oRM+/joXJvZWO2DTRwWsrhsfOA7KXrw+/kd6r/1ambsa4A
         GErHlyjdc6sqDjtqkLUAwpPKnh0ODnIrMZdI9fhHJPV5FlPi11iC3TtfgxmMfMoqH8a3
         JNLQ==
X-Gm-Message-State: ABy/qLY7fdYg+ChivGYtuhwGvA2gZr9a8dtuuTPHEZ+suL3P0ojaAV76
        jhsBfNHMIO3YBwGTSirgo4k=
X-Google-Smtp-Source: APBJJlFEz7GEIeoCEWRMaD/WV7pBFz+cf93M9VkO7Zp/n5IIKT4wJtCBN+YSvNT2o8V06RojOJ+TGQ==
X-Received: by 2002:a17:906:76d2:b0:993:f611:7c97 with SMTP id q18-20020a17090676d200b00993f6117c97mr380393ejn.33.1690397342321;
        Wed, 26 Jul 2023 11:49:02 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cb14-20020a170906a44e00b00992eabc0ad8sm9875996ejb.42.2023.07.26.11.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 11:49:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] drm/panel: Relax porches for HannStar HSD101PWW2
Date:   Wed, 26 Jul 2023 20:48:56 +0200
Message-ID: <20230726184857.2294570-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The porch maximum values for the HannStar HSD101PWW2 are unusually
small. Make them a bit larger to allow a more flexibility when
overriding the timings in device tree. Unfortunately the datasheet
doesn't list porch limits in detail, so this is a bit of guesswork.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4badda6570d5..4bab181e9d4b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2104,13 +2104,13 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 static const struct display_timing hannstar_hsd101pww2_timing = {
 	.pixelclock = { 64300000, 71100000, 82000000 },
 	.hactive = { 1280, 1280, 1280 },
-	.hfront_porch = { 1, 1, 10 },
-	.hback_porch = { 1, 1, 10 },
-	.hsync_len = { 58, 158, 661 },
+	.hfront_porch = { 1, 1, 64 },
+	.hback_porch = { 1, 1, 64 },
+	.hsync_len = { 58, 158, 553 },
 	.vactive = { 800, 800, 800 },
-	.vfront_porch = { 1, 1, 10 },
-	.vback_porch = { 1, 1, 10 },
-	.vsync_len = { 1, 21, 203 },
+	.vfront_porch = { 1, 1, 32 },
+	.vback_porch = { 1, 1, 32 },
+	.vsync_len = { 1, 21, 159 },
 	.flags = DISPLAY_FLAGS_DE_HIGH,
 };
 
-- 
2.41.0

