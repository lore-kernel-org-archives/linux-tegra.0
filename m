Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BAA405C3B;
	Wed,  8 Jul 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502435; cv=none; b=QeXP7oNyrO3gI4DFSDx58+t0hV932yAvjb8DHxyCTFk3y2YFQJwkLm+OHRL4dhvo8IO1JWbYBWAKIJBE20d3CD7umaZqMCpd71drqHceFMyYZopoUhApdsbAycFHbGg232JUjwqAyaCyqMc3FznWENmpZlTLOPn7Vb4aPUFCj3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502435; c=relaxed/simple;
	bh=0nSZRTAZJuo52hzpC5qORlLVSRHx1wrWXzAt79pMrHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuI77VG/Efyp54l4jr9bYwiMyNgL8Vzxry0xwmGFF9NOhnrlWdDLecOQqzf/K4pUId/LE5i6+momX1fr4zoCTZ10qyXQ/dzQvuUWUI2Le/sNIue4nWLIh/iR0hWPjW3kV6fW2xVDeCS+sLOX1xljEozNfzTlSqvI9UPz59h+h+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=sIS9X65i; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="sIS9X65i"
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66888TkP2781480;
	Wed, 8 Jul 2026 09:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=3/4bZz9M0T
	Ty+cPElNd3aueLTo/YXQaXJ9GByL/rK78=; b=sIS9X65icb3lvcqO/5DAyXBYy0
	ek6wfph1GDDvWzIIKUrXg9ZjGnPnT2FspDHZ5znKOerzT95w7dlucrWixfwsW7kg
	RVTdm/U13i62M96w71nN1dumlxr3Y0LfSsK0X8TwnvOH//1tTPP1kRpb2dn4y3nN
	X+doNyjTABu2U/ss+ptB1yd0uyhL2u5HJbtVuB/TqIcWGTeCG46wo8YMTYYIXAd4
	jdeb25nI1Xrl1XywUinD6fd6F/H0TApQPs6Nt8mE/+gyuAc6JygokO38EkJlKkDj
	h8SrWWuD1nS934iskDwMfzmIZ33c5kFfcme/9gyoregiqdfvkuxLS1WooKMQ==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by m0355090.ppops.net (PPS) with ESMTPS id 4f7dgsxgna-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:20:21 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4gwCHQ60TPz9vBT2;
	Wed,  8 Jul 2026 09:20:18 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gwCHQ4sGHz18W7cL;
	Wed,  8 Jul 2026 09:20:18 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org, mperttunen@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH v4 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
Date: Wed,  8 Jul 2026 17:20:17 +0800
Message-ID: <20260708092017.745545-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708092017.745545-1-lijq9@lenovo.com>
References: <20260708092017.745545-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RnkXPFOmXoLRPreqe2FLNTxNRExcatfA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfX6zYvUiNgE2jf
 ioUBPvZRrHsDNgzsUbeDbfj+yWJE9S7+ldVms5LBLt6jvNlsbrcRt76Yz57ntALNmHSrG+TZMgW
 tulehiifdFTtNOMh+p2aUlM9GxjVJw8=
X-Proofpoint-GUID: RnkXPFOmXoLRPreqe2FLNTxNRExcatfA
X-Authority-Analysis: v=2.4 cv=POw/P/qC c=1 sm=1 tr=0 ts=6a4e1655 cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ZyEuT479hi48zPIlagN0:22 a=8k6WQxmsAAAA:8 a=FWZGnvF00TTdqb7X-dAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfX1iAVq6nuGRoq
 g81gAZrbdacFsg8I2/955pOJA3uR6/DvXcGo7o5rXyAG7ru74Vc7HGoJ4JOjCJ8cPdD8FuXnEwY
 xdd7KMvGnRQ+gkImg8HDr5rk7T3ViuEKEfWUbt3ppgGN16fxGX12kEN/RvEcaZqsB1+WHu9UYY0
 mz6kFoh+wuAQm6T7LS5urLfqGBn5u2hh/LtolJaQrzlWVVb2X1hD9wt01q8dtDDGUeYDaJORSBI
 Oc7DktYqGEqOxY/W5SM7xvcmY2H5DxfN1Ia3xtmAcCK+90cZnOfueDZTF7CCjat0TULlGPPlVrK
 pGG3KUx3gkA3bKCgvlUbl8kX64XGxSL5lOUWGv7/ilvmCf+fa9mrgmzpNFFOQNa4bnJKXnrVxg8
 rRvGJmUIdWV20wLjWCpedJ8di9OnYIIh3iA7Wl1nU4GUdNndmiCrTF6pCmK58Mf4vbcOEnjX1TR
 A5NhwS83pevBS6vQXWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080089

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
Changes in v2:
- Remove unused input-related headers from baseboard DTSI

Changes in v3:
- Merge baseboard content into main DTS, drop separate baseboard DTSI
- Use stdout-path instead of bootargs in chosen node

Changes in v4:
- Rename regulator node from regulator-sd-3v3 to regulator-vdd-3v3-sd
  to follow the naming convention (requested by Mikko).
- Move regulator nodes to the bottom of the file and order
  alphabetically.
- Keep vdd_5v0_sys as it is referenced by USB and PMIC nodes in the
  SoC and SOM layers (required for compilation).
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
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
index 000000000000..02ac645a7784
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra194-p3668-0001.dtsi"
+
+#include <dt-bindings/gpio/tegra194-gpio.h>
+
+/ {
+	model = "Lenovo ThinkEdge SE70";
+	compatible = "lenovo,thinkedge-se70", "nvidia,p3668-0001", "nvidia,tegra194";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
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
+		/* SDMMC3: External Micro SD card slot */
+		mmc@3440000 {
+			bus-width = <4>;
+			cd-gpios = <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_LOW>;
+			disable-wp;
+			no-1-8-v;
+			vmmc-supply = <&vdd_3v3_sd>;
+			status = "okay";
+		};
+	};
+
+	/* Fixed 3.3V power supply regulator for external Micro SD slot */
+	vdd_3v3_sd: regulator-vdd-3v3-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
+	/* System 5V main supply, referenced by SOM and USB nodes */
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
-- 
2.43.0

