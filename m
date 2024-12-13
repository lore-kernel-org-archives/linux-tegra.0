Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1338621;
	Fri, 13 Dec 2024 00:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734048245; cv=fail; b=WyxiRllMykAreEgnDw8y3cj+2IjKFewy8logb5Jo0PjLC4wmlEKUCVBFqIOQB59J5dNgZvJzJsVQny6AIKb9UyVcBxIQu8u9vyqaiwSdHFlONSplu4ZBcx0RuC8DRlUTSUVnIdMNoCtdnj/fFuJTciv5u3FAhywM06/iwp+vFiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734048245; c=relaxed/simple;
	bh=hZsbV3upk+Xctxhhr2kmB3H9vSLIXUoIqlCa9PYRl2I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=saSu86tg9BDXvlRYYcNj+r3HDwlwyE237GmBi+i+o6BO9vHRZEMz+FXtlI2+d61/dWNqLcxa9AaHFYmRLgjfn7gnMatP/Te68TrLiN2rqIlj7MAC3Jh1ne6lNT2b7/H+SYiZYLYJSVCcfuKTaBeW+BJJ5c9DCJPfpk0w9+J6WXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J4W9u2wm; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J4W9u2wm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDovZqCRHZziriIUEWrb8aYFrpB/81WOWKKA8oA46FKPwe1IdFJRsl9sbf2mpXv82SDwszXnmanWT14nwgeNe2sOC2qUnnG3khGN4u7L7gCDMtNba/nZZbQF1Wxi9DON8ZVfCVV8mWqgIi527k8er5HM+rPIhkNEaMqIaaNY0DJz2Xd56joguuTIm+Tbx9ZSaV9pUAuWDCBifR8tupiifPI4TCmdPswRPm4KIVMPrTt0hBSX1MBW6M20EQ2xeL1aulU5klk0dqATNtK2TFUzwcMRgJnCL98d1kJ2ADgZ6flNpj6IZtUcBfJULphqXFL0ZHQHWypoUHcvj4a16CLhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU9TwJk3CYIcnqMdBbh8J9pSkCw5qnPaA4/giMPQnc0=;
 b=wozygn5NCUgUki9jYyXGZHSJXTmDPDP6Os+mIta+EvLbcrje1j2BWdPkwXuE23Q3DXx9cp3LUoCbiQsLAHD2lHIe55Ti7OSr/uy5PIv96zhM/Vw8c4TFJ0C96zL0bCK9xHOYg3Z33JPFRCgRHSnApoIEsqUZTD4qLgmP2CroNeDu1YZMWPR0/QwLt2ld5oEhEh1CELoKBwOq5FpAsdenv2ZT96hlMwiR2rjnI7Rs6HrV8odpfY5V+P54J6dXt4xdglE5vfOAMNzUMbSLtKdIAx093eIgR9UxxbZxbUH3uUX+MaNaQKa3Vj40pE1yAH6BHD8YPM+AX9XU+oY5VcjRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mU9TwJk3CYIcnqMdBbh8J9pSkCw5qnPaA4/giMPQnc0=;
 b=J4W9u2wm2rPEkBo6SFswGS0CcAA+4Sb6UyiKrGspGHk7/e81CNCPaLNZxGlk7uYkpNj8WUv0rnP8BLImsu6F3arIQRvOdPacc5y7tLM6QAdfaIBCUu12C2zXCjbXSSxDmob8PGsQ+ptnGJ3aUle4swUx20h57fv7zZuFokUhq3nzNcagF3zOyxR/mO+9ptxXp2V/2TXva0ysHKjvKmuOHGv3rjz1Lb5dRwsyrNib1qUkJv2MGaazu/wJsskT+fLBLyj+vaDIhHj/ci/hX1oMnaFnaB2bueltVqrBqOWLhpKhfyxyFQurG2tTslTUIKN9pWclHzwTD9TY8XolUFoRlA==
