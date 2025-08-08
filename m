Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8483914885D;
	Fri,  8 Aug 2025 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636356; cv=fail; b=q/IgguJTPY+04YKM/K9kytelNqOgm2inFtLgX0QsPWieuu6X+0xonA20Z1hRuaqDeHXP1JTz2yOVxsCeS0VPl8BV6kJ1FQqnFUTx4TSm2ZaR49+sieeeCm6O84hsfYHOzt9bm3H9tWV3jTNeLy6WA2LDWzukJXbo7r+fRCJIjd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636356; c=relaxed/simple;
	bh=Dq3mjWYyRtbpr9QwgJ2dWBqIXTb+morBDUDnhhQ5kcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdnTvJIT9S2zHJa8kF9yCS+DriMi1Vo1rm8cTD7DdmQuRdVZch9QlgdDKV5YnlviF+oUHWImopbi8wX0HzWwlNXWfTglstIYfDvP68G10RN0d81755eU/UkeXojtyKC/JknH6oItZ6HjpKohcNsgUcGVaDmcHzdhjFLK1d839uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hH1wOezC; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hH1wOezC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ40iW5La1yk6lMmaW+zjB9P5nBa+ocZYXs8sBJ3UCqYv5h0NNu4X/vemcBaD/YQlYIPEkxmKtPmmsj6Pag/vKQsBc09fsptnYCewGbXRnVmfMa2FyeDyffLsmZz9cINcpK0zauyJWIGC5vhfnMG4hlS9jFprRNuR4q9NiUjMlxxiv/4aM+hMqghP04/LtQo97Ixf3V+T0zirBKjPJNPWwhvY2zk5duBh7UEMqcSmf5Xk82oBLED/ySJUg1BwphmZSDXdxQyA5MTcB1PZQ9jbbwiNs5csXyLmpGoF3PfLygBpfjuQWaXnUWZsRHIVn3yaRptVOLVEz4iBbKfAv6K7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T4OdjKxwd6xwPR5lRgElodoU4Iw6f85yNJBbWLzE0Q=;
 b=DkRZ8GQBmtDvcHqK9MiFSU25rUfozdbEMutyrcKTanI7K03xRBJzLQrxmiWT1lkZlwZu5hDJi3o+xTdPjnK/LwAfF5TbEUYr4LneLW4g3d7i5JaUxi5x1UdjgMRx5WhC6pywpQqpMN3CVnq2QWgksO7AK8Fc8TMXuE14qJOZw6MU0FbtFMAgiwykjSxE1lGI10LLC41jh+Ibj1u4juRzxEai0jwxjtZK7ScfUAEZ6FsfCq68EORBsrS8z0Pl7ihSo/552DwnE63FQr9bwWzrLcerAYkeQE9KLf3ZePzkTCSWFgrd90rZV4RM8QJQWFrjOvTwvbd8nu+EvY7XlNUA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T4OdjKxwd6xwPR5lRgElodoU4Iw6f85yNJBbWLzE0Q=;
 b=hH1wOezCyidrLkC1/358/CzDiGRz9KBxcoPJ6U0y1Ofq2W1b/smYLygtgQl8A3COYYVrpnktuKuxZA0iutujQhJ1tYkN6oSmjCN/kRQL6Aa+wIuXumTp/rJR+20nRTVW6z4uy9tIbAvpmOfqD4Wv4MsXA0vsUths4aEq0r9LsOxDA7GPyYJjRNLPDwYMfdhlbxH9ZhZb+CZEbAR2gQplK4J8ZZxIiNGmIfpBaoGf4HosADgQLUUjkld0kCqIvIc6bH3mHdnDLWmJUvOpfHZyOrfhaEEvz3oBWANBf8O0mjy2TG7AazsDskVNej1cmbsSFpi6HHpj9vxMYTQkrH8ngw==
