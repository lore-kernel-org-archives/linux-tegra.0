Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376262C3261;
	Wed, 21 Jan 2026 10:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992364; cv=fail; b=ZiE4Qu3pacAmCyG52XQ2MrvGIQ/HKWx3HUK2QNMBpFQ9c9SwWLQMlmZdCYAi/0xTP4pYqOfe25pZaY2r6t22Hi1Qj5h83tWU2YBe3iQ4jg3umUf0nUmFmigye9C+m102DxqwOjj0eH64MXO0PZrWImjeWCGxTIDxJBFCpLupig8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992364; c=relaxed/simple;
	bh=qK/wpROJ24g+hMhHxufiXPVNXbnsnGGmvORl1wXu5pM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsIUQAk7Wzn63ZGEdDLRexfotueqqUEeRGit2UL+8vM8oSsdnBjRVM50CAduQ+cy9bLkUPmlVvYup115sxzAHqFhMn9ozRuWZ2W2747tWX1+jYv76/v6/cdXOfv2Sb9rf32VFiVThTowHi28QXfU7dmm/x/lr2evIz3p7vx/erc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AzQk+g4T; arc=fail smtp.client-ip=40.93.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AzQk+g4T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciYYE88eTmZnhzAxumk7QGrqR/OUcH5DRrjYUKGs1+teBLyCRZa5pq7YLaEXxyFMACMmmVCAsIUWGx08Vzy/ZrefRH8FIUKn2pAqh7wq2YgPFd+2/wv2eHSGEl6j3CyRLi+aMFjIDTEqHrHr+/WCCwWv/vj8cR4Me1hb4Upe12JTuK8DlNfAkikPe8XVS2q/uC84qKLa3AJJpYkW8+ll9eAREs10nhY9lPH0oPhRapvseJcJB1zVze6FKOWXsXzcPiPTTpgumpCDcqCIa8MgU9uqTf39+YfR8J4m2NF4Wd/XfNnewj5JhYyd3d5NGZ1YRploPRJpLipvUx2KUT5Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nPylzHWcpsEjsag8dtT3ly+pa73gudqVORl92QF/as=;
 b=BBAcY5lVpcudfSA+SrCHWyRndudPHv/k4r44o1ixGMWUy+i8Qeyem5E1GzGD+8rvQBS1uLlLrIp9A+obgjZ5dP1jBAR+vb0DmoPPIZbSHvHGIQ35X0zoXJO+K3/FNCCD6gfH2VuW6z2/2W7RjGgeOsRQgoj/uBtaNzEdjw5pMfQ8IKmbqXYY0zZiJXKWxUS78oOY9W0ygeZ0b89rsnbj/Xl+TDmqWdjvVg7cdIYukzms41u4Bh+Pr60q42HBATs2tgP6SlhDM9a4Fv0rvFueUvr/rZBgZ1ZwMw5bkf1AVLXc7clwdhOaOGFRnwsjGXEOYNKLKwfE/iDqJkgbKx76mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nPylzHWcpsEjsag8dtT3ly+pa73gudqVORl92QF/as=;
 b=AzQk+g4TlZcMboKMH9Mpp3qVfzL8yPO+gQ84gSOugmumhcf+vXgm82LrtlclQHT5NBhdVVO8dWNejRpMRitcwswttnAzTbo1EDGyjyONG7SwQ2t8LrpxUWv9qdbIgUfC+Rsz1rKSyQsYDnuNnLevm9Y6RK9JdwqjKtUfiVTS84ZbJXPrn/1nJCZf/96RReVBSUbQBAXhUsRNvdgqWyebE/M7FAquvKS/Hp2Spqx1SS2KIsWX7jZvVpWzCZw2kpJp1eOpFZkFdUJPosBUUFoiOCGG2t17sgKP5tCEkxS9DCLYQqoicFIpxqC2TXEs/lxXq3+j6986/JzVWCqahPgdzg==
Received: from PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::13)
 by PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:45:58 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::65) by PH5P220CA0010.outlook.office365.com
 (2603:10b6:510:34a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 10:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:45:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:47 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:46 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:45:44 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 1/3] arm64: dts: tegra234: Fix CPU compatible string to cortex-a78ae
