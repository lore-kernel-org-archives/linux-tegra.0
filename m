Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621569;
	b=lpae4Cnw9n4x6GI33BOSTAFgf/me+N4XoqTCoBmAe2IotKLnpFUNt+Ih8zWM1mQa5Oc5
	 oD1r1OoXwrG9r3zWmeohPJpddRjEwGNa5PluceLsG4EJ5qpeG48lwOwm0bxTLSOriks59
	 nrDPt2uI1ym04tKOk+dsxEmhmea+IfW5y40xdhF1Dt82DPo+FDZNkweLUdrRoql7k1HAq
	 zl54sy+0+j8IbcisDRNXcY3rdPDz6de5K/VwUyQqiHbYTPnKX7G66ULFg+CUVW7/8sFJS
	 eYt4fIEsWDF4QefP1W/lXxrqRVd3Hve4YGpu4Mms9Rf50+KrFxtzX+UTHKknGROFBkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621569;
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
	bh=EOR++eQOsoPBWbYUSHZ+DweoruthhMhxynC2infwLXU=;
	b=wDdMxsJJgG/lGdrFi3Uj24e5dXSe5/W6wVaRQcsC/PuW1RwuJUnqGEBtP5sJ+ezzbUG7
	 8SG7ucQCRPqbE7XeUsoza/GbChhDAuf3CwGInsasrJEkKb90OsA1RDRBTbvTx/fmbOCMO
	 9gHVHgs1Br7MSphAoWWtUSoVnZ4dz8mcC1RYJegsGXl1ndElEUAb1686/qOJoYgauLkQG
	 FDDXI4/eDITmH1FXGvUloLlh9eLVB8Tkm/RU0Ga/T2TPgj9juz8rsXIZ36gTbFWCgYfHq
	 77jecIXsyhTrpc92qgDVzIeXTtbjh5zHO0QQ/i4r6E2hA9ekUdiWZUqo/nat0HClAww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G0qmIfeV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.15
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45269606A33C;
	Mon,  2 Nov 2026 12:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45269606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G0qmIfeV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaoq/sIaNiGHCPCILI1t8TqJErCiHKBUoFR7r7B+b7JQIbfkD5qZ5XFMCb2Opx3Igj7c1iXzsUfqk7TAUzr9mh0cwFJnUzP0ezzJn8+iFTFdfuNxcnpK4SMvCnU0UucFEeY9bQ2JAiatvuhnRn0RrYzUhDKdmTivGUM149BUF9ii0c5fO5ugmuVF1wCUQrGnhAFoq6g5d6CF2SrGPmv6i2JceKAWd0w3AYFPxYd2XJI0Qe2BwDSBQArmie7HfbH/CDKIkjUXdZ0F69S/wpP+CWn8LwtiTm1+qnQVI/ynM7eHyTTmHYOYAyKloiANYBiZLb28ETTv+5Q/LCtxDldOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOR++eQOsoPBWbYUSHZ+DweoruthhMhxynC2infwLXU=;
 b=x9BSTEX4rKiy9NW/hgUvMd2CUHvf+0UQL9JIqGvv3GA+6UsWi2IhI5GS6PYJXCuZZRU4uMw9d/eiJf9qZYJe/Qgc4VP2Y77PzFj5D3YElJm5WIpdbaVIMbM0iWPmIOQan9+4TIhgWz1SycYhlCo2XwWohXxCR356Lcrv/0jjkfWMovcJ1DjiW7vknAPamKZhqf8fuPGp/81Fef0tC62KTPxbytU91tMFIzFTrmlFuGRv1i6uPBNxQj32wzAAwB77OmVtwvxWWwUoGxYOKEj9U9qSBm3TjBZQQ9iNDhD9VMVxCnlxuUf1w5xkoRuACR1bcMtUmvOFvK+CWtx2iKBD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOR++eQOsoPBWbYUSHZ+DweoruthhMhxynC2infwLXU=;
 b=G0qmIfeVSfdO0VVvlOCVAJZ2rWs+2NHRqoATWdw/kNdW/LIJu6hxc1KF1naPQO7v7dCEQtUitBqwqKOzAtLFUxnXmRxcGecBKC529/FOqM/pXfrNxTPEp2uA4yEicgfTzhv1cfgqfIvaZV8Ny9CfvdDbzMsqH9aDObCT5ePX+nxbWfso7gO8XTNT4+ZxgqM3xmjREQVV4nwdoHwraJDHeqvIVnMTKy98nIKKke9pJgOHtBQwBHIsXvyL2n4BNni/SKWxlVsykr5+OCVngFFSpqIPGLUEcP3t1VGl6r7ewCsgMp/0kq1+mh0ChYnYkSJ3pk6xS+1dpD86CKys6qTnCA==
