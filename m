Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE134A3AC
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466807; cv=fail; b=Fze3ucPXT3Tf/Xx/A9ElAlHZMyu46JTJevWHv/OZU5H6xmiJKKLK5Az11nUu++I15ugQuzSKkS5NQYRS/0IZJ7nVEKC7d4LepNwC+mas/fbRBXT7UxZf1jOKXOZ1VMcLYL6sbjz6l+zpuBeALPeHZjawK5ArhboL6lTe0ow2/84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466807; c=relaxed/simple;
	bh=G6saed3+UTxv4TgrVYVSJVsKo3aH6VYkyM9ABxKBrYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K7gVsUGVNlF2yT2rxKuiC+rR1I9r5hej/9WuA1y8zK2uTl9sIY7vl4T3NhlAVJK60CrBYGS9bFRL+RDHrRQnzrkD9lWPwCES9ILcTeWtwJmPTwpRJXPqoDZqfqseO+L4tZ95TFDpwFldJ76VXpVhK/Ifv7+tN4/WDM9CeFWUM1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DSkH1M5D; arc=fail smtp.client-ip=52.101.85.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DSkH1M5D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh0e5rVzvfpugPRbypl90zd4s2VBEfaEhh+5+weM/28uvldxBfwB4pHL62DJdix6Hj9TRvlZNt02Atk1X7Vrf2eoqIznTnHnhI7LO0zRuwxe/3FhHe+2iUVbPsSqDB8XMRLaG/PYdLiJxJUhi9cdu9h8vxsRVGYavbwvGz3kenvjwHa2WjTxclJw2jqtWBZrAapa4M2YgbCIGMY0m5auUdmjT6iTWHdOKYlVH1WyrZx+bbsFHXwg9GD+92/uXEIg9O2DutFmmZ2ub8ghCXvrE/kp2jaF1QTOHkFjpCQwQdbbVgHzrPfo7aH3UGp3G0i7eAN+/kZYzJTW6GZNeCSeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW+iWsgg3oH+mRz7iVxvlvAeibGy9y58gyeVCnNHUKg=;
 b=B9wUHVv/UEoNezEntzfts3DDMbFi6Myyem+qkInYpfyx7M+OoSpRo6aFaJwY0XFaVHg/nQTNtgnfBbv21zqy7T9fHpa+K5S607tNa+dGYIm2iWesxR7qIAYQHSCl5A6B156/HBm4vD4iou9PqGuF8o6abcrBc4DfI2g0w776ISZXEhAeL7P9dn+hesKl9G0ndUifEECVmLJ4ZwplfRype+H9UATGlQibDA4vPzEpmEKRgaTnUhyE/VAAj3Z5wl0hqKPPul0yLfZOESEqDuRhysBwgG51AYEoJtuL4vW6GVkH/EyNYIsal6qmVFUqLTz2uRejJRYEbsRim8qf8VivkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW+iWsgg3oH+mRz7iVxvlvAeibGy9y58gyeVCnNHUKg=;
 b=DSkH1M5DBItUfTcvb8nKwkZF731bOYCJsOysaCee2ghQk8jCknTkRxEZ02cImcY+k5RdV16mVzmdmd5eRsbv7mfKv1vIQC8wz8laFvSAUcKnKHrFKgYw5NdoOKywzBqMtBOxaoalpxh5o3IyEoEmt1eKRoJit5XZ/7mE/B7So7WChxrYiaGKhQwSvuKusaW9yLHT7SIdcUp4uV6YkzDJAwKPu0/wn5tOIMvzAmHmFpO/g2OoYabHZu5YBNtCDMoix/xVLT7ztZ5v3QkIMUV9p9q4ACuVtSaUo8PVqpIr7KZ3rTb6P3FQz+UlRmTiGH8mKFiIRvZr370S3TXzlpwV/g==
Received: from BL1PR13CA0138.namprd13.prod.outlook.com (2603:10b6:208:2bb::23)
 by DS0PR12MB8814.namprd12.prod.outlook.com (2603:10b6:8:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:38 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::d5) by BL1PR13CA0138.outlook.office365.com
 (2603:10b6:208:2bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 19:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:21 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:21 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:20 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 01/10] soc/tegra: pmc: Add kerneldoc for reboot notifier
