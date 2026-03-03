Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2763548EE;
	Tue,  3 Mar 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553628; cv=fail; b=pRt6l2gdgPDCVlmCAn5rOxIb3w/bXYgzJoPhjKLhZlwuyNDwLqGzoHoW9+QmYhJ8QPqFyDnZS7VpbqpxEDxesykdvw7GHoNuhJ2gG12rCtULj2dXXf/ZJwgLPQbe+wucBPCgforzd3fQcDAOfbno4U2Rr83AcFbMrIoKaYL471k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553628; c=relaxed/simple;
	bh=/SCVZUdljMvITfqpjfBhPut4ajfzaux4p1XiBOi6rGU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GE/YSIpcBqjUMJZce1syre3CW2YVBt76bmdhrNIr4MsMfOo5SYQ4vqf6xGqzdeo+tBRVKubBLs51TXlGECiiwlf45Pv+GGGiMwbR/QwvV82mQHuvZdyM53Zn1n762A9DABLWfrGoqEvc9MLEAMEjL2Ej4cDk5bNWN7RaRW+xGhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A3dADwLH; arc=fail smtp.client-ip=52.101.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A3dADwLH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=op8oSuv+fCMw7A1tVkAnd55w0/bln+HspB7ooP8D/Wk0OJLDMh0Y61QeXBgPBLpQFssjSGr88hMfE0Uh9qXOvIGUsULefhaBLiO/2tm2WCBGgxQeldCB4c4fg6vi+f1OXU4nh7IPcslsulE5VAWQ6yMr9GTCwPHMJAMYKh6Ra6yRqHBhKZ25QvRBEus+p6N3Bl+M94NQz8DEiGGGInK22x08HBGNC4YXHlucbJfmK6ZtsjV5FJwEM3mmkFpCd7bx/UrRYcfscBPgvFBzeiVnK/SVDBp+IPQBa9LC62B9YJqFTjpP615i0/7qP8knVirXfODlC5tyulyvDCDwv9RP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yfdokv26sef4TzFwz8kU/HFYAe0eSnUdXgtQ+pSLrAw=;
 b=cU+y6F7CifaT3+Z5nnn+o5/8Pw6nhS+tPgrhg7imrjhEUufQx6NbRRPxi4JeSs63JNqUg3aqFkJxGDSL25Qj2w1e26q9oLTTF4b6GENEF0/0vOqkTAHW2CYp0Ob7zv7qFYe5Iig5XOAhKFNjglF78vjB2+QLrIwvAp97QvwKibo7h70LtRhOgZKF9CvTSZKWT5rhx01uK1YkKet9mv3pfBdleN9tuGyx07KI+YC/cL5ZmEtZOmF8GdTFBBfbw+YrE1SV4PIrOnkyHePaQuL3mnNwxoWWJtK0DEp29nsatp22eCjs8KZhAiVs9rUGVYXU7m/hwKJo32zPhksu1nYBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yfdokv26sef4TzFwz8kU/HFYAe0eSnUdXgtQ+pSLrAw=;
 b=A3dADwLHbqzzhQyXk5eLuAGhFz/yZQCrrtyl8eY7Wms1xwJCVNWiCXe7jEQcImeolVfN9NoehG7VcoP4+oBIZqjmQJ9awbjaxtWNkFX79vWZBdAgYb3Oem/NL1HiEQIw7kazzY3ffwNVe4sNIl830iRiyZuX4nF2WGGseW12k4fVjUTn0/2qrtQsFUWMCPBplyg8MKZfgKUu7jMoktc5Nbdwt7k5ImNBcQnt5nLaSXHTHPoxLp492EWUz3Eg6Bir/U84wINKve2R2twggEUDiDSbXB+O96d2ubdtBvO7QRoDT0TPVsVHTgLYeP2JdPkT7i0x/lBNuqeiYUVKikeGGw==
Received: from SA0PR11CA0115.namprd11.prod.outlook.com (2603:10b6:806:d1::30)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:00:22 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::a7) by SA0PR11CA0115.outlook.office365.com
 (2603:10b6:806:d1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Tue,
 3 Mar 2026 16:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:00:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:00:05 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:00:04 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:00:02 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 0/2] soc/tegra: cbb: Add Tegra238 support
