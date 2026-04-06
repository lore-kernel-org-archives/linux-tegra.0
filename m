Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B90314B76
	for <linux-tegra@vger.kernel.org>; Mon,  6 Apr 2026 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464460; cv=none; b=dnH/eUiNDUSDXMnRVTQwSUG5FFabpzFoPHtXR824XZ9wN+020Ojvcb94gEHwhlb5mnzNG/aOM/ak/WpmlbIzKpaVZOOPkttE1+upHtQd1jKMcmx6MnZujen1DlQhIAJcZiELW7L24uI1C/55r66wLrDKSAiEX6u0Vdf5+Nxi9lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464460; c=relaxed/simple;
	bh=rZ4cYL3t40L5GT+3D0ZuPAH0zMuM4u4V7RvsxEXZiEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BS2nN2dxjuXFtlk/MoKLmbtYmM23ImKQhmwa46iU/HsjvPQ1omIFqwYQldFOU8rF1Km9OZpR8qWIqhvNJcff5CF4G7l96DhH9tgDk7FCTIWNMhljzCENwADlvmU/StaQE/2RIHNAxA+RCbaIAcdUPwXvwRnNemoDW2+omk4yxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RodDwMqj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RodDwMqj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so37252225e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 06 Apr 2026 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464457; x=1776069257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCpb66fRDDpaHGoTh0CXxAdG/v4EU9iEv2l0kxMx/uI=;
        b=RodDwMqjKNkir1Dj4Pmn/R2FW/UV52R/w6adGoNxIc7q2qLPGzn2lIrcHy8uiynVTL
         jlqDSVrof8vWknnw4BJ/S1kIOGSejgWWYLjdPIRfwdkbqDg+x/py6+cnAQ9gWVRmI9RW
         N6QSN5EwjyElD1AZSy5c6L82igXQId3VGQ2jSUNIQMmOK9OiTaCAb9jlupu9nWEIGD5p
         dzYWro1AsL2Ijgb6q4RYRHDgYBfal/Brm1uaoCwf43H9s4+3b7YpjUsveG8cH9sLwChn
         9xcird7FoKqgb8aypcwkVnjQZCbzP7gwdLP/qu9rUFnloI6BF6BQxv+0l4Ve0ZDfsQ8a
         BUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464457; x=1776069257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCpb66fRDDpaHGoTh0CXxAdG/v4EU9iEv2l0kxMx/uI=;
        b=rOHagKro7jNkJTpA62+sT1GSbwawC02hDiM9+ToPOJGOopzK1yxrGXIUQhLtG9sO5g
         SsPNqoqLiXUxeerFXnKYxoglJmsqE+MRF/eTal+svlKdorcLUNXtvX60Bm3uyxSW7PfS
         r1sI4W3TGG33oQ1dA9GRuPHI/FkMNi0nI26cTLtNh41UUX/QeeRyUwqyeDZeAUUA+ATP
         RvDrm8AKDsGlI8+4zI6KoXI01k3R5RvDW2OOnXD0qOO3ZlIwwI9vMP8dNyNy1b8H8sgE
         vuYcWgwS3S1vP+ReVJgDOIMus0tJ6BVqrDm9iKizWVTJk+ZZ2nrMuHxHuVz97R4NueGd
         fglg==
X-Forwarded-Encrypted: i=1; AJvYcCXkJtCX3tw3C4c0R1iEsOl/9UNibuFNHxnf/8aLpwIhTGiNq3KS2OJ/rGlYBFMf/BEz7ZVJuIS9Ud+CmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw65d8FJ2cuY22oWe8O8ZeYLdLaLMWQT/HwEheSnqs4dCtH4s9b
	i1i8VpCGJw8Ttyu5sRW1aXOgkWGvqjhodZzXJkpAfjYAal0FiZK1OWb2
X-Gm-Gg: AeBDiesNilB9E8P33s/+U68CTDBb7ruHLkBZYe4HJLUEwMvodHlAaX43Qjei+ifI9Dy
	aJxNpTkN/+OZCRIvwPk7p5VHYD2NRCphTcoS19DlRzuYSb0wKotG0FDZKinnmy/yRCZrZcxuIjc
	lqiAgQyNv1uQoCc3lxggH1CzmN4rGJNWfz6bCpuXQcBBH2kdcuHN9tt/nwU6cTxHVPSbTpKuhRa
	TmQlcDGPQVb/0p8mKGzvqggPBdjX6SFwF0yd8+X/zNOPzrqycblgYu+f73kIxErf9fziRv/LoM6
	mgVRmoz9hm5sJwFjQsLcqNrSYFwzlhY8WZEk+vQ0TBdFqfDSS5Jj3/hg/qgrb82D7Ce3VjkLF15
	Y6cVKuUugI2PX7W6RAzvDmCiWl7g+OqZOsSAC53lRT3JvCEAeW8+sRDvScbBNYQBdZ31J7VfWJ1
	u8rxwWto1TWZWw
X-Received: by 2002:a05:600c:4f15:b0:488:945a:ed63 with SMTP id 5b1f17b1804b1-488995cbaa7mr185272685e9.0.1775464456787;
        Mon, 06 Apr 2026 01:34:16 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:16 -0700 (PDT)
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
Subject: [PATCH v1 4/9] ARM: tegra: grouper: Add support for front camera
Date: Mon,  6 Apr 2026 11:33:59 +0300
Message-ID: <20260406083404.31359-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
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

