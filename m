Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791411;
	b=wXtaupCENA4ywOqj+BGvvPMFDMtm7RL1GUTD2p/FfZsrueaIFiouR8sMf1DV4LeLBHrg
	 nrVmoefsS2sndoOXitYbK78mdaOkWx9rKVnFTd0cL31QqjIxKM7nl2pzv8VubLnJULCqJ
	 co3AS322u/wMh4rLbYtfXvkcznxAGphPjTAPJm6qs7MDrz4e3TKEFfrbX+XJ61ZQb0wMG
	 lKRz6IISGQT6/6h9aR2ocImsIVmSo4VVDBEWH18q5rq0jl3cqfWBV4Yt3HxT0RRD7prkh
	 BkxmEVa3A1fR8+BBaSuTE+fyD+f5ptuoWRCKXeAWdl2irtnQYgu1s9CX9LaeVIeLq6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791411;
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
	bh=HEiyV8JG4aD5ndudcSx83B8UUlvHd5vNl09T7al11zc=;
	b=mHo4h75nUH2LmfmsNZO6aEUwUIy/oyKv3JeIRKT5h0da74SlnL8AAEM/+AGlK0h924vj
	 qyM1NLU99gVHI4T1x3dhnirQrJApUE9ojj1gwE4vEmwUpAKO+6To5YeVAsOPO+pE4PSvs
	 swRJiBw8vVBTjwzVqkUYUm6WtNRM1tDTbEPsI3GC7uMd2pr8PYlS+4pJiDhPPMRkITTZ7
	 muhXSDeSS1uXHJklO8/RgSgQSqfJnuQw5r8yC3HSXgvYcpL7KqqVjr4b9bNPLqD3niR9O
	 gOzoAsEFicB7IWyLKyx8QNg8YNbe9U1BktD5fN1AA2bGodY1bbuTwBkQp7UMFKQketA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qdl7YxTS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.36
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26879606A326;
	Wed,  4 Nov 2026 11:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26879606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qdl7YxTS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMXaBqse7nycr/hQXaflMKKt/NpWgFwGRBa2neJzujjSqtr8+a1Ap9zcJgOpMJ55GRGSFn7Ijc1rYaIxRljIgVzbja/rx+yIUdT33wLCXqkkJg/+tHMZNVHRuvhJ7300Jnh9Ig4/59RLKuvSzvZerNGCHvxg9iMNN/S4evIRDD23Z1yNKxVT6T4o3NR8+eiARC1ATcl1wPaeb52AKn1p2rBRI14bJHs1phS4m/0Zq/gXrNssczWZYbbepyr7+Ib4xQJKoWolgCILTA7vWQQNNDVXAC2uBZUc17UxOftL0LNwcChJueoMXF4Hlk3XGn73cOok90BOYWP2rA4FZl1WDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEiyV8JG4aD5ndudcSx83B8UUlvHd5vNl09T7al11zc=;
 b=enG+5wInT3fDqHw3yZYWcL3WR+rNslJQO4zReF9zFar57UGFBxld4ak+8lri7EMaoyr0UAuk0ftKTLkhINGWUdAgqYJUiyKX7PzDr0ZGgAqQl5fgJQQbH5PPsSn0tOS1RcLap2HuT6ybidXx00IrpjW2GmKRhRTTlZIkVguBvfGEC+NVJLOREm9Yrf99h9lvYdPWmLSTFiova6wCCq/CDUKlp6WFbRLUz+z5MCOgoKFfLexqEIGUi0WRgPsBjPB4CQHzEMglFL4NO9UzB7ZGLa4Y223igUTTRiiTa7XyR3O3HSbsmuT+VEZddRzow2stGDNFMYdIzI7MEC44RAD9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEiyV8JG4aD5ndudcSx83B8UUlvHd5vNl09T7al11zc=;
 b=Qdl7YxTSXHqc90HtLPDASjY/zHAxvfKNlJNBRiO1Mt8E9Gni4X6teZI10qJfr2ru7NVvi+ZbaATlaGUtakNRCO8utf0JaYRs2DKleeW6HApMNaqQ7kCEa1/GMVXfb4HCw1/ucqRXSnduDt32r1rQQM5UJzO7XSNinm9x1WGablLT0tms4QlZkSw16hdQGIJ4LVAi8Wdn/OlW1wpZyjQLNp+MqDJLgmOxPQHzKAA08nUEEvu6Z5RZgInQw1xANRcbaWjiyppzoukDcrvV0NsppJrxQhRQdHGLWZlLMWGkGMmUsWiPepF2rGKl4g2Gcm/wuBFjl9tr8lXv99Rop/YQBQ==
