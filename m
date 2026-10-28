Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177381;
	b=SJvnB2ck6C9sZXxsCzETBHkOsjzqw7s+pjPwhVTd/yYEBlobJywgk8PpImNkKvq9DF7t
	 9TlSjRkU++vZOZ18BrMHdidOjpwgh4ew/NHH3s7Xt4C5YhiUh7A91QxVtt8d7bW9s/bJ2
	 WgWlCsrpfwLWXdLT09yO5O21GYR92TG10OCsGG/RAtOTKZqz97F3rf7IKE1U5XFPs03Sj
	 zVUaOYOJ/Xh9JXP1pAluyJhlUlCytpNptcn7yW3khqhGESdPWjuT155ZxryVwCTQuRz75
	 YbkvqRyzEpE1E2HaUCTg0QTDcR/ZyDqivoZbtY9saNXXhEjHBU2zS6OuV4EQbDHkAKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177381;
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
	bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
	b=X57669yAlthYS1mGyZnjXIHQ9B8OJHE8esoh9r4r8U6v/8NuidtYFoF/boUMdd40NnlL
	 3tNTZFsSKYv1HeRbHiE+MCT/vHikmMTOBzvS4espssG8EqRLaysScMSoDIS4sv1zNMjEV
	 DKCVEpZWe4xZaMJ1ExWLnNkJCDPWygz3X9bf2Ky1cyXBSFUNvRpn1AaGNcmFKAwqgGR6h
	 gkO8fq6YMxCPMeXrIYkXX8UAyn2JhuXsoE84rzOkPfVOYr7TNO8EEwl1XnVcww1bzPOxu
	 SDa3Z77JKM99uyEKWgVGUyhh8o7f880nTi2ajV8r51ZmV2fb5pKc0pgHgDKuZiWHVlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TWH8rlj2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.36
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC39C606A337;
	Wed, 28 Oct 2026 08:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC39C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TWH8rlj2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9KphkrY370vhcXLkDuKR0w5/YJoveWxS39js5GSbskuYvqQZhIrtdpdmECTWaYIMG6CZQjRcdOoUstZtvMLuJUdL3wDQxPonZvDiX45I4K6BOkHJJtHcBQQ22T6Tqj4kiR8vVxj3kqHIOdq54gqSAMX7VM664IXCN2ssgugK0PQa53IeozpKijNjgPWwKdvOlxrKYl5ZODKgKSJOKX82wPh4OHOEgEBVtqJUqdhp8o5rQEeOlY/kbRmOE3tu+poxyVXFKRtEC8qXBc++uhAigeqFAKJjPKfUM1ox49JA2LoJJ2oEE8jAe6AkO+vPvC8Rp9qoE1//DZa92goq0WqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
 b=AsDTcpJ1neM34r8wIeXfaT4mk+FmmPY6lU0AZ/ZO5w5Lohro7oeGEXSwa+baw5wApCDs+A/sCMlBoCq0pR1R+B4AtVV734APAEBirJ9TiTdR/ott9Op74LNhJNpjU5aZSdOKTL+8jWdHmVlB8XMG+tn6oKXLDan+5u66iZoskwcRnXdpa3ZUhPqxlXfecn8QsYbZsL+Eynp+KrgB8eYDSvvp5kPOk3CF2wpakMV8J8VRJH8RsHNxxYeepydK9JCozoaMrdMHZkjEBPHfmNXSAbdYfLOrQlY6vY79ED7SJ2n2oldlI6L+LCvDA++KItx103V4o/luGghphwdEnitThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
 b=TWH8rlj2g4K/7cchA1jjKEIwVgDsse1HAMjDauKl2QfDB/lXFCRvIEOXz6t8s1DQ2VGbRgojV/X4M/1MlaY+J8HyBfICK8R/3UyIE+ZfJQ9CZcxz1yq39mv24lHxUPJ/+89r/akuFQpAqwc6xg1jbk/Xaogk81imuJRsjiUYDI/PXqk8yyK702h7UpacDtObCUi5PwvNInIPXumn1ArhNZY0BX3kdpDCQKvlhmnwHORrMsEhjk3wIOlPKR9ffhlHFkJ9C7yKDIT4LiOiaGLRZLC2MAmxSa82zgCgREAldGeTZ0V2C745Kk33MnwMZ50XmRM1jiUhKKPjAcQ3yqN2vw==
