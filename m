Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0C1A682A
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067372; cv=fail; b=Qsjnt/VRQ5QvBFv1dNbgzE2Rjl8pPC861Q9UBkLyZIPvUeHZeKgx0IwqioOZLPl7t/76wWTGyKdN/2QahYGvF6kiikotYVbswQHoxNBLR9OqfkyLVea8rGnlJs9JIHRgkhegImRFkXnqKRw69WbJdzCO0DsnlZH9hXdpxpBQKd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067372; c=relaxed/simple;
	bh=B30decdlRlKloi0kgB+GAaCVYpZaIid97RtwWffTtzo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OleLSeMaO7Qzwv3Ss64LEpA9x0LD4WaoTa4eaK60/gXqRK+pVX87pCUUO+7X3qsKCquzcTWgN8PyLOoLQ+Txv0kXZKxRHicFciPabAg1JHG2S2OOOuEbyh6amT4wAUDoQr+BJwPw9NgI8YfQbkJYMx1DyR2YvJgj1/l7FSKUa6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s/Q1vKE9; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s/Q1vKE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB9CeM61INeGMHhV1FrOKDWDiHZ04eQfeT1BxntGjsZexPVObtbxOtIHzBHt/0AvFsQ4pQ1mpePfv+f9ev8NCrQX1MtI7qpkEj/nO4tWmg+z0goVk5bBXaY6mJe0x7zNNh6KQP5jO4e8FvrXcu1D/3tUmZ7QDgyZ5HOsSPYjYvf8b/I0r+QSMDojfW933gIQD4M9HGNIv/3rrrh0g7ww2xHE/952hd4ENk2in1vlBsXS7ghmSDxaaye//QXDFnjRyoz6htrb41RAm+//jUHYGuxv6eBAz2W5RDNrGdwgVuaIMWUDOkDK/w2ZDZYu7sGSE6FRv7I/xBToAfxPBLL7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKUEP56IvfV1IXtFPFYD5dlef1ftxQ0CILgN38S+NPQ=;
 b=QCzEta74p/T+VysDfyZvX5N1uFyOSSfQfNmol40GFB2vWtDUYUj/B2Itj0mlObETRqdkQbkaTnfDunug6gFcEyuxm8v9/J0ZLNp9Uycor7YrM/nE/mUpk+ZSWgRIm3hBjlcBI/upO08rhkijxiHsAU5+1YfM9WkFa8GC4dEyEK8vP6O6c5UjbJFZfaXvJphS/fyA1SNTlw9SgWKw6YPSr5I+iBABIA1dS/WkNS8BjKAD2pe/eytgK0lSD1WRM0fbg7s72cz2F/Cp7jW4FguvNTCy9mk4MeMpS6Q0wbttkMs/vt11L+XStG9nw/n6m3TFCOeY/YndP6SLDakcxN26CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKUEP56IvfV1IXtFPFYD5dlef1ftxQ0CILgN38S+NPQ=;
 b=s/Q1vKE9n4xi//f11xidTyx+oIwJuiejk87WKFS5ZwIl3OqXjWQz33sjES/APjcKp1hbhuXYsY8kPaxkOtsu9Lk2gXuaeqvtjDbgyWbdNlHyOdf0ZoRLrx8+6b8R/PvtqAJ0/L0wXQRiUTse0RnHeFi+NyDjcoU1vN75Apk5e71siJzEZyyiY9QP/xkwVgysA7qcNA/wf+G4vkpNrbhDxzoq+0fV/bYKCOid0qbcqMCyqojKabb15euse1vgm2zOyKIboddZ5gcbXNjpezaVJzNFqK56NpI7GYRGpMcMyCJGzL9xytb9asl+vuyQjLgNyH1gWuzLd3mPTssq+WgGVQ==
Received: from BL1PR13CA0144.namprd13.prod.outlook.com (2603:10b6:208:2bb::29)
 by IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Fri, 29 May
 2026 15:09:26 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::50) by BL1PR13CA0144.outlook.office365.com
 (2603:10b6:208:2bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Fri, 29
 May 2026 15:09:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 15:09:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 08:08:59 -0700
Received: from moonraker.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 08:08:57 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/2] firmware: tegra: bpmp: Propagate debugfs errors
Date: Fri, 29 May 2026 16:08:45 +0100
Message-ID: <20260529150847.70545-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b34042b-3932-42c7-b614-08debd9445e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	UzbcO5uZvoMKd5KDfMZ9RgpczmUIpSgEJboN7dfymz+XzYxl1dWvd6qzZtq1jZmp6sjBTpBsyBmWtbigy6UPOUtJQwC7m91YljUxB0DqLYhslu5hrPKDPSNeWnPWrrpODAZlpPHdr6Qnz9nFtQ9xRUUH9IflwQTzKZ7zjU7EgUgI+r9gws0w/0tfse/4WkBU9fF/FNDN8fbsKckW5A1W+ScqztOKs/C4aL+TW3Ssuy2M/EovmpVvRiit4M9/BaTYy3mLW9QlXyMV4X2Gs7nIjt7pBfoS4vBqMaJYju9vCylmzxcAdst/YGaz1j6pHwWDoAbkgDxTrLWihShd6cXGQ54SgUiqXgElTXI7q5kA+5EmsaHNZB/WLOmaSBk39ZB2wjJwp+mDolrDVJJeOgKDyTra0spG72Rh9d6wGCzr5DQX+9bMxgeSYLBj5REeCgmR3NG/2v6f5JtGuXFDxQ+SoE/Lpf7Mq2yyKjCUGjB0Azf4siVYtzRYaoacR2xLVuz691KDk0A5lZpdpxON2GgZKBiP2sl2rizlBUjBgn1BAiID+PUpt9pQM8Fw9FWZ+DOw2NovXV1BAURzU/ieHjYTs4QFVzwaNWlaLl6QZDJwNgBf8VrRiS3rQUfhiM7fpjAAin8sZLTSa4moXaLlYbBW/ZdrokR4i9TFwbqncnyzsu4KdTj9qFowott1TZojwlXQg6N8kHTpwsBjPHraSBlw7v+2nq2uY2vE/jXJWXoyUjA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YkV594aAco5FeEu93jllDFX4ue1IK+SNOTkQE55eVsKunxuI8SaSmlGsrxPxfq3XnRdsvePABHJUk3KfHZHzCW0htGY2VBMjmS/FnCqfVVOek0N/rSQcu9/jamZDW4YHPJgZMV/zhWkyubpe8AKGPzMoCh4NIXCMIFWiRIQTcDG0KsSrI2lvrp7BSjUSTL8qBUfNDAmWGe6BfAI048/rfvnVNsCasO5lKJ4YuJNWHP2i2/COeEwvz4MPfQfqZA1l/DiB8ePAzxazP+MSrjnK3f6jdGGWBV0zwusCr8DiOxL3Cct++KGtSw94hk6yXECsFZmW6bslsAgROQBMnObbbl4JcN7KtrOZ01e07a1kX8wyibcM+VRQQZ9DpSUcSl+PgB7701oQGik3RafY/J5pYI7BWSEWsrMeScLWTk1jLD63t50EU//fDqLbqFkAxQ+w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:09:25.6747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b34042b-3932-42c7-b614-08debd9445e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032

The Tegra BPMP debugfs code returns -ENOMEM for most cases where calls
to debugfs_create_dir() or debugfs_create_file() fail. These debugfs
functions return an ERR_PTR with the actual error code on failure.
Therefore, update the Tegra BPMP debugfs code to propagate the actual
error code on failure.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
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