Received: from SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::25)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:21:19 +0000
Received: from BY1PEPF000264B3.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::49) by SJ0P220CA0009.outlook.office365.com
 (2603:10b6:a03:41b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Wed, 4
 Nov 2026 11:21:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF000264B3.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:21:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:21:03 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:21:03 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:21:02 -0800
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
Subject: [PATCH 0/2] ASoC: tegra: Add Tegra268 AHUB support
Date: Wed, 4 Nov 2026 11:20:53 +0000
Message-ID: <20261104112055.1101243-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B3:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: 137b86ef-cd5f-4d52-bd0b-08df3a65bfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|23010399003|6133799003|10067099003|18002099003|56012099006|11063799006|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	7E8l6P7HWPi8oRRTKxj9NQ6OBvM9gIesxdxtwd9N8N4IT7ESucSwZ5+tGu9Y9mNvrkJwqmjhenroCZaVdAUHD2pwp3FHexb8CABLH2GqnC8niwucFNjFL912bdhsze4H1ZjZ0KH0+TUsO1Ala2OY0WWd/qnKQMGRRiH6HkYmomWY6qI7+sVHDTYiJ6VkBvSQ4/LNquR4NMxa2AhZamNgoiZN8fmm8sWJxoOUNho78aD4yUbcxuSsJDz8wDz47AVxuJT1SefOobDSOo5Ep4OdHX6nWq9kpKecc5MqrQEceaA3V5WnRX4O2rhYMz9Uca6oZaiTzNjxUi154cqKcKHjIo4cK59npDvO8JbOVsjNkZBH24Hx70z12r9VPeAvd3GdwInuu0iP4l7dUdkJesx5yv2UiwUAPA88/3qqr59EjDhUF1M6VPMRy8yaWej0bNgbrJ4uvQZ1jhE0usxt/bzccIDaZdFXULahzKQgy3s3x0RQ7SY4zDJ5McRy1fverZG6r9+lEEiFAUKjyY+ldC35kCvqLJeyKDmvV8wmyoKVZFbxM9q5v2PEDr9aMHJdoT+Wa2Re1ehQtJgXi0PalhGEekONjGRAHlNrrwIue9aODvyf7437O1dsIhJE7suVWoAZrpCZ3cl0ZmGVnkgdheHGavDQL/A39TSeOFG5ME/bHjMQ88sUJ3AmArEw0Ob+guqdITR0t49DPIxSzebDBulcoQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u7jSYbtq7MgYXgmjLNSS7bX3cwLeWIw/6uszDf1DdBld3crKFe3h6fpv07s5eXoUzo7pJIOcFl2ZMvBMJBm/ecNypX2XkwlZcdh8crriZEQEZ3EZtzKXy73k8RUMj4rqf0DBjsB9IXfSuXWcRC5f9LKGgtUym6pXdp4nkSj8wxD9Xwu0p5PHgckRUqhujfDPBHD9bghSUu7f+nkrthPpBfZl/48Z8AIORDawmstcYIye2z77qYRO8Yw8d9pgAf7ulFpjoHYxFL6HmMk9eQf5KllOUuZNsaEJxCOFYHKYpWGVMla69L4TuG0RICEY7nzit6RakQ/4MpIrGgVl+OavGR69MSXnEOzQ4Q9F4qojpAWNC113kRONp/ZPbKjAxrWkaoVDFCd525CXC9kExW6zrZ2O3BTyShFZCINZvCAUAn8DDkX9SUxssySbgZ00WE8i
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:21:19.5337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 137b86ef-cd5f-4d52-bd0b-08df3a65bfe6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234

Tegra268 has fewer AHUB interfaces than Tegra264: five RX and five TX
ADMAIF interfaces, five I2S instances, two MVC instances, and one each
of AMX, ADX, MIXER and ASRC.

Add the binding and SoC data with DAI, widget, route and mux tables
matching this topology, so the driver exposes the supported audio paths
and uses the Tegra268 register ranges and source masks.

Anupama Kunkulagunta (2):
  dt-bindings: sound: Add Tegra268 AHUB support
  ASoC: tegra: AHUB: Add Tegra268 support

 .../bindings/sound/nvidia,tegra210-ahub.yaml  |   1 +
 sound/soc/tegra/tegra210_ahub.c               | 347 ++++++++++++++++++
 sound/soc/tegra/tegra210_ahub.h               |  27 ++
 3 files changed, 375 insertions(+)

-- 
2.43.0

