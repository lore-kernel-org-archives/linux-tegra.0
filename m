Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9491C5786;
	Tue,  6 Aug 2024 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947976; cv=none; b=ETxDyNFH7NVK4dybIdtbEIivcozTMgqgOrjEyyKA4sbIU9IR6Hvh5BcKdW15w3Qp6b2DO8XH6EN72OvCCyUusloFmJSTn39Tl6YPwIpIQxlb/f/NQ/W2FB97qbUv7rl2LOzQhbJ03P7wXERhHSKt5iiheeEtFaZFhROYrQhAA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947976; c=relaxed/simple;
	bh=1hKdukUjbJymokiRyFBucX1CeJdkfOK10fDf/ghGee8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6Td8WhWr9zZy2za2bQyC32Dq1+ogt+IOqHa5zIBmm8h2aDocMhc7RlVwU0c6uRSbp9gzrBhgIliS+Of7IwAF08jfhGX5Qjzx66HwJ2VyNgqJ/k7Ld9Aa/LjTPn3Y9uQXBOmZQWg6Cz/kNncvV+RNjjb9z6ash1vzRsnYH5hBRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YG5Ri14M; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YG5Ri14M"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso1124720e87.3;
        Tue, 06 Aug 2024 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947973; x=1723552773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7uZdUJOG1qox1qFszMWM0JHj5DU2PqXy6BhkJGlrIw=;
        b=YG5Ri14MDput6g+WlT/Ul1qV3dlEHl3KdLEjaLmz6zub6/t4Bwj2JEHRWeeqc8yRL2
         S7xAWNsPTIZVQ8YplZ8T5T4DaH+FkqRPSzlnfQ936DO5FGJZDrneVigTzQVMAc9XuPRc
         uTYV/oj+H5smMM76yP/Ua9TIvgKw0iw625ovuLq75ch74hcHzI8ODXSzmN1mGra52rUC
         kSEJj9BAs1XBlsXzeVwt67Doh+ShoQCHD5kCfIL1syzshoD+xX23hn7s3DPceWq5erxs
         q1dPWy0BH+zgG5E8I97x1W923Sn4u++ltHtyfwS6kdA0kHR22YL7x4ZXtjNmafCRLsdV
         Eh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947973; x=1723552773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7uZdUJOG1qox1qFszMWM0JHj5DU2PqXy6BhkJGlrIw=;
        b=esrAtnaabkBi6lzWcGEp0R11+/EYoRndCpjQq7fqLk3uRlX8pd7VzLYp8ifYknOPw3
         FTBR8mvzVbYHrNlXq7Kfqd93I7PqUXVkv7W8hfqkhaOHioUHUY+iQJr7RXPTLqJ7mJX5
         OHYPC2MQa49KlOSbFeUgpFzFZoWoj11N1ardsjRLwOKKB1SnNPz/xuZgk7uYp1scvVcd
         sEXUl9ctcVRkS5Yj8i432qztHh5m+80v6xhF6mP2Ei5i5lAhZV4Tb9v0ks4Z98bAQHOh
         kdu7oU0p58PF0UbwzO5E17WSmWilPdk2fqlc/RLuxCNbPkOxRgU0b7+LAI21ZhhFnVxu
         grCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOnu9Vw7adVWsGmu8TSmvKTlyVukYtjo/FUnZ7roUr03tsCkFCboxfbmBieoKCDrYp3aIdluvqN1qo25SXL+j5e6AGzEXEtcyZ2ahgwKwN96weVNkib/+Amd403BiSkL1GnS7NMzvdEN0=
X-Gm-Message-State: AOJu0Yz7bnMBbeCDnXOiHfc4Th/L/lukcK0Pfic2/bQWHhKs9FMy+pof
	f+w7ldSnoDXvvZzE/gTbAaKEHn5UyeyYN+SkeIx3quQD+GfWGjP/
X-Google-Smtp-Source: AGHT+IGUooOynsbhXS9upO8fb3W5qonSrWholXlZkrwZJqwIcO42Vsfr1oLJfFY1uDASU7qXYHMtEw==
X-Received: by 2002:a05:6512:31c9:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-530bb3bbd2cmr12405354e87.50.1722947972343;
        Tue, 06 Aug 2024 05:39:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/11] ARM: nvidia: tf701t: correct and complete PMIC and PMC bindings
