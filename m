Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDBAC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 316FB206CB
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbhAUS0o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbhAUSYF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:24:05 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F53C0613D6;
        Thu, 21 Jan 2021 10:23:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id v24so3872914lfr.7;
        Thu, 21 Jan 2021 10:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jr+FVUJQePudpvhgS8HkVhJONS+IB09AlY+GXEewA/U=;
        b=tIb4AQXiK2lsWjAUvG8JTouZutT6lLu3mSZcjJMaNb0oaf8E0ss1MJ7S7f8O/QAt0W
         COiW9yxy/7DhZ06gXjMXeZ1/t9J4seKLXrJDnJBJfyHZiX+iW/vjwU56zqXwv/S54axc
         ZBZVeezbBcV0oY+CafDgkbtLmrpzRkff9+SOrOBmPc1BYgM6fbNeu4G8MOxePvrNDlx6
         xhqYyDC6+P5T7A+qCipimv+3Z0NhK8YGtXrjjJX4GhcETuZ3/Yw2QnJe9GeSbjJwLOMO
         SaNgNJDv+Mu4D+L/ut3rMlAJkYz7rPfmfDPUUG4NgJXybWSRLa+MS1vaadWPLvan84jh
         MidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jr+FVUJQePudpvhgS8HkVhJONS+IB09AlY+GXEewA/U=;
        b=N0wUNscg0uV5mqLG7IwU6zssdpWxn3KeZK2Pwp78EsbHKU7U9PjiG+4RLnc/s2Z7IC
         L94HV0cRgnZl7Vq30am1zw8jEyERLamn983ATRhA8FMoADvnPmGE6l0EUKGiigbHFxdb
         dsr6dtC04AN2nc8haBjY+yzIOJFKEk89i9ANJfuQdIKz7ZxwowsOk4p4vz/Ua46hE5hq
         Mtd/TOlmJD1VPZCXRhxHaL/aDFrMeuFxzITm7gTodiwOSrAPWylwMUuUPD02VdaMTOpF
         3uDmORyiq7CU4HhaY3p5kPoHVVS0s2BqCeqeEffi9ojOMzD2T2Ihs6lcXZ0NE9mURGeV
         csXw==
X-Gm-Message-State: AOAM531a+UBmzWlEEuNpF9pY2lTsfrSbvgp2OPM8Hc1BAyiX4FVfN6Uh
        C2yLcp1DLIjUGDZB8/xmWJ0=
X-Google-Smtp-Source: ABdhPJwnLEXkmfqwIduMwuui5ruFFxhXCNvhEiyvV53j/k7jX7R5S/HBNz0VFnHwYFZAAeVIWnjJwQ==
X-Received: by 2002:a05:6512:328b:: with SMTP id p11mr225371lfe.356.1611253402536;
        Thu, 21 Jan 2021 10:23:22 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:22 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/13] ARM: tegra: ventana: Support CPU and Core voltage scaling
Date:   Thu, 21 Jan 2021 21:22:56 +0300
Message-Id: <20210121182308.16080-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support CPU and Core voltage scaling on Tegra20 Ventana board.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-ventana.dts | 37 ++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 055334ae3d28..02b94ed722d0 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -4,6 +4,7 @@
 #include <dt-bindings/input/input.h>
 #include "tegra20.dtsi"
 #include "tegra20-cpu-opp.dtsi"
+#include "tegra20-cpu-opp-microvolt.dtsi"
 
 / {
 	model = "NVIDIA Tegra20 Ventana evaluation board";
@@ -420,18 +421,28 @@ sys_reg: sys {
 					regulator-always-on;
 				};
 
-				sm0 {
+				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
 					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-core-regulator;
 				};
 
-				sm1 {
+				vdd_cpu: sm1 {
 					regulator-name = "vdd_sm1,vdd_cpu";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <1125000>;
+					regulator-coupled-with = <&vdd_core &rtc_vdd>;
+					regulator-coupled-max-spread = <550000 550000>;
 					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				sm2_reg: sm2 {
@@ -450,10 +461,16 @@ ldo1 {
 					regulator-always-on;
 				};
 
-				ldo2 {
+				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&vdd_core &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-rtc-regulator;
 				};
 
 				ldo3 {
@@ -595,10 +612,12 @@ clk32k_in: clock@0 {
 
 	cpus {
 		cpu0: cpu@0 {
+			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
 		cpu@1 {
+			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 	};
-- 
2.29.2

