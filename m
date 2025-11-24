Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E152BF013;
	Mon, 24 Nov 2025 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005754; cv=fail; b=RTq9Y6HmbxTERz2VAMyV4XxKJzyXmvyKX1eQbmtBm0iqdWfvClbP3XrJD7wtj8SuG2W62iWVIHXrgZhGz8BxvAQ88zPmNWCTeB42s+O+eYEXBcivcLtNAPkeZ66YlSu1x0x3EtR9zFT5KmDPCB7U0OPp4Qo8NN6tDHitMu9ODyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005754; c=relaxed/simple;
	bh=6F3ykuLXPSzUi8fX0EJOjO4ux4DEVTw0zZKlYdyVz+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fkf4hAA1vTqfTGJ5D/zXVzbRBNQhp1W5ZXQZqPh/sxV7HW7OG/kJCV4e3Pv741n9qjX4WQXhMHxr81TGtnfIsELqk3wVZ131paXjAMDECjOZZDc7DFDLjwVGOWKmsaCQYgDa1yZzbueNN2UDkAa5F8F6TuLEV6RL2De7PkOpJr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lVCpjoLB; arc=fail smtp.client-ip=52.101.48.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lVCpjoLB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UimP95SqM5QquWEI2F6rfWYeqUEgSdhMb2J+cTVfDGLh9cnyv8yYJGjA5Q2PUr/oJ9ATFGYCXBWTaWlgXheGSewwCQUCfkZxrDyX7K8lX0l+ueEAwfyKMj+L03smx4EvmGddn7Zs8mtbfEF6b1rQWRRc1KJuSnzOjYqNlSsOlgt4c7515kD2OuSinkqp9bmLfn1OcUKNlz9neiLwH8D00t3lFQ+NYzqXCxV2maJ6KkQ6wx/0k6pAWxFdEeR7BXh6xW9Ny8tF87ZxlZ735ZBmJTYV2oQvivf1/BJcOl1BWKF/C6UsydchjvAT5bH8yomOg4q7+Uez0Izp/sKzR4QWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtKIInGR8ytCh5iQbvhf4WvifvrJQawOfp+dalsDqno=;
 b=S5MtW7GbszVxc9X3qFPmIe0/s5MCiOfHb1WgLNlnuPnSG3jW2tel/4AlgeyzZeqiYg8DkHDDkzGGdjINc5kUJoraFspXd+DGt0KMFlL5ibLPYoS8lwxRRP/kNE4VYPgwPMeg0YZqTl2WJuUQcXQpMyyiGTy8ugEkOLpm13G4iHYKWvKILdlYc49JMXjYiUPr95HkTxmM82iT5G8WG4uOKvyC4RWE3FI9zN8/wu98k9Lv7HkmSqmbSy/W8KxrlMAdAqzbXPfFEmRWa3k3e9pYutR5MlkvMYVAQpcMmxKifuaHnFLZgX2OWkNdAonsH4JLjSSpsEJb97Cw3BUMkToleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtKIInGR8ytCh5iQbvhf4WvifvrJQawOfp+dalsDqno=;
 b=lVCpjoLB6fz7qA9gpCAf6ukVvHn6owdzOyPwvB0d+NKU2iLmj+pe6xvXDJl52QLv3rQiiV5eCDXAIN+GZ5/WN6wo8pX5PjBSZl8iGqqZDBGCi+cIXOj+IPB+YACHVZKYEapQMiWtpfNeLX0Ki4l0HKv2rlgHHP+NdX8fMGorYwFXfprNXy0euC5NXIB4o2WVW6Z05pSzqP8E92p3TUje3i6K2TZs0ksc1OXOXXSlLqG4A80lipt1L3H9jcqwnyp1BzLRBueXSkpSKabm1PadlUoSmWrOP+9cwFvRuOzNQQdVk72mq2/gOUaWC4+9qTpQBTls9t+6C4daxxKsRLbxFQ==
Received: from CH2PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:52::34)
 by DS5PPF4ACC15C0E.namprd12.prod.outlook.com (2603:10b6:f:fc00::64c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Mon, 24 Nov
 2025 17:35:45 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::d7) by CH2PR04CA0024.outlook.office365.com
 (2603:10b6:610:52::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 17:35:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 17:35:44 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:19 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:18 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 24 Nov 2025 09:35:18 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v4 1/4] memory: tegra: Group mc-err related registers
