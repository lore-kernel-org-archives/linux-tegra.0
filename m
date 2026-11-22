Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378486;
	b=pxpeNvc8yf0R6U1Qtnvb2I3wQXJqVe7a7oGNLn6M4hO1UwhClkeJgD9dEIKiq4LzIY6I
	 tL5tXmF/ZSg3u/TOTClt+cVb1VwGAd1CH1qwp2b8S2IxpmrOO82CbKQcYouc04I7OubI2
	 JhrwHQVW+YMWtZQecGo8vnC6ywMKlsGv5/ksvn9R0j1Zd50f7cFAZL/IeRKYXW+GQIDhN
	 34p6YpxeCHsTOjC6VftAvMuOLMeSpc5FEmir9+iDS2aAwQt9rJeyeaVxvv0o9XuY1gEWA
	 s0l0ry7rrm9htaoJLjyn60Wl+EKwOtape7+fTgwoQhMKsc+v2P86uSPuaRFzuKseOkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
	b=emhcWszYax7ut5INjXG57OOxmVWRzyUqstVKru6qOIFMCgtianbppz8+a/l4KlU2RFT5
	 m9wJ6sYvOjn2yNojwLE/dpb2kbjFiyLiGfg8v/ynmtEu/4ZqKMgcmH6NOBwJVYAAnyqG4
	 icx+4x3g77YilBzRxznpMuWUgnS/i40JIms+UPUj8+IpDGYUJZUIM52lYYhi+Hu6ob825
	 9xwiKotyCisZn4wlqN6roqOEqwCteRR9M9On/OYZ6wmerzuXoXw/eXSKkqb86hGnm+l0m
	 UoafB+FFs3IWd+zu7Bn8Q/49DjRkz4Aezs234vl5IDqIxE+IOt6unbjxQE8ni1xw+gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yppbj1xt;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E77B606A334
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E77B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yppbj1xt
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3446973a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378485; x=1795983285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
        b=yppbj1xtN75l6P8tn83PjOJ+DLOquw9vfG2lxjJU6n5f3ReTDp4ci37K+B/XDneFhD
         LLhMUDlQf4scGGD/ovVz6/K49f7XpVv0s6vMhDIbHwU61h0zMJb7qLd7r+QrzLrL47Rx
         85KjLrfTeR8WXAr/Ic/cpkIAkATh7teZpGgrlwxn2aOQVRVVWL/TeU/NcQMqxXY+MXsa
         egDDPEekksEMoLWpMJhCfWhdXogMWeB5EBWDdQsOe0c5ve82c8u60DAGmQN47aPQMlcQ
         qokJXzr8b7EfqBgVequ8+UsRj7L+i1QsV0NMrlJw4yMLUMlMB0ZnOs9jH4p3Lm1AXlGQ
         9diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378485; x=1795983285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
        b=g+W4DR3Is5NqoljCpP12wz79wChVZg9pbullkzXlCxvgHqS7E1pgun2CjKIduYuqXA
         GMLeSswm/7DNKoRSw0wgXTiu3cm3xf2jagp5A4IyPDzFrEsIDM85Nm1FwttiJOXgAqbr
         IneXtIjYFpy8uNi0M7MJyr7mrNekTutX+W86VA/DVrMBRUa3yQchVRj8pCttk09NsPUg
         bKOzLf9WS4MrERMhc7WhBagwft/kwkSf/oSMsneiMtQm6Rkzs3lyV/0qg1PtWgDuWRoK
         8MK6S+98ohPegKtNzPn4/3YQXD3b8EZcOtUemUvaCEmWRCRpHm1KfZ02sYiYnOXjS0+o
         kPcg==
X-Forwarded-Encrypted: i=1; AL+hErFrlLNkLIxvoX3X55h/os2XqTePMRzZLJvZZx3HMtHPGQyEp3Y3q8xLxRJkOKxhevju2J2VogtZ83Tnrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+y3fa5bzLCDjsOfF8DhnMe3O+ZFuiCDlSw4MfzkoqULG151p4C
	J2/Krq5hBvW0If7A9+zNhIlS2KCi52dRBp+baJUyvTMhHVo86s8t7+YT
