Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791158;
	b=xhueppRas46IuIt0JGmMj+fCh08zdPHfY23TzfeaLb/6VSAg9NW0hQX+mtxx/6dRZq6F
	 2BDG8Qtg/MN0O9LyVL8ZY+Oy7/vVC2x4dl37QgKqfDdBYGyW9tQsnM6N2oT/NvwwYv8Fn
	 124DwJZC3uOW/ZHcFV7UoYGeGs2rb5bdiOcg96BSVYL6gVyUMIcB37ecYhky4FScm1T0a
	 Xna2e9GKuhe7//HoISYQkVQPDzHjG2o/pZKaEvwKJtsvo3HHI4/l/MQjH1wxvhBM0F4/q
	 pfLeEh2WlVPiuU7oDj53o2YRALAqkDm6x/4i2c7iGn7mS0hCgw+3fkMb1MGGtilc9Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791158;
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
	bh=FENS6lhlEL/6Jf5PRXsbckn8SJUU+o/Hgas7uJflG0w=;
	b=mVDPVMAGPeo1V1oOVNMjIRVh8RsNA924QwQo+tjXwwgcDJZQ8Uk/ezNGSzTxYnQdGzEb
	 M7ioVzj67w/iDnAlu6W6/loZo50VSH16cXFUFc4w4Y6gsSl4O0bw0m+bt3M/DXUmDxIl9
	 nWreaBq6XqSMzwdj2fkwTy+VkeTdGNAuKUa5XxsvsxfHBouQ6Q1j5Lsdn0eSTZGSA2pUm
	 A69WNpSlak8VpWTQk7Q69lgTz8jJySe7PxgmxXojPghzGDOu17Cil1HQW/oQrU2QwLP0Z
	 WVcJQdFFdwQlF7iR51Fmt5dm6SBoQcqybgs2jilnmUR/yYbZcnCbx43aRWbzPHHuU/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lQymR7qb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.47
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4FD606A326;
	Wed,  4 Nov 2026 11:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B4FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lQymR7qb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXUmAoxutp08JIV96WkAvGbDeLzOc9wvoXgp999wVamtUxeybOCP39MMZv8936Mh6y5sL10+Z5KtE/lnxBwiqefCAPkrx/xA2NKWUE5OolZs9pg0NPWWJFNd0iYooltojieRyyDxrKlQBrmZ6w0iaGzge2sw+kInq4DtxlEtgSyexs6gCigEuxswTe01v2L7P6/6wMDHeRMhWHhbDVLvGcbcb1u+FY8vGLeE6E7CorobTfqutZTIKQHHMJwMsPjA7G3b0tlP+yTIUxaSxvO/7nbQ4CLCUmywdiRbPxwTuAt/+jK4nSxh/Ln2vbo8WrP+dxFHgk+fcygjBfDXdg6a5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FENS6lhlEL/6Jf5PRXsbckn8SJUU+o/Hgas7uJflG0w=;
 b=TzbrZcxOi+MF3Amt+gKquYAnlHrwPJ18yciY9q5blCQtAOksi+04Q2hTZqE3YkHer6ep4/Gb20FwwiZ1Z3VBBzRLG7WuG7jA+J2i9lwmY2kNcNzPmgUsuGQjGF0Gw1Lb5c4w1BFqFypz2m4s+tIhkrvNCShPTxBbssCxXfvVDkQuFgy5JXlrRqJlcjUudmL4WHN23cAt/wi+4LJd3FVyx6Je6RkELQbsAXTjjO1ukY1dPYAn2ofIFeTAICWUelVg0SDzxkOOzSohtqkCnLQVTB5YL33FO9yu+wyQn1RjpYyvtoKyQl7WwKdBHbHuXLpVAom6KvobwkmnyYvE9Dhcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FENS6lhlEL/6Jf5PRXsbckn8SJUU+o/Hgas7uJflG0w=;
 b=lQymR7qbcu5+UIwt6tkfQDKXuZ3+nmkAInrFy3fcbTAr2H5BNZGsvO1f4Sw6j6SQS93pPiArbTDxT/zXHa2R2Z+iBQSIf3yeQ6NSQD/TeWQBvoakeupV11R5u3j2LXzMrBFXdqq6N3/606TnxCm8Wexg9BZDmirYkxJVVQEeKo2RoJqBoiUn0pJVKbRsAKW+XVIT4GM5IYTfgPHHpnHCTLdj8S3qnIfXVLPokzaHlUiwHFz1dvlgbki9vxXB0n07W/nFLUn0UM5ypWYsP/kwV8/rpUYlB82PGHsE4y+8NPqQsepY6XJKnY8x+5HYSNuALi2NM2DMAvNFqFev3ZdlZw==
