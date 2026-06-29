Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF53B9927;
	Mon, 29 Jun 2026 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731475; cv=none; b=mJQf2WXbt4mTttU9X9d3VHOOY9uk42P1kkGi10zgxPB5rb+V3Xbklxh5/CZq7uKQmdBdj0OsqVIVz0Bw0cb+9fq2EBtYtbdoJwPv9I1UO81+Mzt7Rd1mR+MiNtD9DtruNsFpfRMwU81kHgCMGII1z8r2O1boyEXOd4O8/W8PrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731475; c=relaxed/simple;
	bh=3ohkvSx4r2+CcyERmEiTQv0nKAFcYO6NLfEBh++tNeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsWegYKPLdqd3ASlzTFkHciYNH23hum1RuhTRFAdxtLnS7QcF8Q/0yxkuTTOiYVaDUA40aKZIeRYjLALo3aV3RoiTdlhwHE1xAWAizoluI/bn3c7FJrW5Arfg8nYnMEFNXRzYrCUQ+aZD0hYUQIvgENUDKv+w+z6Ubp+Qq0GXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=eFvyE581; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="eFvyE581"
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASR501238107;
	Mon, 29 Jun 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=vPYCjDLvSs
	s/vvfAFv5DCnIBJdWEepkMEL8pGUZF5kI=; b=eFvyE581/tdSrcKqgQ5vcLueCr
	cdUzlqPoUX4tprmAiU7h0CXhm5OhmbBZH49vVDsl96/2H/v6iTTYET2T21OY5HY4
	s4ildRH3NvgyI4oasQxidjQhqk1mtPlopyJkQpsRoTueEeTaI4MrWNEIaVBtJhGR
	AOMvC9b3mj+Gtxj0yxirYPRrNI+Cv86sWrPcsgntc32p/CMVJscalb0/Qz2sd9rk
	eY1KcQROVO0Xy6Mc0zZsRQkP/yTiHS7SZoE4Kh4Dc0Vjd3kpuX/GBvORStbzfayF
	59eOGfTcE7ea+0p/HHKvDdYfdQsRs9B2wvl7tBB8XV+Au9spVZ2gnc4t5ugQ==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4f2u2khu7g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 11:11:07 +0000 (GMT)
Received: from hetlppfpool1.lenovo.com (unknown [10.196.132.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4gpk9P3chnz9vVts;
	Mon, 29 Jun 2026 11:11:05 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool1.lenovo.com (Postfix) with ESMTPS id 4gpk9P29pWz1wCKk9;
	Mon, 29 Jun 2026 11:11:05 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
Date: Mon, 29 Jun 2026 19:11:04 +0800
Message-ID: <20260629111104.645771-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629111104.645771-1-lijq9@lenovo.com>
References: <20260629111104.645771-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX65g6uUHnCsHO
 sbfr60dAU6UIVPtuW6Ljg24NHVdWbRusJxwLiitfWlsYtGed3X6///tSZAKnwVPrylkZmFLGtKX
 VK+6/saqwBY9qimsejrmzw0D7QC77w2BQWGV07abJ8FaGEnI7kAqZDn1eBCY98kIlBXp+v01ww0
 hNU7ZvNUnYrfCMGwK7pxpxXkTbDKKE2Wa7e+59xa4+2gXu7lDISnVRferlgq/3/dul9Bzd1ehxY
 31ORgMY6yXH+zy4WHN6IrXn65uoBGDYX+Cv3MYMi6a6CAoFSlX+uVaBtHZ/OHE0ygAzG2jW2IQM
 5sxDNUvX0TjzlbOt3Rpth+EW9r6p/JiIIYNws/XwqkD0r/yaDtGa2wmxyEOmn3ggJ46kx0+0QGz
 w48XuTYo3ZcqhU9NDzyT0oEGOXOmEDSAYF4Ri/lczH9iMyEk/pFlLMWURd7yXGYbNlRHAnOsvxk
 b8ssm3MjUJOvFQFTXTA==
X-Proofpoint-GUID: I_fmVmLRJIIOy3MmSpmOSKyOpl7FiiQ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX1Q4UkN+NQ1f5
 svc5XrfcxjbnZlg3le62WAVnCOUE58SnHcLQCNOmw6CxHN0j9E2l9I73ilB2R+EUuV8vVm2IhIW
 XhvPu2AKtVc/Fmzid2esKSrPlOjWIUA=
X-Authority-Analysis: v=2.4 cv=K6wS2SWI c=1 sm=1 tr=0 ts=6a4252cc cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=j7ft8fR0phhCBGdaz6r4:22 a=8k6WQxmsAAAA:8 a=FWZGnvF00TTdqb7X-dAA:9
X-Proofpoint-ORIG-GUID: I_fmVmLRJIIOy3MmSpmOSKyOpl7FiiQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290091

Add initial device tree support for the Lenovo ThinkEdge SE70, an
industrial edge gateway based on the NVIDIA Jetson Xavier NX module
(P3668-0001) with a custom carrier board.

This initial submission includes:
- 40-pin expansion header pinmux configuration
- External Micro SD card slot with dedicated 3.3V regulator
- I2C bus for 40-pin header

Static verification passed: dt_binding_check and dtbs compilation
complete without errors.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 ...ra194-lenovo-thinkedge-se70-baseboard.dtsi | 106 ++++++++++++++++++
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts |  14 +++
 3 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi
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
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi
new file mode 100644
index 000000000000..b88388d15229
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/gpio/tegra194-gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/* Fixed 3.3V power supply regulator for external Micro SD slot */
+	vdd_3v3_sd: regulator-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
+	bus@0 {
+		/* 40-pin expansion header custom pinmux configuration */
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
+
+		/* SDMMC3: External Micro SD card slot */
+		mmc@3440000 {
+			bus-width = <4>;
+			cd-gpios = <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_LOW>;
+			disable-wp;
+			no-1-8-v;
+			vmmc-supply = <&vdd_3v3_sd>;
+			status = "okay";
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
new file mode 100644
index 000000000000..a8de685f05ef
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra194-p3668-0001.dtsi"
+#include "tegra194-lenovo-thinkedge-se70-baseboard.dtsi"
+
+/ {
+	model = "Lenovo ThinkEdge SE70";
+	compatible = "lenovo,thinkedge-se70", "nvidia,p3668-0001", "nvidia,tegra194";
+
+	chosen {
+		bootargs = "console=ttyTCU0,115200";
+	};
+};
-- 
2.43.0

