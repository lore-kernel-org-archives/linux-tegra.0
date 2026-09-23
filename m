Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010034.outbound.protection.outlook.com [52.101.193.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B34457A4;
	Wed, 23 Sep 2026 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147658; cv=fail; b=fU6GWTYapKOJyOiD8lSvKQ0y6KM0DOF02WoH8VtzMIH/b0gVd3f+lwkMT8109hVd1EorNq9GPiw2rmhTcDNMZkVcBaPbonCVrlqCCgePkvPwbTgYJ1Fm0yjAjqd8Uv4eCnfucLwNaAPsKWKC4+9MSzBSVKJuZpXnGW1k5D/kTNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147658; c=relaxed/simple;
	bh=f0U2U/wtJycMUgR9Z8rw6qlBUxLsBPha+MMlrnTSdEo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gf8TEonFnEQFsyQviwvHoHMMWlpVSDr+ZmaR20Pw1pDz3lty83NmM5tV+iJ96yHrgM02aDCm1jg8X5hZD549kc2AmWqeCydVJ80fa0x4Rtjowh37KaGfU1g9hdj5n59l9a1pSpaH7lrdoo9RWeKk3KZniYLHSAzGxiMI8XA3X1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qOw071Br; arc=fail smtp.client-ip=52.101.193.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qOw071Br"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVzXw+5LI8MEI33tqVySqiL3NO3pK+HTaVB9qasNtwLoqla3wzDtSS2LKSDkq/0gY3aX6IMqMWz1M6Xx3qJ7Ntx9V23MEtrlD39HjNYjUHep89GrZi8RNHKHJ0r1uL/2T6kjdrEU9rWEsq/O38041/GEJAx40mRbG5rYrAC7f63UmQQMFVo74xXhgBhsmV7GzEfQ7y7KY/lPp8lsL6QAa9AG/nn+KgQSKZXP4nUD+56b/bZVtdrJu50dnBonn5MMknvK52ckNvRHevzkVw5GrEI9EjkD3CCRYEU29vdoPNwhuHRN6miyZ1l04x/3KfFgqi8pFLCYG5ux6FQsOVauoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X64djyfCFesYP6GYdHBjrhOilZOkCf82vc9oEQQFdHc=;
 b=BlwyexK7xs4dSPCCaKlSwpgq3yiGZxPOUzQwKIuTH0IpRoQ0BsgMt+fk6DzWlFsu3+0iMD1iT6Oy6IMvI3L1muf6wGExiF1wznuz5+QEcc6Xi3T7Hv6GK7iNwsUWpTHoLHnHbL4u/byERouD7Fr/0EdEXILuFDUSB7OixHz2V/O6bvS5nk9G947ADyERwRcX1sig3SdS4fsn5Y/JvEZMECqGNS28g5g+GVH/5fIvxjwDGThYFBOmuE+nQGsSfEdBz1NQ9giHCCjfYqDnxMk4v5zwigwqu9r9eCR1fgqBZV8hGjdFidwZXQOXUFO8Xlw3znSL066Gq1ETgpvnVr3eQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X64djyfCFesYP6GYdHBjrhOilZOkCf82vc9oEQQFdHc=;
 b=qOw071BrlDYXbPERjD4xXwzT+yo/Yh9VbQexnp9Ymyowsz0uEgcBirOgbx+K0A+NJtg4O6hJOBNU4cmCkVPnKRsEXOuH1aO3qJypBntJJm0UZX5PCzx9pAteDsNw7tOTAzDelzcKgj8v5yK9NsRANkZsi8ppcz9G/4QH5IrsH+HD/AWHTH8kA6kgbpElMJ0SyafyiLeQSeFcYDgL7xngw1tHWYXIFftsQWYusy7+DLc18nIHOgOd9ggEVF/fUfztnUL1M3gRHaXQwF6j1xso7vcWhgNa6puvpsxEoWm3N3pV/CmbAp59M7jWBEfqdMrUtQG2p8Q92stRH8n3GxFirg==
Received: from MW4PR03CA0280.namprd03.prod.outlook.com (2603:10b6:303:b5::15)
 by PH8PR12MB6867.namprd12.prod.outlook.com (2603:10b6:510:1ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 07:14:11 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::52) by MW4PR03CA0280.outlook.office365.com
 (2603:10b6:303:b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 07:14:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 07:14:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 00:13:51 -0700
Received: from mmaddireddy-ubuntu.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 00:13:48 -0700
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH] arm64: tegra: Use iommus for PCIe endpoint controllers
Date: Wed, 23 Sep 2026 12:43:20 +0530
Message-ID: <20260923071320.1131096-1-mmaddireddy@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|PH8PR12MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: aa95af56-ce9c-4fdf-eeef-08df19424436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	W8g+5a4w5LjehZ/CxsxWRDdeFZPkF1c0KBSUPMDkFb3cygo1VAanZMMJb25io7fzYOwaZ4gI+MZvaztuld3pwkdFJGBu4PKZZL+gFs60B5gBZC0lf5yU/26wzNVtmSOD5NKa0JgAzmkoaRhxYI7ma/HlC0Uzib8Kst7jsXbH5Nfa/6OuYbjtOSjbgyVUYbyBN8BLenjT9S2a3Gj0GjcOH3hEihqCmH1hGKWZOOpLcKzbySJcbZjwJcq0JLu+vcX3YCXZN9rEFoIoP3EgIh29MbNG6il3PMylWDQGBrAceJTnAKlWvmIwsxmNiCvtYa6Jn+AozSZrBdzaF9Ooj9/jTWIE6tfGfmOJ74jcUg4xIUMO0q/SqtPHC9QooRjBZCiC80QFC4BV4s9sFBljay9kKNDs7NajnMJnfxwVLi8eW/CyKdne7cdMqIfiH2NXv+YPBx45MN7Ewt7N9l5LJvJTwk99aXtdpjLz4jRglB5Bex4/ta2PGsRBfTH8vjYl1VPpc+1qElAz+rl1riIwak7Eh75FAdxVTXDvAfIdeZCxHTvtTcA8YbMoXL542T9D1NVTVedTgoJgXGf7Dzvpjs0/8k7+A5HwVNtrqvp5TYSTar2cqsb77CLHnxTh1uchZW0Px7cfvbONFPFDv8zJubKU90i0UnfqCXZG4g7Kb9hN8yIkXXGrscC2lFJJdXh4nmUeFEwn2krurDxmnbPXTg6trA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/j8eo/2XgEs02L++jIlSq0FT5JBWSsC8d3OVgfutapVh5gyrDyocLMMtsllxJqzBMirJCY/NdjnchYpiHbr0KSw8WGCYl657d+3Wfmo/CMI76rONuU7iuy3jL4XkV5KQhYyv6ap6/s1nhSn87kLZIjSjMpgKKUyDKWb8KlixQZQKRrvpgIpbGF7Zf4BDRuRO2cx4a+gC5LmlWCpiPccZ8PiR+T1amwmTLkYyZFthvHvnvLPgV6nity99gl/MuIkXOUg+l3I3uSCv1g/+AevBn71/7OMCTe6Le7jkuJEwAjiE7mXOzxq0tngi/ugKA3x8E9Fe3XDyAErBFqehAf51zPkZcjgLapoEMfxAZeA+tsm1Za412bJbT3Buf/fwd6+KEfaHQEaVkYB84cuAnOre+yKk2se5KV5yhsvHqDuMQebBnNUZn8joHqk2fPEWDHCC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:14:11.1423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa95af56-ce9c-4fdf-eeef-08df19424436
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6867

Tegra PCIe endpoint controllers are platform devices and issue DMA as SoC
masters. Attach them directly to the SMMU with an iommus property so the
platform device gets an IOMMU fwspec and domain during probe.

The endpoint controllers supported by the Tegra194/234 PCIe driver expose a
single endpoint function. They do not need iommu-map or iommu-map-mask
properties because there is no endpoint function/device ID mapping to
express. Those properties also do not attach the endpoint controller
platform device itself to the SMMU.

Use direct iommus properties for the Tegra194 and Tegra234 PCIe endpoint
nodes and remove the unnecessary iommu-map properties from those nodes.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  9 +++------
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++--------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 5e510f77b538..a7843bae02ac 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2596,8 +2596,7 @@ pcie-ep@14160000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
 			interconnect-names = "dma-mem", "write";
-			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
-			iommu-map-mask = <0x0>;
+			iommus = <&smmu TEGRA194_SID_PCIE4>;
 			dma-coherent;
 		};
 
