Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0EC179956;
	Tue, 10 Sep 2024 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995173; cv=fail; b=Y4FkLcPD24MCe7ujvP347ViAOWhSoumiE/mAB/pf4XmsP9CySWsnFcluo1n635A6+44FYJ6mNeOH0ur0qpYZ2h64iMQwOBR1Ezf/6tKbFW24pZkKBGFI5ErVI5L1R+P63vO7Jqv1hMSYUg40Czeiwx61eynxI4NKKZgB5I38w9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995173; c=relaxed/simple;
	bh=reaVtMNc6eroKkQUZBplZb8dvX0TezJ8Hgt39U+W6v8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FS4JcP0Hkh/2kPiE9OvYMrEy4hMy6iCExQfa2nuJTNTM0WEjOpJVu6RuvorPcWujjGWCMSxuUBnYJwO/bGuMVHo/ztighre3hXZh8duJDW7i48t2/PSfisIhRtGM+aW8iAWFRpZoqWOwumQOT2y8i3t/MEoYJar/c4UfWjdGsvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g9L1+2EZ; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g9L1+2EZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsvArCrw7ItkN7tmbkNFVf038PHXbvtH/yVHtEikwifL4ZJLenivO3zuaxLrrq9YS2MM1nRp78dFTDYQiH917VbXVAXHhht7Vkk42u6JYKxdkUIseI68az8hlyg7zJ4oz1yLVCyxMcq+uftU+KtGUWRVvGAZNFnkuDDDJ0XrxZT0YYtpiKcwci6tAhnlMJfC9z31oxHNm4p7TX0ngf47yDHkPxo7St8VIHyHXz3AYbQKs5uWQP7L/0DvRoRgo9Nbk8H8/t4BUWKe98lD4QvzVbhzpAkl3LRpYkukC7ChjTJnK+jyV/z6jyuWG9IAGzoZuH9Rxo5f8H5kK2hsOshRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgMUExgKJfENbZ+ECv7Kyn5/l+yx62qYc4wTzp3XTqc=;
 b=r84i/pyaAQyS4rzrNs+77bV5t0OsdygiOkz4eXZ+8TM6IY+W5LhDs3SJmWTPuRkhPcihuEWmkOleFMf6U6U8m0n2FJq3sF0HhLCtccbtG94xAhFC9zPgIygGdoayhumm21PCUN352W4KuxxHUccxTICKGAaf6LwHAAg0SRLVOmaG8dwcuewhl/v5WMjNJeze7+5j3IMtouJuPBWVbOPsa3Zi4y+jmb1Nu2lzTwGrQk80a9xy1awqyOvW4BCsmQsMCxvp/UpZ92Qrr6t5xpc6cn5NSGfELo4OVUQdDiqR999ZEpT93TvcvPbhkZLHGwCNlGdMswcvU6K4+4WAsur81g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgMUExgKJfENbZ+ECv7Kyn5/l+yx62qYc4wTzp3XTqc=;
 b=g9L1+2EZ2ZaLaFTWr//3yoGYYpmz9P08vD/MudD9FcWCvLqb0SyRuN7Aea9K7CbskY+w5P/5ApkLP6XcJWXKn5lKgja0JCYmUuCFhRB+s1eSEsQf/z/0YRWVVopRZsOd6T53UX8Hy9BaHf0GRXh7FPPtSXm1kr3Ym9bw/9ThXk26xqdHZ4MrtX6IymOkrUnNmvhmNDn6XE6VVIu79U8VdhPaZA1eXosqYb6GfcrNqvah4C+0S2GIzI+hCm0oIElfvitjnRBUTLTYOEOyQRTRgcloOiUIi9berlsrpW/4r/GOc/gffxaheEbUpygCtatMmYJF8dfdYajZVGJSznvN8Q==
