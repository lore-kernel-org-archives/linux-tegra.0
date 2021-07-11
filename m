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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5EFC07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DD006101E
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhGKXr1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhGKXrY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:24 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D31C0613DD;
        Sun, 11 Jul 2021 16:44:35 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id x24so12526949qts.11;
        Sun, 11 Jul 2021 16:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rASBzWdiFOBTgYEDJa3bivw9a46okAlIQP0Tfm4nC8A=;
        b=ZvHVa4u+eT9XxeWSkj6UxbI0Ly7G5FkFq9aLZDLfDlR1ecOqqZ/XV+jz100Bwgp9d8
         xB7B8n9naB9qDBfUSNOq8znq+m4mYXla/r6meExl0IBmndXzY5D8V7kxRb4pAOz81eG0
         kE2KPw5UBLtxMsDWBV3OD8dmD3G9T615wjabVDqAIRr2qjBnByTsVTvELuwDtWphCoz+
         MK0XeCmJAkTwwdJtPwAQ8W1YMLNn1Us/ArH55rmyakY03ovzA24cKOCLMgoPpBxuobhB
         VJZmHic+3cGek6ujms+8eIQLRg3zoMYDXxIVUCG9utO7kmb2nBPA9dCqc0oG+H95UI6/
         hNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rASBzWdiFOBTgYEDJa3bivw9a46okAlIQP0Tfm4nC8A=;
        b=pHOt/lXbHZh31DwPWYqANj5XHCToSvhB+hC3RXmaElHiVvEjlUV7Zk+2fY22DRI72z
         XwgDLaE7g8ttjxkh487HIpRMMxLkAG2wH1b0ENCI8PL0Lcx83Zch/RlV4FmxE7F7AVwa
         1Xp863w1KgctFmMZAT7c0A1BzXDk9H7xT5yJiV9QPyOqhH3dZma1TXhWrDya/67lEA8+
         74V9Jw8825DA3tglIbQbVWJ7dGQJLbBLtlXNJuaEWsmLV8SwkRCGLit2eyFpsGo2QDTf
         mzeam5SXDSjbq6UKTO5Rh26L2Ze1KEA5udSHiMYmzUQkv4+9oLqj40KV7mHgIbCMOLN/
         5wRg==
X-Gm-Message-State: AOAM533Jk9ZD4mnsvQuSwYWJTy/1THs6Wt0qOaNbczaYCQQfWfHOn4X2
        8PBfJNv48YVEscCWniAFkoA=
X-Google-Smtp-Source: ABdhPJzh0ODbofbiAGtshuhWjn6qsYxAYjouX97ynwSbSJnVa2/2rztZaIXzSjNcWCtgoTRZJyXBMA==
X-Received: by 2002:ac8:5fd6:: with SMTP id k22mr5390092qta.6.1626047074741;
        Sun, 11 Jul 2021 16:44:34 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 01/13] ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
Date:   Mon, 12 Jul 2021 02:43:51 +0300
Message-Id: <20210711234403.24691-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra30.dtsi | 87 ++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index c577c191be4b..eaf4951d9ff8 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/tegra-pmc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "tegra30-peripherals-opp.dtsi"
 
@@ -800,6 +801,20 @@ fuse@7000f800 {
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
+	};
+
 	hda@70030000 {
 		compatible = "nvidia,tegra30-hda";
 		reg = <0x70030000 0x10000>;
@@ -1062,32 +1077,36 @@ cpus {
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
 
@@ -1102,4 +1121,64 @@ pmu {
 				     <&{/cpus/cpu@2}>,
 				     <&{/cpus/cpu@3}>;
 	};
+
+	thermal-zones {
+		tsensor0-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&tsensor 0>;
+
+			trips {
+				level1_trip: dvfs-alert {
+					/* throttle at 80C until temperature drops to 79.8C */
+					temperature = <80000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				level2_trip: cpu-div2-throttle {
+					/* hardware CPU x2 freq throttle at 85C */
+					temperature = <85000>;
+					hysteresis = <200>;
+					type = "hot";
+				};
+
+				level3_trip: soc-critical {
+					/* hardware shut down at 90C */
+					temperature = <90000>;
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
+			};
+		};
+
+		tsensor1-thermal {
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
2.32.0

