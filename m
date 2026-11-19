Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795091193;
	b=OWBe41RXHWBi0eGbMIUffOtDZgEm26l4TtEjo9A61EnhPy+HmcN4VJCiBsDX/8wWZqNc
	 uP3z8+kIOo0meZ8v8aWHOXHHfEhuWWQAx26tuv9PDemWN1E9I60u3f+BX9qTALsJKeoSM
	 r28Himu1Yj+hp5/W+qPrmtVjEUBr+d2W4fjmL6ZE5GW2DYLHABHmflqk48ITzuzyvYTLb
	 97ELXGU8RoUy4pOSgWz6SdftVDQGDV2aHcl249VqnGRqJbTfredv3K8TngZ2CBhAc1k/a
	 LeXGlR7rpT7oqTdn04PfmJ14qaGGGZY/1ir08DpQSe745cXRiNqAtI9m5SLl6AobUgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091193;
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
	bh=9JUnuoax9IfbJa5o/mfiR9e13EUzf94dYgr3WKLCnnY=;
	b=aoTRQH2ZhtoMDbEJQNXe5HeXIl867xGOse7YAq9a7s/HVvgcPlbw17eKHyRCY+sUHnlo
	 nMt27Po5m4a4qrEN9PVKIw5EPEA9twu40pigjMAfWUzMWyJWSj4MhkzZ4vNwA6j/YahHD
	 uOihnCWxJ5MDwmkiL9FrHnSMym8RduF9Nfq5gPC1GGNdjVrbKj7C3wNIhs1H8l0YEfY8J
	 ZVDiK9yiuYACYr//OmMg+CNtf7JKUfY/9OIUgPX2wHVfifwgs8SN3EsW9aWLj70vk4byb
	 PUUvLaU/C/hifGuVGbu4iJk+5rNG1afcmNukG9YbKQpH1yjSInoMLfzC7nPGtyg0wtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TyFG1wNg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.39
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F4606A337;
	Thu, 19 Nov 2026 12:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1F4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TyFG1wNg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq/LsF//YnURNpDtS0w7ZRpD2+bsN+W3s0sh6YRyBNmSHiQSJ184LLwWkJaPM9bbFzKwwUaUQeehIf4phdp1yWVPeSyxO8LRczesZGGxt2+OGraGaZeK+vFXKJYYqknDyPwxhN9Wzld7d3enwC3hzi3gevMVrTcHggTz9ddcCMj+MdCvWNNcFlKZXfrfvS6E6M5SYr2iF/ab2PowWBnL5RDVUeazk59K5yadfgXtyfRjs/ozpGiK8uiy3SD27c+I9w11IxEKJA0TuK2zObMHLcBTBROk4aT+uU3O7el2YDAB0+V3rifLL7j0tQclkdd8+bLwBU0xfMgNhGqMZ3zrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JUnuoax9IfbJa5o/mfiR9e13EUzf94dYgr3WKLCnnY=;
 b=docx6a7c+ciPi7ONUjmp1nMgih+PbKxAkFNUp+tbTBouYmbuOy5xFYL0lOgxwy1nulAbIZgQstVynXDEDY/636z9/kUmbmoC7HNoYSzMjZ7vZXWINLsURpUI/ad5bfhkRFlwwhG/QhG3ILvKFKXssOuv+5+I1cGUA1n68SEY8GnlmeMZZn6czW+h+SBX7vO3BCCKv2cnym4gb7Gh7dPCLDI2Lc8In8NQHfcHOUraXTTKLvi06okbcz+C6a03eiMu31ltMKbA3qTaUg3qo4WC8K6268RFfxY+GmG+fL/PxqlOozrXYA3eX7OiukUCpviKMwANvymbflVEPPYzlRcmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JUnuoax9IfbJa5o/mfiR9e13EUzf94dYgr3WKLCnnY=;
 b=TyFG1wNg6y+k27hfPoJKnylmyrUtHRwS9kWVqAtseJ3Ztoywh+lFkQJcJ7Vwt9dmGxYdpdOIT9ChJ8NP6/Wz0qHmlzJIOaJM3JIu3j4vpa25QB46rPLBKKL0G/jiPokTQLEMEET5J2v289fpMVvlLS7gJuqzJ2VRpeqrwYTPL1e3JdwvXC5v0lF6ErKRYX+UASZW/poMv6iMza4FhLSxxDab99VXtxyqbng4q0cpzubRZk3smSbo8jWG3+aE8+iTMQ3a/cliP75q3fIekn29ywuDrCR3QngKfHzkB2vo6A4P+OXdw1NnsxhpwyHF3qYVZ0skCG83mTf7zP/KGTUORg==
