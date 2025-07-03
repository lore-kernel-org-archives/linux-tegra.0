Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223DD2E6114;
	Thu,  3 Jul 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539169; cv=fail; b=Zq76FaXAlyUxRIiYz60hwqWW1Li3Ijr7S0kud+9SBrWoEPpIWKVONV8Na1/1n24JrQsh2eaPIBqj3s/+2ZNfRtJOmQ1j9uHRY3zLrmojSPsb3KEE13dtgaEa3htDo4tWZJyDB3XYX9PivVZCtxZAqohm22U4EPigjEU5NG8d2FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539169; c=relaxed/simple;
	bh=0w1WRmNrBe9Bk/rOn1eYzRIo1LU/DGDk72oK+CjXhWU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqx02eWpqoKJrt9ABsiNHL2/bOUDNt0iptXiWYsUrav0JVsZ1MO87YhH/g1CFqPRdmPTdYV4WRojtYgDgQ9dzl+WdJje5c771n8tX8cVFOg4x4Mj49WaLxQ6rHUQMLt5Y4gtmlUu6fvHBOnBiv8VHvjq2snnZBiGMpfay1znX8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TrGX9w5k; arc=fail smtp.client-ip=40.107.100.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TrGX9w5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvqHIFkr/hpn3Jit3dkozntruIiGkbSvvD245aAGI1uiiTq7e4y7tWJYGbyPgjy9OQ76jAb5APtlFGj2gIClAbaN++wARtRor3SZ3h9474s3o4Oj4OFBIcjCaDqOW9TZtVeQQ43mvL7Cvvs9KFSWHiUeskQSpMZuSirrydohny+XbzeBagY0/CLMorXd4by8ORNkepoIy9p0FV47LCOSx6vDjsUtobGg6IfP9FxbyihNxDRNRw1kVC141mDwUTFiXgCOnP8XbbLWRZT4LIojz9R8ETBhCA/zPUHPDXFoQn+VJUyc1oSsUzKqYlpT8+76RIiizabxr3KE2xxi1B2luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61mAfCzyzqeg0/MBhcGJnHKH6gnjph+pclp4P+GT/J8=;
 b=FPXwV/+4782nKbXksGScABhyGfWBAHe8Pa+xYZJtd9vm14KrgK+f3niRti9/7Bmk5/j1H+Trq1GgJK3qW4boduc+W3GwoWHgOTkIfqUNBuiN7xZF/xiE/CY7G5ASVvhTuFLSROXrp3P29lYef9Z83+O/ut1zODS+ebQOChAtej9hMX9AiJR0lHe3y9epbOTDoK3m5QhfSrCD8tZHYlEtaPVRxpWH/k0Q+k2ImKQ6ytPdCsTrbCh/YYVNLcSU8wwoWm9uHgNn1vYl7YWmvhTxbsGlHoRw5caomMDuaW1ve9HEvcU2e1zDuEKZtvuRlCHM/RZSczJNZYs/+UHtdV0UmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61mAfCzyzqeg0/MBhcGJnHKH6gnjph+pclp4P+GT/J8=;
 b=TrGX9w5k3cnewPoR9tiTa+74/8hoM+KtdLdber2vi9oWf6GNuL0SpQ2e4nMiHFE6O7Cpnk9rzoX7Ue6M9nv+6R1DyMDzn5KO1UpHAgXJLy2cmIuuaR6pkNK/1PdNII3WuqFz6I6kl7SW5xlGFqeP67sW0cjWESJPTObQ1wBUOGhfY22L8rP1y0ZKnNmfz/vMTi+c95Hk41xAf2/7ecDstWynY7MmYdLS96WwzU2/5j/eqw2uW89+xgolq1eJVi1jS0rlBWoK/I7NEH+5gi6DGEXgqurHc0Os6F9Uwxgz9MN4Hm/WOW4RypkhGILbVd0NW9KqTFtS4Z6vvqw/ZLrl9Q==
