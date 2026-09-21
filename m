Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013020.outbound.protection.outlook.com [40.93.196.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8C45A2A5;
	Mon, 21 Sep 2026 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981058; cv=fail; b=TI69S8Y+DQgG65dtnkvG82QJUJxwNOgeqOz8FSHgVKIcxII4qCJtPXI56BJvShL8Wwxs/ZLb2o64W3WsKcxNKXaHXH/0IoDvqV1JqPhBOMf58GniJRvmxrrPSNH/LbdklqVCDw0Ey0wYUXwrhN1TlMedDwU+NRmqBvGWusc2WoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981058; c=relaxed/simple;
	bh=yUsY6v8NFF4B2Xx6XMrlfnuMz7murm4gREMbbSMpixc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tPBNXn5ECQ+YY+kpYKqKng6K2iQ8BydH/rRNoefmXK5gaogVeA3OO3XvmIcyGuojrIqB5X7GR20v3xcIFnps8fxcWgM2KloPBOZB2+P4W9CzynfSUUg2J7xXxz6oJRMPgTzVuJcJsF2RYaoYOLRJMbmoc0s5+dQ0xiroKiQJmqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lqnxb1tR; arc=fail smtp.client-ip=40.93.196.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lqnxb1tR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBp6+Hr1xz6c3KhdJ1oa7/g7/Sq4Yc959egT676bx1Tio0VEVuijnog2LD6Km4VjAp2zPkdQg7ALNZlO1zhJPfOhALgEQKXjllatziOmyEvxkCGxKM8DRG9CL9Lcd1gTmhhgyR8VtcYkn4KlutLuCV0NlJydM4gCJ5tBd1B/ZO1SQTIRjqvomT8WHLz3qLrEO9dwImqnSWFhP4e+XkpLYfEegRqsBQtY9AOpZcCX7Y0aml+9YZgWrtuQonsRPmPEcehcaQ1IPkbW2ZNN2dYh6t8Y1LC4b8/udPkWylzxl+oc1GD8Ns1uVhtEIwLgtR4klmqkAVP6YItS/4IwUOL4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIo5FHdB89ujSgkc+yWod2J2OhYz1k5nzYOnqRTShWU=;
 b=nRXsdMljBr5sFwQHQWM1YJai5UEV34tVAbg881/NcnglH7sM5zMDyFg2vTpX6abGOKHfeEWmsyf/LaupRSjmGSlU3bNFiuZGLaW+f3URZQhFghBZUDNUMKXqgtoKiZlNq4EwubErKd2/zrfeKO8v/9WFTuxyKSegzyhiQk/6BMcJglO/dAxyytfaFpxCgeCAcYNLdx6oLIqtFss0I/9Q1Wh+s2wxfJSnzCSTjGVFQC2I9Q4rZRfBZAxddSkx9QEyKipFJyC01apBKi3sleyt5Wesgf4lqB7h3m+Wq9SREGQxvNBx4cYjPQYst3WgEYBwt212JH5f0ALHzZZgCmQ9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIo5FHdB89ujSgkc+yWod2J2OhYz1k5nzYOnqRTShWU=;
 b=Lqnxb1tRWypaiyA+JebpjAWrFDWqR44sYvHljl9mCZ+9QTX5CwGTgcbNcj/M3RIN0mo3GCNGSsprd8zsVSmrf1W9+1rDvhg3TkaVF+rd703pGxN0zbcrydcS5vrFdu/8x1DnUITc2PpOvLoikU0PMx4zS/Oj9irvlR2Ntb7avrRnGHd4hjUaDFpiuTy+/s7uox5dZf09l/hXKnBWTxtp/W35jhrioqi98FCMF37GosgT63KQUBu8G56oqC6IQTYq+9vEXmr9i996xx38OaQt+wFcACHZjTiRI7er0GBbi1C4uCcr7PoEkrNozycqrLpWE7PmOxlU9CawkW7dciMCjg==
Received: from CH2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:610:4f::24)
 by DS0PR12MB6629.namprd12.prod.outlook.com (2603:10b6:8:d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:57:30 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::5c) by CH2PR18CA0014.outlook.office365.com
 (2603:10b6:610:4f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 08:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 08:57:29 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:13 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:12 -0700
Received: from build-sheetal-noble-20260902.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 21 Sep 2026 01:57:11 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH 1/3] ASoC: tegra: Fix ASRC Stream6 input threshold control
Date: Mon, 21 Sep 2026 08:57:02 +0000
Message-ID: <20260921085704.1248920-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921085704.1248920-1-sheetal@nvidia.com>
References: <20260921085704.1248920-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DS0PR12MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: 597a153d-1868-46dd-0c22-08df17be5dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	6kBS9Pg3MAON4t/m3NXUWsEKwtIKLdxxkR3jfsc7l2W7+P4C7kl43r+IZnxJ0j1CjkMuJYNCkqJWmgylf3I0DxLpmF1Ta4YQ1V9kBqPfOLLYgj/U01AQbAPGi0mlJhZoiagJTh76eqHKAHqeKFfXaRCpN9l6ihLQXcUs8r6MYLmtelBp3zghFBmBmTRkmQqiotL38CdiC+FRLeQ5pEdETBYxKNLqWlxDjGTCCIUfrTqGV1Og6Hd8qN+Axc2P1wGpKe1FKKTkIInuj6+SAou+1oElJkOcC3O/KzwCjCZuOPgUqVEM20QrDtTt9Xr919/jHkrLTBPV898C1Rvcw1BWf8SdRpKIZZIe9jGAXcousKdVO3ZoITjYPiMGCpDtsWDoEQCufkgXWNS6aTOQDqYWsc5R55q0eaC9/3j0ddfS7G+mAdfvqAkmP2Kgn0E5rEW7SQtrU5ZzCNSTSkq3dw+K0WW35Gc1EPCyrEqopZQ/PhKConnsrdeCXVwrLinMiVwvlhsK+i8fw/fVF43nShzIApoqZK8/3DfTFBZUnw4GmMzrjIn1c1io5khT8xbqrNqHIBgLRdt30ETc00isblnlMysykUI6WnwgIMF/42ma7TYbR1q0F4lR2dn3cf1+7zmDdtZfrUXHRrOQBBgW+96HymvICT4UjVEu1TMbe3SVj226KRTIIhQBVTqTH2J2MROEZCs+wAj9YbOvgfoVqOoiPQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9pzV0A80XlbgW6WOuojpjQhPwkIJIgNKe4n07XFpxlnDhDTfH33vgaBKobq9Uhz35wwXRndok0EbUnk7RVQvHliccFmfwbBSm3W3382V6ElKqgUarSi/0HH0z59nOCttCTdRKcMyRweKwny7EhGYSUE91xUejhhQU/0QJjD4ceZ7Ehu49xNreVT0OVzR8xGve0pUry+olEj9Dt3yDlNVbJqehuO4yxFB1IjxBF12i4fYpyUs2f/p/sVdWKpB+vLiFGa6MoGJK588C9urYkI3FIYhuZGld7dUZ70hNFPHA1o14MQ+lS7uQsmi5P8w3Cxf3n0ip+iYMdfLDWDARen3IcYgwqqJnUWV1OxDMr736JpIHryMXzAoOvCBDkP7BHe27poioqC7JtBOA1tWrg+XY8RFrseOQzWU584OoHquPn9o5hTOmd7sVoDaKBob1uOn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:57:29.6064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597a153d-1868-46dd-0c22-08df17be5dfb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6629

The Stream6 Input Threshold control points at stream index 4, which is
already used by Stream5. The threshold get and put callbacks derive the
lane ID from the register offset, so the duplicate index makes Stream6
operate on lane 4 and leaves lane 5 inaccessible from userspace.

Use stream index 5 for Stream6.

Fixes: a2df8c2d5b36 ("ASoC: tegra: Add Tegra186 based ASRC driver")
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 7f360dfaf8b1..d8ae5d997615 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -828,7 +828,7 @@ static const struct snd_kcontrol_new tegra186_asrc_controls[] = {
 		       tegra186_asrc_put_input_threshold),
 
 	SOC_SINGLE_EXT("Stream6 Input Threshold",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RX_THRESHOLD, 4), 0, 3, 0,
+		       ASRC_STREAM_REG(TEGRA186_ASRC_RX_THRESHOLD, 5), 0, 3, 0,
 		       tegra186_asrc_get_input_threshold,
 		       tegra186_asrc_put_input_threshold),
 
-- 
2.43.0

