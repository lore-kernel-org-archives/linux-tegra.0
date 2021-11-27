Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2CEC433FE
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Nov 2021 14:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355455AbhK0Ods (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 09:33:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235791AbhK0Obr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:31:47 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA40C061757;
        Sat, 27 Nov 2021 06:26:39 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u22so24594731lju.7;
        Sat, 27 Nov 2021 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=295g4lI5luzuwRqp7EY01MoAsRzexqstBzX7OPr3FFA=;
        b=WNJwIjOi8Hfrs6PAbeCA8llVSBF+69vTWOW8RoXLozQNIY1kE/ruCfoKZTs8QszyLR
         73FTZwLINpIk+8ANJ7LrR8MhFzuNCCXmpEDRqmN5XC9WKrDanZSUW38aZNYkDnMPVLYK
         DSZZ568K9COYJKp8kmPgNRzPPkbAxgzdhYBR/mgmRcnrl91bhJQz0KhyUCP/ULLwTNBg
         /VxJBlYo+ahfQRmX5j9FUW1tcj36nEch/KkmyCjvuT4a4qo+0duZ9+9+sevYZ3fRcoVT
         Untk4y7iVxqBZtoas1DgjQXMEBfK9CB/JPD0SoR8WzDx3Mlcc8MgFLkhStcE6wOldqlv
         nmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=295g4lI5luzuwRqp7EY01MoAsRzexqstBzX7OPr3FFA=;
        b=TcroOFwW5VQo4K0QRgxx5ysgtv8DrL4wKsB5TcYPGRBkkUYF9Pfdb6QKmz7bS5rjGV
         5e9RKNtXU3DQAq4QYd/CDi2SiJ/E/9ydWj5+rz2QlYuJP1rlo6h2IJ14PQkPFQdPHOiQ
         9bCdhrz1kSZDMCZ0pQn1+EuuQngImy3g68sOaNENr0UBLrqa3SfuT5LyTdVttq5/8LbP
         GM53WlSe+DSQ01Q/Ojzrmb90SdvRYtH/HpiKXfQhfb86Ajwnj1phA+6QAaDeJ4e6/4EG
         7FQ0Wp+GYi5X9oPTlkaqPZjQBcFYqm1/T73Hq/5M5kjaQ4pvCIKBaQDLwcA4CuYiDc8l
         /e4A==
X-Gm-Message-State: AOAM530CbuTGsp0ahBgB9neM82HOhvpowYNr9sMt2AFclTMMDkGBKitV
        0Pzs2aKHIHiOBk55kDWapoc=
X-Google-Smtp-Source: ABdhPJzZSYjAsRGI+p/VjpSN/WKfpqgzVlhsR6sNOr5LQp07/LBGAUSZqcucnnhlGlfm/F2zvt8F9g==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr36317032ljh.428.1638023196971;
        Sat, 27 Nov 2021 06:26:36 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:36 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/14] ARM: tegra: Add device-tree for ASUS Transformer Pad TF300T
Date:   Sat, 27 Nov 2021 17:23:19 +0300
Message-Id: <20211127142327.17692-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211127142327.17692-1-digetx@gmail.com>
References: <20211127142327.17692-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add device-tree for ASUS Transformer Pad TF300T, which is NVIDIA
Tegra30-based tablet device.

Tested-by: Ihor Didenko <tailormoon@rambler.ru>
Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 arch/arm/boot/dts/Makefile                |    1 +
 arch/arm/boot/dts/tegra30-asus-tf300t.dts | 1030 +++++++++++++++++++++
 2 files changed, 1031 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf300t.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a72aab08e4db..85477066bb2d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1322,6 +1322,7 @@ dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += \
 	tegra30-asus-nexus7-grouper-E1565.dtb \
 	tegra30-asus-nexus7-tilapia-E1565.dtb \
 	tegra30-asus-tf201.dtb \
+	tegra30-asus-tf300t.dtb \
 	tegra30-beaver.dtb \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300t.dts b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
