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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077E8C28E8A
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D50F264E66
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377926AbhCCDbW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350252AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CC3C061225;
        Tue,  2 Mar 2021 04:11:08 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id n16so13970319lfb.4;
        Tue, 02 Mar 2021 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qXZh7vyQ2J2UJfaf/gy0esqvLP8/x2DgurRZz5ydknM=;
        b=qM3CGaGIJBgtmI5H06yQQ2TKgKEOII778Lugl1ESmwGrTmmTyIP3yZzWT1rzYwlLsR
         g37nMmYJc9fRme1zkK+xUx+WA23htLrOkgL3HaOsdaLJMfBmysPIDgoxeYxo5b0eRBOk
         osUeif4pxGmP2xvph8N6nPojVyHFtxNRkAV/T0X7b/6nqfgbr2a+Ua4lCOfz0AfNZwLJ
         AaXxL6K8wGPLUnhbLuQxBbLfDRYz4sUiqH+a+KMNniwcu/YdcG18925MLYcqPa+054l9
         gCrYMYDviWczE/9h6439cQbEhTTWa4tnv9nwb9P0iCkFn/jJ3qM1xN8Xjh7lHd0BrYXm
         pA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qXZh7vyQ2J2UJfaf/gy0esqvLP8/x2DgurRZz5ydknM=;
        b=IQGzzmmQwfT8ZEKPURroAGcuyg0Kt/IyQdFXcPeaCyic3koJ8FYppWjDOxHyCYPWJh
         +YbfWngVxRBL6Xu0/yTm/lkmB/27cLfddiABweqlQ4hgy6vBj6Iknopvo3t6BXC0eN3p
         gOoTHtt9KMT+vkYf6N4oRf2pCb8e3u64iF1k3/mNK8Dz1GitTorr28LPJsQHodenA5Ma
         pCSSEumSeFh14iyAGVqhRZlDDRz9E50nt3VVxO333Rw+sx51hS8kwxKI/WQ2kANrpZyH
         rFN1n1fnTsrt4wpMz9jsxy3s1i5x0a18ZAqGtd6bPDvv8O+ZpRheRAKJdcxnJlw3gRfU
         6XlA==
X-Gm-Message-State: AOAM530M07R4u4hB9AYUZC/A8JbXahTw5TNoMvclaUVoS3JAHPMumG3E
        eUnuJoguEZS/BRfnlZtriV8=
X-Google-Smtp-Source: ABdhPJylLZg9i+IgKfmE0uWJ54dl5Mc2qTkXuWavJ1DC1s8zbyC+QEKL7vCMjDBoVG+8YJadw2Zfvw==
X-Received: by 2002:a05:6512:11e2:: with SMTP id p2mr12040376lfs.321.1614687066814;
        Tue, 02 Mar 2021 04:11:06 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:06 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/14] ARM: tegra: nexus7: Specify all CPU cores as cooling devices
Date:   Tue,  2 Mar 2021 15:09:59 +0300
Message-Id: <20210302121003.15058-11-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If CPU0 is unplugged the cooling device can not rebind to CPU1. And if
CPU0 is plugged in again, the cooling device may fail to initialize.

If the CPUs are mapped with the physical CPU0 to Linux numbering
CPU1, the cooling device mapping will fail.

Hence specify all CPU cores as a cooling devices in the device-tree.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index ac1c1a63eb0e..dc773b1bf8ee 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1056,19 +1056,22 @@ cpu0: cpu@0 {
 			#cooling-cells = <2>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -1281,7 +1284,10 @@ trip1: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&trip0>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
-- 
2.29.2

