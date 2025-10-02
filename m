Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB112F360E;
	Thu,  2 Oct 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395710; cv=fail; b=X6T3v73r7H64ZMZZoRKnythOGyxfM/D2VmdIOUCvDGY1/G8lafYQngnqlvWgMqEvdnhkmwrpfm/SwIP/wyM03LZKIescHj85N6o6SV18Ef8DTFLjv+4ED54/KjQRbAsYE3HwvAxaXk31u/y72sreDGxqxAghSNUcDQFmmCB8S+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395710; c=relaxed/simple;
	bh=2OjvlNTqfpQS2ZydKPB49s4URjxhKx0QgfchdJ+/+NI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4w6OgmfEDUHnJMemAd1CwpFHEX6txFUdWwC1R7Yb/wRtG8+9eqTt8i2CfBU3n189eQbPWV8qQRYwxVAwrl28a+wfCh3nIMk5ZZePih/o/LGChtP6cJQhGp0/FzV/yHzFkCTcvHsV2LLnCGfzVtnqtXOqu68XG9SEnFQY5/8l54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SjoaGLqE; arc=fail smtp.client-ip=52.101.53.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SjoaGLqE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uzugw4YNRGA1HdS6JwqyOAHlBp3tvU/7rwWa5kQpe31/aIdLLIOuPTS8XzdW6MYAIdY0WpxuYMM4/tAFWQd0nwQuTw4wyATbJgvNwo/ARTFO3pccA4FT6HqqEq/bdu2JLe5rA9+rI9WsiWRd9ADRgCzF/aAf9ePAJNRqdD5wOZox/Ln4Rlrkd13jT6C3BE/bEn2QP0r9ydRJDnFIJBkHeSlQR2CvSDRYBPPuWu52KzPeH52dm2vTMj6ygOcZz7RNev1KKg0rC9SY2P9p5bCdFvlQ18ddPvUoLWL11BJnLV/sUA5/fHGi/3080T7tepPvqLB8LY96Op6IL0JGpiAobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=LmW1HxNJSb8oUtvU/ngr3uQX6YQDEUwkhq8CujqUTx71jYc8p5gELVs14OW4UA5Z2bP2qRmI+ERbVa1hYT1AaQNZuErU3LN3bDpI6AVuZN+FjrMQTRlhTg9yF94+Nvb44K74b5qzDplHHwtIV+jcvCt9KPfsUU1Ye5dkk2eElrwoxMqlfll0xRDx9QEPmTW7s+npOmacKembyofGEXToBan1du8n7cnSTeYIJ9INwOAkNmIPhgwxUvDDUyt577RVLrZfbJQKD9VKLhOh4a4Nm6+syI8yraBKzOCRyticCWkKGMlI2LwhN89I6xpQLGYriZtaZHYssD67FhaELFN9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=SjoaGLqENrr6z1eVvptQwwcwWwvne+Hev9aI4TNdBj3ZMgPwijaC741R0QUIbXyDNZJg52h0RboN4if4jo9hLiXzTudY9/pCJNO4Wmkc5FvjujQb2beT9y3tvmstYCYLFljyyCoE6vqUzmDD1JI5Ir1SsJ6pvdHYEosZGo9gKnrwf0VjaV4YJHTFS84BYsJshSojrDsqQTstdutcEq99lZzACQUoBnwJVtx+dUB/Jnfc5sv2xUJNXgesdHChBFqtqZhwLT0I0eK3upgWYS0d/7/tmOdH9BCVnTpNw2hmjRcS3Mdzo7wg+uxmyBrrF5C0Y/vSfUQTaIvKWFkGz0tuOA==
Received: from CH0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::16)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Thu, 2 Oct 2025 09:01:39 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::b2) by CH0P220CA0024.outlook.office365.com
 (2603:10b6:610:ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Thu,
 2 Oct 2025 09:01:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 09:01:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 2 Oct
 2025 02:01:27 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 02:01:27 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 2 Oct 2025 02:01:26 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v2 2/4] memory: tegra: Group register and fields
