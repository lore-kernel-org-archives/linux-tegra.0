Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F58D286430;
	Sat,  4 Oct 2025 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759605113; cv=fail; b=gYJEE8QRcRO1vZT8E5DyFuTZAutPsu/w92d/vbjixSgYRrD3bWRyDjY1KLMM76IyBsmfH5ck3wo7TL+eeeB2Mc/KdlaSznFSCu2rXVNJiyQhahUzPWAeZ5eHlNy9EYdodJpuACSxn4qZZSmV3zf4sAleZSx4uiAP2tEFpsdg4tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759605113; c=relaxed/simple;
	bh=2OjvlNTqfpQS2ZydKPB49s4URjxhKx0QgfchdJ+/+NI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNfRt0IjU2OmgyQg5eUsqfPoMPKyn+TO4y9NpOaIQLmHgC34NqlhDVrBHOFw0G1Zj7b7giXh8+2xpbwChm4xWQh6k6MX+/N4hJVB0mStPPZ8cBk13IUZ8B02neOujZym5dJxrLLSXf0Q9vBAo0EoAfBWDyHOL502Y2EaBsvYGro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JWJ0mqSw; arc=fail smtp.client-ip=40.93.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JWJ0mqSw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QagAXgTf9MZ5rwt3fD4Mc03J1IdHneksnlomoT/cvS3yTEPRyrzvj73Rogf/4dSrWdGyf0/zJ0LNEz9maNk5HECIjwIV9oJVoM7sFYbBm27qETKkp8TVn/cwbKe+wJ4rN5M4ct7jBsfdttxvhNuxJlgBg2xBIOL7bKgBP605lSgMsOuaqNPljO2yJa9WCITHP5QqwFJmtar8kKurK/2MgEazcPPzYEMRECRCnYnI8Rqp31HqHMRuiaBQKAd8tWlZvg50hL9WPxD22amSff6h7MJDIjhCd2Wb033umdueWkOP7l6d/vLIDuTV0oh5pzkgCWo5oWZGkc9/bokzNu8yAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=iOkW/q5UyaYipx92+TxxFcpjoeP9JkFOtNTh8MxL3m2wAxdlsI5rEbDp4uOPAw8otnK1soegZ86l4czEH4CDcbXLZ0Ivm7G4v2CIQkBoQeKu/R/NPj1jTnCXaDZGkGVgGR4FOjYOJO1NlnkadAw4mdCgpq22pb+8PgrFJaB8XuWR8CE1+E049dLpJkw2+ft+XUw153HhKHQVTfukeTlOgrWx/4kGk4ii4etgZr3hDPsWXpT39nIp24k/D7ZUjXh2kHkdGUeyPAEshSt4GYCR8D2EIzT+Aw1ZNgBNjXEnrnCpxKIzd9UsrEDoykg43XOw/kzyZ5+HuFAtDmgHYWih4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=JWJ0mqSwz5liIrpyBhbCKKcooYukWmEOUkrSPbwGN+CYBm4q9zMCt+aB33xnGy3C4J4I8pCfWJh4xlQOJfCMyDYOfe/DPNbq2jp9c9IcaZf2QZpgWpMeqO0bdK/L4YqPx58PVM5zUKik3KGHI5Pfiwe/LaOGd3PU0NQ0lzFNYkWMBK9TfuFaoEAehtfWVK17G9dpbg3mGFpGhR80WnVsxtaeeJSwbWhmXZJqr6LfEDqwfMoZSJ+s3FoISs7eN+VH/qku+TS58qWKuE6LvPtW21iWfI6IRqvBCptaUKql9sYt5jUJ7xghVFD468CcGDvQdavc48cd25/vEirxbxZGEg==
Received: from MN2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:208:236::22)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sat, 4 Oct
 2025 19:11:43 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::a1) by MN2PR05CA0053.outlook.office365.com
 (2603:10b6:208:236::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.7 via Frontend Transport; Sat, 4
 Oct 2025 19:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Sat, 4 Oct 2025 19:11:42 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 4 Oct
 2025 12:11:38 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sat, 4 Oct 2025 12:11:37 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Sat, 4 Oct 2025 12:11:37 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v3 2/4] memory: tegra: Group register and fields
