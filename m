Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298B47ECD3;
	Wed, 21 Jan 2026 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990352; cv=fail; b=lI+ZlIuz2IFUyySOVDaIWVjv2moU7Qlxt0Vb9WdJJMeAJKwsZVmn+J6EItk99KXYEwKLez4xEznj3YI8Gy8hUFVamQvjcESyHUXbf7GB8LNm8vrTp74r8aE/TU74qDLxWevPydAohD+T1oyWhJ46heJSHnFhd6fwEeavUDdk7HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990352; c=relaxed/simple;
	bh=vh2rdYkIavnqxmiuMj7JHNjfesLHY3obwZXZi99qAo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJNaf9EjTeMBZzvkjF+MoaHyDqCmy1hBtuEq0rePBlAClU7THe5j5Slc+7UYiIeryvNEEtwGAHAyh70+Cl+RsiaCx3R6ZDzLm9gOH3bOlx2zrkdH0SxmAIBYeWzyvaoQsRH63jsj2lfeZXLpViJVbth5Pie8nVvrZYeTys8Sgs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RvE6l/Yo; arc=fail smtp.client-ip=40.93.195.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RvE6l/Yo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM/RauJ1dYwFfmFYUgUwkYF+ZqYGMiieNyrATzdw/fNeyKzoj8hQJTpVVLN94JQVA70yKx4Oh8cd8eMqVzGZqfprmWYG2DQbbkpmLmmdR7ryYkDucRPshwQXmKcQahTvBOrI44f9g9ZwjgrKrG4s5oFbtZmQIZrrg+5B+Cz1nN2IUnuv9yAg6liTUeeG1w5UiVr5YMVjiAiyCRO+hRrH5p+JU1nIz1SgRU4Fsn2jVdWkjpsmZyBqdu8CFI/7qPQ76xu3kRELXcEW+l+418gw8JZmkj2YaUorA8q2Gy8q+TbAz8WQPemrg7nazU3PhiM/OBqIGoDnp/Th2pahJM2V5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSl9MQWZOAkdqIMksN1ETxruuNH3nEk202eUqANhOAU=;
 b=B201mijcEXBwx2UiCjDuVPAyNtF7EJW6EMhqPodX/Gxhhzvez7PdXrUGBFlPaCzmDsocRRrJP46MQq2WwB3fbaalt4/BclEKpkLYYxw+MRva1Y4V3Qdd524NzqLIzaAlbkbSrgnr+hIKBzsfvXcE3OqBLx/H4BKyhWnlTLoe0t1/XCnCSKEaJ8/M+QoVFNBYs6zOxamVpdz9LWIxs2/5BPdtFea5vBYfkiP75z5pX0UCz/tGoZYH6Sgang2H3NgTkSrSUQiLLOiRaG8PYRarPxUne8shnSQM3lGaERAypX2eFQ1kJHgYmlAjgtlpgfJd2bhnBDhPxWSXyAFgojH6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSl9MQWZOAkdqIMksN1ETxruuNH3nEk202eUqANhOAU=;
 b=RvE6l/Yoq7kCkyeKHqu8fDaVkreND3XH2woRKPAt3MPwlbEjwCiAj+PdgarnSIwG2IHZZZuDVMc0OrzK7Ae7a3g7XrvHHnfjTyJ9INgKPYYFFVH7/9DwosmqtMfLSJK2/d1wmqFCOyrX68sKkPV6vXQYOBVfOqV8Sm7TsDYToE3S9EjKSiPYxUrUYSnXDQUJNIoXSJc/lz99ARhPi4VdhstwPGBUvUFm7xANI0hTmaxeIBuzi6uYR1eFDwb97xxZQvYVoPLUwJ4rWWyTmQTUh4DskpBJCU5UWTNt2i+ymAU/REA1w85r2pdUoz1OgSZRyLDLDIGg3FVf4U05mDGnfA==
Received: from BY5PR16CA0028.namprd16.prod.outlook.com (2603:10b6:a03:1a0::41)
 by SA3PR12MB9107.namprd12.prod.outlook.com (2603:10b6:806:381::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 10:12:26 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::bf) by BY5PR16CA0028.outlook.office365.com
 (2603:10b6:a03:1a0::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:12:25 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:12:15 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 02:12:15 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:12:13 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 1/3] soc/tegra: cbb: set ERD on resume for err interrupt
