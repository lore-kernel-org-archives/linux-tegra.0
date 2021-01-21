Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD45C4332B
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FA2123A57
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAUSrh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:47:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbhAUS0A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:26:00 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA324C061797;
        Thu, 21 Jan 2021 10:23:31 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id q8so3856851lfm.10;
        Thu, 21 Jan 2021 10:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qXZh7vyQ2J2UJfaf/gy0esqvLP8/x2DgurRZz5ydknM=;
        b=B1WnslMyVrxWMuOGS2ylENr8VsLJ5E/6MrPGSDvWp2tl+RGRxKd1SkHUwojuHsjv7S
         iV1QUgFUWDae2Br6D/yC3ZDvZ81u5fxq1HhfCpAV9g/OcKyFLx11qHoD5Nj8WFQirFXt
         K0zvZ2jelh454RFzkfCAOwv0niChY4VPXbG0ogSghdBu0WfmNKFKn57QKKfGf2jxDVTV
         DNxmON+/2843y1CTkebOzWKFFiw2S5r+4LT4Rk8CsBKV6+QeaUwaYni13x8nPJxGzJIy
         FaVkJiD10jEFBJvtCaNCuNf9lVqvQgZm+tNCahwpscPMPrDu1Hb2P6WKgg34VF9WPmun
         BvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qXZh7vyQ2J2UJfaf/gy0esqvLP8/x2DgurRZz5ydknM=;
        b=qHcl7b8jMqgG8B127fn9bgjeB17wqs2t2Zui4JSLMCGw1MZ5XjyIlcS4KSWzcoZz6Z
         f7U9tNma/xPq7TQ/gyrb6cWymQQmOr6PdBnwjg/Qq4rtRmZFqOZ+0LxGKAgZzmJK4tls
         zfzxsg6YiSN4WcPAVLuq153mlwLz4XGIrt/K92Hupbq1KcvmFDWDh6F1WHmntMQv5DNZ
         yDmNcQfXg3hRFIqwINDyCxih6tCE6ILZMo+WhYk2FpNTz9rOWbs++jWAfnFF1jf1vZ+5
         PdFAf7/sQgQD6xIYUq6T0QJYVPs3Cz7FZ/worYRB8FQFHOP0PDc9w8gV8vE1l0UFyNBx
         NEUA==
X-Gm-Message-State: AOAM532mMNZgKFNpYRsa4XZKr32/jsldg/VyoKtdOcyaob5kdo1ZdUiU
        3Rvw95dIPRGHYYfOfnDnaAU=
X-Google-Smtp-Source: ABdhPJzkHjyfygys1XpqzR0zHpDxBxW5NYowsVNXHxzy9IN5Mz1VCOlHbh3/IQ0WVzcuyoE5f4dTUA==
X-Received: by 2002:a05:6512:330d:: with SMTP id k13mr16088lfe.173.1611253410281;
        Thu, 21 Jan 2021 10:23:30 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:29 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/13] ARM: tegra: nexus7: Specify all CPU cores as cooling devices
Date:   Thu, 21 Jan 2021 21:23:05 +0300
Message-Id: <20210121182308.16080-11-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
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

