Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F952C18A;
	Fri, 30 May 2025 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612181; cv=fail; b=rYMyqqQSFJdanAoTmd6ww7rOsmc5cIPSR1Ct+FH+F/ybBjI1NFCHjuXMnIeJkjBcvHay8bGa3oS76eeqyQ1m11WFdueER6TsqsDVY+4lBNk+P/WdAqf9+AFkAT3j6wfKnKeIJwlyWWvgI5q6L9Xlz5oNuVLlE2+r/zKtDMFfTgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612181; c=relaxed/simple;
	bh=Dz3n4RMvZlG6xYbjEN1asngI+EggurWSAePK1lv+YfI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ig6AL3DeDN8T7y1BhsWeqTowZzUNuzx1K9CjH1X0IeH8l+pGaeaSDnZ2TlSy1Tiwh66uTlUNAt6SYsGLCtK+jY7D9QWqe/Q+TGhvMB3QCH9r9NW1CZIkMLtj20F0WS147vN8yEkcDev1VwLjXLCcXA/Drl3xDKHij0S8j93LUmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MxWw162X; arc=fail smtp.client-ip=40.107.223.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MxWw162X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1cm1Eg5pdiz1qxvAP1CMooLLYd35J2Z0a2Zik+3/NIdrOSWAL7Sf9k1EGgcufE95h7nsEOwn3hZhF49fFOUtYGrP2uQYJExaxiZbgszsBpo9XGLY5OOmemxGDMxz5RrBKBoX+XYitShPuWdr/sQHlJl1LzZMclWHCGRBoge2HTXGgUIMBbV+TwhktqgD4N4SEz17tYwRaCSvpzHvBUNlDmL4z94FpuU5HLg4MNAfbq1DjD/RtgfQR2GbgjE4OG7KwCC+aI6w9UEl9XoDj4utE6UmTWrkY7tThVjEGhqhbwIInVS2qEZeRXDTWw6KjKKbGpIDxLGu9WnyFaTq/2vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PKR8VQVRqQTb/ef4q1d3GRonuEjXA7Mb8RgnwHCH7w=;
 b=j43DVjYJYrZy7tKqzGC0H0r8srHR4DmZUpbRP7yDjStjvMCnkjQ0ygr1kvMQTF+ke0pBGbX7zT1UjTAQXSx5+qTqnPIHmCncOs7Z0CJ99njLmkpl6nWyyP0tzBjL7SwrLEVZiJjvOOINEIgal+2TU/+CLbJmib4ki+MSQJuX2eAWZ1T6jJUKpSHr+JPIk8q/TgliM1hKb2+JMqYNICv+AUYtFo79x8SYtDkAxCOxw63GZ6FIyR9mVeUe5auZnXpAr7nxwYAmh6usJE0FNJJPEbhuMwd5O69iJxOa9NT6ma5w7ztaJ5pYO/YfSXf6WtE1Wg0oAmpqPOvzps7TauM0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PKR8VQVRqQTb/ef4q1d3GRonuEjXA7Mb8RgnwHCH7w=;
 b=MxWw162XJaoTFYP4zzYYDU4OdgmX1S5MmsmlS0Ohm7eCm85A2Wq4J3ZGifQjs7luNDlcSHeypc8rJ0n8u8nbYOuw22bBkmNIDKeCbQOk0VmJulmlGNXFN7cP4yOClHWEIbSYTQNGMArjAQZdlIHxfNKdG92VqiRrCVP8YBPof/26wt9HLWSUVLRf3zOJlw91qtqW1X/5qBcbP7LHZNGJ3e55plCV4AZcnrJfgY/DqdK3NuUdNvmLmV3LaDc76ptiFeWuIBrjdmXa3wz/zXuPlCyVxbiyDSOfKMgN0VL9CUxoPXdYST5JJ7SammADHuqZVuxB0gHO+eV8+yml6sbOEA==
Received: from MN2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:208:1a0::15)
 by LV8PR12MB9335.namprd12.prod.outlook.com (2603:10b6:408:1fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 13:36:14 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::d1) by MN2PR07CA0005.outlook.office365.com
 (2603:10b6:208:1a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 30 May 2025 13:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 13:36:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:35:56 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:35:56 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:35:53 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 7/8] soc: tegra: cbb: add support for cbb fabrics in Tegra264
