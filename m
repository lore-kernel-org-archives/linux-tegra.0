Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0DC3BBA1A;
	Fri, 26 Jun 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465241; cv=none; b=dpWi4BxS0N1OnfuuLoCxhpfE/1r1wyFTBmFnIl9DMuPQFqUVBh8wXcrhotorB9qSszLUN6w194sV1dh895iWuRhMLoqHr6KCd4ATjvohGna1b2AJ4zK7CqfiOTVincn+QZDdxGT3yNZTVyhjo8OKG22oFflrWoxo/5DEqznJClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465241; c=relaxed/simple;
	bh=cOCsfBT78xhG3fRxZmukicNrxlZSmKoWTQRGDf0G/MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECnhgnnR5wrAEvhdsBdsw/1hsz0Ow9rjV9KXyOxOvdraZD4/RMVR+iNQjNY392rreaI/ehxSUnLbFkUS3AhbBrETSCdMMSEfy1qL4MG7r5w2YZjxyO/qbtaptCGbh8pvKKcKlAM85Pqn2c8y3e3bKrpfj3EK0n0r3g47aHV1Gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=FJWHUZlZ; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="FJWHUZlZ"
Received: from pps.filterd (m0355092.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6Swr13458129;
	Fri, 26 Jun 2026 09:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=tz/cw+b/G0
	c9ABcmoPa/b048iyxpHB2exivshQ8ngB4=; b=FJWHUZlZUPicSjdw7m3D7uPZO8
	B67th0A0x/Co2Je0MWGBY8EQp4RfKQ+k2i6tRqhQRbYgawWTkW4loJ9CLWIy+BS2
	Y5ak1jagNtKRCfzNZJuEOvkBHpNAvYFeirJDoxgNpBmgllhEp6RUDE1KxYwuEJZp
	WzZ46NlZ2wCfQL1Q02yJX/w4GPInFcXvZwY2/7Q2ZNim3pPhWeSgRPXDDfzWVEQV
	WD/iGilKJwdWSy09JGh4DR6ZTXzet2VgktGMCVjl96POl8rj0dUx2EDMnghJop36
	OeDosrqJXJR9nf4Tm0WTTe2PrIoKoQPzSViGKaAFYVd+Y6IInW2Y+dpXWwAQ==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4ex96ek7fs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 09:13:53 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4gmqjW52bYzltBBw;
	Fri, 26 Jun 2026 09:13:51 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4gmqjW0Xj9zhZ;
	Fri, 26 Jun 2026 09:13:51 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
Date: Fri, 26 Jun 2026 17:13:49 +0800
Message-ID: <20260626091349.570091-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626091349.570091-1-lijq9@lenovo.com>
References: <20260626091349.570091-1-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MyBTYWx0ZWRfX4yEafK7ndQHQ
 aO+35j4+AuWIYv5cUoLIwFx4raok32No2/LEfIU2j91e+dxGqHb1OQFR7saiH0bAcaCuz9vA2nv
 aY9ufbU8OedPEBNDIVW7/kB8pm/+oVE=
X-Proofpoint-ORIG-GUID: NSINOSvFFuAwlp4bLgRQ4WoidJzyu1i3
X-Authority-Analysis: v=2.4 cv=S7fpBosP c=1 sm=1 tr=0 ts=6a3e42d1 cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=rq6KeYSQr_4CDViOXtGD:22 a=8k6WQxmsAAAA:8 a=e3-4sso9unGw9Dwr07EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MyBTYWx0ZWRfX8yqffQrmmb+a
 p00YzdcFC42y2GugXyJX5cXJss5pb/PVTppZvw+JACEJcXOWkpqZ9ZagMuo0oB6pDLYSdCE7wOG
 L+z8Ij7G6eHyVEsE6VnC19A1FqT0kyhyNWCo1j7EJcCww4eAvZLrAZaMMZs3p/xHb0g9LU5ekKA
 Z1Ap0v5H85UG+gFOEMJsGHJlR8pIwtEweGkkm9PUjE4CN3WpILn5ZW7xI4kfCZm3FT5yAHdHoOc
 FEJy5ZgoBFbFNB0d/9XECXCx0iwT49D9Dg5XxgH8RnS4bwJQ/oKvui38s5OjLpXtESYsKsz927T
 s2/ugYDZgKmdk2iGsZbcfn5b79cvtBt6N/kNvHAGgE9OQ6WQ55zs2R5OK2y3xoqQPaW9SR1XrBv
 rFi5sp7poIwW3k2HadwIF4vZkTdOAm1ItSPvCGz9dvwWGmtyRzSpdbqOclRBIgDi3eygRiGJdYS
 AUgLW/5hkpHYwZ3KUlA==
X-Proofpoint-GUID: NSINOSvFFuAwlp4bLgRQ4WoidJzyu1i3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260073

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
 .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 124 ++++++++++++++++++
 2 files changed, 125 insertions(+)
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
index 000000000000..44a7ae9a05bf
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
@@ -0,0 +1,124 @@
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
+	fixed-regulators {
+		compatible = "simple-bus";
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
+		mmc@3440000 {
+			vmmc-supply = <&ap2306gn_3v3_sd>;
+			cd-gpios = <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
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

