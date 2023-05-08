Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9652CC77B75
	for <linux-tegra@archiver.kernel.org>; Mon,  8 May 2023 10:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbjEHK2e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 May 2023 06:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234427AbjEHK2I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 May 2023 06:28:08 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9CE1703;
        Mon,  8 May 2023 03:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2h6ctCHVatpS0csGbIfLgVLHY4hItQEORij/OawGagz4kHerOqftdCjA1JIaPtPs1ZeIAoLJAGD54TtTDRlChWi0GDan9X66bjHIn22gzPSk8HOaM0B9pA6tRKnhb8a++osW4qnWyR5itdjAWNCLVMhz/SCIZvJGdpE4r9W4T/ccjc/LoA16BxeHHLkAwG58tnj1CYHvgOF2Bld5P9GeuV/5IQD/6H20IVdYZ9qXEJWLHp0VIKRttquFA81Nm5wikYiH0tNhCASfxURwX0FpFLTb5z9vkyLecUItjp5cQUmBwFi2I/tBgmzU3ZtrJT/IuYvJZcY6qtvpor4t59aJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN/0VOvmXOTL6GvvkgDXz+I40dHZM4ydjq4sJIm471Y=;
 b=DrJrXSHbyfxKpermMQknFMzH7kX29rtTFVEPUhfAL0CFR5xtW9Az0E44Faz7JktGM/curECHE6hkLBoRVvO+IdoDu7L4xBNFiocQbBcfqay0NGnAfcwcDwdWWt8dt8kCZ4jhYlNKB1AMiT/lj+i8R2JFChAL/6LssmOYdEdcDtjrYXnRv+FIAJR6BRgIdyMzZO3oR4xDHfatp/zskg8Q6m75PL4/Te2T1qJSeUcxD4/xYjnMcLqOevv+dD7Mb48RUnseFL5qS8ZQ/Ext6bNuWaj4XgPL6Fm0K+Z41nQUwdWUIats0E3YWnEFMVlNTvk2W/oChysOn+KUyxSDI8vr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN/0VOvmXOTL6GvvkgDXz+I40dHZM4ydjq4sJIm471Y=;
 b=Nx5KVipr64SNLQNQdBgGdagGVkuHg2YpCXEx3R7Qu7Kk2BQqBJy08cI6mnTVEXLoGxoscoYZwKWibwEZACSQT4XVTFjm/m8ByqTy4uqTj0DZIdHNgpTR5D+x0jUBsti1sQu/+KYgAPplvPDRS2G8qJfsjGzPdoXlfzLwdpdZ7j5/fm1E7Sj7KEWw51n3+AHrD7thsv6dv+jU0clIgJbpZgi6Y19V2ChCDHk0WOlk4JAzYKn3VBaFK2upuJ6djlTToktLYQ48HmNXOxKJki5tO4w3SfeJ8oJwpgLBJGzL65r1Rv/l7YmRTYHOH5BM8bEFOk0epsgBYiPRtw3AhxpNcQ==
