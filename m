Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013001.outbound.protection.outlook.com [40.93.196.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D2626299;
	Wed,  1 Apr 2026 21:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775079554; cv=fail; b=ba9SddKXFhzyk3+ZZt3ZiqZNV3jW5lKIKs5X9YOFLH/hUzH5w4nbcL+TKbTRFfAIlwRsMIljlN2BZzx/PAwDH3I8O0H4amd7RmR8I3pKCpdfalnt10S+ITF2Rw/rke9mMgcAGG3Z5nn/66CMVIwehK9MQn9pUBgbOnMTxFMJWKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775079554; c=relaxed/simple;
	bh=8FKlxaPh2+eedZoxrDabztP9kYcmQhxtmQsPpHM8qNk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LjVzHmDKvOpYiSWHbnySw8KD1PoZv2dPf/rf0btFlKJuYNUTFQvuLSNdFnvE2ONh/+NOngWIbpdMoWQegSz1ishsRsBrEPOVNAbDE7vGQrebGY5/ejBQPVWtCSc+SPSQex3bu3v/DS1qh4P8MeaqTSr9vdhf3zRylyg1eK8b3K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=livDK8Ai; arc=fail smtp.client-ip=40.93.196.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="livDK8Ai"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLb2G7vTPUrBy6TUcp0Ah9rw6KTeJ8pPHqIqZwU66gU9N0ru1zwoV3VTT/KEwq9W/TjFt9ikPi5Xz0VJZcmDvr9RYLev+8i2BCqyqXlvUv47ujyVD0jpdObPR1+OLk0NgrQ6fzYAEzOvZMoQ9smSpuGdsVjfKhjydvdwgpTv/2lsGXdIIH85WT2MGpA/yxlGwqSA4KuhP5u+APYqdL4TJCLFjlB7234RAT9E1PUXiODj0XU+ZcZe/b4/xkVLgNn3ZT3Q8grOV10YqXyumIzNKPl7wvoaejLvvBK40Pz2eU0MJuZrhYOTGdGbf0pUNm3iMCi+Th3Z8/QaV0XSV9psWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CixtxekDD7qvquBYNHRjfopRP37x3rfmS3Xz+NohsnU=;
 b=A1newg1B56BaesxesyYo1kr04ohrezXYo2i5qjqNKTF65tELLk3PSUbTxYbmDzoMoqGlUCxIY4j2MV5w9YZOP7pt/lfk3hJ37XTq+/iZgTQW9MhkOiad1f6L/PND4DRzXf0d6yDG73uWVtk9BefQhnsq9uMgPqvZllCEVhL3z4QZ3T1ty9Ke5asJ55VGvChnPcgIxtxE9IkGM72sWrQ3giHrWPH0R50re+ze/r3ovKcW8mvHDQpY27CbJGLqXVu+QWDvt3aJW4tz0c7lZgxdLAIlUkcnnuaiksR/BhNOwSCh6sbybWqbzGHdiGTz3XdjPXm6nrYDkJBlGfRBGgm9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CixtxekDD7qvquBYNHRjfopRP37x3rfmS3Xz+NohsnU=;
 b=livDK8AiHxw0ZivyKtVVacAiOFlok0WYh0XP2NU2GEKI9+cG3AT/2tPx0j1zMNBtpZmvcg+lbKR45QfcLxCr6VrBjJ736eiTJRD89Nl1CanjEZg57nbj3Gu1LNDgYrHKVgBvO5htQJBaTgIdfShNYvo32QFXxAXlYh/rFzVu64CGwn9wFziXCUJoa3+1F/n4it2PzS03n+BcbzZ/Xwv8EWFto3J4vIPI9y4S3PTbC65avj5reG0BfWgUUrdoVWQ+W9etJsyTr6b+nPmEd/u7tyOFrcAcagQ3tH477OD5BPV/uISsiX/xJ/aPR53aDk5TpgCz5A+xm9NlloDPyML5ZQ==
Received: from BYAPR02CA0031.namprd02.prod.outlook.com (2603:10b6:a02:ee::44)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 21:39:10 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::15) by BYAPR02CA0031.outlook.office365.com
 (2603:10b6:a02:ee::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 21:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 21:39:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 14:38:52 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 1 Apr 2026 14:38:50 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@list.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH 0/3] Add Tegra264 HTE provider
