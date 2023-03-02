Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F229C6FA8E
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Mar 2023 09:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjCBJeE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Mar 2023 04:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjCBJeD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Mar 2023 04:34:03 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2981515D;
        Thu,  2 Mar 2023 01:34:01 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id u9so15539940edd.2;
        Thu, 02 Mar 2023 01:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677749640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJCsizHtlHnY9LbiBRU0WlzpSmORm6XsGwCxOW5BRZw=;
        b=OXcXHayK6d4huYqsgl6PeFb/cvnhBU3o093PSIDlsregDmHO0hR1BW5aSgHfvslqvk
         NfAQWi2Zicybw2vixZGZsr9UYv95ZSRnYZj5JO6SED4kUOOEB7uHlKONtr7yKMFPl+zK
         CwmoLiMLkOoQJxXkFkoZv2AcOvsh8qYTzufEeKT3HsB2CQSDREqTPsLY7yDLtcJElbta
         WwxZZzr0lQFgOBREtQs59GCnhgoUn+99L4zleRGM47LAJwNEU3LOGwbWyLwfV2kQkNhR
         sfuYUiCBUHyyKC5A7S2dVm4OXGyM4LivJ4YqhoZX/ezd/UJkc9TYHD2RTyXcqzUqFzhg
         USlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJCsizHtlHnY9LbiBRU0WlzpSmORm6XsGwCxOW5BRZw=;
        b=ZwWuXloitwbf1wcfBPlC5oN3YWmK9r3lde9Y64x7qLLVaUR3Cy55sP4s5aossiK+lK
         fcf+e3zQqyUmYsDREs9G2CEn8ulfJwugA/vxMMFnxcUqOzWvuUsWa3Rd3HRB4xGtnxBC
         /uaCOoGsWasoCnBEIKdGzHkh4LXl/RaeOZLwpO1OnUq9m8UWhAisnLxPfH3in/PO0fTU
         3nUr+d6nPsmoPhPYFZrOqTtevFsHeenu0kjHSZoauDOH6IGIZ1G6/kK8YSpYOcCp5TlD
         2HxicmYH3ruWhS/dgFEPqk+pehssgPPEmz0mJ+osUBRqjDffMb7Ov6nPq3d4ZZwR63cE
         n1jQ==
X-Gm-Message-State: AO0yUKU7tnfMql/67TG3a5NHEsJonFU8UrGoKmH09uSDTrAl3KSxr4+s
        usof1/pnaiMS3Txix8hcJ/k=
X-Google-Smtp-Source: AK7set+dleus9aeUv6VMpW1IN5rE4yHZpy209e6/WkRRQqgbH+8U498ZjVkou/ArWIOZexcKK1OnDg==
X-Received: by 2002:a17:906:4ec9:b0:881:a3ec:2b43 with SMTP id i9-20020a1709064ec900b00881a3ec2b43mr9241918ejv.56.1677749640021;
        Thu, 02 Mar 2023 01:34:00 -0800 (PST)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kf7-20020a17090776c700b008b17ed98d05sm6809156ejc.120.2023.03.02.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:33:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: tegra: Add support for P3768+P3767
Date:   Thu,  2 Mar 2023 10:33:53 +0100
Message-Id: <20230302093353.3873247-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302093353.3873247-1-thierry.reding@gmail.com>
References: <20230302093353.3873247-1-thierry.reding@gmail.com>
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
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 218 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  | 133 +++++++++++
 2 files changed, 351 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
