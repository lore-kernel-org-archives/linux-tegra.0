Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CB033EB18;
	Wed, 18 Feb 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426769; cv=fail; b=bPXfK2YH3p6y86EedzIlfg3pYbs0hhJeuX/NusupEq4vPEInv0avWlhsvU/58k4vIENw93nQHFY+NtZMmJTO19ZoGebHHcV1uF5AZUksd2uta6LXr+5V717ir3v5qqWu7RbNMjoSJhwAQP2p0pp9AWh/dQQseFvLqa1DlD+amlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426769; c=relaxed/simple;
	bh=cIhQMFQvRKF7KVieu1ZFGTOizXUCCSywviTQh8bvTKQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kXEtIxbRRjqD6zmOgSws884+/adbxZfX6SQ2Oc04rkCZcNY6pmtCX74uKjkAVg6z4l+XGq3Z4IMEsRlYkr8Z0nlEErtd58a2f575z4T4Z3R2kBY/BN3Xqxnx9ZLFOz8oJin9EfxbcafTcoqRH93pRpgIVwWl7HdiBesJc/94/lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CJHqPf+c; arc=fail smtp.client-ip=40.107.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJHqPf+c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiVCX59MBMNieAcZbmOBHpsOkeoSiRQBIdoudi4RpQi7MFbTczaOslwkZVALCn0CsWfu/YFikAVp+qkacv/tj6Zh/aIyxjdzPPE12Fm+FsWEDzB9xwEeuuO/R7ZFp+cs7++7d1Nv3xjDNEY/TxYA+BA+j1sfUVEz0nJksXesKvnsGJInSC0/55VPO8DnND60ukPC5d8Lmp0u5kjbrFO2dwYNvCwqr37sNiQ4nKfjKzmw1J+pQa3XpLrBbNFTfDA/XxtKhZly6mZngoVnMtNU/ACHbjEPlJehD7e4mQs80q0hFc11oltuBVs+wn6fQn+Xt3S6HY+brJJj3y2hTaLF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnmCTrDMeHYriH5d6Xmzv7d4/3KX92c2SKYbVpbkJ6w=;
 b=tM8+7V4in63oL8k8NevtmUwDxIIbLWYnJ0R/N1LY/eAjSz7L6dgo3hcIv5YyZBGGmsTvkzX+n3JRD8lioJnyKFKSlov26U1JpQmFRc0Exh6YJIzM8DzXbicCtt8y3RhDpxe28+VCFZWd3b5NAf4d9ho60I18Qsb/9GLKOQbw63fOTxu9Z0+ymWQis2ouD40J3pif5W6CyyZUF3P/LIKdISvuPWjwh6fluYxn9H8Di2fvBp66YE6W0Y3M959q5AMp5E4wPBcDvevatqOKM3kIjEgk5YWxcjeh6jBw6razxKygMd2joZwOFm16P26qVrpijya1V7nxaojUP+4JrHhhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnmCTrDMeHYriH5d6Xmzv7d4/3KX92c2SKYbVpbkJ6w=;
 b=CJHqPf+cL+Cb49j4M3A8Y04U9uj4eb0mAzLpf9x9VB3iTtQpqVe3pJQiuwO0EGbIMWGOkwKgo4ZmXCzXTvbu65Hd8xKgVgT9wpXfZxQR1J7uEtiAMcziOiJvnLIXibUy8zTvmKCKBIQOR8F+19pVIH6B2sMxuTGl44iJ9TIkCVG5Ef74s8lUPSaiKrJexpZ1pWm8FtmuM6fWXiBkrUr1FH9SBHBzVKR+uo5t6vSPbRXBkj1MJu/Row+z/iWrjPF42kNGy58uZXr6dE4Wl7yARZnqOoEIhrQdyo9y4Jy9L1eRMQp4NH3t8dXkxJLlWZPV1NCK80yfEhw3d2wddnmNiw==
