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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B6CC43461
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 631356157F
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhEJWl5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhEJWl4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:41:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B5BC061574;
        Mon, 10 May 2021 15:40:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z9so25721536lfu.8;
        Mon, 10 May 2021 15:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tdhxEVn/ApgXUS3G+03myNB4Fqv3j3XN+RFKP4M2N/E=;
        b=RsbL915Fu3Y2xNkXKX9JU3SsNypKl6RXkXtnRiIChU+o0az3SWAmoffX/z3OEfmK8Z
         NYM9u/Gb8KBF+27QBcAa/Zw9oLnFc2ylp4SQhuOOmKzx7i0RxfwMoJkOMM0oVgP4jJLa
         zGhTtv4XzugHTA89Yj744v9hRpI7bYGQTpDZMdpBs9GAz4GUqb+9cLlhL1bOhnYt3gcE
         MOx6mkqks1JqsUfTamjUPQADx5DTkd2fGCjam5iqlNdt2IeW5CEZo2HmqxkOYOZ15aNl
         CrOmYV9pm32yzDdrXeTF3AxMKTfR0c9i4nmEZ32SHGuD0f6rv3YNVm3VuopOtFCDszDH
         Te+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tdhxEVn/ApgXUS3G+03myNB4Fqv3j3XN+RFKP4M2N/E=;
        b=M3P3wAGZYwG3i0jdAUHFaUkucUmTpV8KrQIo9oAna28UKFy6DxKHyU9UU4Pe+oYf7q
         XADmeVJYtzJRdk9gZz7RmXFyx2mqPETv9AyygGiAVWCySsHM/emFcNruR/pxJT0/jFy2
         rK1Qnx9G2U7IN59WUoih09BPoEWJ+NBm56HHiIzA8tl1tjdN3PG9nvxxVnmvMBqnNYfo
         56Vwj2Ww979/Ax6sZ8YpTdgVz9UfLEDa+DG6UY/qFu4iohpoVuidrFe0cuyIlXs4d4i+
         gqBxzq4vrmkrgM8dfML5RZ9mB0FNVI4sOlS27iYuzgPI83+1OJyWx26aeGx6B4KnXTaE
         NLrw==
X-Gm-Message-State: AOAM531StHoh+LmqhQShECZmY0oqeL88Gekxb8UNfqi6Fjb7L2E7+hRf
        ixG04yJrlpj/yrWUvbuor8I=
X-Google-Smtp-Source: ABdhPJzz6fepG+GOMZhdHZxCQ+3aYLSrzsog/VZEUaWf70lRQBPXOCIyrLIyWXkrDw6QPJAZS5T4Lg==
X-Received: by 2002:a05:6512:1388:: with SMTP id p8mr19368721lfa.269.1620686448932;
        Mon, 10 May 2021 15:40:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id g24sm2780698lja.63.2021.05.10.15.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:40:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 7/7] ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
Date:   Tue, 11 May 2021 01:38:16 +0300
Message-Id: <20210510223816.18565-8-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510223816.18565-1-digetx@gmail.com>
References: <20210510223816.18565-1-digetx@gmail.com>
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
index f008653d843b..619a4df3f4cd 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -469,6 +469,22 @@ map1 {
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
index 576dffdbd0a1..3fe24b6c340d 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/tegra-pmc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "tegra30-peripherals-opp.dtsi"
 
@@ -1155,6 +1156,21 @@ fuse@7000f800 {
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
@@ -1417,32 +1433,36 @@ cpus {
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
 
@@ -1457,4 +1477,69 @@ pmu {
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

