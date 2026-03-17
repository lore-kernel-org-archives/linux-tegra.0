Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6224501B;
	Tue, 17 Mar 2026 09:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740985; cv=fail; b=Vi3DzBk6QyxZv+tCXS69HcfR1KRh+sgvFO4hoiPl/raBPeI79kr5y0BJs+HPYfOWsviQkqlC8LqoXB6pckxW3w0MpTsiza1PBPs1EIdsn3IIP82sH0FFKYHFQPhzHFu8a8v9u8yvB23MOTpLmOj1h1M3e6+KUPkEPIuyRNx2xrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740985; c=relaxed/simple;
	bh=llwhRAhGKKiy1vBkzm87AW+bQCjSqC0daq/86AhMfms=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gmVSyz5WtCuDfMp8f+wbtSKeVHmv2adkB8FbKLlh3CMuDjOTGSSczYZDaNyQVcDJo532PMiEvMECAmFwYqatGIEvTyGgkXhU70o4KzShfvU3Llk0qnFFi90wfiZyQS/YfPBkoseu5kp2Y3Rtvku41t5NfVhUHd/G90qV4RRRu24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p10ouWNK; arc=fail smtp.client-ip=40.93.195.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p10ouWNK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTGrv42Nc1OhgBzshFfFHjg1D99wycpNljGLMx8midbZrIPPpLIWxDEt2av4VHS88tIRApO5bYww8WPd0lyAsdouKNq9n5U4kbH07XlZjjcoSJ1Y0v009p+2T6yuAhqGmN6SEfjQohOYcwwmx+ptdzWEQdR6K73Rjo09Y3L0y6WnOvQ3kYZZ0EnT6U1IbAXidNoxr+5Dv23h8fq+3u/j97pkoVwB5NA7KjNWg+f388xbjZllmCVHk7JtnnZa3xpqLp//UAAfPWWSaHcPend310byoGFWrumpoTZ0UGt2FkB+PyjxmqfhM52f97UV3yLSmdPSi8ciquLYNQX+qxBYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0TaVNW5b/G5NQ0vXDdRkIakDj/Rma1cK3rdIFSyFu0=;
 b=TLa5Py7CcN+tkH2nf877JZp0d4j2jLOX/0h2LSdnFs5UjqBcPh0IBDopuNFoEXGZGi+2f9HFp073+hJxP0x4Nv4hi+yJINTiI26AsAeoj2jUEq3RM2z8vQTn5/VUeors5yotHzIP+/oJwPMAI2r75e+k7t587oZaiFTdy3w5jyH3iE34WIhHhVNJGRtwaSihXWmvoQLZ6tCQEOa1sG8DyBu9IJ/WCw+YMcdSgbVndRnJBNg8AH7pxg3+2bKjT/TKB3suz01t1aDRTIV7zQiRuJHA5Hj1fcpcSjpBZnzMxEgaW70LT+w6sHy/Ql/zc/zt79iYvNC2spMJL3J9Di4gOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0TaVNW5b/G5NQ0vXDdRkIakDj/Rma1cK3rdIFSyFu0=;
 b=p10ouWNKsBxJpIeNjpiKaNuUbuhJQSrlZcJy5GpBcOSmULnSA9FkQ3IxcJ4mYEpUygrhhrkq3mCAO2ssmNSJ80+0UR5n3+BTqbcIcCG4RXumjMbkUgMqXW/8zvnNNZ2KdP7mc2CyENKRCGZFFUJVgMZq5bUkjoV7rssBzvaEvdOFXw65Qe3fu6P6SRxeEHKr9zXoVhHT0IMhgAllWTgS978KuPC7BvQ1jFP/uuPvKRRvit8rdI0qBhKRcSO8+QH8zRD48W7ODI/z//Y+O8uscnXpDoeoNW+kkoLGxgETgJeTnNc+zojZ1js5PNb9EQua++EnceHspyjDhBwLhQO9CQ==
