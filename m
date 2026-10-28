Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202654;
	b=GzR2BHqNbnRRhScXANsviVyFfDqWEsQvgjSUw0kMgcpG7Q7Qf1zbwtg/yaQbaU8bVizL
	 sP5f37p7CR9PuoEhKHLh2KvsOjCc7oJGuuc4rLYR5GiO5nZBqjkkkL08udEDSDrGLka/J
	 AQ9o71v16ZuTB+RwN4hSmkTXLnCf7R4XnkdP1pwgceyLdOvXjSdiqdyYRUJSHse9sTzB4
	 TsNTe0mK7qKuCsaVR5c8gK0nlKlClaQBv5uTNH9RL0q0En4ijXadLE579LchyLTxQlPWY
	 xco+m9rSIjyQ5xrzLDUt6U+gJ9eBOKK5hcm5s3dQ0WIQplpnwxV6cspNj07pFB2Sziw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202654;
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
	bh=x4FFkLpZUVfzK2T2rbN6iaNnWcjlkKZgvyXvy/kjSTk=;
	b=5g8dCDg5Hz26YYapu47eVj7nfzWoouT4QtQq/6FrZpLB9QanvtTJqsBEcycTUtSOmfdb
	 XoNzadV49m2gHpaGqBaKlr3nyOBYp2Un3/qJvK/KrOSHmXzkxWNyuL0TDk+EvGPWrbA/S
	 Vd4A/TvShnDjn68EjWirHvUQcpadMT0F3TlnFh0MSCAOX3JVvLsKpSQB0bkN42CpSg0tB
	 azjmFIaN/ktxNkFEIMdNIlao93cT7iFkoMV7w2RIO37ethPKi1eKltMDQ/j1nyyyzeqZg
	 gj3+t2G1wF7L2132UW83DlXfw3Q9Y27tnXr4XQMTjg2G0eaW0qN0CJwyKO0I5y6XH/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IPAcTmDZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.59
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0424606A31C;
	Wed, 28 Oct 2026 15:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0424606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IPAcTmDZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTErKlz5RiyOD1vQvY7VzFQ/57ow/Ui2w7KWGnd/an+7s1Sxp/AQ/uUzDr08HZ53/dno8R+TcYFsd4jmU2ugTyiLUExYbTgNUjC3N7GmnOr4369CfqWDz3UbY+Fs7+6Kfz0mQJpfY6SUKEho6XwYkdApCqahAUlbWmu1Jq5Mefg28JNu25SbwYJ2zN2scYoe/EQJycvDzjOPttg9pA+Kgh9s5qJ9uozvZIBgrzstrCeYLXrBuxae/4htA4fyYtYpp95hK8BmQYkSf4C/Z05qK4/7Oi1pnDRpcQUEhyFhZ81HWdLkCAzpfdLTE6rUJHUxzyNpD4SQLV0zkFXjyhAxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4FFkLpZUVfzK2T2rbN6iaNnWcjlkKZgvyXvy/kjSTk=;
 b=PlYaEhp+b2bmHID9TO0x++cWdg1AM4Uas1E/mq1+Q5KEuV3jkb8BPvFc3t9Egochz2oUaCuRiugieQpAmrnn1I6uoDY06b0pBCH1sEzTRcgUjOWGcPG+dXOc45yAM5KXTVN+cocJVdPHHdV6crA9IOoj0OQ9bU46BogVCggy71havhBBk1+/ydLYu3vdseARCNfSViUFcO6xZbcAyLBe3O8MR2ULbaIB+ITwsWSOqBUY2zJFRggAr2jK6HX46IA8Wtm0eOELQZ4HAofMriSd0f4dKt0sCIIIT5uvQmAjq92Rcc8TegvUGBrK4ATcPEzfpURd09pFIscqRq0je3LLJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4FFkLpZUVfzK2T2rbN6iaNnWcjlkKZgvyXvy/kjSTk=;
 b=IPAcTmDZJMoDw4+pAVhKQsBsvUc82DuDaqkRY0IjBCV/+nGuptMnL60U8kqKAGSwzFy0YiM/6L9fiKd7yN1a50URodQjIoZ3u+FiHGAa7CKc7CccuyuqcZcGFmtLAhvZvnKF3F7PP3u/DKM9hs+h5ifTeEE6KbsmPCPY78wBzPmvNFbN8xqD64yU4Vi03gA7mnAJJYzCEqBDq+SVMpdPsT7SVjIVow8GbW6KF4Gs8qsWqOnkIOIKIRA509Kn8MdUMjRU2DKPO6zcLyBdEjeL+5EmYV0ktLoKgPuMluOdQgojWCOOXWCyt6bSXVUCTk93lm07QUHMVCLhhU8fG+c1Sw==
