Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DE390235;
	Wed, 25 Mar 2026 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474052; cv=fail; b=D98Qt2ssWHieun3PKfpvx4/7+9KQ71IEh5PCezbmu5Z2ras63Hec6P1r+Rw3qBFdQNSj6wgBOfrywRRfW9sSH290wHsKwqT64ZCPPjV0FrJhIf5aI3r+QBxZZd3JUcQeqJItAxCytj9t4git7J5YnpMf2uUrh58CCW2L4bY4v4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474052; c=relaxed/simple;
	bh=Q7zmej0J+esiCdz2WGAYq5AZ7nrBJV++J+79vRvyM5g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdPdW8StjZrJHC8aLfDor5sp7H83vNcaUnq0ciFqc3OBS1hzroKStb2ZftdyiXHx/iftt/C4UhlnfcKNM8Q+u/1GuJCUyPlbMqTeUlHMnuhPJp6xyOJn2dmQwOM1UeE6cDGBHyxQAANIrzcBTRR1gDOExqm9cMMSNRU+mZMS0cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IUjYuJDv; arc=fail smtp.client-ip=52.101.46.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IUjYuJDv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM6BLskCDpNmJYS/CU6D8NjxDH6FM1DBQR0AlA0D3J0K41e6TIB8mEDfG4/VMEJuJRmft2ApMoIIODFPSv2s06llZ6WWxLoWeNrKfUH6vbEWar0R2pw29RAtWqArSL8L75brCX0YN8dtpIfr+ESLnoIA7na84K1+lOT7j2WOSTlfBPH5BJJ3r0+e/TXk1u+BvUGoLJZpYU/GTcZ4m1Fso9CwU6iBSU82UlcJSpXD3odlqx10DwteAF3yQ25YXBLgnzqN6pTppID+9yn/h9yZnjd1JnbL75nLvRX0wQla+4emCi1u1zvqlCl/9RlVIcPMrwqnzNRULkCZlQOUNIWz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJcL59DDeHQqNSglyNKAZ21jftS2zXKqAgws5Un1tVI=;
 b=omjvUhcHNJpk/dJsC9OIQs9But+z2U3N4mfGFLJyqv6RFCpHjacHKpVCjOTOffectW21uIpc+hb2CLrHA1yU6fm7+gQjP8sDBu5MgAuuhAKQ9VGyCZoOhKp1hTN8Wu2F2ZbfHHXtoA1OxQVpduG+gj/q3iL7CmmBW2peDRx7npIu8E0nADkFBIYOV2K3U86NiduhJcKyBr3+6Tt58G2+ikM9a1NANmlGB4pfNwcu19IyevX/F5Tm8m8/u/PKd/IWdR3srrm/SGi88sBBg9qmckv29mPSputGSt0E+kaSlD90SstPAPb7z46smCNhKzNBsZcvQ0Cjej4v464w+AKrrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJcL59DDeHQqNSglyNKAZ21jftS2zXKqAgws5Un1tVI=;
 b=IUjYuJDvx6Ziymf/85RREROIOcJV24xwzMueo3ILEeegzkoyqoSYl+uMB6XSzvhzruksMiRLUOtkukjsI2FpPxXvSYJ+8QXxuGvMdR3UeE2wod6I01PAiRnPl8hfJtbFo9iXz/TKPSiqge+uTOHGTLlnnfOsp90/3RTW+kufSQMP4P+qLkxByX+55j1rH5fVHy9EXBKq4aRLGJ9pRK9KCmE+pVstNV8VpnfLF3RhaBy7MtonZwSg6aFKT9ekt5BO64NCvNaW0t3qwSelUQztGGG5Cdo7ZS+a6iyRQjktBeSDz5PZfY1tIEUXqX7DK56NJzOU2TnlqFNjDSbmDE6V2Q==
