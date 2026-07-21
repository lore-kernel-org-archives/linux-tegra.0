Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1C4534A9
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628184; cv=none; b=RZ7PEA+DOiCm6gJ54/043XfMYSRuJG6b28HNDN/H++LYs/MvSWLtoe2ntOCWLOtVrdSs9+hUUnkgoZM6788DufEP6MuYSer/15NkzRQRk0DxaMOxh/ut/icKR9sjKWkb+TIJrs1PLWBfcZyG/Lm6MijhctFEpWzepIYpofpLndM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628184; c=relaxed/simple;
	bh=q5gnqp+BsM9YugVxrmkv5MJWG0djzNgKT+00AQG9z4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9S6U/kCxDZspVN8w4sKY8IhgWRz6Zl/pAe6QHLipN/3HcJ1N2A3JbHbmG365cYSgc0UGEF69Qax5Qp1kgrz5mgQrns1wViiNwwp9iz3TxgjebTGIYyF+HFQCCNFs2RmYe8F4nBBN1G6QYQYMqM/O1SUhBWiKurEm8MaewNPmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHo8Qj9K; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHo8Qj9K"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-471eeac43bfso10359182f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628179; x=1785232979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+E8ewXEXgQiOp13Spm2gl+TrsxBc9PVoOFPBCiu1aGc=;
        b=cHo8Qj9KNE0JNO1QfgWk0OHdrYGgYGj2xR0NozvNP19cKcVMDaZHkMUIWWAcbYL7WM
         piE46MxErIM/+/QSqhRugR0esGI/ugVN/aymmgwFPMJ0BiPRCBfdT3Op8KbmCzQt8YKG
         SIM26gu83TOZKzpi3v/kiP2RqypcQ47qeDY9W59tIv+JrVCT4kmv8uIbkBJJTHSjYbv1
         EKe7vLG3WWX5eEKEbJ8e6m+f4Vw4c+ENWI5amOFmTN/hA5dLQzjmVkrtqrcJdZ++YBrb
         5inFqyqSylvfcQiSKhXjWW+UQIiQGbFSRCtvMnZ51kDICUbU2JiYNlN3ukStCCeME6Op
         YZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628179; x=1785232979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+E8ewXEXgQiOp13Spm2gl+TrsxBc9PVoOFPBCiu1aGc=;
        b=NxEZ2NZcBB2U+zA2zQwY0BYKp6Cj1KzZS41FpNHMmBqK25AlHl1/roG6H/6n+JL9xe
         tqG7xaj1fBlhvPoYEbJyeT3cJYIKkP5qet0a7I5SrtVsE4Z8TSxBdTK6qTlI0rVQqhM+
         yWg9gHOHmTIp4lDVwDQxdibNSlIk3coD5su9MUHGwBqvmOjxf6azUcu+gLdlRJb/bbfs
         KemErrmwQ42485MSA32qiWHeBJ0p72WuDvDC8GI9CqK+tRjOmrd5ZZv4k40rj1pWC9c/
         xfRDghXifAecEVO8K6LH2EBDb9lea1QM3doZAJWFGe/rMaS5s21UVNjrXGszlzJsP8up
         AvOg==
X-Forwarded-Encrypted: i=1; AHgh+RqXQ+rClaDfyYkAUWeQEU4PfMy5VCUQidxxnbXgaQhcz/P/77UcGCZ832JS89aIkSW0xrCD0UtbKasaaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTna9TAJ+EyfgzRuhaQXKAQ32+F/9Vfj9IM1Ww6kVjngvt6aJw
	xYDkH3I1+ZSsirzBGYWkSwu5+RTelCFLUzCIzHut+JToO5mslEZaPPZ4
X-Gm-Gg: AR+sD13kPxIBnuBnEX1vFT8bYy/hm8UBKgOzenD0stkzQ+YwU0Fr2mIF2rindJELqey
	UPRmEqgD1Ql/9y7W3gAW5g8kbfNvAmM4BHnOlnpp70IR+51IqyuPPdj9DE5AYap4Nrr1zjqCH7j
	sDvA1ky2XDwUW+wRkgXTjMJ/IA4ps3v5aC+3mUlu2Na+VEx0TCCBfm+ZsOczs5fVuRxsP4r9myM
	V4QcN9GCVweeyFN9RiU9DFkawpT9zxYNPRMQ+F13Zzir8FQqJ2pAFTD9PDxjRIPNuvJL6WF7kwP
	5E4NpdScxRgK+P0JyhJARV3MaZrbxwnRI1fU3IM5hh/NWR0Y65+ZRLy3YWE73VkRqZCThiwhK+v
	nBZjpb45o8eU7SmUhpdO9UA1c8IFsD9h2UMCUL+ASYash6b/a/TquFfdrShgGkUQpNbKkth+0lP
	WZSoGMJt0py+cmRvZiUs2D3/ERBV2AXFkZUw==
