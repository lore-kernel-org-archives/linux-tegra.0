Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9533065B
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422517; cv=none; b=pcqokucjMHCJck7TC0XFxJ5nDuGA5M7gV0nO4FKXEXaS5yUMXDn3XRZn8tnHn6Rt35k6r/0GeGsusE5CTwXOUZaecDr9AP8oWgZ1MA57ggWV0R2GqHkjt9xnNvakhn0Ag94gKNDTtEHcWMTf43rW1lkCPLkxEx18fSqkms78ZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422517; c=relaxed/simple;
	bh=kWvO1JBOkQvmd2lyNMDa9PQL+ezNuEzhWcLuIFy367w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jwjq6S0EqoDyT9/qr3tQKPpLQ85U329C5BKD3FGZA1h0IUaNR+96QwsdIMSnK8B1nRn4+X+kNhoY2vZNrYDgRrXZWghvtenafx21QRmsrIN3WgbqDpUzhc7ZmAedzbwwzCjxdLOJcmNQsFEdNvHVxtOiSUsay7KKcmoKWVMhrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFyyWP2t; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFyyWP2t"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-480142406b3so28760245e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 02:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422513; x=1770027313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXSLL8ZVnsVCGytcD0iIS2ohhxDTejMMZNgTrqtzg30=;
        b=ZFyyWP2tvDL55WvvWkX4S0VfcB3SCy/Wk+Si3sd7/QD6cmuUu/0lD08bwdTBeO+G34
         9JLuOhLzxGu1vtElsAZrhqN1W6cgJDjRc3mRXGXPj7J4JUsbCRReVz7dhm+ObNLWBfjT
         N0RWDmCU/bwGUEuh/aAKd9AWa5LqEJHLx2VXuqI9Pa74gyKyrMwQoaVVoPvyZHIG5gf/
         OPMnZ+3WNXdxbAsU8zDWnjnHogpB8QRESIY8yQNoUnIIJksb5D5ksm6nvbGI0A2VusiZ
         TiXI/qn8gNNiQZfG/vo4107Sj7UoJHcfhnQX2vLkaU41m7In6jOUaaLJuxPlM3fTg24F
         NITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422513; x=1770027313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXSLL8ZVnsVCGytcD0iIS2ohhxDTejMMZNgTrqtzg30=;
        b=fgkYawbD4vOQUd0KR9nOa+gnEBUc7N3H6xgkEBn0gbsXCQoyElBpQUfdycMyHn1l5f
         JKcupG0BCN9pdq00U9tCm5vBQZyhoTbcnYLqDtIBaFCoKofP0O0jJXa6oH03AY81L3I8
         fw6C2nO0lVA5kLhNrFwfnOZyDdo0vqupvUmGLLlJPTyyOws0yBwZuNJOuPP0dBhrNKKF
         ymAicovyFzCS7hCWzCuptCA87x2tliusGHdQzHFURoMFMbg57ungJRDFdH3nHFv2AHIm
         a1IWxjXfSUdvKKfHM9yRUGqZeczZvxhAyB8RieqQ4WFRvcZRyRBHo8Nh62jkKA3isUmd
         PQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT3O5yVNPYKCTvYPa27VbVN3G81cKZ1rOT4FKA9C4ptYfTydLzaB4UIfAzpIxId/cgsnFY123hBP/TQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4JBA/OxJ28d/a71YoA/D+58v8ZsobqxkYcD5rtxIzqiDtsr9i
	2ug3mQ7qjalcccimo+4l5e7Vi8ZHQqDQ8JcTnjYAHxhSze5AJi1BrJhi
X-Gm-Gg: AZuq6aLkZNxjQhSS5Bata09KRBRUHommcyf5v+juu5j9ecBJtx4ZKN1d3FoguOCnTg/
	fJ3gn4A0bp8gBO3m7oOiqCJnwiawP7l86zM2/S2kRNLVW0FDF4rYumJLPY8QVsCNLwo8juPsm5H
	Uw0x8qEmfj+i8dK1WO6rI0ckIhmuJ54LhYPR11MiFFuWhHqAaUiIWgC3hHoA+lgRYjjaW8Vy3F1
	NRu1Rk4lPfMERV4AbVxkBSjnaVuMTDNrmortzlEkrffe7EzqDhPP2xUuvBhEBPvt/uGrdZjXHuf
	sX+8F+l+vcdQQKxYLDOhcqnm3Tn3gYuKu1hVYAPoywAe8o7VsWjKqsOw4dS4n+Sbypoqa4MgUSe
	BvbtNMtjHTjNI74GXdgpRdTGF/YSrukLFhy9JFSdRfrIM5EMgynLM+lmE7hLPdmsO9X3N54o4kG
	At
X-Received: by 2002:a05:600c:524c:b0:47e:e2b0:15b8 with SMTP id 5b1f17b1804b1-4805cd409fbmr65096305e9.4.1769422512707;
        Mon, 26 Jan 2026 02:15:12 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm319771795e9.11.2026.01.26.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:15:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: tegra: lg-x3: complete video device graph
Date: Mon, 26 Jan 2026 12:10:18 +0200
Message-ID: <20260126101018.24450-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126101018.24450-1-clamor95@gmail.com>
References: <20260126101018.24450-1-clamor95@gmail.com>
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
index 768e201456d8..178e4bb153d3 100644
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
+		/* rear camera sensor eeprom */
+		m24c08: eeprom@50 {
+			compatible = "st,m24c08", "atmel,24c08";
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