Received: from CH2PR15CA0006.namprd15.prod.outlook.com (2603:10b6:610:51::16)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 21:27:25 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::e2) by CH2PR15CA0006.outlook.office365.com
 (2603:10b6:610:51::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 21:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 21:27:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 14:27:06 -0700
Received: from build-chunn-noble-20251215.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 14:27:05 -0700
From: Chun Ng <chunn@nvidia.com>
To: <linux-tegra@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <chunn@nvidia.com>,
	<ankitag@nvidia.com>
Subject: [PATCH 4/4] arm64: tegra: add e2426-1099+e2423-1099 support
Date: Wed, 25 Mar 2026 21:26:28 +0000
Message-ID: <20260325212628.1234082-5-chunn@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325212628.1234082-1-chunn@nvidia.com>
References: <20260325212628.1234082-1-chunn@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6d375e-d569-4ede-bafa-08de8ab54f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|42112799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/I1JkZ7rcT94pArLnrPahKNZY7OJI0sRbt/m9qNI2z/WV1cy+MQpYHtlp+Ks7b5EFzOkgvcVI4Ar9aeGneqhVnxt9wUvT5pdlON8LdBAlkZ+gDm1uuOKxnecDULzcJYYKL/SsqwUB0d2OEHLA1ZmVrFY9kg3y3+rmABSfyvcld1Zi4P0HSz6VZQ7NXts6y/WiF6YoQTjvqdVsj9zqSZrZedkOuoEjTNXNnwfFXsAl/IEaw9t3/Dh/RIaeUqqwhnceeHSte/Lx+p05lZuz1LT/WmC0+aBhCMjdCrtK0W5C39Z7fKnl+5NXkJOStM1/sI7aHmDIOKqUMI2RdUPIYiTZc+wtU5sAaPu+EvVQCqui9NJu4n9vrxt1bJ13w7ZOoh74Hy9Zjx8Qwy8Gl4kM7oKthun19WXdKvI4/drdyp71AejJ9gjYcrKUQ94a6i3JoVRR96VlZqtCZ9lzg8BirtfrIm6r85Rw9FyZ932hpMnEDG2H7SdHysv+cMo197Pxngy24bYxno24i12mGfEmcMT9eMa4onGrfqFH4Uhy/FTCkhbhO4dU0/V4EOB5eiuOlo8JzBYEPD1uUw9pDSXjxT0CWzjUM1dzBKmpqWD8h2InPqZMlApfVwwee/pM4IPqAFzo9ZcNCYetohwKUWc1ZDOEHMi9BLOolos5njjxKWvTwog3iZnkLdzevnGz9eFvOGnTMhP/iU09zXvGYSj3svxkyt5+dXshISUjzOpV3zpM6BpuYqwfeIXO+n0IgVEISCdgR539Tv4HnbbvQEQMoabhw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(42112799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0g+Ssq+6FledkgnznCVw+zyC3Z29kYnls8jFQNfWFUHdYzFlq1z7KcVAsbpScmrfhS+Ut0t+mZ8K4o1Pv3GyEbEgWKcfHV6hSgu0VOEgP/7j62PB3VYtK+zSN25v9UxWHxy7PHS9Lk7+yWB6Ge5liAKXdMXqjIkYXDcrHvMqTRiFnv4UtUnOmVoOkHSG8VFH5lIWAExRgQ2GnFKT4T9zgCRnGtXOWWc5CzCxJKZjXTM3P/EIE/GZyWTyzPCyKpbtJRaDU/3Qr3VshuNTAptDFlOKoAdNvxstIxNf563UUyRhrOCttrLbPZYegiyZpqdAC0La0IGcXckwbelzf+6ZWTgFB3lodoHbGmZyqOdN/EfZKyAisT7AgZt6SxjGrpZtX/h+Hhy3wjKq8WRJYN0fssqmA5BG7LwmMFAEi7JXjMzXrDLk6g0GPYt87e2ABjwn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:27:25.1157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6d375e-d569-4ede-bafa-08de8ab54f07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028

Add the Tegra238 SoC device tree (tegra238.dtsi) and a minimal device
tree for the Tegra238 E2426-1099+E2423-1099 engineering reference
platform. The device-tree is not yet bootable and further enablement
will be added in follow-up patches.

Signed-off-by: Chun Ng <chunn@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../nvidia/tegra238-e2426-1099+e2423-1099.dts |  16 ++
 arch/arm64/boot/dts/nvidia/tegra238.dtsi      | 190 ++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra238.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index b139cbd14442..a5357809e222 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -13,6 +13,7 @@ DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
 DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
+DTC_FLAGS_tegra238-e2426-1099+e2423-1099 := -@
 DTC_FLAGS_tegra264-p3971-0089+p3834-0008 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
@@ -34,4 +35,5 @@ dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
+dtb-$(CONFIG_ARCH_TEGRA_238_SOC) += tegra238-e2426-1099+e2423-1099.dtb
 dtb-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra264-p3971-0089+p3834-0008.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts b/arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts
new file mode 100644
index 000000000000..d69ea2114e23
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/dts-v1/;
+
+#include "tegra238.dtsi"
+
+/ {
+	model = "NVIDIA Tegra238 E2426-1099+E2423-1099";
+	compatible = "nvidia,e2426-1099+e2423-1099", "nvidia,tegra238";
+
+	bus@0 {
+		uarta: serial@3100000 {
+			status = "okay";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra238.dtsi b/arch/arm64/boot/dts/nvidia/tegra238.dtsi
new file mode 100644
index 000000000000..0570c3b20e62
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra238.dtsi
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#include <dt-bindings/clock/nvidia,tegra238.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/reset/nvidia,tegra238.h>
+
+/ {
+	compatible = "nvidia,tegra238";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	bus@0 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x0 0x0 0x80000000>;
+
+		uarta: serial@3100000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0x3100000 0x0 0x10000>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA238_CLK_UARTA>,
+				 <&bpmp TEGRA238_CLK_PLLP_OUT0>;
+			clock-names = "uartclk", "apb_pclk";
+			assigned-clocks = <&bpmp TEGRA238_CLK_UARTA>;
+			assigned-clock-parents = <&bpmp TEGRA238_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA238_RESET_UARTA>;
+			arm,primecell-periphid = <0x00051011>;
+			status = "disabled";
+		};
+
+		fuse@3810000 {
+			compatible = "nvidia,tegra234-efuse";
+			reg = <0x0 0x03810000 0x0 0x19000>;
+			clocks = <&bpmp TEGRA238_CLK_FUSE>;
+			clock-names = "fuse";
+		};
+
+		hsp_top0: tegra-hsp@3c00000 {
+			compatible = "nvidia,tegra234-hsp", "nvidia,tegra194-hsp";
+			reg = <0x0 0x03c00000 0x0 0x000a0000>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "doorbell", "shared0";
+			#mbox-cells = <2>;
+		};
+
+		hsp_top1: tegra-hsp@3d00000 {
+			compatible = "nvidia,tegra186-hsp";
+			reg = <0x0 0x03d00000 0x0 0x000a0000>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "shared0";
+			#mbox-cells = <2>;
+		};
+
+		aon_hsp: tegra-hsp@c150000 {
+			compatible = "nvidia,tegra186-hsp";
+			reg = <0x0 0x0c150000 0x0 0x00090000>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "shared1";
+		};
+
+		gic: interrupt-controller@f400000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			#redistributor-regions = <1>;
+			interrupt-controller;
+			reg = <0x0 0x0f400000 0x0 0x00010000	/* GICD */
+			       0x0 0x0f440000 0x0 0x00200000>;	/* GICR CPU 0-15 */
+		};
+
+		sram@40000000 {
+			compatible = "nvidia,tegra234-sysram", "mmio-sram";
+			reg = <0x0 0x40000000 0x0 0x72000>;
+			ranges = <0x0 0x0 0x40000000 0x72000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			no-memory-wc;
+
+			cpu_bpmp_tx: sram@70000 {
+				reg = <0x70000 0x1000>;
+				label = "cpu-bpmp-tx";
+				pool;
+			};
+
+			cpu_bpmp_rx: sram@71000 {
+				reg = <0x71000 0x1000>;
+				label = "cpu-bpmp-rx";
+				pool;
+			};
+		};
+	};
+
+	bpmp: bpmp {
+		compatible = "nvidia,tegra234-bpmp", "nvidia,tegra186-bpmp";
+		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
+		shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+
+		bpmp_i2c: i2c {
+			compatible = "nvidia,tegra186-bpmp-i2c";
+			nvidia,bpmp-bus-id = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0_0: cpu@0 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x000>;
+
+			enable-method = "psci";
+		};
+
+		cpu0_1: cpu@1 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x100>;
+
+			enable-method = "psci";
+		};
+
+		cpu0_2: cpu@2 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x200>;
+
+			enable-method = "psci";
+		};
+
+		cpu0_3: cpu@3 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x300>;
+
+			enable-method = "psci";
+		};
+
+		cpu0_4: cpu@4 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x400>;
+
+			enable-method = "psci";
+		};
+
+		cpu0_5: cpu@5 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x500>;
+
+			enable-method = "psci";
+		};
+
+		cpu0_6: cpu@6 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x600>;
+
+			enable-method = "psci";
+		};
+
+		cpu0_7: cpu@7 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x700>;
+
+			enable-method = "psci";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.43.0

