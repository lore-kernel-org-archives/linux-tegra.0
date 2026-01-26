Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D930DECC
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422513; cv=none; b=tGQKi0Yel1xSjfJ0DO2pCWtYcaYRr7TelcmfWJ9X9IQPc76KRgjrxYk3TtBIpkd+QnZAtBYBx85PGoBmp3SxOekUbWYDXgUucEB4+B1BM+yzstaezhRLSPYtb3rRT1aU6Hugn81zkLul54eokpCampQB14JLMYuG/Rcu31AL4U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422513; c=relaxed/simple;
	bh=C7FSXnhNCzHXLjCA2xi/1xbacAe+dijTj6X7KneFqic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSXiMYhmJGs9JHgiIMFjBQn54wRPhJ4abHMzKJ9HUIkD+yYSyEFJVzN/qqf/ZCEiyq1Sc8zPafccZwpQy4Q4d6B5OxbeMqunSxkkLBbuTFkN52do8adpmgetcU5xWM7sDTLYIgBD4gLyiqnZ/yQ7QpnzNuQnyIqwdGAgCm7SA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANEPVMOx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANEPVMOx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so32576085e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 02:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422510; x=1770027310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXSsUeEe6Ho3pzDTRZABOlvJdmrHwM6q/RZLBXXZ1I4=;
        b=ANEPVMOxI7Q7jzMGBLfHNWJ1BbywrfBF2C6HalfwE0/CRlPf383rpCvLlIYilbzMIP
         ivNpmYv1J07pDH+6QLR0LnKJ8C/jq/WnkKYz8H6P86bBYvlvr7E50OmAxBK1ep8JtUaH
         YhxDcmAduM7OaODY7AMHIxkv192yaI8LtFhKMbBzOVHsIt8MPi5ALzhURv6okWkj/2vp
         UqgnzoWz+lAPOZWRy1HdU3uwzOfO11zo+0SIde+q615G1d+NXMU3MSJ6TIwbMoUvDdXc
         ChET+IJnI2sxjcvHASj1oYAFtYVB5BgJroF+J4iirLVvdGVZvR3FIyJehzr/EwHFDBIk
         PiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422510; x=1770027310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXSsUeEe6Ho3pzDTRZABOlvJdmrHwM6q/RZLBXXZ1I4=;
        b=Symep4ij4DJmbH6mGc0F6nQQc6hpoZCnAOVzR+bebNIkayO15lxjn+RKGOrktdSm2J
         jxAKyrijy6gz/RGbjL14XDrugwIi8hV2/7fQSfC0zSbsJYGkLm/UeyH0hATfKO6HXaOe
         zR0O2J5fwfVs9AvE2Jd/V/gUOSu/7IXV8rIRQomipuoLKCib9upUcMWLtBxpgafWAxeh
         fPcznhxChDROhTECbKTyJBNk50o8YC51Oio07DhWL793LxM5Q6xDYTKMCGwNASf00bS5
         jv3cDYiewawCADBdsud8ctMPyL5BQ3/PKnYbBrHC/7niVd5NCq+ETAItjl2hMJjjP4ah
         3Bxw==
X-Forwarded-Encrypted: i=1; AJvYcCV/gn1NfTY3Ji25aI+TTCmxNOhE7Cuyb2mzpGwhDozFNaIjvWlOsNESwxmioKuVrIecLIyIQiTZ/E9MCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6oUl3ChwPBhpUEZhCT0JfPIbln3nWEv5oh51DMGbmjR5d70WD
	VYkkc53WPzgkaZ5lB+zEpapfNaANJehdpfB9wiAHbIvc5oJwYNNYAOwl
X-Gm-Gg: AZuq6aKKuGfXMC7U1IgupCtEn8CZUR7a35J/JyJOLOkZ3YOWxRTZTxp0enBS+Z5yMRM
	7opPiiRs3v070vX9M+TfHtiDE7U3Z/eoPsxx8dzIM5yCr+V44rRz+5wU3qib8z10AmzcrbFJWD6
	aDkGNDxzVN0lCcz10K+diNFmTMAFvo2FGrhxKztajCjE9zJxXC9kIpT4WA6ZEhWuLka9yklhUYu
	zJU0MH990XZH1/WnN3op0Dc5rV2sFjkf7/fG82AiH78HCIe+fJCum/yxaN7EWN5Qp3mizqTfV9a
	g+r0VN3A5b1UqJgmCmnmE90h3ljzAQscMXnk09EPvbjVxPvkwrwlHMwvKkM0tFcbwRBeWCt4AvS
	uaE72DoRnAHr+n3mDgTVkmURMG4xT1FkDSNeSHyL/F6P/HXCWmuhNHorv/h3ZhLwjN7OxN9RM59
	GA
