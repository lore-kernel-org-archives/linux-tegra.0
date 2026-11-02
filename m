Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621574;
	b=1+XElgk8g+njtxbwNUWGFotTEL7p2RLZrTnbl7jFEd2V1CikQyutoqG4tCCF6FJiA7Bw
	 A6H9Sz/JXo9vyxBiMpmfUnUZCclsHYEhIzr1ZRX2qxAzZooo0NZx/ncN5ZQbH252SJz0r
	 ESzBChrAMO1tl+lUkxNdaRlE0D+QkHDhJJ+LJ7li/8GXPBZdMHe0jr3TEyYa2+Ie5moD6
	 qGtgv02LP7LGCl2HIukhX603TfWJbQGfakKhnBGKztOHL1C83DUgED3s0xch63Rr5Kwz7
	 8mLW1XJLJa76kQCGjsYL+xDZyWpkOTDG+H+zrDrqNL0ys/d5q4ibZR7p1aSuesb5SdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621574;
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
	bh=N83uz287ypE+lJ2be0a4xg6FxNXxKUGLk+xH1ZmW/FY=;
	b=shY117YC18+vGBvigag1UueNsT7j7tUHaxD6o89RUEgXvckDiD4L1/HQk2I+IcifbV/F
	 Mh1Iiz51At4eCKG4MDqO5NimDxP7EJSBNCBMOl1g1BovAZxEFmM44XQ94fbmxm36tlbKO
	 H7RLTV5NOk9ZZD9BRy2CwZ15kB/Qh6gDvadIlAdKGGLJEiIq4szR/AcapKhYvZb5vMj7T
	 HS6gBSX74H7/418himm9RoF13Hd4qVMJ07NPMBSxuTGf9Zm2Ffxu0/hD5h+Ndn3Ibx/ZR
	 0q+EcMW/k9IXNUUAhzRaTJp2k3lnjVHU1q8nV+Mhm8/PbK1ErZRMYz9UILldkRjmkcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=chnK1y9S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.24
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CC960A2618;
	Mon,  2 Nov 2026 12:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CC960A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=chnK1y9S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHGhjuAhgtI6QzqDV7FHrprNxpFa2CEX0bWcKAln7uyfAIc+nxLGVD8x+kVjRcTcTtxQvuifpQTHIkoV8uINpRlYJjcGVrai4wYhjqm89o7+aJUypYakeUNMm68F7xTeV7X8GEqhKILJ3+wf9G0iRtOhfgjOR9EMdsbbkvTwpNAlCjS3aUBNBX03CpReVNHfbt+vqqT163DTJCib6ApYBVF+Re6YviIg6YWZ+s6vZYwiPL5JEgXFX7qXaX8Wkg2cj7cNRdNPx+Dfej1lvho3kZyAf9pNqMmnAhvuZ0E7dDgTxSZrusqCeNYkpmfJLj8CNMQAAdQb45k2BNWHKZtVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N83uz287ypE+lJ2be0a4xg6FxNXxKUGLk+xH1ZmW/FY=;
 b=Bm8f58Pvhqz2XnVkechbEeA9hCdMLyiaYDC1QQzyaAnDagXrj1CHDWiy3AMg7CkZQaxjsTqtqDqC8aShGw2AkHz0blwIyThU+KLtPiOQjdxuCBTWzhCRjucXuhcyDpYL+GNn9E/MQALXxdhrpfmARt5uYHPv7esK+8sYg+9p+wtnKYI39+zhZtKNzJI/NYuf3bzG22KvU6JB9BHvGwt0KiR64DUhpcpvFKz4O8uV7JolkrAGts5rGwj2IljShvi/pLd9BOTPMkPni7tl38nsxB7hp5AAdXdumqMVwckbuz+ovMpAvk/VNtaZBfwjzorSY94mRohAo7MoEJpvgLjwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N83uz287ypE+lJ2be0a4xg6FxNXxKUGLk+xH1ZmW/FY=;
 b=chnK1y9SAKESXKGqKvUe7WMj3Yw1uLC56LTh2ds7Xk7IwVhMFBTxw/yGL/E7Mg8hL/uOa9i2C8j7rbVNOo9O/0nZfXdBfbVd4ZhxbS5Ttde+AY0F9C5XDYtYUPdFejSNRU5RxbunZRsJVazQNxX/7HVrRrTuwTQEE/f78KfCe4ZIRfWdjPlp6D7Qsa0rJaMjssk/cB4GCda+b61/k6MZ7+y5uaYzbH3NmSIp7gCrR6Jrq9jv9V7IkyMLqqUnljZrY12dXSpQ/DnOY8UJplvhbl+F+Vh5lM0voRQr+FlSCWagGpysQ5Csrd459bdEhLVjAPRIolOqGTMhRqsRopSPtA==
