Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A54218BD;
	Wed, 21 Jan 2026 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992381; cv=fail; b=Rthy0v/pNUA4pGYIxAJVOjYZy7cfblwMob89zNH0EIwG4DWwBv37LRVp5RLKahuZhtXyUKFLzhwCHyG2yWW9fY9OtAwogw7j0GsAnJryTuiA3Y2n3b+ZqZwqxNF57vzNrxNFh0nOnlNQVCLX16/seP3x0wJjdBNHKX7Xq0fJFTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992381; c=relaxed/simple;
	bh=Jwo7j2qcwXEfZXfrU80SVvKiMKCdVdTOKU5yJG8eG78=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aY3ZLsolQTmdlozWeRFNy8DiepHlo+NIiTf/i1LRkLusUTXkhP7Knve2NyufR8CP/jDTPABUCm1Sixzi0Y7j9LqqRRQk5Rmp6FbuwTDUnoR0XA9ikNNWLOeVEWiD3BoDUXv4ZUHwEBYQe+77GMcv10vR9AHYS+kVnWaerWnEUPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dLyybdbR; arc=fail smtp.client-ip=52.101.52.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dLyybdbR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ch/zi8d1J37LpsN00RpkLwMLdPDRTsQ7I+L3gWgU7Yl+04e0SITjbF5f8IfVKcab0ayA0XBZUPaOSZrxtZ1t9c5v6Tb+1Fw/W7b5707+AiT378uN3ED7NxeIEcjAIKDqsMnxoOIeY6n28rQShMQfF1owbldE0Pwvs0m0WZyxwnFlKlvGcHDpZkOAM5bXr2SrtiZIJ70Ud8zF7/PkZYEF+NlL8L2lCsFCLr1fDNIjd1NtlpDd+jVNTpPFF6b3hGbzJUbGm4f6sCuBAC2uWJP09tAmefEBLNmoZI+BuNz0dxKgYPgH5Fhv30MavJmSw0iJAZPyjzIna4JA15CXyh9KWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWCrkFzmO1oIIHmYkiB27CvMmnvSSdw8w5bpRT5DltU=;
 b=TOIukRJ0HRCndHZORp8thRTG4vUivg94bF4ZJ8z/AUqBJNwPtg3lYelVAcZSFYOiP0atFcWZq+slg40d52sLVrQRx9kSmaVB0n0d60bWkJ9kd2/xx9pVCCCAYcl34K4orYaL2aYUN0ScxS2sXexLRwKEyRyeahVxcTuibbQTvWeGjXYSyVvsk5BvYoIAEq2aJeNFU+Jo2En2/FyDR2j6QaZn1pNBxk1zUcoYSs4wdm2+U16zup66BIXMgKTqnpj/QntOz/aGkE6srNaPM4kx8Pe5I/igM41nIjUDud74i32n157/MGDBabhn02JE3n0C5jQmmLR8km/Wi20QVuQNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWCrkFzmO1oIIHmYkiB27CvMmnvSSdw8w5bpRT5DltU=;
 b=dLyybdbRFwWytA9jqqG6ogjbNdksTp2JYw1crnEwbtl8YsZH+Rdk73mxc0hiaPnDsZFzjiOslTX7NGVWBJqz7KfNdrXxlVH52VXMOu89Sv3r9tddX9Ss8CQgo1CfG/tsWoVlL+mzJ8bn3lcenInvdxgVHSX1aCMR7YYMS0hdzDYpWyyo9vMlh+W8/RafIHkW4qNf1PEONcxBt2XdXIl2n3sybpGD3ZiXVBvWzVv162/kUgqwY3FO49D7y1cQwDzxyu0o+fKS1Oa25qwzZGGGcrtEpfppk6iM82B1lci8GadAcPSpWJDTj/SYnXoP6NwLX9SQ0ooN+sPu1XGCZgXTTA==