X-Received: by 2002:a05:6000:290e:b0:47d:fc45:8589 with SMTP id ffacd0b85a97d-47f622cef7amr20848066f8f.0.1784628178787;
        Tue, 21 Jul 2026 03:02:58 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm39976860f8f.17.2026.07.21.03.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:02:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2 RESEND] ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2
Date: Tue, 21 Jul 2026 13:02:45 +0300
Message-ID: <20260721100245.444623-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721100245.444623-1-clamor95@gmail.com>
References: <20260721100245.444623-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device-tree for the Motorola Atrix 4G and Droid X2, which both are
NVIDIA Tegra20-based smartphones, originally running Android.

Tested-by: Ion Agorria <ion@agorria.com> # Droid X2
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile             |    2 +
 .../dts/nvidia/tegra20-motorola-daytona.dts   |  107 ++
 .../boot/dts/nvidia/tegra20-motorola-mot.dtsi | 1194 +++++++++++++++++
 .../dts/nvidia/tegra20-motorola-olympus.dts   |  108 ++
 4 files changed, 1411 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index eaac22f4c5e99..f7bb91c9b76be 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -26,6 +26,8 @@ dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-colibri-eval-v3.dtb \
 	tegra20-colibri-iris.dtb \
 	tegra20-medcom-wide.dtb \
+	tegra20-motorola-daytona.dtb \
+	tegra20-motorola-olympus.dtb \
 	tegra20-paz00.dtb \
 	tegra20-plutux.dtb \
 	tegra20-seaboard.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts b/arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
