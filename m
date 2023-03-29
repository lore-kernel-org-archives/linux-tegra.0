Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0A5C761AF
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Mar 2023 15:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjC2PH2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Mar 2023 11:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjC2PH1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Mar 2023 11:07:27 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3757A3C1E;
        Wed, 29 Mar 2023 08:07:20 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id h8so64627809ede.8;
        Wed, 29 Mar 2023 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680102438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAOC+dUmRdB1qEdqs/ZXPZzGnUb9JtX7D+ByYMj3oo4=;
        b=IEZN8knQvv0dxiohXNyXI+K7AnwcWShmLSszUsqrMHxRLmrhbn+3QZk0rGS6om5RlY
         bq+3lxmUDi3KAmN+1Hss4up/SL+lUfOzWR60PnYnKuryF9M/Te0W+Jo5xN2N7DF9G14p
         0MB0rYWwCE+mPrdoUf4P9kPdPFHnBOAPD1Qksy7BTbt6Sd66vJhG6kCznV0xIffpnkpP
         q6ALfAjGMYVapaghqHqyKubl9b+CGLL94lc/FvxC7tvEpRgODQh4NRttSA0BIbCSnrxw
         0+ymi831C/3R/IGTjsKeY0+C8SZjnz8WgFcjRo+zz4Gd+HIYB0WEwULmMgu4gET/AdF8
         0O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAOC+dUmRdB1qEdqs/ZXPZzGnUb9JtX7D+ByYMj3oo4=;
        b=jskDi6SEillL2XVq5hzM2Cmgs6v5RHlby1cJk7c7j3jjaOp4STzy+24hF6Ps3ng5er
         oprVoaDUa/Uxxl8nHgKmKpWzzyiQW9nlFpRspg3fYxurPItkGtZau88sGdSQnTdNTzmm
         UGTwZrs4mZ+0nnCmN1gSIkSFx0XMZk4TkA+HhKJjH5HD7uZ07GI5Y8QrJtLjInDU32Re
         CK0gpQaxiCvKxHIACE6DfhZd1vfZJLAP34ZfApFaAZgdOfNGiTgYWf5G2fVa3S1Up8qD
         CQt5uQ0Nny2koMKcmz361Z5H5sYf5pNDeW066H3pHqRi66kpQKgY4tBzwELl9IQudwjN
         vwLg==
X-Gm-Message-State: AAQBX9fkKg/h5PFgw/bnEokTT9n/a/947e0OjCzhIf++QD/lCT4nUvUv
        rnqqs6UftE4H+EHPMHwrvj0=
X-Google-Smtp-Source: AKy350bcMx9Njpi3AZ44hi4vn7cQAsP9krsKo8zWFA1QH8MJ/o7V5xFQXQLdPwnFASc5YpbkIQeHmQ==
X-Received: by 2002:a17:906:8a41:b0:930:18f5:d016 with SMTP id gx1-20020a1709068a4100b0093018f5d016mr19990959ejc.15.1680102438544;
        Wed, 29 Mar 2023 08:07:18 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id xi3-20020a170906dac300b009445d6213c0sm4116400ejb.75.2023.03.29.08.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:07:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: tegra: Add support for P3768+P3767
Date:   Wed, 29 Mar 2023 17:07:10 +0200
Message-Id: <20230329150710.773441-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329150710.773441-1-thierry.reding@gmail.com>
References: <20230329150710.773441-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for the combination of the NVIDIA Jetson Orin NX (P3767)
module and the P3768 carrier board.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix system EEPROM I2C address
- enable HDA because why not

 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 133 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  | 133 ++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index bc34c9d8846a..602dc1b434ff 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -24,3 +24,4 @@ dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
new file mode 100644
index 000000000000..76f3fdd7a387
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+#include "tegra234-p3767-0000.dtsi"
+#include "tegra234-p3768-0000.dtsi"
+
+/ {
+	compatible = "nvidia,p3768-0000+p3767-0000", "nvidia,p3767-0000", "nvidia,tegra234";
+
+	aliases {
+		serial0 = &tcu;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	bus@0 {
+		serial@31d0000 {
+			current-speed = <115200>;
+			status = "okay";
+		};
+
+		pwm@32a0000 {
+			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			status = "okay";
+		};
+
+		hda@3510000 {
+			nvidia,model = "NVIDIA Jetson Orin NX HDA";
+			status = "okay";
+		};
+
+		padctl@3520000 {
+			status = "okay";
+		};
+
+		/* C1 - M.2 Key-E */
+		pcie@14100000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+
+			phys = <&p2u_hsio_3>;
+			phy-names = "p2u-0";
+		};
+
+		/* C4 - M.2 Key-M */
+		pcie@14160000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+
+			phys = <&p2u_hsio_4>, <&p2u_hsio_5>, <&p2u_hsio_6>,
+			       <&p2u_hsio_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
+		};
+
+		/* C8 - Ethernet */
+		pcie@140a0000 {
+			status = "okay";
+
+			num-lanes = <2>;
+
+			phys = <&p2u_gbe_2>, <&p2u_gbe_3>;
+			phy-names = "p2u-0", "p2u-1";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+			vpcie3v3-supply = <&vdd_3v3_pcie>;
+		};
+
+		/* C7 - M.2 Key-M */
+		pcie@141e0000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+
+			phys = <&p2u_gbe_0>, <&p2u_gbe_1>;
+			phy-names = "p2u-0", "p2u-1";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-force-recovery {
+			label = "Force Recovery";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_1>;
+		};
+
+		key-power {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-suspend {
+			label = "Suspend";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_SLEEP>;
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm3 0 45334>;
+		cooling-levels = <0 95 178 255>;
+		#cooling-cells = <2>;
+	};
+
+	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_PCIE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio_aon TEGRA234_AON_GPIO(AA, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	serial {
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
new file mode 100644
index 000000000000..533052426668
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	compatible = "nvidia,p3768-0000";
+
+	bus@0 {
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@57 {
+				compatible = "atmel,24c02";
+				reg = <0x57>;
+
+				label = "system";
+				vcc-supply = <&vdd_1v8_sys>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
+		padctl@3520000 {
+			pads {
+				usb2 {
+					lanes {
+						usb2-0 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb2-1 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb2-2 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb3-1 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				/* recovery port */
+				usb2-0 {
+					mode = "otg";
+					vbus-supply = <&vdd_5v0_sys>;
+					status = "okay";
+					usb-role-switch;
+				};
+
+				/* hub */
+				usb2-1 {
+					mode = "host";
+					vbus-supply = <&vdd_1v1_hub>;
+					status = "okay";
+				};
+
+				/* M.2 Key-E */
+				usb2-2 {
+					mode = "host";
+					vbus-supply = <&vdd_5v0_sys>;
+					status = "okay";
+				};
+
+				/* hub */
+				usb3-0 {
+					nvidia,usb2-companion = <1>;
+					status = "okay";
+				};
+
+				/* J5 */
+				usb3-1 {
+					nvidia,usb2-companion = <0>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3550000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+			phy-names = "usb2-0", "usb3-1";
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb3-0",
+				    "usb3-1";
+		};
+	};
+
+	vdd_1v8_sys: regulator-vdd-1v8-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_SYS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_1v1_hub: regulator-vdd-1v1-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_AV10_HUB";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vdd_5v0_sys>;
+		regulator-always-on;
+	};
+};
-- 
2.40.0

