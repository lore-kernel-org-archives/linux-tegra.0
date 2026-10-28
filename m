Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177377;
	b=FOYM5v4O8evqmaWDVTQOSVxUEqsnhq6oS4yoSy9YuEE9R+vZkvLf8LDx2LSgvBsjI1u6
	 U/U1tERLqFHa8qjNTdLp7wJ0OSRqUETiP2BxhnTsWnGBbcl7jKRMJbdm7J08nHD0BhfSJ
	 YUmkam6+lH0I7dNJbeUaPA4gaaWgfZTCn8Y3J9586J15ig2gJjQccutZZPU67cbpifORl
	 Ac1b6CEm7pSLTaZvKeEtlSy234RsgE+FBXJew/cJfc03ZZG5Bc/LX8MODMrpy61toPaDE
	 XeeiJ56aWXNvEtT52e85+WPNz6ca6CoKzvk9mua89B7O2Wv0vFEcCiPC2DVkOrKX7Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177377;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=wjkb5RTVW4T+zb/IGoR3p+ToRwh93BDmbKVU2vNDtD0=;
	b=1lG2Xbpj1aD68H4EsguYvihXmr8/HRsUS7mBNj4LN3v9tRW08mGMvGkN3LEgyIv9n9hc
	 wgdqt3gwgOIL0rTqhF6S/o+0kk+IBsWY/1Z910AOP0SkdKqNjNwHHTZISQYdCoaavCySw
	 tORsknOT80pIuNnYgG9eSRZPxogDYI4VtXzkhn6zNWPJNPrD+HM6UY8jefoenwQWbBl54
	 iMqLo1gve96X9rFcFu1gva+361I62ktFwKcMD+xshq5l5hyseUYoAy0aLLJ8pRCxOOXQO
	 hhA5r7Suo6p+nTQ6Pnl91oXC90gV/2IMfB25Ui2hEx2wHAHfwRLQi7LTtx19Amiblrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Jw92mpKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.59
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F27606A31F;
	Wed, 28 Oct 2026 08:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F27606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Jw92mpKG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omKmx6wg8RIOV4oxyD88tgcBZqzEqN3mB2JTLieBC3zTql/7umaP8fa5AiPLHbJWpKZz+doTCqL5fI7CdJfBYvLMZYSfXYPyGtYMOwETy+JWUkqToWUBVWPwa+qp+SUXgSs+t0IkQFTSlu/Hfvl3+92cjuJNQ9ayJbI+dsIN9FgV//gR2YD9RVP2pCW4kCakBEkS+61cmLN4xp/sTuylZBdwMlEm+wbTzkoKoJgIF+wLFbbG0pOEbNdLxezclDPJSQK3JgQbdhj59nvuyvPqbIKsKhge0oFDOysWImdlZZm1BYm2KIYxGOp8GRrGmq9Xfe4E92pfECE8MmQ/N5nbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjkb5RTVW4T+zb/IGoR3p+ToRwh93BDmbKVU2vNDtD0=;
 b=ViieaWZvZO9jqTIIGXbuCu9D0/dPUgCnVwhgvvFjLcun6avfEtUsQzVVzRHRps6wlCBYqlPyA3/3BiyX8cCqppnPvZZM1bAoz9sbKc/EgPLnYNw9ENhyJOeEd3ciKb18BU+NsjtWM5hsate//PZ/acPhVcHVMkSNuDhPSR+pktv/Wo0tWbs24QnFxlPshxngCD1Tcml74okTrsUbhC3WFx34e19Ctzv2kMq+7L1/oNPZBClP7kYNBpE2rF6bvharBzy3dfeWXxPQnEQ1iMlMSEfs6wc8oarCALURsJnGoviouDeLstcySs8h7VRM8HepRWV4lcKH5MCy8Kr8v4d6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjkb5RTVW4T+zb/IGoR3p+ToRwh93BDmbKVU2vNDtD0=;
 b=Jw92mpKGfXGPWq38Ml9TCqA7M4INcrHJQKsIAz0S3cj++OHip+pI2yMKHTWeAKp6v1WCRz95UyyD6WA5yZlm506Ck/KCGIpbdepOmNY7ZHopoQubxvn2MOUYC9JRUa7gYJzPwnzJKhGOfrDnl6hbe1mhukCSTc6WXjKWrTuY0YRtc5YZcqMy+1jwHJ7X4CIV286nXiQlw8eAOpeQkhYPr9P1nZQrzgMvfe8jzhL51JyuTVADpRQdFiWz5HlB9xvBfpKv0ggmrhHtlGOa6R6xej4dE4SJRu2HSbH7LgWWGHN785WWgkVRCq3Z3sYlGzVuTmuwH4kT+c0UzVNazmbbYA==
