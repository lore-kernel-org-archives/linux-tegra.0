Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F36390999;
	Wed, 25 Mar 2026 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474054; cv=fail; b=e1iv+/Rg6OUov9JbsvROXqftSoKxo9pVrkFXXvviMyogUCC7eM0nZ3HVbHUeK2FRf2sVoDrfmfrRFvynwczQqHJ49grPiwzGIStEeEXSQaCBgnKaO5pvGrZF+YUnOqqW2OyTr0za8nytd/6YH1wMKOBxDyLywnOsEPX/jICBwV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474054; c=relaxed/simple;
	bh=+P8pFwKVc4092mN4Prjrx1n+HAVVk16pcWs4VoUQlTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qRnRYfWZA3fqkPxcaVAMAzfasLIZfN5j9wA3324v2YfRxlFj8+1+kgiKxnY7JNy6YtdTZSjjNdkZlwmnsaMmxa+zj4Ag6Rtqm3ElwYjnCgnMPmIgn9cq+InNKtRiCPZXyDlF8EtMyOctWDcoR5QPjdbCPlIKo7QQ8iwa/tGFHhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YCkirS1K; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YCkirS1K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhsyaGYllGrPUNBHNnpuVduqjlhC/1w9dNwx4BW1PYZZVcfs9jqUUBnpvHb8YUThQ/+qOPLD6VKir0AtOXDCoDV9WO795qY35YwvrtcvA58MOCn7XTjACF5amSa4N9EPC2wgpzsdmKWdKjb2iq3sbC9qZ6WWUee2Nhpjk+/Y8cUx9TLWNkmcFbDFDENSmToyhCe9OYLNEMBl34+8SaJpIHLuW8OxiaUpEpPt6wXXKAhv3/cnfDLi3MoYP+27bJILBdJr2mk4c6hj+Fr1tqGAFRj1uu4Mnv/Z7l5mlUc3Q6VEC7hIagWaXFw/oBFZ08CRsUtd5IAVfszbH7FBw3aVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHCEoNzHJv/BzDTuaLeczEaIJKFL/aeiiofpwecINu0=;
 b=S6ozqLyjDkeWD2TK+jgvvGdjG/QEZgBcu7Mkwxu7NHxutoG3csLBP9G+YTJW16tiCUyEh4h/ziGtyCuD20r8ZXli7rN0PvW32WZImXyJp6haORlhC39A+Vh4CQCl9CfyKzeR6cmoivtgKNjOXudC/gwno6q/lxOhR49EI7KYzq7MJkZagUMjdt2qWF2QJhnMGe3dH9AnJXPXmq2ZabZiJqk0KsRA9tBbYtULfCVw2geET4vnhq8bnjEAMzmft7b525VGEaYRag11vcPxQcYX8uBUR81CFve+CQ544/U+gVD/oQvRt1tlNlElBgEhg1144DQNEgRkIT+oDAIik/0q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHCEoNzHJv/BzDTuaLeczEaIJKFL/aeiiofpwecINu0=;
 b=YCkirS1Kqn8q5WV52C9B+f5Pt/kZAeJNl4yqvo/4/vcQ/kNipcwo7wL9pQrmLzsVSvdYwGrPeE6WkhpHhttfTLFSrqjk3AZUaaWerlzccnydHgawy79+lVyAARfCAeUz2tGzLahIC83zlFZb1iOl/KHQmdp9OfswdXfTPyMP+Q0+YwJ26VTelZhwTB5l3/+EAcARD51VE+hU0lEpjIToIcfVJZQm1E4bTHxzP+gzWsl/ImWXyzcxdzjWYHlzLjE5AGqHA+2PCZtMjm17xnlnlVTxDaf6HdRT+t8n92KtrRu4mFtR0zjsBmmmTxCyieL9QUTkbfWmKxeG+Y2wKUf6wQ==
