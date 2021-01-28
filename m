Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AA0C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 12:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 131C164DD8
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 12:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhA1MJp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 07:09:45 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6655 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhA1MJo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 07:09:44 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6012a95e0000>; Thu, 28 Jan 2021 04:09:02 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Jan
 2021 12:08:58 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 28 Jan 2021 12:08:57 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/2] arm64: tegra: Prepare for supporintg the Jetson Xavier NX with eMMC
Date:   Thu, 28 Jan 2021 12:08:50 +0000
Message-ID: <20210128120851.361401-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611835742; bh=ATVzFrLxffulVDjjyc14Rljt05gTim/YjwbvqumooIo=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=fD7V5J6pIilxBlOBItfBkozMM2cQZbv/JxJYJgedWCxmft3N7YusJKda4ypD77uH4
         h4zzCOaecozEIqR7C5zouRTMv2opRKrd5jDsACeJGukzzSUmU0MhLh06F/kNjOyXTg
         9qpPpMs4cHgl8XZ4jrtueKQM+7kB6BuV5PEYBksldA8jSGOOsjBzI4WVTUd8mupT6y
         e5rPJUePSBNcatAi6F0SCoh3s+Cc+WRAXmLB/4X5+NNlXnY89tglpo+FPDrKRXHc3b
         B+3dIAMT+KXpuqFIlOLfMNalz9SgrTg0BB99pwKeF2sJNhaSceq48ZxW0hrTrd4tcp
         hv4+pCfveLALw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are two versions of the Jetson Xavier NX system-on-module; one
with a micro SD-card slot and one with an eMMC. Currently, only the
system-on-module with the micro SD-card slot is supported. Before adding
support for the eMMC variant, move the common device-tree parts of the
existing Jetson Xavier NX system-on-module board (p3668-0000) and
reference carrier board (p3509-0000) into include files that can be used
by both Jetson Xavier NX variants.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

Changes since V1:
- No actual changes, simply split patch into two patches

 .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 351 +-----------------
 .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  | 351 ++++++++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 282 +-------------
 .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 284 ++++++++++++++
 4 files changed, 639 insertions(+), 629 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts =
b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
index f1053e7be45c..1c3874b677c0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
@@ -1,357 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
=20
-#include <dt-bindings/input/linux-event-codes.h>
-#include <dt-bindings/input/gpio-keys.h>
-
 #include "tegra194-p3668-0000.dtsi"
