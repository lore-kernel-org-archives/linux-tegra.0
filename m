Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3414A477995;
	Thu, 26 Feb 2026 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123525; cv=fail; b=OQzb5zCZSxEOGZzYbXK7cdGa8QfuQhnfhdMSjai66XjrnhVeeh72BJHu7QASmK3Q/TwsnTK0rxkLFI+fcRqbQEMpaoV9JHcTtl6m1HgUskttnJq75PUTIocR0uqqcMxzXvXT3Ud/2QXZvVGLCBA2YY/ckh+LAy5w4UCFUOMmZcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123525; c=relaxed/simple;
	bh=JBHft8+p8NIU0Wy8BZccOino7AAx3XQ8uXpnWACqypA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hm2kriaTuiviK/v1zjndNrCI8JGyq5df2jxI6E3Y98uuHCLeWb8afPe+WCjFxcV0ThIodnty/vv977HgiunZGax859A3COmqvHnaxXVq1UP8TXBwv09IcFUEEnFH/XG3Bcp0IsdhP3YnGJlryeBMDz4Re0/I6RLGr+930ZkiQjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZoXJcK6a; arc=fail smtp.client-ip=52.101.85.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZoXJcK6a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCI8cpOvaELetyXtUaE5KW9Uk6Z4PUDdPD8rdCBlQhDjcHPqp3yZHOXuR1C3xdSX/HNEvWOXNwYUYeJPfNkMbuCvgWtuA89YDhpEx8JbsL/a/k5kj3HOjPZDHLkx7jvgatxxG+tQngY2XgdkFZj+6Z4CpAeWaarxEu1AEz3Adt91PookJ2+BgdtZzmeJxPHbsLuMiEbaZMXYZDQxPo/uPjd0BHpomQr3eQ0bFosbfpCk28rrOqlEfRluhfoaeztZFYCrOvIvpQqVbTn4QMjefYSSEUEsjelFGeiz4sjqvsQTS/2dSqisbvAlqXm9T1HPAYUMxu1NP4G92j4Bwmoyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qThP87H3FJ7t4Bm1czLg0Vbh//Zr+WTwyGBBuQmTeDs=;
 b=InjZ35oD8yPzE9oEQ6IswlAmsgAXPChgZQugMyfoHomKhvLeX1d58BLvf7DbyuYVn9hH0SKntP+C37aHFriR77lBttGQLSnpxve5hh2iIl9U6GUB7Sl7efG+GVbfSwkS6uSTa7Kk5WAksR2cP6iIY+GjsLugBsc5GdgdF/5lggRaElAzLm6lpfG8rS9fYe4zbYpr9mtrC4Y7Ko1/FDkaaMw5aRujXc1qSTe5MOBICPWV0fhjRrp1hRG8UhRjWvgWBnLC5nZpkoJtOC2LqancgKcUxshmdNZHRKkP35oskyZcsfRiBLvOVSrgxKPbTduhS+MvvUzq0+5mcsAGbexFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qThP87H3FJ7t4Bm1czLg0Vbh//Zr+WTwyGBBuQmTeDs=;
 b=ZoXJcK6a7DaDhq7ePWjkQxV8BhmYdWgr1SIZVSr/mV38c9Rj9tuFTydFcTfVxe5PDnxPbqzUIAUbe7wZpT2Q7CgpEXSmZdseMpwm8tX2wYYAk4lpqBbOxM8+9jgvcXUdif5Ot/5XL5+q+BNhvq1vihHmu49CerJJxHJJM04jngkmG1ZlhXpldIjTqzqGFRvQyw0ZYVv6nwm+9vLK56Cl4599+DeKAXau9uVFdEI4ifwI47kTmAQV5NqLyAZSHvVwCbuqicpKArcttyqlJuL0ASoFg8gkE17nIWipFJYPK/goyqIMEIUxRdAm8KLMw994tDJYxDhBhhnZf7gyhbCNgA==
Received: from SA9PR13CA0013.namprd13.prod.outlook.com (2603:10b6:806:21::18)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:31:59 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::a4) by SA9PR13CA0013.outlook.office365.com
 (2603:10b6:806:21::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.14 via Frontend Transport; Thu,
 26 Feb 2026 16:31:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:31:59 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:38 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:37 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 26 Feb 2026 08:31:37 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v7 2/6] memory: tegra: Group register and fields
