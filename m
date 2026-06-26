Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5826158C;
	Fri, 26 Jun 2026 01:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436215; cv=none; b=QNCoGVhfMyY7/PBbcauPapVKwuvcKubkYkcpxYlbG3Km/8XmiUPclHULhhgAAQyj2Zp2L80JZX/dUcqS3J/0tQpwQvQVkW4F6+lAIpGj8eE5SgSppSyJkPc/YsjhQw8XxZgiRqF8Z2JOnzSgAjGkOkSZJQhZwa9S5pUsdQnNsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436215; c=relaxed/simple;
	bh=da5GPsIdftlKdtk4reWwxLn3VuMo7ImPqfTB2eCzYpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXXX+S79vR4AFtT5jR5ywFJnKRUyAr/Ie9W8G8eEhXBkuN4II5ISHGN32Z2iUDiywdq9lu7xneCLmWexu3le+1n+U42JIJcNmGHyUR1w1Bim3/vx85AzZmwPo4H78wCICc8fTZq5GDaS4mJ3MnoFW/GZ9zox8rxrYTVIaG4pmFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=G2nkgsN/; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="G2nkgsN/"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PMYKgZ2186202;
	Fri, 26 Jun 2026 01:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=ord9PmGtRn
	a1a778MEynuU6M0BiU4pN42GPSmzKnDYo=; b=G2nkgsN//0S+9pV+LPcogIR26M
	MMgw8cm1P8CpvQbIsch24w1fKLLmGkYdjUn80N17ExIFX2i0qjIoeRXR65C9uJM9
	is88sUr5/YcoTUFtRsql+rGduCUb8v90hNt5m8BYchQHMicIEgyJ210K1ycZI2kj
	SP2nCQYjszYku8RJAzmgD5v57xeDlcTvzcFeKU0V+GWKn1zgFuGUIjO7XW/MoDLW
	4gEv8CcsFlNnXfuEjBjkWFcniPBRYu9FGvi8AW3fhE6vwuGJeUTOMCugIr7WPSdl
	ooiF8Okr/EPNUJqLHghaP54ffJnaDiBDApV3dq6wxQkhNOZsBQAzxeKX876Q==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4ex8mham5b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 01:09:54 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4gmcvk6XlYzDRDt2;
	Fri, 26 Jun 2026 01:06:58 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gmcz35HLLz18W90N;
	Fri, 26 Jun 2026 01:09:51 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
