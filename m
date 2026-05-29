Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5BD386C20
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076059; cv=fail; b=c/WCoJrxuLtyqNiMhXDcxjGWaqPj0EP734TzLVUK8oTR/cPRESr7an2ovgWvqMIteDishhpLW5ojmagRbkMGTzvooW/vwq9Y67o2JeVXkWYm7b81DX2yx6k94W1SUrBlvT7/dKfOQ08i4CXvRwIC9Nd5CYY/QHELmzzAYW/yxrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076059; c=relaxed/simple;
	bh=qDiOvn5HI9diZ9IRg8F33mhd1F6CiMq9lYSdKBFo+pw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sk+8846eIaJaTGjQoD1y+GDNdWnTBNEPBNYtH/VUJb7GtGFasTxcDKfY4Lm5QMwS6A+TuIma51OAUmWXXmxqgwZXgOxG2X/MVfj4KpetlD8Ttufszwph9e/Ks2jc/umCxtG4Z5WlGbBH83B6mizTTvp/pxnw4m/k50de4ciAErw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IuMqfARh; arc=fail smtp.client-ip=40.107.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IuMqfARh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWOBUzJD7rhJQSiTj5DHddhgVOUdjigUDlFazrcmHwxsVI7EbtupHasM+Xlx8WF4durZebRyRICXr2rhGwULr8Axc1QzbWAOTBsFTtxRIhE7FQCyU6rBCj4ltiAxRiMHLOJbd3oXOyZ8lZy8xEl3lP8j0YPC/xFdXPYvOahDS03ejOAahGgsviA40Xvn8iJr1aP/aD0kpJxswqm0gIoXtpjwOmqRDJ0NmL/k0hLailOOJHkaVi5iOMjcJSGLDWK5VJOQicFjy9upHiR+/h8th9G7/RrpgkqcGbwp139dh296v7zxxPkMlM5s+fBIoE8p+eTs0qhRrFGb6Ch3299E0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHsiENLbivry3brqcJvlYREN4tMry13MJfiymELowWc=;
 b=Wgmgh6OMOGvL7GNws2aPXCbqHuXfphAaEBqvDtCnHgFtAYOGBLcuvfVKf9Xpv5hNqjA+XjGVY3fEy6yZrw+zfXaQKy7LgQAoZTveO3Igg1w8faDKMtInf/jyrPOGsqE+Bgt2HnkM3IQKgybWjIB9Vzy9cidCqh5+LNHbNjkfDTO6fnIuH4t6uyGPKyiPwoRluyq2xjBgFOeWGQYZsXwUBvlezaGn3UBTSr9uxcK87dUppKKMZmXMIQaHRLgpTiD2vTjhkHML+BC40uogikB9155aQf1HJpWFuU/TCBR54wQeFkO8+Ktik92S9Jd+TLClJ2SCAjWHgDWBlua9j6rJSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHsiENLbivry3brqcJvlYREN4tMry13MJfiymELowWc=;
 b=IuMqfARhU+Ftj9HQ/DDQ28L5/ZjZvUtkfsfku93WCIOm8UwU4IOJl2i7n7OoVGwlSNdhCRuRTQ5gCo7p+0hPYcjQhYW9Mwy0rwwqMTynqNt5jCg5k+NoN90Q1Q2ndpO6dsTHQQffKKHlGBtPtNPztBGRh6gVr7hp7Zd9MpaThb4K82iDR46PX/aW2y6At3NkqEWuadmJH0fXjSPbFZ/N6zy+IOX+S9YHM2zD2uXQZre0+YorPAsv78+FSEGAGn3lcDDulbxixTI/zh3483r42/U1ewFmp97zF/JRwex6AkzUHf5BJzzGje2Rqto/J2mSM1QPYVvcnUeBPshIMKpX7A==
