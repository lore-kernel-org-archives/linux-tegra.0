Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790622;
	b=GnT9ul4FaLI08vJ2xvTy79F73DZxe0oH+JJcisuwPvXIVXaDmZyyMrQrDn2qbE5NRghE
	 MqHZY5OcF/izy2zFw5bKDlSfGRiPjf20eeP7MgWJ1MheriYbey1JTuD92DLOoXIe2rL5O
	 VSxoSz+SeQvRduxTHIBP7xuw7juf8BXu5kc+bSdp6a+vyrkWjUZpMtIT8GKHFbp46eiLr
	 eKAwdHutRU0rpE3+Qgd/rgeRebRrKkqRU5QRdaV5pyM9/SCxjd91zZg0alhgFep3dQOL3
	 UXS2nqwUjraFWUr1DYncRCx5O6lv/4qSdHypAcWMCNG1gignApOGSp2kiRSEfv/EAaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790622;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ApoPiMTnHxhpfBty9mbbMF+IQTF77VsCXY6/kMtu+gk=;
	b=qXrolPfdLNj0s6228MckrpqtIrhZC/KvpaH2wVXNLMlPYymPUoJQk/IQ0Fjf4PKPP8wc
	 71FcHQGLQe6mz259Up+PJRbe+nPYvSQyomxIE1y6eIIZMrw3zR31VkSB72BYQOqhdEnoD
	 UBl7x0TjfsHoGGLNZUlgp4VsXZFohxHCkBbNaeaDiYc8eEgHx4OKMOMZ/KdV8SgqeMVnl
	 ect3XH5jAcinv8rEFRdkUw3geoRbKmwEk1jdt9GuVYSmP0u1xytOS4wnbjEntQSA+5ox0
	 vQb8SjYXXuAabdn9A8h4AbbuYdCahSz0gi/euzrSK6kHJz7fzx7mU9xFJX51Mr9Vw6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L+jiqQ5A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.53
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D30606A335;
	Wed,  4 Nov 2026 11:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D30606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L+jiqQ5A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZILusKknD0fl2X94/zSCnQz19d4nWtrzxvl3hC6Hzt+Sn7YI7zORtI6Kt45yyr4bcZn5tkgaVkauTGbNazgTkHdUQDPQ/csZj6x8YXyI6Z8laue6ciKn36wQ+sIa6RkEyls3K8WZBdlLsWaIgGTmKSuBQac7ZiH/NfJLKq40IYc5Up+r2Nyv8flVNRp70S6Q4FbTbop5/0cezV6bfcHwM4R85ky4hBevscaFPJvaik7cGuwJmcln6cDPJQi3Sw8UfQdDX5n9WE43L8EF13AWkSvIwaEngWc1GvmiqPbAAJ+rcvxbcKFAg7QbIWc7PZc7jDm89NZY8Qz0wluZAnlRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApoPiMTnHxhpfBty9mbbMF+IQTF77VsCXY6/kMtu+gk=;
 b=Yh6giCpKZelUS+UCUj/FgWr/TLQsgibeR1bFk3Iou4MJxBECR8iZgyJGiOMOj1smlpG7HJzKM3PoFdUS9RBC0peDkjmYddfeL3KXsEmzmM5ZiyuGA79DraNo2nbFYvGffkOtFOcVuX2fMhh0DQt88cwBKuvEETGX1/pVRhUv/ZNGMMiDhEAeZWGAfQR2cng5XE+QANUcQxoOjKcB/By97OJnT4jq47X9ycXJq8k1ZhWkWw2SoAi71PzLEQqnAiErIXnbKR4fAfTmMnH4Y1XQpMmup7pj6/Im88/2CZpvIIgbd1uYkJ9/HZ8bqflb27oe4JHNJBAfHFSNBE8lQXLN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApoPiMTnHxhpfBty9mbbMF+IQTF77VsCXY6/kMtu+gk=;
 b=L+jiqQ5AzXDLkYRrVbG8HVCoeteLF7JCgqBLh2d9w7Mr0aw8/5Aq19uKAfN1Z3v6BZMdlGLvFp80KevrQ9JCYJRvkK7WmZxlne5BkHNdr4C1RXcAZBCw4IOHTzYayHddpvE+4kPVfYpxR1ILh39Hs+8RX5HCJoAFoWX7axi7p8KRSCMrqLWBvYjcl+M7VcdBMA72c5crt9K4Hp0d0MuNd/j/+TrcKl1cymFH0u1OOfGSbII8P5GT9tTLbasCszOloTCfQCzQmaxlt3akqCHqJJyvBogUOx/SMFtInxmFNvt5f4hW0ABG58n8IhzVA+dgGtbkL9MgBfYcspseheKFUw==
