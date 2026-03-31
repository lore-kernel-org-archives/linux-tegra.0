Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF48D36D517;
	Tue, 31 Mar 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956255; cv=fail; b=ddmvnXqq6+oxtzRAdQ+aaMXhI2vifcvHoblNlGFK5njyBqEuPDseDl+/zpIenYTNJfkgSI//EZjcxru+JD4OF1dwbzTN+Ick59d3eDsLjalI1QuSzvFUcstKqU4zkXteL1uL6YCoQRMS0/A4WS/yeCU1N7fiGfSUYsbYipv9MFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956255; c=relaxed/simple;
	bh=EgLFZg8nc+wMnvHEtlt6A8l6uaRdR0bS3ZtBSSn7jeA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RH/bjeQkvj8Vm71roaLQ9EyjXDvVnZdQV7/kOW8YHwGax+MIafXpH2e8B58EFboQdu9wfuaixf+jI7FO5I2fPA+1KQ3Rz+G+CRnOjzF78YKFL//MiJSFTOl8abSXCey89gzJKS6MxdwKQUMF9wYqIEKzDnKtsPMycT0cxTAmiaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SskR/oee; arc=fail smtp.client-ip=40.107.209.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SskR/oee"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgJEsv03dUVmS15NzO68Cm3YfF1qRk3NhC81qE+FiB+3OCBaI8S3f8oxb+Oh2C0JtotsAjA/Gf+EW0oOEH8w12yqcff0LYDJxyPKkYRnj3jl9+gGmFBb6DxyDxlx6kVw3wx5VKo8Y6e8yCK9+Xcm7a8ATZfwb8TiWqkbS0dzHAZigjI2Alk2fqlwgFXTVssMGEtUU6ui5DWyXOzjQgNThhqmyDIbZSDCxk/IOzUiGPDlseSu5KUkQfHHPF6mA0WI4mzkB4bKbCwK7oH8LS0ykgKUiDtgfix715UXoXyiLuunrbtM2mz8lMYDHs90Dj6XUI+lQuW4og9rXU44jJZ1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6w0UwrIxGAu0QPQEiQQKTcfBUPGNIBT1dN2wJ/nP9o=;
 b=AWcFJKIIpM7jNymSuMy30gjrt05YTfaWx6y1az3N+vtaGkr5Rk9PzGM3vE24tgtlIa+gcS6VqOo9LM/y9aZUXkGX7VcJKH2OTUoBUpEQCEfoLzdY9ka4vvgmpwzarqlItAeiyc7G3GjzHjHVwrHyKy6RZ24U0minNTQmgvmJkKzucuHWOey/1g5vUBaz9FQqvc+FgcvQf2zqt2QNvXwF+s3iNouCYYwZrqVhxanzZ8cT8KAf9dMIoAN0EvtRynZuovhdCHvLK7+pR/5P8LmML6Os/R2xNsVF9oPh2GozMrlJOLpindx/2SKmk4XeomHfDzNEPbH66veG3+rkWZwb7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6w0UwrIxGAu0QPQEiQQKTcfBUPGNIBT1dN2wJ/nP9o=;
 b=SskR/oeef+XjGhnRUZni+WL9URHS6yWpFgHuCuj12sGggoj470FvRiJz5kk3Z0J2yTKkHX6Hql4U0b2/pbG7qx6lIJf333iEeKJk8pCvwn7/X+Vopy0fDFaNQaYrvnSd1uCF5jNxdklhoExXCYMXZTEguokhdqegpmhYhh/jIqBwppS/7HOsVYVfKZEoNHC8kCTvjL2gu6RgckRKaO6u5CPxrZNhQTesr8oFHZrj5vt+E16aBJRSWST4kZ/4ION28/UlpJJ6NNxNKB0aY+OfS7Uj4uxsawUU/G6klqWChJDe8V/uUbSp2aR00XcdChI9M9dEEejTZz3nVFGpLz0kgw==
Received: from BL0PR02CA0114.namprd02.prod.outlook.com (2603:10b6:208:35::19)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 31 Mar
 2026 11:24:09 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::99) by BL0PR02CA0114.outlook.office365.com
 (2603:10b6:208:35::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 11:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 11:24:08 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 04:23:52 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 31 Mar 2026 04:23:51 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 31 Mar 2026 04:23:51 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<=thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <sumitg@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH 0/2] memory: tegra: Add Tegra238 memory controller support
