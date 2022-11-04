Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C5AC4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Nov 2022 11:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiKDLn6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Nov 2022 07:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbiKDLn5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Nov 2022 07:43:57 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14C82CC88
        for <linux-tegra@vger.kernel.org>; Fri,  4 Nov 2022 04:43:55 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id f27so12616758eje.1
        for <linux-tegra@vger.kernel.org>; Fri, 04 Nov 2022 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki52+InB5xGvCnuV/40wcFEaSWqSgyyzNie7Jjl9BT0=;
        b=Bedlc5dCGEN2twJPRtqPwlnsK/p4o2/EQCDnftviJ43uE81g5dFsbfHTx5HcwsnkUn
         QzisJ0FIWeVqVrH/5ORvRvpBhZ4TI/C8MdgBUKcQl3LYKvBaINpQJRj6DxgqcRGYbkwv
         yg+V+Bvox6xUyl/l0KRXZO6spU+v67pCh8zeLIyqvkJj7QWo8Sg2pgecxMh9amWBClVh
         P1R+DPHiDo8wUbfk8IJDyL+7/OkZpC3FZ/ejtL0ae8PnCDz7dMfhtcIcOYEXdUb5wOoG
         eeVbs/rjcoHCsRsku2dU59Jf9ewsTDSjeiRSx4xFot9B8nINQB/ma2l9XmcQ+u1G0zo+
         F30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki52+InB5xGvCnuV/40wcFEaSWqSgyyzNie7Jjl9BT0=;
        b=5Qyf+c0waJEZszPBI/cNpCuOBtEicEynDFqBIQcJRmlpEgjiv2RlUt2STdUhzSEV0e
         bD7oIuV8RKaL89mMLuuRalEQpn6w0Ub6PYUDu5myF7xtbvDyiXIabtsKtq4xuyMahqPu
         R26uc+az6G16yJrFNe44itIz11QOzIh+MwZ6Lq7Z6VVbFhQXKgzzHE+U8zSY/9LUQUqd
         8RAdxx3LH/vRFz77S8iP8u9U0Hw07z4mZFlmSXFlDKPKNxLjp6YaUoXh/iYwOb2p47NR
         QDKhS0xgJ5zHlEyQobToFZdbbUmt2haIlmSWQazhZHMxZVcXw69Q5gsDpBXOByEO1Lrc
         TWsg==
X-Gm-Message-State: ACrzQf2/cAbYlmCWNjF+HIXA0SozFMWDMrr3Z1PMJ7X631Uj/7cDaFZG
        tL4i8jHpDV0wEDJ1y66P78A=
X-Google-Smtp-Source: AMsMyM7J454cx1vRSEyr9itMU/dJ80BuAC5JjQnJa5y4kZSS8IFgNuE8iNOvl7+p8S2gDgiEbtdPcw==
X-Received: by 2002:a17:907:320a:b0:741:72ee:8f3 with SMTP id xg10-20020a170907320a00b0074172ee08f3mr35032219ejb.168.1667562234294;
        Fri, 04 Nov 2022 04:43:54 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id hw19-20020a170907a0d300b007708130c287sm1683261ejc.40.2022.11.04.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 04:43:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Remove clock-names from PWM nodes
Date:   Fri,  4 Nov 2022 12:43:49 +0100
Message-Id: <20221104114349.1540323-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra PWFM controllers use a single clock, so there's no need for a
clock-names property.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 8 --------
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 --------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 --------
 4 files changed, 25 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 371efed519d0..86a0e5053677 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -778,7 +778,6 @@ pwm1: pwm@3280000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0x3280000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM1>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM1>;
 		reset-names = "pwm";
 		status = "disabled";
@@ -789,7 +788,6 @@ pwm2: pwm@3290000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0x3290000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM2>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM2>;
 		reset-names = "pwm";
 		status = "disabled";