new file mode 100644
index 000000000000..2981b0e15d63
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
@@ -0,0 +1,1030 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra30-asus-transformer-common.dtsi"
+#include "tegra30-asus-lvds-display.dtsi"
+
+/ {
+	model = "Asus Transformer Pad TF300T";
+	compatible = "asus,tf300t", "nvidia,tegra30";
+
+	gpio@6000d000 {
+		tf300t-init-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(BB, 5) GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+
+	pinmux@70000868 {
+		state_default: pinmux {
+			lcd_pwr2_pc6 {
+				nvidia,pins = "lcd_pwr2_pc6",
+						"lcd_dc1_pd2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pbb3 {
+				nvidia,pins = "pbb3";
+				nvidia,function = "vgp3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pbb7 {
+				nvidia,pins = "pbb7";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row7_pr7 {
+				nvidia,pins = "kb_row7_pr7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_cs4_n_pk2 {
+				nvidia,pins = "gmi_cs4_n_pk2";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+		};
+	};
+
+	uartc: serial@70006200 {
+		/* Azurewave AW-NH615 BCM4329B1 */
+		bluetooth {
+			compatible = "brcm,bcm4329-bt";
+		};
+	};
+
+	i2c@7000c400 {
+		/* Elantech EKTH1036 touchscreen */
+		touchscreen@10 {
+			compatible = "elan,ektf3624";
+			reg = <0x10>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&gpio TEGRA_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+
+			vcc33-supply = <&vdd_3v3_sys>;
+			vccio-supply = <&vdd_3v3_sys>;
+
+			touchscreen-size-x = <2240>;
+			touchscreen-size-y = <1408>;
+			touchscreen-inverted-y;
+		};
+	};
+
+	i2c@7000c500 {
+		clock-frequency = <400000>;
+
+		magnetometer@e {
+			mount-matrix =   "0", "-1",  "0",
+					"-1",  "0",  "0",
+					 "0",  "0", "-1";
+		};
+
+		gyroscope@68 {
+			mount-matrix =   "-1",  "0",  "0",
+					  "0",  "1",  "0",
+					  "0",  "0", "-1";
+
+			/* External I2C interface */
+			i2c-gate {
+				accelerometer@f {
+					mount-matrix =   "0", "-1",  "0",
+							"-1",  "0",  "0",
+							 "0",  "0",  "1";
+				};
+			};
+		};
+	};
+
+	i2c@7000d000 {
+		/* Wolfson Microelectronics WM8903 audio codec */
+		wm8903: audio-codec@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+
+			gpio-cfg = <
+				0xffffffff /* don't touch */
+				0xffffffff /* don't touch */
+				0x00000000 /* Speaker-enable GPIO, output, low */
+				0xffffffff /* don't touch */
+				0xffffffff /* don't touch */
+			>;
+
+			AVDD-supply  = <&vdd_1v8_vio>;
+			CPVDD-supply = <&vdd_1v8_vio>;
+			DBVDD-supply = <&vdd_1v8_vio>;
+			DCVDD-supply = <&vdd_1v8_vio>;
+		};
+	};
+
+	display-panel {
+		compatible = "innolux,g101ice-l01";
+	};
+
+	sound {
+		compatible = "asus,tegra-audio-wm8903-tf300t",
+			     "nvidia,tegra-audio-wm8903";
+		nvidia,model = "Asus Transformer Pad TF300T WM8903";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "ROP",
+			"Int Spk", "RON",
+			"Int Spk", "LOP",
+			"Int Spk", "LON",
+			"IN1L", "Mic Jack",
+			"IN2L", "Mic Jack",
+			"DMICDAT", "Int Mic";
+
+		nvidia,audio-codec = <&wm8903>;
+		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
+		nvidia,headset;
+	};
+
+	memory-controller@7000f000 {
+		emc-timings-0 {
+			/* Elpida 1GB 667MHZ */
+			nvidia,ram-code = <0>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00030003 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x74830303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010003 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x73430303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000030
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0503 0x72830504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000006 0xc0000025
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000003 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0505 0x72440a06 0x001f0000 >;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emem-configuration = < 0x0000000a 0xc000003d
+					0x00000001 0x00000002 0x00000008 0x00000004
+					0x00000004 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000002 0x00000003 0x00000006
+					0x06030202 0x000b0608 0x70850f09 0x001f0000 >;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emem-configuration = < 0x00000014 0xc0000079
+					0x00000003 0x00000004 0x00000010 0x0000000b
+					0x0000000a 0x00000001 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000004 0x00000008
+					0x08040202 0x00130b10 0x70ea1f11 0x001f0000 >;
+			};
+		};
+
+		emc-timings-1 {
+			/* Hynix 1GB 667MHZ */
+			nvidia,ram-code = <1>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00030003 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x74830303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010003 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x73430303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000030
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0503 0x72830504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000006 0xc0000025
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000003 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0605 0x72440a06 0x001f0000 >;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emem-configuration = < 0x0000000a 0xc000003d
+					0x00000001 0x00000002 0x00000008 0x00000005
+					0x00000004 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000002 0x00000003 0x00000006
+					0x06030202 0x000b0608 0x70850f09 0x001f0000 >;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emem-configuration = < 0x00000014 0xc0000079
+					0x00000003 0x00000004 0x00000011 0x0000000b
+					0x0000000a 0x00000001 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000004 0x00000008
+					0x08040202 0x00140b11 0x70ea1f12 0x001f0000 >;
+			};
+		};
+
+		emc-timings-2 {
+			/* Micron 1GB 667MHZ */
+			nvidia,ram-code = <2>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00020001 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x74830303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010001 0xc0000020
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0502 0x73430303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0xc0000030
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0503 0x72830504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0xc0000025
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000003 0x00000001 0x00000003 0x00000008
+					0x00000002 0x00000001 0x00000002 0x00000006
+					0x06020102 0x000a0505 0x72440a06 0x001f0000 >;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emem-configuration = < 0x00000005 0xc000003d
+					0x00000001 0x00000002 0x00000008 0x00000004
+					0x00000004 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000002 0x00000003 0x00000006
+					0x06030202 0x000b0608 0x70850f09 0x001f0000 >;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emem-configuration = < 0x0000000a 0xc0000079
+					0x00000003 0x00000004 0x00000010 0x0000000a
+					0x0000000a 0x00000001 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000004 0x00000008
+					0x08040202 0x00140b10 0x70ea1f11 0x001f0000 >;
+			};
+		};
+	};
+
+	memory-controller@7000f400 {
+		emc-timings-0 {
+			/* Elpida 1GB 667MHZ */
+			nvidia,ram-code = <0>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000004 0x00000000 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x000000c0 0x00000000 0x00000030
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000001 0x00000000 0x00000004
+					0x00000005 0x000000c7 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000002
+					0x00000008 0x00000001 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000181 0x00000000 0x00000060
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000009 0x00000009
+					0x00000004 0x00000002 0x00000000 0x00000004
+					0x00000005 0x0000018e 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000004
+					0x00000010 0x00000003 0x00000001 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000012 0x00000012
+					0x00000004 0x00000004 0x00000000 0x00000004
+					0x00000005 0x0000031c 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000a
+					0x00000020 0x00000007 0x00000002 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000007 0x00000000 0x00000004
+					0x00000005 0x00000638 0x00000006 0x00000006
+					0x00000000 0x00000000 0x00004288 0x004400a4
+					0x00008000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00020000
+					0x00000100 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000d22 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+
+				nvidia,emc-configuration =  < 0x0000000f
+					0x00000034 0x0000000a 0x00000003 0x00000003
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x00000006 0x00000004 0x0000000a
+					0x0000000c 0x000009e9 0x00000000 0x0000027a
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x00000007 0x0000000e 0x00000039 0x00000200
+					0x00000004 0x0000000a 0x00000000 0x00000004
+					0x00000005 0x00000a2a 0x00000000 0x00000004
+					0x00000000 0x00000000 0x00007088 0x002600a4
+					0x00008000 0x0003c000 0x0003c000 0x0003c000
+					0x0003c000 0x00014000 0x00014000 0x00014000
+					0x00014000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00048000 0x00048000 0x00048000
+					0x00048000 0x000002a0 0x0800013d 0x00000000
+					0x77fff884 0x01f1f508 0x05057404 0x54000007
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x018b000c 0xa0f10000 0x00000000
+					0x00000000 0x800014d4 0xe8000000 0xff00ff89 >;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-reset = <0x80000b71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000001f
+					0x00000069 0x00000017 0x00000007 0x00000005
+					0x0000000c 0x00000003 0x00000011 0x00000007
+					0x00000007 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000a 0x00000009 0x0000000a
+					0x00000011 0x00001412 0x00000000 0x00000504
+					0x00000002 0x0000000e 0x00000001 0x00000000
+					0x0000000c 0x00000016 0x00000072 0x00000200
+					0x00000005 0x00000015 0x00000000 0x00000006
+					0x00000007 0x00001453 0x0000000b 0x00000006
+					0x00000000 0x00000000 0x00005088 0xf00b0191
+					0x00008000 0x00000008 0x00000008 0x00000008
+					0x00000008 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x000002a0 0x0800013d 0x22220000
+					0x77fff884 0x01f1f501 0x07077404 0x54000000
+					0x080001e8 0x0f000021 0x00000802 0x00020000
+					0x00000100 0x0156000c 0xa0f10000 0x00000000
+					0x00000000 0x800028a5 0xe8000000 0xff00ff49 >;
+			};
+		};
+
+		emc-timings-1 {
+			/* Hynix 1GB 667MHZ */
+			nvidia,ram-code = <1>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000004 0x00000000 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x000000c0 0x00000000 0x00000030
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000001 0x00000000 0x00000004
+					0x00000005 0x000000c7 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000002
+					0x00000008 0x00000001 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000181 0x00000000 0x00000060
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000009 0x00000009
+					0x00000004 0x00000002 0x00000000 0x00000004
+					0x00000005 0x0000018e 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000005
+					0x00000010 0x00000003 0x00000001 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000012 0x00000012
+					0x00000004 0x00000004 0x00000000 0x00000004
+					0x00000005 0x0000031c 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000a
+					0x00000020 0x00000007 0x00000003 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000007 0x00000000 0x00000004
+					0x00000005 0x00000638 0x00000006 0x00000006
+					0x00000000 0x00000000 0x00004288 0x004400a4
+					0x00008000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00020000
+					0x00000100 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000d22 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+
+				nvidia,emc-configuration =  < 0x0000000f
+					0x00000034 0x0000000b 0x00000003 0x00000003
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x00000006 0x00000004 0x0000000a
+					0x0000000c 0x000009e9 0x00000000 0x0000027a
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x00000007 0x0000000e 0x00000039 0x00000200
+					0x00000004 0x0000000a 0x00000000 0x00000004
+					0x00000005 0x00000a2a 0x00000000 0x00000004
+					0x00000000 0x00000000 0x00007088 0x002600a4
+					0x00008000 0x0003c000 0x0003c000 0x0003c000
+					0x0003c000 0x00014000 0x00014000 0x00014000
+					0x00014000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00048000 0x00048000 0x00048000
+					0x00048000 0x000002a0 0x0800013d 0x00000000
+					0x77fff884 0x01f1f508 0x05057404 0x54000007
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x018b000c 0xa0f10000 0x00000000
+					0x00000000 0x800014d4 0xe8000000 0xff00ff89 >;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-reset = <0x80000b71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000020
+					0x0000006a 0x00000018 0x00000008 0x00000005
+					0x0000000c 0x00000003 0x00000011 0x00000007
+					0x00000007 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000a 0x00000009 0x0000000a
+					0x00000011 0x00001412 0x00000000 0x00000504
+					0x00000002 0x0000000e 0x00000001 0x00000000
+					0x0000000c 0x00000016 0x00000072 0x00000200
+					0x00000005 0x00000015 0x00000000 0x00000006
+					0x00000007 0x00001453 0x0000000b 0x00000006
+					0x00000000 0x00000000 0x00005088 0xf00b0191
+					0x00008000 0x00000008 0x00000008 0x00000008
+					0x00000008 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x000002a0 0x0800013d 0x22220000
+					0x77fff884 0x01f1f501 0x07077404 0x54000000
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x0155000c 0xa0f10000 0x00000000
+					0x00000000 0x800028a5 0xe8000000 0xff00ff49 >;
+			};
+		};
+
+		emc-timings-2 {
+			/* Micron 1GB 667MHZ */
+			nvidia,ram-code = <2>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200048>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000004 0x00000000 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x000000c0 0x00000000 0x00000030
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000001 0x00000000 0x00000004
+					0x00000005 0x000000c7 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000002
+					0x00000008 0x00000001 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x00000009
+					0x0000000b 0x00000181 0x00000000 0x00000060
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000009 0x00000009
+					0x00000004 0x00000002 0x00000000 0x00000004
+					0x00000005 0x0000018e 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe8000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200048>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000004
+					0x00000010 0x00000003 0x00000001 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x0000000a
+					0x0000000b 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000012 0x00000012
+					0x00000004 0x00000004 0x00000000 0x00000004
+					0x00000005 0x0000031c 0x00000006 0x00000004
+					0x00000000 0x00000000 0x00004288 0x007800a4
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00000000
+					0x00000040 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xd8000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200048>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000009
+					0x00000020 0x00000007 0x00000002 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x0000000a
+					0x0000000b 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000007 0x00000000 0x00000004
+					0x00000005 0x00000638 0x00000006 0x00000006
+					0x00000000 0x00000000 0x00004288 0x004400a4
+					0x00008000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x000002a0 0x0800211c 0x00000000
+					0x77fff884 0x01f1f108 0x05057404 0x54000007
+					0x08000168 0x08000000 0x00000802 0x00020000
+					0x00000100 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000d22 0xd8000000 0xff00ff00 >;
+			};
+
+			timing-333500000 {
+				clock-frequency = <333500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200040>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+
+				nvidia,emc-configuration =  < 0x0000000f
+					0x00000034 0x0000000a 0x00000003 0x00000003
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x00000006 0x00000004 0x0000000a
+					0x0000000c 0x000009e9 0x00000000 0x0000027a
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x00000007 0x0000000e 0x00000039 0x00000200
+					0x00000004 0x0000000a 0x00000000 0x00000004
+					0x00000005 0x00000a2a 0x00000000 0x00000004
+					0x00000000 0x00000000 0x00007088 0x002600a4
+					0x00008000 0x0003c000 0x0003c000 0x0003c000
+					0x0003c000 0x00014000 0x00014000 0x00014000
+					0x00014000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00048000 0x00048000 0x00048000
+					0x00048000 0x000002a0 0x0800013d 0x00000000
+					0x77fff884 0x01f1f508 0x05057404 0x54000007
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x018b000c 0xa0f10000 0x00000000
+					0x00000000 0x800014d4 0xe8000000 0xff00ff89 >;
+			};
+
+			timing-667000000 {
+				clock-frequency = <667000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200058>;
+				nvidia,emc-mode-reset = <0x80000b71>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000001f
+					0x00000069 0x00000016 0x00000007 0x00000005
+					0x0000000c 0x00000003 0x00000011 0x00000008
+					0x00000008 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000a 0x00000009 0x0000000b
+					0x00000011 0x00001412 0x00000000 0x00000504
+					0x00000002 0x0000000e 0x00000001 0x00000000
+					0x0000000c 0x00000016 0x00000072 0x00000200
+					0x00000005 0x00000015 0x00000000 0x00000006
+					0x00000007 0x00001453 0x0000000b 0x00000006
+					0x00000000 0x00000000 0x00005088 0xf00b0191
+					0x00008000 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x000002a0 0x0800013d 0x22220000
+					0x77fff884 0x01f1f501 0x07077404 0x54000000
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x0156000c 0xa0f10000 0x00000000
+					0x00000000 0x800028a5 0xf8000000 0xff00ff49 >;
+			};
+		};
+	};
+};
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp-750000000-1300;
+	/delete-node/ opp-800000000-1300;
+	/delete-node/ opp-900000000-1350;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp-750000000;
+	/delete-node/ opp-800000000;
+	/delete-node/ opp-900000000;
+};
-- 
2.33.1

