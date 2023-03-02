Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9165C7EE33
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Mar 2023 09:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjCBJeD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Mar 2023 04:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjCBJeC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Mar 2023 04:34:02 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1773814EA2;
        Thu,  2 Mar 2023 01:34:01 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a25so2532535edb.0;
        Thu, 02 Mar 2023 01:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677749639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNhjfyslff64zUgHAEjxExE6KH84HCgycvbeeDK9c0k=;
        b=B2hcDwkbIdy/Z2bwFaY997MIOqIQ2qhIzig2woFUfIyuXxLYeIp4JiBABJIZrRYVyY
         4pchrLX0CfYyEVrsOB4fgdCDZ88Z+EurlMm+7SOsM1I5RNeIiRnTak4L9L4TsskQiZzo
         qrUL0G/yan5KFSzx7BghhrWX0bflWe2AWWScYdHc9Xo4yW7UpCaKJb4c5dg1NOM6oME2
         5VLA7OsdBJ3CRztgO3kPlwCkZUEuQRrioYrNZgf7pqkdb8PkuDvYyXVhg7ZLbesQ3rI0
         8SaadTelVFdm/pyKw4Gnh/6HdJwVepExFUG4g95eU7F4+pBR0i7oHXc1dAHGE9+6HRhE
         e9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNhjfyslff64zUgHAEjxExE6KH84HCgycvbeeDK9c0k=;
        b=b405tRQuBPWqClJ1Z4p3gecmF6k3PLYYrPM0pOpgOvkCRWOeKXk3u6cHQcfXpR3am/
         GIwnixYNvB7k10N14z2+ONMS/D0ebTIU/77Ukb3c/IAxonCw7s8cg6ekyrlZvNOi54ih
         wQ9OaM4ORJk+C4uTBIzdwKUyuxoOTcBYCaR3s2vaGqj2Jbe/uN0b0/XKHDWzUmD7u+Ht
         I0ImY2aik5huiWbw7A0QswXL/ZLRuPKgjMPVSx/uO7O/Jfu6ZQ+ZlmXyItAWFlvr3a0k
         W2OLXNK6SnhFQHqxJ+oYU9vmj8evAc00QoQM9AcIuXqHCOD/a/wTKQimzmWN+o313cxV
         uVHA==
X-Gm-Message-State: AO0yUKVc6+6SdbCw5OWmtisrUNynIVOOKm/amBTrLL1kihPzsiSqDYLl
        7BhpFtGc6x6BOg7xP7wcQVE=
X-Google-Smtp-Source: AK7set/QxzGCXIZMibKmmEKSVHtLgM2PJGiFWOWouIeWCk9vSXu9lrMXF+6+xdXma2Cdm5cdaTSmTg==
X-Received: by 2002:a17:906:7143:b0:8af:4969:1bb4 with SMTP id z3-20020a170906714300b008af49691bb4mr9394747ejj.53.1677749639142;
        Thu, 02 Mar 2023 01:33:59 -0800 (PST)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qx11-20020a170906fccb00b008e9c79ff14csm6938730ejb.96.2023.03.02.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:33:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: tegra: Add Jetson Orin NX support
Date:   Thu,  2 Mar 2023 10:33:52 +0100
Message-Id: <20230302093353.3873247-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302093353.3873247-1-thierry.reding@gmail.com>
References: <20230302093353.3873247-1-thierry.reding@gmail.com>
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
 .../boot/dts/nvidia/tegra234-p3767-0000.dtsi  | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
new file mode 100644
index 000000000000..3f9f7c8534a2
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
@@ -0,0 +1,173 @@
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
2.39.2