Received: from CH0PR03CA0198.namprd03.prod.outlook.com (2603:10b6:610:e4::23)
 by CHBPR12MB419055.namprd12.prod.outlook.com (2603:10b6:610:40c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:19:11 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:610:e4:cafe::71) by CH0PR03CA0198.outlook.office365.com
 (2603:10b6:610:e4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:19:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:19:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:18:59 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:18:58 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:18:57 -0800
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Anupama
 Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: sound: Add Tegra268 ADMAIF support
Date: Wed, 4 Nov 2026 11:18:35 +0000
Message-ID: <20261104111836.1100527-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104111836.1100527-1-sheetal@nvidia.com>
References: <20261104111836.1100527-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|CHBPR12MB419055:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ba9fe7-165f-420f-ac9e-08df3a65736d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pcsycbtyNLJc2YSGwREFAQe/pAL0Jdryud4khzZA/QEm46P8golqUIWcwSMoq2ncIBv/Ijb0PXbsqqwpnzpIpexgl89gLFwgtuRXAFI+RiXHXdE5NrdUfPJZyRDlcx6mJeD7RFSsROfL3TayavOoQ6ZNhOtD7bNBNJP5rIqXG2PcxyDTUApERlLFu/8k7/udhqXCVmoXyBn/r3muIOfsojp+yqe3N5/Qcjrn4+gG6vaZUK8i2a/A2Xm6xer5sa/o3VCq+m1C/gc7IzMPXDjI2sZhbqLjPJ7rTk3DhNIxj34n3FSJ/27yNFcpLpBzuAusB4APv4Uh4G7UAdjFGPnhDE4DSK/U3XI8umdJUY8Vmk7ddRjcnQjsGpiyhI/mgKsso8jQyHS5hD6V2vU2wPxA/jJsg0tPtiEqspg/bPFW2tzp8TouLeKkWEQ9GbiB9xHykQRCNRxnrM/GpNmnWnXn7xE7sFKwsb/EAGo5mSdTBNtB4uMF8Ic7vaXiLEak6wCUm88UI/5ApNLXjIXvZFpCGnMImhgFzDiiQcKPzKlbyK+ddK5jchoXWLtn9lfvE6xjPihTCfHe5Y/cQgXbcYljBF8mx2ARm0e0bXHSgSU9FLZb9u3YvSPHdiRKiA3ClYK8R7syNiNUizUmscV+afKlHwenncUA9Hi+pckIrbiwr2vJlDJiBCdj3R7BBfjU83P++KwvrkIf72Azd1RoWR+71w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3giTYp6nyWf94lzePMdYVNmtBL6sgQOZrGw3Fb3UVBaqTpF3XYtwG7YKhKIdoB/fLBJ+TY3tHIVB36UP0exvc/wzWl05UhO7rSC6oyZH/QRXUkEdKr0T27WWDpoiOYeE37+V/NZLwcCgdPP/9kctraUyrdOa2CrLfnn1LkzPJS2sU6l+XHYugpa8e0P2YzeNFJylI1m9Ii3XYq05Y9EXBFunWB+ErdYOZCCsnJzMr5VbXK5DKLj9TRkcA6r2TowQywYiA+MrLqiApzScuShxMb9llvmJDTNkbVhd1E9E6lSowEf2Ti0oFPv0YbEge+4k1/ftcPw1e4aU8bsjsTBZNscZt1fE1hBgEqwTq7k9QYuolLNYUf91NI/TOIvrT0fmC4BJrtRtvAzjZPUwFuRMEQ/NJjLd4ARWPp3xoSGSYFnCCLfn0I+fdrwq51QNtS47
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:19:11.0833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ba9fe7-165f-420f-ac9e-08df3a65736d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB419055

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Add the Tegra268 ADMAIF compatible. Tegra268 ADMAIF supports five
RX and five TX channels.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../sound/nvidia,tegra210-admaif.yaml         | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index 2ce4049f94ac..054bacf60234 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -27,6 +27,7 @@ properties:
           - nvidia,tegra210-admaif
           - nvidia,tegra186-admaif
           - nvidia,tegra264-admaif
+          - nvidia,tegra268-admaif
       - items:
           - enum:
               - nvidia,tegra234-admaif
@@ -134,6 +135,27 @@ allOf:
           minItems: 1
           maxItems: 64
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra268-admaif
+    then:
+      properties:
+        dmas:
+          description:
+            DMA channel specifiers, equally divided for Tx and Rx.
+          minItems: 1
+          maxItems: 10
+        dma-names:
+          items:
+            pattern: "^[rt]x[1-5]$"
+          description:
+            Should be "rx1", "rx2" ... "rx5" for DMA Rx channel
+            Should be "tx1", "tx2" ... "tx5" for DMA Tx channel
+          minItems: 1
+          maxItems: 10
+
 required:
   - compatible
   - reg
-- 
2.43.0

