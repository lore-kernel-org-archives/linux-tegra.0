Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DC30F7F3;
	Wed,  8 Apr 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683527; cv=fail; b=sy8pBuYnL8NaQPxeW6kEnG+KdnMXCumLAVZZRLNGR8lFJDYixLdU1ZBDOIa+FviOh1pnd9A7uGoARC/dqTUXzT5VHvz6Awd5HrBMX02qSBSaowyx289En2JHZ5mWMl77FTlefDTgMlVl7fsNMWYQKTTcCzxfKnSIMAF1ah3oxOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683527; c=relaxed/simple;
	bh=g846JjvWG4WhfJ3hN2NgLOI0yIAMgfMRAKuroKIb7dA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ap+ZIKUZmHzWVUqphtET0qaUVvwK1hhRXY4JssF0JMb2TXffGlDiIR0o4pCUtWYit0zcBEde1CRuYUuhUNe+2iiTx9wJ/cOAJhp3nRn4UoJsKdSkPt2gYtkBiRRfSJNFHCaA30N9wQPBku/LT7QXbzq8tC5TR+y8ns1cubjEBRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mgy7HOrs; arc=fail smtp.client-ip=52.101.56.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mgy7HOrs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwXRUsMiRtr4vxoNe4NVxGRkD/auXYINNGLjg/DphniSEhu+o+fGjzvfqY3v8IA+bL4uQA/M4jfA78O2vJJl9svhxVc+n1zEjHxcTpIjJRGeI+BoaOcKPFirdsvG9l2BMmN81UbY+k7nq+odv0NTLseSPvwn6ucBpnWz5MpBwg6sl25yI2NrCXHd7eD0mHVxMfcuYGMakGpTD5zAtItXCeKlnQW0xaWrqWmwD4q5o1WzyhG/VdbE0PzWLF2FxDutnar0gRKggWCxDhm+menVQURTThL1/3T1mKVe9JiGyUKyXSOBGQ/oq8o+kSLVCYriYgIso4raFv5fOZ88AGlmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=az7i3yFJClaQFHZd5y+MNbffAWModNfUk7UGn5JhgCo=;
 b=EnvREW4U/3RXsgDCuZ/6yemHOTUv2vuI0+Kcvz6HpjsgIiQf5vdnoxxlKVXaOAFmNizRIfWINIculXfABHKFEDrK4MCFmCGY7XRwvhHHF6yxHUg8v/RBZ8wI4AniMG/s1BoDN9DXKrHgiiLDoLGqWDfrN0/kDHeExPsgBNZkUc49hMdHIzMEochJGX9PgBhsbQ00Wn8m6nCckZPy25svroZOqdWE561MsQzdSkPdnW4Lqbf5AtKqR2GLSeRJcw4HjH8CfWjLrhZsMPGkXo3Zdo3pkr9KYaga9UlPg1eVO+x0+i1vtKORwVX3a2jCi1fMzooDXKMxQjX+E7fkOEOUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az7i3yFJClaQFHZd5y+MNbffAWModNfUk7UGn5JhgCo=;
 b=Mgy7HOrsWH1+wsk9mTpvc9Z1F3X4g7JjMvjp5z+kDtOtjzM2dxXPFN/twEm0+SpirX23W2QqjtxHhNcekMOfsNwdl6VZ2QwlVNfg+nlKNW8PaxsyAhsuilHVB8VqYdfYr1dPvl3LYhicnZ2Ak9RPvDizOTwCRyGo5u70hJn58DlA+y/kDUsa28UztF0lCqMaXpqaumgz4V2106pzuqsrv9WLQYyCttVhhf9sF49kQ0eEJt/BpexVWPkOgAhsWhJ2CH/Rg6HZlWhacNipWX61YOGbPsIR5J4WSf7QwLiG5ecpRgOAtaRLiOadTcO1ufdl5Tv8E/u0u8B/NqL2lo0xBw==
