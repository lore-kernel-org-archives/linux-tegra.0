Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73B3A873E
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485786; cv=none; b=KkdJHyKvM+S3dOEGbAu8OxC3qE3Iut55nHAE19dzdD7shUe2QbFusp4cDo9jFoy3yW2L0b1zWRRF/xLAgpH7kYWr4miSaBbcnXphuRqpxz8fdLHzx9pNjInM4GZ8kpEtFy/leVTVzxfnUGKE1Tfg6MUnOf5JiEiQQULFjMFnvL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485786; c=relaxed/simple;
	bh=5z2Lt475ih30u0uu9IUM4wQFEZ0cO66tCDGHP3YblIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFJLgglcv5mkPb2+Yi9DNTgshEhaoCo4F0Hh0ZBzZbBR3/yDjHFFZcBdwIGxOg3MkKaiuiba1cOGYJ2eEwRKOUaRQPjDl0g2aWmAWf3rrNTxaOycryXQonrdlKjhjq5leNiMAqGbwJxa5PRatlOxV2nOZ/QJq1RJ4yU4Vt+C0yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiZjs7th; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiZjs7th"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4282562e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485758; x=1779090558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1yXHDnp7NzX4AEU8wqvHpHmrt4Gh/6rFiKDv6uZxQk=;
        b=WiZjs7thExuQmMAhEmnQ98rNMPawZmrz9KYNowSJ1UtwQX1M8hGBqMSzGceV9pNp3B
         Qga1XroxnvkqrybUy4i8/RMMfxHQ1WMTxbvwjMhMo2kc46+NA+ItI1Z67oxTcTVbYB4q
         VpFlCUU8wp0bbOqZgE3ktSfhLtEz7DTIAV9nXfAQNWt0TYP1ZWXjY3lvgDfMzas2R3r7
         zANRRsV6C66097xRdHmCEtdgQrRtwee+zQ2CPtkjY0UUXksW+Vi1bWrlaENIPTJDKHyP
         VF6ZJWHQQTfoVHXyiqUanpFSWCAlQv4lIvp9vqY26fVFpAOkcJshuoPK+1PvKaUov2MO
         mY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485758; x=1779090558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P1yXHDnp7NzX4AEU8wqvHpHmrt4Gh/6rFiKDv6uZxQk=;
        b=lWeJza6HgnAXlQptWFaRpdCB6/7USCBLL41Oh/gx7wynqykoQRtxGpUB1goy1spnzD
         Nktccd2YkgLUdQL85fFPMRV/1hUmM+8sBpvBo5btt4Rj4OCi/YrC2foa+OMKMotwFz/p
         cM8jd42fAOBJmGCsmoVFVqkqrxV1pDYn8GLflXwL0eJybZzBPYrkRtd+wbiUnqSeQ7pR
         H5hhReNYPv1qL8Xl8qR6lIzmJPbsSNXy/8mGsPFA2kTpXcXm+o41A0XgJNU9OySWSybl
         lfh8DRIqxDXIX066HxFUZ6Y31TTnGPe5LxnEa8RSGmz80ReRcTXT6jdUOd5M5kALwPlk
         jKhg==
X-Forwarded-Encrypted: i=1; AFNElJ+QMz6Vg5/FuVs3uf/gVkEbctfgJDKAmHvfheCPv1zfkyR7hh/dxlhE3pr8wBHwHvabX6qugek61Lohfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uy6RIsffrGOGU0ibFOZ/LqKEFd4zT9AaAXq8wPMxrGXWJYta
	E/eJ2B3yMO8kjk30pCU6yeTtIHAooCVMcZN73PALXkstb22CbWAUCb4HLxNq6w==
X-Gm-Gg: Acq92OF/Grwu2+4P4W1XZLmb2m3c2zZ/Q7S12069lOu0KIXS+MUkPL6wBQYOJ1NyexZ
	aWPn1JtJxrQMjg7Qj9VpAo7ZpbezMB1bsBD9qSnEBV87Oy8RCPNTIi0OlOJQrBvR15XUh8U+1H/
	LEP1SpxkfXyLJHdOsNGeCLSsCfxodGu+hOJYoqUjKyU17DVxjOKZUBTEY12bLq2CYSUHT1tWNjY
	S2IHeQf9xGU52r3W/G/iTyha5tgNPvr5kiWgK68KE3YJPwibITDQ33CA5iV1ZuNnv1xPFBf9Mac
	6q0rc95SJOEn71cvALnkfdRf1YKrq2kUs61kMu9jylpmsqe0lB3gtF3JpTE5NqIImIrcx7HVoGV
	q33O7o1V+IYL2iXnmmE1oPOJGSXWjQsg2EZwdWU8fqQSutXOCtqbPtPYKmTjelLNgOLkrYzWlBm
	X4uchBw/YsWChm
X-Received: by 2002:a05:6512:3989:b0:5a8:881c:74ab with SMTP id 2adb3069b0e04-5a8b6ca1c30mr2065344e87.13.1778485757479;
        Mon, 11 May 2026 00:49:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:17 -0700 (PDT)
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
Subject: [PATCH v1 1/9 RESEND] ARM: tegra: lg-x3: Complete video device graph
Date: Mon, 11 May 2026 10:48:51 +0300
Message-ID: <20260511074859.24930-2-clamor95@gmail.com>
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

