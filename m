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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8063DC07E9B
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 687D761026
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhGKXr1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhGKXrY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:24 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878D1C0613DD;
        Sun, 11 Jul 2021 16:44:37 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id w26so5742480qto.9;
        Sun, 11 Jul 2021 16:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nw2Y0y0fghw+sFEgC64gNuaGBHW1wy1WhSDHTe1H5dY=;
        b=BEaCCb9H2yM2Cq5CcBucY1YD6hIRBw2JDK/UGn0p/38pQuXsleBgEdPK2xgXjWhgWo
         dQ1EYR5wxUFxX8HL5/oCAYnLGNUpNVTAmyJKK+DnZjCKPuL2Yj4yyw+gmdKFEvJEhtDP
         Bi/CcXKvjjrwoDuJcuhDARJ0WVdJPKZbKvTfI9N143rDfItSjTl163E9zpzbPNdkFGwV
         VEA6RUqJTpRq0rsbsvDksV/q0QEwcNl0ff8C0JmBocgHja5ORBOLR4mAsMgF7VMbLUCQ
         kx/kabli6CjYzeUgrPGtA7YAX9IzGuKbc1w/F7NXmJPk7jrUerj1nxbSlg4H6O2ebFIq
         1wVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nw2Y0y0fghw+sFEgC64gNuaGBHW1wy1WhSDHTe1H5dY=;
        b=VqcunQpZy0U91xl65SSL53S8RsOP8oLik2QexAU11ftRrs/8QQIqBN1OaX0Me22/fl
         GFFklMG48tXAaxDy87+PDjFemMaGTJRgruVQWFxXXDlimc6aUxIoHvRu3FWZP7nsoJdu
         0SONaRaRYfaHyhAbSpI/hctBIKx6xguSdH9m5BoEyxfduitXswqfxcZuDP/do7SPN+sZ
         d8dNzCCcW257YyG3Hy4q0gyh9WcsoZJe3PUz956Aucq+FL1IHo8nFrB8dbEJ0MpAzFRe
         PWcLfNA1syDyZ109AiJqlKt4h54xp8iIQMRuZM0z/TJAfu9+w8+Tf3QEq7kaGUu2+rMp
         d2gw==
X-Gm-Message-State: AOAM5327mTRX95xAr9qMly3+34RfjAM+6oTdrIjnbDVrSqvXwZ5CPb0v
        9ynUXCaUezFNj8No9DefzoA=
X-Google-Smtp-Source: ABdhPJz9iSVrpf+6E8yABqKczN6ECezj56DBsxJccmADtRDvr7v7061nAbPSqiUB2/i+ttW/ZEyx+A==
X-Received: by 2002:ac8:5ecc:: with SMTP id s12mr14261706qtx.77.1626047076780;
        Sun, 11 Jul 2021 16:44:36 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 02/13] ARM: tegra: ouya: Add interrupt to temperature sensor node
Date:   Mon, 12 Jul 2021 02:43:52 +0300
Message-Id: <20210711234403.24691-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The TEMP_ALERT pin of LM90 temperature sensor is connected to Tegra SoC.
Add interrupt property to the temperature sensor and enable it in pinmux,
for completeness.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-ouya.dts | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index ab8744f3d72d..90db5ff72537 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -124,12 +124,11 @@ cpu_temp: nct1008@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 			vcc-supply = <&sys_3v3_reg>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_EDGE_FALLING>;
+
 			#thermal-sensor-cells = <1>;
-/*
- *			The interrupt is bugged, once triggered it never clears.
- *			interrupt-parent = <&gpio>;
- *			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
- */
 		};
 
 		pmic: pmic@2d {
@@ -4376,8 +4375,8 @@ pcc2 {
 		nvidia,pins = "pcc2";
 		nvidia,function = "i2s4";
 		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-		nvidia,tristate = <TEGRA_PIN_ENABLE>;
-		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 	};
 	sdmmc4_rst_n_pcc3 {
 		nvidia,pins = "sdmmc4_rst_n_pcc3";
-- 
2.32.0

