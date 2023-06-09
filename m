Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E77AC7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 13:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241394AbjFINRa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241299AbjFINR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 09:17:27 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF8530FD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 06:17:17 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-978863fb00fso320680666b.3
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686316636; x=1688908636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNsqF2JNgtJxtfDRgpH0x/sv3N7c5LSH+4SGXrQ4+o0=;
        b=YenbtP4XBgvt3gNTdOm7HQkIR6UDK88VSO2AvooLbsVBGp7Caj5+CejOjoVZ8WNAeS
         cSoBvXXwkMy7kHagblqbYlj2HTzx5Yhy+JizZDkrh0e+EeFd/Hwm7CSt6mW2ufWZVZYp
         H8rldY0XdSFTgqKIUmrM3hioHFeqqi3mUt7Ps3oSZDqfd6H48cS+EQDs2o6Y+8slfqCQ
         872KvPEW0B/O1p0dcilg9V8h3MKuphCkzxYbeiaSw6MGNl157J9OcCJdltWHg0jUjNAg
         5qhEwF88zaWYlNrSOY+ona6aKPl8kjMhod4OXgv+LJ/ukyzzz/Al3VdXmC1jZztjYKmY
         VdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316636; x=1688908636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNsqF2JNgtJxtfDRgpH0x/sv3N7c5LSH+4SGXrQ4+o0=;
        b=APE9+8Xd0dowqSV+AXzAHOxL2qFDvX2NTZuz2Y9tM7v+HNcLDhoqQ5GKjyUfZNyIYy
         RI5CgHoFCkxhUQX1Mw8zjZl5Zvl9Fl6o1vZuXhohSp8IhXJsLm/NR0JUEKTyAxMq2lsD
         Xedbjq7jVlI1LfVa7Mk/JFDHUckd0fdlwD/P+/dhPYYhyJodozk7Ea1lSafZbH36dkJD
         sJTwaDV8//iqU4G0s2d/w8a1RZw9E866vNrBRjLSnLN6U2k3zr1c2lBFMHzdg2tTlHEU
         drnATtR/XmTSRNFTRqCdXNwIid1wGTiBGNpTU8WnxtGznCjKBGWjSyGv4PDAdR8fo1va
         0HdA==
X-Gm-Message-State: AC+VfDyhzGDQ0VoYeb2WjBNjdi7z5/meS7y/muv4VtPqpKa/tLb0jP50
        JdRbAGPOeYINCPv9wyKhkBA=
X-Google-Smtp-Source: ACHHUZ4tsA4uzZ/yzykybaGapMn4iLz0AYLHiQC4ZbAOJIl4G4fL++dyzHWQjtO75sWNrwCecM2Ucg==
X-Received: by 2002:a17:907:16a0:b0:978:4027:57eb with SMTP id hc32-20020a17090716a000b00978402757ebmr1972174ejc.47.1686316636153;
        Fri, 09 Jun 2023 06:17:16 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i25-20020a1709063c5900b0097899aa737esm1305349ejg.147.2023.06.09.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 06:17:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Yi-Wei Wang <yiweiw@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/4] arm64: tegra: Add thermal support on Jetson AGX Orin
Date:   Fri,  9 Jun 2023 15:17:09 +0200
Message-Id: <20230609131711.3826912-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609131711.3826912-1-thierry.reding@gmail.com>
References: <20230609131711.3826912-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add thermal zone details and enable the PWM fan as cooling device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 22 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 22 ++++++++++++++-----
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  |  6 +++++
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 812499918085..319b3a9cff24 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -139,4 +139,26 @@ vdd_12v_pcie: regulator-vdd-12v-pcie {
 		gpio = <&gpio TEGRA234_MAIN_GPIO(A, 1) GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
 	};
+
+	thermal-zones {
+		tj-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <1000>;
+			status = "okay";
+
+			trips {
+				tj_trip_active0: active-0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+
+				tj_trip_active1: active-1 {
+					temperature = <95000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 303c142303a5..188f6b5ae94c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2339,11 +2339,7 @@ key-suspend {
 	};
 
 	pwm-fan {
-		compatible = "pwm-fan";
-		pwms = <&pwm3 0 45334>;
-
-		cooling-levels = <0 95 178 255>;
-		#cooling-cells = <2>;
+		cooling-levels = <66 215 255>;
 	};
 
 	serial {
@@ -2430,4 +2426,20 @@ sound {
 			  "CVB-RT DMIC1",		"CVB-RT MIC",
 			  "CVB-RT DMIC2",		"CVB-RT MIC";
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
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
index 022a5408d869..d94147f22ebf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
@@ -33,6 +33,12 @@ pwm@32f0000 {
 		};
 	};
 
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm3 0 45334>;
+		#cooling-cells = <2>;
+	};
+
 	vdd_1v8_sys: regulator-vdd-1v8-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_1V8_SYS";
-- 
2.40.1

