Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1722524B4;
	Tue, 10 Sep 2024 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725973287; cv=fail; b=UKchG0vnqh6HpjSoF2vsYCE2JX+PPW8ceOHLaOdyuVrJT9kVImCURnSFaEinl189Ja6FwOTev59YCcPO6btNdVfpZrmnpF3ByoIxWGhMPvCoA7Iudc/OvNaoBdEd5p0K9Njh7eTiFvxHBBSR2VZglrD1XT5TiSW7FrLu8P4ro+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725973287; c=relaxed/simple;
	bh=kYpHz7Nl24o/yJ5Jg+LdPN2z/Rm1b7Qq2BRlcrzwDDA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sqsYMVSSRcNYe2mt2zyboHbZhT+0xONdAZ2XiIrv24Xd5mc88JmOwZzd6zbIWsXdENaFUjFC2TLz6PQZJrCTLlcEwJYeTO2laaGy8CTyE2CZJfMaZRUnnDfTA5GJXFoWcsf3ffBo37sJwC7ylYnnMcoAP6PHy8Q3fmQ826HjKOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=laEBS4M+; arc=fail smtp.client-ip=40.107.243.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="laEBS4M+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3lPC8FReMyo9J+XJgYFGvDwEU9xkjyFoHB7Jy+0WRR5TaqokBf3X4YnJfiZornlPOespfa2gOa+JWmHduJEbgihDDfdI9Qp3PYHtNrNG/bXqlkCsKx6jTRh9mTinUnD6SKp4lRW16T0LUL0VK5OWkIb7au8FGrr2EDg+7uLSKf4lgVaCWnvSwrrUPSvVwdypfsyzV9kb2WVCkePRed4qFrH5Gxz+WDhQQbmurGyKg52Osf97e4hOVatG4ZtRwJ28yojw5Kye3ZhYRmX1rk3WavIuRuo14g7aIbvEKyVsCISJ4nDgr90ef0bhsOs2550WTU9qH+7ygViYLeCX5mUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qjXKc1R3vh9Yt2DfxYrU7CUwv8ShYVDii7AK4EZyMo=;
 b=uKqvTJSZHCSbnzuiffkZf7/wM+Rqi9jj433Nz+lghWu8N4F4ZaZJmmxDazN/YCbuFaiS67ikHtxqzbo/zrsm9OG8Q4xhjZt/D3PMkBqaD85oSKGsh9LTrrO5lf0RS7dFNnXnz6iHRTaxfTi3Dj3gCPAoI7ujww9wf15AOI+3WN/QIQB0x1er4YaPMo5I441eKJ/B4HZ6oO3dkqcWCGNIx6F9RJ1AZ3FUH7e+ygoBGir25dLZ2R4j+2Bs59eRhrZm7ErE2r18egGwaFrDrdficDx63IY3zi0h3hnM/YG7qSLnxNEL25S7U0UwqR5/2qPwPNkgJZR4cBwGJTpe9wBzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qjXKc1R3vh9Yt2DfxYrU7CUwv8ShYVDii7AK4EZyMo=;
 b=laEBS4M+5OdUtB0bAL1xDjvXziwEJ30+/Dzi3hQTskxrqkwGo4Bn9TjwFrT1A/F1/cALhaEEqCIaV9LUa5jydDmHBgWf1W710HgJkg0tDzn3q2cOB2UORfleaxd5jDTx9hFQnURcV5qu4rpyvPtQLJ1ftGkim+azQ57KK2IhAnHuvw5pyjoCtx1Kz6B4FovIgJpz+Rtw+Dj+I9EMyJiG0rSjmru1ct1FxLaOwnY1HNIIx97FRTwY4ItiHjgvXliWghDHgZ96zso9gGlgSEAyj/G184K4yEk5GLoPmCFJTj6YDu5aDNGrCtbz+ZA1XkiABZNQ4JhZM0ubuH/kaaLgRQ==
Received: from BL1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:208:256::7)
 by DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Tue, 10 Sep
 2024 13:01:10 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::10) by BL1PR13CA0002.outlook.office365.com
 (2603:10b6:208:256::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 13:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 13:01:10 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 06:00:38 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 06:00:38 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 10 Sep 2024 06:00:36 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Saravana Kannan <saravanak@google.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] driver core: Don't try to create links if they are not needed
