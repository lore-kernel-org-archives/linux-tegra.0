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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41130C11F66
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2982761059
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhGKXrt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbhGKXrr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:47 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EBEC0613EE;
        Sun, 11 Jul 2021 16:45:00 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id d2so7669301qvh.2;
        Sun, 11 Jul 2021 16:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z64X4Bjo7bOqkNFciGParEdzoTdYBC/xDLLBMEJIUck=;
        b=PilgEoknR62IXYU7dxXIfKl09+Yfl8TSdakqfOJc2SwyaLyM16U1bySQ7eWHHYrDMZ
         W+pVBxemlJ7+rVBrNGPOsQTM48ROW0dpSw7Y3sFbw/HnOIs5ClpU9gn+/2KhMuaCZh97
         BBvy2D8vYmyOm3XLop4OR0tCdzJex0hCnEyj6Smqq7TKSfz9bLK4T9pneSwtOhyf+dLW
         ZTxj3WhiAGh5x+dpUVYIlsjoNMnRlXyaBq/HQ5tKUbv6Q2BifyeRd7nctsneXYJmJeW2
         D9qHCkHzhTTx04oWYMBVZEMN1hn6qutM1UUHdyE4o10Ebv22tKBwa4JFc/npi80ly9vi
         wC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z64X4Bjo7bOqkNFciGParEdzoTdYBC/xDLLBMEJIUck=;
        b=Eb+OspEg1gKm5gVW3KegClLO+QqF2ZwudmhW+vn1kuB6735cvaCTwyRW5P3J2SefEN
         IPq/Penc5ijyFqdJKXD4DmJsf0TaDxc7acnXdyquoT1cFq9sJ0nBz5G8yhl5gewuK7hX
         PtM48Uh3CgNwnjQpF552DI8az96ffH3ncYa9q/kevKpDuhjrqrFbJMaKq0uGmep+IFXb
         cyEMoORZ0OidUsQc79bVX1ipumWkhHSsKMdO8rteMbXcVy4oc6rf9Grt7QYDvdGCKlsB
         U5gwA118iAiWiGMNXNyZR9vqXJaQcQ5T1ZVVYeDEqnl1cqMcs6YbMwUd9n7HBYiXCB4/
         lN7A==
X-Gm-Message-State: AOAM530m1qA4mRlH6p52j7AUhJd8dwUwIjJ2Xv8YRZJMtuaPgm6ZL0bH
        5nLzfapPrYSmbGm9KpSPB/g=
X-Google-Smtp-Source: ABdhPJzaEiOqXzw/S9JTacD+ukq04AXOrk4KuUnb6VDBDvMGnFI+SAtRBIHBAA28qMPpjK/gUcskqA==
X-Received: by 2002:a0c:e208:: with SMTP id q8mr5140201qvl.31.1626047099718;
        Sun, 11 Jul 2021 16:44:59 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 13/13] ARM: tegra: nexus7: Improve thermal zones
Date:   Mon, 12 Jul 2021 02:44:03 +0300
Message-Id: <20210711234403.24691-14-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use skin temperature for maintaining temperature that is suitable
specifically for Nexus 7. Add CPU thermal zone that protects silicon.
All these changes don't make a significant difference, but it is a
more correct definition of thermal zones.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 33985fca956f..9732cd6f20b7 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1255,21 +1255,34 @@ sound {
 	};
 
 	thermal-zones {
-		cpu-thermal {
+		/*
+		 * NCT72 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution.  The "skin"
+		 * zone is a simpler solution which prevents Nexus 7
+		 * from getting too hot from a user's tactile perspective.
+		 * The CPU zone is intended to protect silicon from damage.
+		 */
+
+		skin-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <5000>; /* milliseconds */
 
-			thermal-sensors = <&nct72 1>;
+			thermal-sensors = <&nct72 0>;
 
 			trips {
-				trip0: cpu-alert0 {
+				trip0: skin-alert {
 					/* throttle at 57C until temperature drops to 56.8C */
 					temperature = <57000>;
 					hysteresis = <200>;
 					type = "passive";
 				};
 
-				trip1: cpu-crit {
+				trip1: skin-crit {
 					/* shut down at 65C */
 					temperature = <65000>;
 					hysteresis = <2000>;
@@ -1289,5 +1302,40 @@ map0 {
 				};
 			};
 		};
+
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct72 1>;
+
+			trips {
+				trip2: cpu-alert {
+					/* throttle at 85C until temperature drops to 84.8C */
+					temperature = <85000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip3: cpu-crit {
+					/* shut down at 90C */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&trip2>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&actmon THERMAL_NO_LIMIT
+								  THERMAL_NO_LIMIT>;
+				};
+			};
+		};
 	};
 };
-- 
2.32.0