Date: Wed, 25 Mar 2026 19:25:51 +0000
Message-ID: <20260325192601.239554-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DS0PR12MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fe53cb-5a29-4d30-13b0-08de8aa46f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+0F26PgljJh56XJtSj3LgArCwqX5dvQ4aiKeqkJusbsEtwZ7ddtMUANGyH5UG/mrHzmoXa90ikmB4ZL9Mi2+Mn2vYXDkGRlzrCrWnm6dP8LLeso3T0IIjf6UcGh/WZNgMn8geoov16Qwk4qvh9W3W/+S/zruyBM3KR8YWi6oyrUscZLPH7IiHSr2trVBDMMEQBF2Wncna05SV5yXHBpYzi9YU66jI0NpqQFH2oaxSheYaN09x/ZJ5IGCucSTJISPxpOvzVw0w+TXFJJ/d4644T+6+Zjysr05VH/B+/+I+nKdF40lJDk2Up0QnUAtS5UTxlxNi74eDBQE57BpQAFYOfahmgkt2GX/uIILbrjAmvj48CNbezrkQC89vrn/WQcnESwi7y5MwdTS0r0/Ows1/E02D/rOViFUwNNZqXgR6+yAsfw42kVXXwj2U1aGCk72bONyhgZYzmVuP8wCd47wCxuVwlj1ilH3gMkHSrzg4tXpz134LBnlUwSC2f/fvtgRqqtb7NPBF8xXdDBrMvzAA8e735kNElPNDpwbuiIUrNOSlJ8LQh/k1V5k8WC8gd7g1FiBSPYEzztBHnxKzJu0XexzKtofDbLMhZiIM+fmXNW91nmdwui0ziI6mNjiMkBOECigc5lqt8cpaH+/1vw1Yay2Z9B8/KDY1YpbJvAslXLgbaZcbV2JuqWLVXgeksP+UdgXDUeVTdBlcAiVZWhcuKJV3rr4vjxkAcUnxhhUnmC6qC4HJzLu/Q4noHZG+rLpGX5DVVPtNhh6nEyAVIPW4w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q7n7Xihe4V1AmTuyzPR8PoB/m6wcMVdRJSjQ/soC2gEqb5IrG6XuQ0mVFWhLUFRGOoUPjVxKoeQ7NJEW1roUmYLlbZ+Xgfe4uFDdw87+seASEJB7vKNJ4QGCZIxWPsFzGeagzild+MgDsgxj99xri/ogA/5f6UJjROx78ipZq3ZX79novMtpYvP6aLVzi0mfoEW5iqqYUBS6K+Q0Z/KRBVQh/sf/y0O8UVl0x8nZdYuLtQ1Umy5hMbp++F3yh7PlPmkbxBvmBxfmNdmuIiNOwMQAOXZa8favJmvC5TBPHOgtL+tcmxtQbUHpvYF2wXHWh5f2HaLRY8kd+rc+davGh8o95bA5E7D3T4jI8J+CF+P/GzpJgit0vG6kAZ2YmpXIzSfcwkSj7TD3gw8rUNrgwQrQC8tEomG2U74TUxxUCz3q8NAt0R7G/Eb4yYg3mQg2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:37.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fe53cb-5a29-4d30-13b0-08de8aa46f65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8814

Commit 48b7f802fb78 ("soc/tegra: pmc: Embed reboot notifier in PMC
context") added the reboot_notifier structure to the PMC SoC structure
but did not update the kerneldoc accordingly. Add this missing kerneldoc
description to fix this.

Fixes: 48b7f802fb78 ("soc/tegra: pmc: Embed reboot notifier in PMC context")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a1a2966512d1..8268a41c471a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -437,6 +437,7 @@ struct tegra_pmc_soc {
  * @wake_sw_status_map: Bitmap to hold raw status of wakes without mask
  * @wake_cntrl_level_map: Bitmap to hold wake levels to be programmed in
  *     cntrl register associated with each wake during system suspend.
+ * @reboot_notifier: PMC reboot notifier handler
  * @syscore: syscore suspend/resume callbacks
  */
 struct tegra_pmc {
-- 
2.43.0

