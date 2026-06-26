Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D91423507C;
	Fri, 26 Jun 2026 03:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444869; cv=none; b=NfK07g8kV672Qw/0/K9Wp2ptq3nhOhoagjkHmoLc2y03c+SRaKY5lhz/lllMQgINnPk3SYaMjrLsxvCcAnKjO3HALGoBX4FN8lBt9ordzgSn6ZtnILBEQQ0zYUDTrCk60lsDvur0MOvvj5+JOidM6zQjGLyL3SX+wz3vMoQAIuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444869; c=relaxed/simple;
	bh=oVr/cnvItBKfEhXP/wRUz+ugU0zTkDHTPxaA12yfIcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYCSBex+xmFYZcjdLC8EOQTmYsYQdB4SYmFfhpFIp/tnWnW+5x0m2yYXlT+FtA5zodBnt/kgulfCC03NjB9LmRj+u/2FFvFqWci0glkez3TQg9Cvzl/dz9pZkm0rM3X8R1zOcqAV5hVDBoGPfb/s384gUz2QLyzxL6LWryKWmLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=1krTtczw; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="1krTtczw"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2lhef2616747;
	Fri, 26 Jun 2026 03:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=+cnD7YBqJ1
	mKEj+mZNwAa/6nGvHw16yp69nwDBAgMwk=; b=1krTtczwm1Y5LFSXTS5RgKNwyX
	hqMxAnVsjVK8Kknts8lElmJTQdDLo4wUZ2JbMO35JuLEXO3eqaMoDL1AzNBFFnS0
	mdvqNC906JmIfbMgek6Z9dDCqPUfbnFub/z+hZV8zXSWM3b0vzD2fN+KSWtJwQ33
	X9fGr12FR5R/NjgbRi7UqBo+UIHZo7O3eyk3P1nfCMuJXrn969O2myOsBH0/o4am
	Ep48vol/BL6vYDYFdBq8XJ6INs+hydEz8C+p2R5rJ5w4FI/IqdpLr41Q473bF698
	PSEI0eHArtM0Fs3ttCU9d0vYFFz7K0m6WkLeLAqUq9k+a1t6Xe6DdXO3ol5Q==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4ex8mhat88-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 03:34:21 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4gmh984T8jz1yfcld;
	Fri, 26 Jun 2026 03:33:48 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4gmh9l2B8Fz18W7cK;
	Fri, 26 Jun 2026 03:34:19 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
Date: Fri, 26 Jun 2026 11:34:18 +0800
Message-ID: <20260626033418.520762-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626033418.520762-1-lijq9@lenovo.com>
References: <20260626033418.520762-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dorL5rusRPLQLjOLtar9qd8gJ8CE3_yo
X-Authority-Analysis: v=2.4 cv=LbMMLDfi c=1 sm=1 tr=0 ts=6a3df33d cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=8k6WQxmsAAAA:8 a=Irnq0EDEiJR7ZwE52FUA:9
X-Proofpoint-ORIG-GUID: dorL5rusRPLQLjOLtar9qd8gJ8CE3_yo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAyNCBTYWx0ZWRfX/LQNlsJIMGCS
 XEIx75Ud1Y9dWho2IXc94Piau8gfg7Zd05T5LvgYhXmIeGUWIEO0OafV1QLrwsrz+JnJ3rjCVeB
 K4ytpOOKlBkaB1gPr0oWR7tJcQReUBEU5ChD9eO93KqoUNFUwNWZWx+M4rcR7p93U8fdIabRBZT
 0LO/seA98pGV7jos7MtlsWXQaZpKw82rt5iVcz3Pqo9H3twtq5ROcGOxyl01Fr+jvfrzb5i4M3Y
 Un/fgqsWapIRIT3Xu5mM8R7B3adQQ6xLS75R2YGvF8OGz+NTjfTlSVbSZv0/ydEmvU00GchNHid
 BspouGW6mqTdCD3EpiCZFaa+NSyqcTYKfbn0SC8Ndjh0Hfe31W1gVsFzzD0mq6/Qi+3YoNigU8m
 UMAKUTIKS9aswoJeTLi99Gox3oyvS8zbvmzwglT0ghuNwpF1vU/+B75mVGeF78v2gQtTMSemOvJ
 pXkWVTiWVpb9F18qYLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAyNCBTYWx0ZWRfX0AK2L3n73nQ1
 TVXiXrRfRTQI7UIVt+QFeEq+Mb5m4rrIYzJ3rByO0+imO76Mf3MzjWpf6yyuGO66hhRfVuOropi
 X2ekyFHZdoeqdSdkn+6gXQy4AkFjHXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260024

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
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
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
index 000000000000..d44eb7c9b474
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra194-p3668-0001.dtsi"
+#include "tegra194-p3509-0000.dtsi"
+
+/ {
+	model = "Lenovo ThinkEdge SE70";
+	compatible = "lenovo,thinkedge-se70", "nvidia,tegra194";
+
+	chosen {
+		bootargs = "console=ttyTCU0,115200";
+	};
+
+	/* Fixed 3.3V regulator for external SD card slot */
+	fixed-regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ap2306gn_3v3_sd: ap2306gn-3v3-sd {
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
+	bus@0 {
+
+		/* Custom pinmux configurations for 40-pin expansion header */
+		pinmux@c302000 {
+			status = "okay";
+			touch-clk-pcc4 {
+				nvidia,pins = "touch_clk_pcc4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+		};
+
+		pinmux@2430028 {
+			status = "okay";
+			soc-gpio41-pq5 {
+				nvidia,pins = "soc_gpio41_pq5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+		};
+
+		pinmux@2430000 {
+			status = "okay";
+			pinctrl-names = "default";
+			pinctrl-0 = <&hdr40_pinmux>;
+
+			hdr40_pinmux: header-40pin-pinmux {
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
+		sdhci@3440000 {
+			vmmc-supply = <&ap2306gn_3v3_sd>;
+			cd-gpios = <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+			status = "okay";
+		};
+
+		/* Disable fan and tachometer hardware not populated on SE70 carrier board */
+		pwm-fan {
+			status = "disabled";
+		};
+		thermal-fan-est {
+			status = "disabled";
+		};
+		tachometer@39c0000 {
+			status = "disabled";
+		};
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
+		generic-pwm-tachometer {
+			status = "disabled";
+		};
+
+		/* Disable unused SPI interfaces on 40-pin header */
+		spi@3210000 {
+			status = "disabled";
+		};
+		spi@3230000 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.43.0

