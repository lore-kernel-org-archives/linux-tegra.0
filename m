Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCFE32ED58
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422515; cv=none; b=BIO1zytxhYjxP68vIxYp769zyAQZrPIT8mUhQq/tgOPu3Y6Jwj4Aaz+VAVSHdMFIH1SEWeEaxlvWuX5PyjefRbsDS90X4jyE8//o/TjSNNibcS8NNDkBGN+fQnqtu5uCVWbGrBqhnpu1QI+/cPSGy9xRXfYE0RnT9H34MPPe8c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422515; c=relaxed/simple;
	bh=99gnZcZxjVKePLKi790JFN3qskIt6IL6hQQaLwg09j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYe+ZI9GFKlwLwFAjUo9vM4bZNod+2EYMj9PuVy6kNdLNWHDQLEd8WhDFCOfyoClRqGHfOmDAPIAF8K/jMYEB0y20JM7HYX240qQJv0eCenqo9oqvvJyYt17VwiO5mfiEijUx0TRb9Ig8f/X1T+AHeWhAvlSzRtjBOQ1czhVvTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs5USPRo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs5USPRo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso47131815e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 02:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422511; x=1770027311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nApJ7Qkf2Z+O7u87Az7F+sJc0V4S0WdNi4tOh3+T5Po=;
        b=bs5USPRok7e89JHN3GO/yTHMznKv6Cu2s11LbHYgyEfstouFKS7cEy5Sg/XKK/l1VM
         v2RMxWh9o9vVA92tbsKAu469lfn0Q6OQmuWcek3UsaySHK1Ha7htvfnx8UwLvy7jpETk
         80N/Fh661LOp7TPwtqmp4geFpGCQxxPZbZixxpDEeYOVI5D5rimrCgKuLE5LVsd/hJGF
         xZJWKpijvInIgyof2ldgkxzy/dOcgQucdt5aHx/+sjQSXGJLIfVde73E+3+LHUxKTbGE
         lx+k4k032z6BxxToVeBKuctL8biMcuKeRNfJiS72sCvuwYVcHx1ogHCOp+bSmVp6YaHK
         Umww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422511; x=1770027311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nApJ7Qkf2Z+O7u87Az7F+sJc0V4S0WdNi4tOh3+T5Po=;
        b=nJLWcxodlmHeOJdxpKzcdTOPXvECmk3r3uq9AQoyjLS40gcnCV9e98/4ynJ8KDfL0Y
         PnKpIxfMVYe+7+N4lj0VgDHVgQJq/4dl3kME7fXKbzYDnH3vmiHRLGSIIWwF5CpRUr/9
         1TgAMqStILDYTvgwD+8ehT6uH0krWEtt3WoWqDvhbd3mINWt1nwnHB2yE2eyOtvCXHsk
         ASQ5jaFoPLBtnd+Nk8yNUGnLmz8wKpOooVxqElPuPRSpECyhdmG9/UM+Yc5YUweNsCkm
         5NQDAbo8t7vY3j08tIyDs5HUZRdBgPtK+vqU7+sT9ibmOwZTjTn2msrX4PQD5ym44Lg7
         WU7w==
X-Forwarded-Encrypted: i=1; AJvYcCXU7JQWaooEFuCcFeg3dk3EP8lpDMUoNu2bpVSxUuphZYar5riVa3pK4+7psWaW4+O+n1wPSzlG36h1Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaJxxN/F3Lhx5AP77N6iFPpH5fSj5QWbkWMz82tUEnR3fSVrN1
	IkVAEgpUgB7T3gYFju3dQTJKnwBdPtP7wn0hT8qZ5lrdoQfkUp/1Mel8
X-Gm-Gg: AZuq6aLKdesLokf+T9Ig/PvBYD7Tixp50OgqeF25RwxEIMtPzizV2OzozmWGxVQNDYK
	B4k2G3AxsSG/IvdY3AJV07T7R9UNemFPxGmhURvsotr8d5YIW+QPSSqTFEGflDDvh1CdDGf+v0q
	3AlDXE2xAy/gVZwPO/cIMtN0g3tUdZcUnb5NTdxJKMmeCPdos4xsc6eOZMeFYcNk8X5Y4ybucPV
	Bebbn82mmECcCJZaNHJ2e4ij4rMftnjGp+1pcgDEFaf3X4IDk4uXcy01a6jTbJpJEQIPWcE5rUh
	7jDZPLAVRq90ZBvl2TFG3dgZ46oObIGvPHGBgf0fh0BIwYrzq/gf/0OENQL/ehZmEmJv0ksVoZc
	tEilQPhENVJinXxIrBIpz1i2oesVHHUNcECmrbb0hUoMqckaR2DkBEC5jZ559IItWTXOYgeC61p
	pQ