Date: Thu, 2 Oct 2025 09:00:52 +0000
Message-ID: <20251002090054.1837481-3-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002090054.1837481-1-ketanp@nvidia.com>
References: <20251002090054.1837481-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: b53e4b76-7e87-43c1-085d-08de01924c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4+S4xAO4xgeEyoqzRaL6HGxrqGHfJ4+G8gJJ4lg3fTKKcS16+kFdfoQCPRxt?=
 =?us-ascii?Q?dkNsQhzCEk6u+CwPQpnUjXouKfldWrj+XPnMc+obVFVLf3uNLVGrNzxOtgjU?=
 =?us-ascii?Q?Zym/6r2U4B1WqOkpp2UrpUPzTQf4jsRmkfEM5BeutfQbrKQklJgUpknAlPZV?=
 =?us-ascii?Q?vwaWp4RFaMfqh+VVcseYRD+CuRxtdHJlxgQvBAm5yFdvfQq9ZZGw3GsDO1oX?=
 =?us-ascii?Q?LMyRlGmlBRPvXd5w9ogDonMzKcl2o1Y6o1dSqaLg4PDgAuRru8XdpbvoX27a?=
 =?us-ascii?Q?5rXElH4uw8W/q8jaPH7HAnzZQW4ZM0gEdi4+5tCpBC+sCeobz73x03Cokw/h?=
 =?us-ascii?Q?fUoRuxfpwRdhtEktVr5p5Wc8sEMlZvMSn4igL0Fs//Yr+33An36I5UaM7n2t?=
 =?us-ascii?Q?vhNdGM8NA4fZtBn00tHtVd+AGnyItx7C/1gnnZhw2NVfg+AXZubOliHbz/hb?=
 =?us-ascii?Q?Ll/Gm0ngNrKUYWM20o4uR1P6qfMbW6C7eTGTDCYk4U7Zqxe57rHuCOk/7x1P?=
 =?us-ascii?Q?etbK7ROulV/HpjJjUUF5XOFE6u5x6//eRmKyR/h/5emCoB6zofhZMnSLTLqx?=
 =?us-ascii?Q?kWjti9JXxYDiPlzZxfeo37XEIHdHqc60G4fS3GNuD9Vn03I+5BXsoCRB5oNq?=
 =?us-ascii?Q?arSxd5eTn7zsvOlm7mnsnb1cS+mx874Q7Lg0HScjlrmLI8GW9W+Tei96TT/T?=
 =?us-ascii?Q?G9a1ZocJ83iLG6m1rFONaqdaXx2W8z/nNFar7TgtkRL8azx5OImWXjpuGPnu?=
 =?us-ascii?Q?bdzodUtdV4mVnHwnK0bIZVZx9Q7U9p21PAR5yOxzGNm3q2ddGSMa2MDg4IKV?=
 =?us-ascii?Q?xOcmK3pQFn4TEVLfB+vE3ybZwoxzFdAREVtRhrL8YuGvM7ncOuBm0P7y3O7D?=
 =?us-ascii?Q?Oj+EySP2XKHKMLd2Z70fFz0DQVIRLkV3ygq78Z3BVNFpiZLrYKsgf/gTp0C4?=
 =?us-ascii?Q?U9kiRREee2wWefy05FRut1ij7Tjijw7ygGI4Lu7sccrtMnSXoG1wL1ruzMq3?=
 =?us-ascii?Q?MIhjOpS2StttZYd9fw6WdHy1wFd5QBxb4O8SUtkKKubMKPFj1N1st5GTVkZm?=
 =?us-ascii?Q?R+oZlukIhWX0HCcy+dJBr4uewaVFSEoUcYIPcscL2CclTp2O0RxhRUMS2a+g?=
 =?us-ascii?Q?d2H+DNT+F/Eqe2JWAJX9KJzXm7JiuH0UQndOCWj0qhGyWej140hHxvLkZfEk?=
 =?us-ascii?Q?DmLVdCqXtC/id56OT2W6q01x4daub7SJFr8Grl+acmON2hsbCA1r2Qd04g2O?=
 =?us-ascii?Q?tiCvZAamt9565PdLEDrAH19df7NWGmZd9qFu6vuouQZ5Mib3zos9NGF0BXX7?=
 =?us-ascii?Q?0V2B+crV+nEBz3yL5tjCUbDy0jEnNRDpqH08UCAN4379ygT9zLgkWlkvI1qN?=
 =?us-ascii?Q?34WzKzbYOXUl0edDD/IpRFsIF26Ts0v35LQvwRp/TE5cRzGCVd18G7JszK1A?=
 =?us-ascii?Q?O+oovcqnxY9MB8lf5tCF7U0oNVfL4d260+i7jQler1rdOcdY5US54z67V0PC?=
 =?us-ascii?Q?E78Z6f/wND/1J5iFRXBwCqy+I5pt8U7TI5brp4NkkP+Eqz+JmqLrnMGaOdLl?=
 =?us-ascii?Q?lbdYUniAlHX1sLext6U=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 09:01:38.9466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b53e4b76-7e87-43c1-085d-08de01924c5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323

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