new file mode 100644
index 000000000000..d4d388e53072
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -0,0 +1,218 @@
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
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fb: framebuffer@0 {
+			compatible = "framebuffer";
+			reg = <0x0 0x0 0x0 0x0>;
+			iommu-addresses = <&dc0 0x0 0x0 0x0 0x0>;
+		};
+	};
+
+	aliases {
+		serial0 = &tcu;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+
+		framebuffer {
+			compatible = "simple-framebuffer";
+			status = "disabled";
+			memory-region = <&fb>;
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_DISP>;
+			clocks = <&bpmp TEGRA234_CLK_HUB>,
+				 <&bpmp TEGRA234_CLK_DISP>,
+				 <&bpmp TEGRA234_CLK_NVDISPLAY_P0>,
+				 <&bpmp TEGRA234_CLK_DPAUX>,
+				 <&bpmp TEGRA234_CLK_DISPPLL>,
+				 <&bpmp TEGRA234_CLK_DISPHUBPLL>,
+				 /* MORE!!! */
+				 <&bpmp TEGRA234_CLK_NVDISPLAY_P1>,
+				 <&bpmp TEGRA234_CLK_FUSE>,
+				 <&bpmp TEGRA234_CLK_DSIPLL_VCO>,
+				 <&bpmp TEGRA234_CLK_DSIPLL_CLKOUTPN>,
+				 <&bpmp TEGRA234_CLK_DSIPLL_CLKOUTA>,
+				 <&bpmp TEGRA234_CLK_SPPLL0_VCO>,
+				 <&bpmp TEGRA234_CLK_SPPLL0_CLKOUTPN>,
+				 <&bpmp TEGRA234_CLK_SPPLL0_CLKOUTA>,
+				 <&bpmp TEGRA234_CLK_SPPLL0_CLKOUTB>,
+				 <&bpmp TEGRA234_CLK_SPPLL0_DIV10>,
+				 <&bpmp TEGRA234_CLK_SPPLL0_DIV25>,
+				 <&bpmp TEGRA234_CLK_SPPLL0_DIV27PN>,
+				 <&bpmp TEGRA234_CLK_SPPLL1_VCO>,
+				 <&bpmp TEGRA234_CLK_SPPLL1_CLKOUTPN>,
+				 <&bpmp TEGRA234_CLK_SPPLL1_DIV27PN>,
+				 <&bpmp TEGRA234_CLK_VPLL0_REF>,
+				 <&bpmp TEGRA234_CLK_VPLL0>,
+				 <&bpmp TEGRA234_CLK_VPLL1>,
+				 <&bpmp TEGRA234_CLK_NVDISPLAY_P0_REF>,
+				 <&bpmp TEGRA234_CLK_RG0>,
+				 <&bpmp TEGRA234_CLK_RG1>,
+				 <&bpmp TEGRA234_CLK_DSI_LP>,
+				 <&bpmp TEGRA234_CLK_DSI_CORE>,
+				 <&bpmp TEGRA234_CLK_DSI_PIXEL>,
+				 <&bpmp TEGRA234_CLK_PRE_SOR0>,
+				 <&bpmp TEGRA234_CLK_PRE_SOR1>,
+				 <&bpmp TEGRA234_CLK_DP_LINK_REF>,
+				 <&bpmp TEGRA234_CLK_SOR_LINKA_INPUT>,
+				 <&bpmp TEGRA234_CLK_SOR_LINKA_AFIFO>,
+				 <&bpmp TEGRA234_CLK_SOR_LINKA_AFIFO_M>,
+				 <&bpmp TEGRA234_CLK_RG0_M>,
+				 <&bpmp TEGRA234_CLK_RG1_M>,
+				 <&bpmp TEGRA234_CLK_SOR0_M>,
+				 <&bpmp TEGRA234_CLK_SOR1_M>,
+				 <&bpmp TEGRA234_CLK_PLLHUB>,
+				 <&bpmp TEGRA234_CLK_SOR0>,
+				 <&bpmp TEGRA234_CLK_SOR1>,
+				 <&bpmp TEGRA234_CLK_SOR_PAD_INPUT>,
+				 <&bpmp TEGRA234_CLK_PRE_SF0>,
+				 <&bpmp TEGRA234_CLK_SF0>,
+				 <&bpmp TEGRA234_CLK_SF1>,
+				 <&bpmp TEGRA234_CLK_DSI_PAD_INPUT>,
+				 <&bpmp TEGRA234_CLK_PRE_SOR0_REF>,
+				 <&bpmp TEGRA234_CLK_PRE_SOR1_REF>,
+				 <&bpmp TEGRA234_CLK_SOR0_PLL_REF>,
+				 <&bpmp TEGRA234_CLK_SOR1_PLL_REF>,
+				 <&bpmp TEGRA234_CLK_SOR0_REF>,
+				 <&bpmp TEGRA234_CLK_SOR1_REF>,
+				 <&bpmp TEGRA234_CLK_OSC>,
+				 <&bpmp TEGRA234_CLK_DSC>,
+				 <&bpmp TEGRA234_CLK_MAUD>,
+				 <&bpmp TEGRA234_CLK_AZA_2XBIT>,
+				 <&bpmp TEGRA234_CLK_AZA_BIT>,
+				 <&bpmp TEGRA234_CLK_MIPI_CAL>,
+				 <&bpmp TEGRA234_CLK_UART_FST_MIPI_CAL>,
+				 <&bpmp TEGRA234_CLK_SOR0_DIV>;
+			resets = <&bpmp TEGRA234_RESET_NVDISPLAY>,
+				 <&bpmp TEGRA234_RESET_DPAUX>,
+				 <&bpmp TEGRA234_RESET_DSI_CORE>,
+				 <&bpmp TEGRA234_RESET_MIPI_CAL>;
+			width = <0>;
+			height = <0>;
+			stride = <0>;
+			format = "x8r8g8b8";
+		};
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
index 000000000000..3ccb17be17fb
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
+			eeprom@56 {
+				compatible = "atmel,24c02";
+				reg = <0x56>;
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
2.39.2

