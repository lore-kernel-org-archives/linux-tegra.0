Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715671922E0;
	Fri, 23 Aug 2024 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449852; cv=fail; b=gcDQErSoJ6zJqEgiP7lK3/5Y0ED1HTrorWrQD1XupQnj/pDP+iBt4sSjK4ueDxHbzijl8ajjI5h2jfWTTGTNRX8x20ruWdB048K/nZFNEP8SjwfuAGfaxI1URyUfpx87Tb1WU0+9YS/gDIalI7r92QIwvJQ182y+yXXOhdliu0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449852; c=relaxed/simple;
	bh=RhRqxi7WOAjPNvJJd0OpE7adCAZu9X/CSUkDVRJt57o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKIR+dAYKBgVugfhL0DaNzGe6YdcoYQP979R/Qpx4FPN54+TEsLE4l/il0XF4B1wFrFW7ZMOTmiWYi9b+0t6Yx0YB1X0OhVFn3R7G+TdFt5gaW10O/W+Bf+bqjVGkeWS67uwZkbm5syY/eMGtjlahCS+YMgM+cEilginhOk+4qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZnMRcUhv; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZnMRcUhv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtjPNdoJNmkI74miUD31oeUZglJU5ExxoZ2Z8oiC3Lk/1BQrOYLn1CCRKcpEARMUtqAhoELJotx5BSOh4EuOLUpWBdrkw0paMp37oGBAPVKlqhx6PDks4KMC+XbGcKVvctXtWG32+aw6LBZMeMaep4EaWKjBW4b+VsrUBRI347Ika0SMTD1l/08wV5l4VAlZbXR5+U5LwTva91SELOP31E1RsUoxXZhA5jLoX/AZfcCyhQ9OPZQ8P9AfB2et77P+qo+nQmaT2WCgFt6OrIxqSlNQ7fm5KC0g67jZVm/cqgdKxTxHKYuwjFs9OZN4Sfvm9WD4zbiVeXWNRSpsdgNynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIK7pI+nyxpYaut+crWiulsGqIoE0bnxRg5fdws4RRE=;
 b=u3Vcr1w9vybs166oJqbEz8vl6rWWpPvpWLD1m/sh2/e8mF8opP552d7KyNqtmYKQIVNxHfkdzrNoBg+HTcDtgAihKz4mSOyjnNUGwIIyn2rqd8e1dvDFmoTZMA1kZCPpqfReuTTIV4U5EUOjWqNvmNfvbRX+/2AD4c8+j9gX0yq+JOniir0Jm9qz5ez7vmx2lfJl30SF8JXGbzwDPuJnGile5xOCrW+8hRbkyQbm8vfyBWcXlBz+cIdAEOLA5nLyKw6F1yOI4K7HX4nHt5KXiOW9Vh4/RUewPT6qmZJV692kpVqIFEIwCLQT4s8N/cF9GFLi0z8Bfu008stf5OW+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIK7pI+nyxpYaut+crWiulsGqIoE0bnxRg5fdws4RRE=;
 b=ZnMRcUhv77R5yJGguJ4vp1/IeIFEoxhblrz7FqFpBhmWH11CqYwq9sId1MqpIJPAHGyf1i1PT5Ivrp96z7s1apy1Zm4iC2boLTEz/3TJmXhwHqH9IOYE5rR92lmCFgRFT+VvubYfhy5nm4IY7KLk4n/whp84CJ2LSHIWp0PlCqfMorV2CtjOqdk2B3ywPmlaRz53/TsH0AbBHG73mXL67YlR4lnc7fI057TOKaDEYr4QvWotHdU3tXyMyZz9XP4D7CCXtdZa54kHKIYQ4Yz0/WdCQ75z15X5DXi1y2ZKNwZBnezyD+56o49ErXE2r66FDlT8JdlqgPcJQOIuYSihVQ==
Received: from CH0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:b0::31)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 21:50:45 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::78) by CH0PR03CA0026.outlook.office365.com
 (2603:10b6:610:b0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Fri, 23 Aug 2024 21:50:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:50:44 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:30 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:29 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:50:29 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 2/7] arm64: tegra: Combine IGX Orin board files
