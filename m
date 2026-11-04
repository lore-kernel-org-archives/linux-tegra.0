Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791154;
	b=XoL94Kn7THkfLJWWj9c9dKSO8srpHXcq9q8Qju+Q3N8jATV7o/8rJfC0Y/Y8mCNZEX7A
	 sr9muL5PTAjSI3I0Rt2yikFTMJ5Z2ek7M4Ny/+NFJEqo8qlYwRawijzG2yXnNoHoexKlz
	 QRKESsuCAGNC2hj3fC66SvdEUprx9uIDDPHfJRptfHo/mq+yxdlOl4WJAzeMXKwWnIsTi
	 5pkYfBk6sKL9YMp+Pmf+tPSiumgCU4MExPGnau1RkEkR9RSsoLhOIVK+2UZ+HfjH1PN17
	 7YmKz7HtQlAad74F49nNE/ekXRHJWOhJRfrGyVa3mnr4JhaYo1sBsbHBgEfJ1e9xNQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791154;
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
	bh=iRPfFoXZ4ZDUOJCKMnk6DPwDZmbT5D/X7E/C90hgvzw=;
	b=0XrrlPapuv0Gxyt58v3koGdSqFS85kOjLX0KT5O6tvUlAVE2cBclxhQlISlBGpmTLrt+
	 wn8V8VEmMhmcRtbPdVztk0nzusMl4lWi4Q2wKz61/5QtV/Kvku0ws3oDA0K6AwdpJ3+A6
	 0eld6M9CVGlPd+V1SmF1hIZA8B6gd4C9mUsy5RBKw73Te77S05//WCdAHT82q/lI/3Bqr
	 QPr6q62ebSv70sXK/2M9RVDMZADCdhhxJtlMBRgYwZMtNmexGVpzdrHfnG/ygqtrjujje
	 hzyJeAfj4xZ6O7umCyIEZBHMD9nEemi+CaGAPdfMhjO4QQzOi2GYb6rZsFcKSzj8WiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TejNaPEm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.59
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4BC606A31B;
	Wed,  4 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4BC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TejNaPEm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xn6EuoGQl2Pnny9Ij9bCK9x03TPrHD/yJDmd2CyO9cPGMr9UArEZ1OzgPA/oeo05/k5gJ5m5lmUD9JnoyUr6YgJDSML3pCPxfYVh7/yCX+KOWFPw1gJJP/Ut35F5ZGPyKnXNhPGvkaoHhL0F0idxeTs9wZIASSD2NjS9XZGJt4VYK/dODq/RYVCirFS0UjkhP7KTEwk1PFXO3Fc00n/ZslN1N0sBsCPKyyie0OGKSa80KGtWpNcHBLbThi3wzBDUW8eESAMfftrScA858Ao9hwzszG/mQ0UjTsg8kX8ADTIgn6glDWc1E0wjdFaITqeNR0xpRYdNCpPOSX1qsdS51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRPfFoXZ4ZDUOJCKMnk6DPwDZmbT5D/X7E/C90hgvzw=;
 b=j254fETjeCLDEIFYsTeuxEdN42q3nPpQzVZ5j57q1SrEatUPHzLYJaKRRUJ87TqXmjj+womHGC2+mFtMJRilyzKQoW4eqyLZLILqhNfbQtbE5BvnFM7URvg9y3i3ronIEtymfoK1TVqUAWAS3NAIDtrTG+3e6CM3+26NNVMJS5zZ1Rk3lggiKpse1C7Sf8dpE+Q9ubGYIudkjgF9tbBijfc5YCIQA5I2fHfvLcQ3/B4LuOr8dfb2QnXQW9soh7K2O3DG5GyEtLOFBLEZPVNgYXZlGQIV3Fk4O4m8hP+S1nRTTU1Yu4XR8ILxtho5Pyl+W27Ct3MgkdOiR5YP+P4hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRPfFoXZ4ZDUOJCKMnk6DPwDZmbT5D/X7E/C90hgvzw=;
 b=TejNaPEmiZPYKB/znIJaWhcUMtCdE8IrQuVpBSIDYiWqH4xYbZGatUmQxAbgT/lgToeJgM2XOyzNn63j0dNJfrJwkMIpmtYGg17mkT8BhUFlBjnOdDMGM3qqm2Z5qkC5N3fXU6Pr8zk94feehASYroj2i4ko+zRk9JWzS3PkG7Iv9LHLKM5oPggV16+Jqd6mlwtq5e/EiyS3vqTGRG7qhRphO0yQ/ZvJQwhkucwHAQCC69EYPh9eq7cyisHQ+nE7v+fxu0u/Fv41pcl8fSmPzpf39hteA1Kzx5KC0GjqF36IUYytuQQru3JKYwv/PslSa1lb/G2shb4xzmNlTSvRgQ==
