Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0914026561D;
	Thu, 28 Aug 2025 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376914; cv=fail; b=DZ10YBy/KMvYi0NRPv8hSZU1DCLMzycW32nUFvu3bzV3pPFA9FlyleTdlBtps/FpBej9E7tlKjaSGs4eGPsZEU5Bkj0KA9cL8njiyRM7g1X6Xe/qxzx4tFvu1yR3aACLhtRaO+lv2ixwWaQStWPFK7eb1x+x5HtdmhJJ9UKiZf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376914; c=relaxed/simple;
	bh=k5oispw7vHD3EA8txEn+Z0QsHcEsfJ96NWFff1dnJSQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UdnvQwbiqSj8zIEcSvJQTSuO4YLRhE8MWd6Bg2TMDsz8uWQJ+gixC75kahmJzrc3/xrlccb+vfQIiF4p6TEKMZ0ggaVgDLpZwxoxHUA8KRP3daiQNHcg8vzoPV9CUD+P+na1Qi1mBoLuBZm7VAS7P+EGQ/hpznKH9OchzPFwaq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sNDtXN0J; arc=fail smtp.client-ip=40.107.95.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sNDtXN0J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXysmPFgcaUUO+amHC9XD+KMDBzS9U/6OxyHWM8hmzfVyGud1c0JNxtbu2DXqNvGC4hBDygwDlQWJFSCORSjvpU2mejCGcwVBeKDjpy98kyFU8PzbBNVYltSdW55B22xZ22opmz05lyH2Y148eDhGqyvmoxpcMp3ytvD1kTF3mXmWVNl8vaIZW5snxVQQEFa46gT2P0p8Y6ztrdLkrkHaP/YIcg6vKeKkFDPpSwQrHG/n6qb8jsidjvYG7HSntdXxwBe07uYj7sSkbS203u1YiwKleWbsLJ9Y/o7/4Dwhoey6vhn0WFi4GEu0OHhArpokXk1ceZRNteQsNLBL31Icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOkThfPG0hiGIP7qx4ze1X2X0CUmAAZ8P9Cpd8Olm5M=;
 b=zEH6g0j5qmKs5Pa4b6j40bFlTCYydXLuqaHNYXKho4xAL5RV259z9IXcmTBItC/weED1T4uJy8Fr6/BJBJySCWjXqlKtPac8v1UNDVGktR+9BZUETrHnEXkDGgxcJXT3T2Sii/BKsOyG+hECu5KxkATnKtV/aO6e8IFJB+bd5CFFk/9V4M3wqi9J5nWauPOQc5BKjPmBkChoa6WyzWazN/V8832uqtUrWb3l6U61q61FktglOCNIQR/pvXLk6WGB+QD8V4KSeAUXDToPFUFDnsD1V9aNA41lhMOKbnDK/vgqyuKZpP9MvxIzTkQ0X9VSWZmPuoC3EU27driCoMONVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOkThfPG0hiGIP7qx4ze1X2X0CUmAAZ8P9Cpd8Olm5M=;
 b=sNDtXN0JI0Ls/QVYjwTcM7NOACyJoxG22kttHAYnW6pDuqZWm9RfmQk7vo1CYP0E4TqAsDU2tqjKNTyi7cO1Rx2gZD1XUKBwU2cb/pR7+c2p3qbd4rrTU6qkP2UAeq08o1ay8RjFy1cTzMaEtmSTThmZz8T1o0CYO4KFU/c78PcOceAJhMQ/NlMPl3wviGKRwAvZA322IC7bLPqGV7unV8DboXOozKDFCET3EMqOuaR5rHiRh9R7t5u4Ph4hYfiN2ddW2PuFyikZgZ8PuCcPp7G90CgzLiDLQKYRa4HCRynErRvfVsHzv+ySD6ka7CErYV09EpkMPL1KsR+mE8RO7w==
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Thu, 28 Aug
 2025 10:28:20 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:11d::4) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 10:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:28:19 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 28 Aug
 2025 03:28:10 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 28 Aug 2025 03:28:10 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 28 Aug 2025 03:28:07 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH] arm64: tegra: Add I2C nodes for Tegra264
