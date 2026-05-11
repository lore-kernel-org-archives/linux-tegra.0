Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9423A6B88
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485780; cv=none; b=ETCz6+lAoo1dFo2EesjI6p0LHgv/WH5GbnCaUY37S3Dmt9MtF7tbAppiLLQisvcBludfmZ4kgTPh33eyBmJnx0/KZZMedjSi9GGsf1RWM9vKeqQPvIRF+UIPyXlo+cV5mYZ7+g5oCVH/rpU1NZntoXT+9D4bwj9IDUIAILtbE9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485780; c=relaxed/simple;
	bh=rZ4cYL3t40L5GT+3D0ZuPAH0zMuM4u4V7RvsxEXZiEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fl2m2txFo3K7iPqIKCcpGHcuC+3mHXW9TfpxD1epxE4u06Kr7y33ymqgztL7PJbz3AlsRqVgJ4ssCM5SEzh2xVMmYVlb586oipLBlBoVYG9kZ4n2kZFrlZl3lnFo7xPGWiKUHBWM4w/xrOMGPRUGW5MMfAuyGjOqfEQSdLtufO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwZN5LEs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwZN5LEs"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8d648466bso256566e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485761; x=1779090561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCpb66fRDDpaHGoTh0CXxAdG/v4EU9iEv2l0kxMx/uI=;
        b=OwZN5LEsg9zzfIpfiQtyf0x0DgQlztFTmlXr1udOhgq15O49PzOlXZHoIMu++L/xQi
         jPmPlzH1X5vKCNH4C7mKjFUCkhXnvaXXRx3WrIUW2oeHV/toKXOHpOdYmotlcSgy6mSj
         kAyWdb5j3dvEqw6hcZdnAGxbmKqqjQ79b60jXtu86FUgPnbErGKqINA4WorfCMKt7/Lh
         WOAdJO0rvL8aOOKB091j3K9tjcynv/yJugByOHYX7mLbLB0eybFi7i9cvaaas+OvRLmt
         pdwmtuRnbxeXUMNgldC9BKXtQdhHFJbZ8Aq29oBJfl7m/8cBdjnb9zo2zl++e6u9WGLo
         2aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485761; x=1779090561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCpb66fRDDpaHGoTh0CXxAdG/v4EU9iEv2l0kxMx/uI=;
        b=HM9S54XqF01xHASMo+m3dcOt86SjX8IYBo93bq2PzIEZ0fqKAFiY7TOr4q2vq1fDBU
         61Mpfsg9yonPnjGTnRrjBJNl/ibM+/ibDICEv/Doh5CRKU2hYvvn0d++XzKOOo/RPcrf
         RxpXafS0PJ4Dl31t/e0aC//az3tih/bQJnnU9/0PsJNFNl/mq+j6qzIrZfe1cj6gRzkx
         CxuxPPJEYvfA+izSu560O0rEAU3x2k6Bv3MQlUJ5RUor2Wl2ozppf5Wpw9I4/tLHjglu
         Hk0oIunl4AJmn+GKaEqxV30kYhCEHGRfdHcJwg7xzd2Bnra/lpS7l85RS7nDhBBLV/QF
         srhg==
X-Forwarded-Encrypted: i=1; AFNElJ/QpVch17Tuc4Hjn/t2ozXKvkv+L3QBLPrwpB1w7FfwEFP6+hZU9s1b7bVph96gfwy0pwoQvUYr2t2nbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ZdbJytVCPh0qInhXnoVu+QcWf6w96DAYStahiIPYdtsoj4Ia
	cApndEYAwjjO9YdowNsQv4tzWjnNmx8j+NKH/P+9gv0JkZlLcB+zPbTo
X-Gm-Gg: Acq92OF22+6Q2sSahn4i13TwjnipbhyoeUCi0KB1XXyjH6/oJEuRE5OPkul/cVHQhxO
	nXo4MsDzg+5AKDcG/3ZQ2/VoUSelY5dwrbiuk7mqbP05cwoPl8uS2AEE5l00JsiXhFMqhUvG4er
	+g3sAmCEWPreln5RU3B0T3gi318l9J/LV/+l19eRw536RrMlgv4uJF2xLktQNLtZe/JUDQTI4OK
	YO2G0wDxmg9ISC5SRfOENgfXGrBv6Es1JwsATRS+iynsRJnTdWFIhZP+BLnnbIQZ8FzHk1fCWjZ
	ExARXaqDjFx7LlU8r/OFI5WEwxa4BLVVoEURS49iqLuDMc3xZp5cipHACNa448Ikxau9fHjtZQX
	xwo9us4xY3VULY9yiKyikOYSNt92VYB2cjjMVZz+Fi5MAj5BuXYOd8G803mg4ktvWh+hkW9W3aB
	+uQXQiYYEjD223zNdIpjMA3NWaZtU8CRTaZA==
