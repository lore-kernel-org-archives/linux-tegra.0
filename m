Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE41EB5C9;
	Sat,  3 May 2025 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268224; cv=none; b=d7Ehx96GoVMm2+YX5fH4J/FLu9cT1LMk0ff7JOBZN2X9SpxTRb2tlTzIdi9LhsU6YQSf4m1Q8eETHm4zcB6SzuDzEfF6bWPvbI9ijn947aYnXzETvLaxTA87VKchlOZXYph9efZ6EsamwEA5/R3Y1nlD2Bcyb3euLnY/ehyLAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268224; c=relaxed/simple;
	bh=5N8pAn8G/NJPejxuKEYNYjduIft6tayaYNZhPozZN1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Go/yD8ze3bh9ribkWL93R0vxp/IQnRFcNoU9X0G0FBZpqYULVetITKjrVsv/B+2HNeqt1VmmYfpteirky4W8GTpT+wMB3bpueVNF3DR/O5h/mFwBQeXrrPC9q9CWrP/ISRIEQeWpwM8hfFtJD95MaVFsW8ura08nc8t5T/LQONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYQtQwcV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYQtQwcV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso526098866b.0;
        Sat, 03 May 2025 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746268220; x=1746873020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O49l0bPvs7OmYGU4XFdzUv5h/lgMWTMYmsmUNSyald8=;
        b=XYQtQwcVLRmyN8TA54X9R8v/OhpDmyzB5exO8iIctUjAhC7XDtBe9uFlqlZ27hbEio
         Pa7SFfsUW6ms22Ub28MuyBo1DeF9UeC4iyHAQe/OvELptKR/PLRYE9mc8wJci95EzpTq
         ymj4zWL6eia3r2OCQw5pgY2If7lavt+2L391YI7ytP5CPU4b5VQ2yWFQZIPQATh5M8Cj
         278ZYSjOaLB2TNeHazapXSvFCCncLfDyN7yEL4au2QMtDl5jb/XkTG9skEtPiHHrcOvC
         AP6+g04/OwbUP+O2bs0zKuEGqTlKVjvBCsceuqDQ/lVrDolxayLIgzRCDGjfJt9v/Bn5
         Nmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746268220; x=1746873020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O49l0bPvs7OmYGU4XFdzUv5h/lgMWTMYmsmUNSyald8=;
        b=Hv1gxhgmjhfU685dhNgLBEo3JPU7dLeoKXP5hM6X2dQOamB+Q6giuogPWh20atb237
         dl/yteRPIHi2tkVhDDzFwo8/mVg2inT4h/23PR0ES/h+OevPrDbV39vjYn7yrMYJ7v3U
         e0/wgwyGGIFiLmA4uPaHgFSmNzeuvZF3rzVu/4X8scTDC8dliRvyMcF2C6ZAtKCSw0bC
         PntflNsBLFLmFDutIIy9Fme7gJLqV23wFUCJK3PFKafc9LDSSRm0CbxXJ6J4qc+1ivKo
         6i1PD9G6WxZV+Z5jBpX9j0fKbwvURyCMuupg6yBmQfaw6phS+0vSMxKumrTgo3a6Pvk1
         YJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlyfKcsydPYheff00czOJ47nagE32x68PomqnWC5QQnV5b79O5drKSjPxIn5eVvBn4/OagGtwbsG3F6e0=@vger.kernel.org, AJvYcCVzg2AYM68FpsCuSlITmrn8HQrnfGJBORCdHKP0WNFGnWqEgDmI9gLFNRdhcwM2ufbz6xAB9s8JQP+x5hI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLqTzqMClS9XHHC99wovir+nI5jgLbFxQvmEnor7nesOfwGb+2
	bHChx8Q4AlsGB/2c3AxlghWp+INZNJGMmtqtyt0+n77NwQx6RmwK5A9dTA==
X-Gm-Gg: ASbGncuXNZ9cG647d4v3U+KhDJSGweFIJchkDLXEbMqs6qVdogdVba9zhE+BtjXLlGV
	WtlfN6bdXP4XinnM8arTKeZzCaSu/Tt8fs25yp/PTCuu1DwVoHeM62mLYSZ+s8/4V5R3j83RiPu
	n/jzytixaEVwpIdSoZ9TS3DEa5EiB62vH39+E/yCodXlOBwlBVyZ3IuhUQSIFwO9aU9KIXMLHVS
	ECUJjyd8SxjFOf5jlhfdabx5NHI19BxekTzEWfCvXB3z2Ba2qczND1Q2sgiDI68Oj90RbQ9K6+L
	YIbvm2Li0fTwT/XsbNGlQ7Ksm7PEc35X