Received: from SJ0PR13CA0083.namprd13.prod.outlook.com (2603:10b6:a03:2c4::28)
 by SJ2PR12MB9087.namprd12.prod.outlook.com (2603:10b6:a03:562::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 21:25:20 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::67) by SJ0PR13CA0083.outlook.office365.com
 (2603:10b6:a03:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 21:25:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 21:25:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 14:25:00 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Apr 2026 14:24:58 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH v2 2/3] hte: tegra194: Add Tegra264 GTE support
Date: Wed, 8 Apr 2026 21:24:12 +0000
Message-ID: <20260408212413.217692-3-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408212413.217692-1-suneelg@nvidia.com>
References: <20260408212413.217692-1-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|SJ2PR12MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: e79c1905-c627-4cfc-ff5c-08de95b55636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	M7XDJTbO9JWmYQ0LtgErug0S6TotfJpd7xPLf5osIGVZSqR7TeirsfZB1INqD0noHZfEZeegixzrJ0BITaXjMlDYwAvDNTBmAGSU2/sktoU+M8Pza2ejqhYzvk7NbUbB8QJUW4L9sZXtTm/JF9mzpDcbVP6Ci+QSWj7TmCNhfY/zHBGp+rFKmF21/02Pk7tQZRpJDt0s+LkVNkxeq5qX2Hf4y3GUt9YOuJJzDi7X/OTFmA85lyz47aHKuHTi4jNhVXrEVQgjoRu54HTEmOEL231uL/DJ63kpsPYud8fxZtWS+zYQUUyMZFuNfNLExLRc28mgigusENiYHA7TgqsPIsV0pfPBLe2vn/cvefUKmjoM4aUqNC9sByL2eLUKcJlYpqhmIHmzyivqo0olAYckJOWqT9pUmR21uQUvcjJand7zy6W2n76nU3N/3SlstXYiAb8EyJq+dtMlkNTjDvZmo3x66yBzE94lxtp4z428zqz7Hb7HNJoP3piW5O393T3vrK9Btccy73vSTdu2SVoa/eGSWw5vapwAJVM0432y1XVyOX+YmFvALjtzeh+n5Sg/FnG3PWRn83eFFF+9mxb7UeFpKassiD17X7yVIDOmf2iOXp/mqXa9x3ApcfeCLA+Ie3jnzGCg+ogZCeuM2Yp+YEsDXGnhKwNa5KTMo4seCoMKIMW4sMhkRWBdlWqLProZO7sDazTdo6F6E0zBpgnVjcLk6JqL2g8GgZVejqLbeZ36LD3i3yzrpB0dAHP9BuYVPCjE10b8ebc+sSGcw0M3dDVhhlkNtHdfqQqc2hkZPxwTOzPHzqivT9PQvLaFWT9H
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Uv10TAYKvHXw1LsnuRQ6p2GTYX/w2erwzaMtCqYv+IcSCytfJLSYekWucHHV22qH80hAEFHfKEi/WmDaSevdTEckeY5Bf4meJhL02bMqHE12v5kF9O5r2QdVKOFdzIaXF6pUcyPCqA+zCDAwN6oGXX/jfMNSkc4vNF8UVSmjvsxaKgKNlA9qIkbLx3e0Yc8ynlSzEdbIVBvKYk6INiz5thhA82Q8kCPJoW/qTJCn1iAOF3te/onhXKfwCkJhm7Qb6H846gPUsrHBnEJne4mtlHLvrT8/pMCxsahfzRR6ose6T6rZnCPKYn/CfOPoqdy6EnVUH+EBTX6+Cs5bps1jC43cmwRf6OxbsOTxCbv+HDzvhFMjbqrOYD81Z6P96vCduzLl76jFodgYwAOaf8vR1lUGYk0Sbijlj0KescKSnG5duZQqEdCGrX1vU0JOK7eP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 21:25:20.0010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79c1905-c627-4cfc-ff5c-08de95b55636
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9087

Add AON-GTE mapping and LIC GTE instance support for the Tegra264.
Move TSC clock parameters from macros to members of SoC data
as values differ for Tegra264 chip.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
 drivers/hte/hte-tegra194.c | 133 +++++++++++++++++++++++++++++++++++--
 1 file changed, 128 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 690eb9be30fb..4a7702b32b24 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -20,10 +20,11 @@
 
 #define HTE_SUSPEND	0
 
