Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155433EFFCA;
	Fri, 26 Jun 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471396; cv=none; b=s4uF413Ixg5sf4bY6y5z97m4mEkr/auC0V9aWJkg5g2p4xPzYVUjq1xUHg+hjWOiUFZNvKImvyeUVqpcyfrX6x8xA8bX/vspxtLmihTUSI1e2331pmKLOFmMHb9xEr/XBCIk2vAVsgXs7kwXsTdxd2UeMT1zwnDqpcKJF9FI4HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471396; c=relaxed/simple;
	bh=VJ/7vf0LUNnOB8+291RIuDuMuaUuUy7wd0ujzG7fEDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ducLWttw4rWp+8QBb4uqGwFmjyCgOJ43DvriaiQBcjoyOKLplge2MFG2ySBGUMayPc7IlKFvtDdZ96xZ3XJWyeDn2eNjrPV11ZAlOZxvg4JvikmdOQZoSS8fl+Un2vi3nS8je2aqn/METCJanX9OnBzMNAcIkCuENlFIX9hL7Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=ObVdj5k8; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="ObVdj5k8"
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9vfQI3802336;
	Fri, 26 Jun 2026 10:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=P8OljtSjR6
	oWE9RzPdgj3v66ZbU1fV4jdi4y+u9F6JI=; b=ObVdj5k8uIWIPN4Q4n0G+Oc5fk
	xpE2pI97i+9A8jIyutMt/7WPBSOVyEYkl7ashtVMul781VMv65UNWJ03qq2RBY6k
	Ig3ZE0/hPGJuZoRbh2sJ2+EqVgfYfZgOvPdLSPWwxZ2IvcKWWlADvsTwhuRU++mP
	btOr8bnemLlWX9rp1LQp5md2eq5n5L87LNqjCYikmZPQnDv7UC/4OXz8hO1lRAIF
	K0lP21pqXtTTqeh9hPOGMH2PvC3ZeGYQUL5LPC8QaxqyLsrFskobH7eI9nivjjFz
	BEu6+Wivl7Ltuq7IBokzHkNm4vJKSQnDAd4pjt5/NE7vD8hd7HRShWZgGmag==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4ex9cf3ec0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 10:56:29 +0000 (GMT)