+#include "tegra194-p3509-0000.dtsi"
=20
 / {
-	model =3D "NVIDIA Jetson Xavier NX Developer Kit";
+	model =3D "NVIDIA Jetson Xavier NX Developer Kit (SD-card)";
 	compatible =3D "nvidia,p3509-0000+p3668-0000", "nvidia,tegra194";
-
-	bus@0 {
-		aconnect@2900000 {
-			status =3D "okay";
-
-			dma-controller@2930000 {
-				status =3D "okay";
-			};
-
-			interrupt-controller@2a40000 {
-				status =3D "okay";
-			};
-		};
-
-		ddc: i2c@3190000 {
-			status =3D "okay";
-		};
-
-		i2c@3160000 {
-			eeprom@57 {
-				compatible =3D "atmel,24c02";
-				reg =3D <0x57>;
-
-				label =3D "system";
-				vcc-supply =3D <&vdd_1v8>;
-				address-width =3D <8>;
-				pagesize =3D <8>;
-				size =3D <256>;
-				read-only;
-			};
-		};
-
-		hda@3510000 {
-			nvidia,model =3D "jetson-xavier-nx-hda";
-			status =3D "okay";
-		};
-
-		padctl@3520000 {
-			status =3D "okay";
-
-			pads {
-				usb2 {
-					lanes {
-						usb2-1 {
-							status =3D "okay";
-						};
-
-						usb2-2 {
-							status =3D "okay";
-						};
-					};
-				};
-
-				usb3 {
-					lanes {
-						usb3-2 {
-							status =3D "okay";
-						};
-					};
-				};
-			};
-
-			ports {
-				usb2-1 {
-					mode =3D "host";
-					status =3D "okay";
-				};
-
-				usb2-2 {
-					mode =3D "host";
-					vbus-supply =3D <&vdd_5v0_sys>;
-					status =3D "okay";
-				};
-
-				usb3-2 {
-					nvidia,usb2-companion =3D <1>;
-					vbus-supply =3D <&vdd_5v0_sys>;
-					status =3D "okay";
-				};
-			};
-		};
-
-		usb@3610000 {
-			status =3D "okay";
-
-			phys =3D	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
-				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
-			phy-names =3D "usb2-1", "usb2-2", "usb3-2";
-		};
-
-		spi@3270000 {
-			status =3D "okay";
-
-			flash@0 {
-				compatible =3D "spi-nor";
-				reg =3D <0>;
-				spi-max-frequency =3D <102000000>;
-				spi-tx-bus-width =3D <4>;
-				spi-rx-bus-width =3D <4>;
-			};
-		};
-
-		pwm@32d0000 {
-			status =3D "okay";
-		};
-
-		host1x@13e00000 {
-			display-hub@15200000 {
-				status =3D "okay";
-			};
-
-			dpaux@155c0000 {
-				status =3D "okay";
-			};
-
-			dpaux@155d0000 {
-				status =3D "okay";
-			};
-
-			/* DP0 */
-			sor@15b00000 {
-				status =3D "okay";
-
-				avdd-io-hdmi-dp-supply =3D <&vdd_1v0>;
-				vdd-hdmi-dp-pll-supply =3D <&vdd_1v8hs>;
-
-				nvidia,dpaux =3D <&dpaux0>;
-			};
-
-			/* HDMI */
-			sor@15b40000 {
-				status =3D "okay";
-
-				avdd-io-hdmi-dp-supply =3D <&vdd_1v0>;
-				vdd-hdmi-dp-pll-supply =3D <&vdd_1v8hs>;
-				hdmi-supply =3D <&vdd_hdmi>;
-
-				nvidia,ddc-i2c-bus =3D <&ddc>;
-				nvidia,hpd-gpio =3D <&gpio TEGRA194_MAIN_GPIO(M, 1)
-							 GPIO_ACTIVE_LOW>;
-			};
-		};
-	};
-
-	pcie@14160000 {
-		status =3D "okay";
-
-		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
-
-		phys =3D <&p2u_hsio_11>;
-		phy-names =3D "p2u-0";
-	};
-
-	pcie@141a0000 {
-		status =3D "okay";
-
-		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
-
-		phys =3D <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
-
-		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-			    "p2u-5", "p2u-6", "p2u-7";
-	};
-
-	pcie_ep@141a0000 {
-		status =3D "disabled";
-
-		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
-
-		reset-gpios =3D <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
-
-		nvidia,refclk-select-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
-					      GPIO_ACTIVE_HIGH>;
-
-		phys =3D <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
-
-		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-			    "p2u-5", "p2u-6", "p2u-7";
-	};
-
-	fan: fan {
-		compatible =3D "pwm-fan";
-		pwms =3D <&pwm6 0 45334>;
-
-		cooling-levels =3D <0 64 128 255>;
-		#cooling-cells =3D <2>;
-	};
-
-	gpio-keys {
-		compatible =3D "gpio-keys";
-
-		force-recovery {
-			label =3D "Force Recovery";
-			gpios =3D <&gpio TEGRA194_MAIN_GPIO(G, 0)
-				       GPIO_ACTIVE_LOW>;
-			linux,input-type =3D <EV_KEY>;
-			linux,code =3D <KEY_SLEEP>;
-			debounce-interval =3D <10>;
-		};
-
-		power {
-			label =3D "Power";
-			gpios =3D <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
-					   GPIO_ACTIVE_LOW>;
-			linux,input-type =3D <EV_KEY>;
-			linux,code =3D <KEY_POWER>;
-			debounce-interval =3D <10>;
-			wakeup-event-action =3D <EV_ACT_ASSERTED>;
-			wakeup-source;
-		};
-	};
-
-	vdd_5v0_sys: regulator@100 {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "VDD_5V_SYS";
-		regulator-min-microvolt =3D <5000000>;
-		regulator-max-microvolt =3D <5000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vdd_3v3_sys: regulator@101 {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "VDD_3V3_SYS";
-		regulator-min-microvolt =3D <3300000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vdd_3v3_ao: regulator@102 {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "VDD_3V3_AO";
-		regulator-min-microvolt =3D <3300000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vdd_1v8: regulator@103 {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "VDD_1V8";
-		regulator-min-microvolt =3D <1800000>;
-		regulator-max-microvolt =3D <1800000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vdd_hdmi: regulator@104 {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "VDD_5V0_HDMI_CON";
-		regulator-min-microvolt =3D <5000000>;
-		regulator-max-microvolt =3D <5000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	thermal-zones {
-		cpu {
-			polling-delay =3D <0>;
-			polling-delay-passive =3D <500>;
-			status =3D "okay";
-
-			trips {
-				cpu_trip_critical: critical {
-					temperature =3D <96500>;
-					hysteresis =3D <0>;
-					type =3D "critical";
-				};
-
-				cpu_trip_hot: hot {
-					temperature =3D <70000>;
-					hysteresis =3D <2000>;
-					type =3D "hot";
-				};
-
-				cpu_trip_active: active {
-					temperature =3D <50000>;
-					hysteresis =3D <2000>;
-					type =3D "active";
-				};
-
-				cpu_trip_passive: passive {
-					temperature =3D <30000>;
-					hysteresis =3D <2000>;
-					type =3D "passive";
-				};
-			};
-
-			cooling-maps {
-				cpu-critical {
-					cooling-device =3D <&fan 3 3>;
-					trip =3D <&cpu_trip_critical>;
-				};
-
-				cpu-hot {
-					cooling-device =3D <&fan 2 2>;
-					trip =3D <&cpu_trip_hot>;
-				};
-
-				cpu-active {
-					cooling-device =3D <&fan 1 1>;
-					trip =3D <&cpu_trip_active>;
-				};
-
-				cpu-passive {
-					cooling-device =3D <&fan 0 0>;
-					trip =3D <&cpu_trip_passive>;
-				};
-			};
-		};
-
-		gpu {
-			polling-delay =3D <0>;
-			polling-delay-passive =3D <500>;
-			status =3D "okay";
-
-			trips {
-				gpu_alert0: critical {
-					temperature =3D <99000>;
-					hysteresis =3D <0>;
-					type =3D "critical";
-				};
-			};
-		};
-
-		aux {
-			polling-delay =3D <0>;
-			polling-delay-passive =3D <500>;
-			status =3D "okay";
-
-			trips {
-				aux_alert0: critical {
-					temperature =3D <90000>;
-					hysteresis =3D <0>;
-					type =3D "critical";
-				};
-			};
-		};
-	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm=
64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
new file mode 100644
index 000000000000..d1d77220154f
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	bus@0 {
+		aconnect@2900000 {
+			status =3D "okay";
+
+			dma-controller@2930000 {
+				status =3D "okay";
+			};
+
+			interrupt-controller@2a40000 {
+				status =3D "okay";
+			};
+		};
+
+		ddc: i2c@3190000 {
+			status =3D "okay";
+		};
+
+		i2c@3160000 {
+			eeprom@57 {
+				compatible =3D "atmel,24c02";
+				reg =3D <0x57>;
+
+				label =3D "system";
+				vcc-supply =3D <&vdd_1v8>;
+				address-width =3D <8>;
+				pagesize =3D <8>;
+				size =3D <256>;
+				read-only;
+			};
+		};
+
+		hda@3510000 {
+			nvidia,model =3D "jetson-xavier-nx-hda";
+			status =3D "okay";
+		};
+
+		padctl@3520000 {
+			status =3D "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-1 {
+							status =3D "okay";
+						};
+
+						usb2-2 {
+							status =3D "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-2 {
+							status =3D "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-1 {
+					mode =3D "host";
+					status =3D "okay";
+				};
+
+				usb2-2 {
+					mode =3D "host";
+					vbus-supply =3D <&vdd_5v0_sys>;
+					status =3D "okay";
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion =3D <1>;
+					vbus-supply =3D <&vdd_5v0_sys>;
+					status =3D "okay";
+				};
+			};
+		};
+
+		usb@3610000 {
+			status =3D "okay";
+
+			phys =3D	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names =3D "usb2-1", "usb2-2", "usb3-2";
+		};
+
+		spi@3270000 {
+			status =3D "okay";
+
+			flash@0 {
+				compatible =3D "spi-nor";
+				reg =3D <0>;
+				spi-max-frequency =3D <102000000>;
+				spi-tx-bus-width =3D <4>;
+				spi-rx-bus-width =3D <4>;
+			};
+		};
+
+		pwm@32d0000 {
+			status =3D "okay";
+		};
+
+		host1x@13e00000 {
+			display-hub@15200000 {
+				status =3D "okay";
+			};
+
+			dpaux@155c0000 {
+				status =3D "okay";
+			};
+
+			dpaux@155d0000 {
+				status =3D "okay";
+			};
+
+			/* DP0 */
+			sor@15b00000 {
+				status =3D "okay";
+
+				avdd-io-hdmi-dp-supply =3D <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply =3D <&vdd_1v8hs>;
+
+				nvidia,dpaux =3D <&dpaux0>;
+			};
+
+			/* HDMI */
+			sor@15b40000 {
+				status =3D "okay";
+
+				avdd-io-hdmi-dp-supply =3D <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply =3D <&vdd_1v8hs>;
+				hdmi-supply =3D <&vdd_hdmi>;
+
+				nvidia,ddc-i2c-bus =3D <&ddc>;
+				nvidia,hpd-gpio =3D <&gpio TEGRA194_MAIN_GPIO(M, 1)
+							 GPIO_ACTIVE_LOW>;
+			};
+		};
+	};
+
+	pcie@14160000 {
+		status =3D "okay";
+
+		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
+
+		phys =3D <&p2u_hsio_11>;
+		phy-names =3D "p2u-0";
+	};
+
+	pcie@141a0000 {
+		status =3D "okay";
+
+		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
+
+		phys =3D <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+
+		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+			    "p2u-5", "p2u-6", "p2u-7";
+	};
+
+	pcie_ep@141a0000 {
+		status =3D "disabled";
+
+		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
+
+		reset-gpios =3D <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
+
+		nvidia,refclk-select-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
+					      GPIO_ACTIVE_HIGH>;
+
+		phys =3D <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+
+		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+			    "p2u-5", "p2u-6", "p2u-7";
+	};
+
+	fan: fan {
+		compatible =3D "pwm-fan";
+		pwms =3D <&pwm6 0 45334>;
+
+		cooling-levels =3D <0 64 128 255>;
+		#cooling-cells =3D <2>;
+	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+
+		force-recovery {
+			label =3D "Force Recovery";
+			gpios =3D <&gpio TEGRA194_MAIN_GPIO(G, 0)
+				       GPIO_ACTIVE_LOW>;
+			linux,input-type =3D <EV_KEY>;
+			linux,code =3D <KEY_SLEEP>;
+			debounce-interval =3D <10>;
+		};
+
+		power {
+			label =3D "Power";
+			gpios =3D <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
+					   GPIO_ACTIVE_LOW>;
+			linux,input-type =3D <EV_KEY>;
+			linux,code =3D <KEY_POWER>;
+			debounce-interval =3D <10>;
+			wakeup-event-action =3D <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	vdd_5v0_sys: regulator@100 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "VDD_5V_SYS";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3_sys: regulator@101 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "VDD_3V3_SYS";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3_ao: regulator@102 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "VDD_3V3_AO";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_1v8: regulator@103 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "VDD_1V8";
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_hdmi: regulator@104 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "VDD_5V0_HDMI_CON";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	thermal-zones {
+		cpu {
+			polling-delay =3D <0>;
+			polling-delay-passive =3D <500>;
+			status =3D "okay";
+
+			trips {
+				cpu_trip_critical: critical {
+					temperature =3D <96500>;
+					hysteresis =3D <0>;
+					type =3D "critical";
+				};
+
+				cpu_trip_hot: hot {
+					temperature =3D <70000>;
+					hysteresis =3D <2000>;
+					type =3D "hot";
+				};
+
+				cpu_trip_active: active {
+					temperature =3D <50000>;
+					hysteresis =3D <2000>;
+					type =3D "active";
+				};
+
+				cpu_trip_passive: passive {
+					temperature =3D <30000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+			};
+
+			cooling-maps {
+				cpu-critical {
+					cooling-device =3D <&fan 3 3>;
+					trip =3D <&cpu_trip_critical>;
+				};
+
+				cpu-hot {
+					cooling-device =3D <&fan 2 2>;
+					trip =3D <&cpu_trip_hot>;
+				};
+
+				cpu-active {
+					cooling-device =3D <&fan 1 1>;
+					trip =3D <&cpu_trip_active>;
+				};
+
+				cpu-passive {
+					cooling-device =3D <&fan 0 0>;
+					trip =3D <&cpu_trip_passive>;
+				};
+			};
+		};
+
+		gpu {
+			polling-delay =3D <0>;
+			polling-delay-passive =3D <500>;
+			status =3D "okay";
+
+			trips {
+				gpu_alert0: critical {
+					temperature =3D <99000>;
+					hysteresis =3D <0>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		aux {
+			polling-delay =3D <0>;
+			polling-delay-passive =3D <500>;
+			status =3D "okay";
+
+			trips {
+				aux_alert0: critical {
+					temperature =3D <90000>;
+					hysteresis =3D <0>;
+					type =3D "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi b/arch/arm=
64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
index 0dc8304a2edd..7da3d48cb410 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
@@ -1,79 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "tegra194.dtsi"
-
-#include <dt-bindings/mfd/max77620.h>
+#include "tegra194-p3668.dtsi"
=20
 / {
-	model =3D "NVIDIA Jetson Xavier NX";
+	model =3D "NVIDIA Jetson Xavier NX (SD-card)";
 	compatible =3D "nvidia,p3668-0000", "nvidia,tegra194";
=20
-	aliases {
-		ethernet0 =3D "/bus@0/ethernet@2490000";
-		i2c0 =3D "/bpmp/i2c";
-		i2c1 =3D "/bus@0/i2c@3160000";
-		i2c2 =3D "/bus@0/i2c@c240000";
-		i2c3 =3D "/bus@0/i2c@3180000";
-		i2c4 =3D "/bus@0/i2c@3190000";
-		i2c5 =3D "/bus@0/i2c@31c0000";
-		i2c6 =3D "/bus@0/i2c@c250000";
-		i2c7 =3D "/bus@0/i2c@31e0000";
-		mmc0 =3D "/bus@0/mmc@3460000";
-		rtc0 =3D "/bpmp/i2c/pmic@3c";
-		rtc1 =3D "/bus@0/rtc@c2a0000";
-		serial0 =3D &tcu;
-	};
-
-	chosen {
-		bootargs =3D "console=3DttyS0,115200n8";
-		stdout-path =3D "serial0:115200n8";
-	};
-
 	bus@0 {
-		ethernet@2490000 {
-			status =3D "okay";
-
-			phy-reset-gpios =3D <&gpio TEGRA194_MAIN_GPIO(R, 1) GPIO_ACTIVE_LOW>;
-			phy-handle =3D <&phy>;
-			phy-mode =3D "rgmii-id";
-
-			mdio {
-				#address-cells =3D <1>;
-				#size-cells =3D <0>;
-
-				phy: phy@0 {
-					compatible =3D "ethernet-phy-ieee802.3-c22";
-					reg =3D <0x0>;
-					interrupt-parent =3D <&gpio>;
-					interrupts =3D <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
-					#phy-cells =3D <0>;
-				};
-			};
-		};
-
-		memory-controller@2c00000 {
-			status =3D "okay";
-		};
-
-		serial@3100000 {
-			status =3D "okay";
-		};
-
-		i2c@3160000 {
-			status =3D "okay";
-
-			eeprom@50 {
-				compatible =3D "atmel,24c02";
-				reg =3D <0x50>;
-
-				label =3D "module";
-				vcc-supply =3D <&vdd_1v8ls>;
-				address-width =3D <8>;
-				pagesize =3D <8>;
-				size =3D <256>;
-				read-only;
-			};
-		};
-
 		/* SDMMC1 (SD/MMC) */
 		mmc@3400000 {
 			status =3D "okay";
@@ -82,216 +14,6 @@ mmc@3400000 {
 			disable-wp;
 			vmmc-supply =3D <&vdd_3v3_sd>;
 		};
-
-		padctl@3520000 {
-			avdd-usb-supply =3D <&vdd_usb_3v3>;
-			vclamp-usb-supply =3D <&vdd_1v8ao>;
-
-			ports {
-				usb2-1 {
-					vbus-supply =3D <&vdd_5v0_sys>;
-				};
-
-				usb2-3 {
-					vbus-supply =3D <&vdd_5v0_sys>;
-				};
-
-				usb3-0 {
-					vbus-supply =3D <&vdd_5v0_sys>;
-				};
-
-				usb3-3 {
-					vbus-supply =3D <&vdd_5v0_sys>;
-				};
-			};
-		};
-
-		rtc@c2a0000 {
-			status =3D "okay";
-		};
-
-		pmc@c360000 {
-			nvidia,invert-interrupt;
-		};
-	};
-
-	bpmp {
-		i2c {
-			status =3D "okay";
-
-			pmic: pmic@3c {
-				compatible =3D "maxim,max20024";
-				reg =3D <0x3c>;
-
-				interrupt-parent =3D <&pmc>;
-				interrupts =3D <24 IRQ_TYPE_LEVEL_LOW>;
-				#interrupt-cells =3D <2>;
-				interrupt-controller;
-
-				#gpio-cells =3D <2>;
-				gpio-controller;
-
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&max20024_default>;
-
-				max20024_default: pinmux {
-					gpio0 {
-						pins =3D "gpio0";
-						function =3D "gpio";
-					};
-
-					gpio1 {
-						pins =3D "gpio1";
-						function =3D "fps-out";
-						maxim,active-fps-source =3D <MAX77620_FPS_SRC_DEF>;
-					};
-
-					gpio2 {
-						pins =3D "gpio2";
-						function =3D "fps-out";
-						maxim,active-fps-source =3D <MAX77620_FPS_SRC_DEF>;
-					};
-
-					gpio3 {
-						pins =3D "gpio3";
-						function =3D "fps-out";
-						maxim,active-fps-source =3D <MAX77620_FPS_SRC_DEF>;
-					};
-
-					gpio4 {
-						pins =3D "gpio4";
-						function =3D "32k-out1";
-						drive-push-pull =3D <1>;
-					};
-
-					gpio6 {
-						pins =3D "gpio6";
-						function =3D "gpio";
-						drive-push-pull =3D <1>;
-					};
-
-					gpio7 {
-						pins =3D "gpio7";
-						function =3D "gpio";
-						drive-push-pull =3D <0>;
-					};
-				};
-
-				fps {
-					fps0 {
-						maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN0>;
-						maxim,shutdown-fps-time-period-us =3D <640>;
-					};
-
-					fps1 {
-						maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN1>;
-						maxim,shutdown-fps-time-period-us =3D <640>;
-						maxim,device-state-on-disabled-event =3D <MAX77620_FPS_INACTIVE_STAT=
E_SLEEP>;
-					};
-
-					fps2 {
-						maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN0>;
-						maxim,shutdown-fps-time-period-us =3D <640>;
-					};
-				};
-
-				regulators {
-					in-sd0-supply =3D <&vdd_5v0_sys>;
-					in-sd1-supply =3D <&vdd_5v0_sys>;
-					in-sd2-supply =3D <&vdd_5v0_sys>;
-					in-sd3-supply =3D <&vdd_5v0_sys>;
-					in-sd4-supply =3D <&vdd_5v0_sys>;
-
-					in-ldo0-1-supply =3D <&vdd_5v0_sys>;
-					in-ldo2-supply =3D <&vdd_5v0_sys>;
-					in-ldo3-5-supply =3D <&vdd_5v0_sys>;
-					in-ldo4-6-supply =3D <&vdd_5v0_sys>;
-					in-ldo7-8-supply =3D <&vdd_1v8ls>;
-
-					vdd_1v0: sd0 {
-						regulator-name =3D "VDDIO_SYS_1V0";
-						regulator-min-microvolt =3D <1000000>;
-						regulator-max-microvolt =3D <1000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_1v8hs: sd1 {
-						regulator-name =3D "VDDIO_SYS_1V8HS";
-						regulator-min-microvolt =3D <1800000>;
-						regulator-max-microvolt =3D <1800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_1v8ls: sd2 {
-						regulator-name =3D "VDDIO_SYS_1V8LS";
-						regulator-min-microvolt =3D <1800000>;
-						regulator-max-microvolt =3D <1800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_1v8ao: sd3 {
-						regulator-name =3D "VDDIO_AO_1V8";
-						regulator-min-microvolt =3D <1800000>;
-						regulator-max-microvolt =3D <1800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					sd4 {
-						regulator-name =3D "VDD_DDR_1V1";
-						regulator-min-microvolt =3D <1100000>;
-						regulator-max-microvolt =3D <1100000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo0 {
-						regulator-name =3D "VDD_RTC";
-						regulator-min-microvolt =3D <800000>;
-						regulator-max-microvolt =3D <800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo2 {
-						regulator-name =3D "VDDIO_AO_3V3";
-						regulator-min-microvolt =3D <3300000>;
-						regulator-max-microvolt =3D <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo3 {
-						regulator-name =3D "VDD_EMMC_3V3";
-						regulator-min-microvolt =3D <3300000>;
-						regulator-max-microvolt =3D <3300000>;
-					};
-
-					vdd_usb_3v3: ldo5 {
-						regulator-name =3D "VDD_USB_3V3";
-						regulator-min-microvolt =3D <3300000>;
-						regulator-max-microvolt =3D <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo6 {
-						regulator-name =3D "VDD_SDIO_3V3";
-						regulator-min-microvolt =3D <3300000>;
-						regulator-max-microvolt =3D <3300000>;
-					};
-
-					ldo7 {
-						regulator-name =3D "AVDD_CSI_1V2";
-						regulator-min-microvolt =3D <1200000>;
-						regulator-max-microvolt =3D <1200000>;
-					};
-				};
-			};
-		};
 	};
=20
 	vdd_3v3_sd: regulator@0 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra194-p3668.dtsi
new file mode 100644
index 000000000000..a26b8a37f884
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "tegra194.dtsi"
+
+#include <dt-bindings/mfd/max77620.h>
+
+/ {
+	aliases {
+		ethernet0 =3D "/bus@0/ethernet@2490000";
+		i2c0 =3D "/bpmp/i2c";
+		i2c1 =3D "/bus@0/i2c@3160000";
+		i2c2 =3D "/bus@0/i2c@c240000";
+		i2c3 =3D "/bus@0/i2c@3180000";
+		i2c4 =3D "/bus@0/i2c@3190000";
+		i2c5 =3D "/bus@0/i2c@31c0000";
+		i2c6 =3D "/bus@0/i2c@c250000";
+		i2c7 =3D "/bus@0/i2c@31e0000";
+		mmc0 =3D "/bus@0/mmc@3460000";
+		rtc0 =3D "/bpmp/i2c/pmic@3c";
+		rtc1 =3D "/bus@0/rtc@c2a0000";
+		serial0 =3D &tcu;
+	};
+
+	chosen {
+		bootargs =3D "console=3DttyS0,115200n8";
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	bus@0 {
+		ethernet@2490000 {
+			status =3D "okay";
+
+			phy-reset-gpios =3D <&gpio TEGRA194_MAIN_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+			phy-handle =3D <&phy>;
+			phy-mode =3D "rgmii-id";
+
+			mdio {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				phy: phy@0 {
+					compatible =3D "ethernet-phy-ieee802.3-c22";
+					reg =3D <0x0>;
+					interrupt-parent =3D <&gpio>;
+					interrupts =3D <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
+					#phy-cells =3D <0>;
+				};
+			};
+		};
+
+		memory-controller@2c00000 {
+			status =3D "okay";
+		};
+
+		serial@3100000 {
+			status =3D "okay";
+		};
+
+		i2c@3160000 {
+			status =3D "okay";
+
+			eeprom@50 {
+				compatible =3D "atmel,24c02";
+				reg =3D <0x50>;
+
+				label =3D "module";
+				vcc-supply =3D <&vdd_1v8ls>;
+				address-width =3D <8>;
+				pagesize =3D <8>;
+				size =3D <256>;
+				read-only;
+			};
+		};
+
+		padctl@3520000 {
+			avdd-usb-supply =3D <&vdd_usb_3v3>;
+			vclamp-usb-supply =3D <&vdd_1v8ao>;
+
+			ports {
+				usb2-1 {
+					vbus-supply =3D <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply =3D <&vdd_5v0_sys>;
+				};
+
+				usb3-0 {
+					vbus-supply =3D <&vdd_5v0_sys>;
+				};
+
+				usb3-3 {
+					vbus-supply =3D <&vdd_5v0_sys>;
+				};
+			};
+		};
+
+		rtc@c2a0000 {
+			status =3D "okay";
+		};
+
+		pmc@c360000 {
+			nvidia,invert-interrupt;
+		};
+	};
+
+	bpmp {
+		i2c {
+			status =3D "okay";
+
+			pmic: pmic@3c {
+				compatible =3D "maxim,max20024";
+				reg =3D <0x3c>;
+
+				interrupt-parent =3D <&pmc>;
+				interrupts =3D <24 IRQ_TYPE_LEVEL_LOW>;
+				#interrupt-cells =3D <2>;
+				interrupt-controller;
+
+				#gpio-cells =3D <2>;
+				gpio-controller;
+
+				pinctrl-names =3D "default";
+				pinctrl-0 =3D <&max20024_default>;
+
+				max20024_default: pinmux {
+					gpio0 {
+						pins =3D "gpio0";
+						function =3D "gpio";
+					};
+
+					gpio1 {
+						pins =3D "gpio1";
+						function =3D "fps-out";
+						maxim,active-fps-source =3D <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio2 {
+						pins =3D "gpio2";
+						function =3D "fps-out";
+						maxim,active-fps-source =3D <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio3 {
+						pins =3D "gpio3";
+						function =3D "fps-out";
+						maxim,active-fps-source =3D <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio4 {
+						pins =3D "gpio4";
+						function =3D "32k-out1";
+						drive-push-pull =3D <1>;
+					};
+
+					gpio6 {
+						pins =3D "gpio6";
+						function =3D "gpio";
+						drive-push-pull =3D <1>;
+					};
+
+					gpio7 {
+						pins =3D "gpio7";
+						function =3D "gpio";
+						drive-push-pull =3D <0>;
+					};
+				};
+
+				fps {
+					fps0 {
+						maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us =3D <640>;
+					};
+
+					fps1 {
+						maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN1>;
+						maxim,shutdown-fps-time-period-us =3D <640>;
+						maxim,device-state-on-disabled-event =3D <MAX77620_FPS_INACTIVE_STAT=
E_SLEEP>;
+					};
+
+					fps2 {
+						maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us =3D <640>;
+					};
+				};
+
+				regulators {
+					in-sd0-supply =3D <&vdd_5v0_sys>;
+					in-sd1-supply =3D <&vdd_5v0_sys>;
+					in-sd2-supply =3D <&vdd_5v0_sys>;
+					in-sd3-supply =3D <&vdd_5v0_sys>;
+					in-sd4-supply =3D <&vdd_5v0_sys>;
+
+					in-ldo0-1-supply =3D <&vdd_5v0_sys>;
+					in-ldo2-supply =3D <&vdd_5v0_sys>;
+					in-ldo3-5-supply =3D <&vdd_5v0_sys>;
+					in-ldo4-6-supply =3D <&vdd_5v0_sys>;
+					in-ldo7-8-supply =3D <&vdd_1v8ls>;
+
+					vdd_1v0: sd0 {
+						regulator-name =3D "VDDIO_SYS_1V0";
+						regulator-min-microvolt =3D <1000000>;
+						regulator-max-microvolt =3D <1000000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8hs: sd1 {
+						regulator-name =3D "VDDIO_SYS_1V8HS";
+						regulator-min-microvolt =3D <1800000>;
+						regulator-max-microvolt =3D <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8ls: sd2 {
+						regulator-name =3D "VDDIO_SYS_1V8LS";
+						regulator-min-microvolt =3D <1800000>;
+						regulator-max-microvolt =3D <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8ao: sd3 {
+						regulator-name =3D "VDDIO_AO_1V8";
+						regulator-min-microvolt =3D <1800000>;
+						regulator-max-microvolt =3D <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					sd4 {
+						regulator-name =3D "VDD_DDR_1V1";
+						regulator-min-microvolt =3D <1100000>;
+						regulator-max-microvolt =3D <1100000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo0 {
+						regulator-name =3D "VDD_RTC";
+						regulator-min-microvolt =3D <800000>;
+						regulator-max-microvolt =3D <800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo2 {
+						regulator-name =3D "VDDIO_AO_3V3";
+						regulator-min-microvolt =3D <3300000>;
+						regulator-max-microvolt =3D <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo3 {
+						regulator-name =3D "VDD_EMMC_3V3";
+						regulator-min-microvolt =3D <3300000>;
+						regulator-max-microvolt =3D <3300000>;
+					};
+
+					vdd_usb_3v3: ldo5 {
+						regulator-name =3D "VDD_USB_3V3";
+						regulator-min-microvolt =3D <3300000>;
+						regulator-max-microvolt =3D <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo6 {
+						regulator-name =3D "VDD_SDIO_3V3";
+						regulator-min-microvolt =3D <3300000>;
+						regulator-max-microvolt =3D <3300000>;
+					};
+
+					ldo7 {
+						regulator-name =3D "AVDD_CSI_1V2";
+						regulator-min-microvolt =3D <1200000>;
+						regulator-max-microvolt =3D <1200000>;
+					};
+				};
+			};
+		};
+	};
+};
--=20
2.25.1