Date: Fri, 30 May 2025 19:03:35 +0530
Message-ID: <20250530133336.1419971-8-sumitg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530133336.1419971-1-sumitg@nvidia.com>
References: <20250530133336.1419971-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|LV8PR12MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fdc2c6d-1dc6-4c98-ee00-08dd9f7ef2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GCcMZL1YLrzbSp3AkaFb0NeX/zIQpY5PF9MQYvlarx+v8+TgExaxbCEoyz9c?=
 =?us-ascii?Q?iOQQCnKZG4OjGjCvXy99k9zcFqp4y1AmV3Z3xkqQblmCL+S3PbIa3oXXpePG?=
 =?us-ascii?Q?YtRjMQv8vyqV4nl8ER00Gy8qbDAMSUE7R0YonmALK2/rDAKTDAgPRdgiPCLq?=
 =?us-ascii?Q?DMaf6M2Iic6+9XjiK8bSGt0TAD/pI3FtFTyjY+L0m/2fe1QV32FwmH/JgnOm?=
 =?us-ascii?Q?ivSlf1jnpj8ukhuZCysMso63vJI4w7Qk6L0QXe2G3XFfMq5M05PD2lT8kvqo?=
 =?us-ascii?Q?JZcgkfQwfzkKCTOA0gZxIA/3qar5MOTZwnHXRgzzN1Ff5+crbF4/6WPCbtz0?=
 =?us-ascii?Q?n/vKUWnTGvoRrt2gl0+Qmuu38Bcpr8sOnJHIk+iIC9ITyur9r7iRY2QvZB25?=
 =?us-ascii?Q?WsneI8TdFR5o8AjTOiY5x3NjUM3xZ53wke4BgL6m5jcAubVDArQngPulZ80u?=
 =?us-ascii?Q?PpGs5Zc1wgXIKrDQR/a6i2drDWmH4k5wGMD31YtoK3DcGjRe6dgrrREph8xU?=
 =?us-ascii?Q?k8ee56qASgKv9fIz/S6JDiREkbM/RXtDwd4tACiM06ijzMKxXjG3PAov6GN6?=
 =?us-ascii?Q?iIQtn5D+4t4HPCzSiHLfHToFyGA205cR5RGTMXRWHv6flZ706QFb6gWCEe/g?=
 =?us-ascii?Q?wpXa86ahkmidHlXdhL2sZU+8zDjnnTP3gdGomnFz6eV2KAFuonLckcNh6gc0?=
 =?us-ascii?Q?7EY4LlJ4Ck/h+/V8QGsKkd727Ja9a6BuwT+O3bMlZhwGwet2WuSywYR0cLTi?=
 =?us-ascii?Q?VFeylmldz2aqnRQHPNc/Yhv8Z2gD77+iC0yeihHg8tu5qj2t3lw8L3Pq1FHG?=
 =?us-ascii?Q?IHN6ufx96bTFzfz6Nda8GDxOM1nVLLu+VsC6NgTPKbl1I79BlddDy/YA4tdK?=
 =?us-ascii?Q?vNe48p8gfQstMYQSFP/nmITyHvQn5Sntse0dpZmdezUUoEliNtwky5YDobaa?=
 =?us-ascii?Q?KbyoP7v8XoJ5oE9O7PVnhCP0fnZNIU/1QDK3TxT0CRcyBpZ6IajFR9XCFWoW?=
 =?us-ascii?Q?Qus1584y8bWVx2N0foTF/jxLmXnExQTuL5zjcSdRWdaG9lxZX25j1o1roMpZ?=
 =?us-ascii?Q?cI1qKnhaBpISkGP6qoO2wgiZSicHa9mdvTU8Y7JB3Z32YZUGCnRyXgUVbEn4?=
 =?us-ascii?Q?DPjfLcBGXKm8A0DSxyP9OzpbTa6WqnbYngrhCTL1nCs0zKAPNEiFfbuC03DZ?=
 =?us-ascii?Q?hGoCp9Ug8qHTmBANC1KJBjxCLOVyf689xN9PniLuvGChUh+wGwNPuX3E2yVd?=
 =?us-ascii?Q?Wni0AZQ8xZw9fix8IN2Ww/QiCQRnSyL07e2E8IOGEmiZGyTR/z8oHBgdxPvc?=
 =?us-ascii?Q?CqoaF3ufDc6AyukGaHKekHTKToueXJ0OoyeHrms8BbuFnmtURL/ZxcvHFPIA?=
 =?us-ascii?Q?3vQPTPPLdEVUbUmwx9zimjeLju6Gkyfk0FDStuunB1j8N74g0Aq+1qaQOX4/?=
 =?us-ascii?Q?boU9fONOrQRoRzoJGErEC9duLEDzWnn2XJxn+gKdAkvh2vWiPKs6YI7ahYYW?=
 =?us-ascii?Q?eYfl1TkoG4sCG7lNSnWBnVXdKGGtc2ROjqgu?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:36:14.3765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdc2c6d-1dc6-4c98-ee00-08dd9f7ef2d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9335

Add support for CBB 2.0 based fabrics in Tegra264 SoC using DT.
Fabrics reporting errors are: SYSTEM, TOP0, UPHY0, VISION.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 279 +++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index aab0cd85dea5..69c704938679 100644
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
2.25.1

