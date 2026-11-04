Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790623;
	b=J9ukR0MP0YgC2NzXT/9deYxiv0wYiNudjS7Wlnl2ExIbB/IH1ZY4af5vgKJCDETbN4jN
	 4GhBIiJ4aiyK7Zal0psXrhtLojMlf1XAaWfm8FF1+e3ia2lr41kqATiZRc1pvFOYqfpyZ
	 06y5SO9kDx0nCdAvq4k5MX15JW8fNrxZcKKQOkUmJ9ZCiDmDMYK36HvFQJn24UR9csuWR
	 W3fH/AObkwtvSJt/K4ceIHPmUrFJwQLD4cV8n/86lt2+iuvOUf9B2wQ5rPbxJAYUjwlkE
	 hgwQowll8EgqwVHC/X5w6S2c3qni2IXtVZBSXWjCsCzRyQaswwK9is7oGUDKMPlKs6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790623;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RlgOoHH5FSwNsMpSc2G83KCScv/P1ScNdL/EVqHsy0c=;
	b=YzjKG96DXxCH2Jas+nPEp6Tv2jvdD52VnZAIFuYuWfZExQOitgesN0ogcx5SxgDVGCRC
	 J7swWSDAVUGYziiYUySX66GNou9iZSOr31eMgawMhdbCAsqC9HylDN3VGmWfstNFryD6Y
	 qFZOc92pOOI/jF01jVDnYxO14Yx7iFdmWHTtyoLpr1RlU8rJ2kWYP+xYhf1d1K2icv1x5
	 piw2MNcfkTHfw8mn+ARYdpYW/UO+E4wjSzSkJbxJP2iiKonrxQA2z5BqpVfh6wqCAOAqq
	 731vL5PVm4lCQ9pduXXFD/mUPODGL6w4hPlnJSzNTqL9+XmVA1cvQSgI1D51Huc3i0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HI2qe3LF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.61
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C22606D81B;
	Wed,  4 Nov 2026 11:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C22606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HI2qe3LF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYzn1MYonpdX3X66MKznIt+Mr5C2fquxKv6P4i56OzajZ2dZKozhjR0sFj0+hEgmanJKrrFy8JVeSrxNjeUCXTankgi69pNVmgbmrNnWpCILT7VaE24GqkP1y67WNRxXC4rI2X86Ko/75nUdZnM6a37h6ZLrmVmqRHKUJdSE5zOwDAUVZcIir6ECtPcWFpX8j3p/fYrbInfXXhCK745kMgyTo7phBzdpRk80d5jD/A+bsnn0vAKaqV/Tj5TPX4f9V7h1HZ8Jl6/WiZwZhWVI8VSQpY8JyBXtNo2y3dP7y+lRyY9Tr3YnfYtzvqcupe/K16xXme2f7gpR1tYQkJ8ggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlgOoHH5FSwNsMpSc2G83KCScv/P1ScNdL/EVqHsy0c=;
 b=uIaEMNYNpzGbtjHrujXLZsG8R8N7ulT+OqMqmC4ZaTNBlSkuIESW1iojxcsrM8ZshUUuyBrizpYerBi8969B3LtT+UYLvIOvF8uO6vrXv+sjkHygQeCb13KsCvNDRaPLprxcGCjNIXXSZwUMVEku2ExZtw3C9uqm8BJs+3TPTerC9q4U2vKIYYhwwdEqslymKruziR87oA/kuD3eHqlq1obwhm4nZVZePSsw31Nj7lYm0c44oUCgMuUDrDT+wTaMhzJRrV5HWKbztWj+paCwZVEjkqrxyFpTpXrHIusAW3okvmpprhvp0T4g7VnDnfYhPz6QlQKO87m3Di23u93kwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlgOoHH5FSwNsMpSc2G83KCScv/P1ScNdL/EVqHsy0c=;
 b=HI2qe3LFzXLv/SsSfRXj3G1endEVM1OpG/KaK47bitUZs+MLDnTgFpjrZAFlgaruQb47s2HccpWofGgKW0Ee2pNbUSvxdSE+P0GaD7VXnSHkR5qkZpQr0EeGwgBsbWiHRAFM83X/JftPwpY7r9JILEaKqMZs9eQxEFptGLLUr9fsHzGSK+l6ipPtSibHBIFRKe94tfl5SmpSDPwVh8HlFTdatzhbLQXJBPHcBWhIxKj62bmlj4U2Qc7oK1yuyyzjcAj38DbsIv9drmFxYQb6uG6VkSnVoxmqZEdEMWLoCkJq6+Ij4SyS75J5kImnlBYP71sJ8Cc0N4jOf4G+6rBv4g==