Received: from SN7PR04CA0199.namprd04.prod.outlook.com (2603:10b6:806:126::24)
 by LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:46:11 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:126:cafe::22) by SN7PR04CA0199.outlook.office365.com
 (2603:10b6:806:126::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:46:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:46:10 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:56 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:56 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:45:53 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 3/3] arm64: dts: tegra264: Populate CPU and L2 cache nodes
Date: Wed, 21 Jan 2026 16:15:36 +0530
Message-ID: <20260121104536.3214101-4-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121104536.3214101-1-sumitg@nvidia.com>
References: <20260121104536.3214101-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|LV5PR12MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: ae91e7fb-5b34-4483-c672-08de58da4a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7FMgCh9VkHDblN+dJUy6ZHP9OWmIEmZjE57Z4kZXH1DX9ZEHe+1PhjBLYQqq?=
 =?us-ascii?Q?1Y1E7INNNFWPAFi2IeZPZpq07nuhuPeLDLcgtoSFTRjqbcBgrJw8yesioY/8?=
 =?us-ascii?Q?LuyfYkxwrgsaWpsmWsORU6XNnnNYNym/skj+TLCTes7VDDtgR8nFYQCoOfCn?=
 =?us-ascii?Q?w/ovQMvKJFDKVAfc43ceY8qnAI3Z5yUcEs1aiTwwrEQG3k22i5uWjvNA9EmZ?=
 =?us-ascii?Q?cEeSjIsB5r6S244dEIvbLMRE+SzlKNAUAk51lViKx6lWTZRl1Lfbn2Thjany?=
 =?us-ascii?Q?nOfMiMNZwC/ug34Cs+xPEJr7HXL7xxMzzNZzwsZ0grGUYednNxD/NE5lrM4U?=
 =?us-ascii?Q?NMAXJiZ+XUGnwdGBwILBuAQdIOQrw8F+8CfhGPva0KpAV4q5qPulpcuJ0YCH?=
 =?us-ascii?Q?JgAzFXKNs9DnxEvQhgxpc4ALSZdE4pwtkTiEZMcbNXUWLu4DuWDWlZOIVUyc?=
 =?us-ascii?Q?cZeh0+MZ3CqL+LKP+BLItRFO4XHW9T0gp3jaRQxHZCbeDYAZmEt+fbQWe0bw?=
 =?us-ascii?Q?b2WHZiJ1sMz7Ie/TXSxIIgpTeNNeNtNTfeMIC3qjS6r9TwuZsaJYIrJRpoz3?=
 =?us-ascii?Q?1t3E4uFSe9q6Ch+R3es4PnYdsgOJxPOaO7af1EXrvwi5mMbD+z6E16LuKAs8?=
 =?us-ascii?Q?OkRyC4ODFTfF4gZwZD4rZ79mgPNYMroXjWUgFkYtoZ3ArKyqfIXrxcE9YFWF?=
 =?us-ascii?Q?DjaZnNmldECW3HiS5aQiny2zmnyMSNHQOv7EXyjL8A9XNw1NUZxuFzU71bTQ?=
 =?us-ascii?Q?uiZKz75dtrZFUTQa1o/zRAqsKMJ3X6corvOtOXgsGcR+CD4NFXbGGdVL8hqr?=
 =?us-ascii?Q?IznO9U3BxwZ6P95i61H/LR9+5LASegNpG7DxNwTT8Gf93EsmDCVX8irB1h7i?=
 =?us-ascii?Q?mzFgDg9ieqVlRiXKOLUE7upX1seLXYrm2r4ODQKCDQyvalEZ13tTJIOgFBTV?=
 =?us-ascii?Q?lzsRzKzkp4qq2rLyKxeNqpektr/ONQwh2gsx+4o8DfXkpUXMuF5WxSGewjQP?=
 =?us-ascii?Q?w4qKwYowowRBP6tgMquNTOHJPP4BOGU4YKUqcJGDidNVhVETCr3lf55nzeZs?=
 =?us-ascii?Q?k/z4caPU/+7X7KbH6zuKasSGRFkdESX8nFstzO+FvlLFurqwJgDXOfNPyDGI?=
 =?us-ascii?Q?ADpItZUyrQfpZnr/iJ09KZXf3XNsbaeBcLh2oxbCmHZVKQyqQi5ds7zTSIsR?=
 =?us-ascii?Q?rhEZm3IFXtIYtTenO3b110Ij3SgNs+nmaC++imSdvI1+uV+nBdJl03f3gRwr?=
 =?us-ascii?Q?Ew9iaXAFql2FL9bKUZbZhOKbljwWO+7OQc6l/fhYCwcl7wJhRghilo3mXQDA?=
 =?us-ascii?Q?90DgIDDLdJ3Bx/jp2uPg8hqRQ8FpNpViwdiPH+ph74cKByRgzhb8jdgelpVn?=
 =?us-ascii?Q?DbHdqx8bHvRSigWXyQi4RROFI6r33r2dCSAstPAgIiwp9T+XPxqR2ow+RJAu?=
 =?us-ascii?Q?vwGVkBkiXBirjjLNh/9tHLJ7S+rnZ812Q47VclLfdQ+CtHIvNbgYYNQhccXF?=
 =?us-ascii?Q?vgh2r1nG0yvy1bP9K7LybfHO7neyXzsYAlQquzx8/SW+fu1CbwrGn8XrYgu+?=
 =?us-ascii?Q?cDs0oAEqbO9OjXhpL/2jewlZSpXYImP/ri7dgs+Px8MkqJnbMDgCgQUO0K8/?=
 =?us-ascii?Q?Zp94uxuBL04SN90u5pHIanvgG8hkV0+RF4/EncV18lKGSQI3Pr8gYs43Mql+?=
 =?us-ascii?Q?iLReiw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:46:10.7114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae91e7fb-5b34-4483-c672-08de58da4a77
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9803