Received: from BLAPR03CA0038.namprd03.prod.outlook.com (2603:10b6:208:32d::13)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 14:59:21 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::88) by BLAPR03CA0038.outlook.office365.com
 (2603:10b6:208:32d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 14:59:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:59:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:59:00 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:59:00 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:59 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
Date: Wed, 18 Feb 2026 14:58:09 +0000
Message-ID: <20260218145809.1622856-9-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218145809.1622856-1-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 1703ff78-8d1e-49bf-b595-08de6efe4c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QoAg+WjL0bmkBmZseGlGJMPiXqc87FrsciaXW6XG7sgDpeiFzzhtm4vwEHMp?=
 =?us-ascii?Q?9lOAakL1iJSbyCBLXqCLTYequuIsuZHasiEOZa/uku7HUPXcjyN/GSaDQaUb?=
 =?us-ascii?Q?lTa5eFHP+vw8vHg4X0tkm5QP0fW6YmsJYje9ltWyEIAla+inzMgPVPWcdBIm?=
 =?us-ascii?Q?ENZ8l5C3vXfjBKYfAPbjHdzNGp3KAnzuLpT7FYbQFg3CB4FR9CDJTBChrE+0?=
 =?us-ascii?Q?Omz3p4m8PopLlTGFvn1CYHYMocqDCU7mbmHziOlRK4dvDnwFVlbx2dK1XEHv?=
 =?us-ascii?Q?IsF1BvGfObwxEphZY9uRq7bFtlyV69yNQmo8XqcTsELQAO0KzX7UVjPBn+QB?=
 =?us-ascii?Q?M6rFCXXThsj6QqDgcNDaJDioAEjaIjLluvmKumz/EG7nMaQjVvRgobzXnUyG?=
 =?us-ascii?Q?VTiTGv+V0bPbmTgN5MxjPCY30DgeDQM9futH3mE2NLhG+gKfGubuAqqHLSQt?=
 =?us-ascii?Q?Zv48Wr4B9Hyg1TpihBCwbZqXAt2AHRoDthq1Bvv/HQKyVAR5BO+73d2jgAMO?=
 =?us-ascii?Q?5j80lLJHUIptra3GkBaI6huodryV3XOXAxwyzVCdffqUDJecKo7Qnp6Ee6CO?=
 =?us-ascii?Q?QnKXkRkpqAQRwjHUfmpHUY49UI6ab8trlVECHAJNvqm8fhJa5UcfvVoIKTgp?=
 =?us-ascii?Q?hEm/FIhlzafYNdImqt8aYSNQ4IpWmg5S2s13L79mRWqv3/31NDV88rV3C01Y?=
 =?us-ascii?Q?yLZwwvuusf4Oi0nsG24KZXaOcVkvrDRrqtpcjSmnoX4RKM4GQzqBDm9Bdd65?=
 =?us-ascii?Q?O0W5uwJ9dsAT7xh9qKNfFnYxI5CuYaSUgKQXjc0tj8qr3VJUcefuhnXKwrZn?=
 =?us-ascii?Q?njw/YFDT99kUC7KIgmkGGGE53ZSBBVHXb02RepQtVBT3aVxXiapu3XzBDdTU?=
 =?us-ascii?Q?YXGmYpODMTVinet/4GKNaxGLGREaIJqjELrU0CTmDAGovjApS+9LI2WXE1ou?=
 =?us-ascii?Q?kbHxwD8e1HLqr9ZaXPTbY0cqeczEZ8W85pGgAccIT0ewLX07vlOxD7aMz8MO?=
 =?us-ascii?Q?5XkviunX4qo7Vgk83qZHtMDfOcwh3ErSFe4Ej03l73wQui7v3EEpVdgb2KXl?=
 =?us-ascii?Q?Q8AklZYx4DaH7uBayQ+oKlf8xCIkq67Vtsq0d1c7p98XwcXX9XmCIF3ObM5Z?=
 =?us-ascii?Q?aM+wWu0NGmDYgGLKMZ8F89UmcufxRzKsjbPKmwicud8cMHipHFWgQG50reNa?=
 =?us-ascii?Q?ivyQlMUOx5AAygiqW5j3T92Tx/3DyPjBAYOJEIaA+TianFPVKDYHm4AZFCZ9?=
 =?us-ascii?Q?c/PWkZZeM4LAk3ZTQ7eXKY5KB0bYTUWJ31A3lmKfKvKW8zgU4iLnbM2NrrxC?=
 =?us-ascii?Q?zLOBoZGlPqIAQhgildBzToy+rkK5JJJtQDC/jRtH1pfMrhF9n+EXdfthssVX?=
 =?us-ascii?Q?15E/YLkD2wuLj2jxGfWR3CO4TGroU1GJXDGrH7PhWTFjOxJr40ZOhkYvBN9r?=
 =?us-ascii?Q?m4UscGMiHQ8Ma6zh0EOL4NqsTl5P5UNcHPIJWAFpAVfuWrZjcSvKjCvlTjjJ?=
 =?us-ascii?Q?AsrXKe+M5/i0B0GnYfNc+lkcp/W9lelrbBCZ9VppDj2cHnvCj3YJgyZQvo7+?=
 =?us-ascii?Q?BzaKqzgF6mwh/KR1dqajOgYH+HdhxfwdIhmArkbqVVVWSsLzynubzUyn99R/?=
 =?us-ascii?Q?yjatzOHPTzZ9DurEuGRQKzjr9FS1F0v7+AGuS/CB7YUzRoSP2wLscmFKByUp?=
 =?us-ascii?Q?YoPfeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	19D3imUS8ex7nBmKbUucnKdftnxTI1zh9Wd2ZFsmXzrSjv/LeNtuOOTK3+g158phyL59b+JLxQgHNLUfWyVkTDw03wQR+nMV9K4w64BduMVAOVVhs5Fl1BFCpKAV7W680uYunQmZ4PttQULh+jvdPhYfcE1Ytmf9Ou4lEnQ4AGHQkjKHUbLT6ih8ER+uthiMSKBeXDN2mHGQ0I83tKdJPyNpcLbmnjECjEE7l4Faik4hJMHA4piG0ZwrAhrOHxS7CnBh4hU4Exz7PkS/FiPW4Em8WksckI6+kZfYKOII9/eP9FTFRR6rnatZ6QgZMjZ8uZXPoRjphXDpHoo1Zal1sW/FYktPW9iVGBfPK4JlGjNpkScQ3ta5nSal19g4Vm/0v+O+MKPnaAifyQC5AKGvZkJGcs1Yqxwxo8KSp43RmY5qmc5x06stivWOXQ/KKliD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:59:20.8469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1703ff78-8d1e-49bf-b595-08de6efe4c16
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211

Enable the driver for NVIDIA TEGRA410 CMEM Latency and C2C PMU
present in Tegra410 SOC, which is an ACPI-based ARM64 platform.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..3d0e438cb997 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1723,6 +1723,8 @@ CONFIG_ARM_DMC620_PMU=m
 CONFIG_HISI_PMU=y
 CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
+CONFIG_NVIDIA_TEGRA410_CMEM_LATENCY_PMU=m
+CONFIG_NVIDIA_TEGRA410_C2C_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
 CONFIG_NVMEM_IMX_OCOTP=y
-- 
2.43.0