Received: from PH8P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::32)
 by PH7PR12MB6444.namprd12.prod.outlook.com (2603:10b6:510:1f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:12:44 +0000
Received: from CY6PEPF0000004E.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::1c) by PH8P221CA0014.outlook.office365.com
 (2603:10b6:510:2d8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:12:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY6PEPF0000004E.mail.protection.outlook.com (10.167.247.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:12:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 04:12:24 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:12:23 -0800
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
Subject: [PATCH v3 2/4] firmware: tegra: bpmp: Add per-SoC EMC clock ID
Date: Mon, 2 Nov 2026 12:12:00 +0000
Message-ID: <20261102121202.2431928-3-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102121202.2431928-1-johnliu@nvidia.com>
References: <20261102121202.2431928-1-johnliu@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004E:EE_|PH7PR12MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: a16fe91c-0012-42fe-bf4d-08df38da9977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|921020|261021123027099003|261021121427099003|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IcCDGlkujm2V6dZqgpP+OeAnTKq3TAI7rmmI5AQBT+UzDdyz/Ekb2zQwIuoJ29PchWc+cWBHmuvloaZrX7Fm34S1ymUOUVQ9Y0plEkA0guZAP+YKdwYYAn+9KW6xXJOBy4AbIKAu8dHZjFesntlQWINHLwCHYmF8VdcLkuob59N7cBIFO538fRdqsHuwsMYQBnPojD6doXSAhHmp2Zz/sdYPRIFvZf+GurFpp1zgAB05t4uDXSY2kQ1czhJIgXSHtg0EtTIEfDs7KAM7aZ20yZnFNdxj2zz9+6bvyQqais4PrAaZ4EQ3Yv/97E3cNdX9tZ9WPQGt/Jnj5CZQGcn6n5J7YetXiZ4jzdV1wrF/UZoC0vuKuHJghwvaWih/w22PAwqY9zQjLTxfdZnjqwyTMLQ2UUWAV8k9WF3tD7LPM5E3H3M3UfDOAC4T0TSKbeOlgSoP0Dml1Wsu3VADi7j8Jrx7fiGU3xblUYXXjjAZXDGwzniNRwye4HE8M/IwO8fWL1MqoWHglOThLgRVFMtlEKFLoBa0/tPeUiCGVQEcDip7Qk1XUxFm8KmeV+cQtlq8WFUHIYf7B0vOvKrS2mqMSpu3dlEcSH4LDKWn2/RHFeYa+xqo60mUCBgSNiRbGk2PoeTRLNQdSOwGMEf0R63g1Y080PX595vcQV7T9AgethsUNl2zuyzrwq2NY7YV30ADOyl2u+2nyN3g37lk9ONYYtNk6BZNiFoSoI2LnAyGD3XSCjxyB1rY+csULTf67TNu
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(921020)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C6XenhkU0kFSGhmfFyfQoyvmq6SLzGTmSVrdJuZVOPWkcKiqBefQxjSMbz2I7OUaMtM5dBSiX50nOffQu5Vb7Xj/xAa1rfWlizrTLcHesq00oNS840EUscnHFtoHRaq+Rvw570MP++QRvXs7uSuA02izXTptp6B3DghmnoubWTgsg9YYm7PuMTLMwsUrDLz3TTx0iUdd4GL+jit28Ua5fzU5Lx8qNXj2DXX3IsXAppcb2P447Ag70t1Tzktgnxp4h8WJeCQyNHqnkWGjDPFdE/Rhs45mBrFRaWhk2wvcWnK4bhijLlWndoc/3DSb4F85qqSe4efA2Aj52N5jCYTMIHzTRPDLZJbzF7+t3qHVgbqoOXolNHZ0x4TrLy/04bxN4Qipeiy70X1ZCt1EhABrDYMACpB4W6tDbgssbEYoeA55ajlpeHMjM7qzObNkNMvE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:12:43.7505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a16fe91c-0012-42fe-bf4d-08df38da9977
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6444

The EMC clock ID differs per chip (TEGRA234_CLK_EMC=31,
TEGRA264_CLK_EMC=290).

Add an emc_clk_id field to struct tegra_bpmp_soc and set it for Tegra234
and Tegra264. The specified EMC clock ID is intended to be used by the
BPMP common clock provider driver to set the CLK_GET_RATE_NOCACHE flag
on that clock. Since the EMC clock is completely managed by the
firmware, the common clock framework must not read back a stale cached
rate, but forcefully pass the request through to the firmware to get the
latest clock rate.

To describe such chip specific properties, give Tegra234 and Tegra264
dedicated SoC data selected through their specific compatibles, built on
top of a common TEGRA186_BPMP_SOC_COMMON initializer. Tegra186 and
Tegra194 keep using tegra186_soc.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 52 +++++++++++++++++++++++------------
 include/soc/tegra/bpmp.h      |  1 +
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index d3508e98e338..5d97a8600fd1 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -21,6 +21,9 @@
 #include <soc/tegra/bpmp-abi.h>
 #include <soc/tegra/ivc.h>
 
+#include <dt-bindings/clock/nvidia,tegra264.h>
+#include <dt-bindings/clock/tegra234-clock.h>
+
 #include "bpmp-private.h"
 
 #define MSG_ACK		BIT(0)
@@ -1132,24 +1135,37 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
+#define TEGRA186_BPMP_SOC_COMMON					\
+	.channels = {							\
+		.cpu_tx = {						\
+			.offset = 3,					\
+			.timeout = 60 * USEC_PER_SEC,			\
+		},							\
+		.thread = {						\
+			.offset = 0,					\
+			.count = 3,					\
+			.timeout = 600 * USEC_PER_SEC,			\
+		},							\
+		.cpu_rx = {						\
+			.offset = 13,					\
+			.timeout = 0,					\
+		},							\
+	},								\
+	.ops = &tegra186_bpmp_ops,					\
+	.num_resets = 193
+
 static const struct tegra_bpmp_soc tegra186_soc = {
-	.channels = {
-		.cpu_tx = {
-			.offset = 3,
-			.timeout = 60 * USEC_PER_SEC,
-		},
-		.thread = {
-			.offset = 0,
-			.count = 3,
-			.timeout = 600 * USEC_PER_SEC,
-		},
-		.cpu_rx = {
-			.offset = 13,
-			.timeout = 0,
-		},
-	},
-	.ops = &tegra186_bpmp_ops,
-	.num_resets = 193,
+	TEGRA186_BPMP_SOC_COMMON,
+};
+
+static const struct tegra_bpmp_soc tegra234_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA234_CLK_EMC,
+};
+
+static const struct tegra_bpmp_soc tegra264_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA264_CLK_EMC,
 };
 #endif
 
@@ -1182,6 +1198,8 @@ static const struct of_device_id tegra_bpmp_match[] = {
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
+	{ .compatible = "nvidia,tegra234-bpmp", .data = &tegra234_soc },
+	{ .compatible = "nvidia,tegra264-bpmp", .data = &tegra264_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-bpmp", .data = &tegra210_soc },
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index f55db918ccb1..40e2db8e69cc 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -31,6 +31,7 @@ struct tegra_bpmp_soc {
 	const struct tegra_bpmp_ops *ops;
 	const struct tegra_bpmp_mbwt_soc *mbwt;
 	unsigned int num_resets;
+	unsigned int emc_clk_id;
 };
 
 struct tegra_bpmp_mb_data {
-- 
2.43.0

