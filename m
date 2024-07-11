Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55D16D9C4;
	Thu, 11 Jul 2024 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717893; cv=fail; b=Tw1VnHR6/dCLrucIDX/Qt2AO4Rsn26Yy7oZ+xvsDqJubK44B1j4MHiK2qfSc2vvaH+TRwOFd9Bvv5bCZWq7nONJeQgSIGHIyDwLwdjZ4swW/tfYTS22sE3MrEAW1D63uOJQRoWAhprmTF0C4Q/91LegTpxMOX2OPqnralePKyBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717893; c=relaxed/simple;
	bh=LN0abGrSgnTU/F/RCp2jBBWChirdAB1+VIx8rA0YjmQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXJH700SWdEuOAi/Au6dbQattF8/IuoqvMQQy9dI5OjOosQYiPLbXngzzF+uMd064CWM0ajwfV5i1od098M+GpqPhmECXzk3+jKG46iAFT4IZ/pslcBwV3adbABoH0IKvoWfsjrz96cQKCGRd+NK0ksvUlm6A2oim6MPKFzdLHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NNf8yEid; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NNf8yEid"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHm2hyoTiv0LhASWQdgBBBHDuWGFF4wz3ycYQZ1DQROSAVJlZTWr4a3kB3SJBMGZTxBs0xEYSSwaFSo/R+LpY8pP5y2XS1haAxO5CVnhaf06XSPvxo/IiBl1Rrg6CbLVB5A/TIIwDgv6eJf+MSCY6ZT9oWHrH50lanbCtAhAkSph1arjyu8f0fqpoAOIT/WbEhPiys0LkO+8Z9MfWHkKKYvQcBC/PwlMNJpBssmhyOzcvlFmciOu4tGUvARBy7gccnBbxR90KJYlqmnXZk8i6LItlxltL/bATQ33kjmOoJnHlK6U0X2ezoUUgd15gyxgsON3r+A32MASrOfEwOEBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wG6xOg2JaI2mrGuleWOHIZm/QqY45dQl00bDm9/zeNI=;
 b=tUR8khir6ClPZENAAkJ8l4EGrMkvqqVd67443/V5Asu6zSOEnSczkuXt0Y8OBxvpvPkkk4Oe1Chdop//8w5ph/yO7QLUioPG3FnjcNAPuhIH0YlLuQBWE7BnHa8wZQ6bITSO/YwimNbl55+B9gJQ/xFivMbqIuv/Yj7BwSklZgVg4gGLETTPUCnQApfUWNtWihnm7wNF50RVMwKcNZQhi0rhjk1kEnFQlspYE7qwFEpIH2NBmy6HRNEryFpBzk5FOb7TiUOTvuUenEIY6DeLU9Yf8/Dh/OKq4Gavwq7V2gFXnhdi58PJU0G71YzwtN37N5YsfXXUVGzP+1rnlEkDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG6xOg2JaI2mrGuleWOHIZm/QqY45dQl00bDm9/zeNI=;
 b=NNf8yEidcuU1j0/cVGcPA2E4/MXY4JgVhAbIQHYzZCAlAA++wMaDzUr1YCjrRU0Ej9FikZIBOua3zAJcemSHmaENF1T6/FzjSh0wmqmd4+NSLACbynbrNkSIwbYeZQkCJDCfvK8zw+D8nJr5hs1lpjVzuXOlnutBIyqbCPG5J7QWEDD+sYiejwBsbXGJNCTB2gZbWKqg2gltbMId18M/BgKsLw1YUXHXQdnMPto2JJcVYTauQgQV1A+DFx2bhTBMsq3iLdmWUQ+ZgcV0PAJ+cNaSLCgH7HQHTHnW4TXp15hwDhmFVsKRUHVQC9i2VdrPAfNPMa4ZpNJTtZ37BcJKfw==
Received: from BYAPR21CA0010.namprd21.prod.outlook.com (2603:10b6:a03:114::20)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 17:11:28 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::a6) by BYAPR21CA0010.outlook.office365.com
 (2603:10b6:a03:114::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.11 via Frontend
 Transport; Thu, 11 Jul 2024 17:11:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 17:11:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Jul
 2024 10:11:09 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Jul
 2024 10:11:09 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 11 Jul 2024 10:11:09 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH v2 1/2] arm64: tegra: Add DMA properties for Tegra234 UARTA