Received: from MW4PR03CA0127.namprd03.prod.outlook.com (2603:10b6:303:8c::12)
 by PH0PR12MB7887.namprd12.prod.outlook.com (2603:10b6:510:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 19:06:01 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::6) by MW4PR03CA0127.outlook.office365.com
 (2603:10b6:303:8c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Tue, 10 Sep 2024 19:06:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 19:06:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 12:05:42 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 12:05:41 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Tue, 10 Sep 2024 12:05:41 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Create SKU8 AGX Orin board file
Date: Tue, 10 Sep 2024 19:04:57 +0000
Message-ID: <20240910190457.2154367-3-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240910190457.2154367-1-dstotland@nvidia.com>
References: <20240910190457.2154367-1-dstotland@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|PH0PR12MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bb3b23-6049-4d7b-2e25-08dcd1cb9c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WVOXliLVwLmp+7fufHIU3mrEtYMfrRs6eJzU3zxbXlYfu+e78pZpIHj9ESmM?=
 =?us-ascii?Q?cfgVgqAIj/mAcFDfmKjBGA+YY31bNfBLeaOqHCMFWuJlqmOO5pm8qWvu1Puo?=
 =?us-ascii?Q?gU3GBKjDP4feWsoFTFVP1sZNBYP8X4YzBEvi1z6cQjYXtZwCv3xXRFGZjao3?=
 =?us-ascii?Q?+6r+9RQteyPSrhu8cw/yBgCWFapGWABtrpFEVvAmEjGg0UX6HvjARa62VfVr?=
 =?us-ascii?Q?2hmyGC/RnovewN6hhpKmVFtTFj8LJYKZ2V9whgfte1lzYRFT0p0TjQbtHyCQ?=
 =?us-ascii?Q?6qLv1pe4k3oExxmZz1q12VGm0VBJ0ZQYVZPL34dPzNgk+EGVqtadvp7/v58G?=
 =?us-ascii?Q?jp0l6gXqvjOfIF0sdIWC75Jdoqvo5v72vaSjHmX0niQrtZ/S/6nWr340JHmZ?=
 =?us-ascii?Q?t/akisfPD3+5MHhLYBmBlV6s+b0ibHdnC11lYNAdKks5w5+HGhUwxYTHnVit?=
 =?us-ascii?Q?o6YSP9pgeVX703ZCkwIe4hMq9Ce7S/QK4zjxDNgtp4SiWUiZ/kkn3/fBgBjK?=
 =?us-ascii?Q?jqQR3acl1zm5nu2eV4XUJcLrEm/KcDcetiRobyoqEYtToOCN+4hwRgBMkUI0?=
 =?us-ascii?Q?i2wViiofZcuRvnd8zbJHNscRfuSEZvXN6bt/F9ViOHvOra4B6GvlL8BVNLAu?=
 =?us-ascii?Q?wddoC0AVpSTQM1bUD3yNn7LrqalGn4v+KAwIEEFimvlIiv+sePtgmrIl3uLr?=
 =?us-ascii?Q?iW7Gq00hQOg27Tlyl2KASxCozoOrtKIfkAByD9N4deUmvkJukmsGXD41YAGG?=
 =?us-ascii?Q?Keq65fn3tGr8Zw71WIWjD3ObHiAodwzwH/xh5m8iHy9g6mpOzu2mR3sTml+d?=
 =?us-ascii?Q?zsBYaZhpLAXqEceQ/QKMmpFKqXbwAwQd5bMJLiIdu5jqWlfL69ygkR2mi/nz?=
 =?us-ascii?Q?lQ5DleNBiotXZbNa6tAXy/05cAtx1iqD7Bs0iFgrVisv/rX5BkbsSxZB121u?=
 =?us-ascii?Q?7xu9TuTRCJGG//5EDNUoGurJVsh/w8et8FimD6hQTSTzluSaqTfTfBTiJx0g?=
 =?us-ascii?Q?dqm5YRV/KM8bRvEMp/ORSRCgcwSr++RWdoZYt7RN72hNbQnOJbnZAvaJPEL+?=
 =?us-ascii?Q?ILB/MKBgMujnerKEdLo+9AbPs46z9lt7Sj4uZbSOX8BY03boioWJTBZZdBBw?=
 =?us-ascii?Q?H+yG+99Zdsr74u2KGqiTed12U3wGnHsuBqjzYtcxVMo1dbPAeeqQNBUSfJvM?=
 =?us-ascii?Q?iEqBtNi6cABd0XbYNeLVfSTu7VrAEXEJhQuaxt6JMo1QFRYXFQOFVRHYkFIB?=
 =?us-ascii?Q?QyjUzL4W0233gXQ1VDokEFI7jImQK7/D6wATPEQL7vYSNE2WihtCpjxvV4l3?=
 =?us-ascii?Q?ebe+D0FEqsLuQHsOW8eDR3OFt32QY6WxRhcWa7+bNAZd/zizQ6/DIX3WK+qZ?=
 =?us-ascii?Q?xcX7j4tcWGoADCF1rr7TXkS6BKEORU68CzlHLGbK3fG/+KaQoB/YonPZV7e1?=
 =?us-ascii?Q?4Bb4RQyREQhAVOcHgKpCMrXZrap9ONVi?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:06:01.1091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bb3b23-6049-4d7b-2e25-08dcd1cb9c67
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7887

The existing tegra234-p3737-0000+p3701-0000.dtb is compatible
with the following modules:

p3701-0000
p3701-0004
p3701-0005

Add support for p3701-0008. Move data that is common to all SKUs
to a new file called tegra234-p3737-0000+p3701.dtsi. Update Makefile.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 544 +----------------
 .../nvidia/tegra234-p3737-0000+p3701-0008.dts |  11 +
 .../dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 ++++++++++++++++++
 4 files changed, 561 insertions(+), 542 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index c38c809fe577..0fbb8a494dba 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 90f12277aede..4c0e96f9d493 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -1,551 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-#include <dt-bindings/input/linux-event-codes.h>
-#include <dt-bindings/input/gpio-keys.h>
-#include <dt-bindings/sound/rt5640.h>
-
+// Module files must be included first
 #include "tegra234-p3701-0000.dtsi"
+#include "tegra234-p3737-0000+p3701.dtsi"
 
 / {
 	model = "NVIDIA Jetson AGX Orin Developer Kit";
 	compatible = "nvidia,p3737-0000+p3701-0000", "nvidia,p3701-0000", "nvidia,tegra234";
-
-	aliases {
-		serial0 = &tcu;
-		serial1 = &uarta;
-	};
-
-	chosen {
-		bootargs = "console=ttyTCU0,115200n8";
-		stdout-path = "serial0:115200n8";
-	};
-
-	bus@0 {
-		aconnect@2900000 {
-			ahub@2900800 {
-				i2s@2901000 {
-					ports {
-						port@1 {
-							endpoint {
-								dai-format = "i2s";
-								remote-endpoint = <&rt5640_ep>;
-							};
-						};
-					};
-				};
-			};
-		};
-
-		serial@3100000 {
-			compatible = "nvidia,tegra194-hsuart";
-			reset-names = "serial";
-			status = "okay";
-		};
-
-		i2c@3160000 {
-			status = "okay";
-
-			eeprom@56 {
-				compatible = "atmel,24c02";
-				reg = <0x56>;
-
-				label = "system";
-				vcc-supply = <&vdd_1v8_sys>;
-				address-width = <8>;
-				pagesize = <8>;
-				size = <256>;
-				read-only;
-			};
-		};
-
-		serial@31d0000 {
-			current-speed = <115200>;
-			status = "okay";
-		};
-
-		i2c@31e0000 {
-			status = "okay";
-
-			audio-codec@1c {
-				compatible = "realtek,rt5640";
-				reg = <0x1c>;
-				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
-				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
-				clock-names = "mclk";
-				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
-				realtek,dmic2-data-pin = <RT5640_DMIC2_DATA_PIN_NONE>;
-				realtek,jack-detect-source = <RT5640_JD_SRC_HDA_HEADER>;
-				sound-name-prefix = "CVB-RT";
-
-				port {
-					rt5640_ep: endpoint {
-						remote-endpoint = <&i2s1_dap>;
-						mclk-fs = <256>;
-					};
-				};
-			};
-		};
-
-		pwm@3280000 {
-			status = "okay";
-		};
-
-		pwm@32a0000 {
-			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
-			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
-			status = "okay";
-		};
-
-		pwm@32c0000 {
-			status = "okay";
-		};
-
-		pwm@32f0000 {
-			status = "okay";
-		};
-
-		mmc@3400000 {
-			status = "okay";
-			bus-width = <4>;
-			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
-			disable-wp;
-		};
-
-		hda@3510000 {
-			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
-			status = "okay";
-		};
-
-		padctl@3520000 {
-			status = "okay";
-
-			pads {
-				usb2 {
-					lanes {
-						usb2-0 {
-							status = "okay";
-						};
-
-						usb2-1 {
-							status = "okay";
-						};
-
-						usb2-2 {
-							status = "okay";
-						};
-
-						usb2-3 {
-							status = "okay";
-						};
-					};
-				};
-
-				usb3 {
-					lanes {
-						usb3-0 {
-							status = "okay";
-						};
-
-						usb3-1 {
-							status = "okay";
-						};
-
-						usb3-2 {
-							status = "okay";
-						};
-					};
-				};
-			};
-
-			ports {
-				usb2-0 {
-					mode = "otg";
-					usb-role-switch;
-					status = "okay";
-
-					port {
-						hs_typec_p1: endpoint {
-							remote-endpoint = <&hs_ucsi_ccg_p1>;
-						};
-					};
-				};
-
-				usb2-1 {
-					mode = "host";
-					status = "okay";
-
-					port {
-						hs_typec_p0: endpoint {
-							remote-endpoint = <&hs_ucsi_ccg_p0>;
-						};
-					};
-				};
-
-				usb2-2 {
-					mode = "host";
-					status = "okay";
-				};
-
-				usb2-3 {
-					mode = "host";
-					status = "okay";
-				};
-
-				usb3-0 {
-					nvidia,usb2-companion = <1>;
-					status = "okay";
-
-					port {
-						ss_typec_p0: endpoint {
-							remote-endpoint = <&ss_ucsi_ccg_p0>;
-						};
-					};
-				};
-
-				usb3-1 {
-					nvidia,usb2-companion = <0>;
-					status = "okay";
-
-					port {
-						ss_typec_p1: endpoint {
-							remote-endpoint = <&ss_ucsi_ccg_p1>;
-						};
-					};
-				};
-
-				usb3-2 {
-					nvidia,usb2-companion = <3>;
-					status = "okay";
-				};
-			};
-		};
-
-		usb@3550000 {
-			status = "okay";
-
-			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
-			phy-names = "usb2-0", "usb3-0";
-		};
-
-		usb@3610000 {
-			status = "okay";
-
-			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
-			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
-			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
-				    "usb3-0", "usb3-1", "usb3-2";
-		};
-
-		ethernet@6800000 {
-			status = "okay";
-
-			phy-handle = <&mgbe0_phy>;
-			phy-mode = "10gbase-r";
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				mgbe0_phy: phy@0 {
-					compatible = "ethernet-phy-ieee802.3-c45";
-					reg = <0x0>;
-
-					#phy-cells = <0>;
-				};
-			};
-		};
-
-		i2c@c240000 {
-			status = "okay";
-
-			typec@8 {
-				compatible = "cypress,cypd4226";
-				reg = <0x08>;
-				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
-				firmware-name = "nvidia,jetson-agx-xavier";
-				status = "okay";
-
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				ccg_typec_con0: connector@0 {
-					compatible = "usb-c-connector";
-					reg = <0>;
-					label = "USB-C";
-					data-role = "host";
-
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port@0 {
-							reg = <0>;
-
-							hs_ucsi_ccg_p0: endpoint {
-								remote-endpoint = <&hs_typec_p0>;
-							};
-						};
-
-						port@1 {
-							reg = <1>;
-
-							ss_ucsi_ccg_p0: endpoint {
-								remote-endpoint = <&ss_typec_p0>;
-							};
-						};
-					};
-				};
-
-				ccg_typec_con1: connector@1 {
-					compatible = "usb-c-connector";
-					reg = <1>;
-					label = "USB-C";
-					data-role = "dual";
-
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port@0 {
-							reg = <0>;
-
-							hs_ucsi_ccg_p1: endpoint {
-								remote-endpoint = <&hs_typec_p1>;
-							};
-						};
-
-						port@1 {
-							reg = <1>;
-
-							ss_ucsi_ccg_p1: endpoint {
-								remote-endpoint = <&ss_typec_p1>;
-							};
-						};
-					};
-				};
-			};
-		};
-
-		pcie@14100000 {
-			status = "okay";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
-
-			phys = <&p2u_hsio_3>;
-			phy-names = "p2u-0";
-		};
-
-		pcie@14160000 {
-			status = "okay";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
-
-			phys = <&p2u_hsio_4>, <&p2u_hsio_5>, <&p2u_hsio_6>,
-			       <&p2u_hsio_7>;
-			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
-		};
-
-		pcie@141a0000 {
-			status = "okay";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
-			vpcie3v3-supply = <&vdd_3v3_pcie>;
-			vpcie12v-supply = <&vdd_12v_pcie>;
-
-			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
-			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-				    "p2u-5", "p2u-6", "p2u-7";
-		};
-
-		pcie-ep@141a0000 {
-			status = "disabled";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
-
-			reset-gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
-
-			nvidia,refclk-select-gpios = <&gpio_aon
-						      TEGRA234_AON_GPIO(AA, 4)
-						      GPIO_ACTIVE_HIGH>;
-
-			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
-			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-				    "p2u-5", "p2u-6", "p2u-7";
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		status = "okay";
-
-		key-force-recovery {
-			label = "Force Recovery";
-			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <BTN_1>;
-		};
-
-		key-power {
-			label = "Power";
-			gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <KEY_POWER>;
-			wakeup-event-action = <EV_ACT_ASSERTED>;
-			wakeup-source;
-		};
-
-		key-suspend {
-			label = "Suspend";
-			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <KEY_SLEEP>;
-		};
-	};
-
-	fan: pwm-fan {
-		compatible = "pwm-fan";
-		cooling-levels = <66 215 255>;
-		pwms = <&pwm3 0 45334>;
-		#cooling-cells = <2>;
-	};
-
-	serial {
-		status = "okay";
-	};
-
-	sound {
-		compatible = "nvidia,tegra186-audio-graph-card";
-		status = "okay";
-
-		dais = /* ADMAIF (FE) Ports */
-		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
-		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
-		       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
-		       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
-		       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
-		       /* XBAR Ports */
-		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s4_port>,
-		       <&xbar_i2s6_port>, <&xbar_dmic3_port>,
-		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
-		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
-		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
-		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
-		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
-		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
-		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
-		       <&xbar_amx3_in1_port>, <&xbar_amx3_in2_port>,
-		       <&xbar_amx3_in3_port>, <&xbar_amx3_in4_port>,
-		       <&xbar_amx4_in1_port>, <&xbar_amx4_in2_port>,
-		       <&xbar_amx4_in3_port>, <&xbar_amx4_in4_port>,
-		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
-		       <&xbar_adx3_in_port>, <&xbar_adx4_in_port>,
-		       <&xbar_mix_in1_port>, <&xbar_mix_in2_port>,
-		       <&xbar_mix_in3_port>, <&xbar_mix_in4_port>,
-		       <&xbar_mix_in5_port>, <&xbar_mix_in6_port>,
-		       <&xbar_mix_in7_port>, <&xbar_mix_in8_port>,
-		       <&xbar_mix_in9_port>, <&xbar_mix_in10_port>,
-		       <&xbar_asrc_in1_port>, <&xbar_asrc_in2_port>,
-		       <&xbar_asrc_in3_port>, <&xbar_asrc_in4_port>,
-		       <&xbar_asrc_in5_port>, <&xbar_asrc_in6_port>,
-		       <&xbar_asrc_in7_port>,
-		       <&xbar_ope1_in_port>,
-		       /* HW accelerators */
-		       <&sfc1_out_port>, <&sfc2_out_port>,
-		       <&sfc3_out_port>, <&sfc4_out_port>,
-		       <&mvc1_out_port>, <&mvc2_out_port>,
-		       <&amx1_out_port>, <&amx2_out_port>,
-		       <&amx3_out_port>, <&amx4_out_port>,
-		       <&adx1_out1_port>, <&adx1_out2_port>,
-		       <&adx1_out3_port>, <&adx1_out4_port>,
-		       <&adx2_out1_port>, <&adx2_out2_port>,
-		       <&adx2_out3_port>, <&adx2_out4_port>,
-		       <&adx3_out1_port>, <&adx3_out2_port>,
-		       <&adx3_out3_port>, <&adx3_out4_port>,
-		       <&adx4_out1_port>, <&adx4_out2_port>,
-		       <&adx4_out3_port>, <&adx4_out4_port>,
-		       <&mix_out1_port>, <&mix_out2_port>, <&mix_out3_port>,
-		       <&mix_out4_port>, <&mix_out5_port>,
-		       <&asrc_out1_port>, <&asrc_out2_port>, <&asrc_out3_port>,
-		       <&asrc_out4_port>, <&asrc_out5_port>, <&asrc_out6_port>,
-		       <&ope1_out_port>,
-		       /* BE I/O Ports */
-		       <&i2s1_port>, <&i2s2_port>, <&i2s4_port>, <&i2s6_port>,
-		       <&dmic3_port>;
-
-		label = "NVIDIA Jetson AGX Orin APE";
-
-		widgets = "Microphone",	"CVB-RT MIC Jack",
-			  "Microphone",	"CVB-RT MIC",
-			  "Headphone",	"CVB-RT HP Jack",
-			  "Speaker",	"CVB-RT SPK";
-
-		routing = /* I2S1 <-> RT5640 */
-			  "CVB-RT AIF1 Playback",	"I2S1 DAP-Playback",
-			  "I2S1 DAP-Capture",		"CVB-RT AIF1 Capture",
-			  /* RT5640 codec controls */
-			  "CVB-RT HP Jack",		"CVB-RT HPOL",
-			  "CVB-RT HP Jack",		"CVB-RT HPOR",
-			  "CVB-RT IN1P",		"CVB-RT MIC Jack",
-			  "CVB-RT IN2P",		"CVB-RT MIC Jack",
-			  "CVB-RT SPK",			"CVB-RT SPOLP",
-			  "CVB-RT SPK",			"CVB-RT SPORP",
-			  "CVB-RT DMIC1",		"CVB-RT MIC",
-			  "CVB-RT DMIC2",		"CVB-RT MIC";
-	};
-
-	thermal-zones {
-		tj-thermal {
-			cooling-maps {
-				map-active-0 {
-					cooling-device = <&fan 0 1>;
-					trip = <&tj_trip_active0>;
-				};
-
-				map-active-1 {
-					cooling-device = <&fan 1 2>;
-					trip = <&tj_trip_active1>;
-				};
-			};
-		};
-	};
-
-	vdd_1v8_sys: regulator-vdd-1v8-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_SYS";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_3V3_PCIE";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio TEGRA234_MAIN_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
-		regulator-boot-on;
-		enable-active-high;
-	};
-
-	vdd_12v_pcie: regulator-vdd-12v-pcie {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_12V_PCIE";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio TEGRA234_MAIN_GPIO(A, 1) GPIO_ACTIVE_LOW>;
-		regulator-boot-on;
-	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
new file mode 100644
index 000000000000..979f085691a1
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+// Module files must be included first
+#include "tegra234-p3701-0008.dtsi"
+#include "tegra234-p3737-0000+p3701.dtsi"
+
+/ {
+	model = "NVIDIA Jetson AGX Orin Developer Kit";
+	compatible = "nvidia,p3737-0000+p3701-0008", "nvidia,p3701-0008", "nvidia,tegra234";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
new file mode 100644
index 000000000000..f6cad29355e6
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
@@ -0,0 +1,547 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/clock/tegra234-clock.h>
+#include <dt-bindings/gpio/tegra234-gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/sound/rt5640.h>
+
+/ {
+	aliases {
+		serial0 = &tcu;
+		serial1 = &uarta;
+	};
+
+	chosen {
+		bootargs = "console=ttyTCU0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	bus@0 {
+		aconnect@2900000 {
+			ahub@2900800 {
+				i2s@2901000 {
+					ports {
+						port@1 {
+							endpoint {
+								dai-format = "i2s";
+								remote-endpoint = <&rt5640_ep>;
+							};
+						};
+					};
+				};
+			};
+		};
+
+		serial@3100000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@56 {
+				compatible = "atmel,24c02";
+				reg = <0x56>;
+
+				label = "system";
+				vcc-supply = <&vdd_1v8_sys>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
+		serial@31d0000 {
+			current-speed = <115200>;
+			status = "okay";
+		};
+
+		i2c@31e0000 {
+			status = "okay";
+
+			audio-codec@1c {
+				compatible = "realtek,rt5640";
+				reg = <0x1c>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
+				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
+				clock-names = "mclk";
+				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
+				realtek,dmic2-data-pin = <RT5640_DMIC2_DATA_PIN_NONE>;
+				realtek,jack-detect-source = <RT5640_JD_SRC_HDA_HEADER>;
+				sound-name-prefix = "CVB-RT";
+
+				port {
+					rt5640_ep: endpoint {
+						remote-endpoint = <&i2s1_dap>;
+						mclk-fs = <256>;
+					};
+				};
+			};
+		};
+
+		pwm@3280000 {
+			status = "okay";
+		};
+
+		pwm@32a0000 {
+			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			status = "okay";
+		};
+
+		pwm@32c0000 {
+			status = "okay";
+		};
+
+		pwm@32f0000 {
+			status = "okay";
+		};
+
+		mmc@3400000 {
+			status = "okay";
+			bus-width = <4>;
+			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
+			disable-wp;
+		};
+
+		hda@3510000 {
+			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
+			status = "okay";
+		};
+
+		padctl@3520000 {
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-0 {
+							status = "okay";
+						};
+
+						usb2-1 {
+							status = "okay";
+						};
+
+						usb2-2 {
+							status = "okay";
+						};
+
+						usb2-3 {
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							status = "okay";
+						};
+
+						usb3-1 {
+							status = "okay";
+						};
+
+						usb3-2 {
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					mode = "otg";
+					usb-role-switch;
+					status = "okay";
+
+					port {
+						hs_typec_p1: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p1>;
+						};
+					};
+				};
+
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+
+					port {
+						hs_typec_p0: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p0>;
+						};
+					};
+				};
+
+				usb2-2 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-3 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb3-0 {
+					nvidia,usb2-companion = <1>;
+					status = "okay";
+
+					port {
+						ss_typec_p0: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p0>;
+						};
+					};
+				};
+
+				usb3-1 {
+					nvidia,usb2-companion = <0>;
+					status = "okay";
+
+					port {
+						ss_typec_p1: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p1>;
+						};
+					};
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <3>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3550000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+			phy-names = "usb2-0", "usb3-0";
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
+				    "usb3-0", "usb3-1", "usb3-2";
+		};
+
+		ethernet@6800000 {
+			status = "okay";
+
+			phy-handle = <&mgbe0_phy>;
+			phy-mode = "10gbase-r";
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mgbe0_phy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x0>;
+
+					#phy-cells = <0>;
+				};
+			};
+		};
+
+		i2c@c240000 {
+			status = "okay";
+
+			typec@8 {
+				compatible = "cypress,cypd4226";
+				reg = <0x08>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
+				firmware-name = "nvidia,jetson-agx-xavier";
+				status = "okay";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ccg_typec_con0: connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB-C";
+					data-role = "host";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							hs_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&hs_typec_p0>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+
+							ss_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&ss_typec_p0>;
+							};
+						};
+					};
+				};
+
+				ccg_typec_con1: connector@1 {
+					compatible = "usb-c-connector";
+					reg = <1>;
+					label = "USB-C";
+					data-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							hs_ucsi_ccg_p1: endpoint {
+								remote-endpoint = <&hs_typec_p1>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+
+							ss_ucsi_ccg_p1: endpoint {
+								remote-endpoint = <&ss_typec_p1>;
+							};
+						};
+					};
+				};
+			};
+		};
+
+		pcie@14100000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+
+			phys = <&p2u_hsio_3>;
+			phy-names = "p2u-0";
+		};
+
+		pcie@14160000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+
+			phys = <&p2u_hsio_4>, <&p2u_hsio_5>, <&p2u_hsio_6>,
+			       <&p2u_hsio_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
+		};
+
+		pcie@141a0000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
+			vpcie3v3-supply = <&vdd_3v3_pcie>;
+			vpcie12v-supply = <&vdd_12v_pcie>;
+
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
+
+		pcie-ep@141a0000 {
+			status = "disabled";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
+
+			reset-gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
+
+			nvidia,refclk-select-gpios = <&gpio_aon
+						      TEGRA234_AON_GPIO(AA, 4)
+						      GPIO_ACTIVE_HIGH>;
+
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		status = "okay";
+
+		key-force-recovery {
+			label = "Force Recovery";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_1>;
+		};
+
+		key-power {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-suspend {
+			label = "Suspend";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_SLEEP>;
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <66 215 255>;
+		pwms = <&pwm3 0 45334>;
+		#cooling-cells = <2>;
+	};
+
+	serial {
+		status = "okay";
+	};
+
+	sound {
+		compatible = "nvidia,tegra186-audio-graph-card";
+		status = "okay";
+
+		dais = /* ADMAIF (FE) Ports */
+		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
+		       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
+		       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
+		       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
+		       /* XBAR Ports */
+		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s4_port>,
+		       <&xbar_i2s6_port>, <&xbar_dmic3_port>,
+		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
+		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
+		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
+		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
+		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
+		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
+		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
+		       <&xbar_amx3_in1_port>, <&xbar_amx3_in2_port>,
+		       <&xbar_amx3_in3_port>, <&xbar_amx3_in4_port>,
+		       <&xbar_amx4_in1_port>, <&xbar_amx4_in2_port>,
+		       <&xbar_amx4_in3_port>, <&xbar_amx4_in4_port>,
+		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
+		       <&xbar_adx3_in_port>, <&xbar_adx4_in_port>,
+		       <&xbar_mix_in1_port>, <&xbar_mix_in2_port>,
+		       <&xbar_mix_in3_port>, <&xbar_mix_in4_port>,
+		       <&xbar_mix_in5_port>, <&xbar_mix_in6_port>,
+		       <&xbar_mix_in7_port>, <&xbar_mix_in8_port>,
+		       <&xbar_mix_in9_port>, <&xbar_mix_in10_port>,
+		       <&xbar_asrc_in1_port>, <&xbar_asrc_in2_port>,
+		       <&xbar_asrc_in3_port>, <&xbar_asrc_in4_port>,
+		       <&xbar_asrc_in5_port>, <&xbar_asrc_in6_port>,
+		       <&xbar_asrc_in7_port>,
+		       <&xbar_ope1_in_port>,
+		       /* HW accelerators */
+		       <&sfc1_out_port>, <&sfc2_out_port>,
+		       <&sfc3_out_port>, <&sfc4_out_port>,
+		       <&mvc1_out_port>, <&mvc2_out_port>,
+		       <&amx1_out_port>, <&amx2_out_port>,
+		       <&amx3_out_port>, <&amx4_out_port>,
+		       <&adx1_out1_port>, <&adx1_out2_port>,
+		       <&adx1_out3_port>, <&adx1_out4_port>,
+		       <&adx2_out1_port>, <&adx2_out2_port>,
+		       <&adx2_out3_port>, <&adx2_out4_port>,
+		       <&adx3_out1_port>, <&adx3_out2_port>,
+		       <&adx3_out3_port>, <&adx3_out4_port>,
+		       <&adx4_out1_port>, <&adx4_out2_port>,
+		       <&adx4_out3_port>, <&adx4_out4_port>,
+		       <&mix_out1_port>, <&mix_out2_port>, <&mix_out3_port>,
+		       <&mix_out4_port>, <&mix_out5_port>,
+		       <&asrc_out1_port>, <&asrc_out2_port>, <&asrc_out3_port>,
+		       <&asrc_out4_port>, <&asrc_out5_port>, <&asrc_out6_port>,
+		       <&ope1_out_port>,
+		       /* BE I/O Ports */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s4_port>, <&i2s6_port>,
+		       <&dmic3_port>;
+
+		label = "NVIDIA Jetson AGX Orin APE";
+
+		widgets = "Microphone",	"CVB-RT MIC Jack",
+			  "Microphone",	"CVB-RT MIC",
+			  "Headphone",	"CVB-RT HP Jack",
+			  "Speaker",	"CVB-RT SPK";
+
+		routing = /* I2S1 <-> RT5640 */
+			  "CVB-RT AIF1 Playback",	"I2S1 DAP-Playback",
+			  "I2S1 DAP-Capture",		"CVB-RT AIF1 Capture",
+			  /* RT5640 codec controls */
+			  "CVB-RT HP Jack",		"CVB-RT HPOL",
+			  "CVB-RT HP Jack",		"CVB-RT HPOR",
+			  "CVB-RT IN1P",		"CVB-RT MIC Jack",
+			  "CVB-RT IN2P",		"CVB-RT MIC Jack",
+			  "CVB-RT SPK",			"CVB-RT SPOLP",
+			  "CVB-RT SPK",			"CVB-RT SPORP",
+			  "CVB-RT DMIC1",		"CVB-RT MIC",
+			  "CVB-RT DMIC2",		"CVB-RT MIC";
+	};
+
+	thermal-zones {
+		tj-thermal {
+			cooling-maps {
+				map-active-0 {
+					cooling-device = <&fan 0 1>;
+					trip = <&tj_trip_active0>;
+				};
+
+				map-active-1 {
+					cooling-device = <&fan 1 2>;
+					trip = <&tj_trip_active1>;
+				};
+			};
+		};
+	};
+
+	vdd_1v8_sys: regulator-vdd-1v8-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_SYS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_PCIE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA234_MAIN_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
+	vdd_12v_pcie: regulator-vdd-12v-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_12V_PCIE";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&gpio TEGRA234_MAIN_GPIO(A, 1) GPIO_ACTIVE_LOW>;
+		regulator-boot-on;
+	};
+};
-- 
2.17.1