Received: from BL1P223CA0038.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::7)
 by DM4PR12MB6009.namprd12.prod.outlook.com (2603:10b6:8:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 09:49:37 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::9d) by BL1P223CA0038.outlook.office365.com
 (2603:10b6:208:5b6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 09:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 09:49:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 02:49:22 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 02:49:21 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 17 Mar 2026 02:49:21 -0700
From: Sheetal <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Thierry
 Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
CC: Mohan Kumar <mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH 0/2] ASoC: Add flag to ignore 0Hz sysclk requests
Date: Tue, 17 Mar 2026 09:49:08 +0000
Message-ID: <20260317094910.1582011-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DM4PR12MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 397f1b4f-6ef6-4a94-93df-08de840a8087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iX2BMnUX8cgEAzBV576GNIJWN9s6mih+mlQUb1eMDLESGjtQ/IiP4PYzavGqEiEB91xY9TffS5PniQX2FAIAakNjhpbxiZP2r8/iSImBjsgjkOML7lCcGmUAfcjEH3JHb++HnJt7NqgXnCm3mOSUETcSh7Jic+MZ6BrkW/gljMB6hiVL05L14KP3ELNwRg33OG4P01x7hc6aTtWF6aM6LGvw+IW2+64Q7lo1t/D05Fgjzib61hceelIlaQVqnlC3DQvly1F2wNxqRMHAOlNkC4oQkqwAXwN4d2cSG2BQmFwIsShz1g9aGUepH0fpmvrTSL7ZYb0coEsJeq415gv7xVoifN/uAtIo5vrHhVYTp2IKrScRCX/57CyTRsghflrWm469kTgmpleMKmMpsLaxdDB/5ZxpSZ/vMgIDlopyQ9iiQdltTQiekEBduEMiZp3mR6Qxdb1viHk9xMbTLA7xUOOfQlpG0hclvfCHGSl1S94L+hoGNJ2UWYcOBAt1TC9Nl6wcrZZneSP6pNz2Q0/cEj6e3Yk4EdXYMx4NgB94N79fWu6PNqdOciqci1Pw/aMST9S8AeVJX2KP/qQDwpXE/MEd7n9vXCPYU/w93SPZq9vJE/wLPY+i0wGj0TNzJBm3j03Sy1St32zBRNGuBZQPLs6OC+uDfvvnGln3o+dqIN/askNObNx4nShH5uAxly0cXbfBr4pVsmArOQO+zRNWEI6fBA1+IEJ38IapfLnDFD1WGBiBbl00UOWD3axFjLjekdgcciu5elMY7YQPXf5DPg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5so5PST6/yR4qs8qn/MU5RIj03chqqXIB3MOVDXWUpFwP+5TI0CDY9JoH8rmbem0GEVXfJp7mIhR23OJOcrka8I7kY3MHUBsoS71Mg3dPSnJNC+yZKgHrbXQ81KwFfoudQ2HR5IdXEf0RCLBby3AIFGYS2h5eOiJP/4z0t8BnBEzM3J/k+hjf+66ks61yHRC3MN59IgdoJfpuJHFn+2kPsvWT0UPM1mxTxZ8eMPiTH76GQY+rxqG6vWsxsFJi6Ln02kfYeITRfesiGm0jxLbl4IMdX3NshwgxJx8DTZMmpZMy8rmVLCfz4Ql38r3SlvnfiRJmihyOM0ZTFRvGfb7Fjmj1vmIhFqCE+t5hdTAvY6qLFwXaZYel4mNhTg6jRD3YoS/a3dfroaBcC9OTtQyF9bBGvtxg6Z8Zo45WeSWHRq0rg1bNKcTQPNLluvtVv0D
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:49:37.2215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 397f1b4f-6ef6-4a94-93df-08de840a8087
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6009

Commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to sysclk
when shutdown") introduced 0Hz sysclk requests during stream
shutdown. On Tegra platforms, clocks such as AUD_MCLK have a
minimum allowed frequency, so passing 0Hz results in Boot and
Power Management Processor (BPMP) clock controller errors.

This series adds an ignore_zero_sysclk flag to simple-card-utils
so that platform drivers can opt out of these 0Hz requests, and
enables it for the Tegra audio graph card.

Sheetal (2):
  ASoC: simple-card-utils: add ignore_zero_sysclk flag
  ASoC: tegra: enable ignore_zero_sysclk for Tegra

 include/sound/simple_card_utils.h        | 1 +
 sound/soc/generic/simple-card-utils.c    | 6 ++++--
 sound/soc/tegra/tegra_audio_graph_card.c | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.17.1