Date: Fri, 23 Aug 2024 21:49:52 +0000
Message-ID: <20240823214957.771297-3-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823214957.771297-1-dstotland@nvidia.com>
References: <20240823214957.771297-1-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 533c0f45-6252-453c-7686-08dcc3bda415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hlOXziIdkp6Z3LFHjZ5lNP0CcJo8/X7pm7gO3ZC5YhwADB199FpTlEcvxnV4?=
 =?us-ascii?Q?BHvnvfzpm8YZi7yuWsQUAuyUdoQHuSCA6MaYzwQo4I3UvayjlYKGg/gkbLxp?=
 =?us-ascii?Q?PR7OBOFQq7gqbDC0qrGpWNyDQFaUCS1hnNj3Xu2DtVoR1JnYlRm8TyI9TQtz?=
 =?us-ascii?Q?y/WOBDhvIr/aZf+2nDvvBO0KYJu5VLzsqk5LT7hAyDvmOvo3fze3jDv/57UD?=
 =?us-ascii?Q?pp3fhfYPMKj3mv3aeR0g89Gz3Hqb+dGAoDYparQOVWkQyAnKG+WJgO41j3Pn?=
 =?us-ascii?Q?2kuOpHlWSgQzCOQN1AEPl8puwezYRuJ9OrAG2rPkQ+/6PmRKEqUp+Tn0Vgug?=
 =?us-ascii?Q?Vg1y+jXeJxOs6eLg0Ey72/M5JMwxv9okvG8xbPLbPHuAxyUzQbMJ2Ts7k29E?=
 =?us-ascii?Q?J5TBIEIw+MfiUcfBVE4Pl/SiRyToPhGOQzCc1ncra0rfMh5MrtSDXiTo1KFb?=
 =?us-ascii?Q?8fPQqD+oa5UJmJG6ZwCEJqklySanQBqW+JHCp2vNGVxOXONcgIOY0uxAoRdU?=
 =?us-ascii?Q?a6TSNRbt2aOBHSH8FkjtfuHMXFGkCfuXTuyozdvTCbCPxgwMPYUzyJ4Fuk9C?=
 =?us-ascii?Q?hIDpUOJ3I7f3ldoEozvNhbsW4XVqCdxwzvMCL7FbGtNU/+rxu2Bzlu86ZWdH?=
 =?us-ascii?Q?ideA1zyyQxiBX8My8Pi1q7/yr9aHsGL2rgeRluUc92bc2rzt5qrbgX29syxW?=
 =?us-ascii?Q?EU5TnArTbmsQOBp//U5Tu1ygPR2SIYN9Q9HMsI3UrJvHeiQsxQYHivgP7wIq?=
 =?us-ascii?Q?wVqQK/tzdNHzZ0IusLVwk69ywfAt7P0N7Qwuw2Ps0ROZuKXtsSCRnBVJ9QWC?=
 =?us-ascii?Q?0iq7WwFs63rtmGydt2y4fjubZa/7FV78oA+w21p8bHqcWUDtFOmBxh2jzakr?=
 =?us-ascii?Q?RrBBn9tEP1W9o4hx+A0myaibABY2L6B2p5nT2QyK5ZUvlEPKe8OXZdRnGaRU?=
 =?us-ascii?Q?8KiVw34drpBaYhDAuHfZJix1OymAsc6ssk25+ShLKP8DEek57/JCQxjAKQsw?=
 =?us-ascii?Q?rnOAiZYUOh+dLndMbVmlC4KcMsQ9unlV1JqEBJ7vyRmbLhUpCbdcfIlIKlK2?=
 =?us-ascii?Q?QOH560orieGC2WJK20qMPq+Hn/rQjP9etcWQM1nfzI9P7dxtLtDRamQQEVi+?=
 =?us-ascii?Q?PN7gYWq2cGHpNMcDqgnhJii6b1km3dIfP9ah7zoPWxnev9hoDTRol4SVIA4S?=
 =?us-ascii?Q?QwFi9AWq3BLvhJtBk+1RGvUIzGWsNcIEIBpJNH5D3jvNy3+IXU6a3ZWdWwjJ?=
 =?us-ascii?Q?+vq3gDJ1w7v8qpM79vmsBsjWk6CIVSHJLgRYShTPvaFrci2lUP2+cMQalNpt?=
 =?us-ascii?Q?5hu2b/xWq/jwihxP3BnG6hEGV81jy7wvA2w3FFkhYdhGUvCLrDymXwrPmp97?=
 =?us-ascii?Q?JTMcCTTJ1PoQswEEXYIpWFAyInbxv7LdiK0aiMAO5a6/8d+ThD6/3CtWhxbQ?=
 =?us-ascii?Q?tmUugVqRImBM7hdXkNsKLX9kPCjx+Iwd?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:50:44.6841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 533c0f45-6252-453c-7686-08dcc3bda415
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068

Current IGX Orin structure has both a top-level module+board
file as well as a board file. Most of the data in the board-file
is closely related to the module itself. The benefit of this
extra file is outweighed by the additional complexity. Merge
the board file into the module+board file for simplicity.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts | 236 ++++++++++++++++-
 .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 248 ------------------
 2 files changed, 235 insertions(+), 249 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index bac611d735c5..9581b31b459f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -3,8 +3,8 @@
 
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/sound/rt5640.h>
 #include "tegra234-p3701-0008.dtsi"
