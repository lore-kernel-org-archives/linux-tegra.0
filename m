Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC9194C71;
	Mon, 26 Aug 2024 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690893; cv=fail; b=rbtIgqioGQooH0WAl26PHM4snj6ILTdyblhKsAuKR+sMQC+czyCycAk1ZoXgWWlXa/PoVeJ7j5rjDZ3UMpHbxcnNZX68K00BnpsPiQtzIyLMTdwwGhlEamy3TRsTEy85XUI4m4N2c7XFHAvlOxsg1QZUfljmagtFBq1zWPWLnAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690893; c=relaxed/simple;
	bh=RhRqxi7WOAjPNvJJd0OpE7adCAZu9X/CSUkDVRJt57o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pkzw2w76gF3QrRBDIQynAXOrnI1OTSFUJ59KLGTHz35Z3ajpcthPadNyXc2Dg23UhIrJcnCi1RW9066teP9AyS4c9nMnv+jvpbk3FEbVFppC1hskTcwisLXWHgXiKAGpzzsaPxA4fvNIRGArgwlKm+S0QKD0Yd92uDYEL0nIuYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgAXWgvk; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgAXWgvk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZuZXbp57KEjiY58LCVqFtu/qgmTvJUb2qsK2wt7d494YniXrqZEIN3hF7INZU4pzhBHPQJL9rnCqtkXPH+x0QMRlJ/bCzwvG0J6+0IXZwdNSpMUx0x7uiUrqBodcZSoJPHtP+qhdoxLu34/mi/vGhvb1gSYplGtHaf4w+d6hWtKNqcwT0Aa2OASPBZXUdTgDcLwFm4bQbLbh1Spi05b/RuNp8IxDdWZe6cf2Y0/lrrokuak6iMUVZkj209fvoRuDWzKZtKXQ3rMHSDQ0GIs9hzNj7/Gb9ieIPK4sKx+CnJr0yALwFYiLUfbwood8FL/yf0QWF4VwaxRoWB8VRVdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIK7pI+nyxpYaut+crWiulsGqIoE0bnxRg5fdws4RRE=;
 b=uXwX+PUB0kzPwQKiyy/zYJhgir5R44sli8Z62HRJJ50RkJFPBgaYNb0NSZZCoQkp9m5Uv41icyTSqn7V/KE1dc3Sg8WjXUuoDI3BZVkm/G/om+tSLc55SbhJK1CdgfQHBvIPjwQTGYMTq03MpjDW+pCZ5dpyhXQnx0C1yKllXRHHsH0OgkeG/HdWo0raVTCisOn1xPUtc3rDQpgZglj2huzklBvtyhqlQEct290/xVpUIfsOrPLjaKriQLPmEa6VC3KedtZrQT+r2YgEn9QiBnHxrTEMOhVr53YFv53F5FP14OQyriPQn3dH2pNXbPDiZIb5z8DN6u8f/P7kt9pP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIK7pI+nyxpYaut+crWiulsGqIoE0bnxRg5fdws4RRE=;
 b=CgAXWgvkxmU5rVdy5RjwW7/9g8bBVL+fTjsTKg+MxwakZoIRuSVzpHdaqPrgAjIRT8J+C6xGuucFysujJj/hBcIwkSKjjHCBxHZN+1baRvd97ZH9OECpQrgIA+zW7OSD321uqMJMCbJ00n+aS5rfTEquKyqXQl9xkKnRdRfVRpVdnYfy/fnY6pPBWr04chdYFZuLbVgawP721qRH3IPmGoP06YZ9tCXGi+PJW2Ex/mUPP1Bu5EHU8KCPBtgT2o9wKTWBw6bCgrn8fiCGuyqKzM5e6Ne1FA/S/hoKM4l/LsnVkTrMIsZ3hh+gc6SeaAps1Ah9YMfKqtd5gFi5jLkyzA==
Received: from PH7P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::7)
 by DM6PR12MB4355.namprd12.prod.outlook.com (2603:10b6:5:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 16:48:06 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::4e) by PH7P221CA0001.outlook.office365.com
 (2603:10b6:510:32a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 16:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:48:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:47:51 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:47:51 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:47:51 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 3/7] arm64: tegra: Combine IGX Orin board files