Date: Wed, 21 Jan 2026 16:15:34 +0530
Message-ID: <20260121104536.3214101-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121104536.3214101-1-sumitg@nvidia.com>
References: <20260121104536.3214101-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 883c72dc-601f-4463-7fe8-08de58da42f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4pRFBF8Fq+KNBGmTVeCjak70RzO+DJw785Zc9izeK1lQIrAKVHfkxPjt3BTj?=
 =?us-ascii?Q?1HZICGujI1/LoIAB7SSuw9CF4buLnua1FfA+WPR19xI8phgKLH8vdWf1O0EH?=
 =?us-ascii?Q?zwQGrhDOvTM+0vgZ8ZfWE7DpQb/ID4i5ykigbyT5tymTp/H04Pj842huFdq8?=
 =?us-ascii?Q?TK9QzAP4BjI2wFdwvLumgAAyAr6RGT1/sF+1Ygo76xW2uopTXiU7AfZyMGNs?=
 =?us-ascii?Q?gZFe0+nA+v+4yDuL/E03EiqxCdOuhL44NkOxtBaqMEqB81I9itYNU4dtF6H9?=
 =?us-ascii?Q?9BGoN1yg65YeC5lrUCzXQY262EPM3MIb9IqHRoqPJZFS+BWBkzqmp/YqBIpv?=
 =?us-ascii?Q?mBZ7d3ZmX+B8LZ2Vgzd4P4ArCSqzVYovqhhbhuk+fOGr+IM+EuiqS2lHOhpk?=
 =?us-ascii?Q?SXA8+VWEJNBK+7ZZYN7RpNJU5q5Aj9fc6sJGcDMYNFxQ6Jbi8el3RD7eZo/m?=
 =?us-ascii?Q?IGM7lgNk3fpnlFtP0deYHkV6T3EUHbmxmFbyj6O3MKO8g736YZ3TBd0TiFNF?=
 =?us-ascii?Q?RWSb69ryRGwws/oU5dZNfxw6tnZfnko+3OHv8RPp4KO5m16ydem4xfxqsSk1?=
 =?us-ascii?Q?+Thnnz+QQGgF8ggMdSkgi7W/7FvA3NAwEXe4W5T4vWy/rQFHjEsYJsBuUDWk?=
 =?us-ascii?Q?EdgQVS1DzpZwF1BYYDoDZpT4lbhvTFsULoq/JC3ETtjAt7vivWYDRUdLhx42?=
 =?us-ascii?Q?HW0SlKO2/H92Q6gUJpO3OYIVj5K0J8aQglZ5SmxLCOCDEa9iK24YbCudN2QR?=
 =?us-ascii?Q?38ULnSDDqtNWeoAa8lUchQYDGOmxSbbp0QPxlQ6WDD++L8U0jqAGdwirSqHP?=
 =?us-ascii?Q?uyXkhXpXMyV/Yze0TYPi9z3HI0WrzDdks7OOlRWhQB8Yb1dbGah8FlOx2a8x?=
 =?us-ascii?Q?JFrwhwGW90dcxyKFFlCh82AOyG2SUdvvqPYiPgvIHLRNePYhWVpRLZlXbN5F?=
 =?us-ascii?Q?mMLFwrBAsrnv8wKV8vW2VO49b23tTM0+90hVqXs757dmR4D+mE21GgocUnV4?=
 =?us-ascii?Q?gI9bk8B4cZa1OtwFvmxCi3MvSq+G30hXBkUUDNXSnEGEERAIB3K96RqGVBJ6?=
 =?us-ascii?Q?JqIRvsxII7HB1oXVcl6wSwC6gHRkJTi/nMjjcpaJNbtlCHRtM20u75JEir94?=
 =?us-ascii?Q?Zyi6IYCeqFd4Ql/X78XKtNImR+yF9lrOgast7Gsj9+ux9wtayCBlxVlzFxOq?=
 =?us-ascii?Q?bmvWzQUa2U0IGmgmAcs+c+na0GSx8NgBv0iBS5YXYhczu/qamhrH951NE4Aw?=
 =?us-ascii?Q?f1jhiJR0qIpK7NpRoZA4Z0W4IqU5AnQu8R/yv68GRlNiS9ghSxSgnbTIkHYz?=
 =?us-ascii?Q?h/SMXPiCeK3i1qIv1Y23MgKBq6cOQir1ZHcMcyNsziHrdhzT2CQpcG0xvHqc?=
 =?us-ascii?Q?Mny0V93TBjhWBqthfGWVLVNkufKaUwdqARlWMUisazgHAW/ADkXrToyJB5y3?=
 =?us-ascii?Q?5eCc7zrPNr9Igg8uNNsXfiMMyTVAoFt6Cn7an8pEXsWiV4qWTe4rIbrbIFbi?=
 =?us-ascii?Q?5tdSErtqAJNhCAlS5eeKJu1MW7NhG70XGEF6vumkS6/FLR4UcYQJ1lNYq9lE?=
 =?us-ascii?Q?ck44bt+6i5J0xXAAz7H0N9KWRhzpohrIF6GePB9BycKeFm+iTRSer0uxmKiJ?=
 =?us-ascii?Q?DLKWdsY8MdWcYyQPCzjfI+odtnNFhGMpkLudqJh0sM1mXCu+e9w4kpHt2IxI?=
 =?us-ascii?Q?OgzMPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:45:58.1421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 883c72dc-601f-4463-7fe8-08de58da42f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151

