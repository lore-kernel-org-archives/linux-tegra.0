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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00DDC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A06C23B04
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbhAVUj4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729335AbhAVU2g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:36 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30894C061A30;
        Fri, 22 Jan 2021 12:25:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id v24so9302221lfr.7;
        Fri, 22 Jan 2021 12:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qXZh7vyQ2J2UJfaf/gy0esqvLP8/x2DgurRZz5ydknM=;
        b=h3Qiv1RPOU4S+M0qPeisfaWdOfnJopTJ7b9eINAfPcNwpdqlN//YiGfGhN60o1RX46
         p5H35f/Oq6T3VGRf2EG0nYAw9vXUVf0P3Yrqh+k19OCJBRBo0w9qc4mVdmmHoTaKS4An
         Tf5gNmMJudVjribBkExEt1fqkG0ARzAEDutzAUICq7laoGA002P0NZHCvR/S0pgCF/8H
         qQkBCy8OZQfaH3DtWonPomLK5ei9ZrMK8T+YUEBj0Mg/VGoUlBziuBVs9hB3ATQycoyR
         IlkB8rZbVZYF/H6Yx0RnPlz45zvauzmhJTBuQ0prArhiPN0voGieKC9RTrtrC3nn9U4m
         Kwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qXZh7vyQ2J2UJfaf/gy0esqvLP8/x2DgurRZz5ydknM=;
        b=ap0RtN7CgyC8fa1yGAbR+5sD7MSH8iFx6r+eZf4tW+8dJJ4lt8iU/xhjqZj5NCcpn0
         0QKSnn7fhy+Hf3bms/YgZNhLzCjMHjk/DpxVejYeqZQLqZk1d5S/a+svSp2E7qE0CP57
         BFXnL+P6kpsep2Jmb78Oe+7wa0luQZDI7paDbslA7VtsW3PV4ygeDa49gJDpKZad9fRQ
         vohYZ5qxckZ5cYAmaoNcqPpmmXI+5GKWwyp/nNW/2Z9OZNzzB7TfwaxlZU+Rxr8FBUMq
         y9wtfAPLOZgdIyFVGjLIrdrNhBO0skzjXfk0ysVtNqHRilabwhkSLaxc39xqlqZVduXb
         3R8A==
X-Gm-Message-State: AOAM530wmF7GXuO0UHTUlR231ppdJlh260bDGnmbGL7/1iI9OdOUjKSL
        sPCWJ3nXrAULa00VhVfd4OA=
X-Google-Smtp-Source: ABdhPJxkYY+cqu8fJ6Y1dXWx1aqcootYYNFBOyg/oDG2fjtURE3U3f4mlJLIHRK9qWO7cKMnBLPzQA==
X-Received: by 2002:a19:ac45:: with SMTP id r5mr480438lfc.305.1611347115728;
        Fri, 22 Jan 2021 12:25:15 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:15 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] ARM: tegra: nexus7: Specify all CPU cores as cooling devices
Date:   Fri, 22 Jan 2021 23:24:54 +0300
Message-Id: <20210122202457.13326-11-digetx@gmail.com>
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