Received: from DM6PR13CA0026.namprd13.prod.outlook.com (2603:10b6:5:bc::39) by
 IA0PR12MB7530.namprd12.prod.outlook.com (2603:10b6:208:440::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 10:39:19 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:bc:cafe::d1) by DM6PR13CA0026.outlook.office365.com
 (2603:10b6:5:bc::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.11 via Frontend Transport; Thu,
 3 Jul 2025 10:39:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 10:39:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:39:09 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:39:08 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:39:05 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 7/8] soc: tegra: cbb: add support for cbb fabrics in Tegra264
Date: Thu, 3 Jul 2025 16:08:28 +0530
Message-ID: <20250703103829.1721024-8-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103829.1721024-1-sumitg@nvidia.com>
References: <20250703103829.1721024-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|IA0PR12MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: e908d9f0-4969-4b16-aebd-08ddba1dddbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8nZXNEzM+HmVCQfdUoWo6R6WGtlDTN5VvR6rsZykEFOUsHF5KQ0IWQDI5to2?=
 =?us-ascii?Q?D1BievQeJmWBYTArbAyA5zZ/Nzq8/48hSif6RJgqV1KFe+9WVEDQeZtLPCz0?=
 =?us-ascii?Q?MDksrCyB/CM4xPjX5ljJUSiK4coLvIk7Fy47gDoGEq4L+GyQMLBZubzm21AM?=
 =?us-ascii?Q?Uyy6xeNkbxuD0XDRUH74Bztct7zsI69IOHQ5IpqhBOyaMKFZOe/GEII8+4xa?=
 =?us-ascii?Q?s0GbZQEJBHP0S91rnIkrDr+iUzXaVFezFT8OncIWbzhKBAPzV6fvkxRR9kcK?=
 =?us-ascii?Q?F+Bc0hJSPfVTc+R5FCPtthAY77J173isVl72E7/wfJ2c3BbeWNtv6tImmGDZ?=
 =?us-ascii?Q?3jbekWYjQSLXY6CN1HaZYbbPjzibMkvA2IZ5zpP/6Z074t2+TN2qJ1gtdnu3?=
 =?us-ascii?Q?kYxAWUC2TftUOxC5BQBySzTAOhPoXpfz9CFXd3fmHnJnhDp1JD2z04Khl0Oz?=
 =?us-ascii?Q?XO61jfJr55VuPMrPxV9KiZVRAYRJOY+sJYE1OfkDCSWTSygpI80HlSrjkNFp?=
 =?us-ascii?Q?Zes8DLJpV4YLOnJyGR2/dkPjKlc6Ovt5TA9KEnlArrP9PA5Crm1TtuF/2UgU?=
 =?us-ascii?Q?4op3JLGsGLmEChh+T1I+PkBk/y2GPo813seYM27LYBWOtwWpJY7NWoyvOCUy?=
 =?us-ascii?Q?p843Nrny/cz7MVuq5FVdcuO41RTfy1Lh9gEu4wLSSIdMNSCSuP7Wc/4kWefo?=
 =?us-ascii?Q?b8lZQNXulVahUghVtlmHG86u3eVLJ3BM+W7yw2jzyZ2IYeFdznMb+e/umNPf?=
 =?us-ascii?Q?fp1MPEWOc7u6iuBCV3+En1I59B0locymHoUBvTXhm5KNvMibOdpZXiOQQYNS?=
 =?us-ascii?Q?WiACpU4aI2ewCROMbYtb/oGLqzwBoVy+MEL4kdRZWZ4vSmJQ4q54nzrz7QGA?=
 =?us-ascii?Q?1+ujgxYlr6xsPNKarCa96z3xFD2UABK89GQjhbE6vx9+NoxEjYE8GwmdsYXp?=
 =?us-ascii?Q?zwOx3ZuIO0al6Y1gNtLBfBik9knr1W/Tw9fW3QuWMNaTITStl3sN5IiwaK2M?=
 =?us-ascii?Q?tala1q0K3WqemqCyx0Dn2yAB7EdYTVJyr64zlU0nyzSQfB48/uoY1odyeqva?=
 =?us-ascii?Q?x90uDig1xtAuK8Cmb+dutieh6Z2lm47F8NwTv/4Du8YfYPrHz38RiH6kpdJO?=
 =?us-ascii?Q?mIcXDr6AXSNWeQFqb2Kw2Dt0jIMFDA6TzsDE55jvcCD/W3QENTjY2jG1YOXi?=
 =?us-ascii?Q?iR07wYUZQIf+32ftfIocuJLAgez0HcmiinxF92iTEMHNi7Y1kcIMn4RqaLeO?=
 =?us-ascii?Q?QvYvTokg8xwn6c2TJF5YHbMDwLMTdsgYRam0c3ouTnheAYe8cuKbmK3RZcCe?=
 =?us-ascii?Q?jgZNoZzJAhw6isDXGAEuqWsQ4rtyeQYURhZAT0T2tUtQVm3Jg1qmbN5PYXTq?=
 =?us-ascii?Q?D4dmhgU2N2kRsQwAjQjHlVVI7hhkd575fmnElIJfPQ1Cj+XMbFXJP7R5nVb0?=
 =?us-ascii?Q?trzX0o996lWkX2pVNraEh3xq+Ac9xZEhkuYoWYbdAvgc13Lmopf3M62xBvLV?=
 =?us-ascii?Q?66zsUl3vBnfGCj+kan0X/Gjsh/m4XRMui5WS?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:39:19.2324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e908d9f0-4969-4b16-aebd-08ddba1dddbf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7530

