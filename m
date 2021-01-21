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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5752EC433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 104C223A5C
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbhAUS0v (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:26:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbhAUSYG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:24:06 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CDBC061786;
        Thu, 21 Jan 2021 10:23:25 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b10so3611935ljp.6;
        Thu, 21 Jan 2021 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uEGR0Vr7AMQgEHyEUs3GRzdZFS1e5Q8NHr9ae+1nias=;
        b=KFgjTXLWIZihYsO5qwdqEEIF4V3DyRBPX/kmjvETLZkxwjsmuidwoQchpGefqxEGy+
         Ce/P/7FqZDun5FZg89COskpUFM5CcU3xmkBS53Q2rNrDwIl0lIAHoyw1LKK/xm+W1Jdl
         dqQ07L18HN3t5HS7uDnA4E3dwHtp11t9/yTlSxUHLw/AjYBE/iMgAcoxc4FFt56ef02O
         O4JoZBXNuBS23naHmI1QZqe+BemH3Yx/xRY0H6pNLGJLyWUc6ebq4hFcT9bOiKr5yZHM
         LHxeQiHUaUdVESMAbWQbG9hOqfXRYeuCT9UUrDNUCulK3lyDrgp6kPmd2JwXItPWsfFP
         t1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEGR0Vr7AMQgEHyEUs3GRzdZFS1e5Q8NHr9ae+1nias=;
        b=cYspLCM1Tv7QaA0GSf2jpXCSWxEL44qvd/X3SsHwyaGQcBUpFBbgmWgbJWuaCI0ZdX
         KdpCaZYmka2TJAkpn12A+oU87NFc0xvzgN1B8I8+NaBmBTet1wsccApeM2uB8x0mVo/d
         2MEVEmE0Far+fyHoDYeYgncFK9ydYZhLvaFuTP2o3DqMu2yku/EXeWVdUtAb+BwwuYLm
         ZJTzYl0igIRBL74vXQEikq6wkjPJFZ9j+tY6ekJmV4uNDvxo/HlJ4rGC94FVCSdRsc1Y
         gQsmapJXRRKCz7j16VNWU0dwO/I99T3SuMigw56kX9Ibx9i6ITC2OasYc3czSMO8KSSh
         RImg==
X-Gm-Message-State: AOAM532CcnkKXVXUMCzP3PeV9R4DzyDKncFq5TPggJzVi/hLCHpyAbfD
        gX27rhP3WMYcfWfHtUYZiTHKy7lkCQ4=
X-Google-Smtp-Source: ABdhPJzBVHfSIfXBWFGJAEfSaTl4tQN7KtGU3suCY0eHG8155cbc1foAGDXONfpQWeBrpe7hDUdl3g==
X-Received: by 2002:a2e:90d2:: with SMTP id o18mr290192ljg.395.1611253404317;
        Thu, 21 Jan 2021 10:23:24 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:23 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/13] ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all board variants
Date:   Thu, 21 Jan 2021 21:22:58 +0300
Message-Id: <20210121182308.16080-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable CPU frequency and voltage scaling on all Tegra30 Cardhu board variants.

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
index 788f16d2a0fa..309538bdcd66 100644
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
@@ -273,9 +275,14 @@ vdd2_reg: vdd2 {
 
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
@@ -343,17 +350,22 @@ temperature-sensor@4c {
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
 
@@ -425,6 +437,28 @@ clk32k_in: clock@0 {
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

