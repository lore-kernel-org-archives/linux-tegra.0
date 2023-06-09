Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE074C83003
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 13:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241281AbjFINRa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240122AbjFINR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 09:17:27 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBE7E43
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 06:17:18 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so3068472a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686316637; x=1688908637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wuMU/N2kjzRYaKy0HsTMcuMyGz4jCt7wD2SIYWCfuc=;
        b=BMJTYRHOnfSlD8wC6Uvx/3EJidWg9SCsQbz4h9s6gAT06dqOji4fSY3OGF59ncvfw2
         oOgDpbN5kEYrX5y0iWmJI5/PVt9myTn8JEfv3HowTo2SGkoNAt+UZD/3MnKa7rWISovI
         jkQLDVBIqNWzf8TZswAWdNSEKG9dX2EKrXZqKqjBnx6mDIgv8PqSYkHGZPU/VaCAtFk8
         htU8aaB2dKtwse4GlhyK8LZ8LkYMnhXhVDOhuTqimYr6YgMd1en60QfRevPpq5AJHzs+
         1JQzPK7tcp+8b3Nioc2OktwTGY0fpgo5Cwo9dh8H4dyUPbEC8lmir+JBJWSld3JZRyr1
         A2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316637; x=1688908637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wuMU/N2kjzRYaKy0HsTMcuMyGz4jCt7wD2SIYWCfuc=;
        b=PEL9x+XVdksR1W/pF0TXI6p0HZRBNk/tQcz5EGNlg1XBRqbbZBEwoi2HidJUy4a2q9
         hw1qdcm4/bpp8PPGkfpK5lAY98c4tbuHDztKxjCBXbn9b/kFGCCpKcsI7Qs9MJmYRCBq
         dSoZd9ibHFJcjo+rD2KOVFIMjip9+vhpmY8dDY1UDdqOJpHe36OkPOAHfY7ZopaXkBja
         dKUZJzed4qRE7xFJrIXQ5bj0NF5TZlnc1duHTXL2KIoEWMBp5Qx+DDVyfhzLY8y3eSgi
         XtdWGLKZUxEmI4ZxEtsOL6GCmzPYnmMmJIdP/ZnOChUX18EI7OqZpgVdSuKUE8vzdVrw
         uaKw==
X-Gm-Message-State: AC+VfDy2h135rqnEQtjHFqVSBIytVnjnpv+FYxY3r3kb5tXQMz2a8841
        U/Ue29PEVmqo6JYrDvZuEzNd8dIYv3s=
X-Google-Smtp-Source: ACHHUZ71DRJUSowSyjTIhSpM1jnpaGtuu8n8wV+FC7ZAg4JkkP6Z78+j/SV0By9ya+CHwmZKoMgNRw==
X-Received: by 2002:a17:907:a40f:b0:96a:63d4:24c5 with SMTP id sg15-20020a170907a40f00b0096a63d424c5mr1951682ejc.77.1686316637169;
        Fri, 09 Jun 2023 06:17:17 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id dc18-20020a170906c7d200b0096ace7ae086sm1294767ejb.174.2023.06.09.06.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 06:17:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Yi-Wei Wang <yiweiw@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] arm64: tegra: Enable thermal support on Jetson Orin NX
Date:   Fri,  9 Jun 2023 15:17:10 +0200
Message-Id: <20230609131711.3826912-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609131711.3826912-1-thierry.reding@gmail.com>
References: <20230609131711.3826912-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable the TJ thermal zone and hook up cooling maps for the PWM-
controlled fan and two trip points.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 60 ++-----------------
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 23 +++++--
 .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  |  1 -
 3 files changed, 23 insertions(+), 61 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index bd60478fa75e..a8aa6e7d8fbc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -99,74 +99,24 @@ vdd_3v3_ao: regulator-vdd-3v3-ao {
 	};
 
 	thermal-zones {
-		/*
-		 * This monitoring is far from optimal, but it's good enough
-		 * at this stage.
-		 */
-		cpu-thermal {
+		tj-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <1000>;
 			status = "okay";
 
 			trips {
-				critical {
-					temperature = <104500>;
-					hysteresis = <0>;
-					type = "critical";
-				};
-
-				hot {
-					temperature = <99000>;
-					hysteresis = <1000>;
-					type = "hot";
-				};
-
-				board_trip_passive: passive {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				board_trip_active2: active-2 {
-					temperature = <80000>;
+				tj_trip_active0: active-0 {
+					temperature = <74000>;
 					hysteresis = <4000>;
 					type = "active";
 				};
 
-				board_trip_active1: active-1 {
-					temperature = <65000>;
-					hysteresis = <4000>;
-					type = "active";
-				};
-
-				board_trip_active0: active-0 {
-					temperature = <50000>;
+				tj_trip_active1: active-1 {
+					temperature = <95000>;
 					hysteresis = <4000>;
 					type = "active";
 				};
 			};
-
-			cooling-maps {
-				passive {
-					cooling-device = <&fan 3 3>;
-					trip = <&board_trip_passive>;
-				};
-
-				active2 {
-					cooling-device = <&fan 2 3>;
-					trip = <&board_trip_active2>;
-				};
-
-				active1 {
-					cooling-device = <&fan 1 2>;
-					trip = <&board_trip_active1>;
-				};
-
-				active0 {
-					cooling-device = <&fan 0 1>;
-					trip = <&board_trip_active0>;
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 7dfbc38eb3c4..65e4b51b79c1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -112,11 +112,8 @@ key-suspend {
 		};
 	};
 
-	fan: pwm-fan {
-		compatible = "pwm-fan";
-		pwms = <&pwm3 0 45334>;
-		cooling-levels = <0 95 178 255>;
-		#cooling-cells = <2>;
+	pwm-fan {
+		cooling-levels = <0 187 255>;
 	};
 
 	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
@@ -131,4 +128,20 @@ vdd_3v3_pcie: regulator-vdd-3v3-pcie {
 	serial {
 		status = "okay";
 	};
+
+	thermal-zones {
+		tj-thermal {
+			cooling-maps {
+				map-active-0 {
+					cooling-device = <&fan 0 1>;
+					trip = <&tj_trip_active0>;
+				};
+
+				map-active-1 {
+					cooling-device = <&fan 1 2>;
+					trip = <&tj_trip_active1>;
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
index bbd68ef93d97..c7291ba27cfa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
@@ -209,7 +209,6 @@ key-suspend {
 	fan: pwm-fan {
 		compatible = "pwm-fan";
 		pwms = <&pwm3 0 45334>;
-		cooling-levels = <0 95 178 255>;
 		#cooling-cells = <2>;
 	};
 
-- 
2.40.1

