Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB51E4AF;
	Fri, 16 Aug 2024 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723833848; cv=fail; b=knCMxMocbbQm1Ovjsw+hbfh6DNBCaPjVUemFTZ+P2UmLitSYbeSigDHnG9G4F6p9too8NA7Qa3fXoSmcpMI8TqbHbKscOoRTfRp/Zm+yO3RBab7S/IMgCIZH/qBRoNT+wf2/7c3C/NQwy1Ifc3rTyNGS5kJ7iS6jkpuhY/H/k1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723833848; c=relaxed/simple;
	bh=T0LPH0ef3U3YqlmDYjDC9jkgtOSWRHmjPMXheNozXFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xc/T0Nr5HTK5mhyoGWb2mbpkGNJKkQh2bFY5yxiujvKL1YO/7V+e/YePpqN9zj5u7SSToQwh5GtvJ3Z5GBdQkaMOl8T3wSPENUUGrifvJvoPc3E7NXVEY8jrsNHrty57dBCmrNclQ21gmyzqHtdeDxw7VzCGfvJMv6rlS6Q1sVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H63/IUE2; arc=fail smtp.client-ip=40.107.96.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H63/IUE2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRLNyiR0CZ7IRKrjYt1jx6cFCmqGUE4zoT0WYGwUi0DojJpnSJY4yRSJZVG4CCbNb+5mah8VQGRs+87kw+ziUTDrkCsUJg/sseGeKqdYL47rF0NHhAXIt+KzQ6cOQ8lY0gfisbu9K2ABDK+1+SpGImpLyFCohaNWRgMvlYPYjsKmbq04ZcV7FNslVdpvqTEGqiMfZ9ylzPVUo3hmQ0XWDBwVPKNeU3uun2k2+2AiDqHo8XSgyQ00ykOB1SN028AbDl2308MTbHGnp7PEmPZ3MwSaAwKPCgalZEKDpoegSOMynNJeHU5fZ2+LJiyV+S2T7ka1oq1wvp+sliIEzjjzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8Ic99twgi0UZh5RU9DQzq41WPAeFvkXNhRpVlROnBQ=;
 b=GNg07uTjuORrVe086fRRKNo6FIOVujnMPMiG+8E2TFgJYR5u8dOtmQ6xPHb2pFyLpzWWJLodHHTecR3+DYW6OnVb43h27shwJ0TzJkwNt821mx3Indgdx6Sf0MWYrzw0rwgNEAu+/kdcF1i/pYpwa6uuS2f0nCRmTqkgNLya3qnBhoJK7MZxdk95EWni2SxMLn4ia/LyUkSrgzq980LAZSIZNLDMojfnjg4jhwnJGXyGtrqGBL59DCKcfyEthD3ZlDkF/ygwPJYqvHyfzphLjI2OUbTGiFvjgNaTKwnATNRJG97CaUeL/M26G1mnsvtDu8Z7I31qTsJbBAaT9dimlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8Ic99twgi0UZh5RU9DQzq41WPAeFvkXNhRpVlROnBQ=;
 b=H63/IUE2zvQ7sUkUSvnG1O4BScbRSJwC/6OOzzbB2i00aJdBx2JFu+evcCniP9Hk9kr6ggKAo2cPYn5+0lB6pw2UvekRUM9B3glK6D69aN0ERYKZ0nMZ2oB+j3vlX4ia+8gsYplxYkizfOjF2Kx7AvwkIBgg8iCgKHWCVSNz7On1+m5gwrDQNXjHkrIGHfOTte7574po59KDHtYU9GmLDnPBkrj9x9Vpyti5MLFIxv0Tj5Q/Gp4R0019Pb/l0Q7ZVFhG7oBIEQpdfnfpr14dkxJiqnTTkoCTI5AA7dlF9rD9kjkecbLthelQUeJ6VxkAosZfPD/JdZU6+KtW6VaZUw==
