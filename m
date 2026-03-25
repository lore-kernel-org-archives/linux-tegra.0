Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2CD38F63C;
	Wed, 25 Mar 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474049; cv=fail; b=XPcDX58T6YeosG9Juxrc+aWUi6GwluXkDXV3RA0woBe+O9zbkMvSt5lQpg33TsHDkPvfgbemZp4OTVDXCvCHfE9cVnXkw9vjF+IPeKVi42DKkK8mgihUAzQMxo79RTEQvjYySqP5ID8ObeNxFUirlOIfNJ/qY+FiYgjnDXt3t/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474049; c=relaxed/simple;
	bh=j1EkDqDVz7BcgSS7qFayPHhEGoDME9yb21yMIrn12xc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IWRgF28arIbsMkbP12NnU5f5y5jUmHSVqHaUUyYoExQXz0kfuLXaEjeYfSr8ff/2iXnsv+y1FUKgCBfIaXVlritSyVueSF33lGFN1NCF9xNdspOjxx3ZhMA4TmDJA5atXYa7jdLbsAkdRxn31w2+v6Nf84VvZnTBSaJ0mdOv+kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BG1TqSyd; arc=fail smtp.client-ip=40.93.195.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BG1TqSyd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaRnUriLurKA9Mzfv16E469bfyux3QWOEHXT2NgDSp3Of+JrzvTGNwMOUl1Cov1aW/fEDllIJfbGGpiBPHK8tTtcSdiqJI5/mtsb29ffMKVHi7Ejq6pU076Xy/UXIdUuWsknfn5vsSzfCk7/Uu/wwMRRhgqXUl4dqPgv8GC5+JGxVdG+PfBSDaP5PpGr+7+kz4NsTandQkXFq921FlFdY0IdleicWAQPjjEe7ldi/2WNJQEQQ+IAG9qmDsTMoxH/qo3OwaUg0OUWZufyDFAxQOxlTosg7/dy9ch3aGSxZaeoq8Zunvjz+8axTmJTB7Ii9cYo7M+09dzFshgeSHRQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK930Y0uuNXoQrzKNENK3ZbCVMw+PKWnDGA+kHBgcdM=;
 b=iifd/RjyoJnP3uJWTOhEZTguCrm+hrn3VIQQtsZv/Iy4A+2U7TAKY+Z5OnrI8j4ECd4EZxTX9TeoW5R9r+uwDoxWc+WpGWSDiVzAj8YGN41yPAtR/FKDGSPw8UQTbrjHYKlTZKvazJuy3/0HBRLmjrxeZikGTqpivT5i3yu3r3RjY/SvFdjFY00PttVlS87Z0jkL2xc7M4VPql/AnbQp0vqWD/EeOSCGHp9+80JQEQjl0l7We5efm2mYKIhNso2i8G5DYdd6+lDE2El984nR3tMH0Q8r8aUy3mHn7fsT1FagZEuAAqD/38POlRL1GoVf5vNvYu76NxubJNjoKd8iLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK930Y0uuNXoQrzKNENK3ZbCVMw+PKWnDGA+kHBgcdM=;
 b=BG1TqSydvKzXdolXQRUmdlKnGo3YdyF6VrQMVO9fgYzhG6GRhrHeughm/OEAKA/b1++IwHJjX3ZzqXVNX7BhTHYXtc+GNE5W07605B9HpseuIv19AKFnfwiLkBApuocYjdltg6sA9IlXPYNRgcrvp0UKpiNWqELOdE2wjVOHJv2DRz4GNB8HClD4223a7GSyipPZPg94+YxLpYh9ZyhXsp5s2gJZqitXQ/w7wjVqxUfaUlzaZUpFqNlnh9swHGmzGWFsovfmkmyt45VIdUpbq8gvRMmmGJ5ldnId5JP0oX2dBZKlcZXN/FmA0nlh8T9xwdTiY8ZZSSYEbTypn64ieQ==
