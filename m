Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7222E34E763;
	Tue, 30 Jun 2026 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811088; cv=none; b=dSk4gXLIzATHLw6ZKHemlYhRTmZdxKi/bdx4cStTSxXYbL2OhgaJ3WygO0UYXqG8MNzDjK9Ny+1ptU3uewaBst5tMaxHfRFLFlpPrRnW1LGweosFQlQ1jNVAdBaoXV9ni4wms3y0b1nl83u5PQtSQKb0LNaWZoY2EH4A8NSnZZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811088; c=relaxed/simple;
	bh=l7COF/vGjLrLRi49AeepwZmf4SpIKeP7WDuU24KWPLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYvPoXzSay/MCyQAoyhQi5F/ogmDBaepkCNN3xluVQL6N9eR2KzhpaMWezMDil5eL0hCgDK8v2TsOwTkwTejXXsVMh46cxH4QFJLWhskqOgaWNchdW+oXCbHRYhQkXqrQP7MkpqIGt5cD+I0/yW7Phy8cnsrAZA5z5QmTvKs/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=2G7UXhOn; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="2G7UXhOn"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5b3Hn3264649;
	Tue, 30 Jun 2026 09:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=mYvy/bUJDg
	VAF6Lx8BaZu3yAZUWvvjEEPJRrywFdFS0=; b=2G7UXhOnkkNsM6DqXzON87RFxd
	OmqUqKClM7o+SVkwjyVTyWD418X/jJf1KsAz30mjyGGpYGwbliWy92/dY+Ick4cd
	f5iTvbFycgf5a56Jt9X96DgJ70pJyGlcjyVgvSJEXeOgyhuvrYemPIHuuUWtzCPj
	sbtuoYBhdm4zrpzUQTdLmqWJo0awmWwFDav07B8FyMcWWMSIC72m/ShTAHFuh1Tw
	jLWWnCn6lYhhR788TxQgakQRgYye8x6ixe6Y9nlMV/yYGCI9sEKs4WT1JoO+6IKn
	Mc4p0Fj51dIv7sS34XYyClFrDmALhAos4T6cGOtuhRaPypqHMWQV7am5HAvg==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f2syev5ww-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:17:47 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4gqHc940lgzltBjS;
	Tue, 30 Jun 2026 09:17:45 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4gqHc86NW2z1Mmx;
	Tue, 30 Jun 2026 09:17:44 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mperttunen@nvidia.com, jonathanh@nvidia.com,
        thierry.reding@gmail.com, mpearson-lenovo@squebb.ca,
        Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
Date: Tue, 30 Jun 2026 17:17:43 +0800
Message-ID: <20260630091743.657388-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630091743.657388-1-lijq9@lenovo.com>
References: <20260630091743.657388-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kWKIA0Z91maaiIu8mmEC9_9y9d2H94gt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfXy7u2ambzasOq
 CZ/Ja5k41RIJ17Dp6Ca/H0LdYIeC8NRFczgERLYlgPnjkWURSQDxO0u72Qa78Qj2nsj23h0DDlK
 fBIWLZn1fR/3Xb8ZbyA/IyGuplfF0tLPc9hhpjAfBRB9iG3lG+Xjd7enPvJDzbUrZv6dO/1hwF7
 OSEAKiUYAR9GEj9MIuSnCR2LbbfjIqNlox3Oo6eyAzd2vBe8vsKtNjwBMHvfgCMeyuGjFluawkU
 RJBj0nT+8CWW0DfaYXHhDISRVXwfbt4q6tXYYTp6kvTLjnbymhPV5Qu2Nsvvj+zzs4rXWoY/6AP
 jYdiK7883YkZQVrvgS5Al73akl42KaDKKZMU80tPjyy+cLuJppLTuuQeYtImX1tZaJQAEFe8gha
 WkrN/TCouADxxjLYLn8KKkcX1jv+xFuepOFd/qG9ZcMyEEtzaKa7t76Kdw5ok8a6FPMnPCphgAe
 tFyVNDtpMTghBA2Azdg==
X-Proofpoint-ORIG-GUID: kWKIA0Z91maaiIu8mmEC9_9y9d2H94gt
X-Authority-Analysis: v=2.4 cv=S8TpBosP c=1 sm=1 tr=0 ts=6a4389bb cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=8k6WQxmsAAAA:8 a=FWZGnvF00TTdqb7X-dAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfXwj6yHud3VlpA
 RdbbLR9l4pzIx+SyOp6apQYjBhH6IzgvMR/fH/NuzLw7TrriVCQrTQTtduGYk9yPRSnfnbtwLoy
 tnz1o2UfuFUwrve90JXmwIlOk1yJWt8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083

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
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 ...ra194-lenovo-thinkedge-se70-baseboard.dtsi | 103 ++++++++++++++++++
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts |  14 +++
 3 files changed, 118 insertions(+)
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
index 000000000000..d0f33384c1f8
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/gpio/tegra194-gpio.h>
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

