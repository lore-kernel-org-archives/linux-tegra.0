Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7656DC61DB3
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 15:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbjAFPaU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 10:30:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235486AbjAFP3j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 10:29:39 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15B98CD10;
        Fri,  6 Jan 2023 07:29:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzlNRBz6nQ9UDGDsJbAeAUj1BtXKyC077cv5ZIpanThL2AZ3wT5f0XC/sKL8Mgl9NAUo0S9fEvGXL4DrJxwJSwmViFwvbRKAx1iM7AK8tLGS5nLzStMiAY9hj9MN3QkVXSmchlTswuN/IQ/QpSZqIinWqvIeymw6z0LTkmYNZsGR59XuL1aSe1wIRHsayo6dKOui97UjEoooC0Uo1rULMCdpmX4Gf+bKYiN3I3QalvJ4klaL1BzNZIy3Sp0h1GBHtu7rMAKa7tLNrkxoQBZ5Q0/7404ecjCVd3UywGHsexUC9wd+YFvxWvB2tJI9x45i9Gu4oLPP+adw+sCMQWodjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM6KUc/IqbulPoLcB75niZTNeCw5/ogKpuZKNi+N4kI=;
 b=FxOgORJo9KHi26aytRbu5jDZZLr5vHaUc4TZbuBETw4aZZIeR3lF/Mu4rmTDaIfy402Lh598X1itbIEjIUcxZB0mCAbgizIODpa9MHamr4cUdHm0s3r8sRSJ8CgGUY/GmJpkmui1bHV+5eNYDINHJMK3P9z74PsAAgunxjpslt+oFdQW+3N5TY9jvYfopqNFOArSXrwTUlVgsWFcz8FjjEwY/8/p3xkxrIh6G2tSzXtvsJLv8LwQsRu/dKvsjfcPWDcI8bgrVjeUGV9oSe8XlK0CZSPV/zZXjJubE5/8Rn1bcwuvwvdadUr6X1AMUW10KmBzDF5AWzni+SDjSLj4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM6KUc/IqbulPoLcB75niZTNeCw5/ogKpuZKNi+N4kI=;
 b=RJirIii77vUd4hmpLAEM7/TP+5Cz9/QzI1CQo1eHeprRbLzNUA4F1bc2xu6+KL9h/h0B3pKSc2QosDSgZ+INJjxyqxUaXF0tKDPueI2FHEaXqwPBCPUPA8ZsduTU1qXh2W7qMQU4wrg+dR83Mg3KoYfDUddoAiVgb60Px8pacB/QagJIcwj8zlZeghHgijAvOnSLEG2cgQ0UFF1sNf/KUKGPZb1/+iJP6metFLGnmeyE13vBEW4/A/pJN75m+NZfk0RrKJmTkYs6VmEr8pseTsX8W9DzOIPvy+4RZ8r+QKb0rG9Z/VFJxk1kWs4HYM7LZvof+anmiUMq62bxGSuu2Q==
Received: from BN9P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::19)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:29:34 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::89) by BN9P220CA0014.outlook.office365.com
 (2603:10b6:408:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 15:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17 via Frontend Transport; Fri, 6 Jan 2023 15:29:33 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:20 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:19 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 07:29:17 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Thierry Reding <treding@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 3/6] arm64: tegra: Enable XUSB host function on Jetson AGX Orin
