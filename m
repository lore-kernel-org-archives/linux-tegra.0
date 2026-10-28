Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177376;
	b=IYUVn9eSRP9TymZW+frxb02w6KL1sbkWfxjV1EtelqZBH6fQ+SeNcqkjNebno7w8KJOm
	 OzgV50G5ZHz1cmveqkqg+OB9RxvYgzcQ0Aq2+wgjNgj+/9dMRWJv7CEEVdIVnDXjGD61k
	 o3GLlMw3ys7hyttlGH6lRHFaRkG0j7w2Xni80P9jqX3tMFPYGvyjmzxnzGNzykslARSdB
	 ohb1g1Q8ohdTQzB/4vuhMhxRh3wR9O4CjUkaZ5mVZBwln4dToJg/U3uhPQJEz+Mx94+M/
	 EGqKjlwR6YdJMaw/hl7ls+N7lT1qT+RvspTHVJ/8ahbHqVLxUtR+vyrduMWc5/AWXHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177376;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=vb5td0x0eiImZwvfHK6cIpoiIx98GJL3wfrF9e+qjUc=;
	b=Yr6PLr+OeJS6OpUt7z9HKf6FVOVo6kxdtXoH7dvBUvl3KoqXME/2Bt20Na52S8CU7ti6
	 Xny3rg8Z23ljAznBcSqlH+58CiuqHeYvL3/6cwqOleP7x3gKp9uB13mwcXGTW0W7qboIT
	 vHp88GMupRBfnfduG3nROGNs9YhvaK5uxeFlr3hVdP47KIpPj4e79fdkprBOuNJt0aNPc
	 S/Bs7+zIKQc+zm9/GDz8lBby6i77sqFKVlKnl3bSyx8JIngy5J3wu4xOo9NWJnATBlwCL
	 j+GvhT++2SM+4DfXLqIThZCUntzxvhxnFNsqD53mZvq7iZUv2kZmEM733uSMhHN9tJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NJ9F+ReR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.41
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0D606A31E;
	Wed, 28 Oct 2026 08:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B0D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NJ9F+ReR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv84NRjQJf9mOu/Xbr2+l+WCbQ+WRN9uQk6E8dTvGOa2ij4rGiJLY1cBkPBdfkitdRxT2Q+fMEVepflwNAZZyA/jPBkMU+m+4n1+J9EqB+UfrMklQbnDCdX+gpXVMO6vlHI+ZftksUlT0sAoXeRPAc2p72k817GExpxN040z6dnQs17d1K+LvgvefmeZFODE/gvBpmWa2JlqUFI9k6cN7GncKkdy6mp+sZ4bmdPS7n2Zudz3toFQIn1LQn/Lmk5nXjmSo5gIYsELk7XPUxmotLQYRy4FVWgtIFCAV13org0GrLJPDEcyKoyFpNkQfUdfJUFnyNdoiU2h4BpL23mq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb5td0x0eiImZwvfHK6cIpoiIx98GJL3wfrF9e+qjUc=;
 b=y9+w+IRWLquGPRf+oW3oLE27ErrftMED2zgvUx3ICitfi16qQKpSgysS+OihocWSxcuLduz+a5jFjRCFBo9HD47FSk6JbEtgNy+YVt/5r/Tv8afPsJ3dhuuki65oHcDBFP2FlCRcYqh2EMzx5XJsssHMJzKmWjXi+ytsF92B5dBsOjMGPOM7A9Kqv7DTH8MPsI6ZGlC0J4zxPfczjzNlPfq/vkm+yGmY0tDnNc98pSP/rQ2FP+DwZ797HIchD54UtRvmaMjCBLbluM/8kk1JYeFsRDZKOCEjM52zGn+ywB3mnNQBBxM2fFdz1q1+O1fZkuTV5rfNRk/A+oNVmNn7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vb5td0x0eiImZwvfHK6cIpoiIx98GJL3wfrF9e+qjUc=;
 b=NJ9F+ReRbm6l1QRpN524OJt8nFWr27r5GAyqNcZeRxwkcSJqmkQn2lxJLAGwfiUQA62XnrNH5JiqfEQjnhpE/pHtZtrrO6/HbZHFwYe11Rl+hX8I1FOU4RCh16UTGeAq9kntQJqb//3ay2+acaff6VVOdnN18uXaAoLIYF4FW14IwQQWCEmm7fb+hWlmO5Qt9S7QdBc+5j5LJ55b1ANLNNv490v6e9EjXhdd6j8afP5iNse3KtlZL561ZKoGxN+HKDqmz0zchwlD3n11lAS6jGYr86YRyWVT9rSGQ1xFzdqe8MOLFEHWqzc5fLOWgQY6Vw4dGAB4w9Q7NanyFOx/7w==