Received: from BN1PR12CA0005.namprd12.prod.outlook.com (2603:10b6:408:e1::10)
 by DS0PR12MB999289.namprd12.prod.outlook.com (2603:10b6:8:424::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:19:09 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com (2603:10b6:408:e1::4)
 by BN1PR12CA0005.outlook.office365.com (2603:10b6:408:e1::10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9
 via Frontend Transport; Wed, 4 Nov 2026 11:19:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:19:08 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:18:57 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:18:57 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:18:56 -0800
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH 0/2] ASoC: tegra: Add Tegra268 ADMAIF support
Date: Wed, 4 Nov 2026 11:18:34 +0000
Message-ID: <20261104111836.1100527-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|DS0PR12MB999289:EE_
X-MS-Office365-Filtering-Correlation-Id: 328428c2-f858-4587-46de-08df3a657207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261022075727099003|261022105027099003|261028144727099003|261026140227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	KDclTFMcXMsowoQzIQjW8u4BPRnz7NgR3piuzwywZqf5bcgdzPmOot4cWlOYyezY5bHxLqlWXkVzQ/WnHEJICKs2OOWCgsz22MhhVkZpD5bNm7/YeEIgSNBEdHyLrteXaPdQmUSrTj0DGJs49KSf+FTO2zkULOhORMJyT2bYKRrH7V7P1QQKRPOHTnr4sHhf0+s71C1J/h0+v1DDx5ygD843MkJlgaDQUpxCzEyVKm2uF8A8OUrlsXF4+2bQZWeoPZ5B0TycoJiB6duVM4xUcF6o0M/8w0eWLT++1m3xmDKJaMTFBPE3R/2UHf/YuBDAAPImeHNC2RfkIetiwEQO6hcK5DtmeTxhvzkX4oUZiFwFXsDOHzKTjZ53zkjhPpDcDFzs6yugHC/tq7fbnUJAQaG9+GI3HC+DFaKWNlvgHRqZ7dKcdODEMlhTvYKVtuZxI7dIzVOEjlLLluqTfv2uhgB+yXF+exsh2wzaD0JqdJmup6T+S2My9Pe76ILv0qB5cyOtFScLmQZusgBDLtqoPUqoFb68asNbLwqRpnEiZgdv80FRdhvtjy3++ImT83SSs2ObH8QcafoLunFZ7iyruPGtEm4Ypy7eBkAyYfG9Fzdnglz+1RCTPPl0jiSlbtA4bf5vMnELlYW5svxhsT2pcogMddPS+P/XSHjlSeCEjJwI+ms0xXCPrZ9NArCk6m+aCv6kO+8r2x/YszxqrhuWWQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FvpTT+9NROkB7c/DT1T38djzsr2d/dXKknbIUnKpklOfGvBlU5Hc6KG7EBdO3NcW9cKnHy8mzEoc5QgYJjGA2YfEWMAQoJTrIbXTIxN/O3k2WdVq4z7HRltebSySRm+atzn98St53+GVU1PEbJiRGl0va1O2bR+kpNM48MVa4PrYJ3OD4uB470kHKgueRN06JcJgCJ5pFqKlIpnTWddcLaBQITiFlf43lcCbCPXu4vOMTGCXQjQiFy134Frz37k18IE7LNlRfwiSQOlaieA7+ggJDvzWrkiHRJy1nCjJk4wtSLsCtkAC1Uz/1ro6ydn/RDV3ujbv/0hJx852VXDAYs4W1cPON7WUYnlmaB28OTCGQdIY3VpizSBc35a6P4GiR4iN3EgaHzrbm168raXXHOr1ykEuXmOPZrXWwzZdr1+JL46DZulc2J1kqo44vOb9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:19:08.7210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 328428c2-f858-4587-46de-08df3a657207
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999289

Tegra268 reuses the Tegra264 ADMAIF register layout but provides only
five RX and five TX interfaces. Add its binding, SoC data, DAI and
control tables, and FIFO defaults to match this configuration.

Anupama Kunkulagunta (2):
  dt-bindings: sound: Add Tegra268 ADMAIF support
  ASoC: tegra: ADMAIF: Add Tegra268 support

 .../sound/nvidia,tegra210-admaif.yaml         | 22 +++++++
 sound/soc/tegra/tegra210_admaif.c             | 66 +++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h             | 20 ++++++
 3 files changed, 108 insertions(+)

-- 
2.43.0

