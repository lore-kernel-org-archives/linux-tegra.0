Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2983A9D9C
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485777; cv=none; b=aYLwfS8NmJBhmjwyqO3XXqV6sksb6A82ZTkf+MT7tPgJNtyDi9eqraxi9Ors4fIVYmXz2Q+IhKSavVnVDVGenAYr72o03viiGBnrOtB37JVPNVm5SgoM76Q03KX6kodHjszi1pHaGmG5rJlxnx5L6XOPiVw/lg7QwYBjDUJY/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485777; c=relaxed/simple;
	bh=HvRnVDts5ARzEgDQd1uxaF/Ni636zkJ9D8rxyroqkjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nf0umK9WewGFr8+YfV/oPKE0OzhscwphWSQJZ9Opgl/iZbRSvww2QTtDCT/FuL6g92Rn7NbrZPHkb+oNDikPSCcqvPw4X/ECTqzoQm7rV/RFRZyJ4JQIdYWiKyfdUChxuSOF2U/sSdvBvX8CSjryr4TJATBh4xA+SN8quf6/Zok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdVEZZFA; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdVEZZFA"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8c94cefcdso531837e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485763; x=1779090563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=YdVEZZFAE6cVPajPHpEjMvXPeXCk/cMH90hT1Vy4PuOFg3IQsdsFVm1pMvw1rKWEay
         B22r8MRYi2d087w2nzbm0BJrlDe6zoDRnDZ9wT1dZZUshezjEpJkZlROs4CahFaetlsl
         UBmdDojRAO0ZCluC/oCs4a5oZ94swucKJ/XQygsJbGI1SUMPc8Nnu15B8U/z9rYdUbDc
         rhklGu666Z/vtvXEbkEndiAc8990hwzujQWFGWJyiUaFQjRSGaCx3UE11afKxEQIfcpP
         H003mC0v1fyo6zJYTuodhmSYyOtUxfhGTbJ/g587qOOa0vlZ5EE9ITExWKGkH5KjX3zG
         o2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485763; x=1779090563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=PT5B+ckDaghuDHIH/q+IL1ZnBilnX4yoEw/8IVQxZw5LJn/cAegzQm5QnsNsc8xSit
         kzFJhkJvGd2+PlOqo19s824lMjlWaTtofqQHT6dBZi5YVRGcy/nMPVSdkhv3+1HSpNTD
         TvLVetFR8dxDpeu4XPDrZ2AyHZzEVWdFo96MiGO6uRdd+uE2j8eaYNAqQif2ha1LFlmb
         c21kwO8+Xx+fqWF14qA3UvZT18FVYAo+mqajdrvqfze0Gn4OZAJWVsfCxWxUgErcZDjL
         Uu9DOhJWqXeqzVjwj6JTZlrjCTW4i5ZXPcmYHrp9Ln9EjkavfFR3KnSElmzFesbFUeV8
         UIDg==
X-Forwarded-Encrypted: i=1; AFNElJ99+fp9OCfvQhE73ei9zb+iLgA0ULLjEL4cEt2KXswoh0zoN/7Usb9ihtN5QxHMuFl2P/bhcSqS7tqg6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUjmr4at0oHgWUAwkJes2ubu5eoS+6VKuRrpmZPD99QvMKJpvH
	A4VD4OR8jZM9fZP+B5RYILvYnT5bhL1PFAUuiKR/ujKgDvSOHe5j2kgIR/TEyw==
X-Gm-Gg: Acq92OHjv+ADDBlYJjPtbT0vzIR+9SsqmkcoVnh8bFIdEIe3ZMAQbpJj5z4j8Ik3X4k
	9QHSOVrElsSAuUFFFgx4F+qx8pzBdMUGS4nt7uBzU/ECcoA9cChkXZ7zaL4WBGvZblt1LcXUeOK
	fEhQCEpG+nsgt3uKn+27KvylrAFp5P+k86/t+RcrE3Yrli7k0+F8LkaIiEE2k3MJ0AT1ymchKnG
	/Qsu8GH2hdDawh1grUdqPYryL5LyBHOYyHf6/M7HeUyeBjvRo4f7jws8ApuOBQI+xo/APUEJeS9
	1D3yWaA+LBlgNMFI5XXqRFOzQM8XJwZwINHRlIYIQJFNxQHwAKgEuy0hDUASKTOHfnwlpTo7WA1
	D606NTan10WVWUjAuHd9k1h19TfztltK1vRk3Fp/cttgwYlsNlqxTTC5crhhxF2vMTrOfVj+7iv
	4ePa+OGkPKBIO1xm6xokGEQao=
X-Received: by 2002:a05:6512:3d8a:b0:5a8:a558:63b3 with SMTP id 2adb3069b0e04-5a8b709b088mr2382639e87.30.1778485763421;
        Mon, 11 May 2026 00:49:23 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:21 -0700 (PDT)
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
Subject: [PATCH v1 5/9 RESEND] ARM: tegra: transformer: Add support for front camera
Date: Mon, 11 May 2026 10:48:55 +0300
Message-ID: <20260511074859.24930-6-clamor95@gmail.com>
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