Received: from DS1PR03CA0022.namprd03.prod.outlook.com (2603:10b6:8:233::14)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:50:48 +0000
Received: from DS1PEPF0005344E.namprd04.prod.outlook.com
 (2603:10b6:8:233:cafe::6f) by DS1PR03CA0022.outlook.office365.com
 (2603:10b6:8:233::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 15:50:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0005344E.mail.protection.outlook.com (10.167.23.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 15:50:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 08:50:26 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:50:25 -0700
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
Subject: [PATCH v2 0/4] Add Tegra238 BPMP support and fix stale EMC clock rate
Date: Wed, 28 Oct 2026 15:49:56 +0000
Message-ID: <20261028155000.1205739-1-johnliu@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0005344E:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2f0ed9-5448-4044-3ba2-08df350b3c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|261021121427099003|261009223027099003|10067099003|261022105027099003|56012099006|261021123027099003|261026121527099003|18002099003|921020|13003099007|261028144727099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	iuiq4izCsOzLQjo7TILr2FkPEJsnyX0FFUYsBH+Ot4LAzElg+JyF8835sPvy5EKM+Sk1L1EE+r3WMIsRe98xQUWj1+yeWEX3PMqZ37VXWWpRm8SbNIQy0ArD259xPRc5ZcGWh6Fx2PWoSv7N2kS0PJx+o+Rt2Lwh+Pgq/6TIEmNHeA0AZiwJu7QBuxEmBMp3vpGofUeX9pd1XttQaJCEF8tg8jdGotqf9LUviyXnag1yJxiOSSn39dtMBk8TWPsMusq2tc9lbadoa9HVZ5rjp09FEXHuf3jYG9Z5pETV1ZbZ8MQCzysQbAytuf3FVUujPTW9c5pe5oaY7zDJHUpB96oDkgYoxPmJLMgxj3LHx6ssKxAsSLxR2MZFIXQF8DQZAeGgq4bt4F0uI7GmUXk5xWwnbLdFMLi5MzWmQ0Wu8Ord708ojaZWCX/I7LlaD6KytPQFfUfOCjyzppHCScWx8oNLRElTmaTHhvxcBINEnhVlsUWr5Y4AcBtHV3UZ5FbV23Q7xkICjBN0ezF1JpFUqPviqWw/NhIwoztCLWmZY/Gi7E+6h3IrUJup+uMOnqFrqLVA9CD5r7vgev4Ayv1nsG6JJCATf5euKHhEdzaiPTE1dYPR55Op06oeB7OhOBmepZHlf4CkF2He0tak0GKHjL5WeRsb85F4jSjNqi8wZQuzAa5VcCzcJRSrUegrtMUGPBj0Gbhg+VAB30EBKkTkfovKvxEWnM1HE3WgzQdEvh7WM0zg53xXaufGK8RBWfBi
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(261021121427099003)(261009223027099003)(10067099003)(261022105027099003)(56012099006)(261021123027099003)(261026121527099003)(18002099003)(921020)(13003099007)(261028144727099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Iqwnb4RPmP6yzm+vSgonalAWmUhlCsKXm67dFYeuSCqqdYcGs0vujs7h88zMzmxPkMYZsNbqLdM5/Y0pinFmXr6Aa/+mVrxmdYVWgbD1TRbUAUg/Mlf2DBMtdAbCpDZtKuc8gq+IG+SpmYBOlO4geHUmTeKS04zbIw/9uG+hcirFBjJVbrhnRznrjlZlYy2ChRsII1nVJZLSo6wBcSlgBS5uEDMOA2kZt+XA1TOUB6s2N220aQ3PaomL8V1IfqfESqYoYUneY1wpDk0DNfO6w5gEh86osOTR6OU8OhWkP1FbhkpgZOi62iIaPY70bMa4uFnq9zcjApeh3c03NzZyx2INGgmDKY0Va28EGobH0IR4bGoKrSucny5sFqRJMYU+fFgQKo9qIHX+5atXwDRE0iFynoC6/jos1lSH01A54gsHODZusd721qwEZ2L9znuj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:50:48.3320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2f0ed9-5448-4044-3ba2-08df350b3c70
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0005344E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

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

Patch 1 adds the "nvidia,tegra238-bpmp" compatible to the binding,
together with the Tegra238 clock ID header. Patch 2 adds dedicated SoC
data for Tegra234, Tegra238 and Tegra264, selected by their specific
compatibles, and builds the BPMP driver for CONFIG_ARCH_TEGRA_238_SOC.
Patch 3 adds an emc_clk_id field to struct tegra_bpmp_soc and sets it
using the TEGRA*_CLK_EMC clock ID macros. Patch 4 then sets
CLK_GET_RATE_NOCACHE on the clock matching that ID.

The series touches both the clock and the firmware code. Patch 4 depends
on patch 3, which in turn depends on patch 1, so I would suggest taking
the whole series through the Tegra tree with an Acked-by from the clock
maintainers.

Changes in v2:
- Squash "dt-bindings: clock: Add Tegra238 BPMP clock IDs" into
  "dt-bindings: firmware: tegra186-bpmp: Add Tegra238 compatible".
- Reword the binding commit message to state that the Tegra238 SoC is
  fully compatible with the Tegra186 BPMP.

v1: https://lore.kernel.org/all/20261028084900.1047287-1-johnliu@nvidia.com/

Johnny Liu (4):
  dt-bindings: firmware: tegra186-bpmp: Add Tegra238 BPMP
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