X-Gm-Gg: AZFdTZdIirwYaPkdo7M7iAOHVkK94dSvHnRQ5aGTFT11PAkMwtwZnjMcWyO3iOcKP5K
	N87YE6WcvZ5GmRDDIdyGc4geueG22YSuZ7Co27/L8RUbxApVTDbrKNSvdPA7VNsG/Akmzk1gNQj
	VjslN0Lf/QB4Zwwbl8ei2csa9onTK/u2tdDJU8ISXhVGHGTVY/gutA59ZREMiJq0sV+WfO4Kcu7
	/WEEP2/fB2Fu4wDR1syvNuEgzQgfeE1HZanApol/c3oWjAXVGBwYAhpgTgVAjz34vw6vHUgZS79
	OTeSZeMZbQDdN4aJruJdHIMgtN2afTQIwqZyI+pZ1xjooM2M1YBLkXHthEHSZ/F/DRg6DAS3LeR
	ok41RPyEbK4BEJ/tyeXGwTLlS0JT6zqSciyyORKO+8QXgXSrfbDd5OX8aZov1KACIzxRXh37twt
	2/8jvbg1NiI4K6F402+5pHHmMT6QGWB9zliL379F0QIIzME2odSJaL35seAwdEIwAIrOVxw7H7j
	LvJrEa5PrjgZtYsmcGGzM/2PovJ7vzmFV6wG7LpAjeSsVhA3/NtZXrnlTqGARChlLkDFvC0k3s+
	6B4ySvKXBUHPbRA1NyFtiic9dcg+uYP2Ki4DCll9naaVo41oJofFN/N2cvk0GUDIjWCGxJvgbeO
	853nZgTH9tQ==
X-Received: by 2002:a05:6402:3222:b0:6b8:7e86:3e90 with SMTP id 4fb4d7f45d1cf-6ba654bcff6mr3922317a12.38.1795378484595;
        Sun, 22 Nov 2026 12:14:44 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:44 -0800 (PST)
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
Subject: [PATCH v1 08/18] ARM: tegra: tegratab: Configure wireless devices
Date: Sun, 22 Nov 2026 22:13:57 +0200
Message-ID: <20261122201407.23742-9-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegratab uses the Texas Instruments WL1801 (WiLink 8) single-band
combo module — providing Wi-Fi, Bluetooth, and Bluetooth Low Energy (LE)
for wireless communications. Additionally, the tegranote7c variant
incorporates an Icera i500 modem for LTE support.

The Wi-Fi interface is connected to MMC1 (SDIO), and Bluetooth is linked
to UART-B.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 51 +++++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts | 12 +++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts |  5 ++
 3 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index b7a14e24df79b..bb5788b2539cd 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -18,6 +18,7 @@ aliases {
 		mmc2 = &sdmmc1; /* WiFi */
 
 		serial0 = &uartd;
+		serial1 = &uartc; /* Bluetooth */
 	};
 
 	firmware {
@@ -934,6 +935,30 @@ drive-gma {
 		};
 	};
 
+	serial@70006200 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		bluetooth {
+			compatible = "ti,wl1801-st";
+			max-speed = <3000000>;
+
+			clocks = <&palmas_clk32k>;
+			clock-names = "ext_clock";
+
+			enable-gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_HIGH>;
+
+			vbat-supply = <&vdd_3v3_com>;
+			vio-supply = <&vdd_1v8_vio>;
+		};
+	};
+
 	serial@70006300 {
 		/delete-property/ dmas;
 		/delete-property/ dma-names;
@@ -1015,6 +1040,11 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			palmas_clk32k: palmas_clk32kg@0 {
+				compatible = "ti,palmas-clk32kg";
+				#clock-cells = <0>;
+			};
+
 			pinmux {
 				compatible = "ti,tps65913-pinctrl";
 				ti,palmas-enable-dvfs1;
@@ -1281,8 +1311,20 @@ sdmmc1: mmc@78000000 {
 		nvidia,default-tap = <0x2>;
 		nvidia,default-trim = <0x2>;
 
+		mmc-pwrseq = <&wl18xx_wifi_pwrseq>;
 		vmmc-supply = <&vdd_3v3_com>;
 		vqmmc-supply = <&vdd_1v8_vio>;
+
+		wifi@2 {
+			compatible = "ti,wl1801";
+			reg = <2>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
+
+			ref-clock-frequency = <26000000>;
+			tcxo-clock-frequency = <26000000>;
+		};
 	};
 
 	/* MicroSD */
@@ -1409,6 +1451,15 @@ key-volume-up {
 		};
 	};
 
+	wl18xx_wifi_pwrseq: pwrseq-wifi {
+		compatible = "mmc-pwrseq-simple";
+
+		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <100>;
+	};
+
 	vdd_5v0_sys: regulator-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0_sys";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
index 409df3de17a82..8177e4f7db489 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -6,4 +6,16 @@
 / {
 	model = "Nvidia Tegra Note 7 (P1640)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
+
+	pwrseq-wifi {
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+		clock-names = "ext_clock";
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_EXTERN3>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+		assigned-clock-rates = <32768>;
+
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_CLK_32K>,
+					 <&tegra_car TEGRA114_CLK_EXTERN3>;
+	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index f461a2c492b1f..9447203eeda36 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -19,6 +19,11 @@ ldo4 {
 		};
 	};
 
+	pwrseq-wifi {
+		clocks = <&palmas_clk32k>;
+		clock-names = "ext_clock";
+	};
+
 	regulator-gyro {
 		gpio = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.53.0