Received: from BN9PR03CA0649.namprd03.prod.outlook.com (2603:10b6:408:13b::24)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 13 Dec
 2024 00:03:59 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::4c) by BN9PR03CA0649.outlook.office365.com
 (2603:10b6:408:13b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 00:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 00:03:59 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 16:03:46 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 12 Dec 2024 16:03:45 -0800
Received: from build-yijuh-20230530T223047391.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Thu, 12 Dec 2024 16:03:45 -0800
From: Ivy Huang <yijuh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Brad Griffis <bgriffis@nvidia.com>
CC: Yi Ju Huang <yijuh@nvidia.com>
Subject: [PATCH 0/2] Tegra234 fabric fixes
Date: Fri, 13 Dec 2024 00:03:03 +0000
Message-ID: <20241213000305.3533971-1-yijuh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b89a565-ccca-4bf9-222f-08dd1b09a514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NmGC01pH9Se+02cnClRsZmHTV7BAgJkDnDC0LMAmVEuONTXVWdFs1oMVSCL+?=
 =?us-ascii?Q?N8c5wSOpD+1HG6fXNy+mmo6a4Vn+HthZ2jRQsq4t8a29thEV7mjBBCdvPCDm?=
 =?us-ascii?Q?cVcKiPVI3u0JKtiX1MZ2HhboMIBvIZUsIpiFtt7xVt4ks8rj5Buo4ajnNS0i?=
 =?us-ascii?Q?O+0I32BCUAd7eJzzxNt+LGn4hOXixJqp91iKc5h7M5IF/gkwr6R366PB0UxM?=
 =?us-ascii?Q?i+uBIvkEcokxQMnIncePS7HUqQtAOehmyB8tSRkZFq5qezB/YnCrhPJqDjnR?=
 =?us-ascii?Q?w6iuTYlBOn1SHa61/YkO000hPuKhYx3m/ot/L4FqOa4ZqrKoqJn0ikmL94dO?=
 =?us-ascii?Q?iC2lqYZxIpLdWrW1AvbWyWv+7SmC4dQbyXp+453yzOPbciT57VGZXuSCkwVA?=
 =?us-ascii?Q?E0GQ1ks6aXnKbe6IFpSgfhJ13XkIG1onxwfq+nZA99tvFfaHCRSERH4kJ8tj?=
 =?us-ascii?Q?gRaqLbF+9effd1PuLd/dc+i+Nkp3Cn8Q8T1Lxlv5UZCfLznVd70FVlhSspdi?=
 =?us-ascii?Q?2NsK0ygIcHv+T+KjoSRDzxFWOlVbt18Ti842KaR9UrVE0j91Nxd/6nKP4Svs?=
 =?us-ascii?Q?mEsIRlwbyVJEOsvTpD9BUubjW8V3+Ux91uDF/Jnysj2nQhtlx+Ztbwcg664L?=
 =?us-ascii?Q?zbkqfz6V9o4WOumTKNwdktk48f+dSgWl0lkfFfQr1ZvABPTJ/Myny/hmROvQ?=
 =?us-ascii?Q?PGEI4qMz2OFN1HmZdOk5G/hdvqK05nGMLqMwmqv9Dr/JNYqcZJI8IQudLm6w?=
 =?us-ascii?Q?xQ/xci2m5LQoY0UKSc6+wVvR4IV2RThyKEL/5B1FcZLrjiwxRzkkR9mrEm7P?=
 =?us-ascii?Q?lGFMcikng0iaSuvwfzFu3vkjvMNWbApEicZTIfpvM5uVwQpmwVFOT4fcoBVT?=
 =?us-ascii?Q?2lVVbYK+POuuKA/AmdzvAacbJpe5J4b0DXN10gYte6U+XB3eZX0xl2etVFSb?=
 =?us-ascii?Q?fstnNRX3LvurwtYqMm9mGSW2QH2+Lpvie33KCMUMLhirdu3lOK6zHQiJ57rO?=
 =?us-ascii?Q?2goTi3db1ZJSOPbahSWITX0a1EPxP4olyRX/dbUPStDhFLAFEUUIoyzVmsOp?=
 =?us-ascii?Q?doRQJfZrrNS1dinprfkG6yQAR1/U2qv2RyB5/4gdJyl2UEcA8Ms/HL+ZqX7/?=
 =?us-ascii?Q?aaVFMdmz4kf3o6acE3i0YQWdPPQEdE4O4zjqFMJTRauFf8YQyhUkhm0pxOkp?=
 =?us-ascii?Q?wLrIH2KYGifVbLk2xj0CGEiAbWAzZolgX5lT4eSFpluSB8yC/3xEUOODyimS?=
 =?us-ascii?Q?yLhYMgDyY3f0wHa/h6eU9t+epkiDzOjg76rn25Uk0LNOvfpT6H/ZESHuL+vs?=
 =?us-ascii?Q?kPplppKWuE6v8OsiAfEYllM5n7uXzK3rW6NcOq3Tw5R5Hm7PGnFth8wdM2bL?=
 =?us-ascii?Q?1AjwYbBGBBc7HfFge33pIDSqq5O+zDD1Rhoba6YVPx0s7LpwL+vbJSt+gVg3?=
 =?us-ascii?Q?lA9Zd+xbVZrfSyMbQBil4aVdn/ctjevs?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 00:03:59.2662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b89a565-ccca-4bf9-222f-08dd1b09a514
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240

From: Yi Ju Huang <yijuh@nvidia.com>

These patches fix issues related to sce-fabric and dce-fabric
nodes of Tegra234.

Sumit Gupta (2):
  arm64: tegra: fix typo in Tegra234 dce-fabric compatible
  arm64: tegra: disable Tegra234 sce-fabric node

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

