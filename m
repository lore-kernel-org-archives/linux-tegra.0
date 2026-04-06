Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8755222083
	for <linux-tegra@vger.kernel.org>; Mon,  6 Apr 2026 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464461; cv=none; b=Q0YwFKtxWKIb+8s/EZcEFh8mYQwYQ//TdnALHNJyl2YWyhkUNKS0jd/5yNdOUOXf4d01tMsNFrGGqd+A+mZL4d6CRDjt7IiaRVdbaOsyCYQPNeEyD01NQhh5yc78uvM68Ftp98fR6m1MKrtxPGuDQu/vUxaoCG9k5RcxXUuuH5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464461; c=relaxed/simple;
	bh=HvRnVDts5ARzEgDQd1uxaF/Ni636zkJ9D8rxyroqkjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZnEFVOMLeHJtlapydjiKJGTHuL35T8aLqcc7pNR+rNe9gPTztgH2dkZ3F9YgKJf0g2kuX2E/0YcmEYIoUI3eucx8Z9mYLkHCMiwZsPtC3Kxrxt8Djuo3Db1x47cucrTjcXZWjUcCm3CoKn2wo/Aaso73dWpkYpvX0fIiJatlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPaqUcGp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPaqUcGp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso17251415e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 06 Apr 2026 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464458; x=1776069258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=UPaqUcGpG0M9CPFdqzPLRmMBANm3ifGQJLEk0c6+65h5IKghgHF3FJkF1tmQdnEpFd
         xH8B5u4ewSvjgdXeN3V5foyfLaGh7YUl33NVexJyfvp3+8EhXo4AhP1u8BFfhOz7Hgy6
         qlIhTYZUylgGTo7b/xNl+pB4xvaH11e9z80i7m2Rmq5R+gLtk3stizb32J0XL+oleamr
         Vhvy8xbIv9Km44eZAWQisKbJf6iJkkBVQLQbe0yFFnKjVKd5Oo+Jvof2W7O5f2FowR/O
         yGL/G9OIJE42YfKzcY6tL+6B36H2Hm3gNgaZaLc3I3AINYud0J88AcnNl03t0tceKdpW
         zRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464458; x=1776069258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=S7FNLJCQDEHETHqU/dOzN42fwd16B3XGvcONAEpYlQfLBavkNGQpvKex4LYiU2uGIf
         8ZqbSBtpufa7ujmeQNG4otz/q3NhOewUvfMh77ev2pnGzvd41ciPBEtXrOXYTlFsLidz
         lx0/n+p40VIqtErkN8G9sd+pXxv2W+nC/7gCmXCcwERPeeJALn9BHwxRyCsGCPWfs7AH
         lXPTIRTwLquCn0Pz3ZS8yCZSSzrDbVjvhi5l6dDIKVxWbSTG5QQS5UZOZ+v3a5TKFqve
         idYK3+vX9YsJ6c/6vsoqpsClxMCqumKxtN4tG73n7b3HwSSXbbbB0sEnUpyA3OJGlkfq
         QNig==
X-Forwarded-Encrypted: i=1; AJvYcCV6I9oD0M3m3KKTRPHYOF7Go8uEXHCXw5zIm5uqRWM2Ex+2f3ciVs+WyprPxSd5wVuw/zNa1278oex75Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRN31ItLyevYYm11XM9S+/czmMHzlpO3tvkoFxBfJlRLUK37ST
	FqvZHVmTw/SHJr+OutN+K3PIM3BhBCao76IguC2thXJQoDIVO9k4OhFd
X-Gm-Gg: AeBDiesmjJcVRGD0JH03jK7Ec1cUtZZNEi52prsGbKsp8mf/59Zkg50Yco9JQmqBdMK
	enkj42q9b+cT0QYpdVQpSxV9NDs3XG4aYxid3HWhIA/YcOU+5RLmWmEkbTGr5T1Wgc7C/eGEf2t
	p79U/YmvWgwQMcCW2gaPGVhZHHEP8m69iOB41307yF++5gtG3BcH3VEe9PP0d/q/Yph4zEQaCZw
	o9uMw9MHNItV8yvKwJiiilP8fk4QuHX5888icevWJL4XQ9nf547cFU7btU+7TfwcnhTaCgfIemE
	g7Yk3jS1XAFxaxm8oIhRwo34kfytSgH0qWa7/dpGi1Obuq+DC95s0qaI9w02j57L4u8MoIkC2zh
	HFC6WrFTzMxR0I3WBNwKrJP84oz+W7iRIDnYyGeQguY2+0rkYYT80K8QWSG6qp0AWpTZoEjFFvV
	9uFiL4e0/1EIkh
X-Received: by 2002:a05:600d:12:b0:488:8bdd:cfc7 with SMTP id 5b1f17b1804b1-488995d140bmr130951175e9.0.1775464457889;
        Mon, 06 Apr 2026 01:34:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:17 -0700 (PDT)
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
Subject: [PATCH v1 5/9] ARM: tegra: transformer: Add support for front camera
Date: Mon,  6 Apr 2026 11:34:00 +0300
Message-ID: <20260406083404.31359-6-clamor95@gmail.com>
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

Add front camera video path. Aptina MI1040 camera is used on all supported
ASUS Transformers, but only TF201 and TF700T will work since on
TF300T/TG/TL front camera is linked through an additional ISP.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra30-asus-transformer-common.dtsi      | 138 +++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index 0e06136042a9..d4a7bae51830 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "tegra30.dtsi"
@@ -73,6 +74,91 @@ trustzone@bfe00000 {
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
+							/* Add rear camera */
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
 		hdmi: hdmi@54280000 {
 			status = "okay";
 
@@ -1173,6 +1259,36 @@ light-sensor@1c {
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
+			vddio-supply = <&vdd_1v8_cam>;
+			vdd-supply = <&vdd_1v8_cam>;
+			vaa-supply = <&avdd_2v85_fcam>;
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
 		gyroscope@68 {
 			compatible = "invensense,mpu3050";
 			reg = <0x68>;
@@ -1310,7 +1426,7 @@ ldo4 {
 
 				/* LDO5 is not used by Transformers */
 
-				ldo6 {
+				avdd_dsi_csi: ldo6 {
 					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
@@ -1685,6 +1801,26 @@ hdmi_5v0_sys: regulator-hdmi {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
+	vdd_1v8_cam: regulator-viocam {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_cam";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	avdd_2v85_fcam: regulator-avcam-front {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_2v85_fcam";
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+		gpio = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
 	sound {
 		nvidia,i2s-controller = <&tegra_i2s1>;
 
-- 
2.51.0

