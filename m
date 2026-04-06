Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D74531355C
	for <linux-tegra@vger.kernel.org>; Mon,  6 Apr 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464464; cv=none; b=OrlGXKjtlJ/SEkDcP73/WAtkdHr/WaFGgNtLT+fCjHmsxXYyVt4FP+xIARMdO7MXd3hFhpowtsf68dfZ4ypAhNxVP3uXl74hdKL9KpuGRD0HPUUCCP5+vcRDNHylHYcMeRy/ChIAZq4c4HxHlqv1TcVmG69ZLSqVtmDvLCjruS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464464; c=relaxed/simple;
	bh=3yrZD3kUqUFtnfW7CJEM53Vi/Lg2JOO94rBYam+onYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPe/kJqcAtRd9OHSqQMtKG+Kj4D1zP9nBM2aXuTyoe91N+eZNSaVA+OyPoe8bu/XBUag3uGa2XF9b/F0CIvFe5up6PMaaAi0pgUQMjHSnL0rTw3hg9R/gEn/HmJUdXqDYyeQzMcn7GrnmE1ju3lL7u55gG3dwkfZlZ2PoCHqMkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlRyGalY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlRyGalY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso4560805e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 06 Apr 2026 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464460; x=1776069260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZzhB7vHBcFUBfR2BiDFSMeGlYuUMXHq/TSRPK44UZY=;
        b=OlRyGalYLwppGeuRseetB9b6hmv3oDJutIVX7M0WfFcKNtxFX9NrggUoje1LOBRTW/
         ER5Xzz9M0UWAT4zdD9d1NbvhhzmnKe8erG8+hZohcK937OfwLRpLpKwAHFHQzP7SuVcD
         3J25P1rozWuhKnqekJjiGZvUx3xtgoROz3+rN+fOBApM1B2ce6nhg2e2D6x4xcC8x2vp
         zlqQGc9uNq+fzh3+ZXRdBEuah1S++AyzEiC5hoDzJz1aMGeUzdSJ4X18vPSdxCuGTUgu
         UY9l8oAERuUUW1qjKQlRU3bjmZNZ01fl99dJ2RwP93GmU132Poa7a9b7JDLnmmamnbXF
         HWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464460; x=1776069260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZzhB7vHBcFUBfR2BiDFSMeGlYuUMXHq/TSRPK44UZY=;
        b=QdIjbUtSawShehBCZV729W9vH/JnqKkc2ZJS+ytBc7QfIB1CVH7z8JSU3qMX7yb2jT
         F6xMRltYS85HuNq/AN5TtqF5OVxRBzicTG0mVLMNzLkaGQ1NQVQwVcGfK+aov5/UEARo
         H4nQCYOdt9eWuFitEE+/TNCnNH389m2LcYm9V0KqSdLokzDhGyY4ksK83QIc1rH0BTD3
         QQqqNxRlKFxSCvLmjN1W52glYXQLatsl/o4vbXIXIWTmGrc9ozflQspHAsqw5BkFuzUj
         P+JrBvkD9UTaey7bIswB8RpPgvQKHlyoA2oVQ1jWLSywbZKmpFF4Qi3QOgPZhDPvWeiB
         8vSg==
X-Forwarded-Encrypted: i=1; AJvYcCWrS6NTc5/Qf31ull2TfccMW/qY9tG3M1Thnt2cJYpZc2bDl6BX/IW0xCOEvmOh74+hVD8X+FRfiv/Vdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoFVnHpvfm6HC/r2wruOOU4i7DVoDHf7CGhOytnWKYsQtLZ10h
	uxQpeJ7i01DUnGRWOyR6MpP/HoRxC94FT8Mzpv1NgrwyF7gpb/and8Fx
X-Gm-Gg: AeBDieu8Mc0ciEeteszGFvCQtfMOHV4xH0YRKlwu5JJkKEn7cTZlNp4OM+Gg4L0HMp6
	ILSGfQR2+EBO82+u79oTNSfod2t2pdpsdvejbWsPtHpEoD6V2WopSd83PingTOkbZACeOskaqXf
	4FF1VVA5c7bpHcg/RUjEoNvQTLjNnN1Hf5/blvIrflxiUSdk5sHvmWUkRRXPl2RCaahKR0kWxY1
	qR1B83ECmbX9JF6d4zhIKNSBgcnwmYFm03L0XQH2t9dKTxFFfIIOuesNLY4dG+EkTkHzkvKq9YF
	sI2iZ7dXd8NXgAJygwf1UZA0C5Clmnx2w5mHQ7Jsh0Hola1LaKzop+9mQRVW++6Or+funyFGKx5
	kyDKLM9FseKNpKYfmmvaTTzZfJ+3kxdKhQaKwuy7puMmDprwIslab+RJvqCgTCOs69UJ4iq/ZHa
	jXoE7/xjt52PYO
X-Received: by 2002:a05:600c:1549:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4889949bd38mr160158885e9.9.1775464460023;
        Mon, 06 Apr 2026 01:34:20 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:19 -0700 (PDT)
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
Subject: [PATCH v1 7/9] ARM: tegra: tf600t: Configure panel
Date: Mon,  6 Apr 2026 11:34:02 +0300
Message-ID: <20260406083404.31359-8-clamor95@gmail.com>
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

Configure DSI panel used in ASUS VivoTab TF600T.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 62 ++++++++++++++++++-
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 9296e7970ce4..8b68bfef8dee 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -23,6 +23,7 @@ aliases {
 		rtc0 = &pmic;
 		rtc1 = "/rtc@7000e000";
 
+		display0 = &lcd;
 		display1 = &hdmi;
 
 		serial1 = &uartc; /* Bluetooth */
@@ -55,6 +56,37 @@ linux,cma@80000000 {
 	};
 
 	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
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
+						/* Link to the rear camera */
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						/* Link to the front camera */
+					};
+				};
+			};
+		};
+
 		hdmi: hdmi@54280000 {
 			status = "okay";
 
@@ -68,6 +100,22 @@ hdmi_out: endpoint {
 				};
 			};
 		};
+
+		lcd: dsi@54300000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+			panel@0 {
+				compatible = "hydis,hv101hd1";
+				reg = <0>;
+
+				vdd-supply = <&vdd_panel>;
+				vio-supply = <&vio_panel>;
+
+				backlight = <&backlight>;
+			};
+		};
 	};
 
 	vde@6001a000 {
@@ -1123,11 +1171,10 @@ pmic-sleep-hog {
 			};
 
 			regulators {
-				vdd_lcd: vdd1 {
+				vio_panel: vdd1 {
 					regulator-name = "vddio_ddr_1v2";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
 					regulator-boot-on;
 					ti,regulator-ext-sleep-control = <8>;
 				};
@@ -2386,6 +2433,17 @@ vdd_5v0_bl: regulator-bl {
 		vin-supply = <&vdd_5v0_bat>;
 	};
 
+	vdd_panel: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_panel";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
 	hdmi_5v0_sys: regulator-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "hdmi_5v0_sys";
-- 
2.51.0