Received: from SJ0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:a03:39c::24)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 17:34:12 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::9c) by SJ0PR03CA0349.outlook.office365.com
 (2603:10b6:a03:39c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 17:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 17:34:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 10:33:52 -0700
Received: from moonraker.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 10:33:50 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 1/2] firmware: tegra: bpmp: Propagate debugfs errors
Date: Fri, 29 May 2026 18:33:36 +0100
Message-ID: <20260529173337.155722-1-jonathanh@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|DM6PR12MB4172:EE_
X-MS-Office365-Filtering-Correlation-Id: e41a45b7-a924-4809-b9a9-08debda87f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	MnhSfN1Y0cG0oXrif5PXhpBaTLGrGkomMo3LNvKDTVFMQiOB53FUV7qUSOJH6yDCDzi5ukWkmPKVRjl2GPIwLhB2cc1y67QoT54qq2OBF19qHc6LVaFfl4M2Hp5kPHgB5jyLpbcdcTfA7NlWnAFSnQAq1CeWemyRAhbeckLG+N7GIZTiQJL+vvTalBmW5TxDXUwfQVRmb8u6zeSlBIPs+/984byUvhitz74ZkIJVhnZJeQ75aIqWKN1TUMkB+PiWXf79DZkQUQ+iRCoNSJdoOV72kz+JUV0GS3hEurzz7MxiMPS3xp2U9DRnJiSqSw/sKOmzw6+t9SBjpn0Jvkp72CojRkk7u1B4t8qvz5xR1KKMuu8MQ7ot3NPlA4361fZi9EWnGmUF9HAPTFxfKkDlbtpqxyD65FEkPwzHr9wKzOwjj2tKjulesiyQY5HiGFD6KLL+rcnBjDUPsXwa2jX6qjSvDnmlKRJtcqBnJGhKg0bJ5rLE7PbXIbmJsLE4UgNxypiVHCQrtmMiXXsrp8mT8pQYHy+90r7tS+jLgd6EabGFvFCt4yJOY1FP+Sm/IxX+x+hOc9aBwJDG5lIyRCwK5XF2SkLtbWf/W2doNwdU95xfGINc7upxV9DEA4sOPfs6Vr+vNns0oNtz09MfaK3GJW3RAx9aZnwSsjm6KkMIKJICcnjNg3VeDY2p09rhp+X8r9rzgi0Rd0KhAaotb/3SnLIonLd1qQ1eJmdjwrCyyDg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	of0L/BRQkjQsn15LLhDI36aGL7zpb89D9dmXi4wfsfwmgU4mM5iSdQw2psS2lqe9WUikIsA+T7MShZwmv0iZE5zbksJu5K4nfWvzeb8RJSOIvQI7v5ya323c2mUgK0fYfSrnM6MoVBVlaaMilb2gHcM3rSA5GR8fmAW7rEe/NOVfA9ROkwlLwGxJ0KJfcPnFG0oQMcmpRLxdGMF+YBFDTou+8DwzrZ4Hmsh7G1wrZlro5kVoHBeCRjFFIGdvAPp0DXB0EDORRYj937fDplbc50QzdR6k2x1zRnQhEZsirQvPaidt8Ad0IsNeCA9YeA7zTAxL1VDbAOWTgR7OqsVaTXKTpwMrVn6CZhn0yOIpHS1GBbYbN8jRhvh3f8X+bAmDAGtrnbiN9zdmDkjEcPnHlgWlIaiiDVoHeb7IT+9y6WzHRpuaugSxMw76J84vAKeo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 17:34:11.8001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41a45b7-a924-4809-b9a9-08debda87f2e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172

The Tegra BPMP debugfs code returns -ENOMEM for most cases where calls
to debugfs_create_dir() or debugfs_create_file() fail. These debugfs
functions return an ERR_PTR with the actual error code on failure.
Therefore, update the Tegra BPMP debugfs code to propagate the actual
error code on failure.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- None
Changes since V1:
- Added this patch for V2

 drivers/firmware/tegra/bpmp-debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 4221fed70ad4..29037e2b3158 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -468,7 +468,7 @@ static int bpmp_populate_debugfs_inband(struct tegra_bpmp *bpmp,
 			dentry = debugfs_create_file(name, mode, parent, bpmp,
 						     &bpmp_debug_fops);
 			if (IS_ERR(dentry)) {
-				err = -ENOMEM;
+				err = PTR_ERR(dentry);
 				goto out;
 			}
 		}
@@ -719,7 +719,7 @@ static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf *seqbuf,
 		if (t & DEBUGFS_S_ISDIR) {
 			dentry = debugfs_create_dir(name, parent);
 			if (IS_ERR(dentry))
-				return -ENOMEM;
+				return PTR_ERR(dentry);
 			err = bpmp_populate_dir(bpmp, seqbuf, dentry, depth+1);
 			if (err < 0)
 				return err;
@@ -732,7 +732,7 @@ static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf *seqbuf,
 						     parent, bpmp,
 						     &debugfs_fops);
 			if (IS_ERR(dentry))
-				return -ENOMEM;
+				return PTR_ERR(dentry);
 		}
 	}
 
@@ -782,11 +782,11 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 
 	root = debugfs_create_dir("bpmp", NULL);
 	if (IS_ERR(root))
-		return -ENOMEM;
+		return PTR_ERR(root);
 
 	bpmp->debugfs_mirror = debugfs_create_dir("debug", root);
 	if (IS_ERR(bpmp->debugfs_mirror)) {
-		err = -ENOMEM;
+		err = PTR_ERR(bpmp->debugfs_mirror);
 		goto out;
 	}
 
-- 
2.43.0