Date: Tue,  6 Aug 2024 15:38:58 +0300
Message-ID: <20240806123906.161218-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806123906.161218-1-clamor95@gmail.com>
References: <20240806123906.161218-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parts of PMIC complex, extend PMC binding and add missing
fixed regulators. Additionally, refresh naming to better reflect
regulator purpose.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 263 +++++++++++++-----
 1 file changed, 195 insertions(+), 68 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index c646be32389a..03ea6cc8079a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -60,7 +60,7 @@ host1x@50000000 {
 		dsi@54300000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&tps65913_ldo2>;
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
 
 			nvidia,ganged-mode = <&dsib>;
 
@@ -70,7 +70,7 @@ panel_primary: panel@0 {
 
 				link2 = <&panel_secondary>;
 
-				power-supply = <&vdd_lcd>;
+				power-supply = <&dvdd_1v8_lcd>;
 				backlight = <&backlight>;
 			};
 		};
@@ -78,7 +78,7 @@ panel_primary: panel@0 {
 		dsi@54400000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&tps65913_ldo2>;
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
 
 			panel_secondary: panel@0 {
 				compatible = "sharp,lq101r1sx01";
@@ -1192,12 +1192,36 @@ palmas: pmic@58 {
 
 			ti,system-power-controller;
 
+			palmas_gpadc: adc {
+				compatible = "ti,palmas-gpadc";
+				interrupts = <18 IRQ_TYPE_NONE>,
+					     <16 IRQ_TYPE_NONE>,
+					     <17 IRQ_TYPE_NONE>;
+
+				ti,channel0-current-microamp = <5>;
+				ti,channel3-current-microamp = <400>;
+				ti,enable-extended-delay;
+
+				#io-channel-cells = <1>;
+			};
+
+			palmas_extcon: extcon {
+				compatible = "ti,palmas-usb-vid";
+				ti,enable-vbus-detection;
+				ti,enable-id-detection;
+			};
+
 			palmas_gpio: gpio {
 				compatible = "ti,palmas-gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
 			};
 
+			palmas_clk32kg@0 {
+				compatible = "ti,palmas-clk32kg";
+				#clock-cells = <0>;
+			};
+
 			pinmux {
 				compatible = "ti,tps65913-pinctrl";
 				ti,palmas-enable-dvfs1;
@@ -1261,17 +1285,18 @@ pin_vac {
 			pmic {
 				compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
 
-				ldo1-in-supply = <&tps65913_smps7>;
-				ldo2-in-supply = <&tps65913_smps7>;
-				ldo4-in-supply = <&tps65913_smps8>;
-				ldo5-in-supply = <&tps65913_smps9>;
-				ldo6-in-supply = <&tps65913_smps9>;
-				ldo7-in-supply = <&tps65913_smps9>;
-				ldo9-in-supply = <&tps65913_smps9>;
+				ldo1-in-supply = <&vddio_ddr>;
+				ldo2-in-supply = <&vddio_ddr>;
+				ldo4-in-supply = <&vdd_1v8_vio>;
+				ldo5-in-supply = <&vcore_emmc>;
+				ldo6-in-supply = <&vcore_emmc>;
+				ldo7-in-supply = <&vcore_emmc>;
+				ldo9-in-supply = <&vcore_emmc>;
+				ldoln-in-supply = <&vdd_smps10_out2>;
 
 				regulators {
-					tps65913_smps123: smps123 {
-						regulator-name = "vdd-cpu";
+					vdd_cpu: smps123 {
+						regulator-name = "vdd_cpu";
 						regulator-min-microvolt = <900000>;
 						regulator-max-microvolt = <1350000>;
 						regulator-always-on;
@@ -1280,8 +1305,8 @@ tps65913_smps123: smps123 {
 						ti,mode-sleep = <3>;
 					};
 
-					tps65913_smps45: smps45 {
-						regulator-name = "vdd-core";
+					vdd_core: smps45 {
+						regulator-name = "vdd_core";
 						regulator-min-microvolt = <900000>;
 						regulator-max-microvolt = <1400000>;
 						regulator-always-on;
@@ -1289,101 +1314,95 @@ tps65913_smps45: smps45 {
 						ti,roof-floor = <3>;
 					};
 
-					smps6 {
-						regulator-name = "va-lcd-hv";
-						regulator-min-microvolt = <1000000>;
-						regulator-max-microvolt = <1000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
+					/* smps6 disabled */
 
-					tps65913_smps7: smps7 {
-						regulator-name = "vdd-ddr";
+					vddio_ddr: smps7 {
+						regulator-name = "vddio_ddr";
 						regulator-min-microvolt = <1350000>;
 						regulator-max-microvolt = <1350000>;
 						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					tps65913_smps8: smps8 {
-						regulator-name = "vdd-1v8";
+					vdd_1v8_vio: smps8 {
+						regulator-name = "vdd_1v8";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
 						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					tps65913_smps9: smps9 {
-						regulator-name = "vdd-sd";
+					vcore_emmc: smps9 {
+						regulator-name = "vdd_emmc";
 						regulator-min-microvolt = <2900000>;
 						regulator-max-microvolt = <2900000>;
-						regulator-always-on;
+						regulator-boot-on;
 					};
 
-					tps65913_smps10_out1: smps10_out1 {
-						regulator-name = "vd-smps10-out1";
+					smps10_out1 {
+						regulator-name = "vd_smps10_out1";
 						regulator-min-microvolt = <5000000>;
 						regulator-max-microvolt = <5000000>;
 						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					tps65913_smps10_out2: smps10_out2 {
-						regulator-name = "vd-smps10-out2";
+					vdd_smps10_out2: smps10_out2 {
+						regulator-name = "vd_smps10_out2";
 						regulator-min-microvolt = <5000000>;
 						regulator-max-microvolt = <5000000>;
 						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					tps65913_ldo1: ldo1 {
-						regulator-name = "vdd-hdmi-pll";
+					avdd_hdmi_pll: ldo1 {
+						regulator-name = "avdd_hdmi_pll";
 						regulator-min-microvolt = <1050000>;
 						regulator-max-microvolt = <1050000>;
 						regulator-always-on;
+						regulator-boot-on;
 						ti,roof-floor = <3>;
 					};
 
-					tps65913_ldo2: ldo2 {
-						regulator-name = "vdd-2v8-dsi-csi";
+					avdd_dsi_csi: ldo2 {
+						regulator-name = "avdd_dsi_csi";
 						regulator-min-microvolt = <1200000>;
 						regulator-max-microvolt = <1200000>;
 						regulator-boot-on;
 					};
 
 					ldo3 {
-						regulator-name = "vpp-fuse";
+						regulator-name = "vpp_fuse";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
 					};
 
-					ldo4 {
-						regulator-name = "vdd-1v2-cam";
+					vdd_1v2_cam: ldo4 {
+						regulator-name = "vdd_1v2_cam";
 						regulator-min-microvolt = <1200000>;
 						regulator-max-microvolt = <1200000>;
 					};
 
-					ldo5 {
-						regulator-name = "vdd-cam";
+					avdd_2v8_cam: ldo5 {
+						regulator-name = "avdd_cam2";
 						regulator-min-microvolt = <2800000>;
 						regulator-max-microvolt = <2800000>;
 					};
 
-					ldo6 {
-						regulator-name = "vdd-dev";
+					vdd_2v85_sen: ldo6 {
+						regulator-name = "vdd_dev";
 						regulator-min-microvolt = <2850000>;
 						regulator-max-microvolt = <2850000>;
-						regulator-boot-on;
 					};
 
-					ldo7 {
-						regulator-name = "vdd-2v8-cam";
+					avdd_2v8_af: ldo7 {
+						regulator-name = "avdd_2v8_cam";
 						regulator-min-microvolt = <2800000>;
 						regulator-max-microvolt = <2800000>;
 					};
 
-					tps65913_ldo8: ldo8 {
-						regulator-name = "vdd-rtc";
+					ldo8 {
+						regulator-name = "vdd_rtc";
 						regulator-min-microvolt = <950000>;
 						regulator-max-microvolt = <950000>;
 						regulator-always-on;
@@ -1391,23 +1410,24 @@ tps65913_ldo8: ldo8 {
 						ti,enable-ldo8-tracking;
 					};
 
-					tps65913_ldo9: ldo9 {
-						regulator-name = "vdd-sdmmc";
-						regulator-min-microvolt = <1800000>;
+					vddio_usd: ldo9 {
+						regulator-name = "vddio_usd";
+						/* min voltage of 1.8v is not stable */
+						regulator-min-microvolt = <2900000>;
 						regulator-max-microvolt = <2900000>;
 					};
 
-					tps65913_ldoln: ldoln {
-						regulator-name = "vdd-hdmi";
+					avdd_hdmi: ldoln {
+						regulator-name = "avdd_hdmi";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
+						regulator-boot-on;
 					};
 
-					ldousb {
-						regulator-name = "vdd-usb";
+					avdd_usb: ldousb {
+						regulator-name = "avdd_usb";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 				};
@@ -1416,11 +1436,30 @@ ldousb {
 			rtc {
 				compatible = "ti,palmas-rtc";
 				interrupt-parent = <&palmas>;
-				interrupts = <8 0>;
+				interrupts = <8 IRQ_TYPE_NONE>;
 			};
 		};
 	};
 
+	pmc@7000e400 {
+		status = "okay";
+		nvidia,suspend-mode = <2>;
+		nvidia,cpu-pwr-good-time = <300>;
+		nvidia,cpu-pwr-off-time = <300>;
+		nvidia,core-pwr-good-time = <641 3845>;
+		nvidia,core-pwr-off-time = <2000>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+
+		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC  */
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <4>;
+			nvidia,bus-addr = <0x58>;
+			nvidia,reg-addr = <0xA0>;
+			nvidia,reg-data = <0x00>;
+		};
+	};
+
 	ahub@70080000 {
 		i2s@70080300 {
 			status = "okay";
@@ -1441,8 +1480,8 @@ mmc@78000400 {
 		nvidia,default-tap = <0x3>;
 		nvidia,default-trim = <0x3>;
 
-		vmmc-supply = <&vdd_usd>;
-		vqmmc-supply = <&tps65913_ldo9>;
+		vmmc-supply = <&vdd_2v9_usd>;
+		vqmmc-supply = <&vddio_usd>;
 	};
 
 	mmc@78000600 {
@@ -1569,7 +1608,7 @@ sound {
 
 	vdd_5v0_sys: regulator-5v0-sys {
 		compatible = "regulator-fixed";
-		regulator-name = "vdd_5v0";
+		regulator-name = "vdd_5v0_sys";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -1578,31 +1617,119 @@ vdd_5v0_sys: regulator-5v0-sys {
 
 	vdd_3v3_sys: regulator-3v3-sys {
 		compatible = "regulator-fixed";
-		regulator-name = "vdd_3v3";
+		regulator-name = "vdd_3v3_sys";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
 
-	vdd_lcd: regulator-vdd-lcd {
+	dvdd_1v8_lcd: regulator-vdd-lcd {
 		compatible = "regulator-fixed";
-		regulator-name = "vdd_lcd_1v8";
+		regulator-name = "dvdd_1v8_lcd";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		vin-supply = <&tps65913_smps8>;
+		regulator-boot-on;
+		gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	vdd_3v7_bl: regulator-bl-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v7_bl";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	hdmi_5v0_sys: regulator-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_hdmi";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_smps10_out2>;
 	};
 
-	vdd_usd: regulator-vdd-usd {
+	vdd_2v9_usd: regulator-vdd-usd {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_sd_slot";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		vin-supply = <&tps65913_smps9>;
-		enable-active-high;
+		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vcore_emmc>;
+	};
+
+	vdd_1v8_cam: regulator-cam-vio {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_cam";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		gpio = <&palmas_gpio 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	vdd_1v2_xusb: regulator-xusb-vio {
+		compatible = "regulator-fixed";
+		regulator-name = "avddio_1v2_xusb";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+		gpio = <&palmas_gpio 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_3v3_xusb: regulator-xusb-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "hvdd_3v3_xusb";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpio = <&palmas_gpio 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_3v3_com: regulator-com {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_com";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_3v3_touch: regulator-touch-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_1v8_touch: regulator-touch-vio {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_touch";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
 	};
 };
-- 
2.43.0