Received: from BY3PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:39a::24)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 08:49:35 +0000
Received: from PH4PEPF0000B60C.namprd21.prod.outlook.com
 (2603:10b6:a03:39a:cafe::86) by BY3PR03CA0019.outlook.office365.com
 (2603:10b6:a03:39a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 08:49:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH4PEPF0000B60C.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Wed, 28 Oct 2026 08:49:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 01:49:20 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 01:49:19 -0700
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
Subject: [PATCH 5/5] clk: tegra: bpmp: Do not cache the EMC clock rate
Date: Wed, 28 Oct 2026 08:49:00 +0000
Message-ID: <20261028084900.1047287-6-johnliu@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60C:EE_|PH8PR12MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: cb493464-7856-415d-8597-08df34d06443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|921020|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6MLYBZgPxgqCjedHBPiNLaJiSdXPDc73jdhy7wIPAGGws0YATOOfnF2neXWVqgquJijzAJxKdA53nV/MQKc+7Ij7BNp879U1nZdxI45Nz4aJNBMWh0nuev550aU+OmVbfacgEFrDrerpLG6NdNL2cxe9wLhwSWvIBJRCXtL4d+OWbJzMU4wtU+jpJA5zvHXDgxYqnpjt61ScR3kfHcfcCuo6XMdDkVnPeukjCgwQjx77Pz0tLsWX7uzITUiNfH3J/P9erSDFH/AReYs8jTRi7EnifoP52QdoDIty/G/0aRtOvARp13WU7LNA082uQ5uHIwoK3Vt4QV3dWrLpgFIAKKopegojsPF/heOmNWKclKKvGX81cdNLAt034uozPsSfEqnzhynQcJMJYXRpfk2UjEj1bR9TdsYiVoPgKPQgoLARMWM2fd9BXHpBQ70z8d17I29KWF8EtOFkvuqaErsL1B6RDEXIVMbHbDiZiqDS3E2JjCc1FJLow5JHJkQgem3ft6554M7L1vlFbv3OjeTJG2OKv9tDtXHDe9g67ccgzB0qn+LNw3MpJhMTEESaGEa84n8EfG0WftFsPEEeS+BOz13RAs/mDpaP+L5I8aHb3Ub+Jee2aj1lGwDLV0hh7/lMlwgbBQ10vtJRN4xyB2ciSyVUim5SOhusBHOGALRyKcvTn2QiQNkPrfZ1WgxUoh0S3Z4Q9W3dAdeJLR6N6cSHLPJRRzw8TjdsG3WucJwZIMH34RZAvbftU5Zm29ejeUPb
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(921020)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jdC7F7rkN4OkA6dvy5VmkAt8J+JKHdJQW4AHLWhL8/u4FXhSzwSGL5KiikQ+fD9GraH1XgdwuhJwnzkXxbWbmvhfltoPhR2Iu0+D/T/6QX+31UGkEzHedjws/tsVptXq3u3jCfgCoULu5WygbhQzuCBTUoq6qt+N5NR2q1QZHMhgNgZT/cBlg0oOqXgAbl0CCSBYscisOG2oWTjIkyonbCf9on1RiMW+6j0x5bBs0xMzDq358CWsBvSCxgmF7ZZOCTei9/tawm96BmmmGFJK1zj3EfHdwWQKG+D5aT3CjY7Bin/9JpIYwTuy13DQe0+zFM0Qm3gY5eLbyUmRapZrBc3qYSKhuYXoGer7ipDBu38BXZdb0rt/9PpWDnhyPzVyVtTdpl1I3aTq6C8ruULTLxrPxbon4w8eSeBvC30eHOyoqr8p+Vn3dxGeiPLn1evI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:49:34.9322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb493464-7856-415d-8597-08df34d06443
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376

EMC clock scaling is managed by the BPMP itself without kernel
involvement. When the rate changes on the BPMP side, clk_get_rate() on
the kernel side returns the stale value cached by the common clock
framework instead of the rate programmed by the BPMP.

Set CLK_GET_RATE_NOCACHE on the EMC clock, identified by the per-SoC
emc_clk_id from the BPMP SoC data, so that rate queries are forwarded to
the BPMP.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 067a8555c4e7..ddbc528cf93a 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -588,6 +588,9 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 
 	init.parent_names = parents;
 
+	if (bpmp->soc->emc_clk_id && info->id == bpmp->soc->emc_clk_id)
+		init.flags = CLK_GET_RATE_NOCACHE;
+
 	err = devm_clk_hw_register(bpmp->dev, &clk->hw);
 
 	kfree(parents);
-- 
2.43.0

