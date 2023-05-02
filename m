Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AD4C7EE21
	for <linux-tegra@archiver.kernel.org>; Tue,  2 May 2023 10:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbjEBKzC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 May 2023 06:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjEBKzB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 May 2023 06:55:01 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F1430F9;
        Tue,  2 May 2023 03:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaIzyIfqxcVnnVTQJ1ffYP4aYLycoavSJrA6QfazUg5Ex7iDTzf5FtF3H1dhNJBY47yMON0cfwj9G9A0rn/7jaDdAv2apN6nlMWmbc2QxNewbsQO++4Ec3Jb4KWx0KWxVwsP3asHwRax/8hBor8PzXqRmw/mupdE2x1NIztM9kzuXzQh5MPAFVYYV6vP7SRRKe5bEeMwvKpLOs5/PFAUGOtT17OH0wgTc3NRrOpgIX76rz4dFYX2DMBqfzAYbJv00ixVQzcLkQ6GbB582XGmh9qA9PtIVl+0y55eVfD/JiD7EDoNZceezU4uQ7b/pmd/totlgi1lSF8sktXXRsxcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK9Evg9SwpH1aHmMeYnBf95CL0wjVTLAhvq/h1IPwFk=;
 b=IJ2UCCa1r+hYrAqaoxDqW3JlTNLeKc5/FTpVpjA7aHK8WEJR+eLkM7VRkvgSUCP1GzOOhcaqP57yYCjqkdoR8lbCwXqZe6a2G7CT8hdQvy57m3gGfDt8dflsnaR+FfnrZeUG3H8Q4+GtuPjD25LeaYnPSIrjeCff84R287LM1s119AbNkpxXO0er0K40aBkl+j6okovRtAB/IoChP+WxnisgeZbAFeNMp3a6S0FI8EIaLckkq7iYctidLGs+rD8rsWnGyLD2BhJZXnyl7/yNW0EDHNFz1IeQdwTbwrD/rN4o9kdBOUrat4ncMC4cwa+DIquhTNA4uU5tIGc9w2vdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK9Evg9SwpH1aHmMeYnBf95CL0wjVTLAhvq/h1IPwFk=;
 b=SsqBdJoQJ4D4c2oraLe7YkT8eMUO0NdNCej9uIB9V7tYWbIN+h1S32edg2E6C3bfYR19pW5blW/A4wDBSdJImKUNGY3Gs8ys4VYXdDhLMSs8mkoQsp+O6XVeuZXAUAuwQabfZfoXr4gRP9hgXHDRobZAkm4iII3vFqwaBpby4yG+WkGUSKRNF35uYwIk21wpUSg3VYIwp0jD9Sv4KPrzdx4UwuCQw4PqNJD6H2gSKDXOzi5y5eIWxAIpjzTVffAzFVKjjOuDsMu8MEI0lwKh8fAe0FZRrEpvf+ytTjq4g/24prXBiZ1vnISvOnTGegbMg4dvnhx4kv5n3PGqN2BXnw==
Received: from DM6PR17CA0036.namprd17.prod.outlook.com (2603:10b6:5:1b3::49)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:54:57 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::7e) by DM6PR17CA0036.outlook.office365.com
 (2603:10b6:5:1b3::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 10:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20 via Frontend Transport; Tue, 2 May 2023 10:54:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 2 May 2023
 03:54:48 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 2 May 2023
 03:54:48 -0700
Received: from build-shgarg-20230103T221109854.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Tue, 2 May 2023 03:54:48 -0700
From:   Shubhi Garg <shgarg@nvidia.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <shgarg@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Add support for IGX Orin
Date:   Tue, 2 May 2023 10:54:37 +0000
Message-ID: <20230502105437.769350-2-shgarg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502105437.769350-1-shgarg@nvidia.com>
References: <20230502105437.769350-1-shgarg@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT006:EE_|CO6PR12MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: afe301cb-d93a-45c1-8cd6-08db4afbab3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgdfATX0XtdJnqDR8t6jkk7/SwA4ervN433bAJ6nxxrESNYp5gyCvm9KL0VW5RJixJx+ggX/iUs9CPjDidXtHhLlXn7iGx5N09S1xwa1+d+Yd50/hwrX2ShxIZdLBrwWMcvK0H8ykqUodjrpOccxiz5mD93+Q6IF+867QMOVZElQ94SSpsDh+rEqqKAIxHs1IvJC+VDTa0S/zFSU9Hgk2gMYcMaawK27p5hg8FE4P6l275JSZRDxen4FwFuOc3W89Sczth7b6P9YMnuent2qTR42aeSfuRDGDUMHFoJwHKKAspyQYDQnQ05H/ihPbJZ5Pe+vJWrA6UGsEOagdarvVyKsc/D19BQsZOTkXQNJ7cL1M4pkxWLcAfT/4ZpP1BhFoNtUUWXZ375aPuZs503xuVL7QK1LogBLqk62zBxs2Z1JO4Pf+GZXOWQVHWKien6z2jaNLipNobcsVqqzwP3es1gpDRO9tlFxdU51WfQ9OFIXTI6eIH/5oCVhmnVMi8L1KXAk3lebhHKZEm0nJjQg1y/aoYg0nGC0oWM89Lzs7CkiC1NWRSOLSHIzLy3YbF0g4HEYdZmu1WJEMh8C5UIPdCHa9yEn9OSbdQJ1zX/2icROHb0FCbI+b0J1LsCgzTyPBpTHTfsHn2diibhQLj47YeGLHpO1IPktVxDrZb1wUyi/KzdHgPrYOU/VacGvX6sERHNX4ZEdu5aKUSgz6o/MIg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(41300700001)(7636003)(8676002)(8936002)(5660300002)(36756003)(82310400005)(86362001)(40480700001)(7696005)(6666004)(26005)(1076003)(107886003)(478600001)(36860700001)(2616005)(83380400001)(47076005)(336012)(426003)(186003)(70206006)(4326008)(70586007)(82740400003)(356005)(316002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:54:57.1744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe301cb-d93a-45c1-8cd6-08db4afbab3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for the NVIDIA IGX Orin development kit having P3701
module with P3740 carrier board.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 111 +++++++++++++
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts | 156 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 137 +++++++++++++++
 4 files changed, 406 insertions(+)
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
index 000000000000..9464da34a139
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -0,0 +1,156 @@
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
+	compatible = "nvidia,p3740-0002+p3701-0008", "nvidia,p3740-0002",
+			"nvidia,p3701-0008", "nvidia,tegra234";
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
+	aliases {
+		serial0 = &tcu;
+	};
+
+	chosen {
+		bootargs = "console=ttyTCU0,115200n8";
+		stdout-path = "serial0:115200n8";
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