Date: Wed, 1 Apr 2026 21:38:28 +0000
Message-ID: <20260401213831.187569-1-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|IA0PR12MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba7c678-b922-434a-f0d8-08de90371ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/rnuM8gWQva4AVfd9nWsm9b962azKM4pl5wtOjaKcQdQQxfCnlEIwAcRZHRgc6jPraUgggcRAA4ARyxrrNfE1T7DSOXEED8iKQ6ctz0FB366asM2mEgvZcibDy7rlqECDn96hIeQXawBY4DlXBSbALPGqxdI3FVx6qoOhWUnTLFq/phF9deOrg8tN82NTzLE+yrAlsnvfxjeCkDVBPaUPO3rNz0I4xh7GYkLt178Ehd4WXzPE33pR6cfA81bQrKvDIrQhuOvfgE0cs+Ae5URXxQb2L0hJyCQWp7+P3N8h+HSN3UMipjGSEjrNbv9Q/rTagzp+cxvcGBwdwOiHmrjc3gWJofSWuE/RDJW8PYVA3ir2eAvtGs0+ReA8QI3ZygG+p3YQxJ66x3lEvoypPPYjTXOYGCFXyXb9gDdVu31SX7Lv+Es61QpWdvjp4fIxXP+yAJQOYN/DT65XCVk3S4ZLDTRXxDwVyljX3NwL+nF/tWjvVAne9+M1Qt30CN9xHL7c9tu8zRnsGsCiG2nDF0p4C8Ot6AY52/JT2M5ZO4t7WO3f8PWQSMuobcw/7pTx1uSwepeT/hMxI467g/HDLh1N0ae2Or3kV1GBenpNdBUgLQt0vlkODeSWDuf5TBF/SUyVYqALNhkeZpAp19OmEQPd/1FlzZnrPA+4Yl+r+ijnicKUh4R37Z+ySfhvVdvFXHk4U5Y4E7tQq1fcYFDEZirKXUV1rq6NoTTM8JqW//6K9miDjIWxL3CeHD4ZKhb0aa5Ad9FsPF20FBT/bSO93dvdCE+kLwgbTuVBT5j/22/jCzOUqhiO4RjVn+I5rs6NZVQ
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	20Skbm/qFbcb+0KI8FHmteCMs4ahZWAgbP97cemL47347KAPnHaYNX4P1bltmuX6H0o6fSx/q0852XMgrUoC6wLKBdNWTWDJpxAYldkNpKQg55McI695Xq1XH2xC4OLAiolg44OZpcVT0o/3nIPLhUMrCMZxc4SsOc7Pn25/aaG7VKARsBFJ+F5m2IgUPd2zWQ2UZu2zB9gwWuu65P3RlwLQp2VCZIppN9TJ7jX7+aDRIf5AZMw7xsWkWO6Nu452yqaUr5EVArCHHGErBlriKyz40S2D6jDOUhJrLhMCeUr5eClCt5v4MgiBfwhyryZH2yFCTtRq/KlkVV47w2n3/gUukWPFWb7gcaaliHhWFOlsEdi+DqpgnFmIVjLcY5dB+HhsXQPaJQhPxEB8fdv/3aYZzZ13Yza9nUl0q4HqHe3cCs0h/vuFDbqIGeqOFdNq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:39:09.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba7c678-b922-434a-f0d8-08de90371ba3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975

This patch series mainly adds support for the Tegra264 HTE provider.
  - Update devicetree bindings to add Tegra264 support
  - Add support in driver for Tegra264 chip including new tsc clock
    parameters setup per SoC as values differ for Tegra264
  - Populate device-tree nodes for Tegra264 GTE instances
  - One of devicetree nodes has reference to gpio_aon node that is
    dependent on this series [1]

1 - https://patchwork.ozlabs.org/project/linux-gpio/patch/20260128085114.1137725-3-pshete@nvidia.com/

Suneel Garapati (3):
  dt-bindings: timestamp: Add Tegra264 support
  hte: tegra194: Add Tegra264 GTE support
  arm64: tegra: Add GTE nodes for Tegra264

 .../timestamp/nvidia,tegra194-hte.yaml        |   3 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      |  19 +++
 drivers/hte/hte-tegra194.c                    | 133 +++++++++++++++++-
 3 files changed, 150 insertions(+), 5 deletions(-)

-- 
2.34.1