Date: Wed, 21 Jan 2026 15:42:03 +0530
Message-ID: <20260121101205.3186310-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121101205.3186310-1-sumitg@nvidia.com>
References: <20260121101205.3186310-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|SA3PR12MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: ed08d593-9db1-4020-34e1-08de58d59347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c7OgaDeMJ+SSi8ECs2u8V8fhXFjP3rBZgfC0iasIPq1Y7XKlRLH4YQs3OD1b?=
 =?us-ascii?Q?k5eSSUtLs8rTrL8TGifYkD+3qooUW2cqZPeIXoXrOjzSDJlVyA46hJW21Vrd?=
 =?us-ascii?Q?1+3gZUh/Fg4FbQQjoZ1JUMbQLhIPNopMMqhQbzIBFhVmUlOoDHXbJvQN0Mtm?=
 =?us-ascii?Q?knAcf0RcBvVplDAlWNzq6IYWi6ckevieJFKrePNxUb+NrldFARYkA7wcMzYY?=
 =?us-ascii?Q?/ePnZBBnXrq8x1ybIeZNhp7HAeKnsSLoPPmQnaQRsqVqcUW2DLR3ZLYqOZdo?=
 =?us-ascii?Q?rQw8STWEcenmSQhAemLI8nR9haxpFAsuG+CzQ/izz5VGgW17w8dBWzPL1e+W?=
 =?us-ascii?Q?KffRTO0oI/12vpUw23l4hMP/7eQKUAGF0QCNl1ioQgd7FRxQ+3pGj2A7fzwy?=
 =?us-ascii?Q?dBHDSv6VsdHOTwWtSfsbOQpdXSZQUHTvf1ODTJvpjIkqf8OqG8aAXaqPUI1D?=
 =?us-ascii?Q?9fcKSG1LeA2meUoWQ4TLE8xk9pfuBzYjM2sJL34H/bF4BbO0AyNspwpeO1ul?=
 =?us-ascii?Q?LPYiLZH58vssiWPEiN67DhP6hvcNPlEivj4Xg5LoHQrS6DCGXjYO/W/7uD8O?=
 =?us-ascii?Q?KjhWl9T0GKGp6vrJZFu8PDKsaPaRC55SXJHfBdYjO0WRjbF+sqqmS+l0PYNI?=
 =?us-ascii?Q?TRHkHY1ARrQroS6fIe14NpQy8Pa+Sit3XFEiJfuagA8zc72uLWXQlINtjvRK?=
 =?us-ascii?Q?TC57VELoX/6O2Uy2O7uKK+f45qGMqGc6PJlnjiHxw5qvww9B/I0JL8epn43u?=
 =?us-ascii?Q?74rweYbUa7nFE0Pq9UcCou3v/ypMgpZMSiceqXbQNTz153vu8Qg9VMwxFOyT?=
 =?us-ascii?Q?gjTdSxVrEJZrOj3apT93r2bFN8TFWOFNGqS8LS2nrInrjSPuRT+unKb6QhiW?=
 =?us-ascii?Q?AG58SS7CkU63gYdy+ypmq4wrzeASOTGoW9QrtKlnL3d8GT1kA1eWFATEZjQX?=
 =?us-ascii?Q?0POH5xe0urD39M6QrHrL8y0UtPNTf8GZa/NvFsmI6yinSgFo4BTNgOJGFq4M?=
 =?us-ascii?Q?N/mkvHjcF0+pnYDx6PSTQMDxu1XgdHrDcGHVc+N1Ye/9/en0o9PPyXjoXweD?=
 =?us-ascii?Q?a6JxKePkETzLFhZAr9sE17+ogZmetHxRyeIYZoDFfahXMl4ockI9WLjxpbGT?=
 =?us-ascii?Q?K0AwppUBOHF4pv1KqUkX9B6iZ/QkEpys2SGY+ULpLN6iVKSDT7rqFZbrVxZN?=
 =?us-ascii?Q?q5LaJQ32I9y8gK4SeaDOMDy3XL6I501D2LMRacU7j+EjeeicnDjwvrebqOHh?=
 =?us-ascii?Q?a/ZW6G03s747XUKxGox7ZtOdbincGfa7+XY2WN8tZZIjDjhY0+AayzvCsbBD?=
 =?us-ascii?Q?E1hThBB2N+r/1sL9zNTfZ419b4FerRMvKPQn0tgdoSscmI0ewsd307Ztvf5U?=
 =?us-ascii?Q?U2VLJ0bU51fVz5tmnpXRUXOtRkCi4xzDfMnH0qqxc6WiLm9fUAHKOOG2FPag?=
 =?us-ascii?Q?Z7M0yfIe5emZ4jyDWRvDtsSYKVpCOqjZTocndvOuMAAj0fU1hXbZsYo4xJuR?=
 =?us-ascii?Q?qWARABcu0TAjmeRb7P8eR8gMwqU6PZ5hP3c72C3gsbaJjr28cNl6ka2X8Coz?=
 =?us-ascii?Q?Pc7ttEHhvNmr4NWQO3MzQbqTiMqjDIo4k6phTkPWTW/FWCAaT6RKVMZBTfCs?=
 =?us-ascii?Q?fsANBncNZN9swuoRfKIdnx3tSZwpfQgPqtDrtBL7Mf+9YrXsxYsvhx+6lr0A?=
 =?us-ascii?Q?J3Iq0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:12:25.5172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed08d593-9db1-4020-34e1-08de58d59347
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9107

Set the Error Response Disable (ERD) bit to mask SError responses
and use interrupt-based error reporting. When the ERD bit is set,
inband error responses to the initiator via SError are suppressed,
and fabric errors are reported via an interrupt instead.

The register is set during boot but the info is lost during system
suspend and needs to be set again on resume.

Fixes: fc2f151d2314 ("soc/tegra: cbb: Add driver for Tegra234 CBB 2.0")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index a9adbcecd47c..518733a06658 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -1586,6 +1586,10 @@ static int __maybe_unused tegra234_cbb_resume_noirq(struct device *dev)
 {
 	struct tegra234_cbb *cbb = dev_get_drvdata(dev);
 
+	/* set ERD bit to mask SError and generate interrupt to report error */
+	if (cbb->fabric->off_mask_erd)
+		tegra234_cbb_mask_serror(cbb);
+
 	tegra234_cbb_error_enable(&cbb->base);
 
 	dev_dbg(dev, "%s resumed\n", cbb->fabric->fab_list[cbb->fabric->fab_id].name);
-- 
2.34.1

