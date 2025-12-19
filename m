Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B43246FD;
	Fri, 19 Dec 2025 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144669; cv=fail; b=ElWg+AtVbr821vxbWq/caEH/IvqRHRu4NbI3KoObxdTIuYfGpZet+0Hv3Jh+6o6Gr1hXWAZDzeOFd35Lc/1pxryNY0xCVR/LrLBRAe41VV64tN+ovreSJffER8NOuwa8hsiLH/VsR7mn9fW09V3LdkcVLXQ2YCCdDRx/Dh6Qddo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144669; c=relaxed/simple;
	bh=2OjvlNTqfpQS2ZydKPB49s4URjxhKx0QgfchdJ+/+NI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OEcmfMY7AoWLOl3bt085eOnPllVwz+JSEwEwmrGjONXn6rubgVH6t43dJr/pq/nqKYaTvJEDWnsqEDDTgJp/b+AL4p9rFVwwZZT5BkYXwNQkURWl3pbJWOao2pHLsCbdfKhTNQosZMFInczGtwvtlUI2WenX3tP4DvDmImCSp/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (0-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zw52k0Xn reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.52.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zw52k0Xn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaM6vX/l+PpNuB7J6sosWzac926JRGSixsDsOmdVnVQSpOJnHYFXL6vylBgoL8iulKpCpK4SFKFeHwDFBzyjlOB5+FiX1yoGsX3bE6F13VXOhf0h1jUo2RStsiRNmDIo52Wdh6xGnnXscQutd5j4MXUabRll+dlkpiDZWWIL49h4ncUxlrccZ/2M/rghTwiGYamyveRB5kwffc3jzFfbqJZDhyt4BLQniJXRmB1uHFYgupaYvDu8ebW/8d1wq8BarWXukl7LAVhcfJ/njil9ZAg0esabBCnd1vz39hh8w2IaofQ57vmBrZdcc7W+OXPwtfJDtaW/MfUnx4hIwIFYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=Ihes+9MqQ9PLtNFXl/c0l/chsZD7ZrnS59WkGdalWgiExrWMiO8Kt4oMikwSDW6fUMC0FwCaV8ieSvqG+fLY/AY+FWJ4WMTVPxKs7VJvoNQ2jTm1N58hkqvhZdUacUYajYs9QRbjgMOUkTEAzqjs0+wyJ7hwrtZDTRjROUZLYJ6n82DFOCiy/5diYqQZsMNn+eQyB7LT4pcvsjdM9jl1O46/3/pN2kQeegTbnN90xWIYN6eF2q9ajAqg7B35j5mYE2E4GZKVWqXiL5WHYqCgBlnEbg1Z5rIyPOfqQofrkKZb2/hAeDe96ZaO0OCgVK9LS2bZy9hl/NzFpEnwUPao8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=Zw52k0Xn1L6n6nl14+ZsH9LbxZsgTO/VimKD6uzB2eVCgecDRpB49Zow5Q6FMRpCaRuNOxB4Yn9cGhy/JvLsWJe/NCrCCd+jEcq4zdFqAZB/r+8Vbh69YF+JE/z/Oj7ybD3QNfX/1Ei3JG5dR25qvc0ZNIi+tocPYFVVOGVTRc0t7mlux+w8GF4GiXBj60N7bqSXu0tmAwhI4irV2OGMbMPXbMCZ9LgRQXynGec+WRmCvefL9+VgWlBcvtvUCJoYFM9N1IM6LeAJ+98ZmKViuAtbbA8XW4lwFWBEoIW7ZQrZT0F77lP71rkVDyDC6P6wmvPXQINKurN8T19HQvlYJg==
Received: from SJ0PR05CA0039.namprd05.prod.outlook.com (2603:10b6:a03:33f::14)
 by SJ1PR12MB6169.namprd12.prod.outlook.com (2603:10b6:a03:45c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 11:44:19 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::ec) by SJ0PR05CA0039.outlook.office365.com
 (2603:10b6:a03:33f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.5 via Frontend Transport; Fri,
 19 Dec 2025 11:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 11:44:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:09 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:09 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 19 Dec 2025 03:44:09 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v5 2/4] memory: tegra: Group register and fields
Date: Fri, 19 Dec 2025 11:43:52 +0000
Message-ID: <20251219114354.2727906-3-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251219114354.2727906-1-ketanp@nvidia.com>
References: <20251219114354.2727906-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SJ1PR12MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac7053e-be71-4efc-e84f-08de3ef3f247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JdKpk+n4inQYX4P82jugxmxTSi5Vupd+813kDgxnk61EqAjOP/qR72kBpwOH?=
 =?us-ascii?Q?WdWFnJXfKeLj6IW2/uPU5T9n56Oo4LCLQBF1pBnpoie5toEu4+3bmdqqjecy?=
 =?us-ascii?Q?57TGOPlzfr4JC4AiiTLZyq3i1fiOLFqO/6O9CwgrlKRyhypifZm/H3u+r+pY?=
 =?us-ascii?Q?U58BzDW+Y++LT+/SBjXBnITmV9PahshakKRLuQtlcIK40DBdgyCaiQh9Dwj7?=
 =?us-ascii?Q?UmwxYyU3ZDfo4erLmjTtsXkaJWQc0hyH2RtQT8eiITSt6vmW+u0fXCdPvRmw?=
 =?us-ascii?Q?IZ1p0jKHNSLKkRvofyn2YHDv2q01Mky9/BDJ91qeYWSNS/dnX5M7Ec7kWZqm?=
 =?us-ascii?Q?QmJBUkeDvw298/skeCo1SgtLmlJ5Rt+oz/yN6MzYkWku2cI5TsY9FFWt+ACd?=
 =?us-ascii?Q?/OobxllIxNZPeeNp2EIlJXCv5bS5obhSKRTg1eVh189QI/zobq+eyhrsB3zN?=
 =?us-ascii?Q?OXeCFhsBMQFpHsDSIjUBugHVVAZbgOf/OCbljs7lR6xq+gDggT8scanp7qn5?=
 =?us-ascii?Q?6BJhBK0qKYWcl/dHzaMehXmKmMVev37fkQdh+bYHHmGGNL9r5BmnSvHcIE6D?=
 =?us-ascii?Q?hHP0CdsbRUBsaO+cYfcl0lNVOL8hq9zV0+gF4ip3QcDEulhrn2EFou4uwhhC?=
 =?us-ascii?Q?QluWucEXWczfea7HyiZ34VeKrK/DJJGIJ39sMaJOJEmXYlpyDuxRRVMINWER?=
 =?us-ascii?Q?VhD0jd7hhtUlCZhlmtqS6yc9ssD/B+dUeDJayFzol71tEWA/Mf1F2kO23wHd?=
 =?us-ascii?Q?o+HakNsy2Sh8XLOCZ7VRDD08/nWXuFy6njjZW9wm1tCl9woB/Jo2THgRPyhi?=
 =?us-ascii?Q?iMSoL2eOlYLObWJ7EgFH+fe9k+Cmnr19zOc+oxS6FjIzIKfmiOXXZE/lzudC?=
 =?us-ascii?Q?MbFvSMQ+lJnuifLwNvs7Nl/+3YVyhSlReaIzvmiWX3G07V8xognRH3y/19g8?=
 =?us-ascii?Q?q/4E77HEx+qcnPnBQg0lTTjZ7ezgEBEaYjq//PbMSqU3I1fb1wUz45C5aLBa?=
 =?us-ascii?Q?YjRuIZbIL874uDsGkVDKotTOesl0yOj6qBrHmCm133Hx5CZn+GammI51qgnt?=
 =?us-ascii?Q?ya60ex19D2oLkHV3M9+g9cpwCCJk2b7QI/7LlJpKClLNd11lZEXdwIn/jpRT?=
 =?us-ascii?Q?yzU1Zr1JoMXCpIT9TAJgVMAV6DM8k1dM0ktcEaxpx1JUh8Q3xQJKaV7kq6VU?=
 =?us-ascii?Q?/dP4PMF/Zrg76gNG5AWlOId3tg72MNSqZrL1bwktRY05xKlKc3TZciQEJFtW?=
 =?us-ascii?Q?UjsD/zAiYscyrGwBks5X9PT/ymIofNxSXDrf5cVqlBeapHQDhhqzWlDwuDNm?=
 =?us-ascii?Q?lLmXImczNYoxTDDoUyMxJj/MDiQc7mVOwzPZBq8f6IBf4it6w0n0t3umrhu/?=
 =?us-ascii?Q?GPHVjQpytr5brHuL5IjfWtpZgBYHwcpyqXWQq2RcxaqB96uLla2f/8oxHNZ2?=
 =?us-ascii?Q?rOv1PgHaJ+yOR/HyeP/I6/kS8WF5RzKVS1WZNXsYubeLtjtqRNQMu7MAe9f7?=
 =?us-ascii?Q?gIkdS9dX12M13xJ9AdQltju7f6c7/CauvGRqwqwd4VQlUS9UJSO8ffPvrzmu?=
 =?us-ascii?Q?7LvGNIy1H7kVec+OpS0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:44:19.5532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac7053e-be71-4efc-e84f-08de3ef3f247
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6169

The current register definitions are not in sorted order. Sort these
registers according to their address. Put bit fields of the
corresponding registers below the register definitions to clearly
identify which fields belongs to which registers.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.h | 49 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index a7f20850741f..482f836f7816 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -13,13 +13,31 @@
 #include <soc/tegra/mc.h>
 
 #define MC_INTSTATUS					0x00
+/* Bit field of MC_INTSTATUS register */
+#define MC_INT_DECERR_EMEM				BIT(6)
+#define MC_INT_INVALID_GART_PAGE			BIT(7)
+#define MC_INT_SECURITY_VIOLATION			BIT(8)
+#define MC_INT_ARBITRATION_EMEM				BIT(9)
+#define MC_INT_INVALID_SMMU_PAGE			BIT(10)
+#define MC_INT_INVALID_APB_ASID_UPDATE			BIT(11)
+#define MC_INT_DECERR_VPR				BIT(12)
+#define MC_INT_SECERR_SEC				BIT(13)
+#define MC_INT_DECERR_MTS				BIT(16)
+#define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
+#define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
+
 #define MC_INTMASK					0x04
 #define MC_GART_ERROR_REQ				0x30
 #define MC_EMEM_ADR_CFG					0x54
+#define MC_EMEM_ADR_CFG_EMEM_NUMDEV			BIT(0)
+
 #define MC_DECERR_EMEM_OTHERS_STATUS			0x58
 #define MC_SECURITY_VIOLATION_STATUS			0x74
 #define MC_EMEM_ARB_CFG					0x90
 #define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
+#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
+#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
+
 #define MC_EMEM_ARB_TIMING_RCD				0x98
 #define MC_EMEM_ARB_TIMING_RP				0x9c
 #define MC_EMEM_ARB_TIMING_RC				0xa0
@@ -41,44 +59,31 @@
 #define MC_EMEM_ARB_OVERRIDE				0xe8
 #define MC_TIMING_CONTROL_DBG				0xf8
 #define MC_TIMING_CONTROL				0xfc
+#define MC_TIMING_UPDATE				BIT(0)
+
 #define MC_GLOBAL_INTSTATUS				0xf24
 
-#define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
-#define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
-#define MC_INT_DECERR_MTS				BIT(16)
-#define MC_INT_SECERR_SEC				BIT(13)
-#define MC_INT_DECERR_VPR				BIT(12)
-#define MC_INT_INVALID_APB_ASID_UPDATE			BIT(11)
-#define MC_INT_INVALID_SMMU_PAGE			BIT(10)
-#define MC_INT_ARBITRATION_EMEM				BIT(9)
-#define MC_INT_SECURITY_VIOLATION			BIT(8)
-#define MC_INT_INVALID_GART_PAGE			BIT(7)
-#define MC_INT_DECERR_EMEM				BIT(6)
+/* Bit field of MC_ERR_STATUS_0 register */
+#define MC_ERR_STATUS_RW				BIT(16)
+#define MC_ERR_STATUS_SECURITY				BIT(17)
+#define MC_ERR_STATUS_NONSECURE				BIT(25)
+#define MC_ERR_STATUS_WRITABLE				BIT(26)
+#define MC_ERR_STATUS_READABLE				BIT(27)
 
 #define MC_ERR_STATUS_TYPE_SHIFT			28
 #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
 #define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
-#define MC_ERR_STATUS_READABLE				BIT(27)
-#define MC_ERR_STATUS_WRITABLE				BIT(26)
-#define MC_ERR_STATUS_NONSECURE				BIT(25)
+
 #define MC_ERR_STATUS_ADR_HI_SHIFT			20
 #define MC_ERR_STATUS_ADR_HI_MASK			0x3
-#define MC_ERR_STATUS_SECURITY				BIT(17)
-#define MC_ERR_STATUS_RW				BIT(16)
-
-#define MC_EMEM_ADR_CFG_EMEM_NUMDEV			BIT(0)
 
 #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
 #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
 
 #define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
-#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
-#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
 
 #define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
 
-#define MC_TIMING_UPDATE				BIT(0)
-
 #define MC_BROADCAST_CHANNEL				~0
 
 static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
-- 
2.17.1