X-Google-Smtp-Source: AGHT+IHVJ5VLDixWigwiPnBZY1HeriuRZ3pgi3SqcAhT+1wEoDGsCOhGLo5gBdVOcgR+M4orUm9GJg==
X-Received: by 2002:a17:907:c295:b0:acb:ac79:12fe with SMTP id a640c23a62f3a-ad17b865d5emr551793366b.50.1746268220098;
        Sat, 03 May 2025 03:30:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189509088sm177848766b.146.2025.05.03.03.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 03:30:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL
Date: Sat,  3 May 2025 13:29:50 +0300
Message-ID: <20250503102950.32744-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503102950.32744-1-clamor95@gmail.com>
References: <20250503102950.32744-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device-tree for ASUS Transformer Pad LTE TF300TL, which is NVIDIA
Tegra30-based tablet device.

Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile             |   1 +
 .../boot/dts/nvidia/tegra30-asus-tf300tl.dts  | 857 ++++++++++++++++++
 2 files changed, 858 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index 96972559253c..ff2c5bfd8efa 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -34,6 +34,7 @@ dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += \
 	tegra30-asus-tf201.dtb \
 	tegra30-asus-tf300t.dtb \
 	tegra30-asus-tf300tg.dtb \
+	tegra30-asus-tf300tl.dtb \
 	tegra30-asus-tf700t.dtb \
 	tegra30-beaver.dtb \
 	tegra30-cardhu-a02.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts
