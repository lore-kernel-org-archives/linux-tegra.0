Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B33C761A6
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjCaQd1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjCaQdL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:33:11 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD34427800;
        Fri, 31 Mar 2023 09:29:27 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ew6so91765368edb.7;
        Fri, 31 Mar 2023 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc+j8urDB/RnvdpJvSHn8Xs0bbTHrMm8P5jHRi5MUYw=;
        b=pJeABH9ThD5HRuTqbwHNI7X95wVKH0SdGIuseCzEhtEIA4FII0e688YqzGWyIG5Pw+
         AUg1i145H+ObPopcBb/xmVOI7qtAr3UVMos7k9+n9e0/cwbb/OvLcHXo0W424vok1jSW
         VPvYDHo9UZv3sJfe42hwAfsIMiUKDH2ml6WP2q56ZoeBVYyclYjJ3QGWRQN+hICO9T19
         tjWsJ9xA+fLpX/HVA6yP6ID3zGly8sWAf4WSZdBSpQqFViyaHQ9NEjAyEX8z7cj44SA3
         bB9w7x+/9J2d8doG8NNUcK3KI+lJvBVd3aOR7LfGZ4QkSQCVI2W9JcRP3ojnZDc7aN4H
         HO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jc+j8urDB/RnvdpJvSHn8Xs0bbTHrMm8P5jHRi5MUYw=;
        b=5KIUk99GWgPbW5sQAx2WCqpAAu6u2EKxDjsFEhZ3YVy61t5hy3wAAi/JQbyd8P57+M
         /+a0hObE+Ti8Tn8otnx5FZy4d984iykJKkK3Y8zH9EbEDbp08/itGsiuNngSlc+FsF63
         GEwN6sSy/ESII22jeoOlmApoysYSs29VxL2hcq52//3PAHwbGvWPZKjcUQJ6PoTmZvSy
         3+EzOCE8ILP1r20fJ01HeejrJaRl3qDc2I6nRQRnz/wWbxqnA5Vo2GCX0hQ6o4m42h0l
         bfLcgCijVXqGi62NUOckUwFljghvxSItXHu6tiRdN9d1fOOXYpi8+3EHqvHqLkcyDOYh
         Exmw==
X-Gm-Message-State: AAQBX9ev4L+MK/Yj7UZ5qPlC2eOq+enqah51JlUoH1fqwhHdUPogKixt
        2Y28Y6lm5pb09xOh5WAJXwc=
X-Google-Smtp-Source: AKy350bYUnjVhHMWhYKzfBG8UFCaPwgQVsip/GV8eVvgs547tUlLjsuWFuwFKaMk4r13Ar0qLLC9RA==
X-Received: by 2002:a17:906:2759:b0:930:8fd7:789f with SMTP id a25-20020a170906275900b009308fd7789fmr25316146ejd.38.1680280165224;
        Fri, 31 Mar 2023 09:29:25 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y18-20020a170906525200b0093f322187f0sm1125011ejm.189.2023.03.31.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:29:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] arm64: tegra: Support Jetson Orin NX reference platform
Date:   Fri, 31 Mar 2023 18:29:14 +0200
Message-Id: <20230331162914.16922-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331162914.16922-1-thierry.reding@gmail.com>
References: <20230331162914.16922-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for the combination of the NVIDIA Jetson Orin NX (P3767, SKU
0) module and the P3768 carrier board.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- move more nodes into the P3768 DTS include for better reusability

Changes in v2:
- fix system EEPROM I2C address
- enable HDA because why not

 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 134 ++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  | 245 ++++++++++++++++++
 3 files changed, 381 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index bc34c9d8846a..1406d5d40b8f 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -9,6 +9,7 @@ DTC_FLAGS_tegra194-p2972-0000 := -@
 DTC_FLAGS_tegra194-p3509-0000+p3668-0000 := -@
 DTC_FLAGS_tegra194-p3509-0000+p3668-0001 := -@
 DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
+DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
@@ -24,3 +25,4 @@ dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
new file mode 100644
index 000000000000..7dfbc38eb3c4
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -0,0 +1,134 @@
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
+	model = "NVIDIA Jetson Orin NX Engineering Reference Developer Kit";
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
index 000000000000..aee21428e1a5
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	compatible = "nvidia,p3768-0000";
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
+		padctl@3520000 {
+			status = "okay";
+
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
-- 
2.40.0