Date: Tue, 3 Mar 2026 21:29:25 +0530
Message-ID: <20260303155927.1885297-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2c6598-5340-4148-86a6-08de793df9c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	csVAnyDb1HigEbHWTRK9Jbss9yn8RC5u2uRfdowabZ7XGiSov4D/sJiTrvpVzWOWDfFrqn6Eyx8MFMYcNEE+j+nyz/jrv5+VFrdT4D7vEYtWEox3/01Wpb8obbN2wTyQopJ6zWWtfGK7xJ6QDRMCNGTpfyTFcUkDac8YIxq7uUTS8Z3iEKhLcYxPrcZiyO8uU2ujYtBB1/wSCMr+XqgoZ7wjuoxsGyOPqXdtPzV2fpFSwr0s6FTvNY1ZTnhUTPy53b4zuqUCFjU7US6Q/3sG+6jFLmlTOUjpNqtrsHErwZzbDAUwtOYl9yI0DQUN9844nEx+WNP+sAVtYRghUfmQM+FTP04MZg7XHkyoZUu+OX6MtzUosaWXQQgkXjIUMsIXC+ef8sjcbqCIXF1clX5epGdEL2beOrqv+grn5Oafk1n9oxO8FtVVsMuzzBPHserdkIuHvD5WXYGRGOthYrxePQR8Oz5NLqs2IPiFxidEIpo0vwNBVSpPG/H+Ddpxe82huWNaB1zWZ9IgcTF17+i4TGz//5b3llHX+ZOhCiVZUW2nOpWz/OufT5Z7CdMuMn6tSbVqc1LhNu4kZ+o2C8byLfGqqziib3CbpJATyImbqk/Sg8omrx5ybK0rjl2HwtzJrt9aoVmu30zknnTEU1zRciohN/6fkrm9r3s/1oa0DqR1o4ZL1uloD0CHuNGRLDZZSWseEpuWe1BOzUU8kLdw0nvwD+CXXJ6HvLwodHKWNEvnAXhtQ8BdQY7fxyT91dq6MKFKgdJTh+wlhWrikASWjkhKPNriAvSk0CR5RxX8qSlTIhXvqCfs8lG/bmp6kQyLtWAF7myBCNV2PAza5sGLuA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iwS3iumeWbQotQ0J7/wZ6vk7uWg5T/IXvxHCMeScBvyu5FJfPyI+xPWPKQgdnpQMaa45dFqooc2Cl4b/LDxKwLm9Q1b4yd37RHPleB+ibidyhOk+NQ6qq2R4Udn8+VLV1gmNiJn8tAu0A9vQo4rR0rJCR2Noqt8ehBLUHsyivG5EPk6Sj6wZ3JXmtRr7JT80QtW0p4SKk8Ig8mcdj1dSKNO9+w+d1aut0rcX+zNxbZc1U+Bz3Gd7NtQaQCFCQE7Wv72w7SAHbsmYk0hKkyg7U3j1Rwax+rjbWhZlCXYJKTNy9k878VMxpZ02owYSMAu4bItQbig1onpRZOjGS/UnE/oosp7NZ+SzH00LMwlz0N25g0X5u+pe0dutwLA2I4hXtgIniHek1QqrO7arBjMvuqowW7RznEeb0oWCtDwESe7siHAW50gHKlFfkHYbP8be
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:00:22.2390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2c6598-5340-4148-86a6-08de793df9c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456

Add support for Control Backbone (CBB) 2.0 based fabrics in Tegra238 SoC.

The series includes:
- DT binding updates for Tegra238 CBB compatible strings
- Driver support for Tegra238 AON, APE, BPMP, and CBB fabrics

Sumit Gupta (2):
  dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
  soc/tegra: cbb: Add support for CBB fabrics in Tegra238

 .../arm/tegra/nvidia,tegra234-cbb.yaml        |   4 +
 drivers/soc/tegra/cbb/tegra234-cbb.c          | 134 ++++++++++++++++++
 2 files changed, 138 insertions(+)

-- 
2.34.1

