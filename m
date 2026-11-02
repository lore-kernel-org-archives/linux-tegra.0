Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625184;
	b=uMut8cqsx+Jj2IQawBkTmGj8of8K0IGKS2clJS6MyHpKmQMPxFlH0gn0aS7TnjC/aCwr
	 S8u1Rci0YxRXO4B8O7hQxHld1g0M6Zafv+3cyX04MB0Zw5+UX8aWA15gekfSmsNoOdWMF
	 dSWGokJskpZDX8qMsx40TsM2WhfMxV8qyr4GKVdOh1njJhTpndMsB0R50GwRqNS9qmfUo
	 r4LLw1BlvDk2yRNYCz7/j3beYtLK7xAGOeU5ebVmrxTLymbBT+Maq1tDbWOAaN9FVM9hZ
	 DMJAP07OGPndwaAFCI3lC/tVfa8vBSCDobtJuAzy992QXnFaX4c7Xw9PYLfO68CMS7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625184;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=pnDjrkkuKxGFNYGRxqMG1jEQRDLXXNWoslvJzHNActE=;
	b=JVQDAGSNO/ahArb72dLELfD7jd1U2PCAYQfHfZQonVtYhhCTdCkvuX6VsxhorImWjbz0
	 JCsVRFw/HONIJmZeqhXX4cCPk3NZZCVGqyBebgg8uA0LMfW6KtI9LRUZ71No9fI9wUGrx
	 2mop9Svg9sABKl8qBkzXGplBM1ph5Kl1iDWImGdQaTCnJ+h/7kZqQdD8sr37AjUzZ39P3
	 yZ22bWonSmudZM/jlHCaJMv5eSdmZEdRsv2U3MbEc5AefrQkZ0P8tIPUUPZB9phYpz0k4
	 ly683kPFWPWZ8X0uXglXhFZYlSVbhfSNZ0Rjmp2Ev9hrPgqexOyangvKTWmVl9m89PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Cx4W2IZG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.56
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83293606A324;
	Mon,  2 Nov 2026 13:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83293606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Cx4W2IZG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q39PGkk0OYxWBB3uylX2RUZxxNoGGFNn/El0fxcYNq5saDsoYmh+ORF+VUTGprwbVQ4F2blr7tA6Zu1WJ5FZn+RilVA3MH+XL1ngMMP7ym7xYABpO3nJJvBJazn/dAquiY7T26D/rzCGNRZpDiusMQV8r4mPvLA4V0pJUSeyn1ijRlpm0mbtPacKUDSdvyxa/8vHoShnWM7iZP9T/lqSr1g01DkRZacPgB9SF/KtrtCi2N0Ic8yidRtTNsFU3seCjAyHZWjrQ+Uzg6RvZFnBbdb4nIOFun3BlaLSq4Yl/S2o20XgFfLdyGBeixP6ChVQf3R7ZxQiw2+aodzKB8lBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnDjrkkuKxGFNYGRxqMG1jEQRDLXXNWoslvJzHNActE=;
 b=nQvHBLbak1cjeeIqv2D5yXEOlL9+7w3zu0TErX+U3sVT9Tzbo14ZuZyTunFmQte97u9IoGNhEVxU99f9nq2hsHaYTNCgOO4fSY36k+SzRPcpzvcOUPFowPBiw5Qrfdafd4dHjxKazCAmZofTDywAGDGF5Qh13ECBnwm/mDez1UHZ5TQ2Bvc1z66k6scZ+99rtSodXV+1L9lrZQhmb6xVsXyQT+bOQwustPQTE4HsF4gjLI/vcDn3hG1ASk6EOrtIdfBQ12T3yZaQOUhMYxgyLmcIUy6T27ZIPaH0aKDfgX4X1gJDcdVYdIfeehrqx4I3CB+lIHaduY/HxS5Lhn2B6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnDjrkkuKxGFNYGRxqMG1jEQRDLXXNWoslvJzHNActE=;
 b=Cx4W2IZGMm+GSCVsvkHFw6ZRAJxLE3xuP+dZMpP8Kk0Jh9MVmLmidNYH5L1UGGgPnK3sA52UKj1Zwm4dyzhmY5/z5cGfcPN0EIuPcfLGWNiwIG1I73lhinDR5bvjvAyYgIHPSay/h3+SPUjN9CsV3avda3vH8ShxQRul0zterBIZvEhgKDy2Cmc1UQG3i7F8EsawKouQ6oesSIXHeeYbDTjXEb4qBVBJTomzXu42qBTJ17bLVkvO7qbSTRStzXj3E0mD6pyUlMEaVRovYVaooI1auhKhnZEKdpAj1DIrw0o1vmNhvCokv3C8VdKIQrojUBqd8ekk0uHHgISUiFROiw==
