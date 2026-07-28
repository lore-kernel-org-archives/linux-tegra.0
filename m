Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A237531F98F;
	Tue, 28 Jul 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253903; cv=fail; b=A0K1vAV6RkJFfrftgaLKDrLzxgZp+MBUDkyJrhnBVfInMbGxYzWjRJYQogbiSLB/1aFbRGSKbrpdmeaj7clREPsdz80EQciHRQbNANGXT3yYerJHMaaKB505sfUnHA7Nfkg9uHVlTUeKZ4rbuKBZZF6cmFecBpxhyZVZCVzQyZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253903; c=relaxed/simple;
	bh=hGbaa2ccsLQqjG4blcacSiqHjPcCQnkXorTC7GquVGU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ou1sSsxO5O3u31B22PRfxOm6cOtT6KcxwG0VmfhBUHOs7BpxJ2AbzQpZHPR8MG+C3XVxcsiLKwHVW3hqvXI6OIEEz0n2U9qjzseKcBFq+4w47ZqoQuK5jJWgcmS5MouvXXFW6F7eNPDE0Ws8yHbnNQc4QglJXKlubrJybhxYXcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FFcYTYbR; arc=fail smtp.client-ip=52.101.56.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FFcYTYbR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdLgn/ZoPReVWJ37rhLrhx5p1wBiqUiJnEyA2o//IpoPkzDy0i25TxKRW6mnfh4iOvddxjMc77cjNx+ClqEg8TzLLg3awWSDiley+l33pKn1vd4UkYmVbY18ugqvmVmcxmopQYqz8beJcP2vt9swlsJNM5wnntAwtbldO466L9Ts7XRNZtGhdVPxsq7dDaP8H8EvchIE5eWEuIJ8lhI6qSIA0otAk4FLIJTOgg2HiH83FTCuOA3lhY6URJHRItmKN7Pkl9yWnLJFg24EkWH3VYsz8XdcwaRY1yFTRuaAcuFBGCw5FiHqMpVqgkZYurRGYd/CKZtwFJupMHoegk36vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mbtu7Ha5J3DsecctfPX2ZLdTmm8FjOJtylozY8yla4w=;
 b=kLQAgcSGTM/DMqPlDLFQ7/VOCRRLCd8bAMHlUNOTtkgWxhwnnV33HnMY4tBNLzBWLZqMXSp3IKP/GqrDth6TEK9G+XMorHpdNWBDUh011VdNlrgODm0rD88gQv3qPGe0D5ThJfQPOb/EVN4XIunT0RD7aGAcPrgjdx6In8i3UJ9YfdlAKCwEFbTLFU6jVvK2WJXusljClzcuwTPOyc4Ilts5iyWBf1tj/L9YA8TLvYTZZcK7WVUZ6WlrE6fjZTAvQ8ZKOILqDBFGpX19fZ85SVG0tU88D5ITt7IbIHpGLHJkSCHDtndSWnpgDxCKw2xdVIZ7rFat1NigkEwH7rC63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mbtu7Ha5J3DsecctfPX2ZLdTmm8FjOJtylozY8yla4w=;
 b=FFcYTYbR3MyQKJ+EcxIyKPT9BhFfq8k60DU9MDaEzYPFG3HVPKTRRchbNZ7mJP7ej1Ly0+xWulcamgzZ3uOgmvAWPAO3mrmdkFfG/J7T8lNidsTOcObAlTAIjQmaKMaSzDkX5s0l8g66wAQQubasTusAw5EQsnrCeVGeeZSbXdhnsfb3Zbib0nH5gkBepmNGf+fG+RUPQJO4bIqxeM/Cbi1zoDOjWKfjoF7Dn6NpyRK+Q2YfyWxxp/0G3QT6evLeDQYS1dHF2VOXtKJPBsD6F22a/s2prUwCHpfj71oA4CqaSBDLrwyEefmIbdHwsRTCg+XjbZ790jWJWJHSf+UYMQ==