Received: from CH2PR11CA0008.namprd11.prod.outlook.com (2603:10b6:610:54::18)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 21:27:23 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:54:cafe::dc) by CH2PR11CA0008.outlook.office365.com
 (2603:10b6:610:54::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 21:27:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Wed, 25 Mar 2026 21:27:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 14:27:00 -0700
Received: from build-chunn-noble-20251215.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 14:26:59 -0700
From: Chun Ng <chunn@nvidia.com>
To: <linux-tegra@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <chunn@nvidia.com>,
	<ankitag@nvidia.com>
Subject: [PATCH 1/4] dt-bindings: tegra: Add Tegra238 clock and reset definitions
Date: Wed, 25 Mar 2026 21:26:25 +0000
Message-ID: <20260325212628.1234082-2-chunn@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325212628.1234082-1-chunn@nvidia.com>
References: <20260325212628.1234082-1-chunn@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: aa417375-7f67-4ee9-2f67-08de8ab54dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|42112799006|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EQ0MAoEAdhaSawbkkB/UZILsI88YI+/OW6bFZSBEaKz3yVhJPkCcjBBgilNyKQl4cFDs/Oo5Cu4qSz5KEM2c/41V0Flb0XLmpw82GTxyXF1MSQNSMLeg1f69bwdf35NZfuJ2Oc3Li+xjiN6R7I9e+TJ9AX7YEEcL1tOcQOKTmyXODSby15lT3lTpz4ZPn7/x1kax579VCjjlWpuWPVbBxKKhtGmGrh9EiTF0mfYWoW9awCMdR6Jj2HTL14QcJvWMc7fXhrpyhBHv4BSO1Nj1kL6VDBW9oOAkMiRmaVGX5m+gE5/G0g8NVMOOjp8XNjIRvicD0aXRWmFs9e/IS5ScCfizAQn7TdwGmqL1MSRUYYIuQE9Obt1wG03NN6TT7wsFaPBhf6dLXqfmyf6muHMT2d/9pXJVcGiSyEfT949cooZbnrPfNozt/HivWnCcmN03BYfmbiEQwXaflWR7fdtOZxtqsPN6HcF/4orr8Fm1Vt8O97vEl7RCcySrPsywBqdsEwF4GOJR26ZjSx7TEwRRSAk3jmOxCYK8HQVGDBdJ7JqeG++rIWjCwuuLp9BhzebYyOCgvo25kw2OhCBEcz3lVk+rVW/5q56Ok1DUSTvlk/XmokRpH3+h9RvGYz/wNNnCu9rIb8x1HRA4UnE2MmtPFyvnvBHzsXICTR4oTFmIuoOphmZLA/R9jyTBtoK0rvl5SUJ2YNFFmA53iHZ5jGcphOHWw5H94Vdv8AYczzifx1s1ecneRfa/AZVxCeQjNndpMTEieBxOWBiDOOsrxqCdcA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(42112799006)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zo8SVKtUKtvqyqzTthlgriNkHcfza1nLSqystBSyJGOnBy37nlgzKMI8a0cDTjXLKwMowxSZaNKtVlYfTMybW/TpmbuYq3D3f4I0I7SCyPOK8X0r6bC3a2QCOLrwTj3vomLDJFlAwv819rPuC+mDHgUf5CYBnUyKf4WJqOmnqLN6/lit6EHGA8yTgiaEK9W//eRqlOaLmfqSiyWUfHmDI1lOpYAV+gaA2KmkCfLO2tzMCsM8OM3XqXib4svKdvNn328nuu+ypmbIuiLzvXtJxdgVJqCJUWyP1QsCGWk9q9RhkWNCRehqeINlxYmXl92NbbsEw+nybNWhoptUhdtWrBOXJ9DBKUeHilfTCtI2Ms4ej90C72qxkdxnSDVzZjsAKfb8aQrQIQ9+Nf48jcPALkNFn4RdtwXISwpjq+ulL8cNVJmEkW9iBilYpGTeiSPT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:27:23.1385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa417375-7f67-4ee9-2f67-08de8ab54dd6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858

Add device tree binding headers for Tegra238 that define the clock and
reset resource IDs used by the BPMP firmware. The IDs are defined by
hardware and are not software enumerations; 0 is reserved, so numbering
starts at 1. The reset header documents reserved ID ranges where no
reset line is present.

Signed-off-by: Chun Ng <chunn@nvidia.com>
---
 include/dt-bindings/clock/nvidia,tegra238.h | 279 ++++++++++++++++++++
 include/dt-bindings/reset/nvidia,tegra238.h | 125 +++++++++
 2 files changed, 404 insertions(+)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra238.h

diff --git a/include/dt-bindings/clock/nvidia,tegra238.h b/include/dt-bindings/clock/nvidia,tegra238.h
new file mode 100644
index 000000000000..eb1cb01ab20a
--- /dev/null
+++ b/include/dt-bindings/clock/nvidia,tegra238.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2021-2026, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H
+#define DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H
+
+#define TEGRA238_CLK_ACLK			1
+#define TEGRA238_CLK_ACTMON			2
+#define TEGRA238_CLK_ADSP			3
+#define TEGRA238_CLK_ADSPNEON			4
+#define TEGRA238_CLK_AHUB			5
+#define TEGRA238_CLK_AON_APB			6
+#define TEGRA238_CLK_AON_CPU_NIC		7
+#define TEGRA238_CLK_AON_I2C_SLOW		8
+#define TEGRA238_CLK_AON_NIC			9
+#define TEGRA238_CLK_AON_TOUCH			10
+#define TEGRA238_CLK_APB2APE			11
+#define TEGRA238_CLK_APE			12
+#define TEGRA238_CLK_AUD_MCLK			13
+#define TEGRA238_CLK_AXI_CBB			14
+#define TEGRA238_CLK_AZA_2XBIT			15
+#define TEGRA238_CLK_AZA_BIT			16
+#define TEGRA238_CLK_BPMP_CPU			17
+#define TEGRA238_CLK_BPMP_CPU_NIC		18
+#define TEGRA238_CLK_CLK_32K			19
+#define TEGRA238_CLK_CLK_M			20
+#define TEGRA238_CLK_CSITE			21
+#define TEGRA238_CLK_DBGAPB			22
+#define TEGRA238_CLK_DISP			23
+#define TEGRA238_CLK_DISPHUBPLL			24
+#define TEGRA238_CLK_DISPPLL			25
+#define TEGRA238_CLK_DISP_ROOT			26
+#define TEGRA238_CLK_DMIC1			27
+#define TEGRA238_CLK_DMIC3			28
+#define TEGRA238_CLK_DMIC4			29
+#define TEGRA238_CLK_DMIC5			30
+#define TEGRA238_CLK_DPAUX			31
+#define TEGRA238_CLK_DP_LINK_REF		32
+#define TEGRA238_CLK_DSC			33
+#define TEGRA238_CLK_DSIPLL_CLKOUTA		34
+#define TEGRA238_CLK_DSIPLL_CLKOUTPN		35
+#define TEGRA238_CLK_DSIPLL_VCO			36
+#define TEGRA238_CLK_DSI_CORE			37
+#define TEGRA238_CLK_DSI_LP			38
+#define TEGRA238_CLK_DSI_PAD_INPUT		39
+#define TEGRA238_CLK_DSI_PIXEL			40
+#define TEGRA238_CLK_DSPK1			41
+#define TEGRA238_CLK_DSPK2			42
+#define TEGRA238_CLK_EMC			43
+#define TEGRA238_CLK_EMCHUB			44
+#define TEGRA238_CLK_EMCSA_EMC			45
+#define TEGRA238_CLK_EMCSA_MC			46
+#define TEGRA238_CLK_EMCSA_MPLL			47
+#define TEGRA238_CLK_EMCSB_EMC			48
+#define TEGRA238_CLK_EMCSB_MC			49
+#define TEGRA238_CLK_EMCSB_MPLL			50
+#define TEGRA238_CLK_EXTPERIPH1			51
+#define TEGRA238_CLK_EXTPERIPH2			52
+#define TEGRA238_CLK_EXTPERIPH3			53
+#define TEGRA238_CLK_EXTPERIPH4			54
+#define TEGRA238_CLK_FDE			55
+#define TEGRA238_CLK_FR_SE			56
+#define TEGRA238_CLK_FR_SEU1			57
+#define TEGRA238_CLK_FUSE			58
+#define TEGRA238_CLK_FUSE_BURN			59
+#define TEGRA238_CLK_FUSE_SERIAL		60
+#define TEGRA238_CLK_GPC0CLK			61
+#define TEGRA238_CLK_GPU_PWR			62
+#define TEGRA238_CLK_HOST1X			63
+#define TEGRA238_CLK_HUB			64
+#define TEGRA238_CLK_HUB_ROOT			65
+#define TEGRA238_CLK_I2C1			66
+#define TEGRA238_CLK_I2C2			67
+#define TEGRA238_CLK_I2C3			68
+#define TEGRA238_CLK_I2C4			69
+#define TEGRA238_CLK_I2C5			70
+#define TEGRA238_CLK_I2C6			71
+#define TEGRA238_CLK_I2C7			72
+#define TEGRA238_CLK_I2C8			73
+#define TEGRA238_CLK_I2C9			74
+#define TEGRA238_CLK_I2C_SLOW			75
+#define TEGRA238_CLK_I2S1			76
+#define TEGRA238_CLK_I2S1_SYNC_INPUT		77
+#define TEGRA238_CLK_I2S2			78
+#define TEGRA238_CLK_I2S2_SYNC_INPUT		79
+#define TEGRA238_CLK_I2S3			80
+#define TEGRA238_CLK_I2S3_SYNC_INPUT		81
+#define TEGRA238_CLK_I2S4			82
+#define TEGRA238_CLK_I2S4_SYNC_INPUT		83
+#define TEGRA238_CLK_I2S5			84
+#define TEGRA238_CLK_I2S5_SYNC_INPUT		85
+#define TEGRA238_CLK_I2S6			86
+#define TEGRA238_CLK_I2S6_SYNC_INPUT		87
+#define TEGRA238_CLK_JTAG_INTFC_PRE_CG		88
+#define TEGRA238_CLK_LA				89
+#define TEGRA238_CLK_LINKA_SYM_CLKOUT		90
+#define TEGRA238_CLK_LINKF_SYM_CLKOUT		91
+#define TEGRA238_CLK_MAUD			92
+#define TEGRA238_CLK_MCHUB			93
+#define TEGRA238_CLK_MIPI_CAL			94
+#define TEGRA238_CLK_MPHY_CORE_PLL_FIXED	95
+#define TEGRA238_CLK_MPHY_FORCE_LS_MODE		96
+#define TEGRA238_CLK_MPHY_L0_RX_ANA		97
+#define TEGRA238_CLK_MPHY_L0_RX_HS_SYMB_DIV	98
+#define TEGRA238_CLK_MPHY_L0_RX_LS_BIT		99
+#define TEGRA238_CLK_MPHY_L0_RX_LS_BIT_DIV	100
+#define TEGRA238_CLK_MPHY_L0_RX_LS_SYMB_DIV	101
+#define TEGRA238_CLK_MPHY_L0_RX_MUX_SYMB_DIV	102
+#define TEGRA238_CLK_MPHY_L0_RX_SYMB		103
+#define TEGRA238_CLK_MPHY_L0_TX_2X_SYMB		104
+#define TEGRA238_CLK_MPHY_L0_TX_HS_SYMB_DIV	105
+#define TEGRA238_CLK_MPHY_L0_TX_LS_3XBIT	106
+#define TEGRA238_CLK_MPHY_L0_TX_LS_3XBIT_DIV	107
+#define TEGRA238_CLK_MPHY_L0_TX_LS_SYMB_DIV	108
+#define TEGRA238_CLK_MPHY_L0_TX_MUX_SYMB_DIV	109
+#define TEGRA238_CLK_MPHY_L0_TX_PRE_SYMB	110
+#define TEGRA238_CLK_MPHY_L0_TX_SYMB		111
+#define TEGRA238_CLK_MPHY_L1_RX_ANA		112
+#define TEGRA238_CLK_MPHY_TX_1MHZ_REF		113
+#define TEGRA238_CLK_MSS_ENCRYPT		114
+#define TEGRA238_CLK_NAFLL_BPMP			115
+#define TEGRA238_CLK_NAFLL_CLUSTER0_CORE	116
+#define TEGRA238_CLK_NAFLL_CLUSTER0_DSU		117
+#define TEGRA238_CLK_NAFLL_FDE			118
+#define TEGRA238_CLK_NAFLL_GPC0			119
+#define TEGRA238_CLK_NAFLL_NVDEC		120
+#define TEGRA238_CLK_NAFLL_NVENC		121
+#define TEGRA238_CLK_NAFLL_OFA			122
+#define TEGRA238_CLK_NAFLL_SE			123
+#define TEGRA238_CLK_NAFLL_SEU1			124
+#define TEGRA238_CLK_NAFLL_TSEC			125
+#define TEGRA238_CLK_NAFLL_VIC			126
+#define TEGRA238_CLK_NVDEC			127
+#define TEGRA238_CLK_NVDISPLAY_P0		128
+#define TEGRA238_CLK_NVDISPLAY_P1		129
+#define TEGRA238_CLK_NVENC			130
+#define TEGRA238_CLK_OFA			131
+#define TEGRA238_CLK_OSC			132
+#define TEGRA238_CLK_PEX0_C0_CORE		133
+#define TEGRA238_CLK_PEX0_C1_CORE		134
+#define TEGRA238_CLK_PEX0_C2_CORE		135
+#define TEGRA238_CLK_PEX0_C3_CORE		136
+#define TEGRA238_CLK_PEX_SATA_USB_RX_BYP	137
+#define TEGRA238_CLK_PEX_USB_PAD_PLL0_MGMT	138
+#define TEGRA238_CLK_PEX_USB_PAD_PLL1_MGMT	139
+#define TEGRA238_CLK_PEX_USB_PAD_PLL2_MGMT	140
+#define TEGRA238_CLK_PEX_USB_PAD_PLL3_MGMT	141
+#define TEGRA238_CLK_PLLA			142
+#define TEGRA238_CLK_PLLA1			143
+#define TEGRA238_CLK_PLLA1_OUT1			144
+#define TEGRA238_CLK_PLLAON			145
+#define TEGRA238_CLK_PLLA_DISP			146
+#define TEGRA238_CLK_PLLA_DISPHUB		147
+#define TEGRA238_CLK_PLLA_DIV2			148
+#define TEGRA238_CLK_PLLA_OUT0			149
+#define TEGRA238_CLK_PLLC			150
+#define TEGRA238_CLK_PLLC2			151
+#define TEGRA238_CLK_PLLC4			152
+#define TEGRA238_CLK_PLLC4_MUXED		153
+#define TEGRA238_CLK_PLLC4_OUT1			154
+#define TEGRA238_CLK_PLLC4_OUT2			155
+#define TEGRA238_CLK_PLLC4_VCO_DIV2		156
+#define TEGRA238_CLK_PLLE			157
+#define TEGRA238_CLK_PLLE_HPS			158
+#define TEGRA238_CLK_PLLHUB			159
+#define TEGRA238_CLK_PLLP			160
+#define TEGRA238_CLK_PLLP_AUDIO			161
+#define TEGRA238_CLK_PLLP_DIV17			162
+#define TEGRA238_CLK_PLLP_OUT0			163
+#define TEGRA238_CLK_PLLP_OUT_JTAG		164
+#define TEGRA238_CLK_PLLREFE_VCOOUT		165
+#define TEGRA238_CLK_PLLREFE_VCOOUT_GATED	166
+#define TEGRA238_CLK_PPC			167
+#define TEGRA238_CLK_PRE_SF0			168
+#define TEGRA238_CLK_PRE_SOR0			169
+#define TEGRA238_CLK_PRE_SOR0_REF		170
+#define TEGRA238_CLK_PRE_SOR1			171
+#define TEGRA238_CLK_PRE_SOR1_REF		172
+#define TEGRA238_CLK_PWM1			173
+#define TEGRA238_CLK_PWM2			174
+#define TEGRA238_CLK_PWM3			175
+#define TEGRA238_CLK_PWM4			176
+#define TEGRA238_CLK_PWM5			177
+#define TEGRA238_CLK_PWM6			178
+#define TEGRA238_CLK_PWM7			179
+#define TEGRA238_CLK_PWM8			180
+#define TEGRA238_CLK_QSPI0_2X_PM		181
+#define TEGRA238_CLK_QSPI0_PM			182
+#define TEGRA238_CLK_RG0			183
+#define TEGRA238_CLK_RG1			184
+#define TEGRA238_CLK_SDMMC1			185
+#define TEGRA238_CLK_SDMMC4			186
+#define TEGRA238_CLK_SDMMC4_AXICIF		187
+#define TEGRA238_CLK_SDMMC_LEGACY_TM		188
+#define TEGRA238_CLK_SE				189
+#define TEGRA238_CLK_SEU1			190
+#define TEGRA238_CLK_SF0			191
+#define TEGRA238_CLK_SF0_POSTMUX		192
+#define TEGRA238_CLK_SF1			193
+#define TEGRA238_CLK_SF1_POSTMUX		194
+#define TEGRA238_CLK_SOC_THERM			195
+#define TEGRA238_CLK_SOR0			196
+#define TEGRA238_CLK_SOR0_PAD_CLKOUT		197
+#define TEGRA238_CLK_SOR0_PLL_REF		198
+#define TEGRA238_CLK_SOR0_REF			199
+#define TEGRA238_CLK_SOR1			200
+#define TEGRA238_CLK_SOR1_PAD_CLKOUT		201
+#define TEGRA238_CLK_SOR1_PLL_REF		202
+#define TEGRA238_CLK_SOR1_REF			203
+#define TEGRA238_CLK_SOR_SAFE			204
+#define TEGRA238_CLK_SPI1			205
+#define TEGRA238_CLK_SPI2			206
+#define TEGRA238_CLK_SPI3			207
+#define TEGRA238_CLK_SPI4			208
+#define TEGRA238_CLK_SPI5			209
+#define TEGRA238_CLK_SPPLL0_CLKOUTA		210
+#define TEGRA238_CLK_SPPLL0_CLKOUTB		211
+#define TEGRA238_CLK_SPPLL0_CLKOUTPN		212
+#define TEGRA238_CLK_SPPLL0_DIV10		213
+#define TEGRA238_CLK_SPPLL0_DIV25		214
+#define TEGRA238_CLK_SPPLL0_DIV27PN		215
+#define TEGRA238_CLK_SPPLL0_VCO			216
+#define TEGRA238_CLK_SPPLL1_CLKOUTPN		217
+#define TEGRA238_CLK_SPPLL1_DIV27PN		218
+#define TEGRA238_CLK_SPPLL1_VCO			219
+#define TEGRA238_CLK_SYNC_DMIC1			220
+#define TEGRA238_CLK_SYNC_DMIC3			221
+#define TEGRA238_CLK_SYNC_DMIC4			222
+#define TEGRA238_CLK_SYNC_DSPK1			223
+#define TEGRA238_CLK_SYNC_DSPK2			224
+#define TEGRA238_CLK_SYNC_I2S1			225
+#define TEGRA238_CLK_SYNC_I2S2			226
+#define TEGRA238_CLK_SYNC_I2S3			227
+#define TEGRA238_CLK_SYNC_I2S4			228
+#define TEGRA238_CLK_SYNC_I2S5			229
+#define TEGRA238_CLK_SYNC_I2S6			230
+#define TEGRA238_CLK_TACH0			231
+#define TEGRA238_CLK_TACH1			232
+#define TEGRA238_CLK_TSC			233
+#define TEGRA238_CLK_TSC_REF			234
+#define TEGRA238_CLK_TSEC			235
+#define TEGRA238_CLK_TSEC_PKA			236
+#define TEGRA238_CLK_TSENSE			237
+#define TEGRA238_CLK_UARTA			238
+#define TEGRA238_CLK_UARTB			239
+#define TEGRA238_CLK_UARTC			240
+#define TEGRA238_CLK_UARTD			241
+#define TEGRA238_CLK_UARTE			242
+#define TEGRA238_CLK_UARTF			243
+#define TEGRA238_CLK_UARTG			244
+#define TEGRA238_CLK_UARTH			245
+#define TEGRA238_CLK_UART_FST_MIPI_CAL		246
+#define TEGRA238_CLK_UFSDEV_REF			247
+#define TEGRA238_CLK_UFSHC			248
+#define TEGRA238_CLK_UPHY_PLL3			249
+#define TEGRA238_CLK_USB2_TRK			250
+#define TEGRA238_CLK_UTMIPLL_CLKOUT48		251
+#define TEGRA238_CLK_UTMIPLL_CLKOUT480		252
+#define TEGRA238_CLK_UTMIP_PLL			253
+#define TEGRA238_CLK_VIC			254
+#define TEGRA238_CLK_VPLL0			255
+#define TEGRA238_CLK_VPLL0_REF			256
+#define TEGRA238_CLK_VPLL1			257
+#define TEGRA238_CLK_XUSB_CORE_DEV		258
+#define TEGRA238_CLK_XUSB_CORE_HOST		259
+#define TEGRA238_CLK_XUSB_CORE_MUX		260
+#define TEGRA238_CLK_XUSB_CORE_SS		261
+#define TEGRA238_CLK_XUSB_FALCON		262
+#define TEGRA238_CLK_XUSB_FALCON_HOST		263
+#define TEGRA238_CLK_XUSB_FALCON_SS		264
+#define TEGRA238_CLK_XUSB_FS			265
+#define TEGRA238_CLK_XUSB_FS_DEV		266
+#define TEGRA238_CLK_XUSB_FS_HOST		267
+#define TEGRA238_CLK_XUSB_HS_HSICP		268
+#define TEGRA238_CLK_XUSB_SS			269
+#define TEGRA238_CLK_XUSB_SS_DEV		270
+#define TEGRA238_CLK_XUSB_SS_SUPERSPEED		271
+
+#endif /* DT_BINDINGS_CLOCK_NVIDIA_TEGRA238_H */
diff --git a/include/dt-bindings/reset/nvidia,tegra238.h b/include/dt-bindings/reset/nvidia,tegra238.h
new file mode 100644
index 000000000000..bf1eb27f1203
--- /dev/null
+++ b/include/dt-bindings/reset/nvidia,tegra238.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2021-2026, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_RESET_NVIDIA_TEGRA238_H
+#define DT_BINDINGS_RESET_NVIDIA_TEGRA238_H
+
+#define TEGRA238_RESET_ACTMON			1
+#define TEGRA238_RESET_ADSP_ALL			2
+#define TEGRA238_RESET_DSI_CORE			3
+#define TEGRA238_RESET_XUSB_DEV			4
+#define TEGRA238_RESET_XUSB_HOST		5
+#define TEGRA238_RESET_XUSB_SS			6
+/* RESERVED 7 */
+#define TEGRA238_RESET_DPAUX			8
+#define TEGRA238_RESET_OFA			9
+/* RESERVED 10:15 */
+#define TEGRA238_RESET_NVDISPLAY		16
+/* RESERVED 17 */
+#define TEGRA238_RESET_GPCDMA			18
+#define TEGRA238_RESET_GPU			19
+#define TEGRA238_RESET_HDA			20
+#define TEGRA238_RESET_HDACODEC			21
+/* RESERVED 22:23 */
+#define TEGRA238_RESET_I2C1			24
+/* RESERVED 25:28 */
+#define TEGRA238_RESET_I2C2			29
+#define TEGRA238_RESET_I2C3			30
+#define TEGRA238_RESET_I2C4			31
+#define TEGRA238_RESET_I2C6			32
+#define TEGRA238_RESET_I2C7			33
+#define TEGRA238_RESET_I2C8			34
+#define TEGRA238_RESET_I2C9			35
+#define TEGRA238_RESET_ISP			36
+#define TEGRA238_RESET_MIPI_CAL			37
+#define TEGRA238_RESET_MPHY_CLK_CTL		38
+#define TEGRA238_RESET_MPHY_L0_RX		39
+#define TEGRA238_RESET_MPHY_L0_TX		40
+#define TEGRA238_RESET_MPHY_L1_RX		41
+#define TEGRA238_RESET_MPHY_L1_TX		42
+/* RESERVED 43 */
+#define TEGRA238_RESET_NVDEC			44
+/* RESERVED 45:58 */
+#define TEGRA238_RESET_NVENC			59
+/* RESERVED 60:63 */
+#define TEGRA238_RESET_LA			64
+#define TEGRA238_RESET_HWPM			65
+/* RESERVED 66 */
+#define TEGRA238_RESET_CEC			67
+#define TEGRA238_RESET_PWM1			68
+#define TEGRA238_RESET_PWM2			69
+#define TEGRA238_RESET_PWM3			70
+#define TEGRA238_RESET_PWM4			71
+#define TEGRA238_RESET_PWM5			72
+#define TEGRA238_RESET_PWM6			73
+#define TEGRA238_RESET_PWM7			74
+#define TEGRA238_RESET_PWM8			75
+#define TEGRA238_RESET_QSPI0			76
+/* RESERVED 77:81 */
+#define TEGRA238_RESET_SDMMC1			82
+#define TEGRA238_RESET_RSVD_83			83
+#define TEGRA238_RESET_RSVD_84			84
+#define TEGRA238_RESET_SDMMC4			85
+/* RESERVED 86:90 */
+#define TEGRA238_RESET_SPI1			91
+#define TEGRA238_RESET_SPI2			92
+#define TEGRA238_RESET_SPI3			93
+#define TEGRA238_RESET_SPI4			94
+#define TEGRA238_RESET_TACH0			95
+#define TEGRA238_RESET_TACH1			96
+#define TEGRA238_RESET_SPI5			97
+#define TEGRA238_RESET_TSEC			98
+/* RESERVED 99 */
+#define TEGRA238_RESET_UARTA			100
+#define TEGRA238_RESET_UARTB			101
+#define TEGRA238_RESET_UARTC			102
+#define TEGRA238_RESET_UARTD			103
+#define TEGRA238_RESET_UARTE			104
+#define TEGRA238_RESET_UARTF			105
+/* RESERVED 106 */
+#define TEGRA238_RESET_UARTH			107
+#define TEGRA238_RESET_UFSHC			108
+#define TEGRA238_RESET_UFSHC_AXI_M		109
+#define TEGRA238_RESET_UFSHC_LP_SEQ		110
+#define TEGRA238_RESET_RSVD_111			111
+/* RESERVED 112 */
+#define TEGRA238_RESET_VIC			113
+#define TEGRA238_RESET_XUSB_PADCTL		114
+/* RESERVED 115 */
+#define TEGRA238_RESET_PEX0_CORE_0		116
+#define TEGRA238_RESET_PEX0_CORE_1		117
+#define TEGRA238_RESET_PEX0_CORE_2		118
+#define TEGRA238_RESET_PEX0_CORE_3		119
+/* RESERVED 120 */
+#define TEGRA238_RESET_PEX0_CORE_0_APB		121
+#define TEGRA238_RESET_PEX0_CORE_1_APB		122
+#define TEGRA238_RESET_PEX0_CORE_2_APB		123
+#define TEGRA238_RESET_PEX0_CORE_3_APB		124
+/* RESERVED 125 */
+#define TEGRA238_RESET_PEX0_COMMON_APB		126
+#define TEGRA238_RESET_RSVD_127			127
+/* RESERVED 128:143 */
+#define TEGRA238_RESET_DMIC5			144
+#define TEGRA238_RESET_APE			145
+#define TEGRA238_RESET_PEX_USB_UPHY		146
+#define TEGRA238_RESET_PEX_USB_UPHY_L0		147
+#define TEGRA238_RESET_PEX_USB_UPHY_L1		148
+#define TEGRA238_RESET_PEX_USB_UPHY_L2		149
+#define TEGRA238_RESET_PEX_USB_UPHY_L3		150
+#define TEGRA238_RESET_PEX_USB_UPHY_L4		151
+#define TEGRA238_RESET_PEX_USB_UPHY_L5		152
+#define TEGRA238_RESET_PEX_USB_UPHY_L6		153
+#define TEGRA238_RESET_PEX_USB_UPHY_L7		154
+#define TEGRA238_RESET_PEX_USB_UPHY_PLL0	159
+#define TEGRA238_RESET_PEX_USB_UPHY_PLL1	160
+#define TEGRA238_RESET_PEX_USB_UPHY_PLL2	161
+#define TEGRA238_RESET_PEX_USB_UPHY_PLL3	162
+/* RESERVED 163:173 */
+#define TEGRA238_RESET_FDE			174
+#define TEGRA238_RESET_ADSP_CORE0		175
+#define TEGRA238_RESET_ADSP_CORE1		176
+#define TEGRA238_RESET_ADSP_CORE2		177
+#define TEGRA238_RESET_ADSP_CORE3		178
+#define TEGRA238_RESET_APE_TKE			179
+
+#endif /* DT_BINDINGS_RESET_NVIDIA_TEGRA238_H */
-- 
2.43.0