Date: Thu, 26 Feb 2026 16:31:11 +0000
Message-ID: <20260226163115.1152181-3-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260226163115.1152181-1-ketanp@nvidia.com>
References: <20260226163115.1152181-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: a854fc45-4b4c-4dbd-e699-08de755490a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	IUiR4vTrrE7UAkBQu3UrKCDcj386lMbTATJ07hPK9zftU6dQf6za8AAhLenbSa+1OtVNZrmQtg1M1Rz+2KtKA8cnhE/wqoltV9j7dfZ1ToagYzWf4K6mtBo1owstSW1Hn0wALRjCLenNMny07aWU1A8Q6ldM4u18bfc/iAylKoGokbPgwZcCZXrjzj+zyof5wCsxB+1Vwgu7hpsYFGIj/wx4t/82e8PeXBdT6Tj6ItielZ0ZOeezqfPVnarenujo0ZBRe5CwiobYSoSvDGZM4sVTX3eoVOOxCZwEvla4xqIJgxMLldmX5PxJ1emAP74EqynvGE/+E55rYkpLKJrQpt+d+nPhuJirrIfNOOIs89iSd9UVREUCFUpUCIXvvMB84w52a+YxCFmwaiURmifh0g0mAPCdclUx58MPuMhM3hRSovzclJOM0Tuq9J12K9v2vWB8PwxRWV/QwoMDI3TPsUERzK4CwD1oLf7Dptq2KLkJvIa6n4e9JQKBG7poQlMmsNlQDUsri98EKga0PWGteiq3T0F1kdPrqewMKkk6/ZD00dcCFy7Mwobmn83o9qQX4qM7B1zgFYYXQuI6jITb6NUQ0bhfJ8jHpNKA3m6vMbYtSpN/kY9MOnPBX99gdpk6Tq9RLcO3wepbNzTCmOGHxMrAnEwaLddFAlfD3X2i5/3TLAiwTCe5PKlcUgXyuJszwBK5fGEh2RyHl1fFu5sgDrs3BOepD8YVq7DupneBSYeTZ0MvHkCifoWmPGBz8jpWNWTGnLvMZKRNmAsqFkewK3DZfvMu5wsNkHZQwPs0219xIj20tobMRQWUGKwxGxl0ohzq+fZWp9XalU/4Asczxg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fE8N6DM1I+r0VQk1HrTWBtVEi/gi+90T2AziwzyOrVMo8OiuPFF76pOYP+taFgO9ljLU0T/ACD51NMwCdFwiSKeCba7KNifzByJwCmRgeq5vWfdWxxgAMpqgUS9lfK0y82yPRgtpZ7z8G5+8shztm0FnfUyr+G926R3t6rYRZyb9dSsGo+wQka3ltE4+ZIWotISY0lxCy4aCmfZqaRvt3UcxBdDvbHweUT5Gxb+6VdO0K4XOj2GwQoCGz4IGLvQu/M2WxJaGtjNLSyUdnGPfCFkYY3j5ehtT0lT+/ROWaiJcvItAEDrVUMAOC/efbNjnQlFHT45Z5E8bRXQL3mW/jDkT1lTrS3XAYzlxkORwvg/qWFHnEKuKQiVzgjbnHDvv5u1H4Bg5WkbuP9ELLR8QdZUFQvAyf6J3ysX9mxZqVy8KlhGO01Xkkk4TkMrjqH1W
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:31:59.6356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a854fc45-4b4c-4dbd-e699-08de755490a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614

The current register definitions are not in sorted order. Sort these
registers according to their address. Put bit fields and masks of the
corresponding registers below the register definitions to clearly
identify which fields belongs to which registers.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.h | 62 +++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index bbe3e2690c64..5f816d703d81 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -13,13 +13,35 @@
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
+#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
+#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
+
 #define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
+#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
+#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
+#define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
+
 #define MC_EMEM_ARB_TIMING_RCD				0x98
 #define MC_EMEM_ARB_TIMING_RP				0x9c
 #define MC_EMEM_ARB_TIMING_RC				0xa0
@@ -39,45 +61,27 @@
 #define MC_EMEM_ARB_MISC1				0xdc
 #define MC_EMEM_ARB_RING1_THROTTLE			0xe0
 #define MC_EMEM_ARB_OVERRIDE				0xe8
+#define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
+
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
-
-#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
-#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
-
-#define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
-#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
-#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
-
-#define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
-
-#define MC_TIMING_UPDATE				BIT(0)
 
 #define MC_BROADCAST_CHANNEL				~0
 
-- 
2.17.1

