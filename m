Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6986C2E0930;
	Wed,  9 Jul 2025 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071118; cv=fail; b=rlojBxYUAP3e95deJMGnxfcsiKo6UIVPd0fGiLvv7dZ6Okf0KM0XFpLcGgi9uY9/ZS02zQBByVIl58jQwi0350jEiNjmNWn2t8IpUIOxtLF0ie/PO3TlJde9OcAiMSL0wfiY/FbUgO0lWVSPRa3oWNmpHhkTOsDt98rMuTyTgR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071118; c=relaxed/simple;
	bh=OI3lAiUG0Fn6MQr3ZIQRtLiLNo2ccN7/Soib4l+IcCM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YTV5wnraqwbbfQHP+/7zAXhatb2uQ4j0C05yjKdePkFmlC86YveyaknZOhjfPwi74urd+uPan9dOEqp+ueA3B01OM+2eH/5rWiDl1O7y8siel5emz8H1p/K6B4N51dDnIs6g/dWnU9HCj3lvjB5nM+Mv9/D4KqVk2YF0Q/2aTco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GZ0ULY6C; arc=fail smtp.client-ip=40.107.236.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GZ0ULY6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5ZhxSvPFIfchn8eOxQk2Oyw0lWyRrVmLloe2pKNOyIOeBFdEZzRZ0dvYP8/BR8SKhu4WS6+372FaxzHppcS/03I0oVXLD8QJHmBbAGRgMuCbC8VMH80XB4Po1GYzFpzr4SOG+h6lGxnueAmR2r8OVLbQLiKy1dFnZacKL7ssZy+9ctszSXSEeehHXpCpgEeL9KzxJoRdlvxkxU3cfhmlgRXZvAiMFRjhU3tJvhY1lL6eBEXbP+/nSjyqgVeBlxS60mnPIwtVLv2UqBuMP2wufmVQokl+qzncoZABVTNvlbB7r+qS9hEZ7lx/SflMUe2a13Y26HmtqDgOQA/UnuTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ9JXLxQGt52U39uwqpNF6of3T5TPYSao5kvT0+LhAg=;
 b=oE4IXdMY1lZ31UhAqV9MjAnTnaL9+paLs4QCMO160N4byCRCY9WT6uIiHKTOya2KytvFAjl9S7VA7ZbGIr5K2IpAOU597Hps6MDfgJ2DPRUNKj0Id6WUGOBCUE6OadT0CuGLEJyYkNDaXwzowrkYgfVsG8GMSpTJaZR5p+e7Q+3E847IKdbQxyAzmu9hySHv/JLO08idfjt/r97cMgz8hL09zz9OXXwgckb5yX4FEend1susGwnGHCcuCSGoGWbTGJdR9cWASpFNEiBeIS3btZ/2b7+r3kQF0wGY1dWFuHKcUeYjp0cjUj/rLVenQmkWPsVHWIVQDf1DMtBGMF1VoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJ9JXLxQGt52U39uwqpNF6of3T5TPYSao5kvT0+LhAg=;
 b=GZ0ULY6C5cER2OAyvn0u9higybYBRwSDMomj9AE4FeOXgoqi/2lu6vVmtXFY9imM4dmFBtEWrIjhwtWpgkah2eMoB3Q96uaLVUeNE4u1D9o/S/G+lZRqlpdW02czsafXj4tGkHoTH+ykrDOhByr7S6Tz/HCHDJiIDhpE7UnXJpd4ApYOmNWRvuVAhviqqXr3pWQVOYp7RijrYjnmFS6VJzopW0VjBIoh37dpIxvfPAOeKTndKvhJHQ2L8O8GQDVSY8bRIYvv/LOZEm9owTee8Y+k3NTYvPQH/5RcDSB6R3O7m+AZfH5mv2H59nz8zW8en0q96fNOGwCsnwf+pCvxqg==
Received: from MW4PR03CA0356.namprd03.prod.outlook.com (2603:10b6:303:dc::31)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 14:25:12 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::ca) by MW4PR03CA0356.outlook.office365.com
 (2603:10b6:303:dc::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 14:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 14:25:12 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 07:24:59 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Jul 2025 07:24:58 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 9 Jul
 2025 07:24:57 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: <devicetree-compiler@vger.kernel.org>, David Gidson
	<david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] checks: Fix detection of 'i2c-bus' node