Date: Thu, 28 Aug 2025 15:58:03 +0530
Message-ID: <20250828102803.497871-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|BL1PR12MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: a98a09d9-2003-4048-5e35-08dde61d9be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tO9lkK5XRct0ExE49dG3MGJCJNfs4OiLSNul+N7s4AX26ffrVhT45dTtmpxD?=
 =?us-ascii?Q?7pz2wi3f7y6NSoG88+7N/KODjbklTGIU97gwsmhz+vebffc/SsFe7pc0xqZE?=
 =?us-ascii?Q?lyToK/eHMdFDVMKN97XsAWeAegxGl6N9a9mgIYNWUg2AtH/DddmWkNvZIi5y?=
 =?us-ascii?Q?WPs4qLiWMIv8qQnKE50vOtZWxIcv5AxkACF/NO1lH5oQY+6RV/z6Ezn1RdDU?=
 =?us-ascii?Q?Q4yELGgshR6luZxoUIMYRSrvFRCXagtB95bmn81OGi5dUlRuSsZvF69pCLwR?=
 =?us-ascii?Q?xb/tdD4lkjZdSb8CO/AHepj4ebashn+XbhBHUvYsTrcfynZsW9S9Panu429d?=
 =?us-ascii?Q?dBE34SWa1sWl43TT6FCmoW+bfRgmr0CmxMfUyEiK/j+8wp/BbfMUuzCM4X+q?=
 =?us-ascii?Q?TjTFg048456wFTabC5KrJnmuyGSBCaI4emiQ7qsoKI00R5hF1mWcjkldoBvT?=
 =?us-ascii?Q?gbtSOjx0IBGEWUYE4kxCvaeUhcDIi1I0VbKjSu6PSwtS7DbroKTVGOZMT/2S?=
 =?us-ascii?Q?3aFXfY0qO/5Yp5Y0nq5gDWk9ZBE49nNU8YQgCDoHzqzpvH/oTpubnFk15Cx7?=
 =?us-ascii?Q?JLRqERb5/IRwzOyrrUZ7+KtcNS03R+jqMYRjXUlMqqEQENOBJsOmepYFCZvV?=
 =?us-ascii?Q?AtW6p64NlFZ8lphdtuycWKhHHLdLSwoFytjkK7tRvafQnR5LhlQYZf3Osbls?=
 =?us-ascii?Q?tBRqf4TLZkZiIPvhMx3OiwI+eVj3xBcUfHn8ne3j0z24l0IOVXv023fNkqmp?=
 =?us-ascii?Q?wFxxfGxCph+clNLz7u8n/X98plASS9rDRwV/an7yvdplJeIFoDDx3dR0BOoe?=
 =?us-ascii?Q?RWV4hbwPz6yt57wO7ZPQ5OGZ+/GIHdcwOwXzCpPzk1vFM+8sVWJwz5XjhuiT?=
 =?us-ascii?Q?mJGFmoVOh3rzXbHRcDX50TN7dqv8ULwnqHLZ4651Nicdhanhtp/IrVdH+6lK?=
 =?us-ascii?Q?UGxpSjX7WBFbBhuRl6TvJ0DOvZPmUDbW4/QQDkCzh/s1nNRweFzWQaH5cPvs?=
 =?us-ascii?Q?6dtyZvo1uAdHqNdGwj84PtQxaJMLYNFogwuM1yXZcFFrsYdFN3L5/wUnEZPA?=
 =?us-ascii?Q?F/utnlTLpc3ph9DG17r/y6MUBfpB+1hyZeyOKQtiVc88EjdG8VhuxICjV2fg?=
 =?us-ascii?Q?YWJjYpFGdwd0r0/Sr2T2HG4LXbuQWRrjxB7sJS1IuIBJmP5IDtSyn69/GYJf?=
 =?us-ascii?Q?3MtUlD8Wa4LXZSno4xrpf2OlEDLOf9dzne+MkzjuCEMV3CUWVIrR1W5S6Ppg?=
 =?us-ascii?Q?I1w1ThOGIIrTXb+RckCOpzxbC0mJfQ+5YoN5u0o48WDQ80vrj8T75XNuQNjH?=
 =?us-ascii?Q?+C+UuXtxzDVGS+R4cYfTnT5X8JexEOU6vLoEfRjK56xlX1sqowUvX53Y1Z67?=
 =?us-ascii?Q?hCSTJHdyZQzj+5ipDcPbAJlMatJsCrsMVmyjb3KUC8OF5TQygmS9AgJlSebW?=
 =?us-ascii?Q?lr0XaRXIYVXjUYZaTvNXDD8ZC+iqAWv+pCg3dJ0cUVIBIcFFUTGeLfvvJ9Ao?=
 =?us-ascii?Q?J5KuyigzwEmSU+EcSGdcPwDTwev2fsMUK5iW?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:28:19.9031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a98a09d9-2003-4048-5e35-08dde61d9be5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852

Add I2C nodes for Tegra264.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 225 +++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index e02659efa233..872a69553e3c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -148,6 +148,36 @@ uart0: serial@c5f0000 {
 			status = "disabled";
 		};
 
+		i2c2: i2c@c600000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x0 0x0c600000 0x0 0x10000>;
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_AON_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLAON>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_AON_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLAON>;
+			resets = <&bpmp TEGRA264_RESET_I2C2>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c3: i2c@c610000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x0 0x0c610000 0x0 0x10000>;
+			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_AON_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLAON>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_AON_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLAON>;
+			resets = <&bpmp TEGRA264_RESET_I2C3>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
 		pmc: pmc@c800000 {
 			compatible = "nvidia,tegra264-pmc";
 			reg = <0x0 0x0c800000 0x0 0x100000>,
@@ -272,6 +302,201 @@ smmu4: iommu@b000000 {
 			dma-coherent;
 		};
 
+		i2c14: i2c@c410000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c410000 0x0 0x10000>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C14>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c15: i2c@c420000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c420000 0x0 0x10000>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C15>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c16: i2c@c430000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c430000 0x0 0x10000>;
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C16>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c0: i2c@c630000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c630000 0x0 0x10000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C0>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c1: i2c@c640000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c640000 0x0 0x10000>;
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C1>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c4: i2c@c650000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c650000 0x0 0x10000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C4>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c6: i2c@c670000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c670000 0x0 0x10000>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C6>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c7: i2c@c680000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c680000 0x0 0x10000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C7>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c8: i2c@c690000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c690000 0x0 0x10000>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C8>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c9: i2c@c6a0000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c6a0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C9>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c10: i2c@c6b0000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c6b0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C10>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c11: i2c@c6c0000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c6c0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C11>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
+		i2c12: i2c@c6d0000 {
+			compatible = "nvidia,tegra264-i2c";
+			reg = <0x00 0x0c6d0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
+				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			clock-names = "div-clk", "parent";
+			assigned-clocks = <&bpmp TEGRA264_CLK_TOP_I2C>;
+			assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA264_RESET_I2C12>;
+			reset-names = "i2c";
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@46000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x00 0x46000000 0x0 0x010000>, /* GICD */
-- 
2.43.0