Date: Tue, 31 Mar 2026 11:23:38 +0000
Message-ID: <20260331112347.3897841-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: 10dc5c63-e81e-4aa4-df7f-08de8f18067e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PhoEEgM2FBZYgI3lOS2JCUd/VIe93KORCneirgGuwy9fFa0NQxo29YIuNSfk/hTMQMXoRU4TJT6EPhaZ57FfrPrLxnJrTMyA5n288X5z2DrFOawHSHCRD91LXBFsLcoXQT1id9nZtxuTYENzPrHPMu5CJ9y/mt8KVcseIpC5p0TElov31qTHqvBKqFCjAk/dntGRonLM+8brgZEJRIk8+TAJ28LpSJMVUO0r1/zMTZr9XZNxaYUbH0IXgIMagt+WxjKzf4JqW7mchFEEucqh/nLt1sL5/uf2v3hahxP36WYKXZzj9sCQc+FJ+fUjIoo2ylTC1M/A+f2XsBw7dk/rtfhIKWAOrAZVTlE8Oe9n4WDAzOshx2QOKeqdLgSggS1t1Ici+1vt2Rzmz6H96w8V4/nNLVitdLvoIutwY56D0edRJhWWfWG8ojhRuiqJ98yTh3SzWKhCoCycLoMqNM+AOwYr+SAtXkdVKneus3eeAropfPlTJYxQfhC6gxhqc6uyFz0MLm7Hg755PiEofkromV3POKNjmm6R7imiNo0VtCA1pA8nGCgOP+DOknCLSCutOQsF3d3MqQ6BpTqtc0KCRBFM0A/9x2Eu3wvb8sEIHU6nAsUABqxgGH+dQofTCOqUIaJdMFuhgvCgTaF+v1XQFSgkX1AvaIErpSo6pXLgvMcDiEPAGC19LfFi0ZHISPMXCzAG/QYMkLGfa9O+aq/f21DNTKvLuA8fJvdYdZ+2/EIXourW2JIyKWqUzSaSoGby0UeJzuANvjQPNd6UEwsHbw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	doRcHmmHk1AebJ64sX3k/iCrcHS9JoMUboZAj2cNznMFZWKagYMoFgxNB7o6K+kBVJhoSJG9VCVsTw9BU7qRZto5LoLkslTf7BCO08d5tbWtnBrbeHZwlyx0aw10atWalxz8sylwPjnQ7F4E5cmaTrOBYkfFYey3lVMDmBmQo8OQcUveBJst/0+X2OgDMJPz0qgnrKoaa9UVQarIHb3y7eXPxso+CfczF1GJ8AixqyCeGqwg2BaJjeGAEV2VbNSGb0b4M25r5DLSL4Zy+bj7eZXU2RilYa94WpxCtz3S84ef6z0IbNjlYqPLY8O2yR6ixruPHpXFVYsk30B8v+DngBWpOP1HjDWXifHCaDtIl4oAb2xrpUQIXymUbY/PWmjQwHdES6Xr4L6OGq1y0SwwSkSSvOfkt93E9NvmsMXgsUHjylcfU/1+y89Z80qr82Ms
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:24:08.2337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dc5c63-e81e-4aa4-df7f-08de8f18067e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100

This series adds Memory Controller driver support for the Tegra238 SoC.

Tegra238 is similar to Tegra234 but with a reduced memory controller
configuration featuring 8 channels instead of 16. The driver reuses
Tegra234 memory client IDs and ICC operations, with Tegra238-specific
stream IDs for SMMU configuration.

Ashish Mhetre (2):
  memory: tegra: Add T238 MC support
  dt-bindings: memory: tegra: Add nvidia,tegra238-mc compatible

 .../nvidia,tegra186-mc.yaml                   |  31 ++
 drivers/memory/tegra/Makefile                 |   1 +
 drivers/memory/tegra/mc.c                     |   3 +
 drivers/memory/tegra/mc.h                     |   6 +
 drivers/memory/tegra/tegra234.c               |   2 +-
 drivers/memory/tegra/tegra238.c               | 395 ++++++++++++++++++
 .../dt-bindings/memory/nvidia,tegra238-mc.h   |  74 ++++
 7 files changed, 511 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/tegra/tegra238.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra238-mc.h

-- 
2.50.1