X-Received: by 2002:a05:6512:1044:b0:5a3:f25f:cc30 with SMTP id 2adb3069b0e04-5a887ce68e9mr7177557e87.32.1778485760988;
        Mon, 11 May 2026 00:49:20 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/9 RESEND] ARM: tegra: grouper: Add support for front camera
Date: Mon, 11 May 2026 10:48:54 +0300
Message-ID: <20260511074859.24930-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add front camera video path.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 128 ++++++++++++++++++
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |   4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |   4 +-
 3 files changed, 132 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index 15f53babdc21..892d718294dd 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/power/summit,smb347-charger.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -84,6 +85,93 @@ init-mode-hog {
 		};
 	};
 
+	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+				/* CSI-A */
+				channel@0 {
+					reg = <0>;
+
+					nvidia,mipi-calibrate = <&csi 0>; /* CSIA pad */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csia_input: endpoint {
+							data-lanes = <1 2>;
+							/* No rear camera */
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csia_output: endpoint {
+							remote-endpoint = <&vi_ppa_input>;
+						};
+					};
+				};
+
+				/* CSI-B */
+				channel@1 {
+					reg = <1>;
+
+					nvidia,mipi-calibrate = <&csi 1>; /* CSIB pad */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csib_input: endpoint {
+							data-lanes = <3>;
+							remote-endpoint = <&front_camera_output>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csib_output: endpoint {
+							remote-endpoint = <&vi_ppb_input>;
+						};
+					};
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					vi_ppa_input: endpoint {
+						remote-endpoint = <&csia_output>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						remote-endpoint = <&csib_output>;
+					};
+				};
+			};
+		};
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -890,6 +978,36 @@ light-sensor@1c {
 			vdd-supply = <&vdd_3v3_sys>;
 		};
 
+		/* Aptina 1/6" HD SOC (MI1040) */
+		front-camera@48 {
+			compatible = "aptina,mi1040";
+			reg = <0x48>;
+
+			clocks = <&tegra_car TEGRA30_CLK_CSUS>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(O, 0) GPIO_ACTIVE_LOW>;
+
+			vddio-supply = <&avdd_cam1>;
+			vdd-supply = <&vddio_cam>;
+			vaa-supply = <&avdd_cam1>;
+
+			orientation = <0>; /* Front camera */
+
+			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
+					  <&tegra_car TEGRA30_CLK_CSUS>;
+			assigned-clock-rates = <24000000>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>,
+						 <&tegra_car TEGRA30_CLK_VI_SENSOR>;
+
+			port {
+				front_camera_output: endpoint {
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+					link-frequencies = /bits/ 64 <384000000>;
+					remote-endpoint = <&csib_input>;
+				};
+			};
+		};
+
 		accelerometer@68 {
 			compatible = "invensense,mpu6050";
 			reg = <0x68>;
@@ -1203,6 +1321,16 @@ vcc_3v3_ts: regulator-ts {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
+	avdd_cam1: regulator-vcam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd_cam1";
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+		gpio = <&gpio TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-rt5640-grouper",
 			     "nvidia,tegra-audio-rt5640";
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
index 694c7fe37eb8..4bd98935031b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
@@ -135,7 +135,7 @@ ldo4 {
 					regulator-boot-on;
 				};
 
-				ldo5 {
+				vddio_cam: ldo5 {
 					regulator-name = "vdd_camera";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
@@ -149,7 +149,7 @@ ldo6 {
 					regulator-boot-on;
 				};
 
-				ldo7 {
+				avdd_dsi_csi: ldo7 {
 					regulator-name = "avdd_dsi_csi";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
index ee4a3f482769..8fe3c62c9052 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -92,13 +92,13 @@ ldo4 {
 					regulator-always-on;
 				};
 
-				ldo5 {
+				vddio_cam: ldo5 {
 					regulator-name = "vddio_sdmmc,avdd_vdac";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 				};
 
-				ldo6 {
+				avdd_dsi_csi: ldo6 {
 					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
-- 
2.51.0

