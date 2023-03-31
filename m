Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C700C77B6C
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjCaQd1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjCaQdK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:33:10 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D112659C;
        Fri, 31 Mar 2023 09:29:26 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w9so91842628edc.3;
        Fri, 31 Mar 2023 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKG4C+1Wx4Y61hBzbbvjWu9OyPNzcije/ihAphovozk=;
        b=iznjKuTE2IeQ70WzXlZancPwpcOmeP+eKhI4gKhIIK+knF+Kl6DdanJRh3T98lpE+X
         Vyiqs1/nXyYawYQxrPcGo6MaZBLeKqqc3uXSJKXna3nm6cc+PONVRQ9O10qVA7WaPDRu
         Ewfr/1q8/a8gQ5PeQNeO+pf9KrP48Mce9wNJ8eBSp0SKeqgjLhtu/CEeDJf4ZJ7y8svX
         QNFrKn+OmfLQbPxsMQducYP2Ii7KYZliwKm8qQvXaj+4khkt+0tFb4gkakc4nvU/Cx5o
         5dDhBIdPmVe+gGz6jQQXPBUM3alepbAUfe0wjfNP7cS2VQay/GRhtKd3k1AvXWsyp+/6
         dZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKG4C+1Wx4Y61hBzbbvjWu9OyPNzcije/ihAphovozk=;
        b=TFHhz/7g5WWc9ilY15hcjFPRiAyHjxJPFul7nNv15mTUjaCq6oJUHFDRdwdcDA4uws
         Q/J3Efsv9Bpz7ySPf2JBtHNMQAmsO4ER4jDljqpRRMnICqleC0AM3i6WzGJrQCfQfRvE
         krujk+ymGm8vxPx+AQ7Yz5aSuXdmRRLIG6ZBdekTy+tzCKbVWlL++yruh48xXV0ZhZ6f
         dc7zq7/6jjq3GPifC4vPZKkJXJ0pVx12HKRYjoUul2B3DjD9TW8+cDuuSRrBkgdLoS01
         yWJmXKpqxEf2GzEtRvyLVrGWckeyjsLofOq4TB70HTqgy6pArVbQAbjkg7tDh3oWkh/+
         ISkg==
X-Gm-Message-State: AAQBX9cK5M7ThZBRf5PlvKPKZ8BTcbXo2wZpLHXUFmTWZlcku4xciGQh
        c2bDXE7ulxKf7Cv3ajByyTI=
X-Google-Smtp-Source: AKy350Z3OdSu04lehKu6OZGHzi0HqKQFJtho+lZaTJolUt0S1sNAUOZqFRUAXLie1iKKhnF0yYsTbA==
X-Received: by 2002:a17:906:9404:b0:8b1:7eba:de5 with SMTP id q4-20020a170906940400b008b17eba0de5mr9628183ejx.10.1680280164251;
        Fri, 31 Mar 2023 09:29:24 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qo26-20020a170907213a00b00930aa50372csm1126494ejb.43.2023.03.31.09.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:29:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] arm64: tegra: Support Jetson Orin NX
Date:   Fri, 31 Mar 2023 18:29:13 +0200
Message-Id: <20230331162914.16922-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331162914.16922-1-thierry.reding@gmail.com>
References: <20230331162914.16922-1-thierry.reding@gmail.com>
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
Changes in v3:
- split out P3767 DTS include to allow sharing with Jetson Orin Nano

Changes in v2:
- add SPI flash and SD card to make UEFI happy

 .../boot/dts/nvidia/tegra234-p3767-0000.dtsi  |  14 ++
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 172 ++++++++++++++++++
 2 files changed, 186 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
new file mode 100644
index 000000000000..baf4f69e410d
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra234-p3767.dtsi"
+
+/ {
+	compatible = "nvidia,p3767-0000", "nvidia,tegra234";
+	model = "NVIDIA Jetson Orin NX";
+
+	bus@0 {
+		hda@3510000 {
+			nvidia,model = "NVIDIA Jetson Orin NX HDA";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
new file mode 100644
index 000000000000..bd60478fa75e
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra234.dtsi"
+
+/ {
+	compatible = "nvidia,p3767", "nvidia,tegra234";
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
+		/*
+		 * This only exists on Jetson Orin Nano Developer Kit (SKU 5)
+		 * but UEFI needs this and will remove it on devices where it
+		 * doesn't exist.
+		 */
+		mmc@3400000 {
+			status = "okay";
+			bus-width = <4>;
+			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
+			disable-wp;
+		};
+
+		hda@3510000 {
+			status = "okay";
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
+		/*
+		 * This monitoring is far from optimal, but it's good enough
+		 * at this stage.
+		 */
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
+	};
+};
-- 
2.40.0