Add support for CBB 2.0 based fabrics in Tegra264 SoC using DT.
Fabrics reporting errors are: SYSTEM, TOP0, UPHY0, VISION.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 279 +++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index aab0cd85dea5e..69c7049386795 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -89,6 +89,34 @@ enum tegra234_cbb_fabric_ids {
 	T234_MAX_FABRIC_ID,
 };
 
+enum tegra264_cbb_fabric_ids {
+	T264_SYSTEM_CBB_FABRIC_ID,
+	T264_TOP_0_CBB_FABRIC_ID,
+	T264_VISION_CBB_FABRIC_ID,
+	T264_DISP_USB_CBB_FABRIC_ID,
+	T264_UPHY0_CBB_FABRIC_ID,
+	T264_RSVD0_FABRIC_ID,
+	T264_RSVD1_FABRIC_ID,
+	T264_RSVD2_FABRIC_ID,
+	T264_RSVD3_FABRIC_ID,
+	T264_RSVD4_FABRIC_ID,
+	T264_RSVD5_FABRIC_ID,
+	T264_AON_FABRIC_ID,
+	T264_PSC_FABRIC_ID,
+	T264_OESP_FABRIC_ID,
+	T264_APE_FABRIC_ID,
+	T264_BPMP_FABRIC_ID,
+	T264_RCE_0_FABRIC_ID,
+	T264_RCE_1_FABRIC_ID,
+	T264_RSVD6_FABRIC_ID,
+	T264_DCE_FABRIC_ID,
+	T264_FSI_FABRIC_ID,
+	T264_ISC_FABRIC_ID,
+	T264_SB_FABRIC_ID,
+	T264_ISC_CPU_FABRIC_ID,
+	T264_RSVD7_FABRIC_ID,
+};
+
 struct tegra234_target_lookup {
 	const char *name;
 	unsigned int offset;
@@ -455,6 +483,17 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	tegra_cbb_print_err(file, "\t  Fabric\t\t: %s (id:%#x)\n",
 			    cbb->fabric->fab_list[fab_id].name, fab_id);
 
+	if (of_machine_is_compatible("nvidia,tegra264") && fab_id == T264_UPHY0_CBB_FABRIC_ID) {
+		/*
+		 * In T264, AON Fabric ID value is incorrectly same as UPHY0 fabric ID.
+		 * For 'ID = 0x4', we must check for the address which caused the error
+		 * to find the correct fabric which returned error.
+		 */
+		tegra_cbb_print_err(file, "\t  or Fabric\t\t: %s\n",
+				    cbb->fabric->fab_list[T264_AON_FABRIC_ID].name);
+		tegra_cbb_print_err(file, "\t  Please use Address to determine correct fabric.\n");
+	}
+
 	tegra_cbb_print_err(file, "\t  Target_Id\t\t: %#x\n", target_id);
 	tegra_cbb_print_err(file, "\t  Burst_length\t\t: %#x\n", burst_length);
 	tegra_cbb_print_err(file, "\t  Burst_type\t\t: %#x\n", burst_type);
@@ -1143,6 +1182,242 @@ static const struct tegra234_cbb_fabric tegra241_bpmp_fabric = {
 	.firewall_wr_ctl = 0x8e8,
 };
 
+static const char * const tegra264_initiator_id[] = {
+	[0x0] = "TZ",
+	[0x1] = "CCPLEX",
+	[0x2] = "ISC",
+	[0x3] = "BPMP_FW",
+	[0x4] = "AON",
+	[0x5] = "MSS_SEQ",
+	[0x6] = "GPCDMA_P",
+	[0x7] = "TSECA_NONSECURE",
+	[0x8] = "TSECA_LIGHTSECURE",
+	[0x9] = "TSECA_HEAVYSECURE",
+	[0xa] = "CORESIGHT",
+	[0xb] = "APE_0",
+	[0xc] = "APE_1",
+	[0xd] = "PEATRANS",
+	[0xe] = "JTAGM_DFT",
+	[0xf] = "RCE",
+	[0x10] = "DCE",
+	[0x11] = "PSC_FW_USER",
+	[0x12] = "PSC_FW_SUPERVISOR",
+	[0x13] = "PSC_FW_MACHINE",
+	[0x14] = "PSC_BOOT",
+	[0x15] = "BPMP_BOOT",
+	[0x16] = "GPU_0",
+	[0x17] = "GPU_1",
+	[0x18] = "GPU_2",
+	[0x19] = "GPU_3",
+	[0x1a] = "GPU_4",
+	[0x1b] = "PSC_EXT_BOOT",
+	[0x1c] = "PSC_EXT_RUNTIME",
+	[0x1d] = "OESP_EXT",
+	[0x1e] = "SB_EXT",
+	[0x1f] = "FSI_SAFETY_0",
+	[0x20] = "FSI_SAFETY_1",
+	[0x21] = "FSI_SAFETY_2",
+	[0x22] = "FSI_SAFETY_3",
+	[0x23] = "FSI_CHSM",
+	[0x24] = "RCE_1",
+	[0x25] = "BPMP_OEM_FW",
+	[0x26 ... 0x3d] = "RSVD",
+	[0x3e] = "CBB_SMN",
+	[0x3f] = "CBB_RSVD"
+};
+
+static const struct tegra234_target_lookup tegra264_top0_cbb_target_map[] = {
+	{ "RSVD",               0x000000 },
+	{ "CBB_CENTRAL",        0xC020000 },
+	{ "AXI2APB_1",          0x80000 },
+	{ "AXI2APB_10",         0x81000 },
+	{ "AXI2APB_11",         0x82000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_14",         0x83000 },
+	{ "AXI2APB_15",         0x84000 },
+	{ "AXI2APB_16",         0x85000 },
+	{ "AXI2APB_17",         0x86000 },
+	{ "AXI2APB_2",          0x87000 },
+	{ "AXI2APB_3",          0x88000 },
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_5",          0x8A000 },
+	{ "AXI2APB_6",          0x8B000 },
+	{ "AXI2APB_7",          0x8C000 },
+	{ "AXI2APB_8",          0x8D000 },
+	{ "AXI2APB_9",          0x8E000 },
+	{ "FSI_SLAVE",          0x64000 },
+	{ "DISP_USB_CBB_T",     0x65000 },
+	{ "SYSTEM_CBB_T",       0x66000 },
+	{ "UPHY0_CBB_T",        0x67000 },
+	{ "VISION_CBB_T",       0x68000 },
+	{ "CCPLEX_SLAVE",       0x69000 },
+	{ "PCIE_C0",            0x6A000 },
+	{ "SMN_UCF_RX_0",       0x6B000 },
+	{ "SMN_UCF_RX_1",       0x6C000 },
+	{ "AXI2APB_4",          0x89000 },
+};
+
+static const struct tegra234_target_lookup tegra264_sys_cbb_target_map[] = {
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_1",          0xE1000 },
+	{ "RSVD",               0x00000 },
+	{ "AON_SLAVE",          0x79000 },
+	{ "APE_SLAVE",          0x73000 },
+	{ "BPMP_SLAVE",         0x74000 },
+	{ "OESP_SLAVE",         0x75000 },
+	{ "PSC_SLAVE",          0x76000 },
+	{ "SB_SLAVE",           0x7A000 },
+	{ "SMN_SYSTEM_RX",      0x7B000 },
+	{ "STM",                0x77000 },
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_3",          0xE3000 },
+	{ "TOP_CBB_T",          0x7C000 },
+	{ "AXI2APB_2",          0xE4000 },
+	{ "AXI2APB_4",          0xE5000 },
+	{ "AXI2APB_5",          0xE6000 },
+};
+
+static const struct tegra234_target_lookup tegra264_uphy0_cbb_target_map[] = {
+	[0 ... 20] =  { "RSVD", 0x00000 },
+	{ "AXI2APB_1",          0x71000 },
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_3",          0x75000 },
+	{ "SMN_UPHY0_RX",       0x53000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "PCIE_C4",            0x4B000 },
+	{ "AXI2APB_2",          0x74000 },
+	{ "AXI2APB_4",          0x76000 },
+	{ "AXI2APB_5",          0x77000 },
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_7",          0x79000 },
+	{ "PCIE_C2",            0x56000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "PCIE_C1",            0x55000 },
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_10",         0x72000 },
+	{ "AXI2APB_11",         0x7C000 },
+	{ "AXI2APB_8",          0x7A000 },
+	{ "AXI2APB_9",          0x7B000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "PCIE_C5",            0x4E000 },
+	{ "PCIE_C3",            0x58000 },
+	{ "RSVD",               0x00000 },
+	{ "ISC_SLAVE",          0x54000 },
+	{ "TOP_CBB_T",          0x57000 },
+	{ "AXI2APB_12",         0x7D000 },
+	{ "AXI2APB_13",         0x70000 },
+	{ "AXI2APB_6",          0x7E000 },
+};
+
+static const struct tegra234_target_lookup tegra264_vision_cbb_target_map[] = {
+	[0 ... 5] =       { "RSVD", 0x0 },
+	{ "HOST1X",             0x45000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "AXI2APB_2",          0x71000 },
+	{ "RSVD",               0x00000 },
+	{ "RSVD",               0x00000 },
+	{ "SMN_VISION_RX",      0x47000 },
+	[13 ... 19] =     { "RSVD", 0x0 },
+	{ "RCE_0_SLAVE",        0x4B000 },
+	{ "RCE_1_SLAVE",        0x4C000 },
+	{ "AXI2APB_1",          0x72000 },
+	{ "AXI2APB_3",          0x73000 },
+	{ "TOP_CBB_T",          0x4D000 },
+
+};
+
+static const struct tegra234_fabric_lookup tegra264_cbb_fab_list[] = {
+	[T264_SYSTEM_CBB_FABRIC_ID]   = { "system-cbb-fabric", true,
+					  tegra264_sys_cbb_target_map,
+					  ARRAY_SIZE(tegra264_sys_cbb_target_map) },
+	[T264_TOP_0_CBB_FABRIC_ID]    = { "top0-cbb-fabric", true,
+					  tegra264_top0_cbb_target_map,
+					  ARRAY_SIZE(tegra264_top0_cbb_target_map) },
+	[T264_VISION_CBB_FABRIC_ID]   = { "vision-cbb-fabric", true,
+					  tegra264_vision_cbb_target_map,
+					  ARRAY_SIZE(tegra264_vision_cbb_target_map) },
+	[T264_DISP_USB_CBB_FABRIC_ID] = { "disp-usb-cbb-fabric" },
+	[T264_UPHY0_CBB_FABRIC_ID]    = { "uphy0-cbb-fabric", true,
+					  tegra264_uphy0_cbb_target_map,
+					  ARRAY_SIZE(tegra264_uphy0_cbb_target_map) },
+	[T264_AON_FABRIC_ID]          = { "aon-fabric" },
+	[T264_PSC_FABRIC_ID]          = { "psc-fabric" },
+	[T264_OESP_FABRIC_ID]         = { "oesp-fabric" },
+	[T264_APE_FABRIC_ID]          = { "ape-fabirc" },
+	[T264_BPMP_FABRIC_ID]         = { "bpmp-fabric" },
+	[T264_RCE_0_FABRIC_ID]        = { "rce0-fabric" },
+	[T264_RCE_1_FABRIC_ID]        = { "rce1-fabric" },
+	[T264_DCE_FABRIC_ID]          = { "dce-fabric" },
+	[T264_FSI_FABRIC_ID]          = { "fsi-fabric" },
+	[T264_ISC_FABRIC_ID]          = { "isc-fabric" },
+	[T264_SB_FABRIC_ID]           = { "sb-fabric" },
+	[T264_ISC_CPU_FABRIC_ID]      = { "isc-cpu-fabric" },
+};
+
+static const struct tegra234_cbb_fabric tegra264_top0_cbb_fabric = {
+	.fab_id = T264_TOP_0_CBB_FABRIC_ID,
+	.fab_list = tegra264_cbb_fab_list,
+	.initiator_id = tegra264_initiator_id,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x7,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x90000,
+	.off_mask_erd    = 0x4a004,
+	.firewall_base   = 0x3c0000,
+	.firewall_ctl    = 0x5b0,
+	.firewall_wr_ctl = 0x5a8,
+};
+
+static const struct tegra234_cbb_fabric tegra264_sys_cbb_fabric = {
+	.fab_id = T264_SYSTEM_CBB_FABRIC_ID,
+	.fab_list = tegra264_cbb_fab_list,
+	.initiator_id = tegra264_initiator_id,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x40000,
+	.firewall_base   = 0x29c000,
+	.firewall_ctl    = 0x170,
+	.firewall_wr_ctl = 0x168,
+};
+
+static const struct tegra234_cbb_fabric tegra264_uphy0_cbb_fabric = {
+	.fab_id = T264_UPHY0_CBB_FABRIC_ID,
+	.fab_list = tegra264_cbb_fab_list,
+	.initiator_id = tegra264_initiator_id,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x1,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x80000,
+	.firewall_base   = 0x360000,
+	.firewall_ctl    = 0x590,
+	.firewall_wr_ctl = 0x588,
+};
+
+static const struct tegra234_cbb_fabric tegra264_vision_cbb_fabric = {
+	.fab_id = T264_VISION_CBB_FABRIC_ID,
+	.fab_list = tegra264_cbb_fab_list,
+	.initiator_id = tegra264_initiator_id,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x1,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x80000,
+	.firewall_base   = 0x290000,
+	.firewall_ctl    = 0x5d0,
+	.firewall_wr_ctl = 0x5c8,
+};
+
 static const struct of_device_id tegra234_cbb_dt_ids[] = {
 	{ .compatible = "nvidia,tegra234-cbb-fabric", .data = &tegra234_cbb_fabric },
 	{ .compatible = "nvidia,tegra234-aon-fabric", .data = &tegra234_aon_fabric },
@@ -1150,6 +1425,10 @@ static const struct of_device_id tegra234_cbb_dt_ids[] = {
 	{ .compatible = "nvidia,tegra234-dce-fabric", .data = &tegra234_dce_fabric },
 	{ .compatible = "nvidia,tegra234-rce-fabric", .data = &tegra234_rce_fabric },
 	{ .compatible = "nvidia,tegra234-sce-fabric", .data = &tegra234_sce_fabric },
+	{ .compatible = "nvidia,tegra264-sys-cbb-fabric", .data = &tegra264_sys_cbb_fabric },
+	{ .compatible = "nvidia,tegra264-top0-cbb-fabric", .data = &tegra264_top0_cbb_fabric },
+	{ .compatible = "nvidia,tegra264-uphy0-cbb-fabric", .data = &tegra264_uphy0_cbb_fabric },
+	{ .compatible = "nvidia,tegra264-vision-cbb-fabric", .data = &tegra264_vision_cbb_fabric },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, tegra234_cbb_dt_ids);
-- 
2.34.1

