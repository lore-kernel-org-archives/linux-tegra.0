Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B773B19D8BC;
	Sun, 28 Jun 2026 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650621; cv=none; b=IjK8W+UrPQ+zpSc8xLrK203KBq59ml7SdxWFZCEUnQAjDyXf7TFFDdvAEF7Xs+htLl4s/Gpj7fw/ja3DUXQLnDEc2x3OSx9cQAU+nC1252ONyY5x9h5inzZC+/quwR+m927hOZKEWWGiAGq/Z7lWH5nvLi92tb0OmQmOBwtY4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650621; c=relaxed/simple;
	bh=MaqOLb48+1zKYnI2Qn6Uaz8eh/LpLgIy6q1Px1MDcmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBUZiEsjZUk+W8qYtA70dSwr7IfLXtA3CLsWTNcUrPhGBeQ7v46WdVocAIinXkejFU9L7mretLvah7/KukIX+m9uvfkhDwrvrpHJqnIjFSEm0hX4RVHsH5co+Hy1MekluWfyo3G1gYHuK2j+6lo8mf+652VaVPJuQ+V3Y0lVb64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=MWr3RYGt; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="MWr3RYGt"
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SBXmfs3103273;
	Sun, 28 Jun 2026 12:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=/VJQAclHYX
	dv8uAR0GArNHRnqBzd5ADBLK3ngpl6KWQ=; b=MWr3RYGtRJy0wMyu5lZ4WK3hmE
	CpmKjE2YB/0DeshPeRpeFIPd8WFfOkedsdhPUINroBOpi63tcfWXU89vnZp4WNdy
	VQ4t7UD1+nIxjTatBZw24vDh51FSe/GmeG9j+i7zUTQNGOmalyQZEAtNymLE6OR6
	obenyy+Man0flapHMpPGtYOPMm8+ur4pOQN4AylUppaqMgZeA6lKfxuj3CNDQ8js
	5VNbXPIv0SSjkrB0Fi20ploRdBayKbbCw0uWNoKUqgo0PR57X3jsWm/eCJJ5HQxR
	lewWMpLXkBuHhdVXDOLgl/ozo5MTGu1ctZj9payJcCq0Ma9jS01d5NpmxjHw==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f2uce89tk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Jun 2026 12:43:21 +0000 (GMT)
Received: from shelppfpol1.lenovo.com (unknown [10.122.146.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gp8By4RpwzDRDtJ;
	Sun, 28 Jun 2026 12:40:26 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol1.lenovo.com (Postfix) with ESMTPS id 4gp8GH3N0DzYlvJs;
	Sun, 28 Jun 2026 12:43:19 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
Date: Sun, 28 Jun 2026 20:43:18 +0800
Message-ID: <20260628124318.627393-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628124318.627393-1-lijq9@lenovo.com>
References: <20260628124318.627393-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ELM2FVZC c=1 sm=1 tr=0 ts=6a4116e9 cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=qMr132F7aASziHDET4f3:22 a=8k6WQxmsAAAA:8 a=GDUbtZeopC1vRXC1kZAA:9
X-Proofpoint-GUID: pUIPH3bn2oq4XZgx6t9sLUHXYfBdYfZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfXy33FwuCKa2r+
 WrT4LhMveK2SfWtWQusX7g7bMKC+FTgrbfcltqwzhiDKEnincJw7397QPzsF7KZGJil0yzOF6Ze
 IyD3q1ywXF7dqQOajKR7YSugiU01zfpn0JUrQyRlEeQwiuxDYntJ1kzcJnUjKwfj7NUmcCN1biJ
 y5tY8zxZCx6ooxEq1PsRlyaVAmMSjfIz8gzVq2J3POiuDohM4wkbYx7FgN+SkvxwPhCTVmzgG5l
 q6Qscmdy/ysmVPJ4BKC2SSvgPJ2tQVehe5/ZsC/1jKYTL8ecT2gMcYs9Ie376/itlP5PlfQnapL
 /0L0dkABOpSLmZ9sQGaSQymV4x6gFegk83IF4VEPifCeOLXBRwMy5xfNlNYD5xWaGqXaZyroSi3
 GTRh9kTaRVfwakYYyTh4p/hbgRPFK2UJES8wQ2hcQOoEHsrW3rKbHKR21K9NxLlgPf8l6wC50aH
 hMxViY/hZuT0e4RtGqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX3twSqv3VsEsF
 UNEBOKtHuvMa6Qx3w+L1OBhbk1Os4AMZPQG1TcKGNyp2KIweBTNxfe05NfzJeVrUqDWjBV9AVX8
 vYb0XBWnRtl1VZVBHoYYB6/fWqcKri8=
X-Proofpoint-ORIG-GUID: pUIPH3bn2oq4XZgx6t9sLUHXYfBdYfZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280111

ThinkEdge SE70 is a fanless industrial edge gateway built around
NVIDIA Tegra194 Xavier NX SOM. This patch adds a standalone device
tree file describing core carrier board peripherals:
- Custom 40-pin header pinmux configuration
- External SD card slot with dedicated 3.3V fixed regulator

Unpopulated PWM and fan peripherals are explicitly disabled
per hardware layout, following mainline device tree best practices.

Static verification passed: dt_binding_check and dtbs compilation
complete without errors.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
Changes in v2:
- Refactor peripheral layout under root bus@0
- Fix regulator label hyphen naming issue
- Drop downstream-only nvidia,lpdr pinmux property
- Fix SD card detect GPIO polarity, remove cd-inverted
Changes in v3:
- Reorganize all pin configurations under native pinmux@2430000 node
- Rename sdhci@3440000 to mmc@3440000 to match upstream node naming
- Move pwm-fan disable override to root level
- Remove redundant disabled overrides for non-existent peripherals
- Drop unused #address-cells / #size-cells properties from regulator wrapper
- Extend root compatible string to triple board+SOM+SoC format
Changes in v4:
- Fix pinctrl subnode naming to satisfy tegra194 pinmux schema regex
- Rework SD 3.3V regulator: remove invalid simple-bus wrapper, align naming
  with official P3668 DTSI and add regulator-boot-on property
- Add required MMC properties: bus-width = <4>, disable-wp, no-1-8-v
- Remove incorrect spi@3270000 disable override, retain QSPI for SOM boot flash
- Correct commit message wording to remove reference to disabled SPI
- Resolve all remaining Sashiko static device tree violations
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 125 ++++++++++++++++++
 2 files changed, 126 insertions(+)
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
index 000000000000..969ea1783bbd
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,125 @@
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
+	};
+
+	/* Disable fan hardware not populated on SE70 carrier board */
+	pwm-fan {
+		status = "disabled";
+	};
+};
-- 
2.43.0

