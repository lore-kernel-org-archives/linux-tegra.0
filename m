Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5C1E4AF;
	Fri, 16 Aug 2024 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723833846; cv=fail; b=uYknERSrjPnGGeD40TvsLbwT33XovNCXcliQdhsBDidg31+kScnA2ouSFl25mQva3E2w2IBlRzLEeba3whRJsKniFILgo6X/BbzKKbPXL1YGd1DRDr4Obj28Vc2xTQdkTyiOgHnNEs76km92ddtKzftXQJ2KjDpoT7DUoTqeTaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723833846; c=relaxed/simple;
	bh=czU/9jeoysWxwksHZAoo36rmpZNRsN9SLmXdO6F5ZJU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tj6uqj0SQGSsvBtVQAr42vr5FCgY/qGWEEpb6oSMW5/5P7BhUCuUAQSND+uSu3b+SlqQQfKmpiM78jh7b4l+za2VGTL06N/MboIRVlTKqyScZeJL4SA5ipOuJHPAifmdBXJo0Bp1+ra2OrfRQrDJxgKkhbP5XKuu3Z1xyfk0zTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eh+Qi8qV; arc=fail smtp.client-ip=40.107.212.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eh+Qi8qV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJcK7vHoqr3l+CPDTMYuqXZ6T2lm37d9pJXC9KYsPTS4FLXx6ooqTuj0K1wOYYZfTXL5N8b0AF5P8wUAbzuxzq4x6iKqOJCe45UrkmL1hl8b4AOA5XtEsU78q6ZkV5wemJePeJg6rda2elnvPqvHkzNEuX3MI71HLcjZyl3LUJZvOb306qYEY0qu/9zAgksi2K3OXxhm0Unx5WrwO6jft8/71YbL9PbrX4gDqTQ8WwflurE/qn6rsQD5Qw5xLrM2ORpwFfN6nKpCQGEPT1wmnwYrnJ3YzMjZubk3M19AhkDTPzt+UCJgdc8A43JZtefaXAljSVbwe66/DGlWCatS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqVVlavkkZxF+BLtqgEwuGK511nsvPvPjTgAjis2FVY=;
 b=GlvFC3jpAzPB1AiLHLY2POWZpGoPteE1QiiZwnaMF+eCfgvcJi+xS0eXVAQv2wvh9t1mqYRqjGs1hl36+fL0HvwflCPOmXI9tXKThzY/NPEN7PxjTLG9valqk+IFC1ilcbP7RWWgq5CgyVgWOlxtzI8fKEgJH1DPYgaC5p1B25vZf3GSwo4UuP70+KaFpWDA8Ilp0NKeWMBCd7QGNJamjQGNHPo5R3e+6XbGP1T+fYk1x2T9fAXAtcveJqr3VJ/kPdD2jqIsbajYzFuK6rUq499Ve/PRkvHWmoqoSulrNzA2nAmpg600vQ0MOVyMDPgWI1/szfVjsatpVbkMZJWM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqVVlavkkZxF+BLtqgEwuGK511nsvPvPjTgAjis2FVY=;
 b=eh+Qi8qVS4fLOKfBmhON+fGcnY24yy4CkKcbjoEAiJHCf9VX6wViyvHCN9Vq38k2zoLs2P1WQPn5ZYPK8/RPlcrxQazeQ0KSF99qrP0KlfM4HbClTnwLYPsvgSS8pKM2xBIeCLCFqmClsogl15lszICAF9rPqyuko8TXUPi2qBV8gD8WZrUfiLTgTUzwt/MWnycP9cp6RBtYJckZdGfClkYXZnouikObsZGyLSvLMx+06EM/kivhmWbcSOIDVTPrvYiskibu3oxr2TtYEMR4+eVIOySMaCFeDDucpXnzZqZpMq2TE12sBhOWx0BzMn+T2+HEFhV0V8G62iSPE6pHvg==
Received: from BL1PR13CA0441.namprd13.prod.outlook.com (2603:10b6:208:2c3::26)
 by SA1PR12MB6677.namprd12.prod.outlook.com (2603:10b6:806:250::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Fri, 16 Aug
 2024 18:44:00 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c3::4) by BL1PR13CA0441.outlook.office365.com
 (2603:10b6:208:2c3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Fri, 16 Aug 2024 18:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 18:43:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 Aug
 2024 11:43:54 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 16 Aug 2024 11:43:53 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 16 Aug 2024 11:43:53 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH 0/2] Tegra234 PCIe-EP definitions