Received: from PH1PEPF00013315.namprd07.prod.outlook.com (2603:10b6:518:1::8)
 by DS4PR12MB733313.namprd12.prod.outlook.com (2603:10b6:8:50e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:49:32 +0000
Received: from PH4PEPF0000B60E.namprd21.prod.outlook.com
 (2a01:111:f403:c95d::8) by PH1PEPF00013315.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 08:49:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH4PEPF0000B60E.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Wed, 28 Oct 2026 08:49:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 01:49:17 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 01:49:16 -0700
From: Johnny Liu <johnliu@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH 2/5] dt-bindings: firmware: tegra186-bpmp: Add Tegra238 compatible
Date: Wed, 28 Oct 2026 08:48:57 +0000
Message-ID: <20261028084900.1047287-3-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028084900.1047287-1-johnliu@nvidia.com>
References: <20261028084900.1047287-1-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60E:EE_|DS4PR12MB733313:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ef76b6-3400-4d37-7b2e-08df34d06246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|7416014|82310400026|261021121427099003|261009223027099003|10067099003|56012099006|22082099003|18002099003|261026121527099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	w6l35cCsEtrlAiQN5TOkza3m70pJeYRCnwPLnFE2Hs9dNI2ZODxHIbUaLd7a4OcAa4EoP9M446Ofg8JR7SzON+Fr6XV1Q+Z1Iz+cxB7R3kuzKFU6m+Zq1zSf+dS8+nGas+ock9KSJIU8b87jlJzn8PzYDXjFNvrHRkA0jnkVUF2wz71Bbs1LMzWdipzMcUOIXJzslgPezU2Z/d1KyCKGHiy8/Fdayn4lelkEPKIm4owtDDPZWVat/+3iiMtiUtfn69bCWbfNl8cVVUiRnGTubk4DGa/JbUt+uUIkMr+a5StaDbqzx+n/96go94dg/y5DAv/SvKnTrv+OAIVDOTIVLpjjvdfSBwa9xnQ1Mt7JcEYrWO/FB0l/GS/+qJpivAwV8KoC61Q7mFtTUlsPJy6C/IExdFdywMbeijraKJYoKr6P7DSMP3U868tdcDMFdjl1AMevxf9cAOmZKtWg07G6gytGTrh7iBlBajWaje0+QiiK5xo56TmeY6fpHBi9UmEXhIEfRKnWKxzxQHsktvXbVMxqpnJ6A4GCcA0YPN0fpd1OEroDnTJZMPdEiddw1H+zTjR3RhI/XJUl85s7yX73c4EjW5Ni9sP0dexTjlINnXspv6Vp79ZsCHOZ01rXF0elkOq3UFp/nkZYttKu7ZuxwM1Y3PqUXn4BxUnFz3IAl4mnxPo5dCvgiLFhVhf5+XqhOX1CXkUB/0DgHN9GZBgAAZQ+6ztE+g8DO4Z/ScFPAY6wnn6yXVEmYTMBx7uxetTG
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(7416014)(82310400026)(261021121427099003)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(261026121527099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MlYSO4EWeK+jyE40/F4gBpVgVKau8yKK7QrodTcf8qVATtbvJqoz/L5FpLfXRMubJ3dalHEMGezaDjAx5kEi8NblKgnScAywbR2CYy7U6EUux9p8Rus18QE9bD/8YfNafNFvdrNmafj2LvKpS+QQoaL63jWg3rlRGQ+pMKoeTipgQYW9R4n/bWx2ouKDRPyjG7yBCDQK/fq4avI/Rom9twLa8CD6YCJjP/oFXtqL3W8FYT7m40AHZdnmv12wcLFTjKjNkFhIa1CtRBGPnzpd1SvaGDgtuzoHgHd9XK0GdbDI9W7PdJjuRhHm3un/IDDheaPvvkKycCk3oUdA5cllgwekHElCeX978DrFqz03TueMhbizXKGI1gGjEKVW/84/U3N5N1HBqj3v6uRwBbFJpfZlPnaL0WvttDAjxOmDib4cddS10/FQNImPArUc1Trt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:49:31.5664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ef76b6-3400-4d37-7b2e-08df34d06246
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB733313

Add "nvidia,tegra238-bpmp" so that the Tegra238 BPMP can be told apart
from other chips that use the "nvidia,tegra186-bpmp" fallback compatible.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index 3c44fe607e12..4011fdf4a54d 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - nvidia,tegra194-bpmp
               - nvidia,tegra234-bpmp
+              - nvidia,tegra238-bpmp
               - nvidia,tegra264-bpmp
           - const: nvidia,tegra186-bpmp
       - const: nvidia,tegra186-bpmp
-- 
2.43.0

