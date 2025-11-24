Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC019219A79;
	Mon, 24 Nov 2025 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005751; cv=fail; b=hWCGeVsqprAqkAcBqp59tBK6/CGDOGLX/rkO2i+mDQc6uLqCEXKXLz3YO2D2nBNs9LfLgHNVcZ2LnR9b0uKG9KNsbcZFo+VwmOr9zAdqoF0fQNQ8aA7lv4d4G6XDUDRGvw0FE4y1kZC5fAXVeRWLImGy653fZXx+CKrtKmLWjkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005751; c=relaxed/simple;
	bh=2OjvlNTqfpQS2ZydKPB49s4URjxhKx0QgfchdJ+/+NI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGbljImJcXJs5ijpp/isAUkLtoGap3DkHbbwxjRi7eBDH1nYqtO9ixzA1VSIzXPfpOvbi+SUqdXXviI84+8a+8RlK6ppBp+rkVVeo8TLpWgC4eN4akkWVJ9ig7vjXy7w7Xe/ZZAif6wo2+BzpsWqtbVR0VjZW7mr334ZYvglxpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ezBekJ1e; arc=fail smtp.client-ip=52.101.46.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ezBekJ1e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH3zDQ4K8l5Zg4F4IGWg3h1AwxO47oshV+OKURNN4ZpAaqEu2w4mfEHyF3PuljXlr32opMdQtgA+DbbNU0Oi7elCxTs3yJyjkxUHJx76bxw+P6PBYlTuZSiWK4FUvGOZ9uiMsCXASFgWjb5iWZ+e9KyZDAmCyUrEZl1FMicnSpsSHPOvjmR6KsRPZFzBDIPq9XUNeS76ScwQ1g1Hbzxm+H/XJYuN4W30HFH3yCejtMnftraTJ5itRzjGuS8P2zZMhKvVvQTyws95fIr8BWeEEvWqq42Avp1Le49E3YhSF4PxmD7LPORZLYqrawHDl6Wn9cPGl5I624GS8esptqtaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=KXyR0OqhyVuq8TR2Gu0JgNKrXuixwh1koxGeRDiO2b2mWZ6rLTWOcAdcbLpOpYxfZq0ureMpw7+GX3rq2gz4hnEgAY4kAjSDk7OeSgX8nXaSfGiODP9nXeKj5g6dWLo4wgZAaNrevOafFxVRZWS0aTTvyVpidaJwYxlgo7K94FGNIaC8nHX3ltIMYiubSyx5U9YhtYvjvRSfcF6qQ6PwuPmlJ+D8y3h6gc0C/Wkjz9leFlVDOwd1dhDq9g3GS9KDhW78FmQmnCRHYOHMUqr+KIASPhtgJTJP47IOMnEM7TkESdzfXAfGMNM+355kiOodRJrm6X6HTgGwEfD3rsXdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=ezBekJ1e33RbwQ/0x8r8oEvp3nIFjs+gOoO5rLBSalWoBx/WsgSD3pi8lg2/6yINCxzss1FKIszWExhfo0waDR6/91436Ew3cAUSYE3cU1FPVteQ1KSSUdKnX7bD4az+X+PgyXdMcMdzJjKvZ6vAExG2jIpQdfigdG5BtZfVBxZ7TPpItciuzIvZLiM//GJwF22CzIhc4ibZwW41Un9tai4ZMF6431EZnCtOBbFc46rqRdkvVsQWgC9sLu9SrntmoKCvluCq97+2l9bWnLW66p+le+ZoaoQUrvkKDou/epKFF1w+NcrrSji9PFMfC5Epg1XLck+ptnYwsqNNzRywjA==
Received: from BN9PR03CA0271.namprd03.prod.outlook.com (2603:10b6:408:f5::6)
 by CH3PR12MB9146.namprd12.prod.outlook.com (2603:10b6:610:19c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 17:35:40 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:f5:cafe::b0) by BN9PR03CA0271.outlook.office365.com
 (2603:10b6:408:f5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 17:35:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 17:35:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:21 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:21 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 24 Nov 2025 09:35:21 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v4 2/4] memory: tegra: Group register and fields