@@ -800,7 +798,6 @@ pwm3: pwm@32a0000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0x32a0000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM3>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM3>;
 		reset-names = "pwm";
 		status = "disabled";
@@ -811,7 +808,6 @@ pwm5: pwm@32c0000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0x32c0000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM5>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM5>;
 		reset-names = "pwm";
 		status = "disabled";
@@ -822,7 +818,6 @@ pwm6: pwm@32d0000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0x32d0000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM6>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM6>;
 		reset-names = "pwm";
 		status = "disabled";
@@ -833,7 +828,6 @@ pwm7: pwm@32e0000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0x32e0000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM7>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM7>;
 		reset-names = "pwm";
 		status = "disabled";
@@ -844,7 +838,6 @@ pwm8: pwm@32f0000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0x32f0000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM8>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM8>;
 		reset-names = "pwm";
 		status = "disabled";
@@ -1286,7 +1279,6 @@ pwm4: pwm@c340000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0xc340000 0x0 0x10000>;
 		clocks = <&bpmp TEGRA186_CLK_PWM4>;
-		clock-names = "pwm";
 		resets = <&bpmp TEGRA186_RESET_PWM4>;
 		reset-names = "pwm";
 		status = "disabled";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index a9f13137326a..21d28568453a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -930,7 +930,6 @@ pwm1: pwm@3280000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0x3280000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM1>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM1>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -942,7 +941,6 @@ pwm2: pwm@3290000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0x3290000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM2>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM2>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -954,7 +952,6 @@ pwm3: pwm@32a0000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0x32a0000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM3>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM3>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -966,7 +963,6 @@ pwm5: pwm@32c0000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0x32c0000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM5>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM5>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -978,7 +974,6 @@ pwm6: pwm@32d0000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0x32d0000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM6>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM6>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -990,7 +985,6 @@ pwm7: pwm@32e0000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0x32e0000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM7>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM7>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -1002,7 +996,6 @@ pwm8: pwm@32f0000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0x32f0000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM8>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM8>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -1656,7 +1649,6 @@ pwm4: pwm@c340000 {
 				     "nvidia,tegra186-pwm";
 			reg = <0xc340000 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM4>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA194_RESET_PWM4>;
 			reset-names = "pwm";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index ecd88b606bc6..3199b8d17595 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -673,7 +673,6 @@ pwm: pwm@7000a000 {
 		reg = <0x0 0x7000a000 0x0 0x100>;
 		#pwm-cells = <2>;
 		clocks = <&tegra_car TEGRA210_CLK_PWM>;
-		clock-names = "pwm";
 		resets = <&tegra_car 17>;
 		reset-names = "pwm";
 		status = "disabled";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index d7566cab7e73..1797823f7141 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -833,7 +833,6 @@ pwm1: pwm@3280000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0x3280000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM1>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM1>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -844,7 +843,6 @@ pwm2: pwm@3290000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0x3290000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM2>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM2>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -855,7 +853,6 @@ pwm3: pwm@32a0000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0x32a0000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM3>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM3>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -866,7 +863,6 @@ pwm5: pwm@32c0000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0x32c0000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM5>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM5>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -877,7 +873,6 @@ pwm6: pwm@32d0000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0x32d0000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM6>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM6>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -888,7 +883,6 @@ pwm7: pwm@32e0000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0x32e0000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM7>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM7>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -899,7 +893,6 @@ pwm8: pwm@32f0000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0x32f0000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM8>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM8>;
 			reset-names = "pwm";
 			status = "disabled";
@@ -1595,7 +1588,6 @@ pwm4: pwm@c340000 {
 			compatible = "nvidia,tegra234-pwm", "nvidia,tegra194-pwm";
 			reg = <0xc340000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM4>;
-			clock-names = "pwm";
 			resets = <&bpmp TEGRA234_RESET_PWM4>;
 			reset-names = "pwm";
 			status = "disabled";
-- 
2.38.1