Add the remaining 12 CPU nodes and all 14 L2 cache nodes for the
Tegra264 CPU Complex, which comprises up to 14 ARM Neoverse V3AE
CPUs. Each CPU has its own private 1MB L2 cache.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 321 +++++++++++++++++++++++
 1 file changed, 321 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index fa00e95f87a3..24cc2c51a272 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3786,6 +3786,7 @@ cpu0: cpu@0 {
 			d-cache-size = <65536>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
+			next-level-cache = <&l2c0>;
 		};
 
 		cpu1: cpu@10000 {
@@ -3801,7 +3802,327 @@ cpu1: cpu@10000 {
 			d-cache-size = <65536>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
+			next-level-cache = <&l2c1>;
 		};
+
+		cpu2: cpu@20000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x20000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c2>;
+		};
+
+		cpu3: cpu@30000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x30000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c3>;
+		};
+
+		cpu4: cpu@40000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x40000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c4>;
+		};
+
+		cpu5: cpu@50000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x50000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c5>;
+		};
+
+		cpu6: cpu@60000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x60000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c6>;
+		};
+
+		cpu7: cpu@70000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x70000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c7>;
+		};
+
+		cpu8: cpu@80000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x80000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c8>;
+		};
+
+		cpu9: cpu@90000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0x90000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c9>;
+		};
+
+		cpu10: cpu@a0000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0xa0000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c10>;
+		};
+
+		cpu11: cpu@b0000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0xb0000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c11>;
+		};
+
+		cpu12: cpu@c0000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0xc0000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c12>;
+		};
+
+		cpu13: cpu@d0000 {
+			compatible = "arm,neoverse-v3ae";
+			device_type = "cpu";
+			reg = <0xd0000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c13>;
+		};
+
+		l2c0: l2-cache-0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c1: l2-cache-1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c2: l2-cache-2 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c3: l2-cache-3 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c4: l2-cache-4 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c5: l2-cache-5 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c6: l2-cache-6 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c7: l2-cache-7 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c8: l2-cache-8 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c9: l2-cache-9 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c10: l2-cache-10 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c11: l2-cache-11 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c12: l2-cache-12 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
+		l2c13: l2-cache-13 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
+		};
+
 	};
 
 	bpmp: bpmp {
-- 
2.34.1