Date: Mon, 24 Nov 2025 17:35:07 +0000
Message-ID: <20251124173510.2602663-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251124173510.2602663-1-ketanp@nvidia.com>
References: <20251124173510.2602663-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|DS5PPF4ACC15C0E:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c59251-0ddf-4f34-a9ef-08de2b7fe5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EvGyd7JCQayAMmZcL/Ui5yTJnVPYO3BkD/qbwQsJcu3beECHBt8MTUWNBuqo?=
 =?us-ascii?Q?+fxTnIpDftIA2lgEb40ax0vdYL2VOSFUBUcC6kRjkLbQn4hBrfHXLrSMNEfP?=
 =?us-ascii?Q?oSCGAWH8mKw8+445i/xBHYgO7NzbqvZHKPufwLtnXPrbflM7QwDjPO8fxzww?=
 =?us-ascii?Q?4zP5iombRPn7uk4NPw0KJWE0wXpdrwKwfZtcS9TzomoKEBvSUVyq2lt7Y1ZE?=
 =?us-ascii?Q?tSkz4PA3mLGAJZJ8mHryTfqFBkgGhuhz9M3zS6JwgELGqC81+KFqNfpDfhHJ?=
 =?us-ascii?Q?zG1FZUhwgA7fwoUVqeqKy38qRutqYE8ZYi+1fI6iJKjzCJXhKf+bMnikWZMV?=
 =?us-ascii?Q?3Q6hzLo6bTQAEB658Aajzw/IKw+JZrTSkhsF7ZLUyVwCxgvGnNnDDH2hAbpg?=
 =?us-ascii?Q?/RP9owUw3jikGLehhLgxBE5El9rCbBNiq8T5/DjGdS7xi9e16ul3SSD9b+zD?=
 =?us-ascii?Q?UZYxw8bB32eKexGsUYFwq+J1NjlxeI3pyJgYaczhA/IsEdaOOBofGosJCzqd?=
 =?us-ascii?Q?3sHQwDbDIvz3fck4pBLP4651oC7nVpC7U7b9dHisJOpiR0QlVj3mulamrLch?=
 =?us-ascii?Q?SbEZYAE/u/TUG7AXVzvB7K4gPLc6QFp/XJ3x6f0gQ0OS5MTe1CJ3odyiXGgW?=
 =?us-ascii?Q?w2LlKUglzRbOie6qnkTvWSlNv9HlgBAuKIpaS+VLlZPnHL0Xwo1Ds+xRzKQA?=
 =?us-ascii?Q?oWf/4qTxRRnQkgcmAxP1JG0CSsUSwUzRWtec7yUhARYmXVJXqsdvqTtvIcH5?=
 =?us-ascii?Q?p8VKIsak/PYpbJd2fggF9AqK+B45yidmKDRZ9qJb9PZ0n5rXScis3JcCEF7u?=
 =?us-ascii?Q?1ztE0au1mDaDBGEzPgBwlvATgWPsHUKz8a44++MMLQpkVVaqZB1G0iY1KcWd?=
 =?us-ascii?Q?OdVsAxWi73wWN3aSbksDxjTZSyGb++098AdfthxEXJ95pS8ZlxWQaftDiEpb?=
 =?us-ascii?Q?ds+MvuULdTjdD9BE30Jokkb0DdA8jNeYdQbQCg+JIs2L2BICy3s7mdE5Cl5N?=
 =?us-ascii?Q?kwZKTmkLuNZ8l+VbXMey5uhdyXyKX6iqO98bHaFQS5CgadcY96/Cci7V5XiA?=
 =?us-ascii?Q?R5na+paIpmHfoygpupzVOQsh3VLWQ76EkF09kGDnaJMd3GefzsFmrjdbusgG?=
 =?us-ascii?Q?s/pX4FB1c9hZcfYDGdDMmWTk6+XNWbcIwxGj7boOZwz6KiNp+PAJ7EhTnnU7?=
 =?us-ascii?Q?1TvylTO1vPQ/tPfJ9XR1d5kjDj5h/fytwQJfnict7P0DmkDEnERWyPQwvMdx?=
 =?us-ascii?Q?0noUFKHHb2ETPBXsAFo6pMoWdRIJOaWS/vFEvyYCkYsBuI3R8TthhiN1K2ck?=
 =?us-ascii?Q?LZStwy+UGsx7Opj6dMlR5sTDhH1zNZ2qg93OH1HgMcWT5m2tqODxPMh7rDE9?=
 =?us-ascii?Q?wHqxbsRUw6rhpFveWWFRzcfuxTjJjJwo2+jsVaBfbhDF3ndlXUVEbMksg2ia?=
 =?us-ascii?Q?vmVAkoH/rca8S+TbBGYPdGViXjzh6gUkOh2tAFQQ9IryO93wxF7H8WKYITT/?=
 =?us-ascii?Q?riaGNme5st6UlGzaQV7vaubJC9SiLmsrSqF72CTcBwnT8AO/KhszpEG02XII?=
 =?us-ascii?Q?5GY6BRS61XZ+im1M/tI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:35:44.8263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c59251-0ddf-4f34-a9ef-08de2b7fe5d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF4ACC15C0E