Date: Fri, 16 Aug 2024 18:43:46 +0000
Message-ID: <20240816184348.2072535-1-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SA1PR12MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a0c66d-8831-4d1c-9506-08dcbe236467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kYLIvby04giRBF8k17pC3w5IkGObHmRqCWgeMnnZpVZzURuFQ/j06+J6I83i?=
 =?us-ascii?Q?tYdZVhaCbYa+tA++QBpLTq9Csx2KIiR5qtn+NNVzPE+wWrWoMj9PwOLs0HS9?=
 =?us-ascii?Q?ZeE6voK656OIiSCTw2IK7AA7okqogVYURIvb6GE6Trz1WiRTYM35sw79rYwh?=
 =?us-ascii?Q?rdQroickniZivx/aDUic1qTYOz+JWhPGad9Z0/UIFxofcrPqelBU9EqmFIZL?=
 =?us-ascii?Q?BSn+eg9um9j0Odpk2U3pBHD6eJJsaWbU1hEcvFmHboLJ2XEHB+CEvrznfmLW?=
 =?us-ascii?Q?HDluvYEe/nEq+VNOh4smI31eIPI2iHJ4l4XabxiXt8TI9yTy0GdLJU94eBkK?=
 =?us-ascii?Q?sitOjHaSjAJJDPAUBLCbaQtgYArzSUjlGDQb+FskBX0/xpjfpIVzfn/PQEN7?=
 =?us-ascii?Q?j7G4LTNH/FTceq0fHB4a+Q26RBWFO8NBPg9nxXyID55lJVQf6OD0nGPLRJ0O?=
 =?us-ascii?Q?BAF9sWWFodD4Tu/oi2sA1IBuRotKfFZr4WwsUqg7/RyV/uENr9QKKs6Q2g2o?=
 =?us-ascii?Q?Ez8MkZ+jkcEDTAmhMJI31gu2oDJSF3wDULW5HTKTrHL4W5EMtk5TiZbRpe9w?=
 =?us-ascii?Q?lz+lEQKPksA97L8bvkMz+l3dV855Vj0NR8uPF2FW+imjA97Xr28aakkOcTLR?=
 =?us-ascii?Q?BzW5qlBdXox4LO8wuGWMzSgcUppdI1N1RGi3zRL99Sqzo38DUmmzlZU6h4yf?=
 =?us-ascii?Q?2p2oLWZyHFIwxUtVRgayghkn2QIJ2HjFe1Ml+lGnDjXgZfTo8UKtZ/Vxloze?=
 =?us-ascii?Q?rmNxp79d1xzvUrDq+5PwlrocqyAPpKp24nklcs7dVNiIQYRXlPiPfKZwnFod?=
 =?us-ascii?Q?oiBecoUesV9jeuREQ/ABq4VTx0cu3g36Wu4JiU+2nJ5l/OEBX+WxbJ6Yh6nj?=
 =?us-ascii?Q?mPN22cfrr980q3R97AmmIM/Tghil5P3OR6RwgxsLEnBNZfjR9FtEIYSrxQdS?=
 =?us-ascii?Q?DdyK8XPiAd0YX95/MczKmtYAOLZozBfRw5RcDF/Q9doG2ewY3ft2Q3HMhz6z?=
 =?us-ascii?Q?nXu6VZbkUfjJ8h901C8yubjbCs4p7lcV+ZQn/Y4NNXdyS4SchfkVziVqTxMQ?=
 =?us-ascii?Q?d6FASrXjLUUHTUWZ5C8y8V52e17Axj2xYopT19W8tYcSzbZ8dJVqCzGSIQdh?=
 =?us-ascii?Q?7gMinjOPtp6p6vowxXS94zb8hH0BKtg7IhNEHjhYU4alIf4bvWrjc1OUnYEo?=
 =?us-ascii?Q?N6wy1Esj/6OknhVrLW3OBGqwg8cQAZ4szgtGKFnNwlRgn4mCCZXas8Tguwrk?=
 =?us-ascii?Q?RVj6Ok+sC/axWOtW2wHHP9fT5C8p/83SMpeQHkgzc0q4HxAwzluL5CqAVsrQ?=
 =?us-ascii?Q?WOR9QaY5pbcv0ws0RlDLw8d9PFNtkp8RNiHqxAyasBB6PUa0/Ifd/QevfT6J?=
 =?us-ascii?Q?9Tt/pZLf5QnRd+k3Qjx6xWbA6xcw52y00qhCDuMupt08dQuqqaHJ0lGr6Mzw?=
 =?us-ascii?Q?oqFlIAP+jQHfh7kuFlEXrHSJ48p4B5/5?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 18:43:59.5535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a0c66d-8831-4d1c-9506-08dcbe236467
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6677

Add PCIe-EP definitions for T234 Device Tree.

Vedant Deshpande (2):
  arm64: tegra: Add T234 PCIe C4 EP definition
  arm64: tegra: Add p3767 PCIe C4 EP details

 .../dts/nvidia/tegra234-p3768-0000+p3767.dtsi | 12 +++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 31 +++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.25.1