Received: from BN9PR03CA0507.namprd03.prod.outlook.com (2603:10b6:408:130::32)
 by CHBPR12MB377964.namprd12.prod.outlook.com (2603:10b6:610:403::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:12:40 +0000
Received: from BN7PEPF000000A1.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::67) by BN9PR03CA0507.outlook.office365.com
 (2603:10b6:408:130::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Mon, 2
 Nov 2026 12:12:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF000000A1.mail.protection.outlook.com (10.167.248.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:12:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 04:12:24 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:12:22 -0800
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
Subject: [PATCH v3 1/4] dt-bindings: firmware: tegra186-bpmp: Add Tegra238 BPMP
Date: Mon, 2 Nov 2026 12:11:59 +0000
Message-ID: <20261102121202.2431928-2-johnliu@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A1:EE_|CHBPR12MB377964:EE_
X-MS-Office365-Filtering-Correlation-Id: 140048b2-1fea-4086-8abe-08df38da9730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|7416014|376014|18002099003|22082099003|921020|56012099006|11063799006|261009223027099003|261026121527099003|261022113327099003|261021135927099003|261021121427099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gEjNiDHbqjYOV1N3uk90eqWjGfj1jZ6Tx1WHiyehzz+ti1sS6o5/GJcEmYy4MpYYgkx4s4SeZpcH4wLfmtkVL4sqcaiG4tL2VaPqXOxxOlFdfmdGXYYSaBCNaV3JeKUMjccYgmkV0y4dWVjIYL1zYyKSo5vPS9DmCgZFwIm1u8EBawj4pieshg6cMjNqmEsGT356WOt+bDJy/GcgoJUar3YHln2fd2+8Kv7zlEqOW9camkvN/GK9JEMBz+vQP+vcgoASOS8ZC55Ydg2zNYciLESGovj5pF/n4FfjS8tHxlCvJLlmwon5F/5VosprWl4GBTBcxI+dlwLd1UgGoSMJfRLv/buP0/yidkVDjF+Vpg6drZtSpmgwqiadSOlwAzKCVltakvGJvOk4juEbB7cRT/Dv4AQkPvEIWESudR3cSHvGubyFkXkH5PAmbv5KQnoguzhkPqgHFnvt6Bi3v1/digg4Txs5n5LXCoYgV7w1UZMCQ07PLSFsi+dAbOfqywVrttx5ErIbXvZQOqsDIDaPFZDp2rE3usa8qwyEhnkm7tP58WsyfADmpevGOM/t3Im3qpxMrbjVeiwsWIRPfVCg1fXC7LN7WE/NrfQUM5fKjo4xVnkoCxhV9L1HA/hCnuj6CrhgyMj8wav4qioXVCaq8QdUiqvyr5X1fyZsEMXVoZ23MCdAInhPG4+zr15QhmconJC0igUYo1L6cswkiT36Z8MUt8YjVGx0aXzXFik7MEnnkYnhH0MMYphlrjfJdz6O
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(921020)(56012099006)(11063799006)(261009223027099003)(261026121527099003)(261022113327099003)(261021135927099003)(261021121427099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3VLeGwz7rjv0iYvsAuPqfmg1UYXbuf+54XYi321Lwp0H0j+ezE9z5gH7psNuBbARulZQpO7b2RIeWvu1jrVNgPgiDXm/nR64bHkGnp/DY8uF2GieGZuOOIroVlWr0ytiT8mcs2qjbLmaEgvOQ4mkvYXDixPASk6xcKkuJBCs8pq+pjMGPkm8o+Y3N8mlGyDtrSINl4gWNux12fEAdLWD0kJ5KFbiloS0Oi36xCMx2mLBs8PSW3ybwhp92ql1LDuKMIhuK6KIIsV66BGd8DThy5H+TwOagcgXtrMetbGPKP0kGnJDHq3ZezMEseTxXhLdCRnjI2w48lVQCb3PoiCwZVGzR5IxWwNiI8yMmzdJvRP9dNdrx4Ds4FbaoSe8VRkJFwie7S7WHHk1MegPHu+skVcIXebcNEsusdpzj71A17d8A2UYSz/6e4ugNFR5jZ7c
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:12:39.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 140048b2-1fea-4086-8abe-08df38da9730
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB377964

The Tegra238 SoC is fully compatible with the Tegra186 BPMP.

Add the clock IDs exposed by the BPMP firmware on Tegra238.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
 include/dt-bindings/clock/nvidia,tegra238.h   | 279 ++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index 3c44fe607e12..4011fdf4a54d 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - nvidia,tegra194-bpmp
               - nvidia,tegra234-bpmp
+              - nvidia,tegra238-bpmp
               - nvidia,tegra264-bpmp
           - const: nvidia,tegra186-bpmp
       - const: nvidia,tegra186-bpmp
diff --git a/include/dt-bindings/clock/nvidia,tegra238.h b/include/dt-bindings/clock/nvidia,tegra238.h
new file mode 100644
index 000000000000..31313302d9ef
--- /dev/null
+++ b/include/dt-bindings/clock/nvidia,tegra238.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H
+#define DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H
+
+#define TEGRA238_CLK_ACLK				1
+#define TEGRA238_CLK_ACTMON				2
+#define TEGRA238_CLK_ADSP				3
+#define TEGRA238_CLK_ADSPNEON				4
+#define TEGRA238_CLK_AHUB				5
+#define TEGRA238_CLK_AON_APB				6
+#define TEGRA238_CLK_AON_CPU_NIC			7
+#define TEGRA238_CLK_AON_I2C_SLOW			8
+#define TEGRA238_CLK_AON_NIC				9
+#define TEGRA238_CLK_AON_TOUCH				10
+#define TEGRA238_CLK_APB2APE				11
+#define TEGRA238_CLK_APE				12
+#define TEGRA238_CLK_AUD_MCLK				13
+#define TEGRA238_CLK_AXI_CBB				14
+#define TEGRA238_CLK_AZA_2XBIT				15
+#define TEGRA238_CLK_AZA_BIT				16
+#define TEGRA238_CLK_BPMP_CPU				17
+#define TEGRA238_CLK_BPMP_CPU_NIC			18
+#define TEGRA238_CLK_CLK_32K				19
+#define TEGRA238_CLK_CLK_M				20
+#define TEGRA238_CLK_CSITE				21
+#define TEGRA238_CLK_DBGAPB				22
+#define TEGRA238_CLK_DISP				23
+#define TEGRA238_CLK_DISPHUBPLL				24
+#define TEGRA238_CLK_DISPPLL				25
+#define TEGRA238_CLK_DISP_ROOT				26
+#define TEGRA238_CLK_DMIC1				27
+#define TEGRA238_CLK_DMIC3				28
+#define TEGRA238_CLK_DMIC4				29
+#define TEGRA238_CLK_DMIC5				30
+#define TEGRA238_CLK_DPAUX				31
+#define TEGRA238_CLK_DP_LINK_REF			32
+#define TEGRA238_CLK_DSC				33
+#define TEGRA238_CLK_DSIPLL_CLKOUTA			34
+#define TEGRA238_CLK_DSIPLL_CLKOUTPN			35
+#define TEGRA238_CLK_DSIPLL_VCO				36
+#define TEGRA238_CLK_DSI_CORE				37
+#define TEGRA238_CLK_DSI_LP				38
+#define TEGRA238_CLK_DSI_PAD_INPUT			39
+#define TEGRA238_CLK_DSI_PIXEL				40
+#define TEGRA238_CLK_DSPK1				41
+#define TEGRA238_CLK_DSPK2				42
+#define TEGRA238_CLK_EMC				43
+#define TEGRA238_CLK_EMCHUB				44
+#define TEGRA238_CLK_EMCSA_EMC				45
+#define TEGRA238_CLK_EMCSA_MC				46
+#define TEGRA238_CLK_EMCSA_MPLL				47
+#define TEGRA238_CLK_EMCSB_EMC				48
+#define TEGRA238_CLK_EMCSB_MC				49
+#define TEGRA238_CLK_EMCSB_MPLL				50
+#define TEGRA238_CLK_EXTPERIPH1				51
+#define TEGRA238_CLK_EXTPERIPH2				52
+#define TEGRA238_CLK_EXTPERIPH3				53
+#define TEGRA238_CLK_EXTPERIPH4				54
+#define TEGRA238_CLK_FDE				55
+#define TEGRA238_CLK_FR_SE				56
+#define TEGRA238_CLK_FR_SEU1				57
+#define TEGRA238_CLK_FUSE				58
+#define TEGRA238_CLK_FUSE_BURN				59
+#define TEGRA238_CLK_FUSE_SERIAL			60
+#define TEGRA238_CLK_GPC0CLK				61
+#define TEGRA238_CLK_GPU_PWR				62
+#define TEGRA238_CLK_HOST1X				63
+#define TEGRA238_CLK_HUB				64
+#define TEGRA238_CLK_HUB_ROOT				65
+#define TEGRA238_CLK_I2C1				66
+#define TEGRA238_CLK_I2C2				67
+#define TEGRA238_CLK_I2C3				68
+#define TEGRA238_CLK_I2C4				69
+#define TEGRA238_CLK_I2C5				70
+#define TEGRA238_CLK_I2C6				71
+#define TEGRA238_CLK_I2C7				72
+#define TEGRA238_CLK_I2C8				73
+#define TEGRA238_CLK_I2C9				74
+#define TEGRA238_CLK_I2C_SLOW				75
+#define TEGRA238_CLK_I2S1				76
+#define TEGRA238_CLK_I2S1_SYNC_INPUT			77
+#define TEGRA238_CLK_I2S2				78
+#define TEGRA238_CLK_I2S2_SYNC_INPUT			79
+#define TEGRA238_CLK_I2S3				80
+#define TEGRA238_CLK_I2S3_SYNC_INPUT			81
+#define TEGRA238_CLK_I2S4				82
+#define TEGRA238_CLK_I2S4_SYNC_INPUT			83
+#define TEGRA238_CLK_I2S5				84
+#define TEGRA238_CLK_I2S5_SYNC_INPUT			85
+#define TEGRA238_CLK_I2S6				86
+#define TEGRA238_CLK_I2S6_SYNC_INPUT			87
+#define TEGRA238_CLK_JTAG_INTFC_PRE_CG			88
+#define TEGRA238_CLK_LA					89
+#define TEGRA238_CLK_LINKA_SYM_CLKOUT			90
+#define TEGRA238_CLK_LINKF_SYM_CLKOUT			91
+#define TEGRA238_CLK_MAUD				92
+#define TEGRA238_CLK_MCHUB				93
+#define TEGRA238_CLK_MIPI_CAL				94
+#define TEGRA238_CLK_MPHY_CORE_PLL_FIXED		95
+#define TEGRA238_CLK_MPHY_FORCE_LS_MODE			96
+#define TEGRA238_CLK_MPHY_L0_RX_ANA			97
+#define TEGRA238_CLK_MPHY_L0_RX_HS_SYMB_DIV		98
+#define TEGRA238_CLK_MPHY_L0_RX_LS_BIT			99
+#define TEGRA238_CLK_MPHY_L0_RX_LS_BIT_DIV		100
+#define TEGRA238_CLK_MPHY_L0_RX_LS_SYMB_DIV		101
+#define TEGRA238_CLK_MPHY_L0_RX_MUX_SYMB_DIV		102
+#define TEGRA238_CLK_MPHY_L0_RX_SYMB			103
+#define TEGRA238_CLK_MPHY_L0_TX_2X_SYMB			104
+#define TEGRA238_CLK_MPHY_L0_TX_HS_SYMB_DIV		105
+#define TEGRA238_CLK_MPHY_L0_TX_LS_3XBIT		106
+#define TEGRA238_CLK_MPHY_L0_TX_LS_3XBIT_DIV		107
+#define TEGRA238_CLK_MPHY_L0_TX_LS_SYMB_DIV		108
+#define TEGRA238_CLK_MPHY_L0_TX_MUX_SYMB_DIV		109
+#define TEGRA238_CLK_MPHY_L0_TX_PRE_SYMB		110
+#define TEGRA238_CLK_MPHY_L0_TX_SYMB			111
+#define TEGRA238_CLK_MPHY_L1_RX_ANA			112
+#define TEGRA238_CLK_MPHY_TX_1MHZ_REF			113
+#define TEGRA238_CLK_MSS_ENCRYPT			114
+#define TEGRA238_CLK_NAFLL_BPMP				115
+#define TEGRA238_CLK_NAFLL_CLUSTER0_CORE		116
+#define TEGRA238_CLK_NAFLL_CLUSTER0_DSU			117
+#define TEGRA238_CLK_NAFLL_FDE				118
+#define TEGRA238_CLK_NAFLL_GPC0				119
+#define TEGRA238_CLK_NAFLL_NVDEC			120
+#define TEGRA238_CLK_NAFLL_NVENC			121
+#define TEGRA238_CLK_NAFLL_OFA				122
+#define TEGRA238_CLK_NAFLL_SE				123
+#define TEGRA238_CLK_NAFLL_SEU1				124
+#define TEGRA238_CLK_NAFLL_TSEC				125
+#define TEGRA238_CLK_NAFLL_VIC				126
+#define TEGRA238_CLK_NVDEC				127
+#define TEGRA238_CLK_NVDISPLAY_P0			128
+#define TEGRA238_CLK_NVDISPLAY_P1			129
+#define TEGRA238_CLK_NVENC				130
+#define TEGRA238_CLK_OFA				131
+#define TEGRA238_CLK_OSC				132
+#define TEGRA238_CLK_PEX0_C0_CORE			133
+#define TEGRA238_CLK_PEX0_C1_CORE			134
+#define TEGRA238_CLK_PEX0_C2_CORE			135
+#define TEGRA238_CLK_PEX0_C3_CORE			136
+#define TEGRA238_CLK_PEX_SATA_USB_RX_BYP		137
+#define TEGRA238_CLK_PEX_USB_PAD_PLL0_MGMT		138
+#define TEGRA238_CLK_PEX_USB_PAD_PLL1_MGMT		139
+#define TEGRA238_CLK_PEX_USB_PAD_PLL2_MGMT		140
+#define TEGRA238_CLK_PEX_USB_PAD_PLL3_MGMT		141
+#define TEGRA238_CLK_PLLA				142
+#define TEGRA238_CLK_PLLA1				143
+#define TEGRA238_CLK_PLLA1_OUT1				144
+#define TEGRA238_CLK_PLLAON				145
+#define TEGRA238_CLK_PLLA_DISP				146
+#define TEGRA238_CLK_PLLA_DISPHUB			147
+#define TEGRA238_CLK_PLLA_DIV2				148
+#define TEGRA238_CLK_PLLA_OUT0				149
+#define TEGRA238_CLK_PLLC				150
+#define TEGRA238_CLK_PLLC2				151
+#define TEGRA238_CLK_PLLC4				152
+#define TEGRA238_CLK_PLLC4_MUXED			153
+#define TEGRA238_CLK_PLLC4_OUT1				154
+#define TEGRA238_CLK_PLLC4_OUT2				155
+#define TEGRA238_CLK_PLLC4_VCO_DIV2			156
+#define TEGRA238_CLK_PLLE				157
+#define TEGRA238_CLK_PLLE_HPS				158
+#define TEGRA238_CLK_PLLHUB				159
+#define TEGRA238_CLK_PLLP				160
+#define TEGRA238_CLK_PLLP_AUDIO				161
+#define TEGRA238_CLK_PLLP_DIV17				162
+#define TEGRA238_CLK_PLLP_OUT0				163
+#define TEGRA238_CLK_PLLP_OUT_JTAG			164
+#define TEGRA238_CLK_PLLREFE_VCOOUT			165
+#define TEGRA238_CLK_PLLREFE_VCOOUT_GATED		166
+#define TEGRA238_CLK_PPC				167
+#define TEGRA238_CLK_PRE_SF0				168
+#define TEGRA238_CLK_PRE_SOR0				169
+#define TEGRA238_CLK_PRE_SOR0_REF			170
+#define TEGRA238_CLK_PRE_SOR1				171
+#define TEGRA238_CLK_PRE_SOR1_REF			172
+#define TEGRA238_CLK_PWM1				173
+#define TEGRA238_CLK_PWM2				174
+#define TEGRA238_CLK_PWM3				175
+#define TEGRA238_CLK_PWM4				176
+#define TEGRA238_CLK_PWM5				177
+#define TEGRA238_CLK_PWM6				178
+#define TEGRA238_CLK_PWM7				179
+#define TEGRA238_CLK_PWM8				180
+#define TEGRA238_CLK_QSPI0_2X_PM			181
+#define TEGRA238_CLK_QSPI0_PM				182
+#define TEGRA238_CLK_RG0				183
+#define TEGRA238_CLK_RG1				184
+#define TEGRA238_CLK_SDMMC1				185
+#define TEGRA238_CLK_SDMMC4				186
+#define TEGRA238_CLK_SDMMC4_AXICIF			187
+#define TEGRA238_CLK_SDMMC_LEGACY_TM			188
+#define TEGRA238_CLK_SE					189
+#define TEGRA238_CLK_SEU1				190
+#define TEGRA238_CLK_SF0				191
+#define TEGRA238_CLK_SF0_POSTMUX			192
+#define TEGRA238_CLK_SF1				193
+#define TEGRA238_CLK_SF1_POSTMUX			194
+#define TEGRA238_CLK_SOC_THERM				195
+#define TEGRA238_CLK_SOR0				196
+#define TEGRA238_CLK_SOR0_PAD_CLKOUT			197
+#define TEGRA238_CLK_SOR0_PLL_REF			198
+#define TEGRA238_CLK_SOR0_REF				199
+#define TEGRA238_CLK_SOR1				200
+#define TEGRA238_CLK_SOR1_PAD_CLKOUT			201
+#define TEGRA238_CLK_SOR1_PLL_REF			202
+#define TEGRA238_CLK_SOR1_REF				203
+#define TEGRA238_CLK_SOR_SAFE				204
+#define TEGRA238_CLK_SPI1				205
+#define TEGRA238_CLK_SPI2				206
+#define TEGRA238_CLK_SPI3				207
+#define TEGRA238_CLK_SPI4				208
+#define TEGRA238_CLK_SPI5				209
+#define TEGRA238_CLK_SPPLL0_CLKOUTA			210
+#define TEGRA238_CLK_SPPLL0_CLKOUTB			211
+#define TEGRA238_CLK_SPPLL0_CLKOUTPN			212
+#define TEGRA238_CLK_SPPLL0_DIV10			213
+#define TEGRA238_CLK_SPPLL0_DIV25			214
+#define TEGRA238_CLK_SPPLL0_DIV27PN			215
+#define TEGRA238_CLK_SPPLL0_VCO				216
+#define TEGRA238_CLK_SPPLL1_CLKOUTPN			217
+#define TEGRA238_CLK_SPPLL1_DIV27PN			218
+#define TEGRA238_CLK_SPPLL1_VCO				219
+#define TEGRA238_CLK_SYNC_DMIC1				220
+#define TEGRA238_CLK_SYNC_DMIC3				221
+#define TEGRA238_CLK_SYNC_DMIC4				222
+#define TEGRA238_CLK_SYNC_DSPK1				223
+#define TEGRA238_CLK_SYNC_DSPK2				224
+#define TEGRA238_CLK_SYNC_I2S1				225
+#define TEGRA238_CLK_SYNC_I2S2				226
+#define TEGRA238_CLK_SYNC_I2S3				227
+#define TEGRA238_CLK_SYNC_I2S4				228
+#define TEGRA238_CLK_SYNC_I2S5				229
+#define TEGRA238_CLK_SYNC_I2S6				230
+#define TEGRA238_CLK_TACH0				231
+#define TEGRA238_CLK_TACH1				232
+#define TEGRA238_CLK_TSC				233
+#define TEGRA238_CLK_TSC_REF				234
+#define TEGRA238_CLK_TSEC				235
+#define TEGRA238_CLK_TSEC_PKA				236
+#define TEGRA238_CLK_TSENSE				237
+#define TEGRA238_CLK_UARTA				238
+#define TEGRA238_CLK_UARTB				239
+#define TEGRA238_CLK_UARTC				240
+#define TEGRA238_CLK_UARTD				241
+#define TEGRA238_CLK_UARTE				242
+#define TEGRA238_CLK_UARTF				243
+#define TEGRA238_CLK_UARTG				244
+#define TEGRA238_CLK_UARTH				245
+#define TEGRA238_CLK_UART_FST_MIPI_CAL			246
+#define TEGRA238_CLK_UFSDEV_REF				247
+#define TEGRA238_CLK_UFSHC				248
+#define TEGRA238_CLK_UPHY_PLL3				249
+#define TEGRA238_CLK_USB2_TRK				250
+#define TEGRA238_CLK_UTMIPLL_CLKOUT48			251
+#define TEGRA238_CLK_UTMIPLL_CLKOUT480			252
+#define TEGRA238_CLK_UTMIP_PLL				253
+#define TEGRA238_CLK_VIC				254
+#define TEGRA238_CLK_VPLL0				255
+#define TEGRA238_CLK_VPLL0_REF				256
+#define TEGRA238_CLK_VPLL1				257
+#define TEGRA238_CLK_XUSB_CORE_DEV			258
+#define TEGRA238_CLK_XUSB_CORE_HOST			259
+#define TEGRA238_CLK_XUSB_CORE_MUX			260
+#define TEGRA238_CLK_XUSB_CORE_SS			261
+#define TEGRA238_CLK_XUSB_FALCON			262
+#define TEGRA238_CLK_XUSB_FALCON_HOST			263
+#define TEGRA238_CLK_XUSB_FALCON_SS			264
+#define TEGRA238_CLK_XUSB_FS				265
+#define TEGRA238_CLK_XUSB_FS_DEV			266
+#define TEGRA238_CLK_XUSB_FS_HOST			267
+#define TEGRA238_CLK_XUSB_HS_HSICP			268
+#define TEGRA238_CLK_XUSB_SS				269
+#define TEGRA238_CLK_XUSB_SS_DEV			270
+#define TEGRA238_CLK_XUSB_SS_SUPERSPEED			271
+
+#endif /* DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H */
-- 
2.43.0