Date:   Fri, 6 Jan 2023 15:28:55 +0000
Message-ID: <20230106152858.49574-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106152858.49574-1-jonathanh@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb10b6f-bc85-4527-e714-08daeffad01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zjI1se6pcjrgaJSztQX9bHFrO/AsRZwAYacs8kVmLBXgWXO53TkaM4Iv3YEOcfLv8zRQLfDE3r5pyerzNag8b7VkBqZ19Lserhu7viktBrAIj6L4St9rjaK6fXfUhJcyinyVWmDd90k4+7WgnlCijgekEpsR4S3sOdgdbwOmvXQW9KfnG2nliO6TFr2SERVxdobhGFWOWlWH+xB4fotu13wyeunouptNJxASlKMsBoHUh7PEwgpNr9xxhlONFXtu7lt1H14IHYpOqTHyx6ypkgS+bIcrprhKVi0g7nrH0+dmnejWJ2gYPOTdNkHLL91lqUt7pPjoNf97uxeq3ya4q+/ExsM3HfZ+ZXzDpz51/V1PyCc9QnqQy/Mk7fswxe7nHyVyv168a1vd/EVc8QK5MmoUhuvKbkT6hu1cB9Izxhh/9j5YdUspfK4L7V8bTy3FjTemhUu+dx0zfwmfn7rN/gDEB5IyvuANdT/qTGmGQeyZP22E4gur32Q07BvQpE7h8UaNqvHp5TzrYA/B8CuzZgqjq9cgj+hbWd3rylnkIT2pHY7ZuDI7aVbLEnYBaP666sG3P+I8U158LMGMQ1WJvBtt5wf8QJ0WnTIScSgPde0HZUEkSsPKA7eexLZbhAi3V4K8n5eI40lLRjuSNmDA4xUfXZ+eABtki3dNDw8c1Q5M+BSpnAtk7s+UX2Lgf+p2EShiP8+IokfQkPBEw88Ew==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82740400003)(7636003)(356005)(40480700001)(82310400005)(86362001)(316002)(40460700003)(54906003)(36756003)(1076003)(2616005)(7696005)(110136005)(478600001)(107886003)(6666004)(26005)(186003)(5660300002)(2906002)(83380400001)(36860700001)(70586007)(8676002)(70206006)(4326008)(41300700001)(336012)(8936002)(47076005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:29:33.6601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb10b6f-bc85-4527-e714-08daeffad01a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

This commit enables XUSB host and pad controller on Jetson AGX Orin.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V4 -> V5: No changes
V3 -> V4: dropped support for the USB device and type-c connector
V2 -> V3: nothing has changed but added the dependency here
V1 -> V2: removed the redundant cells and status in ucsi-cc

 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 ++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |  93 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 145 ++++++++++++++++++
 3 files changed, 286 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 8b86ea9cb50c..4fae2547e90e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -67,6 +67,29 @@ mmc@3460000 {
 			non-removable;
 		};
 
+		padctl@3520000 {
+			vclamp-usb-supply = <&vdd_ao_1v8>;
+			avdd-usb-supply = <&vdd_ao_3v3>;
+
+			ports {
+				usb2-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-2 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+
 		rtc@c2a0000 {
 			status = "okay";
 		};
@@ -75,4 +98,29 @@ pmc@c360000 {
 			nvidia,invert-interrupt;
 		};
 	};
+
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VIN_SYS_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_ao_1v8: regulator-vdd-1v8-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-AO-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_ao_3v3: regulator-vdd-3v3-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-AO-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 96aa2267b06d..32c58aa00035 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2022,6 +2022,99 @@ hda@3510000 {
 			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
 			status = "okay";
 		};
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
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-1 {
+					mode = "host";
+					status = "okay";
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
+				};
+
+				usb3-1 {
+					nvidia,usb2-companion = <0>;
+					status = "okay";
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <3>;
+					status = "okay";
+				};
+			};
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
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index ec8a28a9d380..d71b0b5b931c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1079,6 +1079,151 @@ hda@3510000 {
 			status = "disabled";
 		};
 
+		xusb_padctl: padctl@3520000 {
+			compatible = "nvidia,tegra234-xusb-padctl";
+			reg = <0x03520000 0x20000>,
+			      <0x03540000 0x10000>;
+			reg-names = "padctl", "ao";
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+
+			resets = <&bpmp TEGRA234_RESET_XUSB_PADCTL>;
+			reset-names = "padctl";
+
+			status = "disabled";
+
+			pads {
+				usb2 {
+					clocks = <&bpmp TEGRA234_CLK_USB2_TRK>;
+					clock-names = "trk";
+
+					lanes {
+						usb2-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					status = "disabled";
+				};
+
+				usb2-1 {
+					status = "disabled";
+				};
+
+				usb2-2 {
+					status = "disabled";
+				};
+
+				usb2-3 {
+					status = "disabled";
+				};
+
+				usb3-0 {
+					status = "disabled";
+				};
+
+				usb3-1 {
+					status = "disabled";
+				};
+
+				usb3-2 {
+					status = "disabled";
+				};
+
+				usb3-3 {
+					status = "disabled";
+				};
+			};
+		};
+
+		usb@3610000 {
+			compatible = "nvidia,tegra234-xusb";
+			reg = <0x03610000 0x40000>,
+			      <0x03600000 0x10000>,
+			      <0x03650000 0x10000>;
+			reg-names = "hcd", "fpci", "bar2";
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
+				 <&bpmp TEGRA234_CLK_XUSB_FALCON>,
+				 <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
+				 <&bpmp TEGRA234_CLK_XUSB_SS>,
+				 <&bpmp TEGRA234_CLK_CLK_M>,
+				 <&bpmp TEGRA234_CLK_XUSB_FS>,
+				 <&bpmp TEGRA234_CLK_UTMIP_PLL>,
+				 <&bpmp TEGRA234_CLK_CLK_M>,
+				 <&bpmp TEGRA234_CLK_PLLE>;
+			clock-names = "xusb_host", "xusb_falcon_src",
+				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
+				      "xusb_fs_src", "pll_u_480m", "clk_m",
+				      "pll_e";
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTR &emc>,
+					<&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu_niso1 TEGRA234_SID_XUSB_HOST>;
+
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
+					<&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
+			power-domain-names = "xusb_host", "xusb_ss";
+
+			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		fuse@3810000 {
 			compatible = "nvidia,tegra234-efuse";
 			reg = <0x03810000 0x10000>;
-- 
2.25.1

