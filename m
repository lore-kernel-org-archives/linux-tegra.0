Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130EF22173D;
	Fri, 31 Jul 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491420; cv=none; b=ijXT4EhwMFy3SAzB9p4b/kZlPnLjEemn68gYgBzGjP0x3yP0p208x+5nKJBIfPOzxX5NZTU3QLwcIJrMG69mNgnTTCVvj5RawZX2hmIzY3Pb39FUY+K0zJ4PwBiaC/PRBid2s9ZxFyixao1zlL1j+IrvamB9ojkYwLop6c6gRZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491420; c=relaxed/simple;
	bh=6EyzJ8zy3AVmMkhRy9MOlYViqLWf55x8hSqex+aqzOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbzEGmmQrVAJ9UxBwJFQVDxGISLYss/PzIPAIMuV+3jCqMIyNIyM2LRQqVHaM0C8F6gJodl8p2YB7DOtgHkotW70jAND0lm1vzjAYZr8TL+uWL5pnyq71H6TrK+zVyhteCWUXI1Q3GvCzJXqtoGpgMZShopusV2vYvu975RYJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=RD8eBQED; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="RD8eBQED"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7upuP1666866;
	Fri, 31 Jul 2026 09:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=//Y7SHhhku
	PaU4PjlWGojQB4cFxafkMJtrkc0hdkJXQ=; b=RD8eBQEDJwjEMDCa6rgFBhOiSx
	G9liSapHxvrr8CLrSFHhx8sSD1gbxqKCqoIypLZHkUD4+AppdRKB4cErpBHcXq7O
	jgYCHqxsChuu4/eSbRDWQYgjEtGGUe8sLE36Ht/jfhc7ClLOg9rPhHJ+iTBDBtOC
	DmPhkG9LR48LgPzAf2+pu9JEt/ZlLkA6j+70hPhzgKtXFR4zHbY8O2gKiFmLmDHF
	T4IhhziZFunXoLhUTKRfuqXPlZ1tWPYFA+nGL+ltAmxa0/i2V6s51a+w0oNVAHNR
	8MrjQgaKvC3QxuajIFLCIYr6EMQSObSQhPBpL1qm6d2964ofbn3aQH33Muiw==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fnawgd16w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 09:50:12 +0000 (GMT)
Received: from hetlppfpool1.lenovo.com (unknown [10.196.132.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4hBLsH2J4czltBB9;
	Fri, 31 Jul 2026 09:50:11 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool1.lenovo.com (Postfix) with ESMTPS id 4hBLsG4ks0z1wCKkd;
	Fri, 31 Jul 2026 09:50:10 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org, mperttunen@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH v5 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
Date: Fri, 31 Jul 2026 17:50:09 +0800
Message-ID: <20260731095009.959666-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731095009.959666-1-lijq9@lenovo.com>
References: <20260731095009.959666-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3MiBTYWx0ZWRfX0ok8uwZG68EX
 CPuoSPD7KppqlWb1FvsB0QlzOJAhKevsuk9K9iaPG67g5EwToNKOLkIB9gFw0s7DV5IrMvxmE0B
 EEkl51kLg8GNHFLGXu9egPgoz5fdJOw=
X-Proofpoint-ORIG-GUID: uYo_uL8s3hMHwSit8sYSAm-QZgGYYd8z
X-Authority-Analysis: v=2.4 cv=X/Ni7mTe c=1 sm=1 tr=0 ts=6a6c6fd4 cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=Ikd4Dj_1AAAA:8 a=8k6WQxmsAAAA:8
 a=1FXtSDDFD8n027cyvlcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3MiBTYWx0ZWRfX8lkK2U2Dh0VW
 DXy2ldGQVe88OR/7D5KOvTA/E91APQIldWbkOIf6xiP4mnQvRV2MZ5VLTqZF40DZIdAMGruwUyJ
 Qqb5PuCSztFy+iHZXJlHDwkAGzWvFfqnZjZx4+A5SXjsBuK/ZnkUb7REDxyDdYHyThcZlyqjVAr
 c90ScFYArX9mGuMMPUyiISy9b+zEVKIW3fNuz0ylnVI9v0PcTCDY3kmv/L/vshsTkGSIEg/Rh/e
 rqMZkM+TPEpcFO1TwmcgZTDHfR0TvMNfr+RzacdgCOjeRl8afdX2dgjl2aSAqjX/EnZFhNTeMb7
 QpYPbivi5IJhLgxsEAmgT2XhqCkvVecyu6QwjpFWwqslkSfiPbgZB9lMdDPMHCzglKQfZxn/+yl
 hh1LIFsO9TF8fZ85ORavPN1x4KP1RdBhJ3JkPbuC/tJvANxhCTCfI7TaPTT0f9QDqJKKBkh3WPt
 r8O4UUwwXszQ7htg9eQ==
X-Proofpoint-GUID: uYo_uL8s3hMHwSit8sYSAm-QZgGYYd8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310072

Add initial device tree support for the Lenovo ThinkEdge SE70, an
industrial edge gateway based on the NVIDIA Jetson Xavier NX module
(P3668-0001) with a custom carrier board.

This initial submission includes:
- 40-pin expansion header pinmux configuration
- External Micro SD card slot with dedicated 3.3V regulator
- I2C bus for 40-pin header

Static verification passed: dt_binding_check and dtbs compilation
complete without errors.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

Changes in v5:
- Remove redundant chosen node (already defined in P3668 DTSI)
- Remove redundant status="okay" from pinmux and i2c nodes
- Add mmc1 alias for external SD card slot
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
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
index 000000000000..185ec60d85c1
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,111 @@
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
+	aliases {
+		mmc1 = "/bus@0/mmc@3440000";
+	};
+
+	bus@0 {
+		/* 40-pin expansion header custom pinmux configuration */
+		pinmux@2430000 {
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