Date: Mon, 24 Nov 2025 17:35:08 +0000
Message-ID: <20251124173510.2602663-3-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|CH3PR12MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 118e8151-6b15-433a-af13-08de2b7fe2f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TjTx5MBTi1zKga8dRhVZCK9RC8hi70U+PL7Mr3VilIDUmjWVCvg5O6hoA1cc?=
 =?us-ascii?Q?DpAx9rKPQa4PONZhBy+YsKp3O6XEfIBNxFKDWrCDHoMoWuhTQ8Zwu0xxVsJe?=
 =?us-ascii?Q?zOTWHYSsKGqnJPNbOop7abGDG1VyUsQOy8gTsxBlCrOZFcYF0U9KcIzmnj8N?=
 =?us-ascii?Q?Bv5ltUpAHXAr4YxeA64pSgJi9iKmd0IzT/h/rRxnx8gesP/7N+jUmiOaFniX?=
 =?us-ascii?Q?rFz4uBhH/meBzLhM6/0XgID74k3JGsx5xh5KqeJjEbAzGa3+T3+Aixr8rQ63?=
 =?us-ascii?Q?4JVOy0tx8D9aJ47Bz1ecukQ5IIrI7dTgbcodueJX0XDvvG4shMP1KbDLfivj?=
 =?us-ascii?Q?cLX7Zs+49U8m/HAzcwdsXVcqjLlnTG5wduJqsTw/rd+po+i+c7LRrm2WnHS1?=
 =?us-ascii?Q?br9UPJJtPA69SFcgxcJzHmBE1iPuI3dD35XdUl8ZdVMdQTrevyDG5ScPi+EW?=
 =?us-ascii?Q?vDdNg0kD6sxHZXFBUi0Aiogto6ppncwqcgPrIqoCLVipnCTkcpe2xzClvpvS?=
 =?us-ascii?Q?SUJTwBAvU/kMaOAf41YqxYAb9tqQUC5G5/SwhmyDhW87NpPW2BXfrN9rGTcg?=
 =?us-ascii?Q?tMsF78K5WxYqQMRLMfLtkV3ZWhuxt46TIz5jkTi8gYWthSPpIudLWB7KX0n3?=
 =?us-ascii?Q?A8xbQCGqH6meZRQeP9bARXri/QuVtTdT+p4f5tm6QydCDx/WNRPNlMoYqz29?=
 =?us-ascii?Q?dsK9oMeAmTplDFysoWfItriyEm6cOu+uYuGiz1rv6xJfHAdE8i7V/z8uSwyT?=
 =?us-ascii?Q?luGJ4KktkSbkmG1rCJYkZd4DMhUNKTvDNrALpnJ+lrEcoHM5pMjcP6yq7Ft6?=
 =?us-ascii?Q?yaYcJaPH6JDuZWo1O7PfQE0RzWinXfkKxEC2scqaEp6diOElo05K1+dSmh8l?=
 =?us-ascii?Q?WTL62zAsyZKtJsxWcw/SU0nrvj/X+AeY7Ev96be9g0qLjTxzuEigX7oxm0YN?=
 =?us-ascii?Q?OPX+hZC8SeoO+I435KU023OYvxnXHLIuoJYCuSchec+eqZ/iMLE8yhky5QQ2?=
 =?us-ascii?Q?/foc6cGlHPkfZsESsAtBjS6WjcKVurBBAkZcl6v49n4B6+5VgWIIaW9Rsyn1?=
 =?us-ascii?Q?UgrIH2gEZUdoWV1/fYFDTMUOSoi9Hj6abAxQkcPovt/ImOFMFF29m2X1G44z?=
 =?us-ascii?Q?WBW+qizZLoZEj0KyuM7nHL0ftArG7IzQd6m3uoWZqu0S8BhrTu+/1FhnrRUr?=
 =?us-ascii?Q?ENVjU+uHuLdE1/QMPZmKE4VmVHWKFDA45lxm7PjAFNpQxLccpphvvdkQQhB1?=
 =?us-ascii?Q?Ogy0u9o6UZ5UIJuHskkzn8qCLJ1bZClzOVtLlpa2wTB3BhcfSNxBYGmUjS40?=
 =?us-ascii?Q?CWkdh7NLL9tGRX3USKeh9F+GA7Rrdy+Fizzb5dOkxsYeq5YAPmU6fVaFgEFX?=
 =?us-ascii?Q?CIqHFKo7preuG7JmO1tk0BJFhl5xEEEdJR6I5owzu4YEiyER+O317OdBTuIN?=
 =?us-ascii?Q?R5yDYtH7I2dg11aOPgqVBynCzSTmFDEUMDdaUYBiSxk1UKKE9E7Pq+N0FoJK?=
 =?us-ascii?Q?5xVzQ8KHRosI2l4dF84XOtiqvksm6atwFhCmCKVNukQKpwAQ13Zi9/rC6OTv?=
 =?us-ascii?Q?woPgH4dmdJ4Hz/uT76M=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:35:39.9786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 118e8151-6b15-433a-af13-08de2b7fe2f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9146

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