Date: Mon, 26 Aug 2024 16:47:21 +0000
Message-ID: <20240826164725.775199-4-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240826164725.775199-1-dstotland@nvidia.com>
References: <20240826164725.775199-1-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DM6PR12MB4355:EE_
X-MS-Office365-Filtering-Correlation-Id: fd82a226-dd24-433d-ea55-08dcc5eedbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xAPFPSqXDRkfIBTUKyulngbapCxxa9WjgMxEwWQyiQ21vcUa6ZUhvWj+1zge?=
 =?us-ascii?Q?JN0LryBgrBCr2rjMAASZ7OpahisIVuW44XFtzoaS1bAfhWUfffBXqxZjIcDB?=
 =?us-ascii?Q?n2a6l2PV15A0QmTgkjXx2m1QlOhT/Pl4q95MTOIIXEpMij5iqShHrI46dmAe?=
 =?us-ascii?Q?bRzZrk8A0FVVoy+oPnUZR7iiIDcbIUj7qVMNUJH8ijSGAe0tXpvauZ3YEtcA?=
 =?us-ascii?Q?SIKDfC1g7ocV8c6GPQz5tUUDwjnDUI9MAMUzUrLTNVi49cA8G6iPHWEUi+hT?=
 =?us-ascii?Q?G57Ws8qrH0TjN6Y0a60Z2GhFoDV/fQLw1Cuao1YW/23igNxe2IkjsS5HOii1?=
 =?us-ascii?Q?IuI/kpmKdRipbSa0okqrpTh3IVIATy3Es0ULsG7YUaXl4IdORxeVxU/gKoxg?=
 =?us-ascii?Q?87syFmUpjAvX2x/ZE5PrdME/+hhnWksQVM91UQKeOKYYDYweCbCIcq1xvy2e?=
 =?us-ascii?Q?XUGO23rTQutIWhSvIJaUFE1u9IhFVBvB+9GAPeeluKRv5B6i8XA5Rd3+x18V?=
 =?us-ascii?Q?1qVenPzJX9uLeyNgNC8iZSZiv+4yHrWJoWzr7bdX9wYYX458PFHWUykWW7G3?=
 =?us-ascii?Q?aNMSpkTo5IH8NkSvXER5MaD9cr5YQc0r5kPXe2wcAykgWofp9y4fdeeJlbVa?=
 =?us-ascii?Q?BjpYWUCNPa8quIO7Khzxgx32bFGZ7ZIohOs9NTrL0FUzn9P783ozAgoaoFci?=
 =?us-ascii?Q?PqIViEXpUDmq8IoeF+XWpBBs8QOzYq7thCDbpLDR0JKIzEbpBf0EG7EqfCwf?=
 =?us-ascii?Q?Qg2673jIhNjO7beUGA3LdvGzyKA3uNE2iFSt81FhZQ5Ol7vX83/Y2nd3UmBD?=
 =?us-ascii?Q?94/dxcXREKmVkd3qHk6EQVwVhiJyxbJhDlEhRa0zCqzeg5PAIPz+bDQ7o7WU?=
 =?us-ascii?Q?sM34mUf3by+7KLl6kw91DPI4Zwd/E2ediNbMlTzXcDF1lgK5lLMQGXu2P9Dy?=
 =?us-ascii?Q?+COqfZDvvnYKzUDU/CCMR80K8EGdD1NtwJ82emm7qi3E3e30C1LLt6u39Ul9?=
 =?us-ascii?Q?pzEgOj9D6FaREGnXsJ4HKTTk+yiBvZtQuAqbcpj9n/MHgEMTN5BPPmOB788o?=
 =?us-ascii?Q?zS17UKgvR4bQ4XeRXSynuX37uWh8pGLftmsaNbUOvnbeFgH19oWoidb0T2ps?=
 =?us-ascii?Q?96YqP8XuoHbC8Hu4W/Sz3CM72UhxaQMDD4iDUZ1DV0ANEFB+U068k/UEDyJ5?=
 =?us-ascii?Q?JbLLndqh7y9uyM1c2xV/xlQ9chR9YzUrcJc4iwor9zn+p3POEbRCVPS/CZuR?=
 =?us-ascii?Q?h2wbFMpJL5dArINo5uQR5xlj+WBRNnNIrlwNuF206/rUhEEzZdJ+JameTyIj?=
 =?us-ascii?Q?u9xmEM5VeKBEoYcO28JGf6rglZ3BRqCK8O7IUWGWpjf7QyqOMJklgxUmt0jy?=
 =?us-ascii?Q?s+Q27yeJ6mlrZPo6LPghrz5AbNDdjpieYUzKxs2ZckzaNY8wyNBEvpX3td8f?=
 =?us-ascii?Q?e5tNMdHO+cuUvqWo98ajBouBwA5mwXx2?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:48:05.9161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd82a226-dd24-433d-ea55-08dcc5eedbc9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4355

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

