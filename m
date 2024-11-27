Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305EDF51;
	Wed, 27 Nov 2024 06:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687879; cv=fail; b=lAG0dHav8LaaNTnZ3GM31jzloMI33D6pEwJDNjxOP92JbRPYaZZRWqVPduuhzrFoHER7OxsdKBaH1RTTPXo/tWFOyRn5z4iE6+iV8kirxXOxEz2RCFgxZouhobzSauHZYCXZ/gcmFAAHPXsFDh42/udkivlJ9uRpuy9T4FuaN6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687879; c=relaxed/simple;
	bh=bI0LYxaZhwHVbJbKiO+bUIk2TGWz+FSFabG2Dgarc/Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DCP9LYI7Mk19B6BUe8tTv4VuUsxfdX6p4Wl9Cf5jFLR3N34YZDpLJKqXu+5KYfZn+P0Vc5djbCi+e30Q1neAGCHb04lvdda/Up83/biWJuEW5ZN+C22M7YTX3eWLFHAxMZ0T0uzlqJ/Uk+X2OOzxcG+WLTK2K/U0BSyCnr+0Yv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e92cstLW; arc=fail smtp.client-ip=40.107.102.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e92cstLW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lri/zhuO4HvmEm/nY0lxa0wIhkZrdM10dEX3YVBx6m3gn4djSR2kP5YcM6OYrr85sKnqedBv8azbv+qU1zbIJBIkVrtkzZdb/4Qu/VQyccSkN5YqfG03kY/W6DSvBpwi0X78hAse9jo2FWNwEu4gJ1Np6O0vtPgvKTllyBusMUILum8XziCY0DKjMAN+l+AGPrcllbbZH/XJwZ0nuHpm3UOVri1yJSq4lhQNqCGXf8G/eLyl1mCY9ONkA1zsxSpfwn5rmFGcxY2heLC6iAM9cfpqK4UeCT/wdtV3+6yRhUBQ43GSnif1k2osH3kfq6E/pBAgnLsd1l7PY6Z+EAkB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DlX08BDXLHyYISnucUx0dJUEBADoZF5OiZPXY5olrA=;
 b=JpQ7H4ZU8bjQF4SYflKdsoqfF9Nb6h1GL2bm1VPCaFTdriIZDxD7zv5dbPMw0cJlh56g0L4lkwi9dZZJPIdGkhm2aC5WHf6pdxmszBvrUGuaLd7qNIrfbAdtPKzFZT9G0L/rrAoU9k8/4iRVj62tjq4EkGOsLAqNB9kwjjZDigenDQfv9adqWBzORTPyYTFUpZcExG9OEynkuo/2+IKdaYa4HrkMAb+NoYYuM3MzudlMwbocDFrSrcCjtDmeW2hfu3qBryoS0yEsWdU05glqRsAOEwIky9Mx8JEn96tPao/NH/nf9YV6tou10wTypUAgAXmfI68aLp2NTXrcP7LrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DlX08BDXLHyYISnucUx0dJUEBADoZF5OiZPXY5olrA=;
 b=e92cstLWzK1EO2aGAMtirptCU+tenLmc31ACWCKIV94wqGSUKlk9OjphG0+L9gDJNGfYjNrpZVtfVYctIi0Kq940uWNBjVfM5SKfWgXlk4E34Q4mfJuGi7dhAzS8T77PQzqOno+jCN15/6q9B9bg0he2sHbS50+GkHEpnEMHyunpq5enG09gAsFCTYhMoauv3mQRBNu54IRFeV4334Ut7JNt5KOoRmMcuvUYG77SjDK/j8fCV/G8du+puZ2mNKt+xz99svik6HX8arEZCkCY9hVt8pUSZ6nK4pR8T1ajOEYzHI4W4OX/Cm6p9dAVoFi/3B9nUvbZJJdtnZLDJl9Tag==
Received: from MW4PR03CA0323.namprd03.prod.outlook.com (2603:10b6:303:dd::28)
 by BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 06:11:14 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:dd:cafe::a2) by MW4PR03CA0323.outlook.office365.com
 (2603:10b6:303:dd::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Wed,
 27 Nov 2024 06:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 06:11:14 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Nov
 2024 22:11:03 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 26 Nov 2024 22:11:02 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 26 Nov 2024 22:11:01 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <arnd@arndb.de>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] soc/tegra: fuse: Update Tegra234 nvmem keepout list