Group MC error related registers into a struct as they could have soc
specific values.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 45 +++++++++++++++++++++++----------
 drivers/memory/tegra/mc.h       | 14 ----------
 drivers/memory/tegra/tegra114.c |  3 ++-
 drivers/memory/tegra/tegra124.c |  4 ++-
 drivers/memory/tegra/tegra186.c |  1 +
 drivers/memory/tegra/tegra194.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  3 ++-
 drivers/memory/tegra/tegra210.c |  3 ++-
 drivers/memory/tegra/tegra234.c |  3 ++-
 drivers/memory/tegra/tegra30.c  |  3 ++-
 include/soc/tegra/mc.h          | 21 ++++++++++++++-
 11 files changed, 67 insertions(+), 36 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6edb210287dc..6c1578b25a61 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -56,6 +56,23 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+const struct tegra_mc_regs tegra20_mc_regs = {
+	.mc_cfg_channel_enable = 0xdf8,
+	.mc_err_status = 0x08,
+	.mc_err_add = 0x0c,
+	.mc_err_add_hi = 0x11fc,
+	.mc_err_vpr_status = 0x654,
+	.mc_err_vpr_add = 0x658,
+	.mc_err_sec_status = 0x67c,
+	.mc_err_sec_add = 0x680,
+	.mc_err_mts_status = 0x9b0,
+	.mc_err_mts_add = 0x9b4,
+	.mc_err_gen_co_status = 0xc00,
+	.mc_err_gen_co_add = 0xc04,
+	.mc_err_route_status = 0x9c0,
+	.mc_err_route_add = 0x9c4,
+};
+
 static void tegra_mc_devm_action_put_device(void *data)
 {
 	struct tegra_mc *mc = data;
@@ -600,37 +617,37 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 
 		switch (intmask) {
 		case MC_INT_DECERR_VPR:
-			status_reg = MC_ERR_VPR_STATUS;
-			addr_reg = MC_ERR_VPR_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_vpr_status;
+			addr_reg = mc->soc->mc_regs->mc_err_vpr_add;
 			break;
 
 		case MC_INT_SECERR_SEC:
-			status_reg = MC_ERR_SEC_STATUS;
-			addr_reg = MC_ERR_SEC_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_sec_status;
+			addr_reg = mc->soc->mc_regs->mc_err_sec_add;
 			break;
 
 		case MC_INT_DECERR_MTS:
-			status_reg = MC_ERR_MTS_STATUS;
-			addr_reg = MC_ERR_MTS_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_mts_status;
+			addr_reg = mc->soc->mc_regs->mc_err_mts_add;
 			break;
 
 		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
-			status_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS;
-			addr_reg = MC_ERR_GENERALIZED_CARVEOUT_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_gen_co_status;
+			addr_reg = mc->soc->mc_regs->mc_err_gen_co_add;
 			break;
 
 		case MC_INT_DECERR_ROUTE_SANITY:
-			status_reg = MC_ERR_ROUTE_SANITY_STATUS;
-			addr_reg = MC_ERR_ROUTE_SANITY_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_route_status;
+			addr_reg = mc->soc->mc_regs->mc_err_route_add;
 			break;
 
 		default:
-			status_reg = MC_ERR_STATUS;
-			addr_reg = MC_ERR_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_status;
+			addr_reg = mc->soc->mc_regs->mc_err_add;
 
 #ifdef CONFIG_PHYS_ADDR_T_64BIT
 			if (mc->soc->has_addr_hi_reg)
-				addr_hi_reg = MC_ERR_ADR_HI;
+				addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
 #endif
 			break;
 		}
@@ -883,7 +900,7 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	unsigned int i;
 	u32 value;
 
-	value = mc_ch_readl(mc, 0, MC_EMEM_ADR_CFG_CHANNEL_ENABLE);
+	value = mc_ch_readl(mc, 0, mc->soc->mc_regs->mc_cfg_channel_enable);
 	if (value <= 0) {
 		mc->num_channels = mc->soc->num_channels;
 		return;
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1d97cf4d3a94..a7f20850741f 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -14,8 +14,6 @@
 
 #define MC_INTSTATUS					0x00
 #define MC_INTMASK					0x04
-#define MC_ERR_STATUS					0x08
-#define MC_ERR_ADR					0x0c
 #define MC_GART_ERROR_REQ				0x30
 #define MC_EMEM_ADR_CFG					0x54
 #define MC_DECERR_EMEM_OTHERS_STATUS			0x58
@@ -43,19 +41,7 @@
 #define MC_EMEM_ARB_OVERRIDE				0xe8
 #define MC_TIMING_CONTROL_DBG				0xf8
 #define MC_TIMING_CONTROL				0xfc
-#define MC_ERR_VPR_STATUS				0x654
-#define MC_ERR_VPR_ADR					0x658
-#define MC_ERR_SEC_STATUS				0x67c
-#define MC_ERR_SEC_ADR					0x680
-#define MC_ERR_MTS_STATUS				0x9b0
-#define MC_ERR_MTS_ADR					0x9b4
-#define MC_ERR_ROUTE_SANITY_STATUS			0x9c0
-#define MC_ERR_ROUTE_SANITY_ADR				0x9c4
-#define MC_ERR_GENERALIZED_CARVEOUT_STATUS		0xc00
-#define MC_ERR_GENERALIZED_CARVEOUT_ADR			0xc04
-#define MC_EMEM_ADR_CFG_CHANNEL_ENABLE			0xdf8
 #define MC_GLOBAL_INTSTATUS				0xf24
-#define MC_ERR_ADR_HI					0x11fc
 
 #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
 #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 41350570c815..cc66620da60b 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1114,4 +1114,5 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 9d7393e19f12..886dc68fea65 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1275,6 +1275,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1307,5 +1308,6 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 1384164f624a..1c6d03a82680 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -962,5 +962,6 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.icc_ops = &tegra186_mc_icc_ops,
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index e478587586e7..801b80e5e802 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1415,4 +1415,5 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.icc_ops = &tegra194_mc_icc_ops,
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a3022e715dee..46e97bb10163 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2012-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -778,4 +778,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 34e94160cfe3..d8479ab6345d 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2015-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1368,4 +1368,5 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
 	.icc_ops = &tegra210_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 5f57cea48b62..23276f622aab 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2022-2023, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2022-2025, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1152,4 +1152,5 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index d3e685c8431f..f22febcbee59 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/device.h>
@@ -1400,4 +1400,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 6ee4c59db620..d11dfefbe551 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (C) 2014-2025 NVIDIA Corporation
  */
 
 #ifndef __SOC_TEGRA_MC_H__
@@ -168,6 +168,23 @@ struct tegra_mc_ops {
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
+struct tegra_mc_regs {
+	unsigned int mc_cfg_channel_enable;
+	unsigned int mc_err_status;
+	unsigned int mc_err_add;
+	unsigned int mc_err_add_hi;
+	unsigned int mc_err_vpr_status;
+	unsigned int mc_err_vpr_add;
+	unsigned int mc_err_sec_status;
+	unsigned int mc_err_sec_add;
+	unsigned int mc_err_mts_status;
+	unsigned int mc_err_mts_add;
+	unsigned int mc_err_gen_co_status;
+	unsigned int mc_err_gen_co_add;
+	unsigned int mc_err_route_status;
+	unsigned int mc_err_route_add;
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -196,6 +213,7 @@ struct tegra_mc_soc {
 
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
+	const struct tegra_mc_regs *mc_regs;
 };
 
 struct tegra_mc {
@@ -256,4 +274,5 @@ tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
 }
 #endif
 
+extern const struct tegra_mc_regs tegra20_mc_regs;
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.17.1