Received: from CH2PR19CA0016.namprd19.prod.outlook.com (2603:10b6:610:4d::26)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 21:27:18 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::1b) by CH2PR19CA0016.outlook.office365.com
 (2603:10b6:610:4d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 21:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 21:27:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 14:27:02 -0700
Received: from build-chunn-noble-20251215.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 14:27:01 -0700
From: Chun Ng <chunn@nvidia.com>
To: <linux-tegra@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <chunn@nvidia.com>,
	<ankitag@nvidia.com>
Subject: [PATCH 2/4] dt-bindings: tegra: Document E2426-1099+E2423-1099 platform
Date: Wed, 25 Mar 2026 21:26:26 +0000
Message-ID: <20260325212628.1234082-3-chunn@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325212628.1234082-1-chunn@nvidia.com>
References: <20260325212628.1234082-1-chunn@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 672a8f1a-d6f5-4b87-0f18-08de8ab54ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|42112799006|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FcU8OlG5ezL20i9pHjN7dAZrsjLPTohGHUjb3UW06RyPFEmFlh9RuheprZXTPh3Qqnrz7eKrkjew/B9PMEb7DVPiLM8BzHDtlJDb01NfnHjEsao4xtiN1R50N2+vzRZArkzRg437A37gihocldTSbpOcuyOyCFIkARtsVgOCyrAZA/97yZMBl+zGCTcKdA/JTFQndeXvP4bzwEUccdoqzSbqSoRxs8G+A8qmmF4f838WEj50UXYbnWm5/HejpulmSPO/YOSXbUhPkBSDG5iBni6Zm84K0c9fLUrvO+iCjOozLhBhQmZse4RHII2cAmUUwgybmYcAgmQIwWupOqaa3gdQ8o2GyoYSSiN5ARaHR4OZiQTXJT/PrL32CvdDJQuhH/WbXi7P+UlFhnjN6Lwnuf39ICjtDMlvdZnceLxbdABG7RMQ9IMLHS/gea0aShTjhbr5mg4Y1ywVJvkIvamOODmD0YGCAA5UgRUn5wEZ5TEhFR6AR8/Fpt9p3wVjvvVK3w368mTUC/QIp+rL1yLE6wat2do4Mf2bAkvZ5FtrBDBOv4ihJds+Im0F2XXGuoIVxYLbkrRdC5d+BsLOCkQDBMANDBf+LDRyk6xS4/r6Y+50yIxoRkOY/8s7buE7r1VWvqDwAES9D+mu6cDSuMTE7aH77bQBiE6geachvMjplV8X0GN82cv0dXcesX3JQyMaezZPkBUDSnRMDuNoReiWZCpKRBDCox8EY4InWBPz6u1fd8MVB08+fgFL4o8FNnlkgbyTBvkmU4Dv1dL2jVXXaw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qUAXQkY4/5UUCeggHUf7vRTGj4sqpOxDcyl1GHY/KJTKI6CTkpfa/sI0H8t9r5k8c01+apaRTNZBHgKtp4XCnqI2s+/JLmvYALHZ3EBlFLEdm3Tx9PMDCRrohB9Qg/d6N6VqxVzZ6WO+NEbtSyCy7I6lfQCsn9v54WxqXBJ03O4kFaebnjMxAhFy5QTRDitjZmwPm4dJexjdURjZIVZbjeA2ZJ2YQkUzjWZaFkNZwhFm97ufFXXohRawUE/JsSAGiiKKcdkFM/4X0nz30tGXlgrVh2H3mSTXIgvSqMszG+Zp6sMOWYqu2Cgk6cAF8XzNAIvHuhhudFJKyt/YMvKhquFbQox0dpPqAqbHzegCQGQg5MIm7wEOQxXiVzbQTi7eSPz+UN63Sq98gqm8HwOV1+/O+cRr+FAtvRUT7ggufAMIElAbBQZ8DolP2Q+X3EIm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:27:18.1196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672a8f1a-d6f5-4b87-0f18-08de8ab54ada
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037

Document engineering platform E2426-1099+E2423-1099 for the
Tegra238 SoC.

Signed-off-by: Chun Ng <chunn@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 50a31dba7bec..96f19c3ca4a0 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -263,6 +263,10 @@ properties:
           - const: nvidia,p3768-0000+p3767-0005
           - const: nvidia,p3767-0005
           - const: nvidia,tegra234
+      - description: NVIDIA E2426-1099+E2423-1099 Engineering Reference Platform
+        items:
+          - const: nvidia,e2426-1099+e2423-1099
+          - const: nvidia,tegra238
       - description: NVIDIA P3971-0089+P3834-0008 Engineering Reference Platform
         items:
           - const: nvidia,p3971-0089+p3834-0008
-- 
2.43.0