Received: from BLAP220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::20)
 by DS2PR12MB9822.namprd12.prod.outlook.com (2603:10b6:8:2ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:12:56 +0000
Received: from MN7PEPF0000014A.namprd04.prod.outlook.com
 (2603:10b6:208:32c::4) by BLAP220CA0015.outlook.office365.com
 (2603:10b6:208:32c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 13:12:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN7PEPF0000014A.mail.protection.outlook.com (10.167.254.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 13:12:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 05:12:40 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 05:12:39 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: Johnny Liu <johnliu@nvidia.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: tegra186-bpmp: Add Tegra238 BPMP
Date: Mon, 2 Nov 2026 13:12:19 +0000
Message-ID: <20261102131222.2437001-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102121202.2431928-2-johnliu@nvidia.com>
References:
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014A:EE_|DS2PR12MB9822:EE_
X-MS-Office365-Filtering-Correlation-Id: 488843a4-a079-4548-f1b7-08df38e3026f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|23010399003|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261021121427099003|261026121527099003|261022113327099003|261009223027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	whjfbid/9Tji+Cv+kKTd/uI8lUhNuZTDPQQu8w/7kkW+SrNzLQ1X6tSloOfM5G7+MzhrGlbEamn3eiMm9JzRmM9F6crZL8cPXVepWxAO9gZW5UvqeqStYxlEDZ5kFHcC4lshijG+p4EUQTJ0u0Fjod4KSojKD9mCssUiE5W/kTgnuX/bjUg12aZoUcEddDB2sPZ0FHrAV1hW9p3FasCWFWMoJuR2asPtl34bKrOAyMJHLMVfY7s2x9hlKLJbZZnnZPGZRtcy89pC24w5k52hY0f8X7uBFXL76oolMIOVSjXo5baYe3PM7kHBa7tdxryF4icNuRtRnVneAGjY/EsBK4MAei6aDPPJJxo2kkGLAC2wC8F/N8X4EsnDjXrxVHNJ0TuTMl3FfssaCW0USsjS0rPUapxjK1+XZeSthkjf9KdXnYuj0LGqBXRVLM+NIBTB0ATY//aqncPFRVUWBl2U7r6N3PUuiVe3wHZr8h7JQoZKMOPd70lfmb5vmIXvXnhOvF/Otox2U2ClAxLLKl2XvzQDpk8OfqJquQSko5bKDhYMvIY8RIWMb8tylYJtAHU4xLMCLkN+bzTRIdje0jqBMMWZtHZeivDAnT7jEcLZU5DsJkVWo67EVMeh3WPC8s1KN3kyk9+hzUm/aju3Qwxz/TYHeyQeqqCy/82jqumxuoBd1IJbFBbjHuqvourdvOOgwe9sAKaC5yggoZFWSmlAkA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261022113327099003)(261009223027099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ho/0Wpt3to+EESIyFNDw7i/Zbb/QCpeNDBYI6Gt3ZcGU4DlZAStj5oC3+qyWLl2vSXpjOrhJXNqaqZ/jA1HFuoBAFlcAudio8BZ/XTdvrhUap229U9fDQlzLTOihVlNczSuzJiMXx/W5z1Wbk8QD0mkghnqM6tgcm+aoGE9o+2+yAsI1qoFTEJI8yVWk0kulwnnGMUHoPlcjPhc5zL+G9D7CA0+Km7carNkQ37m4z9zB+PHH3gXINJm7/PSgzXUVu8EDq1GZ4GtP9ST0zrdi5s4xMPAObTpStFol1gfIrXEGwGEV3LU3/5q8h6+j6TG3VFqSwY/1nNwjwqnivH0ojk4vmfdsr4kcm2DNV3v2UVOsMl66of764itrxBgZjoCidkY15yLNNK5Yp9gzwyscnz3esFdtbQIjVfEXegDfBVQkIATvYr6l9fM6R5EWJSGT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:12:55.7839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 488843a4-a079-4548-f1b7-08df38e3026f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9822

On 2026/11/02 12:11, Johnny Liu wrote:

> The Tegra238 SoC is fully compatible with the Tegra186 BPMP.
>
> Add the clock IDs exposed by the BPMP firmware on Tegra238.
>
> Signed-off-by: Johnny Liu <johnliu@nvidia.com>

I forgot to add "Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>"
in the commit message.

I will add in the next version after receiving further feedback from others.

Best Regards,
Johnny Liu

> ---
>  .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
>  include/dt-bindings/clock/nvidia,tegra238.h   | 279 ++++++++++++++++++
>  2 files changed, 280 insertions(+)
>  create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h
>
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> index 3c44fe607e12..4011fdf4a54d 100644
> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> @@ -70,6 +70,7 @@ properties:
>            - enum:
>                - nvidia,tegra194-bpmp
>                - nvidia,tegra234-bpmp
> +              - nvidia,tegra238-bpmp
>                - nvidia,tegra264-bpmp
>            - const: nvidia,tegra186-bpmp
>        - const: nvidia,tegra186-bpmp
> diff --git a/include/dt-bindings/clock/nvidia,tegra238.h b/include/dt-bindings/clock/nvidia,tegra238.h
> new file mode 100644
> index 000000000000..31313302d9ef
> --- /dev/null
> +++ b/include/dt-bindings/clock/nvidia,tegra238.h
> @@ -0,0 +1,279 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
> +
> +#ifndef DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H
> +#define DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H
> +
> +#define TEGRA238_CLK_ACLK				1
> +#define TEGRA238_CLK_ACTMON				2
> +#define TEGRA238_CLK_ADSP				3
> +#define TEGRA238_CLK_ADSPNEON				4
> +#define TEGRA238_CLK_AHUB				5
> +#define TEGRA238_CLK_AON_APB				6
> +#define TEGRA238_CLK_AON_CPU_NIC			7
> +#define TEGRA238_CLK_AON_I2C_SLOW			8
> +#define TEGRA238_CLK_AON_NIC				9
> +#define TEGRA238_CLK_AON_TOUCH				10
> +#define TEGRA238_CLK_APB2APE				11
> +#define TEGRA238_CLK_APE				12
> +#define TEGRA238_CLK_AUD_MCLK				13
> +#define TEGRA238_CLK_AXI_CBB				14
> +#define TEGRA238_CLK_AZA_2XBIT				15
> +#define TEGRA238_CLK_AZA_BIT				16
> +#define TEGRA238_CLK_BPMP_CPU				17
> +#define TEGRA238_CLK_BPMP_CPU_NIC			18
> +#define TEGRA238_CLK_CLK_32K				19
> +#define TEGRA238_CLK_CLK_M				20
> +#define TEGRA238_CLK_CSITE				21
> +#define TEGRA238_CLK_DBGAPB				22
> +#define TEGRA238_CLK_DISP				23
> +#define TEGRA238_CLK_DISPHUBPLL				24
> +#define TEGRA238_CLK_DISPPLL				25
> +#define TEGRA238_CLK_DISP_ROOT				26
> +#define TEGRA238_CLK_DMIC1				27
> +#define TEGRA238_CLK_DMIC3				28
> +#define TEGRA238_CLK_DMIC4				29
> +#define TEGRA238_CLK_DMIC5				30
> +#define TEGRA238_CLK_DPAUX				31
> +#define TEGRA238_CLK_DP_LINK_REF			32
> +#define TEGRA238_CLK_DSC				33
> +#define TEGRA238_CLK_DSIPLL_CLKOUTA			34
> +#define TEGRA238_CLK_DSIPLL_CLKOUTPN			35
> +#define TEGRA238_CLK_DSIPLL_VCO				36
> +#define TEGRA238_CLK_DSI_CORE				37
> +#define TEGRA238_CLK_DSI_LP				38
> +#define TEGRA238_CLK_DSI_PAD_INPUT			39
> +#define TEGRA238_CLK_DSI_PIXEL				40
> +#define TEGRA238_CLK_DSPK1				41
> +#define TEGRA238_CLK_DSPK2				42
> +#define TEGRA238_CLK_EMC				43
> +#define TEGRA238_CLK_EMCHUB				44
> +#define TEGRA238_CLK_EMCSA_EMC				45
> +#define TEGRA238_CLK_EMCSA_MC				46
> +#define TEGRA238_CLK_EMCSA_MPLL				47
> +#define TEGRA238_CLK_EMCSB_EMC				48
> +#define TEGRA238_CLK_EMCSB_MC				49
> +#define TEGRA238_CLK_EMCSB_MPLL				50
> +#define TEGRA238_CLK_EXTPERIPH1				51
> +#define TEGRA238_CLK_EXTPERIPH2				52
> +#define TEGRA238_CLK_EXTPERIPH3				53
> +#define TEGRA238_CLK_EXTPERIPH4				54
> +#define TEGRA238_CLK_FDE				55
> +#define TEGRA238_CLK_FR_SE				56
> +#define TEGRA238_CLK_FR_SEU1				57
> +#define TEGRA238_CLK_FUSE				58
> +#define TEGRA238_CLK_FUSE_BURN				59
> +#define TEGRA238_CLK_FUSE_SERIAL			60
> +#define TEGRA238_CLK_GPC0CLK				61
> +#define TEGRA238_CLK_GPU_PWR				62
> +#define TEGRA238_CLK_HOST1X				63
> +#define TEGRA238_CLK_HUB				64
> +#define TEGRA238_CLK_HUB_ROOT				65
> +#define TEGRA238_CLK_I2C1				66
> +#define TEGRA238_CLK_I2C2				67
> +#define TEGRA238_CLK_I2C3				68
> +#define TEGRA238_CLK_I2C4				69
> +#define TEGRA238_CLK_I2C5				70
> +#define TEGRA238_CLK_I2C6				71
> +#define TEGRA238_CLK_I2C7				72
> +#define TEGRA238_CLK_I2C8				73
> +#define TEGRA238_CLK_I2C9				74
> +#define TEGRA238_CLK_I2C_SLOW				75
> +#define TEGRA238_CLK_I2S1				76
> +#define TEGRA238_CLK_I2S1_SYNC_INPUT			77
> +#define TEGRA238_CLK_I2S2				78
> +#define TEGRA238_CLK_I2S2_SYNC_INPUT			79
> +#define TEGRA238_CLK_I2S3				80
> +#define TEGRA238_CLK_I2S3_SYNC_INPUT			81
> +#define TEGRA238_CLK_I2S4				82
> +#define TEGRA238_CLK_I2S4_SYNC_INPUT			83
> +#define TEGRA238_CLK_I2S5				84
> +#define TEGRA238_CLK_I2S5_SYNC_INPUT			85
> +#define TEGRA238_CLK_I2S6				86
> +#define TEGRA238_CLK_I2S6_SYNC_INPUT			87
> +#define TEGRA238_CLK_JTAG_INTFC_PRE_CG			88
> +#define TEGRA238_CLK_LA					89
> +#define TEGRA238_CLK_LINKA_SYM_CLKOUT			90
> +#define TEGRA238_CLK_LINKF_SYM_CLKOUT			91
> +#define TEGRA238_CLK_MAUD				92
> +#define TEGRA238_CLK_MCHUB				93
> +#define TEGRA238_CLK_MIPI_CAL				94
> +#define TEGRA238_CLK_MPHY_CORE_PLL_FIXED		95
> +#define TEGRA238_CLK_MPHY_FORCE_LS_MODE			96
> +#define TEGRA238_CLK_MPHY_L0_RX_ANA			97
> +#define TEGRA238_CLK_MPHY_L0_RX_HS_SYMB_DIV		98
> +#define TEGRA238_CLK_MPHY_L0_RX_LS_BIT			99
> +#define TEGRA238_CLK_MPHY_L0_RX_LS_BIT_DIV		100
> +#define TEGRA238_CLK_MPHY_L0_RX_LS_SYMB_DIV		101
> +#define TEGRA238_CLK_MPHY_L0_RX_MUX_SYMB_DIV		102
> +#define TEGRA238_CLK_MPHY_L0_RX_SYMB			103
> +#define TEGRA238_CLK_MPHY_L0_TX_2X_SYMB			104
> +#define TEGRA238_CLK_MPHY_L0_TX_HS_SYMB_DIV		105
> +#define TEGRA238_CLK_MPHY_L0_TX_LS_3XBIT		106
> +#define TEGRA238_CLK_MPHY_L0_TX_LS_3XBIT_DIV		107
> +#define TEGRA238_CLK_MPHY_L0_TX_LS_SYMB_DIV		108
> +#define TEGRA238_CLK_MPHY_L0_TX_MUX_SYMB_DIV		109
> +#define TEGRA238_CLK_MPHY_L0_TX_PRE_SYMB		110
> +#define TEGRA238_CLK_MPHY_L0_TX_SYMB			111
> +#define TEGRA238_CLK_MPHY_L1_RX_ANA			112
> +#define TEGRA238_CLK_MPHY_TX_1MHZ_REF			113
> +#define TEGRA238_CLK_MSS_ENCRYPT			114
> +#define TEGRA238_CLK_NAFLL_BPMP				115
> +#define TEGRA238_CLK_NAFLL_CLUSTER0_CORE		116
> +#define TEGRA238_CLK_NAFLL_CLUSTER0_DSU			117
> +#define TEGRA238_CLK_NAFLL_FDE				118
> +#define TEGRA238_CLK_NAFLL_GPC0				119
> +#define TEGRA238_CLK_NAFLL_NVDEC			120
> +#define TEGRA238_CLK_NAFLL_NVENC			121
> +#define TEGRA238_CLK_NAFLL_OFA				122
> +#define TEGRA238_CLK_NAFLL_SE				123
> +#define TEGRA238_CLK_NAFLL_SEU1				124
> +#define TEGRA238_CLK_NAFLL_TSEC				125
> +#define TEGRA238_CLK_NAFLL_VIC				126
> +#define TEGRA238_CLK_NVDEC				127
> +#define TEGRA238_CLK_NVDISPLAY_P0			128
> +#define TEGRA238_CLK_NVDISPLAY_P1			129
> +#define TEGRA238_CLK_NVENC				130
> +#define TEGRA238_CLK_OFA				131
> +#define TEGRA238_CLK_OSC				132
> +#define TEGRA238_CLK_PEX0_C0_CORE			133
> +#define TEGRA238_CLK_PEX0_C1_CORE			134
> +#define TEGRA238_CLK_PEX0_C2_CORE			135
> +#define TEGRA238_CLK_PEX0_C3_CORE			136
> +#define TEGRA238_CLK_PEX_SATA_USB_RX_BYP		137
> +#define TEGRA238_CLK_PEX_USB_PAD_PLL0_MGMT		138
> +#define TEGRA238_CLK_PEX_USB_PAD_PLL1_MGMT		139
> +#define TEGRA238_CLK_PEX_USB_PAD_PLL2_MGMT		140
> +#define TEGRA238_CLK_PEX_USB_PAD_PLL3_MGMT		141
> +#define TEGRA238_CLK_PLLA				142
> +#define TEGRA238_CLK_PLLA1				143
> +#define TEGRA238_CLK_PLLA1_OUT1				144
> +#define TEGRA238_CLK_PLLAON				145
> +#define TEGRA238_CLK_PLLA_DISP				146
> +#define TEGRA238_CLK_PLLA_DISPHUB			147
> +#define TEGRA238_CLK_PLLA_DIV2				148
> +#define TEGRA238_CLK_PLLA_OUT0				149
> +#define TEGRA238_CLK_PLLC				150
> +#define TEGRA238_CLK_PLLC2				151
> +#define TEGRA238_CLK_PLLC4				152
> +#define TEGRA238_CLK_PLLC4_MUXED			153
> +#define TEGRA238_CLK_PLLC4_OUT1				154
> +#define TEGRA238_CLK_PLLC4_OUT2				155
> +#define TEGRA238_CLK_PLLC4_VCO_DIV2			156
> +#define TEGRA238_CLK_PLLE				157
> +#define TEGRA238_CLK_PLLE_HPS				158
> +#define TEGRA238_CLK_PLLHUB				159
> +#define TEGRA238_CLK_PLLP				160
> +#define TEGRA238_CLK_PLLP_AUDIO				161
> +#define TEGRA238_CLK_PLLP_DIV17				162
> +#define TEGRA238_CLK_PLLP_OUT0				163
> +#define TEGRA238_CLK_PLLP_OUT_JTAG			164
> +#define TEGRA238_CLK_PLLREFE_VCOOUT			165
> +#define TEGRA238_CLK_PLLREFE_VCOOUT_GATED		166
> +#define TEGRA238_CLK_PPC				167
> +#define TEGRA238_CLK_PRE_SF0				168
> +#define TEGRA238_CLK_PRE_SOR0				169
> +#define TEGRA238_CLK_PRE_SOR0_REF			170
> +#define TEGRA238_CLK_PRE_SOR1				171
> +#define TEGRA238_CLK_PRE_SOR1_REF			172
> +#define TEGRA238_CLK_PWM1				173
> +#define TEGRA238_CLK_PWM2				174
> +#define TEGRA238_CLK_PWM3				175
> +#define TEGRA238_CLK_PWM4				176
> +#define TEGRA238_CLK_PWM5				177
> +#define TEGRA238_CLK_PWM6				178
> +#define TEGRA238_CLK_PWM7				179
> +#define TEGRA238_CLK_PWM8				180
> +#define TEGRA238_CLK_QSPI0_2X_PM			181
> +#define TEGRA238_CLK_QSPI0_PM				182
> +#define TEGRA238_CLK_RG0				183
> +#define TEGRA238_CLK_RG1				184
> +#define TEGRA238_CLK_SDMMC1				185
> +#define TEGRA238_CLK_SDMMC4				186
> +#define TEGRA238_CLK_SDMMC4_AXICIF			187
> +#define TEGRA238_CLK_SDMMC_LEGACY_TM			188
> +#define TEGRA238_CLK_SE					189
> +#define TEGRA238_CLK_SEU1				190
> +#define TEGRA238_CLK_SF0				191
> +#define TEGRA238_CLK_SF0_POSTMUX			192
> +#define TEGRA238_CLK_SF1				193
> +#define TEGRA238_CLK_SF1_POSTMUX			194
> +#define TEGRA238_CLK_SOC_THERM				195
> +#define TEGRA238_CLK_SOR0				196
> +#define TEGRA238_CLK_SOR0_PAD_CLKOUT			197
> +#define TEGRA238_CLK_SOR0_PLL_REF			198
> +#define TEGRA238_CLK_SOR0_REF				199
> +#define TEGRA238_CLK_SOR1				200
> +#define TEGRA238_CLK_SOR1_PAD_CLKOUT			201
> +#define TEGRA238_CLK_SOR1_PLL_REF			202
> +#define TEGRA238_CLK_SOR1_REF				203
> +#define TEGRA238_CLK_SOR_SAFE				204
> +#define TEGRA238_CLK_SPI1				205
> +#define TEGRA238_CLK_SPI2				206
> +#define TEGRA238_CLK_SPI3				207
> +#define TEGRA238_CLK_SPI4				208
> +#define TEGRA238_CLK_SPI5				209
> +#define TEGRA238_CLK_SPPLL0_CLKOUTA			210
> +#define TEGRA238_CLK_SPPLL0_CLKOUTB			211
> +#define TEGRA238_CLK_SPPLL0_CLKOUTPN			212
> +#define TEGRA238_CLK_SPPLL0_DIV10			213
> +#define TEGRA238_CLK_SPPLL0_DIV25			214
> +#define TEGRA238_CLK_SPPLL0_DIV27PN			215
> +#define TEGRA238_CLK_SPPLL0_VCO				216
> +#define TEGRA238_CLK_SPPLL1_CLKOUTPN			217
> +#define TEGRA238_CLK_SPPLL1_DIV27PN			218
> +#define TEGRA238_CLK_SPPLL1_VCO				219
> +#define TEGRA238_CLK_SYNC_DMIC1				220
> +#define TEGRA238_CLK_SYNC_DMIC3				221
> +#define TEGRA238_CLK_SYNC_DMIC4				222
> +#define TEGRA238_CLK_SYNC_DSPK1				223
> +#define TEGRA238_CLK_SYNC_DSPK2				224
> +#define TEGRA238_CLK_SYNC_I2S1				225
> +#define TEGRA238_CLK_SYNC_I2S2				226
> +#define TEGRA238_CLK_SYNC_I2S3				227
> +#define TEGRA238_CLK_SYNC_I2S4				228
> +#define TEGRA238_CLK_SYNC_I2S5				229
> +#define TEGRA238_CLK_SYNC_I2S6				230
> +#define TEGRA238_CLK_TACH0				231
> +#define TEGRA238_CLK_TACH1				232
> +#define TEGRA238_CLK_TSC				233
> +#define TEGRA238_CLK_TSC_REF				234
> +#define TEGRA238_CLK_TSEC				235
> +#define TEGRA238_CLK_TSEC_PKA				236
> +#define TEGRA238_CLK_TSENSE				237
> +#define TEGRA238_CLK_UARTA				238
> +#define TEGRA238_CLK_UARTB				239
> +#define TEGRA238_CLK_UARTC				240
> +#define TEGRA238_CLK_UARTD				241
> +#define TEGRA238_CLK_UARTE				242
> +#define TEGRA238_CLK_UARTF				243
> +#define TEGRA238_CLK_UARTG				244
> +#define TEGRA238_CLK_UARTH				245
> +#define TEGRA238_CLK_UART_FST_MIPI_CAL			246
> +#define TEGRA238_CLK_UFSDEV_REF				247
> +#define TEGRA238_CLK_UFSHC				248
> +#define TEGRA238_CLK_UPHY_PLL3				249
> +#define TEGRA238_CLK_USB2_TRK				250
> +#define TEGRA238_CLK_UTMIPLL_CLKOUT48			251
> +#define TEGRA238_CLK_UTMIPLL_CLKOUT480			252
> +#define TEGRA238_CLK_UTMIP_PLL				253
> +#define TEGRA238_CLK_VIC				254
> +#define TEGRA238_CLK_VPLL0				255
> +#define TEGRA238_CLK_VPLL0_REF				256
> +#define TEGRA238_CLK_VPLL1				257
> +#define TEGRA238_CLK_XUSB_CORE_DEV			258
> +#define TEGRA238_CLK_XUSB_CORE_HOST			259
> +#define TEGRA238_CLK_XUSB_CORE_MUX			260
> +#define TEGRA238_CLK_XUSB_CORE_SS			261
> +#define TEGRA238_CLK_XUSB_FALCON			262
> +#define TEGRA238_CLK_XUSB_FALCON_HOST			263
> +#define TEGRA238_CLK_XUSB_FALCON_SS			264
> +#define TEGRA238_CLK_XUSB_FS				265
> +#define TEGRA238_CLK_XUSB_FS_DEV			266
> +#define TEGRA238_CLK_XUSB_FS_HOST			267
> +#define TEGRA238_CLK_XUSB_HS_HSICP			268
> +#define TEGRA238_CLK_XUSB_SS				269
> +#define TEGRA238_CLK_XUSB_SS_DEV			270
> +#define TEGRA238_CLK_XUSB_SS_SUPERSPEED			271
> +
> +#endif /* DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H */
> -- 
> 2.43.0
>