Date: Fri, 26 Jun 2026 09:09:50 +0800
Message-ID: <20260626010950.459899-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626010950.459899-1-lijq9@lenovo.com>
References: <20260626010950.459899-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U-_WUhlB44oVMw3ad7m-onLuNIHXAtSu
X-Authority-Analysis: v=2.4 cv=LbMMLDfi c=1 sm=1 tr=0 ts=6a3dd162 cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=8k6WQxmsAAAA:8 a=bFGgLEeuC7ymnU_s7ckA:9
X-Proofpoint-ORIG-GUID: U-_WUhlB44oVMw3ad7m-onLuNIHXAtSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAwNiBTYWx0ZWRfXzlzVwXNVbPTX
 a+ssiICo2w77aCTYr2NsXn9AFqJdKDEDxQEDqOHo7ZhlqNX9yf0kJm0o9qw7jfg3HdvCsyO5pse
 EfygT5hge9N9fwbiQoRX42gGkiMwTXILW6yL6u6CPodaISbTl6IK1g1xZfdXCt5Ezl2rZ9f+1ld
 dA+gxOKt0PwOQ57nWQ9LtTZUsKDaaC6mNu+GgwNbBBFhkLqi/ZuKGYyOO0NyHaanTVGgywgLwzs
 Yrvra0fn9PZLm6jG9NVIRbNGACSs+Xrj8BSofLohCvEWv4AWIdx2IZwcb+TBSvjZKPBdEXpJMtZ
 8JYkhtzvhaibJC0oleC+xVgYSDi7CL4IvdVoBeMrOQL4ShI1mRoBDnZRQgJAKv+UjxUZKeO3uu2
 /+WExDy3k6YgWj5L6nNDHfEt+QvJeb5jcbvlZrftOmpWXVT8bl7PBXETB3JqR1ELQcKrc7zuL0A
 fMlJeJ6DstPw46OseUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAwNiBTYWx0ZWRfX+85IMyjMIKZW
 juO+DQ/aQ3eFe0HA+uX5Li+2+EE82tq8g9frp/ZGsA8NMlW6bHGM1xL7l98oqOvSrgmMAnAb5Vn
 UfqfN70T99mkwR13k92jj0Lc2GYqUwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260006

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
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 167 ++++++++++++++++++
 2 files changed, 168 insertions(+)
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
index 000000000000..075e057c9095
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,167 @@
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
+	/* Fixed 2.3V regulator for external SD card slot */
+	fixed-regulators {
+		ap2306gn_3v3_sd: ap2306gn_3v3_sd {
+			compatible = "regulator-fixed";
+			regulator-name = "ap2306gn-3v3-sd";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			status = "okay";
+		};
+	};
+
+	/* Custom pinmux configurations for 40-pin expansion header */
+	pinmux@c302000 {
+		status = "okay";
+		touch_clk_pcc4 {
+			nvidia,pins = "touch_clk_pcc4";
+			nvidia,function = "rsvd2";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lpdr = <TEGRA_PIN_DISABLE>;
+		};
+	};
+
+	pinmux@2430028 {
+		status = "okay";
+		soc_gpio41_pq5 {
+			nvidia,pins = "soc_gpio41_pq5";
+			nvidia,function = "rsvd2";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			nvidia,lpdr = <TEGRA_PIN_DISABLE>;
+			nvidia,io-high-voltage = <TEGRA_PIN_DISABLE>;
+		};
+	};
+
+	pinmux@2430000 {
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdr40_pinmux>;
+
+		hdr40_pinmux: header-40pin-pinmux {
+			pin7 {
+				nvidia,pins = "aud_mclk_ps4";
+				nvidia,function = "aud";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pin11 {
+				nvidia,pins = "uart1_rts_pr4";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,lpdr = <0x0>;
+			};
+			pin12 {
+				nvidia,pins = "dap5_sclk_pt5";
+				nvidia,function = "i2s5";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pin35 {
+				nvidia,pins = "dap5_fs_pu0";
+				nvidia,function = "i2s5";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pin36 {
+				nvidia,pins = "uart1_cts_pr5";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,lpdr = <0x0>;
+			};
+			pin38 {
+				nvidia,pins = "dap5_din_pt7";
+				nvidia,function = "i2s5";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pin40 {
+				nvidia,pins = "dap5_dout_pt6";
+				nvidia,function = "i2s5";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+		};
+	};
+
+	/* Configure i2c bus clock to 400kHz for carrier board peripherals */
+	i2c@3160000 {
+		clock-frequency = <400000>;
+		status = "okay";
+	};
+
+	/* SDMMC3 for external user SD card slot with dedicated 3.3V power */
+	sdhci@3440000 {
+		uhs-mask = <0x78>;
+		mmc-ocr-mask = <0x0>;
+		cd-inverted;
+		cd-gpios = <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_LOW>;
+		nvidia,cd-wakeup-capable;
+		vmmc-supply = <&ap2306gn_3v3_sd>;
+		status = "okay";
+	};
+
+	/* Disable fan and tachometer hardware not populated on SE70 carrier board */
+	pwm-fan {
+		status = "disabled";
+	};
+	thermal-fan-est {
+		status = "disabled";
+	};
+	tachometer@39c0000 {
+		status = "disabled";
+	};
+	pwm@c340000 {
+		status = "disabled";
+	};
+	pwm@3280000 {
+		status = "disabled";
+	};
+	pwm@32c0000 {
+		status = "disabled";
+	};
+	pwm@32d0000 {
+		status = "disabled";
+	};
+	pwm@32f0000 {
+		status = "disabled";
+	};
+	generic_pwm_tachometer {
+		status = "disabled";
+	};
+
+	/* Disable unused SPI interfaces on 40-pin header */
+	spi@3210000 {
+		status = "disabled";
+	};
+	spi@3230000 {
+		status = "disabled";
+	};
+};
-- 
2.43.0