Date: Wed, 9 Jul 2025 15:24:52 +0100
Message-ID: <20250709142452.249492-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|CH3PR12MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 53199df5-f318-490c-af8c-08ddbef46a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jeXhJAlrdOgi9KIrkZ7aQDJOx3WgoL8kZomaDxtL5a9JQlPgHJvW9N8Pr+WS?=
 =?us-ascii?Q?iJq6jbEpFT6QcaJMinN6diSxKfYb+ps685lfTgC7BfiIBnpREEHIHOeMwoB5?=
 =?us-ascii?Q?YvNMrhY7xIn7UaTTMO1tC0vTVfIeuKJQzOZRBm8w50t5/qSRZGbQK0g77SxL?=
 =?us-ascii?Q?HU+T9nf6bJAuA8M/1j8ShydRuYgyWbcYmMNH39ALbp70gXkhJsrjtt6PpBJn?=
 =?us-ascii?Q?2byXgSo6t4curqOevsDiRUXL0U2wRfR8/6uQLXXgSlfkF0PLJ0hIJrax6Qvw?=
 =?us-ascii?Q?EOGoxQcEpEJUqQ2o3iUAE0RqrTf6koPU+NOGGdqz8aomdOg9kZLR0trJI0B9?=
 =?us-ascii?Q?JBs+ai77VwZa5m5EiZu4wuDXtScWeFUHk4G4B3ovq3HP7ZX55ZDlyWlPH396?=
 =?us-ascii?Q?YZIZi0SMfQVmn8/LHgDiKMvGsEVGLt/vR05aFtZ99otq/Na7U8UItKXcGQf9?=
 =?us-ascii?Q?fgiW4GXT0rIOYBu+19RKgaybmlqiWChJ/6iPxAJ4HQpj7fQfVIut8H5WK5D/?=
 =?us-ascii?Q?HgcuksZq3ERrsj7xVubueVyu710C19JFuhg//UOQsRxGw34s6+Q0YKqlWGaW?=
 =?us-ascii?Q?fE9KNFY7agqwg/1Cd3+J47dNdfQSmtLlnTcyoo/D5/bL6ZoFw7x1h7C7Udh7?=
 =?us-ascii?Q?2hc5QEvHz5UGzwzW/VgwBCrTVC9vLXqAp39r2Se7EGztrGFeOS/IKtYSJLiw?=
 =?us-ascii?Q?h1HHWxNtCZ+RjPeJhCngZd6W0eH3x+Gyc1hdvIQc0HD8OVVHw5inzG3HHM/6?=
 =?us-ascii?Q?qCYu9KfCP4FMXidEMBLLubMx61dwcQzODR1SWGblfjBTF7JOrOGSNbBhSxY7?=
 =?us-ascii?Q?vp1ffAV/9P3BLVI2rFCUu9D2W4Nx10+LxaPz6HvqgV41NL9Zlx3HluSRy19e?=
 =?us-ascii?Q?6+FLyICnZcvNT9FGSL2aYndKqfehglLkQq5hcQVg39IFrcLsFqT4cEWH7xR8?=
 =?us-ascii?Q?ljlZor0z3PykrgBoA2KqWaDrNboc/Elz7ItQbWj+d5NZpxCYL3frbFYUdHEP?=
 =?us-ascii?Q?VQIEyaOncAlXlOd1rCnguT7ghfWORDvEZqvA94HRjogspg5obM/MAKUyhv7N?=
 =?us-ascii?Q?hmhCOjPyL7u749VTKJrsf0E+F0YwrlSzhY0s9zX1VBl2o8K+hST/v9mKzePE?=
 =?us-ascii?Q?bqriicwBbJH2SyX8pEyGADQ23ZHuqKCQI/O24YNCNkQ5eyGTjZSyHTHVllk3?=
 =?us-ascii?Q?MNqAfmvfjeZ30Kvbi/p4Lj+DZxj893AXMrxOU/+Td2f+ZK3OZM0zBTpojNpe?=
 =?us-ascii?Q?k0pC6yOGvxYs5n47SYZOY0UgDwQjFWaRPvBvWRFtWibX/jahYm4jph1N4Gu1?=
 =?us-ascii?Q?uCpq4ENq6QalTA71Rg3MPuw5NrZx7zC837HH0gEoCAEz1LRg8QX3Q6d7VM1t?=
 =?us-ascii?Q?stUn3vfpFgGxm/Tyx/MqZHy+rzhh96ejwkxnm7maMnzJ8mYfYF8s65SJSO8X?=
 =?us-ascii?Q?0KLsiBOg/V326bOPKpx3pmSeokjjcAnMxqq6m0R+5VO9mLnEf297niFggdqr?=
 =?us-ascii?Q?+Mu3wk9pOId7sO1/BPdTz7wUI+tB7tZDVvEg?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 14:25:12.1623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53199df5-f318-490c-af8c-08ddbef46a61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401

If an I2C controller has a 'i2c-bus' child node, then the function
check_i2c_bus_bridge() does not detect this as expected and warnings
such as the following are observed:

 Warning (i2c_bus_bridge): /example-0/i2c@7000c000: \
     incorrect #address-cells for I2C bus
 Warning (i2c_bus_bridge): /example-0/i2c@7000c000: \
     incorrect #size-cells for I2C bus

These warnings occur because the '#address-cells' and '#size-cells' are
not directly present under the I2C controller node but the 'i2c-bus'
child node. The function check_i2c_bus_bridge() does not detect this
because it is using the parent node's 'basenamelen' and not the child
node's 'basenamelen' when comparing the child node name with 'i2c-bus'.
The parent node's 'basenamelen' is shorter ('i2c') than 'i2c-bus' and so
the strprefixeq() test fails. Fix this by using the child node
'basenamelen' when comparing the child node name.

Fixes: 53a1bd546905 ("checks: add I2C bus checks")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 123f2eb425f4..7e3fed5005b3 100644
--- a/checks.c
+++ b/checks.c
@@ -1024,7 +1024,7 @@ static void check_i2c_bus_bridge(struct check *c, struct dt_info *dti, struct no
 	} else if (strprefixeq(node->name, node->basenamelen, "i2c")) {
 		struct node *child;
 		for_each_child(node, child) {
-			if (strprefixeq(child->name, node->basenamelen, "i2c-bus"))
+			if (strprefixeq(child->name, child->basenamelen, "i2c-bus"))
 				return;
 		}
 		node->bus = &i2c_bus;
-- 
2.43.0