Received: from BN0PR04CA0032.namprd04.prod.outlook.com (2603:10b6:408:e8::7)
 by SA3PR12MB7878.namprd12.prod.outlook.com (2603:10b6:806:31e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 18:44:03 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::8c) by BN0PR04CA0032.outlook.office365.com
 (2603:10b6:408:e8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Fri, 16 Aug 2024 18:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 18:44:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 Aug
 2024 11:44:00 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 16 Aug 2024 11:43:59 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 16 Aug 2024 11:43:59 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Add T234 PCIe C4 EP definition
Date: Fri, 16 Aug 2024 18:43:47 +0000
Message-ID: <20240816184348.2072535-2-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816184348.2072535-1-vedantd@nvidia.com>
References: <20240816184348.2072535-1-vedantd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|SA3PR12MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 202c46d6-ad7b-49c5-ad85-08dcbe236663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Cd3uLsSRCi5huFyHLj2By4VPcgcSO21iR/tREnZMytDUpKWdhXkpKemij4I?=
 =?us-ascii?Q?fYoAcOucQ341tTLp0XUTxfV8P1cwsJiWUkYmBwOWntsliMvv38oFVndjKKzG?=
 =?us-ascii?Q?LjEpGjriZ/qUFJyNJ5CXZDPK9O2PZQaoLnM/qkRSdLiH/3ShHjli4lvcyvOA?=
 =?us-ascii?Q?opQwcQZBrKggxrDYpxKWwc+SO+mHxBGec8gPzrSxdiT9/g/YfuJp8uglHlkj?=
 =?us-ascii?Q?fcDx2sUeQz6ZM7Z+LsLjp8YaopOs39XZdoEPO33FsZtzIvBcOe6pAGGdbjUc?=
 =?us-ascii?Q?5htODHo0AuGn0dDxEsv6mb3DfQFXSZEj2Z3PWRsJ2XxpKXP7TbgUK+sTz+OP?=
 =?us-ascii?Q?Xh2D6Po9ea6IJzs6LBDS+YCyUutnkJmg9G7/1TQ0lKzX7VkO52JLWZvCUyl2?=
 =?us-ascii?Q?8t18D5ZK/ZJqf6FAqhra9jYJchNd1jhAUPXtroBQNlJzwmQeYTRsL08bIn9Z?=
 =?us-ascii?Q?xO/0jUkFq3IA8qnA1D0H3az8WdBTT6Zhr8HPQLgDlJ75JFSLUPIRbtIVrvCm?=
 =?us-ascii?Q?e2ByI6EnBgN4U+ToxSXJXp+a+tDsp1n9MFN0MIt0ZLgW6pk153f6dtnErY0t?=
 =?us-ascii?Q?VuKp83piR4KmpAU8p/F27fgF4olPUp1TvhKRNIkL+u4Uka4vD3FzKRVoeprY?=
 =?us-ascii?Q?kxE+S2THnjYucQnXFuufYQjregB2LiRwo1y4lmgIO/kkaLPeGzaajYlWYxgm?=
 =?us-ascii?Q?iWviObDJgwg7t5phenx1IBe96tU3o6ygv2WDggZYDH5XepBKPjEkXwJfAa9X?=
 =?us-ascii?Q?K9mSlGZeEp+SLozYcwK4ITxlta4O17Wu4zMQtGeRzhMdukDbTC0BGnVtxuoB?=
 =?us-ascii?Q?+paqAOR5cN6YWSdUrfTdfzryMLMhft99mwlZKeUBupLZ3bueUPLxAqFjsmJY?=
 =?us-ascii?Q?4iBXIP/bYQpgIR+JhocF4XA6ztpz5MOY+V1eYA2yKRQAeu5pvXvs1lIUqWx6?=
 =?us-ascii?Q?iiTufcp0n+Wd5eGDmlcBAnNq4Hl06mUpWr3AW6+ooYshMM9NTTaSFRu8Hc3H?=
 =?us-ascii?Q?ydAIz2srhoV5uf3GC3hIHF+eUy7zdyXoK3DlEnzSAc7NrICSvlWKrpOprx3R?=
 =?us-ascii?Q?lEcTzoSzRYlfJR21dByaS+vDiMJGMMift4OrYMax8QSHMQIrFK0RLuVtYn5Q?=
 =?us-ascii?Q?0s4QghsEbmyW8Ty12ExMCYrBwA0oVB1pXs8sgL5EfeXfvfkNo2V86HUc8YqM?=
 =?us-ascii?Q?uTGRRyDEgLr6fChGAf5/85XqdUic9kLnunHgntYgl5Pl40L5930wnpI+/rjd?=
 =?us-ascii?Q?dUe47aL23uGrN+PENZZLp4u44wyOwNHr5uSlsISsxsWTsfp5rnQIcF7OHv9w?=
 =?us-ascii?Q?ZVUCinCb+CkX6+ERX135FCG7uT7BKg/lD+3gqlo+3Dt1uyX7udiLHPEIvHhj?=
 =?us-ascii?Q?5cIq+7IcAecg9P2oyjG7U0Bfha7c/EBSLitP3ll+RKiKEJy0Yrz1YMJNtLHA?=
 =?us-ascii?Q?4aHXwumg8/wyjAj4Z+j0Jl0S/+2Rno0m?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 18:44:02.8521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202c46d6-ad7b-49c5-ad85-08dcbe236663
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7878

Add PCIe C4 EP controller definition in device tree for T234 devices.

Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index f2e2d8d6845b..d41308428253 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4840,6 +4840,37 @@ pcie@14160000 {
 			status = "disabled";
 		};
 
+		pcie-ep@14160000 {
+			compatible = "nvidia,tegra234-pcie-ep";
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_PCIEX4BB>;
+			reg = <0x00 0x14160000 0x0 0x00020000     /* appl registers (128K)      */
+				0x00 0x36040000 0x0 0x00040000    /* iATU_DMA reg space (256K)  */
+				0x00 0x36080000 0x0 0x00040000    /* DBI space (256K)           */
+				0x21 0x40000000 0x3 0x00000000>;  /* Address Space (12G)        */
+			reg-names = "appl", "atu_dma", "dbi", "addr_space";
+			num-lanes = <4>;
+			clocks = <&bpmp TEGRA234_CLK_PEX0_C4_CORE>;
+			clock-names = "core";
+			resets = <&bpmp TEGRA234_RESET_PEX0_CORE_4_APB>,
+			       <&bpmp TEGRA234_RESET_PEX0_CORE_4>;
+			reset-names = "apb", "core";
+
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;  /* controller interrupt */
+			interrupt-names = "intr";
+			nvidia,bpmp = <&bpmp 4>;
+			nvidia,enable-ext-refclk;
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
+
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_PCIE4R &emc>,
+				      <&mc TEGRA234_MEMORY_CLIENT_PCIE4W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu_niso0 TEGRA234_SID_PCIE4>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		pcie@14180000 {
 			compatible = "nvidia,tegra234-pcie";
 			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_PCIEX4BA>;
-- 
2.25.1