new file mode 100644
index 0000000000000..72dd915e37e7f
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra20-motorola-mot.dtsi"
+
+/ {
+	model = "Motorola Droid X2 (MB870)";
+	compatible = "motorola,daytona", "nvidia,tegra20";
+
+	i2c@7000c000 {
+		touchscreen@4a {
+			touchscreen-size-x = <1010>;
+			touchscreen-size-y = <1023>;
+			touchscreen-min-x = <25>;
+		};
+	};
+
+	i2c@7000d000 {
+		accelerometer@f {
+			mount-matrix =	"-1",  "0",  "0",
+					 "0", "-1",  "0",
+					 "0",  "0", "-1";
+		};
+
+		light-sensor@44 {
+			compatible = "isil,isl29030";
+			reg = <0x44>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(E, 1) IRQ_TYPE_LEVEL_LOW>;
+
+			vdd-supply = <&vdd_hvio>;
+		};
+	};
+
+	/* Motorola BH5X battery cell */
+	battery: battery-cell {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion";
+
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4200000>;
+
+		charge-full-design-microamp-hours = <1500000>;
+		energy-full-design-microwatt-hours = <5600000>;
+
+		constant-charge-voltage-max-microvolt = <4200000>;
+		operating-range-celsius = <0 45>;
+	};
+
+	extcon-keys {
+		compatible = "gpio-keys";
+
+		switch-dock-hall-sensor-north {
+			label = "Dock Hall sensor (north)";
+			gpios = <&gpio TEGRA_GPIO(S, 2) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_DOCK>;
+			debounce-interval = <500>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		switch-dock-hall-sensor-south {
+			label = "Dock Hall sensor (south)";
+			gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_DOCK>;
+			debounce-interval = <500>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	matrix-keypad {
+		compatible = "gpio-matrix-keypad";
+
+		debounce-delay-ms = <10>;
+		col-scan-delay-us = <5>;
+
+		row-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_LOW
+			     &gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_LOW
+			     &gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_LOW
+			     &gpio TEGRA_GPIO(R, 3) GPIO_ACTIVE_LOW>;
+		col-gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW
+			     &gpio TEGRA_GPIO(Q, 1) GPIO_ACTIVE_LOW
+			     &gpio TEGRA_GPIO(Q, 2) GPIO_ACTIVE_LOW>;
+
+		gpio-activelow;
+
+		linux,keymap = <MATRIX_KEY(0x00, 0x00, KEY_VOLUMEUP)
+
+				MATRIX_KEY(0x01, 0x00, KEY_VOLUMEDOWN)
+
+				MATRIX_KEY(0x02, 0x00, KEY_BACK)
+				MATRIX_KEY(0x02, 0x01, KEY_SEARCH)
+				MATRIX_KEY(0x02, 0x02, KEY_HOME)
+
+				MATRIX_KEY(0x03, 0x01, KEY_MENU)>;
+
+		wakeup-source;
+	};
+
+	sound {
+		nvidia,model = "Motorola Droid X2 (MB870) CPCAP";
+	};
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi b/arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
new file mode 100644
index 0000000000000..508b95e2e272b
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
@@ -0,0 +1,1194 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/input/atmel-maxtouch.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
+#include "tegra20.dtsi"
+#include "tegra20-cpu-opp.dtsi"
+#include "tegra20-cpu-opp-microvolt.dtsi"
+
+/ {
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc3; /* uSD slot */
+		mmc2 = &sdmmc1; /* WiFi */
+
+		rtc0 = &cpcap_rtc;
+		rtc1 = "/rtc@7000e000";
+
+		serial0 = &uartb; /* Console */
+		serial1 = &uartc; /* Bluetooth */
+	};
+
+	/*
+	 * The decompressor and also some bootloaders rely on a
+	 * pre-existing /chosen node to be available to insert the
+	 * command line and merge other ATAGS info.
+	 */
+	chosen { };
+
+	memory@0 {
+		reg = <0x00000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma@20000000 {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x20000000 0x10000000>;
+			size = <0x10000000>; /* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+	};
+
+	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					vi_ppa_input: endpoint {
+						/* Link to the rear camera */
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						/* Link to the front camera */
+					};
+				};
+			};
+		};
+
+		hdmi@54280000 {
+			status = "okay";
+
+			/*
+			 * Mot uses PLLD for both HDMI and DSI. HDMI does
+			 * not support opps for frequencies used by DSI.
+			 * Consequently, DSI works, but it causes HDMI to
+			 * fail. Remove operating-points-v2 from HDMI.
+			 */
+			/delete-property/ operating-points-v2;
+
+			vdd-supply = <&avdd_3v3_periph>;
+			pll-supply = <&vdd_hvio>;
+			hdmi-supply = <&vdd_hdmi_en>;
+
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+
+		dsi@54300000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+			panel@0 {
+				compatible = "motorola,mot-panel";
+				reg = <0>;
+
+				reset-gpios = <&gpio TEGRA_GPIO(E, 3) GPIO_ACTIVE_LOW>;
+
+				vdd-supply = <&vdd_5v0_panel>;
+				vddio-supply = <&vdd_1v8_vio>;
+
+				backlight = <&backlight>;
+			};
+		};
+	};
+
+	gpio@6000d000 {
+		usb-mux-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(V, 6) GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
+	};
+
+	pinmux@70000014 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			crt {
+				nvidia,pins = "crtp";
+				nvidia,function = "crt";
+			};
+
+			dap1 {
+				nvidia,pins = "dap1";
+				nvidia,function = "dap1";
+			};
+
+			dap2 {
+				nvidia,pins = "dap2";
+				nvidia,function = "dap2";
+			};
+
+			dap3 {
+				nvidia,pins = "dap3";
+				nvidia,function = "dap3";
+			};
+
+			dap4 {
+				nvidia,pins = "dap4";
+				nvidia,function = "dap4";
+			};
+
+			displaya {
+				nvidia,pins = "lcsn", "ld0", "ld1", "ld3",
+					      "ld5", "ld6", "ld7", "ld8",
+					      "ld9", "ld12", "ld13", "ld14",
+					      "ld15", "ld16", "ld17", "ldi",
+					      "lhp0", "lhp1", "lhp2", "lhs",
+					      "lpp", "lsc0", "lpw1", "lsda",
+					      "lspi";
+				nvidia,function = "displaya";
+			};
+
+			gmi {
+				nvidia,pins = "ata", "atc", "atd", "ate",
+					      "gmb", "gmd", "gpu";
+				nvidia,function = "gmi";
+			};
+
+			hdmi {
+				nvidia,pins = "hdint";
+				nvidia,function = "hdmi";
+			};
+
+			i2c1 {
+				nvidia,pins = "rm";
+				nvidia,function = "i2c1";
+			};
+
+			i2c2 {
+				nvidia,pins = "ddc";
+				nvidia,function = "i2c2";
+			};
+
+			i2c3 {
+				nvidia,pins = "dtf";
+				nvidia,function = "i2c3";
+			};
+
+			i2cp {
+				nvidia,pins = "i2cp";
+				nvidia,function = "i2cp";
+			};
+
+			kbc {
+				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
+					      "kbce", "kbcf";
+				nvidia,function = "kbc";
+			};
+
+			osc {
+				nvidia,pins = "cdev1", "cdev2";
+				nvidia,function = "osc";
+			};
+
+			owr {
+				nvidia,pins = "owc", "uac";
+				nvidia,function = "owr";
+			};
+
+			pcie {
+				nvidia,pins = "gpv";
+				nvidia,function = "pcie";
+			};
+
+			pwr-on {
+				nvidia,pins = "pmc";
+				nvidia,function = "pwr_on";
+			};
+
+			rsvd3 {
+				nvidia,pins = "lm1";
+				nvidia,function = "rsvd3";
+			};
+
+			rsvd4 {
+				nvidia,pins = "lvp0", "lvp1", "lvs", "ld10",
+					      "ld11", "ld2", "ld4", "ldc";
+				nvidia,function = "rsvd4";
+			};
+
+			rtck {
+				nvidia,pins = "gpu7";
+				nvidia,function = "rtck";
+			};
+
+			sdio1 {
+				nvidia,pins = "sdio1";
+				nvidia,function = "sdio1";
+			};
+
+			sdio3 {
+				nvidia,pins = "sdb", "sdc", "sdd";
+				nvidia,function = "sdio3";
+			};
+
+			sdio4 {
+				nvidia,pins = "atb", "gma", "gme";
+				nvidia,function = "sdio4";
+			};
+
+			spdif {
+				nvidia,pins = "slxc", "slxd";
+				nvidia,function = "spdif";
+			};
+
+			spi1 {
+				nvidia,pins = "spid", "spie", "spif";
+				nvidia,function = "spi1";
+			};
+
+			spi2 {
+				nvidia,pins = "spia", "spib", "spic", "spig",
+					      "spih";
+				nvidia,function = "spi2";
+			};
+
+			spi3 {
+				nvidia,pins = "lm0", "lpw0", "lpw2", "lsc1";
+				nvidia,function = "spi3";
+			};
+
+			uarta {
+				nvidia,pins = "irrx", "irtx";
+				nvidia,function = "uarta";
+			};
+
+			uartc {
+				nvidia,pins = "uca", "ucb";
+				nvidia,function = "uartc";
+			};
+
+			uartd {
+				nvidia,pins = "gmc";
+				nvidia,function = "uartd";
+			};
+
+			ulpi {
+				nvidia,pins = "uab";
+				nvidia,function = "ulpi";
+			};
+
+			vi {
+				nvidia,pins = "dta", "dtb", "dtc", "dtd",
+					      "dte";
+				nvidia,function = "vi";
+			};
+
+			vi-sensor-clk {
+				nvidia,pins = "csus";
+				nvidia,function = "vi_sensor_clk";
+			};
+
+			conf-lcsn {
+				nvidia,pins = "lcsn", "lpw1", "lsck", "lsda",
+					      "lsdi", "ldc", "hdint";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			conf-ata {
+				nvidia,pins = "ata", "atc", "ddc", "gmc",
+					      "gpu", "kbca", "kbcb", "kbcc",
+					      "kbcd", "kbce", "kbcf", "owc",
+					      "sdc", "sdd", "sdio1", "uaa",
+					      "uad", "uca", "ucb", "pmce";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			conf-crtp {
+				nvidia,pins = "crtp", "csus", "pta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			};
+
+			conf-atd {
+				nvidia,pins = "atb", "atd", "ate", "cdev2",
+					      "cdev1", "dte", "gma", "gmb",
+					      "gmd", "gme", "gpu7", "gpv",
+					      "i2cp", "irrx", "irtx", "rm",
+					      "slxa", "slxc", "slxd", "slxk",
+					      "spdi", "spdo", "spid", "spie",
+					      "spif", "uda", "ck32", "ddrc",
+					      "pmca", "pmcb", "pmcc", "pmcd",
+					      "xm2c", "xm2d";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			conf-ld0 {
+				nvidia,pins = "ld0", "ld1", "ld2", "ld3",
+					      "ld4", "ld5", "ld6", "ld7",
+					      "ld8", "ld9", "ld10", "ld11",
+					      "ld12", "ld13", "ld14", "ld15",
+					      "ld16", "ld17", "ldi", "lhp0",
+					      "lhp1", "lhp2", "lhs", "lm0",
+					      "lpp", "lpw0", "lpw2", "lsc0",
+					      "lsc1", "lspi", "lvp1", "lm1",
+					      "lvp0", "lvs", "pmc", "sdb";
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			conf-dta {
+				nvidia,pins = "dap1", "dap2", "dap3", "dap4",
+					      "dta", "dtb", "dtc", "dtd", "dtf";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			conf-spi2 {
+				nvidia,pins = "spia", "spib", "spic", "spig",
+					      "spih";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			drive-sdio1 {
+				nvidia,pins = "drive_sdio1", "drive_ddc", "drive_vi1",
+					      "drive_vi2", "drive_dbg";
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,pull-down-strength = <31>;
+				nvidia,pull-up-strength = <31>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+			};
+		};
+	};
+
+	spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
+	tegra_i2s1: i2s@70002800 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
+	uartb: serial@70006040 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
+		status = "okay";
+
+		/* Console */
+	};
+
+	uartc: serial@70006200 {
+		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		/* Broadcom BCM4329HKUBG */
+		bluetooth {
+			compatible = "brcm,bcm4329-bt";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
+			/* PLLP 216MHz / 16 / 4 */
+			max-speed = <3375000>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+			clock-names = "txco";
+
+			vbat-supply  = <&vdd_3v3_sys>;
+			vddio-supply = <&vdd_1v8_vio>;
+
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios = <&gpio TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gen1_i2c: i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		led-controller@38 {
+			compatible = "ti,lm3532";
+			reg = <0x38>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
+
+			vin-supply = <&vdd_led>;
+
+			ramp-up-us = <0>;
+			ramp-down-us = <0>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			backlight_led: led@0 {
+				reg = <0>;
+
+				led-sources = <0>;
+				led-max-microamp = <26600>;
+
+				ti,led-mode = <0>;
+				ti,linear-mapping-mode;
+
+				label = ":backlight";
+			};
+		};
+
+		touchscreen@4a {
+			compatible = "atmel,maxtouch";
+			reg = <0x4a>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(F, 5) IRQ_TYPE_LEVEL_LOW>;
+
+			touchscreen-min-y = <10>;
+			touchscreen-swapped-x-y;
+
+			reset-gpios = <&gpio TEGRA_GPIO(F, 4) GPIO_ACTIVE_LOW>;
+
+			vdda-supply = <&vdd_3v3_sys>;
+			vdd-supply  = <&vdd_3v3_sys>;
+		};
+	};
+
+	hdmi_ddc: i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	cam_i2c: i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <400000>;
+	};
+
+	sen_i2c: i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		magnetometer@c {
+			compatible = "asahi-kasei,ak8975";
+			reg = <0xc>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(E, 2) IRQ_TYPE_EDGE_RISING>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_hvio>;
+			vid-supply = <&vdd_1v8_vio>;
+		};
+
+		accelerometer@f {
+			compatible = "kionix,kxtf9";
+			reg = <0xf>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(V, 3) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&vdd_hvio>;
+			vddio-supply = <&vdd_1v8_vio>;
+		};
+
+		nct1008: temperature-sensor@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(D, 1) IRQ_TYPE_EDGE_FALLING>;
+
+			vcc-supply = <&vcore_emmc>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	spi@7000d600 {
+		status = "okay";
+		spi-max-frequency = <25000000>;
+
+		cpcap: pmic@0 {
+			compatible = "motorola,mot-cpcap";
+			reg = <0>;
+
+			spi-cs-high;
+			spi-max-frequency = <8000000>;
+
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			cpcap_adc: adc {
+				compatible = "motorola,mot-cpcap-adc";
+
+				interrupts-extended = <&cpcap 8 IRQ_TYPE_NONE>;
+				interrupt-names = "adcdone";
+
+				#io-channel-cells = <1>;
+			};
+
+			cpcap_audio: audio-codec {
+				interrupts-extended = <&cpcap 9 IRQ_TYPE_NONE>,
+						      <&cpcap 10 IRQ_TYPE_NONE>;
+				interrupt-names = "hs", "mb2";
+
+				VAUDIO-supply = <&vdd_audio>;
+
+				#sound-dai-cells = <1>;
+			};
+
+			/* CHARGE_NOW has to be dumped and preloaded on each reboot */
+			battery {
+				compatible = "motorola,cpcap-battery";
+
+				interrupts-extended =
+					<&cpcap 6 IRQ_TYPE_NONE>,  <&cpcap 5 IRQ_TYPE_NONE>,
+					<&cpcap 3 IRQ_TYPE_NONE>,  <&cpcap 20 IRQ_TYPE_NONE>,
+					<&cpcap 54 IRQ_TYPE_NONE>, <&cpcap 57 IRQ_TYPE_NONE>;
+				interrupt-names =
+					"eol", "lowbph", "lowbpl",
+					"chrgcurr1", "battdetb", "cccal";
+
+				io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
+					      <&cpcap_adc 5>, <&cpcap_adc 6>;
+				io-channel-names = "battdetb", "battp",
+						   "chg_isense", "batti";
+
+				monitored-battery = <&battery>;
+			};
+
+			key-power {
+				compatible = "motorola,cpcap-pwrbutton";
+
+				interrupt-parent = <&cpcap>;
+				interrupts = <23 IRQ_TYPE_NONE>;
+			};
+
+			led-red {
+				compatible = "motorola,cpcap-led-red";
+				vdd-supply = <&vdd_led>;
+				label = "status-led::red";
+			};
+
+			led-green {
+				compatible = "motorola,cpcap-led-green";
+				vdd-supply = <&vdd_led>;
+				label = "status-led::green";
+			};
+
+			led-blue {
+				compatible = "motorola,cpcap-led-blue";
+				vdd-supply = <&vdd_led>;
+				label = "status-led::blue";
+			};
+
+			led-adl {
+				compatible = "motorola,cpcap-led-adl";
+				vdd-supply = <&vdd_led>;
+				label = "cpcap::keypad";
+			};
+
+			regulator {
+				compatible = "motorola,mot-cpcap-regulator";
+
+				regulators {
+					vdd_cpu: SW1 {
+						regulator-name = "vdd_cpu";
+						regulator-min-microvolt = <750000>;
+						regulator-max-microvolt = <1125000>;
+						regulator-coupled-with = <&vdd_core &vdd_rtc>;
+						regulator-coupled-max-spread = <550000 550000>;
+						regulator-enable-ramp-delay = <1500>;
+						regulator-always-on;
+						regulator-boot-on;
+
+						nvidia,tegra-cpu-regulator;
+					};
+
+					vdd_core: SW2 {
+						regulator-name = "vdd_core";
+						regulator-min-microvolt = <950000>;
+						regulator-max-microvolt = <1300000>;
+						regulator-coupled-with = <&vdd_rtc &vdd_cpu>;
+						regulator-coupled-max-spread = <170000 550000>;
+						regulator-enable-ramp-delay = <1500>;
+						regulator-always-on;
+						regulator-boot-on;
+
+						nvidia,tegra-core-regulator;
+					};
+
+					vdd_1v8_vio: SW3 {
+						regulator-name = "vdd_1v8_vio";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-enable-ramp-delay = <0>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_rtc: SW4 {
+						regulator-name = "vdd_aon";
+						regulator-min-microvolt = <950000>;
+						regulator-max-microvolt = <1300000>;
+						regulator-coupled-with = <&vdd_core &vdd_cpu>;
+						regulator-coupled-max-spread = <170000 550000>;
+						regulator-enable-ramp-delay = <1500>;
+						regulator-always-on;
+						regulator-boot-on;
+
+						nvidia,tegra-rtc-regulator;
+					};
+
+					vdd_led: SW5 {
+						regulator-name = "vdd_led";
+						regulator-min-microvolt = <5050000>;
+						regulator-max-microvolt = <5050000>;
+						regulator-enable-ramp-delay = <1500>;
+						regulator-boot-on;
+					};
+
+					VCAM {
+						regulator-name = "vdd_cam1";
+						regulator-min-microvolt = <2600000>;
+						regulator-max-microvolt = <2900000>;
+						regulator-enable-ramp-delay = <1000>;
+					};
+
+					avdd_dsi_csi: VCSI {
+						regulator-name = "avdd_dsi_csi";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-boot-on;
+					};
+
+					vdd_hvio: VHVIO {
+						regulator-name = "vdd_hvio";
+						regulator-min-microvolt = <2775000>;
+						regulator-max-microvolt = <2775000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vcore_emmc: VSDIO {
+						regulator-name = "vcore_emmc";
+						regulator-min-microvolt = <1500000>;
+						regulator-max-microvolt = <3000000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					VPLL {
+						regulator-name = "avdd_pll";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					avdd_3v3_periph: VWLAN2 {
+						regulator-name = "avdd_3v3_periph";
+						regulator-min-microvolt = <2775000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-boot-on;
+					};
+
+					vddio_usd: VSIMCARD {
+						regulator-name = "vddio_usd";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2900000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-boot-on;
+					};
+
+					vdd_haptic: VVIB {
+						regulator-name = "vdd_haptic";
+						regulator-min-microvolt = <1300000>;
+						regulator-max-microvolt = <3000000>;
+						regulator-enable-ramp-delay = <1000>;
+					};
+
+					vdd_usb_det: VUSB {
+						regulator-name = "vdd_usb_det";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_audio: VAUDIO {
+						regulator-name = "vdd_audio";
+						regulator-min-microvolt = <2775000>;
+						regulator-max-microvolt = <2775000>;
+						regulator-enable-ramp-delay = <1000>;
+						regulator-allowed-modes = <0x00>, <0x40>;
+						regulator-initial-mode = <0x00>; /* NORMAL */
+					};
+				};
+			};
+
+			cpcap_rtc: rtc {
+				compatible = "motorola,cpcap-rtc";
+
+				interrupt-parent = <&cpcap>;
+				interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
+			};
+		};
+	};
+
+	pmc@7000e400 {
+		nvidia,suspend-mode = <1>;
+		nvidia,cpu-pwr-good-time = <800>;
+		nvidia,cpu-pwr-off-time = <600>;
+		nvidia,core-pwr-good-time = <1842 1842>;
+		nvidia,core-pwr-off-time = <31>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
+	};
+
+	memory-controller@7000f400 {
+		nvidia,use-ram-code;
+
+		emc-tables@0 {
+			reg = <0>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* Elpida 1G 50nm */
+			lpddr2 {
+				compatible = "elpida,B8132B2PB-6D-F", "jedec,lpddr2-s4";
+				revision-id = <0 0>;
+				density = <2048>;
+				io-width = <16>;
+			};
+
+			emc-table@25000 {
+				reg = <25000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <25000>;
+				nvidia,emc-registers = < 0x00000002 0x00000006
+					0x00000003 0x00000003 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000004
+					0x00000003 0x00000008 0x0000000b 0x0000004d
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000008 0x00000001 0x0000000a 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x00000068 0x00000000 0x00000003
+					0x00000000 0x00000000 0x00000282 0xa06804ae
+					0x00004810 0x00000000 0x00000000 0x00000003
+					0x00000000 0x00000000 0x00000000 0x00000000 >;
+			};
+
+			emc-table@50000 {
+				reg = <50000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <50000>;
+				nvidia,emc-registers = < 0x00000003 0x00000007
+					0x00000003 0x00000003 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000005
+					0x00000003 0x00000008 0x0000000b 0x0000009f
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000008 0x00000001 0x0000000a 0x00000007
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x000000d0 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000282 0xa06804ae
+					0x00004810 0x00000000 0x00000000 0x00000005
+					0x00000000 0x00000000 0x00000000 0x00000000 >;
+			};
+
+			emc-table@75000 {
+				reg = <75000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <75000>;
+				nvidia,emc-registers = < 0x00000005 0x0000000a
+					0x00000004 0x00000003 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000005
+					0x00000003 0x00000008 0x0000000b 0x000000ff
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000008 0x00000001 0x0000000a 0x0000000b
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x00000138 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000282 0xa06804ae
+					0x00004810 0x00000000 0x00000000 0x00000007
+					0x00000000 0x00000000 0x00000000 0x00000000 >;
+			};
+
+			emc-table@150000 {
+				reg = <150000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <150000>;
+				nvidia,emc-registers = < 0x00000009 0x00000014
+					0x00000007 0x00000004 0x00000006 0x00000004
+					0x00000002 0x00000009 0x00000003 0x00000003
+					0x00000002 0x00000002 0x00000002 0x00000005
+					0x00000003 0x00000008 0x0000000b 0x0000021f
+					0x00000000 0x00000003 0x00000003 0x00000004
+					0x00000008 0x00000001 0x0000000a 0x00000015
+					0x00000003 0x00000008 0x00000004 0x00000006
+					0x00000002 0x00000270 0x00000000 0x00000001
+					0x00000000 0x00000000 0x00000282 0xa04c04ae
+					0x007fc010 0x00000000 0x00000000 0x0000000e
+					0x00000000 0x00000000 0x00000000 0x00000000 >;
+			};
+
+			emc-table@300000 {
+				reg = <300000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <300000>;
+				nvidia,emc-registers = < 0x00000012 0x00000027
+					0x0000000d 0x00000007 0x00000007 0x00000005
+					0x00000003 0x00000009 0x00000006 0x00000006
+					0x00000003 0x00000003 0x00000002 0x00000006
+					0x00000003 0x00000009 0x0000000c 0x0000045f
+					0x00000000 0x00000004 0x00000004 0x00000007
+					0x00000008 0x00000001 0x0000000e 0x0000002a
+					0x00000003 0x0000000f 0x00000008 0x00000005
+					0x00000002 0x000004e0 0x00000005 0x00000002
+					0x00000000 0x00000000 0x00000282 0xf04c040b
+					0x007fe010 0x00000000 0x00000000 0x0000001b
+					0x00000000 0x00000000 0x00000000 0x00000000 >;
+			};
+		};
+	};
+
+	usb@c5000000 {
+		compatible = "nvidia,tegra20-udc";
+		status = "okay";
+		dr_mode = "peripheral";
+	};
+
+	usb-phy@c5000000 {
+		status = "okay";
+		dr_mode = "peripheral";
+		nvidia,xcvr-setup = <8>;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
+		vbus-supply = <&avdd_3v3_periph>;
+	};
+
+	sdmmc1: mmc@c8000000 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SDMMC1>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_P>;
+		assigned-clock-rates = <50000000>;
+
+		max-frequency = <50000000>;
+		keep-power-in-suspend;
+		bus-width = <4>;
+		non-removable;
+
+		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		vmmc-supply = <&vdd_3v3_com>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+
+		/* Broadcom BCM4329HKUBG */
+		wifi@1 {
+			compatible = "brcm,bcm4329-fmac";
+			reg = <1>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
+	sdmmc3: mmc@c8000400 {
+		status = "okay";
+		bus-width = <4>;
+
+		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+		disable-wp;
+
+		vmmc-supply = <&vdd_usd>;
+		vqmmc-supply = <&vddio_usd>;
+	};
+
+	sdmmc4: mmc@c8000600 {
+		status = "okay";
+		bus-width = <8>;
+		non-removable;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+	};
+
+	backlight: backlight {
+		compatible = "led-backlight";
+
+		leds = <&backlight_led>;
+
+		brightness-levels = <31 63 95 127 159 191 223 255>;
+		default-brightness-level = <6>;
+	};
+
+	/* 32KHz oscillator which is used by PMC */
+	clk32k_in: clock-32k-in {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "ref-oscillator";
+	};
+
+	cpus {
+		cpu0: cpu@0 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			cpu-supply = <&vdd_cpu>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		gpios = <&gpio TEGRA_GPIO(V, 7) GPIO_ACTIVE_LOW>;
+		timeout-ms = <500>;
+	};
+
+	haptic-feedback {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vdd_haptic>;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
+	opp-table-emc {
+		/delete-node/ opp-666000000;
+		/delete-node/ opp-760000000;
+	};
+
+	brcm_wifi_pwrseq: pwrseq-wifi {
+		compatible = "mmc-pwrseq-simple";
+
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+		clock-names = "ext_clock";
+
+		reset-gpios = <&gpio TEGRA_GPIO(U, 2) GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+		power-off-delay-us = <200>;
+	};
+
+	vdd_5v0_sys: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vdd_3v3_sys: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_vs";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_1v2_lpddr2: regulator-lpddr2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_ddr";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_hvio>;
+	};
+
+	vdd_5v0_panel: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_disp";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_usd: regulator-usd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_3v3_com: regulator-com {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_com";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(U, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_hdmi_en: regulator-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_hdmi_en";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(F, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	sound {
+		compatible = "motorola,tegra-audio-cpcap-mot",
+			     "nvidia,tegra-audio-cpcap";
+
+		nvidia,audio-routing =
+			"Headphones", "HSR",
+			"Headphones", "HSL",
+			"Int Spk", "SPKR",
+			"Int Spk", "SPKL",
+			"Earpiece", "EP",
+			"HSMIC", "Mic Jack",
+			"MICR", "Internal Mic 1",
+			"MICL", "Internal Mic 2";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&cpcap_audio>;
+
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+	};
+
+	thermal-zones {
+		skin-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 0>;
+
+			trips {
+				trip0: skin-alert {
+					/* throttle at 57C until temperature drops to 56.8C */
+					temperature = <57000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: skin-crit {
+					/* shut down at 65C */
+					temperature = <65000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu-thermal {
+			polling-delay-passive = <500>; /* milliseconds */
+			polling-delay = <1500>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip2: cpu-alert {
+					/* throttle at 75C until temperature drops to 74.8C */
+					temperature = <75000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip3: cpu-crit {
+					/* shut down at 90C */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&trip2>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts b/arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts
new file mode 100644
index 0000000000000..f53a057972401
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra20-motorola-mot.dtsi"
+
+/ {
+	model = "Motorola Atrix 4G (MB860)";
+	compatible = "motorola,olympus", "nvidia,tegra20";
+
+	gpio@6000d000 {
+		volume-buttons-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+
+	i2c@7000c000 {
+		led-controller@38 {
+			led@1 {
+				reg = <1>;
+
+				led-sources = <1 2>;
+				led-max-microamp = <8200>;
+
+				ti,led-mode = <0>;
+				ti,linear-mapping-mode;
+
+				label = ":keypad";
+			};
+		};
+
+		touchscreen@4a {
+			touchscreen-size-x = <930>;
+			touchscreen-size-y = <1018>;
+			touchscreen-min-x = <0>;
+
+			/* Buttons are just a part of touchscreen */
+		};
+
+		light-sensor@44 {
+			compatible = "isil,isl29030";
+			reg = <0x44>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(E, 1) IRQ_TYPE_LEVEL_LOW>;
+
+			vdd-supply = <&vdd_hvio>;
+		};
+	};
+
+	i2c@7000d000 {
+		accelerometer@f {
+			mount-matrix =	 "1",  "0",  "0",
+					 "0",  "1",  "0",
+					 "0",  "0", "-1";
+		};
+	};
+
+	spi@7000d600 {
+		pmic@0 {
+			led-adl {
+				status = "disabled";
+			};
+		};
+	};
+
+	/* Motorola BH6X battery cell */
+	battery: battery-cell {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4200000>;
+
+		charge-full-design-microamp-hours = <1880000>;
+		energy-full-design-microwatt-hours = <7000000>;
+
+		constant-charge-voltage-max-microvolt = <4200000>;
+		operating-range-celsius = <0 45>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	sound {
+		nvidia,model = "Motorola Atrix 4G (MB860) CPCAP";
+	};
+};
-- 
2.53.0