Add front and rear camera nodes and interlink them with Tegra CSI and VI.
Adjust camera PMIC voltages to better fit requirements and fix the focuser
node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  28 ++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  46 ++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 154 +++++++++++++++++--
 3 files changed, 214 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index cc14e6dca770..1b21d7628c8c 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -12,6 +12,18 @@ aliases {
 		mmc2 = &sdmmc1; /* WiFi */
 	};
 
+	host1x@50000000 {
+		vi@54080000 {
+			csi@800 {
+				/delete-node/ channel@1;
+			};
+
+			ports {
+				/delete-node/ port@1;
+			};
+		};
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -116,6 +128,22 @@ rmi4-f11@11 {
 		};
 	};
 
+	i2c@7000c500 {
+		camera-pmic@7d {
+			vt_1v2_front: ldo1 {
+				regulator-name = "vt_1v2_dig";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vt_2v7_front: ldo2 {
+				regulator-name = "vt_2v7_vana";
+				regulator-min-microvolt = <2700000>;
+				regulator-max-microvolt = <2700000>;
+			};
+		};
+	};
+
 	spi@7000dc00 {
 		dsi@2 {
 			/*
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 414117fd4382..896639599c12 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -118,6 +118,52 @@ rmi4-f1a@1a {
 		};
 	};
 
+	i2c@7000c500 {
+		/* Aptina 1/6" HD SOC (MT9M114) */
+		front-camera@48 {
+			compatible = "onnn,mt9m114";
+			reg = <0x48>;
+
+			clocks = <&tegra_car TEGRA30_CLK_CSUS>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(BB, 5) GPIO_ACTIVE_LOW>;
+
+			vddio-supply = <&vio_1v8_front>;
+			vdd-supply = <&vt_1v8_front>;
+			vaa-supply = <&vt_2v8_front>;
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
+		camera-pmic@7d {
+			vt_1v8_front: ldo1 {
+				regulator-name = "vt_1v8_dig";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vt_2v8_front: ldo2 {
+				regulator-name = "vt_2v8_vana";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
+
 	spi@7000dc00 {
 		dsi@2 {
 			/*
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 768e201456d8..d2a5904cebed 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/mfd/max77620.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -74,6 +75,91 @@ trustzone@bfe00000 {
 	};
 
 	host1x@50000000 {
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
+							remote-endpoint = <&rear_camera_output>;
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
+
 		lcd: dc@54200000 {
 			rgb {
 				status = "okay";
@@ -1112,29 +1198,68 @@ dw9714: coil@c {
 			compatible = "dongwoon,dw9714";
 			reg = <0x0c>;
 
-			enable-gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_LOW>;
 
 			vcc-supply = <&vcc_focuser>;
 		};
 
+		/* SONY IMX111 1/4" BSI */
+		rear-camera@10 {
+			compatible = "sony,imx111";
+			reg = <0x10>;
+
+			clocks = <&tegra_car TEGRA30_CLK_CSUS>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(K, 4) GPIO_ACTIVE_LOW>;
+
+			iovdd-supply = <&vio_1v8_rear>;
+			dvdd-supply = <&vdd_1v2_rear>;
+			avdd-supply = <&vdd_2v7_rear>;
+
+			orientation = <1>; /* Rear camera */
+			rotation = <90>;
+
+			nvmem = <&m24c08>;
+			lens-focus = <&dw9714>;
+
+			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
+					  <&tegra_car TEGRA30_CLK_CSUS>;
+			assigned-clock-rates = <24000000>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>,
+						 <&tegra_car TEGRA30_CLK_VI_SENSOR>;
+
+			port {
+				rear_camera_output: endpoint {
+					data-lanes = <1 2>;
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+					link-frequencies = /bits/ 64 <542400000>;
+					remote-endpoint = <&csia_input>;
+				};
+			};
+		};
+
+		/* rear camera sensor eeprom m24c08 from ST */
+		m24c08: eeprom@50 {
+			compatible = "atmel,24c08";
+			reg = <0x50>;
+
+			/* if high then WP is on, if low then off */
+			wp-gpios = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
+
+			/* it is not OTP but writing is unwanted */
+			read-only;
+			pagesize = <16>;
+			num-addresses = <1>;
+
+			vcc-supply = <&vio_1v8_rear>;
+		};
+
 		camera-pmic@7d {
 			compatible = "ti,lp8720";
 			reg = <0x7d>;
 
 			enable-gpios = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
 
-			vt_1v2_front: ldo1 {
-				regulator-name = "vt_1v2_dig";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-			};
-
-			vt_2v7_front: ldo2 {
-				regulator-name = "vt_2v7_vana";
-				regulator-min-microvolt = <2700000>;
-				regulator-max-microvolt = <2700000>;
-			};
-
 			vdd_2v7_rear: ldo3 {
 				regulator-name = "8m_2v7_vana";
 				regulator-min-microvolt = <2700000>;
@@ -1348,10 +1473,11 @@ vdd_1v2_mhl: ldo7 {
 					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
 				};
 
-				ldo8 {
+				avdd_dsi_csi: ldo8 {
 					regulator-name = "avdd_dsi_csi";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
+					regulator-boot-on;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
 				};
-- 
2.51.0

