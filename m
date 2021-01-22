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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C984C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F4DC23B08
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbhAVUjB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:39:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbhAVU2s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:48 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36872C061A27;
        Fri, 22 Jan 2021 12:25:11 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id x23so7970502lji.7;
        Fri, 22 Jan 2021 12:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gYdNVtXVasQM0PSs0z/nXtCl4+5nAAieK15LoNi9kj4=;
        b=ScQW7UAHzf5ONnjPUt7ZCGkSjtTpbLqVN4KKyshvyTLcSfjZTUR8Iz7+5k1J75l+Oh
         CZY3MikLDP1KU8UCe610azJVXadoi8TEWoeTOfrJ7nDTvVxPLB4o7zED9jp1IDyQhCCd
         mwq5Ur/N47xQWpvIrQAZchuq2ibuPlhItOvy5Kc/b/KF672M0D/1fsWq0MaRopmWbQ5O
         COssDv/2pYgDtNg1g9TPm37oMavUdSkmD+ftP+Z1a3gAg8pTRiYTD1dSqzUJIIPWJFlb
         6p01LMvSlY/KM8cFOpDVSW5HIUdmWtsvDzRxwX3GY3Cs2jNaUTvMzgrqsB55tWi+kn13
         uwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gYdNVtXVasQM0PSs0z/nXtCl4+5nAAieK15LoNi9kj4=;
        b=oxcBCY64oMYkXRLbFWOeVcbXYPQcJ/c5jbhE2kEMC8Js2UbJgFyqbqVIu6neBgTA1i
         tgx/rsGQfbXJkazHUwDe9B3N7lNKqg1SihYXPvRp0gqQGHgc2BPRfej5CCrGuTyJOFZH
         i+OWg0elNO/U/vsyoW2O0gRa0+TCFbN0Hdvhw2ppOxSgbRCIV21kIADAdEbbP9she5k8
         96w4ODBFNeolD5Z3jsWY4672Ol0wFPeY57lquQ3L2j7i1110XjgjWxtS8dbz9Z5N0Y1D
         Pwgu/+MUSLfKqU7fIuHU7EbBTh+KoFVoVZ0fGgZfJ98XWBDRRU1hHeY2RtDfU+5h7zWv
         4sKA==
X-Gm-Message-State: AOAM531sAJMxqTfQ7VgoAUJlDyOke1yJuiCgwiK3JsgwPYw+DhggPDbx
        mqN7aWsvrDKfUDPRLI4IKXQ=
X-Google-Smtp-Source: ABdhPJww+hw64G9ienLmFakRcqEI6uUSGjr7t75+FT5GvpnZfXi9R6WMDSyvTRIUBJh6GeCBvLczIg==
X-Received: by 2002:a2e:9d05:: with SMTP id t5mr554421lji.130.1611347109757;
        Fri, 22 Jan 2021 12:25:09 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:09 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all board variants
Date:   Fri, 22 Jan 2021 23:24:47 +0300
Message-Id: <20210122202457.13326-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
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

