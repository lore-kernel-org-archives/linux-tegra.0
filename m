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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B55FC43331
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42DA764E6B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377893AbhCCDbR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443617AbhCBMLp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:11:45 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3AFC06121F;
        Tue,  2 Mar 2021 04:11:04 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id v9so13119326lfa.1;
        Tue, 02 Mar 2021 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hD9WM1TsxClgJGVsYw0piduzzVmgTfE7TgE20b75wFo=;
        b=CnZwh3jg/rrrLYzG89CzaZahKaBLWNf2uy1W0fKTh/6ooDOht+QmUaRJMAPc8bbcAG
         I5Zb4coUQ5q8wIaydS4khRhZJ0smmCRiweYEdpXmT4XvBWnW7f6otEgBbBza6I5aV1BC
         yfzGtGWeU2zgElcka2dx9iZ0zUI0QSD+JYCTvN+Fb3bSQInWNbE11m0UR6uXvAK+L0oN
         c9bjvwjdhGcTDCztCMztxcYI7/Hv0qHGUCOgjD7ukr4qNNh+HsXIaVpV6fq8/WdYjeBy
         hq2QeD24FGdROsFQ9GTal7UCl9QemoftL3zzptH3uvjqULVLuE6i69yan+aWDcJzqrWR
         lKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hD9WM1TsxClgJGVsYw0piduzzVmgTfE7TgE20b75wFo=;
        b=Ax8yH8isfoZxtMJC6RJlp75qgqodUcMUVKN5X0vpMJPBCjmR8dCNnH4Kqf7ywvnxG3
         EJMwOCZqOQ8SpFwLRIDn5NJ1xCpvVQ1x/SK6mJhH5N4okvk9GeM6nSvhJm4cZvciLGvJ
         YLt6FWKKLRNnsR/9h7e980OvmCwiotYK2gus7HM0RJOhCiK+7j0IpkJIm+X2mBqPKtFs
         rP2F5V++Wklurx+0QsAnn4y/xbbEJOsZyGnqR6cpv5gSf1hs2xndAkTn0wJovfz3G2R8
         pDQfgDS55kJVSpMS6ijYizMSUGA2ThiOSWbaj+Da+yKQiKLvp5UsiRf0oqcaTh1p/0sI
         /tHw==
X-Gm-Message-State: AOAM533ZGWiwvzZcSZ/pWAK2JeNIPehxbmiWdtVtoS/Jac/ZoIdXk9eB
        euA2V42dccBWpPnTBGkIQDA=
X-Google-Smtp-Source: ABdhPJzhXXNtuBJ8yoO+1HtYnSrcY0NT5leNbsFJVL8E7Ygis/FzOor4P2uMzs8MxnmUAzDpZKcV7g==
X-Received: by 2002:a19:c3d5:: with SMTP id t204mr11777364lff.216.1614687063105;
        Tue, 02 Mar 2021 04:11:03 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.02
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
Subject: [PATCH v3 04/14] ARM: tegra: cardhu: Support CPU thermal throttling
Date:   Tue,  2 Mar 2021 15:09:53 +0300
Message-Id: <20210302121003.15058-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable CPU thermal throttling on Tegra30 Cardhu board.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 43 ++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 42ea949953c7..844ed700c0e6 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "tegra30.dtsi"
 #include "tegra30-cpu-opp.dtsi"
 #include "tegra30-cpu-opp-microvolt.dtsi"
@@ -341,12 +342,13 @@ ldo8_reg: ldo8 {
 			};
 		};
 
-		temperature-sensor@4c {
+		nct1008: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 			vcc-supply = <&sys_3v3_reg>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
+			#thermal-sensor-cells = <1>;
 		};
 
 		vdd_core: tps62361@60 {
@@ -440,21 +442,25 @@ cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vddctrl_reg>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
 			cpu-supply = <&vddctrl_reg>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
 			cpu-supply = <&vddctrl_reg>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
 			cpu-supply = <&vddctrl_reg>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -637,6 +643,41 @@ sound {
 					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip0: cpu-alert0 {
+					/* throttle at 57C until temperature drops to 56.8C */
+					temperature = <57000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: cpu-crit {
+					/* shut down at 60C */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
2.29.2

