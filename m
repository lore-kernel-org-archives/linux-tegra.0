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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69ED5C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AFA423B01
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbhAVUbA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:31:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730192AbhAVU2s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4CFC061A28;
        Fri, 22 Jan 2021 12:25:12 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v67so9323682lfa.0;
        Fri, 22 Jan 2021 12:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hD9WM1TsxClgJGVsYw0piduzzVmgTfE7TgE20b75wFo=;
        b=YdqMBE4Gb7wHzdcQEs3MD0+be8o2Xeq3VsTPTlN7HNVGn9PX3nD1zLW3lcvpo2IOVy
         RN2pfePIOxp8uCJBzmswCZal3e4VE/o59tf5c26rWWEZAmSTu2ZsGIgggO6KgObzvF7g
         GVzO+CV2TnxwKxx9PcpYIGz1aqooqD70T09D3w1evSvLqK8vwZxMx4qbsDKSPwGkNPFD
         VTzXTNHaBvGCThesEs0VY4FcOrlBEOeI82Pziu1S5eKiPik28Ho8nqZ0PjFpwZLFTVt4
         oeLQKLxmpJI7qL6tgS2z+HaEKSmgkQGnOepH76P8+zjSEhK7KA6zT//fOSrN3jb7+48D
         T8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hD9WM1TsxClgJGVsYw0piduzzVmgTfE7TgE20b75wFo=;
        b=nNe+kd8qx6+pAvs5V+OIrtKTrUfCKPWgnZ0w2A8Vyagqrb8748QddlyTF5Us2u4xgT
         ZxBx+CtLIa1ejt7k6NuKIXymaey4LfIZj1b0aX2IADjSGMpfc65Z+qctX4iU+iOA9J1f
         Pske+XnfwGP/65VmDwBmmIyNe1Wg38D3zh+GdkX9FBzezT7+W38nbtCUn3NaBZKNOz2K
         jLbWcdrWjgzbsyVyMTe7jNZS3idLGCiDCvOc6gQM9/1HEPAbm4rjvU1NfcqKuK0GPzl3
         ib3PG2catuEa58V8pSqa3TbV5BHY8D3M72qpescLHXHi26YfhTUpdV3kqdMmEq+6aobL
         ilLw==
X-Gm-Message-State: AOAM533Pw8OGqieyV/ZH7QA+PGpKs3WlcpC212rjQ6zeGo2Ta6bZrVEn
        18PNxO+BAyrcWWZE/ggdr7Y=
X-Google-Smtp-Source: ABdhPJz29HQuM71XZgTMHeE8xZmf2oACgUPQnaVbIqyGzN7oFLWsRU8dPVVYGOs296TtUWN7VcDllg==
X-Received: by 2002:ac2:5315:: with SMTP id c21mr255984lfh.118.1611347110692;
        Fri, 22 Jan 2021 12:25:10 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:10 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] ARM: tegra: cardhu: Support CPU thermal throttling
Date:   Fri, 22 Jan 2021 23:24:48 +0300
Message-Id: <20210122202457.13326-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
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