Received: from BN9PR03CA0270.namprd03.prod.outlook.com (2603:10b6:408:ff::35)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 12:26:27 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::29) by BN9PR03CA0270.outlook.office365.com
 (2603:10b6:408:ff::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 12:26:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 12:26:27 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 04:26:11 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 19 Nov 2026 04:26:11 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Thu, 19 Nov 2026 04:26:10 -0800
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	"Mohan Kumar" <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	"Anupama Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal
	<sheetal@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] ASoC: tegra: Add Tegra268 ADMAIF support
Date: Thu, 19 Nov 2026 12:25:09 +0000
Message-ID: <20261119122511.1324643-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd24eb8-1df5-4bce-c832-08df46385555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|23010399003|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|10067099003|261028144727099003|261026140227099003|261022105027099003|261102123227099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	iXJxnYbHEMHXU605I6srsW8a9yamRDK0DytDhOlpakIKCPy3QiBKxwwwWO6PGVJpbNG7JcdvdQhD2TItyI7zL1yTV4PZ0rcnANMNFj2EJTH3xEJoJTZNIPdOv+rNpcwrZo3XDX61UGyXYxg9F5wD1X5mm1oWPwp4CLRr9g9sawpXnx/j/aecCwzrd+EwJTbER26nt/6QcZcHIb1BIsKLPPFs4t283z9jF83wlUjqqjyhYnEHLO8ZnvNcctmZRl+1g3HiXLsBHBuBy3n5xisPlP3UpHS2gXlwyekdViglGkCcRbS1i+YewdhORhhDyAClrQQo1jYt9KCCjx0b/T6cc6Y3myaxB4U2+HUf3rn7Lg67IxkbV72kzFCQVWzysSFvEdy1aqezD9fUkgMecf/mgWnn++CIZCvFClsnwuTqT3rvia5F4UrOCY+57d47Axfee3X+TnFKtaDKozC3wlvBBvqHRUaJpTBTPwrQ4xJ2/MUfSwH4CtBr4lm5tlddmZh0B+Ke+ZqwVGZ1c8y+P0/O51gTfCTglDE02BhS3mhIZXgYVsFiUEA+UKd6/tn/D11FjyLgCESReT2zVvm8VDoQDiKC/tRp2ousQn/z4u2mGOdadK21n0xFNpfAbI9Np3YRsbgFUKx7c3+x+nJJ7zgqvuAcbZcJBy+fECDN/gs5uU0MlRUkPLyBeDVS0sUAm9UWQUq/srBRg03/p6fikHxjJA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(23010399003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003)(261102123227099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4s5ZDeAHa8wNTsXXwIu4rcsY88hDbmwYx60frP4Zr9OjP9iPkw9BCmiT3nTqpgJe2m53D0EmL/mHNaSBh7AhwuJHF8cOrrYIBi9+GQge41eA7mypnjJIGQdrrFfBaIY9DDcjvDnaTfCXKNPExpG6SxVCKb9K5SuAhk55z6r+X6tH+2vpwcTxeAzb2EAcIVh7/DdT2sWGqBNtF84R1s3wUpCVx/Pig+eDyeQkviUoFk6oqw9/y9C2BGemKARo6JYRGpVXbASueAhpTB3WHJ5/Dv5ymPnsB/ELIf1VZ8CioVanvskTxlhHlP/ht8Q0jdia/Ts+DTol9JezMrrPpKW7oPoK0k8HmdJyktdq6qXPlNIVbz4fwdKKf4iUG7JVH8d/SpgkZx8bDHLmiv8bLG+7yfuV/uPGJBk7pndoPIrIma38SF7pXTHNaVI9Nc3z+ij7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:26:27.1787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd24eb8-1df5-4bce-c832-08df46385555
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576

Tegra268 reuses the Tegra264 ADMAIF register layout but provides only
five RX and five TX interfaces. Add its binding, SoC data, DAI and
control tables, and FIFO defaults to match this configuration.

Changes in v2:
- Reuse the Tegra264 register limit (0x205f), as Tegra268 has the same
  register layout, and remove the separate Tegra268 limit.
- Use the ASoC DT-binding subject prefix; no schema changes.

v1: https://lore.kernel.org/r/20261104111836.1100527-1-sheetal@nvidia.com

Anupama Kunkulagunta (2):
  ASoC: dt-bindings: tegra: Add Tegra268 ADMAIF support
  ASoC: tegra: ADMAIF: Add Tegra268 support

 .../sound/nvidia,tegra210-admaif.yaml         | 22 +++++++
 sound/soc/tegra/tegra210_admaif.c             | 66 +++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h             | 18 +++++
 3 files changed, 106 insertions(+)

-- 
2.43.0

