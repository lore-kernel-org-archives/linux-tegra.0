Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83799C4338F
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B6DE60F4B
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbhHBVVB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbhHBVUz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5264CC0613D5;
        Mon,  2 Aug 2021 14:20:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id p38so21259689lfa.0;
        Mon, 02 Aug 2021 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n8/ZsiPHBip8X2JgD5ugoA/miMwD7jeakAzAyNmUMcU=;
        b=SseruOXzXXXZZ7Nzy+zWMXGqJxujTQGLXCAQKkyXUrmdzCcNOiZCL1bwdYYbmnR+vF
         1jISr6tWA+sO5oCRWSBYPPs0eB2GiifGFAI85ZICcDi9jkJ6XJNGBdjMs7DSrkhx5V8n
         zEBdpC2lXaax0Dr56By55LL+ZBwTri1tD+OD6s2K/wiNhfo7PfkdwKMVGlyTEMRG9ZmO
         sAzR6ASZiCvVCKrNL3HK4h+KC5lH758RgGBN5DFDFEvEqAytFBZAHez9le8h9qSM/3XA
         HY4C9VTZoIz6pKEvAvWTSTjD3m9E3useLphwF8en79sb9P3S1i1gg7wr7LIXYMBFFtKO
         37Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n8/ZsiPHBip8X2JgD5ugoA/miMwD7jeakAzAyNmUMcU=;
        b=sf7L1UfPGxSLxbckncKf4SyhxbPPbNcDmF5rsHJtPhRTahMj/3faBFgIXzJHiJhOoR
         AbysNvHMG/jXpqakvr5jcbJjoOynjezwie2bAL8qXYPWSBHdgSfA4B8l6ggwvx8dNJaJ
         +qSgNzI9FWVv28FKBVI5tST2aQSTHFSSXbvGFbeNyBO8BIVOxSa2HF2gxuEs4TMUo2Sw
         Lizk2K5pW310sEbFg7tAjg1bF/rvEZTiPy7Iksyd4JIBnUCo6UyJ0z0bbYGDHc9UU4bo
         hOls9lafkceLwQGuCrtUfLyKBBEsro3LuGRHg0Pf41LY6Qdd9kIuN+/KqOXfnX0EXDkT
         ZHGw==
X-Gm-Message-State: AOAM530NW1V2VblsSP/XuAAleQmV++HfNtdjtP6xeK/OJbFA1YXRL9XV
        z2YoZLUGc/mUMSJwWijOPzQ=
X-Google-Smtp-Source: ABdhPJx+6fqDBltr0Mtbjj9DJQpn0A9YHemzcFZcODs2r86Jqrm57iy35rj04HEYLBZK7c8htvRKbw==
X-Received: by 2002:ac2:4c4f:: with SMTP id o15mr6061280lfk.567.1627939242738;
        Mon, 02 Aug 2021 14:20:42 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 11/15] ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
Date:   Tue,  3 Aug 2021 00:19:43 +0300
Message-Id: <20210802211947.19715-12-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
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