The Tegra234 SoC uses Cortex-A78AE cores, not Cortex-A78. Update the
compatible string for all CPU nodes to match the actual hardware.

Tegra234 hardware reports:
  # head /proc/cpuinfo | egrep 'implementer|part'
  CPU implementer : 0x41
  CPU part        : 0xd42

Which maps to (from arch/arm64/include/asm/cputype.h):
  #define ARM_CPU_IMP_ARM              0x41
  #define ARM_CPU_PART_CORTEX_A78AE    0xD42

Fixes: a12cf5c339b08 ("arm64: tegra: Describe Tegra234 CPU hierarchy")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 850c473235e3..13ec999e52ef 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5339,7 +5339,7 @@ cpus {
 		#size-cells = <0>;
 
 		cpu0_0: cpu@0 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x00000>;
 
@@ -5358,7 +5358,7 @@ cpu0_0: cpu@0 {
 		};
 
 		cpu0_1: cpu@100 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x00100>;
 
@@ -5377,7 +5377,7 @@ cpu0_1: cpu@100 {
 		};
 
 		cpu0_2: cpu@200 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x00200>;
 
@@ -5396,7 +5396,7 @@ cpu0_2: cpu@200 {
 		};
 
 		cpu0_3: cpu@300 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x00300>;
 
@@ -5415,7 +5415,7 @@ cpu0_3: cpu@300 {
 		};
 
 		cpu1_0: cpu@10000 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x10000>;
 
@@ -5434,7 +5434,7 @@ cpu1_0: cpu@10000 {
 		};
 
 		cpu1_1: cpu@10100 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x10100>;
 
@@ -5453,7 +5453,7 @@ cpu1_1: cpu@10100 {
 		};
 
 		cpu1_2: cpu@10200 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x10200>;
 
@@ -5472,7 +5472,7 @@ cpu1_2: cpu@10200 {
 		};
 
 		cpu1_3: cpu@10300 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x10300>;
 
@@ -5491,7 +5491,7 @@ cpu1_3: cpu@10300 {
 		};
 
 		cpu2_0: cpu@20000 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x20000>;
 
@@ -5510,7 +5510,7 @@ cpu2_0: cpu@20000 {
 		};
 
 		cpu2_1: cpu@20100 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x20100>;
 
@@ -5529,7 +5529,7 @@ cpu2_1: cpu@20100 {
 		};
 
 		cpu2_2: cpu@20200 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x20200>;
 
@@ -5548,7 +5548,7 @@ cpu2_2: cpu@20200 {
 		};
 
 		cpu2_3: cpu@20300 {
-			compatible = "arm,cortex-a78";
+			compatible = "arm,cortex-a78ae";
 			device_type = "cpu";
 			reg = <0x20300>;
 
-- 
2.34.1

