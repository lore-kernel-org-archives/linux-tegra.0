Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A27C2FC39
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Aug 2023 14:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351768AbjHQOOW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351860AbjHQOOS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 10:14:18 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477B32D5F
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:17 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bccc9ec02so1076848566b.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692281656; x=1692886456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2MC56X1arK1Dw8Cm4mCvKUQ1vvfwiBeKxieKUaU5fA=;
        b=ratbWB+29zPV016eE5VJrgj5aNDJajI1deUdLWqKQCoY/YmLHjKKji2wEk31dsRHod
         qHuhdzkXffNxim5f4ex/W3yPU3/lGV8IvLHeTFE4MCkJCqctVlwquiXAlCp1NyiCAMBC
         ObPcw+W9+Gooj/eELNAQd//vW7fRkBHQuvjlN7CBI3yIUoF967RoL7/nlG7kQMgNYF5N
         SmevWR5B+w8/DQlIy0MLkHgLbiZ8MdMg5i44SMWeBngLXUxKd5Y0RAdnSJ69sdx9xhLs
         HC+glb1jYxyLScRSO2l7OPIBg3P0mvqjP8hrQOBXnKuuMkz1FnLjdlXyhJQrUeWUAq9t
         e+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281656; x=1692886456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2MC56X1arK1Dw8Cm4mCvKUQ1vvfwiBeKxieKUaU5fA=;
        b=heBGbJVbZ5ph7XfLuU8Sue3f26wnHAaWurg02Uy4N9Mhtu3PZhbELadr0xvxbbYlKi
         e3AGsM1BiU0UeysKDAf+MLLqZJUalfvCy5HeIXmmJbmmgwUKgnNGDc9JttE1wmWcAQCK
         cYzRmYB+/t45HhozLNRUITTkAw53VCOatGQZJle6NPJ3oJUDr8YOuO8d3x4ScQISnU83
         n5tLaLUU5kQLaW+wbx6zRNnzKOj0YWdIWoYrjwxwBF9qP9pkOOiQS/VOvexfEkhvC1oH
         CziBN+a4gvxji6SIBAQKr8gKTdNKLwlyTtL+sAWuT2nb3bAFFBL8JYnUb4ZjNU8CGeRF
         6y1A==
X-Gm-Message-State: AOJu0Yy2YVUpvwaii5qem+cPGW65OlEIMf471qaQH95K0xq2AtWLojR6
        BYZz9nBmvyyp63roUQMQ9Mg=
X-Google-Smtp-Source: AGHT+IHLkjb3PFQ1UF4Y3pEWlPq9/VZMnik+4h3PNh+kQnL6PMRCODbUeTEjVTB1Qr7mTljU94Xqog==
X-Received: by 2002:a17:907:318b:b0:99b:cf57:11e3 with SMTP id xe11-20020a170907318b00b0099bcf5711e3mr4967689ejb.59.1692281655539;
        Thu, 17 Aug 2023 07:14:15 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g11-20020a17090613cb00b00992d0de8762sm10136990ejc.216.2023.08.17.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:14:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: tegra: Use correct format for clocks property
Date:   Thu, 17 Aug 2023 16:14:05 +0200
Message-ID: <20230817141407.3678613-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817141407.3678613-1-thierry.reding@gmail.com>
References: <20230817141407.3678613-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

phandle and clock specifier pairs should be enclosed in angular
brackets.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 7bb5fc60699b..066b87ef7e41 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -743,8 +743,8 @@ gen1_i2c: i2c@3160000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clock-frequency = <400000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C1
-				  &bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C1>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C1>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
@@ -762,8 +762,8 @@ cam_i2c: i2c@3180000 {
 			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <400000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C3
-				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C3>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C3>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
@@ -781,8 +781,8 @@ dp_aux_ch1_i2c: i2c@3190000 {
 			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C4
-				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C4>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C4>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
@@ -800,8 +800,8 @@ dp_aux_ch0_i2c: i2c@31b0000 {
 			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C6
-				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C6>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C6>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
@@ -819,8 +819,8 @@ dp_aux_ch2_i2c: i2c@31c0000 {
 			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C7
-				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C7>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C7>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
@@ -845,8 +845,8 @@ dp_aux_ch3_i2c: i2c@31e0000 {
 			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C9
-				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C9>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C9>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
@@ -1810,8 +1810,8 @@ gen2_i2c: i2c@c240000 {
 			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C2
-				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C2>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C2>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
@@ -1829,8 +1829,8 @@ gen8_i2c: i2c@c250000 {
 			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <400000>;
-			clocks = <&bpmp TEGRA234_CLK_I2C8
-				&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clocks = <&bpmp TEGRA234_CLK_I2C8>,
+				 <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			clock-names = "div-clk", "parent";
 			assigned-clocks = <&bpmp TEGRA234_CLK_I2C8>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
-- 
2.41.0