Received: from PH8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:2cf::16)
 by LV9PR12MB9807.namprd12.prod.outlook.com (2603:10b6:408:2eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:10:18 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::42) by PH8PR07CA0030.outlook.office365.com
 (2603:10b6:510:2cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:10:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:10:17 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:02 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:01 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:10:01 -0800
From: Sheetal <sheetal@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Frank Li <Frank.Li@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar
	<spujar@nvidia.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Anupama Kunkulagunta
	<akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 1/3] dt-bindings: dma: nvidia,tegra210-adma: Add Tegra268 support
Date: Wed, 4 Nov 2026 11:09:30 +0000
Message-ID: <20261104110932.1097294-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104110932.1097294-1-sheetal@nvidia.com>
References: <20261104110932.1097294-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|LV9PR12MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: a45ea379-7167-495f-1ed4-08df3a643598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|10067099003|18002099003|22082099003|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|56012099006|261021121427099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	QW83R6GEB+a7ixa+6MZ/urnjH/Cvy9BS74WmoMKfrqUA42XpNTYI/v/L6n2hlfjigQjPkFDwuVFHiHXvj7HPnFlUGsH4MopaZ534df9QlTPe1Kwqta9JtVPpJAtoQtR4IOGP8uJl6Ux3Kwd5TMA8LwmvHpCjyu2SRFfy6B/oQv8X878WP2kCbwpuqdVqCgirUlvzhSBZNtHywQiv8FTbY69D9zN9bbSGkmuklUT0nTJDNeQmYKkB5D4g+WImCTHc/XHda6qwZDNxSvSjCLERrKOsD45t66Py0CRRF/0Oh9cfLlu0h4Js8GlB0m5KNu3qe3AlW5CNBbWQBShJOhrPqR2VL5Uv0CRvuXIpu3JjxwmvSpVkb6+dz8e/UlULyMkMqi0BGOYlSoVxaUsdwqeyfKvset+1gtvTLP0Ojf3JInhaRqbVJmX9wNEgpeviawvdD0BGmhxYX1tOp3pA9VzhY1V02JgM4k9E2qBaAX4cIvDVq9FLr4Av2LvN0FbJZTtQfgsarzpeWUYooCNsj18xdE3O5YGskHO2WSJO5Kk93Vi+19CvA8ZBKpxr5nTY0HW5FKWh4HcZSiBEDq5G7yI4nxU3pIWfib5SXj3XAyvtuVaDTtIrAZsxnsWoJTkZymR81rHf2aRX6a2zmhsVoUq2x4a4k6K6PYCw0Q0cWcrGg7AFQnuF7cu01VbfFsvQC+IGXNEYLz+A2gPDODNlvW19aQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TAQadv1lYFCmodsyb48rmdS1qfbgs8ukpJCWRXpqUq8+7PRQRbXw0QYQyEqstX1aKZapWj9g7vYUT9x+IW82yfPQfCz6+eV4dw3pYUB9v9esAby7SPhraVGjSL+IqwjJ1S0qg3vJHi7qp4Es3biyDOIgF+Hz9WP2EmHjR9mFqPyi1fbFGjg6JcocMlbe+PtKdpNzAdBg5SJHNIqyTuvVZvTy6iu7Tos2glsQE7+yvOnocY4KYoNSYzLNAPEyw28JF3q4FoYWoyx7FAFqJWquScKnNxPb2VIhOsrFSRb9GCtk4QVVFmdtT48qU5GMIaKKNdAKTzu+m/5ppsLVHZqxW9TGCZge7koIPdsNuO4lhsla1p3ECw1ZaduezEWl4HGVcmO60RibTq2P9Y4Y9MiGJNODi2qEH5XIqlTol1E6NEAEmE/V9t1K9+H4UPgt/R39
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:10:17.9346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45ea379-7167-495f-1ed4-08df3a643598
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9807

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Add the Tegra268 ADMA compatible. Tegra268 has 10 ADMA channels,
so set the interrupt limit accordingly.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../bindings/dma/nvidia,tegra210-adma.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
index 269a1f7ebdbb..6aa9b83b90d9 100644
--- a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
@@ -20,6 +20,7 @@ properties:
           - nvidia,tegra210-adma
           - nvidia,tegra186-adma
           - nvidia,tegra264-adma
+          - nvidia,tegra268-adma
       - items:
           - enum:
               - nvidia,tegra234-adma
@@ -100,6 +101,17 @@ allOf:
         interrupts:
           maxItems: 32
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra268-adma
+    then:
+      properties:
+        interrupts:
+          maxItems: 10
+
   - if:
       properties:
         compatible:
@@ -107,6 +119,7 @@ allOf:
             enum:
               - nvidia,tegra186-adma
               - nvidia,tegra264-adma
+              - nvidia,tegra268-adma
     then:
       anyOf:
         - properties:
-- 
2.43.0

