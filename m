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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CD1C433E9
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C82BF23136
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbhAUSrK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbhAUSYo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:24:44 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6126C061788;
        Thu, 21 Jan 2021 10:23:26 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id v67so3901009lfa.0;
        Thu, 21 Jan 2021 10:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=duV5ElGdUvTbPkj+FhR7c1zjwfK1d0OalqOFUHgKQr0=;
        b=r/CC0X1jGoqINR7+o2WdiOctMesKYe2g6G+QN9mzziRijj74Tc1B0f+L+df5FeU0oH
         T74vyMzo0ZeqcVCvggSZY/2nRULlon7HcI/q+9l/d7LnqnnkkSH0lpHyFOhfo3RF7qKl
         8hGZxP1dE5Q7kTvpkWhd+rKsxhH9aYSkAe9ex4PWdhjzDWB+t35FMtHALIcGg/BIUMo4
         uoWBFT3+MD6f9IMACNY4bRz84hOYSGt+TL1Pyjp8Tg+cpRIGUwCeZ3gagAzxlwdoaGMq
         CMWbtuUf3Q+1m+ufsNItjrfSs2Aa4HTIW4AiySJngZeG2ykqIV99pGLICf5yQbYpSYXK
         KH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=duV5ElGdUvTbPkj+FhR7c1zjwfK1d0OalqOFUHgKQr0=;
        b=GDDF9y2gDrO1gI9DXRGdxIl2snqr2zi9ZxAGoPvm+NS3qtGjj2LTvzyGFIevZ3phsE
         w+2heIWB4txDp/4nd+/WIIVI4/HQ3vBpOdBTkwKHSfaLf+jJCVpSNtpy9kSDH1BM7DcM
         6p4jJy5iFjk4ia6oeiV4xbus56aTPjx3EXtd6+/Kw1yu/UI3bQNdH5VR0h22SnR+XkdO
         Gzfzk6Vdf8wsbxTGoYTNq1Z0kbZ9wMZSLG6/ZJ90ErEFahXZhjNcRvE6Dck6DWZbfxcO
         gPoDY/i03+QLO2I62Uny2Y0SjSVTbvGQAfKd8awftK2BkIrZ+l5ZNWRkaziL30z3lIfO
         XiZA==
X-Gm-Message-State: AOAM530ifDGapcndKwgSsJn/eI1ifXhKAdzZ0XIz4EMxqOnrtZ6qiaHo
        ooEQ+FgmjOvEuLlsH1PhsOQ=
X-Google-Smtp-Source: ABdhPJzto8tgpwPfJ1V/D7VzNo7V1Dok9ZmYTjobOr5fMKlAzQ+9npsM/2RMylAcOQZBHtJTSaT70g==
X-Received: by 2002:a05:6512:2356:: with SMTP id p22mr214326lfu.3.1611253405201;
        Thu, 21 Jan 2021 10:23:25 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:24 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/13] ARM: tegra: cardhu: Support CPU thermal throttling
Date:   Thu, 21 Jan 2021 21:22:59 +0300
Message-Id: <20210121182308.16080-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
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
index 309538bdcd66..2dff14b87f3e 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "tegra30.dtsi"
 #include "tegra30-cpu-opp.dtsi"
 #include "tegra30-cpu-opp-microvolt.dtsi"
@@ -342,12 +343,13 @@ ldo8_reg: ldo8 {
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
@@ -441,21 +443,25 @@ cpus {
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
 
@@ -638,6 +644,41 @@ sound {
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

