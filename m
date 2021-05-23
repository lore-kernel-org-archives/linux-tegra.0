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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21797C47080
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0497C600CC
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhEWX6J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbhEWX6H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:58:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13B6C06138A;
        Sun, 23 May 2021 16:56:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b26so22035219lfq.4;
        Sun, 23 May 2021 16:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SZjslNJj0RrvMEBltMfpTerrLG/TtMo8+YaLhqfm6kQ=;
        b=VHGfKQeD5DEVYG9/7bqRxsUqwRkh1peG1GhTmILCWbDJezl5ACdD1+ZypwzgY9Y/ov
         4w5EkjNuRX2/0xvcDA2WHkKd3gYxB4x0dVJvyDRBE58GpDg9kNGVQXHRZCSDMEZfoIUD
         2007ERvoRrCmRslHscWMo8H1s6zWgU07H0MoYTCQzd72SOhqaPm9/aYPNhvi1cRCX8oF
         dXAVwkHZJjrJBvRuLKjcSAAOehArhU0N3+RplQ+ImSi9BcCPkGe0nlKkb3LcX5TdTqPe
         JpCnhRs4oyhf14u6PQC0HTnXzXhPLQG1/xPYJxFaDB16njlmiaZKTZqR352mpsOHYNqC
         SS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SZjslNJj0RrvMEBltMfpTerrLG/TtMo8+YaLhqfm6kQ=;
        b=IRoFwGHyvDvvfkkTcpPeyuaxzXNfRzppSvNpVdtB2uXCPHdnz8WRZsRAL7Ou3qx1A8
         OCEPlBO3BMbaazQpYwieZQEREWKp6x0PlV5rsCIcK3YfOz8FZNm4o6f891kHMhnMzvly
         vD1IJtCInym1TgDMKmUTAzv5hKGaBddPwVYqwCnFOyuuLPwUPCUIIHqbtEM2vPfETmRK
         IjBVysLYMOHBDuKqgr8X6TcdLRu2NuN5WwugTKfEiNDe6+SYLTx9H6hxvZEp9tEiBqcE
         4M7Gy1eic1ZFnBC41+nrw9OnJ7nAnuV6C0pmK7eQqECU0s8FpccEPCbvXbgAaPfYJ3N6
         mldg==
X-Gm-Message-State: AOAM531gGNhRpmCe5UfWK/z2n7ULaomDwa0GUCrB6bTzowSD1apon+vg
        Cu9vTXWp0iWHQfn79l2qytM=
X-Google-Smtp-Source: ABdhPJz34PfRmncVj1km4qFInTQvlWxQpf3C3erhxrfDRu0zzc54ylbOCFTpiH8MDp/QJwu+pbhecQ==
X-Received: by 2002:a19:495b:: with SMTP id l27mr9261746lfj.230.1621814197047;
        Sun, 23 May 2021 16:56:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id h4sm1092987lfv.247.2021.05.23.16.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:56:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
Date:   Mon, 24 May 2021 02:56:20 +0300
Message-Id: <20210523235620.31538-8-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523235620.31538-1-digetx@gmail.com>
References: <20210523235620.31538-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the on-chip SoC thermal sensor to Tegra30 device-trees. Now CPU
temperature reporting and thermal throttling is available on all Tegra30
devices universally.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-ouya.dts | 16 +++++
 arch/arm/boot/dts/tegra30.dtsi     | 93 ++++++++++++++++++++++++++++--
 2 files changed, 105 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index e767ac227a81..d792ce5c64c0 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -468,6 +468,22 @@ map1 {
 				};
 			};
 		};
+
+		tsensor-channel0 {
+			trips {
+				dvfs-alert {
+					temperature = <70000>;
+				};
+
+				cpu-div2-throttle {
+					temperature = <75000>;
+				};
+
+				soc-critical {
+					temperature = <90000>;
+				};
+			};
+		};
 	};
 
 	vdd_12v_in: vdd_12v_in {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index c577c191be4b..6becbadef210 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/tegra-pmc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "tegra30-peripherals-opp.dtsi"
 
@@ -800,6 +801,21 @@ fuse@7000f800 {
 		reset-names = "fuse";
 	};
 
+	tsensor: tsensor@70014000 {
+		compatible = "nvidia,tegra30-tsensor";
+		reg = <0x70014000 0x500>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA30_CLK_TSENSOR>;
+		resets = <&tegra_car TEGRA30_CLK_TSENSOR>;
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_TSENSOR>;
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_CLK_M>;
+		assigned-clock-rates = <500000>;
+
+		#thermal-sensor-cells = <1>;
+		#cooling-cells = <2>;
+	};
+
 	hda@70030000 {
 		compatible = "nvidia,tegra30-hda";
 		reg = <0x70030000 0x10000>;
@@ -1062,32 +1078,36 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clocks = <&tegra_car TEGRA30_CLK_CCLK_G>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
 			clocks = <&tegra_car TEGRA30_CLK_CCLK_G>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <2>;
 			clocks = <&tegra_car TEGRA30_CLK_CCLK_G>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <3>;
 			clocks = <&tegra_car TEGRA30_CLK_CCLK_G>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -1102,4 +1122,69 @@ pmu {
 				     <&{/cpus/cpu@2}>,
 				     <&{/cpus/cpu@3}>;
 	};
+
+	thermal-zones {
+		tsensor-channel0 {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&tsensor 0>;
+
+			trips {
+				level1_trip: dvfs-alert {
+					/* throttle at 67C until temperature drops to 66.8C */
+					temperature = <67000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				level2_trip: cpu-div2-throttle {
+					/* hardware CPU x2 freq throttle at 70C */
+					temperature = <70000>;
+					hysteresis = <200>;
+					type = "hot";
+				};
+
+				soc-critical {
+					/* hardware shut down at 80C */
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&level1_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&actmon THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&level2_trip>;
+					cooling-device = <&tsensor THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		tsensor-channel1 {
+			status = "disabled";
+
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <0>; /* milliseconds */
+
+			thermal-sensors = <&tsensor 1>;
+
+			trips {
+				dvfs-alert {
+					temperature = <80000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+			};
+		};
+	};
 };
-- 
2.30.2