Date: Tue, 10 Sep 2024 14:00:19 +0100
Message-ID: <20240910130019.35081-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c93e60-449b-402a-0c3a-08dcd198a474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QJdBL8luSKEbLT0NnFsZPNw1ss+MyVZ6f8ipNnbIgGutedfSeX7ybfkp4a7y?=
 =?us-ascii?Q?14sJJqX49oEzEAXI71J1b3OWH/Af40QI9Iv3Xwubzf4uUKGa8aiEdFutGC4r?=
 =?us-ascii?Q?ts7DNV56Isz5GjxYMDG7DrAw6oGLUwFn+h+rE0Go6ET8YKAH1imJcDs8kWpW?=
 =?us-ascii?Q?G4eu8zU2wUKiSTJoqjbcq8FP6CC2uWwg9LZCtSZw5Qn2HoIKgFGBIUdLKdAm?=
 =?us-ascii?Q?cp/zsAYsZZPspY9RvLk17EKlwcy7+yKs4Gi600EMyP3M5T3eYkNDkO7/5Iml?=
 =?us-ascii?Q?SKL87Y59iZopBup4wfl7EGryy/zx+rW2cg6sc0/ECWLk297GVguhYByHdMdd?=
 =?us-ascii?Q?ZQpQsajnVAucPVTodY5zmJBo+qyYBExmE79Uf8WASPy+qIsI+AG3FYSMk6r+?=
 =?us-ascii?Q?muyxGz1k1K5KYtpy1M8Hs/gjmEKXxVPZhAdFfqvF9v4C7l7CWcizGG6Nxiae?=
 =?us-ascii?Q?D04Jj3YUj6JXbZQ+kxgo18zbNrsi22/8l9IE+bxeK5EoO00leLIglXwPjjMf?=
 =?us-ascii?Q?xCKxD7io3KMjnFi1dBTrx93hZaE3XM7mf1rLsJCTXFYeOU39xO0NtooNf3OF?=
 =?us-ascii?Q?H5bGNsm40bg5Xffh4lxxL6Sbk0hBLBQcM6nbVH6nHI6qW5l3lKW9OoadkV3p?=
 =?us-ascii?Q?4Vw6lp4yjx/0gD/pOGrKiPR5bZProqX63VBNbKcpJeAzcQLWiaQleX+IMmNr?=
 =?us-ascii?Q?FeOAfxbo4p1BHJzMWEBL3hhXC4lJgSkgY7Y7zTFuIj/w616OGTfLtdHmkBqW?=
 =?us-ascii?Q?KuykFeaTADK+Gx/l0PcD5FXsd4iMkQnyWFsOI0/IOY65idUsV+7yWQfz8qm5?=
 =?us-ascii?Q?dLIHwFLqO2h43dBrYXhxcm8/LBQolnZrdbDXp/+K1EPeqZJ2I3aOoMsJW5Z8?=
 =?us-ascii?Q?7SeFcHmGt+vhQ1BkQ+Uf4qPrZ5/K0ndfybg+ZKdC1IvMHYju7jIe9otwDKwC?=
 =?us-ascii?Q?bUXSoZnU46YtphQp1DUfjcxshZaz2/kWgY/s2E3KXPrU3DeY2V/cmHQP44as?=
 =?us-ascii?Q?H9trqqkv0aCMe3WV7zlX721QKlBdCwVVeWE2O+dZr/ZhCCYJQTL223t61vyM?=
 =?us-ascii?Q?PDnvMcUkZIb24rqWkBD0yrHiT6Pm8HPgvdvpIU+LxexN+QhjGa8RPO4qJVOa?=
 =?us-ascii?Q?kldI9SMxMAj2lCc2UVVN+gZUBzq3Ar4Ug0VMwM5OhjBQyJI2034Lw2v0X9BN?=
 =?us-ascii?Q?4pejtyo86PghT00LmUsEFAbfWAcazyeaB2xv6PgIL9SVKRAQH1a9D7PNNXbU?=
 =?us-ascii?Q?qqnMCyAwdZmWot6GbS6pI5UW37rrjw21cyM1ndQvOTzkEwIuF71Ham2bNPS7?=
 =?us-ascii?Q?3g3JyTwRsVioh3KLySbkC/ck4afUH1FYNuyPZ2Qh3izyyItuAN3GT4Atco89?=
 =?us-ascii?Q?qhsO7wB2+lfzUiSV8xGtJr9AObpptAIvijyQV4t3RK/A5khKUuSaHfQjMmRD?=
 =?us-ascii?Q?drXTb4Y6MkVisRJpVvKwaL2rLaXa43nF?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 13:01:10.2039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c93e60-449b-402a-0c3a-08dcd198a474
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349

The following error messages are observed on boot with the Tegra234
Jetson AGX Orin board ...

 tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
   with 1-0008
 tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
   with 1-0008
 tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
   with 1-0008

In the above case, device_link_add() intentionally returns NULL because
these are SYNC_STATE_ONLY links and the device is already probed.
Therefore, the above messages are not actually errors. Fix this by
replicating the test from device_link_add() in the function
fw_devlink_create_devlink() and don't call device_link_add() if there
are no links to create.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
I am not sure if there is a better way to fix, but given that the
function device_link_add() is exported, I figured we could not just
move the test. Anyway, if there is a better way to fix this, let me
know.

 drivers/base/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index b69b82da8837..5d6575e63e8b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2181,6 +2181,15 @@ static int fw_devlink_create_devlink(struct device *con,
 			goto out;
 		}
 
+		/*
+		 * SYNC_STATE_ONLY links are useless once a consumer device has probed.
+		 * So, only create it if the consumer hasn't probed yet.
+		 */
+		if (flags & DL_FLAG_SYNC_STATE_ONLY &&
+		    con->links.status != DL_DEV_NO_DRIVER &&
+		    con->links.status != DL_DEV_PROBING)
+			goto out;
+
 		if (con != sup_dev && !device_link_add(con, sup_dev, flags)) {
 			dev_err(con, "Failed to create device link (0x%x) with %s\n",
 				flags, dev_name(sup_dev));
-- 
2.34.1