Received: from DM6PR03CA0028.namprd03.prod.outlook.com (2603:10b6:5:40::41) by
 CYYPR12MB8654.namprd12.prod.outlook.com (2603:10b6:930:c9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Mon, 8 May 2023 10:27:52 +0000
Received: from DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::f) by DM6PR03CA0028.outlook.office365.com
 (2603:10b6:5:40::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Mon, 8 May 2023 10:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT104.mail.protection.outlook.com (10.13.173.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33 via Frontend Transport; Mon, 8 May 2023 10:27:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 8 May 2023
 03:27:38 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 8 May 2023
 03:27:37 -0700
Received: from build-shgarg-20230103T221109854.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Mon, 8 May 2023 03:27:37 -0700
From:   Shubhi Garg <shgarg@nvidia.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <shgarg@nvidia.com>
Subject: [PATCH v2 2/2] arm64: tegra: Add support for IGX Orin
Date:   Mon, 8 May 2023 10:27:33 +0000
Message-ID: <20230508102733.1751527-2-shgarg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230508102733.1751527-1-shgarg@nvidia.com>
References: <20230508102733.1751527-1-shgarg@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT104:EE_|CYYPR12MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f1db50-488c-4b06-c107-08db4faee100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75iN26D+VuktMFOTjZVJ1T//38WsblxeOjywVzejh0WRed7vizplZge618l8lHd8MZ5NQHq9dnH6oicYxl0kY2ZGjcKFdoNqspCgCHveUhN3PnVX1KY3MgoDY1UEmedhJwXrl7nuhw812tnDz8V7vnHohNtkSNRyty71vpo3titbUbFyUm3YWGmAQHoumeRnrgIqwyZA2EehR0+oWqZtwKIIZNqkk2CIom3BS4lBef3wW12Z7C8ikfXGdDBevFoG9O8u1u4r2qLwUknz4Pi/+GobDB0D+HV67amykLzNjMk+7Q3difK019rGUnLrDzTUHjGPslB7JEIQ02+PSfAq+LVtCMmmGUYWJZ4Q1uhoxUvK1XMsZjEWpzxE/MTDhsifY8+Ne1y9KS8huHU4sB8r5DwgsXzSkTG5cNiXTKzjQ2sb4aoxHykh2zVddpArKGRcTOuNEYnTeZa4ZU4HtxUjAsHk8wm60mUrx5Cafbqn9SzN59Jy6FkL+C371LuLsx1AZZpZSJgl/eJtNPOoy84lwQ9v14koa7m8aKZn/9jHamTMEBBzbOdyYFCGfRoj3J+MPHvMBwypVXrg9PtXcHRW10YyWqThlWl2dNiD1dM5obKDK4pqaqNE5rUHOJjMhQb0180nUABdmvWldSrH8Ppvd1yfaGnZ4fG1ByrUJFik4lj5+P31+8O5GFvWQVFw/NxV+WyIdQKQEYKBcYJphGTPgw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(36756003)(4326008)(2906002)(70206006)(86362001)(2616005)(336012)(426003)(82310400005)(5660300002)(8936002)(8676002)(40460700003)(316002)(41300700001)(40480700001)(70586007)(110136005)(478600001)(6666004)(7696005)(186003)(107886003)(1076003)(356005)(7636003)(26005)(82740400003)(83380400001)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:27:51.9477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f1db50-488c-4b06-c107-08db4faee100
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8654
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for the NVIDIA IGX Orin development kit having P3701
module with P3740 carrier board.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2:
* placed aliases and chosen nodes on top of dtb.
* removed bootargs property since it is unused.

 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 111 +++++++++++++
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts | 154 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 137 ++++++++++++++++
 4 files changed, 404 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index 1406d5d40b8f..2ea0058979d3 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -9,6 +9,7 @@ DTC_FLAGS_tegra194-p2972-0000 := -@
 DTC_FLAGS_tegra194-p3509-0000+p3668-0000 := -@
 DTC_FLAGS_tegra194-p3509-0000+p3668-0001 := -@
 DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
+DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
@@ -25,4 +26,5 @@ dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
new file mode 100644
index 000000000000..e468352b8b7f
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra234.dtsi"
+
+/ {
+	compatible = "nvidia,p3701-0008", "nvidia,tegra234";
+
+	bus@0 {
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+				label = "module";
+				vcc-supply = <&vdd_1v8_hs>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
+		spi@3270000 {
+			status = "okay";
+
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0>;
+				spi-max-frequency = <102000000>;
+				spi-tx-bus-width = <4>;
+				spi-rx-bus-width = <4>;
+			};
+		};
+
+		mmc@3460000 {
+			status = "okay";
+			bus-width = <8>;
+			non-removable;
+		};
+
+		i2c@c240000 {
+			status = "okay";
+		};
+
+		rtc@c2a0000 {
+			status = "okay";
+		};
+
+		pmc@c360000 {
+			nvidia,invert-interrupt;
+		};
+	};
+
+	bpmp {
+		i2c {
+			status = "okay";
+
+			thermal-sensor@4c {
+				status = "okay";
+				reg = <0x4c>;
+				vcc-supply = <&vdd_1v8_ao>;
+			};
+		};
+
+		thermal {
+			status = "okay";
+		};
+	};
+
+	vdd_1v8_ao: regulator-vdd-1v8-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_AO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_1v8_hs: regulator-vdd-1v8-hs {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_HS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_1v8_ls: regulator-vdd-1v8-ls {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_LS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_3v3_ao: regulator-vdd-3v3-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-AO-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VIN_SYS_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
new file mode 100644
index 000000000000..43d797e5544f
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include "tegra234-p3701-0008.dtsi"
+#include "tegra234-p3740-0002.dtsi"
+
+/ {
+	model = "NVIDIA IGX Orin Development Kit";
+	compatible = "nvidia,p3740-0002+p3701-0008", "nvidia,p3701-0008", "nvidia,tegra234";
+
+	aliases {
+		serial0 = &tcu;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	bus@0 {
+		host1x@13e00000 {
+			nvdec@15480000 {
+				status = "okay";
+			};
+		};
+
+		pcie@140e0000 {
+			status = "okay";
+			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
+			phys = <&p2u_gbe_4>, <&p2u_gbe_5>;
+			phy-names = "p2u-0", "p2u-1";
+		};
+
+		pcie@14100000 {
+			status = "okay";
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+			phys = <&p2u_hsio_3>;
+			phy-names = "p2u-0";
+		};
+
+		pcie@14160000 {
+			status = "okay";
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+			phys = <&p2u_hsio_7>, <&p2u_hsio_6>, <&p2u_hsio_5>,
+			       <&p2u_hsio_4>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
+		};
+
+		pcie@141a0000 {
+			status = "okay";
+			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+				<&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+				<&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
+
+		pcie@141e0000 {
+			status = "okay";
+			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
+			phys = <&p2u_gbe_0>, <&p2u_gbe_1>;
+			phy-names = "p2u-0", "p2u-1";
+		};
+
+		aconnect@2900000 {
+			status = "okay";
+		};
+
+		serial@3100000 {
+			compatible = "nvidia,tegra194-hsuart";
+			status = "okay";
+		};
+
+		i2c@3160000 {
+			status = "okay";
+		};
+
+		i2c@3180000 {
+			status = "okay";
+		};
+
+		i2c@3190000 {
+			status = "okay";
+		};
+
+		i2c@31b0000 {
+			status = "okay";
+		};
+
+		i2c@31c0000 {
+			status = "okay";
+
+		};
+
+		i2c@31e0000 {
+			status = "okay";
+		};
+
+		spi@3270000 {
+			status = "okay";
+		};
+
+		hda@3510000 {
+			nvidia,model = "NVIDIA IGX HDA";
+			status = "okay";
+		};
+
+		fuse@3810000 {
+			status = "okay";
+		};
+
+		i2c@c240000 {
+			status = "okay";
+		};
+
+		i2c@c250000 {
+			status = "okay";
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
+	serial {
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
new file mode 100644
index 000000000000..c95063b19321
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	compatible = "nvidia,p3740-0002";
+
+	bus@0 {
+		i2c@31c0000 {
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
+		};
+
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
+	};
+};
-- 
2.17.1

