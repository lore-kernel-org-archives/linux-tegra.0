Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C532143E
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095650; cv=none; b=ek39N8/3Weaj0ApeyaCUhlAxjKFNiWB/Q2z2qV6wHwPI+ZkXICpJoJD2NS01JXT4w2sx9JJbq2uoYlpquhnimKvQ0ermGxP0Z9WH1cJfnkQaBfD4edBcYi7GNfz5kdon5YWkRg8tuRgi3Qm/WgQPR5jOoPQZ7y9S/7QodqQv7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095650; c=relaxed/simple;
	bh=eGM/EBqMEDcFmuDjFBM1kZSkKLO4wV+nQKaKtiOH3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSS7MkDfiapFbHS/Qb8L+WxdfURpHGeKFqWk7h5ozUC2NZjhmVDq2Ze8aYxZAK9aefFYdxSUv1jZOndEvmeXeOj/6fcVjalHcIv0SDe6jQ/uct49VuJcB+9QUn65S/Nu34HXgdiCbd5YZCGZB2wz35X6ISkEkpGcABcF1sv3zLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2oTlG5j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2oTlG5j"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-435a11957f6so913553f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 07:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769095646; x=1769700446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSZwviFf1x4T/s2toJik0HTAfoFK/jhdfg8B2E1Bx7s=;
        b=h2oTlG5jFtxpa5seM6TZUoLqhkBJX4ixn4XmbeQGiKJM/Je/xjBYK36Qhxx6lwPujo
         /XKxlUouRmoimsO9yudNlX/BI33MO+yQZmwval+yfjibiSA7HABBUBPMGptVvDe/Et+b
         LmS33MsFNh6NzLTSyR+A6wnv2r4E9xfp9VU0+Yl914IHks8CQIYZ7KLuHUzzbIRym2Rm
         gMdfW/1W6/yTXfBp9F2aBvaaKXDgIc29lEWQ7Ok47VyEJfBmJhFPjrb3/WNEa/ukkH2R
         O/aHY2uvT9eb9ELhEM8IaxnEDvMXo4nU/IZ4GLekMtszb9u8ZdBBkDhv2gBq5EctiSN0
         mTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095646; x=1769700446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSZwviFf1x4T/s2toJik0HTAfoFK/jhdfg8B2E1Bx7s=;
        b=K+0gRm0j00Ys1f8oHEsSGu/V8sxA7cm8Qvegp1c1w7u3SHuGyJ+meEH9VA2aMYUnEg
         LPfV1t6hg5u6IuSHxc/2e/tE0HcfodmGivw49gau1Cy2cxfdeZDe1eyVLRerk+4WSVTl
         UV9CV7k9axovzRfCdKyNh4P0pPXetDgOnP/EgVwK+MTdnFO9CYAdRdyIHspALzs68Q82
         50rqjYds4A8oAJz4lRJlEVslkdxNrPN0bB9ucSKfEmbBFWnhNEvg5p1cgiRBDchvdQeB
         WvTwI9IOG8rdJbb3B4OJ116pVY1JojploiUdPs9ILdgpYGIlUoo+MoW9tnxP+MEyYGiy
         Dvlw==
X-Forwarded-Encrypted: i=1; AJvYcCXIDW3rs+4I84T9fSXkuaJ2tRksaotgwlTgTbrCiqsbveDu5hZOrXOpRnktUYRebJrTUlnNBHDx5jR4Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkQg4HBKKJUsihE8DWS9pXoegqIaQ+lYZSwocBqkWyqABGKuy
	eo6j+HeWbDYMy5WzbhGmz0WyyRiOTGiALEBb/owVIVsjMhwA83qT+SVV
X-Gm-Gg: AZuq6aLOoE1pcVwuCVTa4B84m56BAJDXWJT/Q2hXm2o1fsGYPN09TWt1ZWnccGyCUmf
	605dRLaUlGapNSx7fIJiZuc8v9KKGdA948lwz8nMfICxhDLnSmneh/CluvPpcK7NDSxHk5UPrf/
	iR6VQcdGA9wdlmFsrk9TOHiDaxwklxYSK2eK1zKGUYQ2LFWljlGP+8hq8ea0BlJ3CFbQD/rG3zq
	iGDgnMKhYdvrkk5MBQwJv0lXVFoEU9699SfgPt0nMKPutHKZ8Zc2/Xsh6SJuIKxtoblQnMrZOgP
	VlOusbuZFfkEgsRntZWRfXcLVPGaOhXFQ2eqh05c8aFDt8Tgl99BQ7JopY4jpsQRUYDl2HelqlG
	ZSm1gVhH6EPsD+sC1TMsFlRAO27axPPmhQ/7jQgiDUvkQzJKjfXKYld1FGynsWecw6FvVf2A8vI
	b4
X-Received: by 2002:a05:6000:2386:b0:435:a9ad:d20f with SMTP id ffacd0b85a97d-435a9add46amr4495671f8f.19.1769095645427;
        Thu, 22 Jan 2026 07:27:25 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f138e26sm20762642f8f.17.2026.01.22.07.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:27:25 -0800 (PST)
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
Subject: [PATCH v1 1/3] ARM: tegra: lg-x3: add panel and bridge nodes
Date: Thu, 22 Jan 2026 17:27:11 +0200
Message-ID: <20260122152713.8311-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122152713.8311-1-clamor95@gmail.com>
References: <20260122152713.8311-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RGB-DSI bridge and panel nodes to LG Optimus 4X and Vu device tees.

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
index e32fafc7f5e0..e300a2c49edf 100644
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
+				renesas,inversion;
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
index 909260a5d0fb..d71d1d6694f8 100644
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
+						data-lines = <24>;
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