new file mode 100644
index 000000000000..2ef9d8737901
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts
@@ -0,0 +1,857 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra30-asus-transformer-common.dtsi"
+#include "tegra30-asus-lvds-display.dtsi"
+
+/ {
+	model = "Asus Transformer Pad LTE TF300TL";
+	compatible = "asus,tf300tl", "nvidia,tegra30";
+
+	gpio@6000d000 {
+		tf300tl-init-hog {
+			gpio-hog;
+			gpios = <TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+
+	pinmux@70000868 {
+		state_default: pinmux {
+			lcd_pwr2_pc6 {
+				nvidia,pins = "lcd_pwr2_pc6",
+					      "lcd_dc1_pd2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pbb3 {
+				nvidia,pins = "pbb3";
+				nvidia,function = "vgp3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pbb7 {
+				nvidia,pins = "pbb7";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			kb_row7_pr7 {
+				nvidia,pins = "kb_row7_pr7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi_cs4_n_pk2 {
+				nvidia,pins = "gmi_cs4_n_pk2";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			ulpi_data5_po6 {
+				nvidia,pins = "ulpi_data5_po6";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			dap3_din_pp1 {
+				nvidia,pins = "dap3_din_pp1";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			crt_hsync_pv6 {
+				nvidia,pins = "crt_hsync_pv6";
+				nvidia,function = "crt";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			crt_vsync_pv7 {
+				nvidia,pins = "crt_vsync_pv7";
+				nvidia,function = "crt";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pu5 {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			clk3_out_pee0 {
+				nvidia,pins = "clk3_out_pee0";
+				nvidia,function = "extperiph3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			clk3_req_pee1 {
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "dev3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			dap1_fs_pn0 {
+				nvidia,pins = "dap1_fs_pn0",
+						"dap1_sclk_pn3";
+				nvidia,function = "i2s0";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			dap1_din_pn1 {
+				nvidia,pins = "dap1_din_pn1";
+				nvidia,function = "i2s0";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			dap1_dout_pn2 {
+				nvidia,pins = "dap1_dout_pn2";
+				nvidia,function = "i2s0";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			clk1_req_pee2 {
+				nvidia,pins = "clk1_req_pee2";
+				nvidia,function = "dap";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			spi2_mosi_px0 {
+				nvidia,pins = "spi2_mosi_px0";
+				nvidia,function = "spi2";
+			};
+
+			spi1_sck_px5 {
+				nvidia,pins = "spi1_sck_px5";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			spi1_miso_px7 {
+				nvidia,pins = "spi1_miso_px7";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			spi2_cs2_n_pw3 {
+				nvidia,pins = "spi2_cs2_n_pw3";
+				nvidia,function = "spi2";
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+		};
+	};
+
+	serial@70006200 {
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
+			mount-matrix =  "-1",  "0",  "0",
+					 "0", "-1",  "0",
+					 "0",  "0",  "1";
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
+		/* Realtek ALC5631 audio codec */
+		rt5631: audio-codec@1a {
+			compatible = "realtek,rt5631";
+			reg = <0x1a>;
+		};
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
+					0x00000003 0x00000004 0x00000010 0x0000000b
+					0x0000000a 0x00000001 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000004 0x00000008
+					0x08040202 0x00130b10 0x70ea1f11 0x001f0000 >;
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
+					0x00000005 0x00000005 0x00000004 0x0000000a
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
+				nvidia,emc-mode-2 = <0x80200048>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000002
+					0x00000008 0x00000001 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x0000000a
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
+				nvidia,emc-configuration =  < 0x00000005
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
+					0x00000000 0x80000713 0xe8000000 0xff00ff00 >;
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
+				nvidia,emc-configuration =  < 0x0000000a
+					0x00000020 0x00000007 0x00000002 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000006 0x00000004 0x0000000a
+					0x0000000b 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000007 0x00000000 0x00000004
+					0x00000005 0x00000638 0x00000007 0x00000004
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
+					0x00000000 0x00050000 0x00050000 0x00050000
+					0x00050000 0x000002a0 0x0800013d 0x00000000
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
+					0x00000069 0x00000017 0x00000007 0x00000005
+					0x0000000c 0x00000003 0x00000011 0x00000007
+					0x00000007 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000b 0x00000009 0x0000000b
+					0x00000011 0x00001412 0x00000000 0x00000504
+					0x00000002 0x0000000e 0x00000001 0x00000000
+					0x0000000c 0x00000016 0x00000072 0x00000200
+					0x00000005 0x00000015 0x00000000 0x00000006
+					0x00000007 0x00001453 0x0000000c 0x00000004
+					0x00000000 0x00000000 0x00005088 0xf00b0191
+					0x00008000 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00018000 0x00018000 0x00018000
+					0x00018000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x000002a0 0x0800013d 0x22220000
+					0x77fff884 0x01f1f501 0x07077404 0x54000000
+					0x080001e8 0x0a000021 0x00000802 0x00020000
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
+					0x00000005 0x00000005 0x00000004 0x0000000a
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
+				nvidia,emc-mode-2 = <0x80200048>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-zcal-cnt-long = <0x00000040>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000002
+					0x00000008 0x00000001 0x00000000 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000004 0x0000000a
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
+				nvidia,emc-configuration =  < 0x00000005
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
+					0x00000000 0x80000713 0xe8000000 0xff00ff00 >;
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
+				nvidia,emc-configuration =  < 0x0000000a
+					0x00000020 0x00000007 0x00000002 0x00000002
+					0x0000000a 0x00000005 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000006 0x00000004 0x0000000a
+					0x0000000b 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000007 0x00000000 0x00000004
+					0x00000005 0x00000638 0x00000007 0x00000004
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
+				nvidia,emc-configuration =  < 0x00000020
+					0x00000069 0x00000017 0x00000007 0x00000005
+					0x0000000c 0x00000003 0x00000011 0x00000007
+					0x00000007 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000b 0x00000009 0x0000000b
+					0x00000011 0x00001412 0x00000000 0x00000504
+					0x00000002 0x0000000e 0x00000001 0x00000000
+					0x0000000c 0x00000016 0x00000072 0x00000200
+					0x00000005 0x00000015 0x00000000 0x00000006
+					0x00000007 0x00001453 0x0000000c 0x00000004
+					0x00000000 0x00000000 0x00005088 0xf00b0191
+					0x00008000 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x000002a0 0x0600013d 0x22220000
+					0x77fff884 0x01f1f501 0x07077404 0x54000000
+					0x080001e8 0x08000021 0x00000802 0x00020000
+					0x00000100 0x0156000c 0xa0f10000 0x00000000
+					0x00000000 0x800028a5 0xf8000000 0xff00ff49 >;
+			};
+		};
+	};
+
+	pad_battery: battery-pad {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+		charge-full-design-microamp-hours = <2940000>;
+		energy-full-design-microwatt-hours = <22000000>;
+		operating-range-celsius = <0 45>;
+	};
+
+	dock_battery: battery-dock {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+		charge-full-design-microamp-hours = <2260000>;
+		energy-full-design-microwatt-hours = <16000000>;
+		operating-range-celsius = <0 45>;
+	};
+
+	display-panel {
+		compatible = "innolux,g101ice-l01";
+	};
+
+	opp-table-emc {
+		/delete-node/ opp-750000000-1300;
+		/delete-node/ opp-800000000-1300;
+		/delete-node/ opp-900000000-1350;
+	};
+
+	opp-table-actmon {
+		/delete-node/ opp-750000000;
+		/delete-node/ opp-800000000;
+		/delete-node/ opp-900000000;
+	};
+
+	sound {
+		compatible = "asus,tegra-audio-rt5631-tf300tl",
+			     "nvidia,tegra-audio-rt5631";
+		nvidia,model = "Asus Transformer Pad TF300TL RT5631";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR",
+			"Int Spk", "SPOL",
+			"Int Spk", "SPOR",
+			"MIC1", "MIC Bias1",
+			"MIC Bias1", "Mic Jack",
+			"DMIC", "Int Mic";
+
+		nvidia,audio-codec = <&rt5631>;
+	};
+};
-- 
2.48.1