Date: Sat, 4 Oct 2025 19:11:21 +0000
Message-ID: <20251004191123.2145307-3-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251004191123.2145307-1-ketanp@nvidia.com>
References: <20251004191123.2145307-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e155974-32ed-4015-264c-08de0379dadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+aqxjxC5EnELA0uUko27as0cdJKilnoYRu85V5ZXpPRaWteE+wVsZJL7Sl+s?=
 =?us-ascii?Q?FWLwmKW0PmZd9JDm/KU7B++Nq4LOZNf+lSN9cPCMGQBR/yHfgaWELJyDhX4V?=
 =?us-ascii?Q?8TEzo3ms7I2KKdaru3+nr2F2GDr1r7Pt/EuY0BsnhB1eyIG4S0IWdQ/qLoP8?=
 =?us-ascii?Q?c9fs+y4tF6Yv8wyAeF48Y8JbfjfVtf0tupdYhcFX91H1htprcKkU/fxAlPCQ?=
 =?us-ascii?Q?6TUjoVL1w6EhiSRB2t9E4dXXAL+KlicXprgyrgiSgC/7bsYUGdzVdRbLUUbf?=
 =?us-ascii?Q?cb5nSxM+s010knAb7r4MQVQ1JlqCycV0oZdSITQvqrlRObUfSUN31QqeBsf3?=
 =?us-ascii?Q?f4dPr2/FM3cyMpUb4VTQHm8UaY+8Mx3fM+c57D7lUjFV9JXCdbW0BbjAOtCr?=
 =?us-ascii?Q?nUrdDKMmk83HGI+rgnByID4mw5+XBGffAjFCyFSck/zGBeUcgN5/3rxbrZUA?=
 =?us-ascii?Q?Mut8XR/m3z3DqqfazatpT6gXZMyFExcETxun31UQOPJQpsDMbfuWxwJK2sKD?=
 =?us-ascii?Q?puKPYEngX7I0zRvcEnk/8sAuw7M6vT64Shs3qJfF1ggKxP5kjBC0O8vEs2Ci?=
 =?us-ascii?Q?nosjxDC9sHU3IEqh1i4wD2ff404NoVuyC+W6RE06x55LmjsR2DSgoO9dR4XC?=
 =?us-ascii?Q?XVCOMD+YzGa4wRBzSxOdK9Xpyhm9VtZdwDxeVjKGAFOXaBpUNDhZPL/b4i0F?=
 =?us-ascii?Q?hSCqEt1aDT12z2MftGZK6rISn0dvV9lDVhs3MUfihRKehMcQbCJNtFzE+GQW?=
 =?us-ascii?Q?J7otELUY07PsyzNRzrExPZBtuelJBZt32//F4RYVmbXD03oi0BCGCd2Wy4FK?=
 =?us-ascii?Q?j1G3yIJ7yCSyZn6Es3RKnKj3S8Ux1iLMU8wOSphFsk1BVOH3j/PIHjwaFe52?=
 =?us-ascii?Q?7/6k68yb0sQbUed8pesRgi55hO9UBySQwQnlUK1baWkibdNLxT+jYH7wTg+A?=
 =?us-ascii?Q?g2NujGebtg++u3XNAmMGCRpuowRC1W/RWL26NXjH8MlrxwfAyqdCGIh5s41n?=
 =?us-ascii?Q?xxdy2h8XQb+sqz0ms8aH50VibY4lWV4ZJSiS1tiw3xANLO+XYXanDPznLW/H?=
 =?us-ascii?Q?P5FBUGs/KxQkBgSHop0J75o7CoTBf7LPGiFxBVXXuYmYjaSB3DEZ8K6bXWfz?=
 =?us-ascii?Q?2kI/maqx6lMuxG46ZxnQY6KFSr7MLVwt636jZT1wCweBKsvkVHZlI58RsUsn?=
 =?us-ascii?Q?T4Y4L9WnGYQRxGXS4V3gByUz+mdpOJBM9UcWTv4oWHr4mVzwaj5SwS1Hispf?=
 =?us-ascii?Q?Kt7V+bGEAQUqQ3OG+5yLmqvI/Xl0ImiNrv2jWxKXyPo/kBG1Mv+r/drXX7Lt?=
 =?us-ascii?Q?N0mFb6C8895toAUJWtyp2nUhhi7JM0041HG72+z5VrMYRihml2kg/3rYTFCc?=
 =?us-ascii?Q?Job/uxtKQlrdKmN4p7+fnR78Bk2nQNrW0zSa6nQBlS8Of6TMvstkuumyiNFa?=
 =?us-ascii?Q?6bsn5Gogi7dGc4nTvcGI9h+YWKMJ4gKFRknxkqXgvenKM8ukUsSKraj+wYPO?=
 =?us-ascii?Q?wCp5BuKoufzxVdzuGPVhtZ50cMVfKUu6K/rNAJ/sgZqA4oQQ6rrB8A/j0Yp8?=
 =?us-ascii?Q?9e4tlHmYo8mLtmtLO2Y=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 19:11:42.8565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e155974-32ed-4015-264c-08de0379dadf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580

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