Received: from MW4PR04CA0282.namprd04.prod.outlook.com (2603:10b6:303:89::17)
 by SJ2PR12MB9114.namprd12.prod.outlook.com (2603:10b6:a03:567::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 06:59:09 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::34) by MW4PR04CA0282.outlook.office365.com
 (2603:10b6:303:89::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Fri,
 8 Aug 2025 06:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 06:59:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 7 Aug
 2025 23:58:54 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 7 Aug 2025 23:58:49 -0700
From: Haotien Hsu <haotienh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mathias Nyman <mathias.nyman@intel.com>,
	"Brad Griffis" <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	"Vedant Deshpande" <vedantd@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, "Jui
 Chang Kuo" <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>, WK Tsai
	<wtsai@nvidia.com>
Subject: [PATCH v2 2/4] arm64: tegra: Add interrupts for Tegra234 USB wake events
Date: Fri, 8 Aug 2025 14:57:31 +0800
Message-ID: <20250808065733.347264-3-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808065733.347264-1-haotienh@nvidia.com>
References: <20250808065733.347264-1-haotienh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|SJ2PR12MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5fb787-5576-4477-5746-08ddd6491307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KZol3LAm0wEoy9LHspbvL0FVej9cO5+rOpyMrwAw0jWVWXSdEKK7RdSUgY7P?=
 =?us-ascii?Q?ogDkSIKVLGngfTYCuuGK94Y87fhcPJd96goPxHElKLJ/9i6KLeYwMSQFunYg?=
 =?us-ascii?Q?OU0vNsBGi7tuHyfCJ4afkQArW5nrKa35iScGAJFPtqtZVgYjXBC8u/oE0iw6?=
 =?us-ascii?Q?dZU37Znz9gE7AsTzmqxY987TwlVmMtKLwHoCVIop8Loq0J+umTagGyyroAcl?=
 =?us-ascii?Q?y8BX+K4da9vCAcC5EY5Hh/aSqdaflwPVByG7ti2ijPQ6izQA41qOnYgRkmTx?=
 =?us-ascii?Q?PNOekWbOIMAs5HWurNbgmolXRTlxwjzSUW4wVFRIHfzPJEemjfvt88z2tJs5?=
 =?us-ascii?Q?DRGCH+hJvlMWEZSb9ZXxxjMdqY79q4wXS7kDfIFKHkSxgzNQoQceHjZrCI+6?=
 =?us-ascii?Q?hwifbjyI9nFnsfOK3bPFBW03blEMrY3/cCmqX7rvnAvovbAvf+Ka2DoPM8l6?=
 =?us-ascii?Q?9plbSc0F/rdQ58h6Uqy1sjQP+rQkrLWSf9IgF7bgRp/Z6JFVjXz0zcdZttah?=
 =?us-ascii?Q?zZVmNCRRhxzTdvcksrDAzRYG1t5OxfM4nUhBoKofQ1pZnjOondUclJtWg1QS?=
 =?us-ascii?Q?4VfR/N2EgXSuzywNjYScKiyEOeqMXhMKow9OFEfj1dmCjcuo9lTGEYpCKGNJ?=
 =?us-ascii?Q?BH8iuqv7LTT8lzj8Baq5Kv9w31Qz33/r2Tr4iDNQVOsFmzTaxveCUZcqwfSH?=
 =?us-ascii?Q?DunbRixC7FYiMHAyhO4m4l78yS+0ysRyaUsG6CiEcuB1tBYYx1edSk9Xhjpw?=
 =?us-ascii?Q?qP45BAJ8IuHJSoZ9wg4O6lFGWz3NWnDKdDuHV5sNtx55bzCVbMoJDN+kYSWm?=
 =?us-ascii?Q?wzsCC38B8RfxM4413jMGhY1t/I0NrwBxvX39aBtUrQ6M27b/0euTjyoSUUnA?=
 =?us-ascii?Q?6EHwTuCD8klNGAfXvOdM+VsTrSknPsCky2t3MXox1VXkdUuqc3dKTk8Qa2b5?=
 =?us-ascii?Q?zqRlfpo33GYEYdIUrCAF/5m7qWRFaC8jDUBSxfrbKeRTWDPG/IvvucFJ7nwa?=
 =?us-ascii?Q?QCwln+/4HitLoafTt8R3DO5BCou35YctKb1gf/FXwM6lw/77P8GwG6zqbFbC?=
 =?us-ascii?Q?PAFl3H8oZAFaZKmDYLLR0qsvq7mM66p2ZZKozBZPe+FdnJ+PJmyQF3kBVRr2?=
 =?us-ascii?Q?OoqBkLHthZPJPBQxX54qc0+1XSjnsd3GAinrVunU1QHwzXCEVKg1yjDeeK4o?=
 =?us-ascii?Q?fGmqgNs30hDpPmRKFKemcZLslHVfA2uFG7Y6g2P6513g6HqiB+1eAUZWyug5?=
 =?us-ascii?Q?UfBXvqjkPbxvrEcmcci1c9lGqnNdrBiwU4MocSTtBZojpNpbvsAQduNgtfEb?=
 =?us-ascii?Q?Kwk9j3Qa8TEVM9XPm40jbrQ1Y/tSiRtwbj9HKEc9UxPLOkybxl/n/huNpW6I?=
 =?us-ascii?Q?M2FEZ9+QC2r5xrq8Y+4GOAprBWpNCInkygFHWUfY+BBtA0jfqQC4D/XUQp1V?=
 =?us-ascii?Q?aks6TTVp8ywuwq4NToQC28J67iWlVAb+1gM2vSXUaFp4aGsj+/f89CR3oZ28?=
 =?us-ascii?Q?aopHJ7UxUm5KiD94nGflG73lE+orAbAeiVvTaLddbFf3xPyW6kVHGnDDQg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:59:09.5697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5fb787-5576-4477-5746-08ddd6491307
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9114

Add interrupts for Tegra234 USB wake events to support the USB wake-up
function.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 2601b43b2d8c..9cf573fed6cb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -3254,8 +3254,15 @@ usb@3610000 {
 			      <0x0 0x03650000 0x0 0x10000>;
 			reg-names = "hcd", "fpci", "bar2";
 
-			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pmc 76 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pmc 77 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pmc 78 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pmc 79 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pmc 80 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pmc 81 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pmc 82 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
 				 <&bpmp TEGRA234_CLK_XUSB_FALCON>,
-- 
2.34.1