Received: from PH8PR07CA0041.namprd07.prod.outlook.com (2603:10b6:510:2cf::29)
 by CH3PR12MB8402.namprd12.prod.outlook.com (2603:10b6:610:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:10:17 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::72) by PH8PR07CA0041.outlook.office365.com
 (2603:10b6:510:2cf::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:10:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:10:16 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:01 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:00 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:09:59 -0800
From: Sheetal <sheetal@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Frank Li <Frank.Li@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar
	<spujar@nvidia.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 0/3] dmaengine: tegra210-adma: Add Tegra268 support
Date: Wed, 4 Nov 2026 11:09:29 +0000
Message-ID: <20261104110932.1097294-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|CH3PR12MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: c70bf4c3-4d9e-458c-a865-08df3a643505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5Oa0y8ABbzxj7shW5MIdFQPcWHnXL753S6Tr8O6YwrJtcWZe3YLgeDgoPmYSYxIkekmjZa6soxoLzu00KaS2wBMwYmY66RWhC5zEQpgC4CPpMJmmtxmdxv5MikwuY1rEgpa06TFPbWngv38fuyTTtbc/2ddIq7SSPyRs8wTM04HDD338u1No4rLLB0XJb/70w1jomZHaznYluAZmgD83gGRya9LFAJZGuNU513GZ2dgLXPIzEpCNuAjobfQ7X3O1ee4HSvkLixOGSTUsl/oNUGdJp2DVfcDw7mHV8+1Wi7MqsYj6HAajGQh7REEABII57Q3GfRYafT9f/W5ZvJKHRp/FZZMazmPhwQMVWx+A26AiRUA5oSsVFPsn3e5WglxhrTb9xlDlOBXDAugS9Tme7xABBYoIGwqUvxeo8eKQAGOBTsNOFPlFqyH3Nloa8XaqxVW5ouDybAqmF2Lk0Ewn98ccTIjG/p5khElSAlssH/42PM/eVNezKZ/djEXpfjTpvdLUTQxHs/yMpyJJtMAMfVo2YxiCGEAK9vo5syVD+C5VBKSKPCHC5HcwivEGxYjsBgM6+kpTDpQOn1bVfmYXkezX/FDk1+AcjwDwRIpOZrQpCCZyZ0FLbTlxDKI+xfhEfVewiUX2btyuLJ5J3IAj7pWAlND4QI1PuUQYPn+Qh/IJZEO+jEv+tRlCyzaCBYfsfqN9AbbZNwh6PmKHjQPsLg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P56w94WRtsdWtReMxzv9NnFlrnKRdmDSD94OGbDr7bNz224KZhx2ZyPP6Jm3ZOmvXmMXJZaAGEIQ5AviF9YiCoxPI7TyWH7Ks3CoJuXroRDiT64WZk8+H9CKioJPUAdXK9E/S+lUS6S1kd9wuAE9euV9/dF8Qr06ngil69vZYu7KzdsSap6XbBTvBIC5ylt/UcSFfLNp4SuJ7MOM5GKqZO5BUyfNdXhV8HhNL+4ZWEunpm2+Dc2InON52QCJBMqq9CWILe9vNqiR4BQyk1wZ0NZYNEtpPKEjErVL94p98FxXSeJ8jRH4wxdIYkWQ3fqMtYm0fKb9ODSFXcPvGIjxgeE01vYdDFtMxuL51T79pQyRx8fWr2zLiARvnmOU/o3gJhiw/fOn2jFjURTIAQDtZ7Jwo5b5Qkx49wmNSi5TKTMNXurZ4N2uANTw5h64xfpJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:10:16.9751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70bf4c3-4d9e-458c-a865-08df3a643505
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8402

Tegra268 reuses the Tegra264 ADMA register layout but has ten DMA
channels, five request IDs, six pages and a different uniform FIFO size.
Add its binding and SoC data, and derive the shared page configuration
masks from these limits.

Make the Tegra264 FIFO size explicit first so Tegra268 can select its
FIFO size without changing the existing devices' FIFO programming.

Anupama Kunkulagunta (2):
  dt-bindings: dma: nvidia,tegra210-adma: Add Tegra268 support
  dmaengine: tegra210-adma: Add Tegra268 support

Sheetal (1):
  dmaengine: tegra210-adma: Make Tegra264 FIFO size explicit

 .../bindings/dma/nvidia,tegra210-adma.yaml    | 13 ++++
 drivers/dma/tegra210-adma.c                   | 73 +++++++++++++++----
 2 files changed, 73 insertions(+), 13 deletions(-)

-- 
2.43.0