Received: from PH1PEPF00013301.namprd07.prod.outlook.com (2603:10b6:518:1::f)
 by DS7PR12MB8230.namprd12.prod.outlook.com (2603:10b6:8:ed::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Wed, 28 Oct 2026 08:49:29 +0000
Received: from PH4PEPF0000B60E.namprd21.prod.outlook.com
 (2a01:111:f403:c95d::8) by PH1PEPF00013301.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 08:49:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH4PEPF0000B60E.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Wed, 28 Oct 2026 08:49:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 01:49:15 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 01:49:14 -0700
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
Subject: [PATCH 0/5] Add Tegra238 BPMP support and fix stale EMC clock rate
Date: Wed, 28 Oct 2026 08:48:55 +0000
Message-ID: <20261028084900.1047287-1-johnliu@nvidia.com>
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
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60E:EE_|DS7PR12MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: f4354b01-3551-46be-1d45-08df34d060e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|921020|11063799006|56012099006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oHiNl8VY6vcO96fo0MrsXT0oC3SL45ckMGsFx4oF55e5ECTNucK3tAdtji6PF1bkaNnnhQ8/sf7kWu5xbSZ5LrdJgMKaigINfYLORAgAP+qbYRkDg3Pss9aIVVgifDn1UIS1GkOP7iu6X8IY1YRQIvm2OiqOmTj2oypZpK1hOld7yMhp5hRV7WdsH184ll2QQB1F565XOW8ZF2FFBY6Z6ZymHyoPfcoFwcEEMjgJtTXlO+GZEqzb/XyGVqQmtasFQWM+JxqqqE8vDjxAyOfeVtIHk92YlFKaf0RBdDt/phCytCmt6Pp2udkgjeCf5iDMaP0+WDrdIXz4JHWMdZxixzpLIHYIYfXttbJ2itUuUz2OExgZQOjcILk72RO2zzv/bGEr3iHTtFG/55EJg9fhJ09/dFla+CS3xS1+sy5sWxGHkbFNIT2NRhz2iGE++A2dvMtlzJgJf6/NJ1EyqFwUrBoNwkzFJxx6o1OTXXhz4W2a7N61Pl84y4F2OQV0mmiTIFKecZF9WSKf48qHLyxaY0F3i1hzlXDi5z2PBDvwYJk/dhzN82xl0F77MYloAhb5meJxGxxBrNx3BD7WsnnhsUsWSIy489+zVgJHqGBaCbgprEY+ArozY9129UVbEqJ65KorevGus+PS7ce0uNRshSDQ7ttV9WHfYCBtL01QulTaqU8JDAn8gYhwPXb06C+LQtd9r3+obggxYuXcrTD0v60Z4S/nM3NzJ7TLLn3MPOpU1y3GXETnEdPK1daH1LaJ
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(921020)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dbfkqbg5b071JP8kHo3UfPQlka3wQZS2nfAKfg1VwmOziKci5yd/X8+swFEpDOtvU+wnyuNtYt7+ZjdWajXc358ZJz8fFWE5RWRT5EnYKYkWsE6ZK1Dx1EX1Ni0KokINAX6ZFDNlmNkkmpnynY+zRhK+cDjDFhK56NNR1X0sbiHft1Z/kQMF0H4nXoyUdLZAx09lenAdxrsj3l2J8fUmAtC9eSYIkDgF6dTsxKNk89tevdKbtlG/pc7Q1dro5wanXJuTxJNZZe/mJ+/o2TYH5f+O+EyM2ST7QqdIjKZZ8T8dzKrSPR/G3kTW+hZrg1IzqkcrtL2zRib5ByuyxkwdyBEwafmER9BNaGavAOaMqLL5/NODI9L+/Sm6Rfi1fupSkCgXs4HPyWwwPOf5FPWZHW1ScQHR/YUhJNqaBapeqJ2bFM8K2lCIgiwrAFH/Wwju
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:49:29.2181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4354b01-3551-46be-1d45-08df34d060e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8230

EMC clock scaling is handled by the BPMP firmware without kernel
involvement, so clk_get_rate() on the EMC clock can return a stale value
cached by the common clock framework. This series makes the EMC clock
rate uncached on Tegra234, Tegra238 and Tegra264, and adds the pieces
needed to identify the EMC clock on each of these chips.

The EMC clock ID differs per chip (TEGRA234_CLK_EMC=31,
TEGRA238_CLK_EMC=43, TEGRA264_CLK_EMC=290), while the
"nvidia,tegra186-bpmp" fallback compatible and the tegra186_soc data are
shared across several chips. To avoid detecting the chip at runtime, the
EMC clock ID is carried in per-SoC BPMP data selected by the device tree
compatible.

Patch 1 adds the Tegra238 clock ID header, following the format and
naming used for Tegra264. Patch 2 adds the "nvidia,tegra238-bpmp"
compatible to the binding. Patch 3 adds dedicated SoC data for Tegra234,
Tegra238 and Tegra264, selected by their specific compatibles, and
builds the BPMP driver for CONFIG_ARCH_TEGRA_238_SOC. Patch 4 adds an
emc_clk_id field to struct tegra_bpmp_soc and sets it using the
TEGRA*_CLK_EMC clock ID macros. Patch 5 then sets CLK_GET_RATE_NOCACHE
on the clock matching that ID.

The series touches both the clock and the firmware code. Patch 5 depends
on patch 4, which in turn depends on patch 1, so I would suggest taking
the whole series through the Tegra tree with an Acked-by from the clock
maintainers.

Johnny Liu (5):
  dt-bindings: clock: Add Tegra238 BPMP clock IDs
  dt-bindings: firmware: tegra186-bpmp: Add Tegra238 compatible
  firmware: tegra: bpmp: Add Tegra238 support
  firmware: tegra: bpmp: Add per-SoC EMC clock ID
  clk: tegra: bpmp: Do not cache the EMC clock rate

 .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
 drivers/clk/tegra/clk-bpmp.c                  |   3 +
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp.c                 |  61 ++--
 include/dt-bindings/clock/nvidia,tegra238.h   | 279 ++++++++++++++++++
 include/soc/tegra/bpmp.h                      |   1 +
 6 files changed, 329 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h

-- 
2.43.0

