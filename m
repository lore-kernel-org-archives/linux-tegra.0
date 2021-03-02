Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C602C28E87
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00ACB6023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377879AbhCCDbP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443608AbhCBMLo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:11:44 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032DEC06121D;
        Tue,  2 Mar 2021 04:11:04 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id q14so23617758ljp.4;
        Tue, 02 Mar 2021 04:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gYdNVtXVasQM0PSs0z/nXtCl4+5nAAieK15LoNi9kj4=;
        b=CFNJizl12zqNVLce4b6MFuB2fssfJ/5KkWg8kz4yBgSRp2dYsUPPptds4wf7kXFqkz
         4+cVvgQrDbKLCoA/KzzhzjRXhvOQlhlt65yqQdxxYb+KbkIkmbeGc65OAKYlQEM12WBm
         n16OyOTmLZP+Tsw5kYa99whINEMcW+7X9w4CZ7cOocgUK8ESb45mbcPVJXvb8q68WMxD
         dOUB3s4WVpD43OCl4jzHBie7+cxYNIpE+h30deuRSJ2IgVr0dEgARYc7PMiCKLItHWbt
         MGz6Zo8BRvYsISaoKMtGsYh87wgzMlSNES1T7C74mLt0MHITwo28N7yoxHGez8XksKz8
         2fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gYdNVtXVasQM0PSs0z/nXtCl4+5nAAieK15LoNi9kj4=;
        b=WAhK8HN9Qm4KCIoeY9GUOuf9LzpL8LE81G8LyjP8NnUsTbWDSS6Vg5YTafZdS4tbA2
         78d8FsAW2XhSADHqUTIg7aDYREGaB98PdeITVilKSEdACJ/wfD9L6OBoasT2JWC6wvvC
         GyUh5MrGRDNBFynP3iIAHtr1teYcuV/Tgw97IxBTyhZLa2Zwj3M2JckxHA7PPaTT1IPL
         /KzL0+Gcg4Y4LT3m4+abkh4kaw7OZxANhSsRQcH0gS2PVV0OHkzF0j9M4ZO1vj+gEmdb
         w3E/ClrT6s+gsCv+BS1JYlKyDU8UtI0AgjMrgoNgDrYFd5iSF45i9jp1e2p3+01kT716
         jQyA==
X-Gm-Message-State: AOAM5337g6OQvon+6zCQabY1Op2xl6lgl58ihXSuyMsOF63r8pGqDFBd
        kRC3s1SAo9Vzs2m7YJhdWZk=
X-Google-Smtp-Source: ABdhPJwcWBQmlvWORIaLHwk7EGxCpmE90da1COJcmrfliMBJQr3sXgOzhiHGEA7sszRN/4WWHUBdHg==
X-Received: by 2002:a2e:b522:: with SMTP id z2mr11874064ljm.416.1614687062471;
        Tue, 02 Mar 2021 04:11:02 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:02 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/14] ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all board variants
Date:   Tue,  2 Mar 2021 15:09:52 +0300
Message-Id: <20210302121003.15058-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable CPU frequency and voltage scaling on all Tegra30 Cardhu board
variants.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-cardhu-a04.dts | 48 ------------------------
 arch/arm/boot/dts/tegra30-cardhu.dtsi    | 40 ++++++++++++++++++--
 2 files changed, 37 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
index c1c0ca628af1..a11028b8b67b 100644
--- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
+++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
@@ -2,8 +2,6 @@
 /dts-v1/;
 
 #include "tegra30-cardhu.dtsi"
-#include "tegra30-cpu-opp.dtsi"
-#include "tegra30-cpu-opp-microvolt.dtsi"
 
 /* This dts file support the cardhu A04 and later versions of board */
 
@@ -92,50 +90,4 @@ vdd_bl2_reg: regulator@106 {
 		enable-active-high;
 		gpio = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 	};
-
-	i2c@7000d000 {
-		pmic: tps65911@2d {
-			regulators {
-				vddctrl_reg: vddctrl {
-					regulator-min-microvolt = <800000>;
-					regulator-max-microvolt = <1125000>;
-					regulator-coupled-with = <&vddcore_reg>;
-					regulator-coupled-max-spread = <300000>;
-					regulator-max-step-microvolt = <100000>;
-
-					nvidia,tegra-cpu-regulator;
-				};
-			};
-		};
-
-		vddcore_reg: tps62361@60 {
-			regulator-coupled-with = <&vddctrl_reg>;
-			regulator-coupled-max-spread = <300000>;
-			regulator-max-step-microvolt = <100000>;
-
-			nvidia,tegra-core-regulator;
-		};
-	};
-
-	cpus {
-		cpu0: cpu@0 {
-			cpu-supply = <&vddctrl_reg>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-
-		cpu@1 {
-			cpu-supply = <&vddctrl_reg>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-
-		cpu@2 {
-			cpu-supply = <&vddctrl_reg>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-
-		cpu@3 {
-			cpu-supply = <&vddctrl_reg>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
 };
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index dab9989fa760..42ea949953c7 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
 #include "tegra30.dtsi"
+#include "tegra30-cpu-opp.dtsi"
+#include "tegra30-cpu-opp-microvolt.dtsi"
 
 /**
  * This file contains common DT entry for all fab version of Cardhu.
@@ -272,9 +274,14 @@ vdd2_reg: vdd2 {
 
 				vddctrl_reg: vddctrl {
 					regulator-name = "vdd_cpu,vdd_sys";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
 					regulator-always-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				vio_reg: vio {
@@ -342,17 +349,22 @@ temperature-sensor@4c {
 			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		tps62361@60 {
+		vdd_core: tps62361@60 {
 			compatible = "ti,tps62361";
 			reg = <0x60>;
 
 			regulator-name = "tps62361-vout";
 			regulator-min-microvolt = <500000>;
 			regulator-max-microvolt = <1500000>;
+			regulator-coupled-with = <&vddctrl_reg>;
+			regulator-coupled-max-spread = <300000>;
+			regulator-max-step-microvolt = <100000>;
 			regulator-boot-on;
 			regulator-always-on;
 			ti,vsel0-state-high;
 			ti,vsel1-state-high;
+
+			nvidia,tegra-core-regulator;
 		};
 	};
 
@@ -424,6 +436,28 @@ clk32k_in: clock@0 {
 		#clock-cells = <0>;
 	};
 
+	cpus {
+		cpu0: cpu@0 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
+		cpu1: cpu@1 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
+		cpu2: cpu@2 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
+		cpu3: cpu@3 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
 	panel: panel {
 		compatible = "chunghwa,claa101wb01";
 		ddc-i2c-bus = <&panelddc>;
-- 
2.29.2

