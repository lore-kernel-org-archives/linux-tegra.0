Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378484;
	b=Uk0YdbMNLcgPRLDoex/W0Q3BJIImhdiuy5A198HnKOo0q/LqTId8YUPqKB6V4WZKgLFb
	 XP5H8NewU+a1ty0/gy6ZocVz2W71Fk1X5eazlcyTgRUwsmX5p7Fa+vUYo9vdni+Uruogs
	 KxhXaRzOyjUoDNmYlhH1cUlKR6XcJBoWx80mA2se2zIr7oOBh8bi30eWXYzViqy/rJe1D
	 coibyriBVhLrv3PuHDQg/e40CFdlfhPCQiixfMoJrWLSd3LlrgEAoMo9IStmSx7nY3uOy
	 dEmCmK9tDh65jS2eLKCMEGfuA7NZSRBmgxNj6vxmzsc0TkCKPcom29AE0MpevcPQRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=avCVUDrooB22hMBb4h+eP/HEoR+1Ep1WqePqDENU9wo=;
	b=orCQK7U1rF0tBjQ5jxOtbWN9VmVqTu55AN2PY+Zu4H8gf0HGcwVCZruGnTB/YrtjLmJN
	 iJoROohab0AoaGep2zmSaO8cB5KsdFege6Rp+685w9nGZtkoC+kAu+EFwhIhIh8fxGjpu
	 wvP6R5wonbWMuqevCx5k19uVH8c4aK9Q/CrWk5cSC8OnbXxmKl4yhUTF5CQ/1TMALC/lL
	 uIdY9adDlsBB5Z77o4iQZhQPm8qZc877qc5Gi6E9GANhXWsokvcAQ1ua5It5/N1fLkwyc
	 H2mp7SmZYFjtLy/nw7wWZda4w4ZY4vlB8ImJYDQaJcmdaqh383lAZG4+UJVSk2Zs+Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWuRdJOL;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53C606A697
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB53C606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWuRdJOL
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so4178973a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378481; x=1795983281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avCVUDrooB22hMBb4h+eP/HEoR+1Ep1WqePqDENU9wo=;
        b=wWuRdJOLTWSRrG1GN35fu/fJ3O+5Fiywjt/Z/wNz4rBYs8psR24yswJzDPArrOAuGW
         yrTcDQt63ubedRyHEupTeThX9GRQxRhcu3x/qbroPQEG63NPA6BkfyRqEwgMxsNXB0Wd
         ezkaosIDpVWcEMV0PxcnNci8R3TUTGT6GiBig5Ubn3xP77Ai9VzNGyK6DVmn73muH4vq
         NehEO1oQfHb0M2nyfyo5Jr4kAs+vTRP4oMqYhD3J/IvpiVxIGNu6GUUlATBrUSkboeS9
         6kNDEX4AQRD8wBE0NcbM1e1WCEzbkwaktRYLUmlLg7+/WZuh6Dovp2vXNr55YI0RzKyo
         nmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378481; x=1795983281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=avCVUDrooB22hMBb4h+eP/HEoR+1Ep1WqePqDENU9wo=;
        b=PPrX6xj98ZEdOW10aqwUB4FqLBuKS4NYZ8tWnP5h1rEQMCBp+Nb6zzBt8phr/PG/nn
         Agf6H1Jcmzs387Y7dmqlKR+m5SjcORX+gkqYojYnH6pcVeAwj+FeNbMkNgBPS+XMdBJu
         tGYhW353q4+nctKYE8Du1fAgX7zFhOLIUBmbxCgwHI7iKqeO5jP3fU7XN893NvtfzvRk
         CZHpE8375HhphREAu6pruEUmUBFWV+DPmwcgqVaxykHz3FLHAa5uxvCAKGF562NnWVuL
         I87hcYm1dZgiCwaEoSAmha5T0JAR3FjbfK9MIGmGiHUnTpvoML1BH7cpUt3PhHIQZZp0
         W0fw==
X-Forwarded-Encrypted: i=1; AL+hErGSaysQhx57M/cGwCGVkFBY362Z2uh5VvUft5X6AWnCzRJPex/LEPQTPan+O1IaOJSyWrHFYjZvQL/Nug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BLxbfNH4IOQu//sL+sab7/16uMr+eyHDe+bY+Fdr8LGzi5WCc
	6AHPH+z8Ze3KKSfCAeVXkEQY+tvaA5xVZ+KMAm0kn4Ww3k0YKBmQI9YcmScuDg==
