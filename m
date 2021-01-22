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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE030C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBA6A23B04
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbhAVUal (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729915AbhAVU2l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:41 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682A4C0611BE;
        Fri, 22 Jan 2021 12:25:09 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p21so4204630lfu.11;
        Fri, 22 Jan 2021 12:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jr+FVUJQePudpvhgS8HkVhJONS+IB09AlY+GXEewA/U=;
        b=sRS2Ll95Wh0tOQzMXYxP030iheOICZFocnowEOXpJ/dOOijK6GUWUAxJgSAjcJEemr
         jBcypUR1Cj4LGeKeEDRpjCJBtDj+D/EEis+gvEf3P9Cr4n/X2YTKwuxrpwD00EmAvoxI
         eUErV1yiIDuIckLcFtk8By6RT8HVX785y9rn6jt5E/3EY6LvnUZ8SvmnwgcwmPSTpy4h
         U5pFrbJHN+3RHXfcgDipEj+3NpRNIKNkcWQ8xqaLTsWQffCHdA066253304JC+MTnRFn
         XbMBN4hjkTEei1usON8PweqjGrPHrp+8PkIjZ40Bl9ws1N2hqEXqzRIzyKPRK50mKIt9
         Z3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jr+FVUJQePudpvhgS8HkVhJONS+IB09AlY+GXEewA/U=;
        b=Y8WZ5HJ0BUhNZa8NsouK2irOEeM0Ej6q3MpvgX5HoVi2aB3nXcL5KR38jBBC5Oycqv
         41dcHQ+AgCSQbrxAGsbr1O1IfcH3omUoTWZMsgugUoMHVjILaLxwdTZFg4zlNqo0W3Gx
         8typxYQq9+tkEqXcLPgyijlbNUCCDHTshAMKFLqX6tlaUmRd7HZw/wHW05iB1Y7//FcS
         eQ7hXHtflwliolhE+Wqqn5c1ua37L5I88UZY+drW7tM7aHBUP6XY/NAth0HwMpYloxvl
         XGBSCLWFDswf5h2VvWAn2awIYQ+HZM6CUUnWvRl+0422IvQ7aBzsFl8NBSELIA1PppO/
         awUw==
X-Gm-Message-State: AOAM531+2vVJPkJkeLBXWDbGBCOo/H6XHMRssx6/yMDVWFsKSdRgrcYf
        J/R2iEQs88/Kq3vFsa5oZO0=
X-Google-Smtp-Source: ABdhPJwfNvpT+v6TG/N83XsL+ckmbPI6XKXVjBQl8UIDtvYxpe9OwzbLlKemeSKjRLa4T9Kgyycchg==
X-Received: by 2002:a19:e95:: with SMTP id 143mr2509527lfo.420.1611347107997;
        Fri, 22 Jan 2021 12:25:07 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] ARM: tegra: ventana: Support CPU and Core voltage scaling
Date:   Fri, 22 Jan 2021 23:24:45 +0300
Message-Id: <20210122202457.13326-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
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

