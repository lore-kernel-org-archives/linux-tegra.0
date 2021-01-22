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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67670C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 340B023B08
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbhAVUtZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730166AbhAVU2Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:16 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C959C061A10;
        Fri, 22 Jan 2021 12:25:10 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id u25so9318074lfc.2;
        Fri, 22 Jan 2021 12:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y5maEnFY9Zpzvtrt4gFbzNHegl8kGjroQ7s0Tf+aY64=;
        b=spoQj0rds8JfYXbZoffudNfCCzNNrRddnpr5dHrpUhijqRGeHZDUltbwtb4/vXX20b
         tWcgegmIraGBKQW6c0SylymZLvViP/cMdChdw/7q/nM6WHRcAXc+LYddVHS82ungxmaC
         e2sJq9tvNb5ssn2k7/tPdzjqCDLFQiKOXmW6R6Wp50/TAJ4aII69aVaAFSXNJF1gh1+p
         J0EYE+GstdksMHQ/ocMA92II0qv+fM3xCAijILXRSyyzIH7JOFYIiW8SWJhgO80VH+q/
         TUq7Xfkv7BmrMhFipH3v/SUvJ5eLaxpoyqTHaZfhU+AGX0cWRIISRWo05axJSaNfYQ+4
         USkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y5maEnFY9Zpzvtrt4gFbzNHegl8kGjroQ7s0Tf+aY64=;
        b=NofbKqIUnw82IBUQ1MZJvBZ3Hc7FY2AUdS7biQ3DtTZ55olQaPcoo2wKVsrhW6BhT7
         UvFNGsR1SUvozIw/kW2Sc/VxItLFKyHlVGYuYKiyMQp67y30haxT1n3EFn3nB2RZWfSO
         GtqMHY7FNA/URpy8mAX4FlGlE8lzIVHDFe2Ho8WjCPWm7F3BF2d+7bqsQSbcgU6iaK00
         aisIaDwwl4R3yHwt3uuvsVsFRnMm4DBipeYaEN+f/UJNw0QpK7e+vzZbDnr73nYM+Fhg
         frHPcJb1cS0Y09xyRA4BUAZ1g8ezk8Ak8NgYubA5tYlmcK91ot/EEXPplqG4yQxBuGKs
         jPYw==
X-Gm-Message-State: AOAM531655+e0PEg6AYfCd63xCuq8MXic8egLWlkWO3rZRiBILFtYPrh
        CkAmGXAo5s2YlHn7H9DoBsQ=
X-Google-Smtp-Source: ABdhPJzYjQFckpgx6fGiKRaGoLQPEDYv0mWrDhMhNxs7zVD47qsTHRtpkVHEaP/bsXXtJh2WZT2P8w==
X-Received: by 2002:ac2:5b1a:: with SMTP id v26mr3175796lfn.286.1611347108819;
        Fri, 22 Jan 2021 12:25:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:08 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] ARM: tegra: ventana: Support CPU thermal throttling
Date:   Fri, 22 Jan 2021 23:24:46 +0300
Message-Id: <20210122202457.13326-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable CPU thermal throttling on Tegra20 Ventana board.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-ventana.dts | 41 +++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 02b94ed722d0..99a356c1ccec 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "tegra20.dtsi"
 #include "tegra20-cpu-opp.dtsi"
 #include "tegra20-cpu-opp-microvolt.dtsi"
@@ -528,9 +529,10 @@ ldo_rtc {
 			};
 		};
 
-		temperature-sensor@4c {
+		nct1008: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
+			#thermal-sensor-cells = <1>;
 		};
 	};
 
@@ -614,11 +616,13 @@ cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -716,4 +720,37 @@ sound {
 			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip0: cpu-alert0 {
+					/* start throttling at 50C */
+					temperature = <50000>;
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
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
-- 
2.29.2