-#include "tegra234-p3740-0002.dtsi"
 
 / {
 	model = "NVIDIA IGX Orin Development Kit";
@@ -20,6 +20,32 @@
 	};
 
 	bus@0 {
+		aconnect@2900000 {
+			ahub@2900800 {
+				i2s@2901300 {
+					ports {
+						port@1 {
+							endpoint {
+								dai-format = "i2s";
+								remote-endpoint = <&rt5640_ep>;
+							};
+						};
+					};
+				};
+
+				i2s@2901500 {
+					ports {
+						port@1 {
+							endpoint {
+								bitclock-master;
+								frame-master;
+							};
+						};
+					};
+				};
+			};
+		};
+
 		serial@3100000 {
 			compatible = "nvidia,tegra194-hsuart";
 			reset-names = "serial";
@@ -45,6 +71,40 @@
 		i2c@31c0000 {
 			status = "okay";
 
+			rt5640: audio-codec@1c {
+				compatible = "realtek,rt5640";
+				reg = <0x1c>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
+				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
+				clock-names = "mclk";
+
+				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
+				realtek,dmic2-data-pin = <RT5640_DMIC2_DATA_PIN_NONE>;
+				realtek,jack-detect-source = <RT5640_JD_SRC_HDA_HEADER>;
+
+				sound-name-prefix = "CVB-RT";
+
+				port {
+					rt5640_ep: endpoint {
+						remote-endpoint = <&i2s4_dap>;
+						mclk-fs = <256>;
+					};
+				};
+			};
+
+			/* carrier board ID EEPROM */
+			eeprom@55 {
+				compatible = "atmel,24c02";
+				reg = <0x55>;
+
+				label = "system";
+				vcc-supply = <&vdd_1v8_ls>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
 		};
 
 		i2c@31e0000 {
@@ -60,6 +120,121 @@
 			status = "okay";
 		};
 
+		padctl@3520000 {
+			vclamp-usb-supply = <&vdd_1v8_ao>;
+			avdd-usb-supply = <&vdd_3v3_ao>;
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-0 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb2-1 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb2-2 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb2-3 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb3-1 {
+							nvidia,function = "xusb";
+							status = "okay";
+						};
+
+						usb3-2 {
+							nvidia,function = "xusb";
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
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-2 {
+					mode = "host";
+					status = "okay";
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					mode = "host";
+					status = "okay";
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb3-0 {
+					nvidia,usb2-companion = <2>;
+					status = "okay";
+				};
+
+				usb3-1 {
+					nvidia,usb2-companion = <0>;
+					status = "okay";
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <1>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3550000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+			phy-names = "usb2-0", "usb3-0";
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
+				"usb3-0", "usb3-1", "usb3-2";
+		};
+
 		fuse@3810000 {
 			status = "okay";
 		};
@@ -70,6 +245,37 @@
 
 		i2c@c250000 {
 			status = "okay";
+
+			power-sensor@41 {
+				compatible = "ti,ina3221";
+				reg = <0x41>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "CVB_ATX_12V";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@1 {
+					reg = <0x1>;
+					label = "CVB_ATX_3V3";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@2 {
+					reg = <0x2>;
+					label = "CVB_ATX_5V";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina219";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
 		};
 
 		host1x@13e00000 {
@@ -235,4 +441,32 @@
 			  "CVB-RT DMIC1",		"CVB-RT MIC",
 			  "CVB-RT DMIC2",		"CVB-RT MIC";
 	};
+
+	vdd_3v3_dp: regulator-vdd-3v3-dp {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_DP";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3_sys>;
+		gpio = <&gpio TEGRA234_MAIN_GPIO(H, 6) 0>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vdd_3v3_sys: regulator-vdd-3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SYS";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vdd_3v3_wifi: regulator-vdd-3v3-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_WIFI";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA234_MAIN_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
deleted file mode 100644
index 377f518bd3e5..000000000000
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
+++ /dev/null
@@ -1,248 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <dt-bindings/sound/rt5640.h>
-
-/ {
-	compatible = "nvidia,p3740-0002";
-
-	bus@0 {
-		aconnect@2900000 {
-			ahub@2900800 {
-				i2s@2901300 {
-					ports {
-						port@1 {
-							endpoint {
-								dai-format = "i2s";
-								remote-endpoint = <&rt5640_ep>;
-							};
-						};
-					};
-				};
-
-				i2s@2901500 {
-					ports {
-						port@1 {
-							endpoint {
-								bitclock-master;
-								frame-master;
-							};
-						};
-					};
-				};
-			};
-		};
-
-		i2c@31c0000 {
-			rt5640: audio-codec@1c {
-				compatible = "realtek,rt5640";
-				reg = <0x1c>;
-				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
-				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
-				clock-names = "mclk";
-
-				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
-				realtek,dmic2-data-pin = <RT5640_DMIC2_DATA_PIN_NONE>;
-				realtek,jack-detect-source = <RT5640_JD_SRC_HDA_HEADER>;
-
-				sound-name-prefix = "CVB-RT";
-
-				port {
-					rt5640_ep: endpoint {
-						remote-endpoint = <&i2s4_dap>;
-						mclk-fs = <256>;
-					};
-				};
-			};
-
-			/* carrier board ID EEPROM */
-			eeprom@55 {
-				compatible = "atmel,24c02";
-				reg = <0x55>;
-
-				label = "system";
-				vcc-supply = <&vdd_1v8_ls>;
-				address-width = <8>;
-				pagesize = <8>;
-				size = <256>;
-				read-only;
-			};
-		};
-
-		padctl@3520000 {
-			vclamp-usb-supply = <&vdd_1v8_ao>;
-			avdd-usb-supply = <&vdd_3v3_ao>;
-			status = "okay";
-
-			pads {
-				usb2 {
-					lanes {
-						usb2-0 {
-							nvidia,function = "xusb";
-							status = "okay";
-						};
-
-						usb2-1 {
-							nvidia,function = "xusb";
-							status = "okay";
-						};
-
-						usb2-2 {
-							nvidia,function = "xusb";
-							status = "okay";
-						};
-
-						usb2-3 {
-							nvidia,function = "xusb";
-							status = "okay";
-						};
-					};
-				};
-
-				usb3 {
-					lanes {
-						usb3-0 {
-							nvidia,function = "xusb";
-							status = "okay";
-						};
-
-						usb3-1 {
-							nvidia,function = "xusb";
-							status = "okay";
-						};
-
-						usb3-2 {
-							nvidia,function = "xusb";
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
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-1 {
-					mode = "host";
-					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-2 {
-					mode = "host";
-					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-3 {
-					mode = "host";
-					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb3-0 {
-					nvidia,usb2-companion = <2>;
-					status = "okay";
-				};
-
-				usb3-1 {
-					nvidia,usb2-companion = <0>;
-					status = "okay";
-				};
-
-				usb3-2 {
-					nvidia,usb2-companion = <1>;
-					status = "okay";
-				};
-			};
-		};
-
-		usb@3550000 {
-			status = "okay";
-
-			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
-			phy-names = "usb2-0", "usb3-0";
-		};
-
-		usb@3610000 {
-			status = "okay";
-
-			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
-				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
-				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
-				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
-				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
-			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
-				"usb3-0", "usb3-1", "usb3-2";
-		};
-
-		i2c@c250000 {
-			power-sensor@41 {
-				compatible = "ti,ina3221";
-				reg = <0x41>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				input@0 {
-					reg = <0x0>;
-					label = "CVB_ATX_12V";
-					shunt-resistor-micro-ohms = <2000>;
-				};
-
-				input@1 {
-					reg = <0x1>;
-					label = "CVB_ATX_3V3";
-					shunt-resistor-micro-ohms = <2000>;
-				};
-
-				input@2 {
-					reg = <0x2>;
-					label = "CVB_ATX_5V";
-					shunt-resistor-micro-ohms = <2000>;
-				};
-			};
-
-			power-sensor@44 {
-				compatible = "ti,ina219";
-				reg = <0x44>;
-				shunt-resistor = <2000>;
-			};
-		};
-	};
-
-	vdd_3v3_dp: regulator-vdd-3v3-dp {
-				compatible = "regulator-fixed";
-				regulator-name = "VDD_3V3_DP";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				vin-supply = <&vdd_3v3_sys>;
-				gpio = <&gpio TEGRA234_MAIN_GPIO(H, 6) 0>;
-				enable-active-high;
-				regulator-always-on;
-	};
-
-	vdd_3v3_sys: regulator-vdd-3v3-sys {
-				compatible = "regulator-fixed";
-				regulator-name = "VDD_3V3_SYS";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-	};
-
-	vdd_3v3_wifi: regulator-vdd-3v3-wifi {
-				compatible = "regulator-fixed";
-				regulator-name = "VDD_3V3_WIFI";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				gpio = <&gpio TEGRA234_MAIN_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
-				regulator-boot-on;
-				enable-active-high;
-	};
-};
-- 
2.17.1