Date: Thu, 11 Jul 2024 17:11:00 +0000
Message-ID: <20240711171101.2798971-2-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711171101.2798971-1-vedantd@nvidia.com>
References: <20240711171101.2798971-1-vedantd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8dab6b-68d7-4d50-3e3b-08dca1cc80bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HCTsPYL94qeayi6/+5+ed/zuooQEsu31xzG0BCuZX8/zJE2vZBF0MTM4aZux?=
 =?us-ascii?Q?C4wHNd5wwHU/Z+dsx6KxSJDcrO9JlV5NUatfmPTYjZJ8kTPyHCm1GNBAhyDv?=
 =?us-ascii?Q?npXMOIIUJRkSp6DS3eObx8IVQx0JWLsSq+ZYDcvorNocbpc/h1ivMPLeWq31?=
 =?us-ascii?Q?qqKtKCCX4nBxwJzgjNYdENfQtFzz1ADEtWseA/RjAiCYw++FkpvHAuBdYckM?=
 =?us-ascii?Q?tzhv1uiehQiYrM84OJHVxGXzPi8rd9Rmj6TmHPoLnAvdQLCIkDd8vWd8xzxX?=
 =?us-ascii?Q?S2y2WFIdBDc0WqNDtslb58gs5nw1kJ8zypBOmceXdX0X0TLlXQReeNkPxb60?=
 =?us-ascii?Q?fxY631cO5uW95KweByweWk5W2x0ByVjgo/vJechav/Md/pPlbsh64/8TS8sX?=
 =?us-ascii?Q?cba7kvJSkGm3oBdrJVhSf0pWNfjQZ7JhUMN28rO+6BidSn+qf0EtYsTMi4Hx?=
 =?us-ascii?Q?s+p8Tpd2c15V8xr+8mc2GLXJPcyXHBK/tCzT8Aa70btfq2PsiSCX5ubdlBfU?=
 =?us-ascii?Q?Pmi/m5QIkdv8z4DbMXtPkc+UGrZSkwcf0d8gdyersFEkmLGGMxff2qRXoMqW?=
 =?us-ascii?Q?qaMAAMUANTtb+nQFpXR6p1Vxzi8F3TMp5YwJK7Ijtk9JfZtCIfArZKtczhSE?=
 =?us-ascii?Q?5mJUjE1+Paz7v0Rdjo/GSjr4CcgQIbR4I5KK0dUkQ86EivGJie6rXUtSbTRF?=
 =?us-ascii?Q?6kf41DEVHUjGEefgPN/rAlv42c5FL5rSj7dljORJ3WdY/gyeqBNpqsXrlHsB?=
 =?us-ascii?Q?DqPPKCa4ve524MAzOwlInxFbbyMOJObetD3fXBy5X2eQci+raSirBOjIgEBA?=
 =?us-ascii?Q?gE1ecm76qcDPAtmBB+um19zSmcPA+UIvHAp5mASObrmKFo5UgI5+k8ER8XTR?=
 =?us-ascii?Q?/ZXJipLD7RWpFG+s2/qSldznKT7UpN3M0MFhOgXG7m2hQRosRPNQKxK2Q8yX?=
 =?us-ascii?Q?6CfxxtS5fGIRJyHVls6YWtgVPL1ccE/gJjy9DHwFs3pR4/hslFapf+mhmvbd?=
 =?us-ascii?Q?+jjDlZJ9p5gJtNF0iGdBM99UhcpdTOAXwpWEXhQbuzuISJkv8nUqlL1DpF80?=
 =?us-ascii?Q?Ymg5sYEo5wc818qqB9ZUjTl2cTtUCCi5tcifD2tfrf/tinlne1lwCUFx0Wr2?=
 =?us-ascii?Q?Glj8LoJsNqSb4g9EeOB8FS4zwe5W/VN8APYrRMPOTzW54d8x7ywI5tKomx0e?=
 =?us-ascii?Q?4R9Ua8o2KE0uL9DP0xU/YNzel5S7cccYQr9Ic0PLmcNG3NEL2CoPnvlJM7Lt?=
 =?us-ascii?Q?OT2CugdXgkklzEpiOjaWSpw0ngJH757Eg6lCao2Q4abHw3lvwmLAMFaKacyd?=
 =?us-ascii?Q?Mg6cIMKwDHz8WyyqILVkZxcFzfC/umd9J4tKHtD8RH+rhzAZJ2LTcnBCve3S?=
 =?us-ascii?Q?CDHEEYZmTwgEgFY0PzyT8IUQbgnI1xXS06A3lvShUw4SQX/q8dIS/CrmJzYe?=
 =?us-ascii?Q?Cho8QBrOgUABouD9612JzYZ0mqY6kePe?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:11:28.3425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8dab6b-68d7-4d50-3e3b-08dca1cc80bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097

Adding the missing dmas and dma-names properties which are required
for UARTA when using with the Tegra HSUART driver.

Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index f2e2d8d6845b..ce7d4e172300 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -2763,6 +2763,8 @@ uarta: serial@3100000 {
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA234_CLK_UARTA>;
 			resets = <&bpmp TEGRA234_RESET_UARTA>;
+			dmas = <&gpcdma 8>, <&gpcdma 8>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.25.1

