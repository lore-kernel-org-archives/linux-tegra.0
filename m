Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB73C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F77323B08
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbhAVUjt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729432AbhAVU2g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:36 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05037C061A31;
        Fri, 22 Jan 2021 12:25:18 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b26so9277169lff.9;
        Fri, 22 Jan 2021 12:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tCPOGICj2b4NVYMtjuIaooAHSKRaMEZkLwRHIwm/N84=;
        b=O6nnrrcyQUue6aVjWEuVNpO79QgORPMDudb60cs4sO2SC00nMU5cgWcbyeWNm5QfKz
         JujN9FaUq2cIMQ/D/x2Xpwj2iWCiTy32qj9pKeYivroKWOcgbNchICK64fnHkenIe13o
         V79UINVpWF4LZ6BZaH8zq8eGeBu6JObaaupPTQFlgq9s48FmewODUnhRAgXtrrRLSU7T
         yvWMDMt4Oaw1iRQY16+VWGaka8XJD9xSRS6NMQ/kwtDUN4aWGRP8qQpBWkH0fjEoxkn4
         yK7yyAH03uMe2Ktw+/vEkMheNQF0u6h6JFfvGwXSvxe54HMd/cg2luxNfAwTs4bpZL9p
         WFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tCPOGICj2b4NVYMtjuIaooAHSKRaMEZkLwRHIwm/N84=;
        b=AAjD/L5YWwbiCYwcJFIsGlRx7WCXS6JNszxmuChcIJH+oO8cXVT+0oDRU4A9sP64GP
         xMmCYdDMm/Pa2SM1SjL/qFq+0+gMcm/p84a9zE51Gg63301hpmFZO5pJ2YQ6rn6R7jyQ
         u+ELIX2UT6yjilYgLUwdrF3v+XBCLE5ISARwupnMW/a4blA3tKG5Wzu8yWuh2nkmkLqi
         A5ez3uEX/og6oBsU06UDUFihrSN0w9oUbF0AeFn9D1NT/oIeUNYvt1qYOL/CCYmt1Wbh
         BSWg6nslDBBC1BolUr4aAHA3NpAJLx+i3UWUy8ZJfo5Be9f9OD4tmtxt/GokqodvLe/9
         2Pfg==
X-Gm-Message-State: AOAM533bAgkeb7VUouTK4qYcp6QKS/y5kg+SzJghRWrJzYViSChBTyFo
        RYkU9o2ioAvhEgDwrrukZ6M=
X-Google-Smtp-Source: ABdhPJyNHlN21foghxCBgaVXHuqT1jjObVwAD9ykruYCJlD+kAgwHWQK5LoUn8xbzHtlKCppzwDikQ==
X-Received: by 2002:a19:431b:: with SMTP id q27mr2940835lfa.137.1611347116592;
        Fri, 22 Jan 2021 12:25:16 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:16 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] ARM: tegra: ouya: Specify all CPU cores as cooling devices
Date:   Fri, 22 Jan 2021 23:24:55 +0300
Message-Id: <20210122202457.13326-12-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
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

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-ouya.dts | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 74da1360d297..b92477ac29ac 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -391,19 +391,23 @@ cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
 			#cooling-cells = <2>;
 		};
-		cpu@1 {
+
+		cpu1: cpu@1 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -455,7 +459,10 @@ map0 {
 				};
 				map1 {
 					trip = <&cpu_alert1>;
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