X-Received: by 2002:a05:600c:1993:b0:47e:e20e:bbbf with SMTP id 5b1f17b1804b1-4805cf6690cmr67919285e9.24.1769422509856;
        Mon, 26 Jan 2026 02:15:09 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm319771795e9.11.2026.01.26.02.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:15:09 -0800 (PST)
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
Subject: [PATCH v2 1/4] ARM: tegra: lg-x3: add panel and bridge nodes
Date: Mon, 26 Jan 2026 12:10:15 +0200
Message-ID: <20260126101018.24450-2-clamor95@gmail.com>
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

Add RGB-DSI bridge and panel nodes to LG Optimus 4X and Vu device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 23 ++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 27 +++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 81 +++++++++++++++++++-
 3 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index c6ef0a20c19f..cc14e6dca770 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -116,6 +116,29 @@ rmi4-f11@11 {
 		};
 	};
 
+	spi@7000dc00 {
+		dsi@2 {
+			/*
+			 * JDI 4.57" 720x1280 DX12D100VM0EAA MIPI DSI panel
+			 */
+			panel@1 {
+				compatible = "jdi,dx12d100vm0eaa", "renesas,r69328";
+				reg = <1>;
+
+				reset-gpios = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_LOW>;
+
+				vdd-supply = <&vcc_3v0_lcd>;
+				vddio-supply = <&iovcc_1v8_lcd>;
+
+				port {
+					panel_input: endpoint {
+						remote-endpoint = <&bridge_output>;
+					};
+				};
+			};
+		};
+	};
+
 	memory-controller@7000f000 {
 		emc-timings-0 {
 			/* SAMSUNG 1GB K4P8G304EB FGC1 533MHz */
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index e32fafc7f5e0..ab8f5cf317bf 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -112,6 +112,33 @@ rmi4-f11@11 {
 		};
 	};
 
+	spi@7000dc00 {
+		dsi@2 {
+			/*
+			 * HITACHI/KOE 5" 768x1024 TX13D100VM0EAA MIPI DSI panel
+			 */
+			panel@1 {
+				compatible = "koe,tx13d100vm0eaa", "renesas,r61307";
+				reg = <1>;
+
+				reset-gpios = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_LOW>;
+
+				renesas,gamma = <3>;
+				renesas,column-inversion;
+				renesas,contrast;
+
+				vcc-supply = <&vcc_3v0_lcd>;
+				iovcc-supply = <&iovcc_1v8_lcd>;
+
+				port {
+					panel_input: endpoint {
+						remote-endpoint = <&bridge_output>;
+					};
+				};
+			};
+		};
+	};
+
 	memory-controller@7000f000 {
 		emc-timings-2 {
 			/* Hynix 1GB H9TCNNN8JDMMPR LPDDR2 533MHz */
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 909260a5d0fb..6eea8eacd7d5 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -20,6 +20,8 @@ aliases {
 		rtc0 = &pmic;
 		rtc1 = "/rtc@7000e000";
 
+		display0 = &lcd;
+
 		serial0 = &uartd; /* Console */
 		serial1 = &uartc; /* Bluetooth */
 		serial2 = &uartb; /* GPS */
@@ -71,6 +73,21 @@ trustzone@bfe00000 {
 		};
 	};
 
+	host1x@50000000 {
+		lcd: dc@54200000 {
+			rgb {
+				status = "okay";
+
+				port {
+					dpi_output: endpoint {
+						remote-endpoint = <&bridge_input>;
+						bus-width = <24>;
+					};
+				};
+			};
+		};
+	};
+
 	vde@6001a000 {
 		assigned-clocks = <&tegra_car TEGRA30_CLK_VDE>;
 		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>;
@@ -1357,7 +1374,58 @@ spi@7000dc00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
 
-		/* DSI bridge */
+		dsi@2 {
+			compatible = "solomon,ssd2825";
+			reg = <2>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			spi-max-frequency = <1000000>;
+
+			spi-cpha;
+			spi-cpol;
+
+			reset-gpios = <&gpio TEGRA_GPIO(O, 2) GPIO_ACTIVE_LOW>;
+
+			dvdd-supply = <&vdd_1v2_rgb>;
+			avdd-supply = <&vdd_1v2_rgb>;
+			vddio-supply = <&vdd_1v8_vio>;
+
+			solomon,hs-zero-delay-ns = <300>;
+			solomon,hs-prep-delay-ns = <65>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+
+			assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN3>,
+					  <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+			assigned-clock-rates = <24000000>;
+
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>,
+						 <&tegra_car TEGRA30_CLK_EXTERN3>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					bridge_input: endpoint {
+						remote-endpoint = <&dpi_output>;
+						bus-width = <24>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					bridge_output: endpoint {
+						remote-endpoint = <&panel_input>;
+					};
+				};
+			};
+		};
 	};
 
 	pmc@7000e400 {
@@ -1617,6 +1685,17 @@ vdd_1v8_sen: regulator-sen1v8 {
 		vin-supply = <&vdd_3v3_vbat>;
 	};
 
+	vdd_1v2_rgb: regulator-rgb1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v2_rgb";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_vbat>;
+	};
+
 	vcc_3v0_lcd: regulator-lcd3v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_3v0_lcd";
-- 
2.51.0