X-Gm-Gg: AZFdTZe+6CAqwBoVV2PLmZzGCoUQd/MkNmSTdKIf0ZUnGjFTWYun6KJ4KZruafeOGT6
	yzDRzMdSncqmEDIVT8sjUMVQ5nySN71W7t7Q4MY/luvKSx55IjVV5XnzhpbB9RmMCa3fLb5iJNH
	02ozG9jSGEQItuI4WgnqtkQIkzfHJQHhNwO8qpxD4zdnglV321myJgwBQMZYfvdTfMy1RUy5DKq
	HIG90UmLC3dBQ5zCnfaXonsGYhU6t94RLtwzmoQJnzUzWDRqKai3mAHErz3UlPYYGdGNkxcuIJk
	BDzLNxPMELQvJHsZOWBr6kPbh29YMbkJoDs8B6+rcHpwSkRDV2WLVBSERozVYWGc4yf2Jb+U6OP
	d2kDtVRD0uu3yDRtn9gg4UfOYFxgcbYVv38H2tTA6IHbSUdJGcixV0RYz4Rg0IDpPttTq/uusoG
	8hK+HmAq0iwHg4DqAsckpq4mCzodgGDivDW8FsD2djNMO+Do89+a6jmaEqpkzwgYdnxFZakhjDd
	dlVIHTPi8o1qQ+gWdWkIzjZzIwm0yPN1fHez4JtBcKTP2KnHy9/mdhDse5311TeVaqrk/0aD++N
	+GW50uyExdNh9VVvp9KhdupFjTFAb2KLsBeeP62ZRNBk4s7uhT3eTrs8AlzV9m4FWrAgWQTZJb/
	ItCCisBVOxOiZeVufLEaDYyja4RWQ4k4=
X-Received: by 2002:aa7:c513:0:b0:6b7:f00e:5e56 with SMTP id 4fb4d7f45d1cf-6ba37c788f3mr5002752a12.1.1795378481168;
        Sun, 22 Nov 2026 12:14:41 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/18] ARM: tegra: tegratab: Configure USB and power supply
Date: Sun, 22 Nov 2026 22:13:55 +0200
Message-ID: <20261122201407.23742-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, USB was partially broken on the Tegra Note 7, as it supports
OTG and requires proper configuration of both the power supply and the
USB controller/PHY.

Configure the power supply by adding and linking the battery cell,
charger, and fuel gauge nodes. Configure the USB controller for OTG
support using the Palmas extcon for ID pin detection and the charger for
VBUS, and add the usb-connector node.

The device now works in both peripheral and host modes as expected.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 98 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 26f1f7dbcc4c7..2ccee3b70aac9 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -940,6 +940,48 @@ pwm@7000a000 {
 		status = "okay";
 	};
 
+	gen1_i2c: i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		fuel-gauge@36 {
+			compatible = "maxim,max17048";
+			reg = <0x36>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Q, 5) IRQ_TYPE_EDGE_FALLING>;
+
+			monitored-battery = <&battery>;
+			power-supplies = <&bq24193>;
+
+			maxim,alert-low-soc-level = <10>;
+			maxim,double-soc;
+
+			wakeup-source;
+		};
+
+		bq24193: charger@6b {
+			compatible = "ti,bq24193";
+			reg = <0x6b>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(J, 0) IRQ_TYPE_EDGE_FALLING>;
+
+			ce-gpios = <&gpio TEGRA_GPIO(I, 4) GPIO_ACTIVE_LOW>;
+
+			monitored-battery = <&battery>;
+
+			omit-battery-class;
+			ti,system-minimum-microvolt = <3100000>;
+
+			usb_otg_vbus: usb-otg-vbus {
+				regulator-name = "usb_otg_vbus";
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+			};
+		};
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -954,6 +996,15 @@ palmas: pmic@58 {
 
 			ti,system-power-controller;
 
+			palmas_extcon: extcon {
+				compatible = "ti,palmas-usb-vid";
+
+				ti,enable-vbus-detection;
+				ti,enable-id-detection;
+
+				ti,wakeup;
+			};
+
 			palmas_gpio: gpio {
 				compatible = "ti,palmas-gpio";
 				gpio-controller;
@@ -1210,19 +1261,34 @@ mmc@78000600 {
 		non-removable;
 	};
 
+	/* Micro USB */
 	usb@7d000000 {
+		compatible = "nvidia,tegra114-udc";
 		status = "okay";
+		dr_mode = "otg";
+
+		hnp-disable;
+		srp-disable;
+		adp-disable;
+
+		usb-role-switch;
+		extcon = <&bq24193>, <&palmas_extcon>; /* vbus, id */
+		vbus-supply = <&usb_otg_vbus>;
+
+		port {
+			usb_in: endpoint {
+				remote-endpoint = <&usb_connector_out>;
+			};
+		};
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
+		dr_mode = "otg";
 		nvidia,xcvr-setup = <7>;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
-		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-		/* Should be changed to "otg" once we have vbus_supply */
-		/* As of now, USB devices need to be powered externally */
-		dr_mode = "host";
+		vbus-supply = <&avdd_usb>;
 	};
 
 	backlight: backlight {
@@ -1235,6 +1301,19 @@ backlight: backlight {
 		power-supply = <&vdd_3v7_bl>;
 	};
 
+	battery: battery-cell {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+
+		charge-full-design-microamp-hours = <4100000>;
+		energy-full-design-microwatt-hours = <15100000>;
+
+		precharge-current-microamp = <256000>;
+		charge-term-current-microamp = <256000>;
+
+		operating-range-celsius = <0 45>;
+	};
+
 	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
@@ -1242,6 +1321,17 @@ clk32k_in: clock-32k {
 		#clock-cells = <0>;
 	};
 
+	connector-usb {
+		compatible = "usb-b-connector";
+		type = "micro";
+
+		port {
+			usb_connector_out: endpoint {
+				remote-endpoint = <&usb_in>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
2.53.0