-/* HTE source clock TSC is 31.25MHz */
+/* HTE source clock TSC is 1GHz for T264 and 31.25MHz for others */
 #define HTE_TS_CLK_RATE_HZ	31250000ULL
+#define HTE_TS_CLK_RATE_1G	1000000000ULL
 #define HTE_CLK_RATE_NS		32
-#define HTE_TS_NS_SHIFT	__builtin_ctz(HTE_CLK_RATE_NS)
+#define HTE_CLK_RATE_NS_1G	1
 
 #define NV_AON_SLICE_INVALID	-1
 #define NV_LINES_IN_SLICE	32
@@ -120,6 +121,8 @@ struct tegra_hte_data {
 	u32 slices;
 	u32 map_sz;
 	u32 sec_map_sz;
+	u64 tsc_clkrate_hz;
+	u32 tsc_clkrate_ns;
 	const struct tegra_hte_line_mapped *map;
 	const struct tegra_hte_line_mapped *sec_map;
 };
@@ -317,6 +320,94 @@ static const struct tegra_hte_line_mapped tegra234_aon_gpio_sec_map[] = {
 	[40] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
 };
 
+static const struct tegra_hte_line_mapped tegra264_aon_gpio_map[] = {
+	/* gpio, slice, bit_index */
+	/* AA port */
+	[0]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
+	[1]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
+	[2]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[3]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[4]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[5]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	[6]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+	[7]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
+	/* BB port */
+	[8]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
+	[9]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
+	/* CC port */
+	[10] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
+	[11] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
+	[12] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
+	[13] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
+	[14] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
+	[15] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
+	[16] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
+	[17] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
+	/* DD port */
+	[18] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
+	[19] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
+	[20] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
+	[21] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
+	[22] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
+	[23] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
+	[24] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
+	[25] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
+	/* EE port */
+	[26] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
+	[27] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
+	[28] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
+	[29] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
+};
+
+static const struct tegra_hte_line_mapped tegra264_aon_gpio_sec_map[] = {
+	/* gpio, slice, bit_index */
+	/* AA port */
+	[0]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
+	[1]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
+	[2]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
+	[3]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
+	[4]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
+	[5]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
+	[6]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
+	[7]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
+	/* BB port */
+	[8]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
+	[9]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
+	[10] = {NV_AON_SLICE_INVALID, 0},
+	[11] = {NV_AON_SLICE_INVALID, 0},
+	[12] = {NV_AON_SLICE_INVALID, 0},
+	[13] = {NV_AON_SLICE_INVALID, 0},
+	[14] = {NV_AON_SLICE_INVALID, 0},
+	[15] = {NV_AON_SLICE_INVALID, 0},
+	/* CC port */
+	[16] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
+	[17] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
+	[18] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
+	[19] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
+	[20] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
+	[21] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
+	[22] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
+	[23] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
+	/* DD port */
+	[24] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
+	[25] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
+	[26] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
+	[27] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
+	[28] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
+	[29] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
+	[30] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
+	[31] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
+	/* EE port */
+	[32] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
+	[33] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
+	[34] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
+	[35] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
+	[36] = {NV_AON_SLICE_INVALID, 0},
+	[37] = {NV_AON_SLICE_INVALID, 0},
+	[38] = {NV_AON_SLICE_INVALID, 0},
+	[39] = {NV_AON_SLICE_INVALID, 0},
+};
+
 static const struct tegra_hte_data t194_aon_hte = {
 	.map_sz = ARRAY_SIZE(tegra194_aon_gpio_map),
 	.map = tegra194_aon_gpio_map,
@@ -324,6 +415,8 @@ static const struct tegra_hte_data t194_aon_hte = {
 	.sec_map = tegra194_aon_gpio_sec_map,
 	.type = HTE_TEGRA_TYPE_GPIO,
 	.slices = 3,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
 };
 
 static const struct tegra_hte_data t234_aon_hte = {
@@ -333,6 +426,19 @@ static const struct tegra_hte_data t234_aon_hte = {
 	.sec_map = tegra234_aon_gpio_sec_map,
 	.type = HTE_TEGRA_TYPE_GPIO,
 	.slices = 3,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
+};
+
+static const struct tegra_hte_data t264_aon_hte = {
+	.map_sz = ARRAY_SIZE(tegra264_aon_gpio_map),
+	.map = tegra264_aon_gpio_map,
+	.sec_map_sz = ARRAY_SIZE(tegra264_aon_gpio_sec_map),
+	.sec_map = tegra264_aon_gpio_sec_map,
+	.type = HTE_TEGRA_TYPE_GPIO,
+	.slices = 4,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_1G,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS_1G,
 };
 
 static const struct tegra_hte_data t194_lic_hte = {
@@ -340,6 +446,8 @@ static const struct tegra_hte_data t194_lic_hte = {
 	.map = NULL,
 	.type = HTE_TEGRA_TYPE_LIC,
 	.slices = 11,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
 };
 
 static const struct tegra_hte_data t234_lic_hte = {
@@ -347,6 +455,17 @@ static const struct tegra_hte_data t234_lic_hte = {
 	.map = NULL,
 	.type = HTE_TEGRA_TYPE_LIC,
 	.slices = 17,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
+};
+
+static const struct tegra_hte_data t264_lic_hte = {
+	.map_sz = 0,
+	.map = NULL,
+	.type = HTE_TEGRA_TYPE_LIC,
+	.slices = 10,
+	.tsc_clkrate_hz = HTE_TS_CLK_RATE_1G,
+	.tsc_clkrate_ns = HTE_CLK_RATE_NS_1G,
 };
 
 static inline u32 tegra_hte_readl(struct tegra_hte_soc *hte, u32 reg)
@@ -574,12 +693,12 @@ static int tegra_hte_release(struct hte_chip *chip, struct hte_ts_desc *desc,
 static int tegra_hte_clk_src_info(struct hte_chip *chip,
 				  struct hte_clk_info *ci)
 {
-	(void)chip;
+	struct tegra_hte_soc *hte_dev = chip->data;
 
 	if (!ci)
 		return -EINVAL;
 
-	ci->hz = HTE_TS_CLK_RATE_HZ;
+	ci->hz = hte_dev->prov_data->tsc_clkrate_hz;
 	ci->type = CLOCK_MONOTONIC;
 
 	return 0;
@@ -602,8 +721,10 @@ static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
 {
 	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
 	u64 tsc;
+	u8 tsc_ns_shift;
 	struct hte_ts_data el;
 
+	tsc_ns_shift = __builtin_ctz(gs->prov_data->tsc_clkrate_ns);
 	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
 		HTE_TESTATUS_OCCUPANCY_SHIFT) &
 		HTE_TESTATUS_OCCUPANCY_MASK) {
@@ -621,7 +742,7 @@ static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
 		while (acv) {
 			bit_index = __builtin_ctz(acv);
 			line_id = bit_index + (slice << 5);
-			el.tsc = tsc << HTE_TS_NS_SHIFT;
+			el.tsc = tsc << tsc_ns_shift;
 			el.raw_level = tegra_hte_get_level(gs, line_id);
 			hte_push_ts_ns(gs->chip, line_id, &el);
 			acv &= ~BIT(bit_index);
@@ -656,6 +777,8 @@ static const struct of_device_id tegra_hte_of_match[] = {
 	{ .compatible = "nvidia,tegra194-gte-aon", .data = &t194_aon_hte},
 	{ .compatible = "nvidia,tegra234-gte-lic", .data = &t234_lic_hte},
 	{ .compatible = "nvidia,tegra234-gte-aon", .data = &t234_aon_hte},
+	{ .compatible = "nvidia,tegra264-gte-lic", .data = &t264_lic_hte},
+	{ .compatible = "nvidia,tegra264-gte-aon", .data = &t264_aon_hte},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
-- 
2.34.1