X-Received: by 2002:a05:600c:b86:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-4805d0643d0mr68648265e9.25.1769422510747;
        Mon, 26 Jan 2026 02:15:10 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm319771795e9.11.2026.01.26.02.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:15:10 -0800 (PST)
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
Subject: [PATCH v2 2/4] ARM: tegra: lg-x3: add USB and power related nodes
Date: Mon, 26 Jan 2026 12:10:16 +0200
Message-ID: <20260126101018.24450-3-clamor95@gmail.com>
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

Add missing charger, MUIC and ADC sensor nodes. Reconfigure USB, set one
of the ADC channels as the fuel gauge temperature sensor and add a battery
thermal zone.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 93 ++++++++++++++++++++-
 1 file changed, 91 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 6eea8eacd7d5..768e201456d8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1070,6 +1070,38 @@ rmi4-f11@11 {
 				syna,clip-y-low = <0>;
 			};
 		};
+
+		max14526: muic@44 {
+			compatible = "maxim,max14526";
+			reg = <0x44>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(J, 0) IRQ_TYPE_EDGE_FALLING>;
+
+			muic_con: connector {
+				compatible = "usb-b-connector";
+				label = "micro-USB";
+				type = "micro";
+			};
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				muic_to_charger: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&charger_input>;
+				};
+			};
+		};
+
+		tsc2007: adc@48 {
+			compatible = "ti,tsc2007";
+			reg = <0x48>;
+
+			ti,x-plate-ohms = <1>;
+			#io-channel-cells = <1>;
+		};
 	};
 
 	cam_i2c: i2c@7000c500 {
@@ -1326,6 +1358,22 @@ ldo8 {
 			};
 		};
 
+		max8971: charger@35 {
+			compatible = "maxim,max8971";
+			reg = <0x35>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(J, 2) IRQ_TYPE_LEVEL_LOW>;
+
+			monitored-battery = <&battery>;
+
+			port {
+				charger_input: endpoint {
+					remote-endpoint = <&muic_to_charger>;
+				};
+			};
+		};
+
 		fuel-gauge@36 {
 			compatible = "maxim,max17043";
 			reg = <0x36>;
@@ -1334,6 +1382,10 @@ fuel-gauge@36 {
 			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_FALLING>;
 
 			monitored-battery = <&battery>;
+			power-supplies = <&max8971>;
+
+			io-channels = <&tbattery 0>;
+			io-channel-names = "temp";
 
 			maxim,alert-low-soc-level = <10>;
 			wakeup-source;
@@ -1514,12 +1566,13 @@ sdmmc4: mmc@78000600 {
 	usb@7d000000 {
 		compatible = "nvidia,tegra30-udc";
 		status = "okay";
-		dr_mode = "peripheral";
+		dr_mode = "otg";
+		extcon = <&max14526>, <&max14526>;
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
-		dr_mode = "peripheral";
+		dr_mode = "otg";
 		nvidia,hssync-start-delay = <0>;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
@@ -1803,7 +1856,43 @@ sound {
 					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 
+	tbattery: thermal-sensor-battery {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&tsc2007 4>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <1>;
+
+		temperature-lookup-table = <
+			(-50000) 4100 (-40000) 3980 (-30000) 3815 (-20000) 3610
+			(-10000) 3285        0 2880    10000 2445    20000 1955
+			   30000 1440    40000 1125    50000  840    60000  665
+			   70000  465    80000  350    90000  230   100000  185 >;
+	};
+
 	thermal-zones {
+		battery-thermal {
+			polling-delay-passive = <0>; /* milliseconds */
+			polling-delay = <20000>; /* milliseconds */
+
+			thermal-sensors = <&tbattery>;
+
+			trips {
+				battery-alert {
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				battery-crit {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
 		/*
 		 * NCT72 has two sensors:
 		 *
-- 
2.51.0

