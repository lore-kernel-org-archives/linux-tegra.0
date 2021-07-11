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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B502FC07E9E
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A16D86108C
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhGKXrs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbhGKXro (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:44 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48842C0613E5;
        Sun, 11 Jul 2021 16:44:56 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id o9so1446602qvu.5;
        Sun, 11 Jul 2021 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n8/ZsiPHBip8X2JgD5ugoA/miMwD7jeakAzAyNmUMcU=;
        b=ImmSw10SS2CiGPoBepXSiYARyoF2ltPFjmW542I+Zsay1Ft2FCgE26wW0KMVJDJ+w4
         vF2pav72n3QUrMUlEwUTLQQmR4BJTy/kBIKsl1Vw/Au9tp9gWwbNRIDVAC2VpEIErapy
         hbJNMK+PMcz2aIRFIrwEFKA7FIxA/ethNpjtjYdT+9Ru919TARQ+f3YjzQ/V90ftUD0Z
         B3LP2vo/fLLa+fhaehPCOaNNQtHReqTfrk/UND3hKx19F5aSEtZgqcD8krVnjgdSWcXb
         CEkdE7Rtb+Vn0jJEe2Zc4WeOqeZTHgORksJENxz25UJHU3R1EFz2OYiO1fxes1y5W04C
         spHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n8/ZsiPHBip8X2JgD5ugoA/miMwD7jeakAzAyNmUMcU=;
        b=O+IFWZ0sXqsAxqwhAdWgztTt5edSJgPOR7W7objqCtm8WmYUNnrQyKhgtCk3X9J+Y8
         D4FYgF/TBB+voU79faz8V4O2xhZ8EV9il45c35xEFFNQIsuOJasogX//7RevzpyhvzXT
         p273Bvqrd6dQN1p3R9B1sN2efwp+W/k3i24WHHNLe7W7+N/2DPkbBizXScIrbOW+vW7G
         aCuHJTYs0QKkvfr5i+j+8VLgsQbKDv3kwcVKlkcVR2R1hoT9kClZc9eyokYT/tvO4gl1
         +8NI0Ut7Qw9SDBMrmImT0pQTwDhj0M1UAM9A7NPkDIG3t1ITkZqE+UOYFxoIOrh5tz7o
         JCAg==
X-Gm-Message-State: AOAM533WDWFeXF8TZMWA6iZD97/zd1btjRdiqndz8hXKgd2S34ou7G3p
        mbs8M33cRIaqQwJUdUk1CnU=
X-Google-Smtp-Source: ABdhPJyTwuDoupZ3m4rZ5hcI8Xr0DjSXQc3ACTs5E9/qa3NQxD3ipkyqYTIR0i0DCExI7AeaKEBA1A==
X-Received: by 2002:a0c:b921:: with SMTP id u33mr48725069qvf.12.1626047095538;
        Sun, 11 Jul 2021 16:44:55 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 11/13] ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
Date:   Mon, 12 Jul 2021 02:44:01 +0300
Message-Id: <20210711234403.24691-12-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The configuration of USB VBUS regulators was borrowed from downstream
kernel, which is incorrect because the corresponding GPIOs are connected
to PROX_EN (A501 3G model) and LED_EN pins in accordance to the board
schematics. USB works fine with both GPIOs being disabled, so remove the
bogus USB VBUS regulators. The USB VBUS of USB3 is supplied from the fixed
5v system regulator and device-mode USB1 doesn't have VBUS switches.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 25 +------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 4897079680bd..c385b13d4faa 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -723,7 +723,6 @@ usb-phy@c5000000 {
 		nvidia,xcvr-setup-use-fuses;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
-		vbus-supply = <&vdd_vbus1>;
 	};
 
 	usb@c5008000 {
@@ -735,7 +734,7 @@ usb-phy@c5008000 {
 		nvidia,xcvr-setup-use-fuses;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
-		vbus-supply = <&vdd_vbus3>;
+		vbus-supply = <&vdd_5v0_sys>;
 	};
 
 	brcm_wifi_pwrseq: wifi-pwrseq {
@@ -995,28 +994,6 @@ vdd_pnl: regulator@3 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_vbus1: regulator@4 {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_usb1_vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vdd_5v0_sys>;
-	};
-
-	vdd_vbus3: regulator@5 {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_usb3_vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		gpio = <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vdd_5v0_sys>;
-	};
-
 	sound {
 		compatible = "nvidia,tegra-audio-wm8903-picasso",
 			     "nvidia,tegra-audio-wm8903";
-- 
2.32.0