Received: from MW4PR04CA0361.namprd04.prod.outlook.com (2603:10b6:303:81::6)
 by SJ2PR12MB7942.namprd12.prod.outlook.com (2603:10b6:a03:4c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 15:51:33 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::89) by MW4PR04CA0361.outlook.office365.com
 (2603:10b6:303:81::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 15:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 15:51:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 08:51:15 -0700
Received: from moonraker.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 08:51:13 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Marc Zyngier <maz@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add EL2 virtual timer interrupt for Tegra194
Date: Tue, 28 Jul 2026 16:50:59 +0100
Message-ID: <20260728155059.200363-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|SJ2PR12MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: aa28e99d-15f2-4cbf-a122-08deecc018df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|56012099006|5023799004|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K0Xq5AKJ03hGT7TTJfHaDAXwG151NNW+Hu7Snv7byIDW3PjsH/OKVQOwGrngc/IWbCUvqVWDxW7gr5RPO6URTo2axCR7HInXK04DNC+shnTRoWw1DXcrF3D3weIj/LbBtGvqvy9vtM8gTG2f+Pv8/PFJ9XroWF18aGw/pziDD7K44CNQwCSRe1vIoS8kcX6XqbFeKypzWR5813Ufsgvi8eDz3aR/LRMTQydPhTjeD9l8LPAMATRg4YgWneLbNjfljKeO+UK57iVkREucgEwlub1d45c/OMgi/Q7aLE0x3KE1DiJvCsqVsijlZw/RuvF/vx7uVVizP5+8GgM+xJc4NyTVmCu0Lqn+JQDJktb/ouczY3W+DdmIcRljhw9K4EKeZ59RwT6P9Gfb2gYpCh95+SsfHrxlEY/l/lXJ7LW1bcDwXbeDqfl7g2cgIF3xrF78976Itz3Wr+XWmLh3vLDBzuN6w0PoR/WEWKaFkQKpByGoZHgSgXKDWw0pMa6IXfWYgWnCRYkcUHr/AkJNzQGjVWtM2bktBkaA6YBmpMuVMHhYUejmFTbZ/TT+XxBRc2hedBbHXtDyGYj53vIPyLFiftHDVtvJ330hXEiIN5Zs2bvVKR/NoL57sECpk7Rm2ZYZdLvM/h/bZPp6WGUlOYLN+52la56+9zeD1xlfX+8vYwvrMNAiR37YbAyItNW6gtfL434hF7fOhRZ+80R0KXd2Xg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0AsuHOU2KVplg/OGkTsE3xV6s4kkca0byxitKSkhGmSCLCU/bbAKwQwtDFzHZik/dSXr/5qlLKH7r2GPfp0aflcXiULNU0i7v/A3yRuC6vkmaw9ITCz6dMW0yVJgPQlfosbwGMocdXK2K6Z8CSvmI4ceZT/UYN9jW171asUWtx8QgTCgpcKEHuraxVuleF9yx89Ycus70kpFcNpb93tLNx+mDfiE7wNbfTEz2w9pc1eZz5sPpEA9TBMB+heLpR9OV/HutGU1+fE5Olm0zvCyJuIb/IIfXE90laNv7kNa/kisEopXlsxHbhdD3etEXbiMhel8pW+7qfYpNNq+N9ZUF4VkNGNU60OSh3fN1cUU1xqVgJOoy1qweMTF3WpQvEG4fr4KAVWFJczzMAE7uLmeCKsMauNp8PtIx4zIdQfeaFKDDNMG6pYKBCX3rckT2Lit
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:51:32.6874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa28e99d-15f2-4cbf-a122-08deecc018df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7942

Commit d87773de9efe ("clocksource/drivers/arm_arch_timer: Default to EL2
virtual timer when running VHE") updated the ARM arch timer driver to
use the virtual timer by default if the CPU is running at EL2 with VHE
enabled. If the CPU is running at EL2 with VHE enabled but there is no
interrupt provided for the virtual timer, then the following warning is
displayed:

 arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer
  interrupt

This warning is observed on Tegra194 platforms. Tegra194 SoC includes
NVIDIA Carmel ARM v8.2 CPUs and support an EL2 virtual timer. Fix the
above warning by adding the PPI for the EL2 virtual timer interrupt for
Tegra194.

Fixes: 5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index eb7e3c666df6..5e510f77b538 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -3176,6 +3176,8 @@ timer {
 			     <GIC_PPI 11
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 15
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 		always-on;
-- 
2.43.0