Date: Wed, 27 Nov 2024 11:40:53 +0530
Message-ID: <20241127061053.16775-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|BL3PR12MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f916ff-781d-4810-b410-08dd0eaa4c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MSTlERG90zylEESaeffDkz3ucej1ht9NXVa8DjO+cZQNMd4P5cLlooMej1Rz?=
 =?us-ascii?Q?sfFIDvtLXHlmvxlP6jY3QHvijxwCPQujuAktKRv8f1oMozLV9CxfXt51128M?=
 =?us-ascii?Q?Hg0iKiSgu2r8hZGufV20BRAREt+6kVLOoXGNxrgT9Ie3tTCVpuaC7AtfacYW?=
 =?us-ascii?Q?sd7w8385nK9BQByINwjYe8FAMwjyXBTm6e5e78vB6F/GBI7FrekunGIGBqYD?=
 =?us-ascii?Q?w6+iRh12vkUWpDwNfGfCXDN4ThgPdUYIwYDJZiwhucHlDIJbwq0XnFEBQUZZ?=
 =?us-ascii?Q?4Lum9pRwra0Ih8Ywg6Nc2lYWiZ7of86OqYqgsiqrlyec3A1Wv1Y4uBRnLZfg?=
 =?us-ascii?Q?cRHjWANTQ9U8zXmVWeSmz4cAfitdjFCWe5Fb4uonWEiWN4S4Y2s1/sWiAr41?=
 =?us-ascii?Q?j6m14mPbnm3pj2o+597TsSnJR35W0N0kUZcOAeBaL0//w8jw+2NFwPFxEbiX?=
 =?us-ascii?Q?YbgV5CXy3l3wVxcSkVygGgo1JS97ZJZgiw0yjUZIy0eBz75Wi+OGYZCEkkwD?=
 =?us-ascii?Q?qRa1SRLtVLxVfWs+vM/KgvLmLNq9aBiavvI3pyGOJUK7CsTwsm8hKYprQ88R?=
 =?us-ascii?Q?pkp1lsJ8XtbLvpooryfXT0o6jgqLfWKz+95QlX/7HE+dHtpH1hJsCShKnwl2?=
 =?us-ascii?Q?FCv6UoFPvA4Bq+mOazJOeyDhjoDqwMFNu6BDppS+zHnRjcYDaCmNtnc6uyEZ?=
 =?us-ascii?Q?lPvOZjV03IfId7V8lK0vYNHe1JWullmSs8te2oO1hzELcSbfQqmBlCCMBTr3?=
 =?us-ascii?Q?RN6EJ2dhBi6tTa623xt04rzQOpugL0/Ohu9VOFDNLwTgAlFQWrt4wWgrwWyM?=
 =?us-ascii?Q?yY13MeNL+/RNSykUlnWbRJ15RZet1LKBffL2fXDVbOELRGjxikQJ3yglA8d/?=
 =?us-ascii?Q?CgaeckTk2wQhRlQA6k3uQ+kxPFRLVQThc9KDw8C/TcHmUE5FmD+XG/tMEQ3v?=
 =?us-ascii?Q?339UDHyZCADqQDaVg2QGOjLYl8+wf2oSWDvBPGNEEadk+E2lu92UjbQYoSA1?=
 =?us-ascii?Q?2Z9oKFxjK8tDjmrqxuuuROBP7wH5xqSvBu6hNFm/3i+ULtGVSz2UcMT5xuQQ?=
 =?us-ascii?Q?1lamULn4+X38MKnJIF3/V2cni3jk60TQ1duc02thOhzKVXpfe3nao9X6c8Hp?=
 =?us-ascii?Q?7j/avNMBVjVTCcVXjdzCxCnZ42QEfwe+XLohCBu5X1pVq6fl5kJ9ajZ7s47i?=
 =?us-ascii?Q?QYXwofxIuSzcRgNYCCcKL4JJ6OlEe6LvLj7ao4XiKjspacd1wBC5PB860pOp?=
 =?us-ascii?Q?7wxHPU1W7JMgswddbw4FxpW0w+WA6wjwk98Qe1HlpDvInS0H3+8JBIYsg5G8?=
 =?us-ascii?Q?zBai4tbnEE/deJpG5BO38jllf79M+BnGXQ2M9Nm5x/2QmDNECtrD7lgo6aPb?=
 =?us-ascii?Q?YSqTO844Bf+vJE9LBXMgxgrk6V+xM7Lb0x/5afMJsm4qKjGxuGax5+s7TXI+?=
 =?us-ascii?Q?kTN/m5bcA9OHSkjw4DZ7tTVBkce4IGTQ?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 06:11:14.0924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f916ff-781d-4810-b410-08dd0eaa4c2c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6426

Various Nvidia userspace applications and tests access following fuse
via Fuse nvmem interface:

	* odmid
	* odminfo
	* boot_security_info
	* public_key_hash
	* reserved_odm0
	* reserved_odm1
	* reserved_odm2
	* reserved_odm3
	* reserved_odm4
	* reserved_odm5
	* reserved_odm6
	* reserved_odm7
	* odm_lock
	* pk_h1
	* pk_h2
	* revoke_pk_h0
	* revoke_pk_h1
	* security_mode
	* system_fw_field_ratchet0
	* system_fw_field_ratchet1
	* system_fw_field_ratchet2
	* system_fw_field_ratchet3
	* optin_enable

Update tegra234_fuse_keepouts list to allow reading these fuse from
nvmem sysfs interface.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index eb14e5ff5a0a..e24ab5f7d2bf 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -647,15 +647,20 @@ static const struct nvmem_cell_lookup tegra234_fuse_lookups[] = {
 };
 
 static const struct nvmem_keepout tegra234_fuse_keepouts[] = {
-	{ .start = 0x01c, .end = 0x0c8 },
-	{ .start = 0x12c, .end = 0x184 },
+	{ .start = 0x01c, .end = 0x064 },
+	{ .start = 0x084, .end = 0x0a0 },
+	{ .start = 0x0a4, .end = 0x0c8 },
+	{ .start = 0x12c, .end = 0x164 },
+	{ .start = 0x16c, .end = 0x184 },
 	{ .start = 0x190, .end = 0x198 },
 	{ .start = 0x1a0, .end = 0x204 },
-	{ .start = 0x21c, .end = 0x250 },
-	{ .start = 0x25c, .end = 0x2f0 },
+	{ .start = 0x21c, .end = 0x2f0 },
 	{ .start = 0x310, .end = 0x3d8 },
-	{ .start = 0x400, .end = 0x4f0 },
-	{ .start = 0x4f8, .end = 0x7e8 },
+	{ .start = 0x400, .end = 0x420 },
+	{ .start = 0x444, .end = 0x490 },
+	{ .start = 0x4bc, .end = 0x4f0 },
+	{ .start = 0x4f8, .end = 0x54c },
+	{ .start = 0x57c, .end = 0x7e8 },
 	{ .start = 0x8d0, .end = 0x8d8 },
 	{ .start = 0xacc, .end = 0xf00 }
 };
-- 
2.47.0