Received: from shelppfpol1.lenovo.com (unknown [10.122.146.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4gmszt6TMpz9vWQL;
	Fri, 26 Jun 2026 10:56:26 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol1.lenovo.com (Postfix) with ESMTPS id 4gmszt4PnKzYlvJr;
	Fri, 26 Jun 2026 10:56:26 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
Date: Fri, 26 Jun 2026 18:56:25 +0800
Message-ID: <20260626105625.600156-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626105625.600156-1-lijq9@lenovo.com>
References: <20260626105625.600156-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PdotuPVGttB3tNx7puRaf5N5fPy8f0qM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4OCBTYWx0ZWRfX8Sek1JcHap2D
 HYLpKnjjyaBlPakeCzx7r/zxradha2d5EO+Y+RHD/E4Vy0C6HiJaaZghsvJzohife2RYLeUqoJt
 4fE/+g4rLQLvJldqKry7lfP6llw+60A=
X-Proofpoint-GUID: PdotuPVGttB3tNx7puRaf5N5fPy8f0qM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4OCBTYWx0ZWRfX86ZdxBqZSjlt
 YIdody69jHap54P+5lBVPeiYqsPcoH9Hk35NMKeAOZB8NTck3myOeb79gb3MKSU9wkSxAzCFwbS
 87bR0dFcaUQmRGDMRGpJP1Sizf7QXFKaQ2KI9d2V+1epQ/4JujSRd7SeMNzgImbU0m+cpwBLsU8
 qikTbMjWW5bc4kuklztXMz/0KZ1yC3w/6GSJi4Whi+P7DILTgPZauTOYn4PKnRgGVinfgfQMXvz
 ctbE48nZh6h5K7tP76vyialirWAiikCEHU9Kxt4s8TXEjavq/fJvOno1dJU4CeoHr8s54ivV6JK
 VnUWa9d0ctnwjSOrA33WqhpXZlmjP/k5UhVDWebXvmuFCaiccNrLhHveDk2nhsMACLFL/JHOmPV
 EhAVL2eMNaEDHRqOgw/RvDoyY2vVc7U0oyl6PmHUJDxQA+rVmt8gv2dnLN6En3dFsu9LBHYB99o
 ZYfxU74OTK8SVHbJFXg==
X-Authority-Analysis: v=2.4 cv=GLw41ONK c=1 sm=1 tr=0 ts=6a3e5add cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=8k6WQxmsAAAA:8 a=e3-4sso9unGw9Dwr07EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260088

ThinkEdge SE70 is a fanless industrial edge gateway built around
NVIDIA Tegra194 Xavier NX SOM. This patch adds a standalone device
tree file describing core carrier board peripherals:
- Custom 40-pin header pinmux configuration
- External SD card slot with dedicated 3.3V fixed regulator

No fan, PWM, tachometer, extra camera/spi peripherals are present
on this passively cooled platform, so unused nodes are explicitly
disabled following mainline device tree best practices.

Static verification passed: dt_binding_check and dtbs compilation
complete without errors.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 129 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index 72c0cb5efa47..736a3f8a923f 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p3509-0000+p3636-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
+dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-lenovo-thinkedge-se70.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0008.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
new file mode 100644
index 000000000000..47b770170507
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra194-p3668-0001.dtsi"
+#include "tegra194-p3509-0000.dtsi"
+
+/ {
+	model = "Lenovo ThinkEdge SE70";
+	compatible = "lenovo,thinkedge-se70", "nvidia,p3509-0000+p3668-0001", "nvidia,tegra194";
+
+	chosen {
+		bootargs = "console=ttyTCU0,115200";
+	};
+
+	/* Fixed 3.3V regulator for external SD card slot */
+	vdd_3v3_sd: regulator-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+		status = "okay";
+	};
+
+	bus@0 {
+
+		/* Custom pinmux configurations for 40-pin expansion header */
+		pinmux@2430000 {
+			status = "okay";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinmux_hdr40>;
+
+			pinmux_hdr40: pinmux-hdr40 {
+				pin7 {
+					nvidia,pins = "aud_mclk_ps4";
+					nvidia,function = "aud";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				};
+				pin11 {
+					nvidia,pins = "uart1_rts_pr4";
+					nvidia,function = "uarta";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				};
+				pin12 {
+					nvidia,pins = "dap5_sclk_pt5";
+					nvidia,function = "i2s5";
+					nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+				pin35 {
+					nvidia,pins = "dap5_fs_pu0";
+					nvidia,function = "i2s5";
+					nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+				pin36 {
+					nvidia,pins = "uart1_cts_pr5";
+					nvidia,function = "uarta";
+					nvidia,pull = <TEGRA_PIN_PULL_UP>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+				pin38 {
+					nvidia,pins = "dap5_din_pt7";
+					nvidia,function = "i2s5";
+					nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				};
+				pin40 {
+					nvidia,pins = "dap5_dout_pt6";
+					nvidia,function = "i2s5";
+					nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				};
+			};
+		};
+
+		/* Configure i2c bus clock to 400kHz for carrier board peripherals */
+		i2c@3160000 {
+			clock-frequency = <400000>;
+			status = "okay";
+		};
+
+		/* SDMMC3 for external user SD card slot with dedicated 3.3V power */
+		mmc@3440000 {
+			bus-width = <4>;
+			cd-gpios = <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+			disable-wp;
+			no-1-8-v;
+			vmmc-supply = <&vdd_3v3_sd>;
+			status = "okay";
+		};
+
+		pwm@c340000 {
+			status = "disabled";
+		};
+		pwm@3280000 {
+			status = "disabled";
+		};
+		pwm@32c0000 {
+			status = "disabled";
+		};
+		pwm@32d0000 {
+			status = "disabled";
+		};
+		pwm@32f0000 {
+			status = "disabled";
+		};
+
+		spi@3270000 {
+			status = "disabled";
+		};
+	};
+
+	/* Disable fan hardware not populated on SE70 carrier board */
+	pwm-fan {
+		status = "disabled";
+	};
+};
-- 
2.43.0

