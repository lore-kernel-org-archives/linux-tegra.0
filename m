Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190A4C74A5B
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Mar 2023 15:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjC2PH0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Mar 2023 11:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjC2PHZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Mar 2023 11:07:25 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD853C19;
        Wed, 29 Mar 2023 08:07:19 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x3so64564844edb.10;
        Wed, 29 Mar 2023 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680102438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt8af5ulw9DWl5eszk/Q49U2Rz3iXIXWfxD8xiD4D2A=;
        b=YwPnz9jUrc38TPq2bSrQRJyGwLGFiybjB6ilElggPZWsEACGZOp41N6dhxWV3gPA/B
         /pXt4vBeTHQEMh5KYT7zGtRKPcSJ59Fq706TYB+wZB7npjxzwQPxZaCWmLT8xES/kCd3
         TYDlryxdHKIeFC+r1db4x5A141/g9MnJPCaaDG9jbQP/tjp42HBE8G6Tk8jHolckBtyD
         OLJ6WHFbce3a0h6vYDlAA0MuJ6Xy28xihRREjiG/2Qn2GQfDxdruy/Yx/7io8E78YEYR
         XtXdmbug2AHxk/nSurBIhcnboNKZGST8tWTj+KQz8keiETMHTfCFiwkXlNQKh9ygyFCf
         p7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lt8af5ulw9DWl5eszk/Q49U2Rz3iXIXWfxD8xiD4D2A=;
        b=o0S0QBB7aYvyNelQJ7ggOC69I4GQAU//wOdWsBuF1VzshHa8EfbjVzOmwvCQiB6tCl
         Jpw19z4v9LzpyS+R7GkG7o76esokJu7yYWt08IvsVt0qdhJxDpaiehvXWWZ9FizvjKTw
         44ra02UPmANfkAkDmlhEQsgAdYC6FxIAoYvXupZrV4Hr0o9R8eVvPt1LfgT5wZASLnTC
         hrUCrGeYVKUiplsaXBWsDYTu2pzFA+xnQ25AgKkdJQ36yKeEJ12F7qg4AKFVV9g7JGQP
         Y5+ghwEP6gnDQDSi42qPmANIoW3RU+GgYdt3RLZpuJubvzXQ5Woy5jhlNwf33Ra05Ux+
         Zikw==
X-Gm-Message-State: AAQBX9cthBUPFR8Wxv72uqcwZgN1QeUrh72k9HQqQ+BQOAW+EF+/ooC5
        Z8+1Ydcntm/ESyJXbcJv8vc=
X-Google-Smtp-Source: AKy350b5xFDqOEDhbj6eVfk+KfbZQmllVav2Kx235CfwjfNbaZ3ERVWXcilfIDuG4QlJW6wSMhNyUg==
X-Received: by 2002:a05:6402:8cf:b0:501:d43e:d1e3 with SMTP id d15-20020a05640208cf00b00501d43ed1e3mr20842510edz.8.1680102437618;
        Wed, 29 Mar 2023 08:07:17 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 17-20020a508751000000b004bf7905559asm17138225edv.44.2023.03.29.08.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:07:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: tegra: Add Jetson Orin NX support
Date:   Wed, 29 Mar 2023 17:07:09 +0200
Message-Id: <20230329150710.773441-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329150710.773441-1-thierry.reding@gmail.com>
References: <20230329150710.773441-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This adds a device tree for the Jetson Orin NX module, which is Jetson
AGX Orin's little sibling with 6 or 8 ARM Cortex-A78AE cores, an Ampere
GPU (1024 GPU and 32 tensor cores) and a number of accelerators for
machine learning, image processing and more.

The Jetson Orin NX comes with either 8 or 16 GiB of 128-bit LPDDR5 and
supports NVME for mass storage.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add SPI flash and SD card to make UEFI happy

 .../boot/dts/nvidia/tegra234-p3767-0000.dtsi  | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
new file mode 100644
index 000000000000..82674256d720
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra234.dtsi"
+
+/ {
+	model = "NVIDIA Jetson Orin NX";
+	compatible = "nvidia,p3767-0000", "nvidia,tegra234";
+
+	bus@0 {
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+
+				label = "module";
+				vcc-supply = <&vdd_1v8_hs>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
+		spi@3270000 {
+			status = "okay";
+
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0>;
+				spi-max-frequency = <136000000>;
+				spi-tx-bus-width = <4>;
+				spi-rx-bus-width = <4>;
+			};
+		};
+
+		/* UEFI needs this but it's not there on all boards */
+		mmc@3400000 {
+			status = "okay";
+			bus-width = <4>;
+			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
+			disable-wp;
+		};
+
+		padctl@3520000 {
+			vclamp-usb-supply = <&vdd_1v8_ao>;
+			avdd-usb-supply = <&vdd_3v3_ao>;
+		};
+
+		rtc@c2a0000 {
+			status = "okay";
+		};
+
+		pmc@c360000 {
+			nvidia,invert-interrupt;
+		};
+	};
+
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vdd_1v8_hs: regulator-vdd-1v8-hs {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_HS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_1v8_ao: regulator-vdd-1v8-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_AO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_3v3_ao: regulator-vdd-3v3-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_AO";
+		regulator-min-microvolt = <33000000>;
+		regulator-max-microvolt = <33000000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <1000>;
+			status = "okay";
+
+			trips {
+				critical {
+					temperature = <104500>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+
+				hot {
+					temperature = <99000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				board_trip_passive: passive {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				board_trip_active2: active-2 {
+					temperature = <80000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+
+				board_trip_active1: active-1 {
+					temperature = <65000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+
+				board_trip_active0: active-0 {
+					temperature = <50000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				passive {
+					cooling-device = <&fan 3 3>;
+					trip = <&board_trip_passive>;
+				};
+
+				active2 {
+					cooling-device = <&fan 2 3>;
+					trip = <&board_trip_active2>;
+				};
+
+				active1 {
+					cooling-device = <&fan 1 2>;
+					trip = <&board_trip_active1>;
+				};
+
+				active0 {
+					cooling-device = <&fan 0 1>;
+					trip = <&board_trip_active0>;
+				};
+			};
+		};
+
+		gpu-thermal {
+			status = "okay";
+		};
+
+		cv0-thermal {
+			status = "okay";
+		};
+
+		cv1-thermal {
+			status = "okay";
+		};
+
+		cv2-thermal {
+			status = "okay";
+		};
+
+		soc0-thermal {
+			status = "okay";
+		};
+
+		soc1-thermal {
+			status = "okay";
+		};
+
+		soc2-thermal {
+			status = "okay";
+		};
+
+		tj-thermal {
+			status = "okay";
+		};
+	};
+};
-- 
2.40.0