@@ -2689,8 +2688,7 @@ pcie-ep@14180000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
 			interconnect-names = "dma-mem", "write";
-			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
-			iommu-map-mask = <0x0>;
+			iommus = <&smmu TEGRA194_SID_PCIE0>;
 			dma-coherent;
 		};
 
@@ -2788,8 +2786,7 @@ pcie-ep@141a0000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
 			interconnect-names = "dma-mem", "write";
-			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
-			iommu-map-mask = <0x0>;
+			iommus = <&smmu TEGRA194_SID_PCIE5>;
 			dma-coherent;
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 5e29316a4d75..6fb2ff1253c4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4694,8 +4694,7 @@ pcie-ep@140e0000 {
 			interconnects = <&mc TEGRA234_MEMORY_CLIENT_PCIE10AR &emc>,
 					<&mc TEGRA234_MEMORY_CLIENT_PCIE10AW &emc>;
 			interconnect-names = "dma-mem", "write";
-			iommu-map = <0x0 &smmu_niso1 TEGRA234_SID_PCIE10 0x1000>;
-			iommu-map-mask = <0x0>;
+			iommus = <&smmu_niso1 TEGRA234_SID_PCIE10>;
 			dma-coherent;
 
 			status = "disabled";
@@ -5099,8 +5098,7 @@ pcie-ep@141a0000 {
 			interconnects = <&mc TEGRA234_MEMORY_CLIENT_PCIE5R &emc>,
 					<&mc TEGRA234_MEMORY_CLIENT_PCIE5W &emc>;
 			interconnect-names = "dma-mem", "write";
-			iommu-map = <0x0 &smmu_niso0 TEGRA234_SID_PCIE5 0x1000>;
-			iommu-map-mask = <0x0>;
+			iommus = <&smmu_niso0 TEGRA234_SID_PCIE5>;
 			dma-coherent;
 
 			status = "disabled";
@@ -5195,8 +5193,7 @@ pcie-ep@141c0000 {
 			interconnects = <&mc TEGRA234_MEMORY_CLIENT_PCIE6AR &emc>,
 					<&mc TEGRA234_MEMORY_CLIENT_PCIE6AW &emc>;
 			interconnect-names = "dma-mem", "write";
-			iommu-map = <0x0 &smmu_niso0 TEGRA234_SID_PCIE6 0x1000>;
-			iommu-map-mask = <0x0>;
+			iommus = <&smmu_niso0 TEGRA234_SID_PCIE6>;
 			dma-coherent;
 
 			status = "disabled";
@@ -5291,8 +5288,7 @@ pcie-ep@141e0000 {
 			interconnects = <&mc TEGRA234_MEMORY_CLIENT_PCIE7AR &emc>,
 					<&mc TEGRA234_MEMORY_CLIENT_PCIE7AW &emc>;
 			interconnect-names = "dma-mem", "write";
-			iommu-map = <0x0 &smmu_niso1 TEGRA234_SID_PCIE7 0x1000>;
-			iommu-map-mask = <0x0>;
+			iommus = <&smmu_niso1 TEGRA234_SID_PCIE7>;
 			dma-coherent;
 
 			status = "disabled";
-- 
2.34.1

