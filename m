Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240C22A4EE;
	Fri,  1 Aug 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042329; cv=fail; b=Yi1+BfFn4akFv9tYIYJ5YLAioe6KUnA5veJX3nA4F8zik3DcBB4/lVlyCPTgLWTEC4GhrpA4jlKR7+Kwrlm+pwJGKP6AwRDbrp/3ClfX6PrzqOvwci9ci31or9TDU6c2CRGxqv2A+UlgPQ/ryJxJWkrkf3t6X/o9Euyl1eNs5ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042329; c=relaxed/simple;
	bh=Dq3mjWYyRtbpr9QwgJ2dWBqIXTb+morBDUDnhhQ5kcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNnQw72vgCvrgvVeOJMw9lSdvR7BjXuGAkR5Ez6zzlkD913xNqcAzm3HuVQMKTEGs7T8YXCRzGBXGHjqYhMTUIPn5/nuTpl39Dx+DWEvLi0GbvsQdN0SN3LZJiy5FzQSJF2EQx6363D60bDZQThi45UrWHj0Aoknv8vkgvCtqj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A27ibfUW; arc=fail smtp.client-ip=40.107.96.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A27ibfUW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihRBfDoP8lfmSlUGha51esHJkiosaE0tjh5m8VaP8kBgzUijdpvUirK4X1b9+NK4l2/aAI1Lu+hLldDF6SJmFePFaYGgMfkeq4qttkuUMIs8ZH1U0o0acC1W5CTLFcEN3jp6hdSrtMNp97ovWTH/p9jzGlbUIhGN7Axna449GECDA07GtEHF0OK9D/eMxfg5fL2fxy4METefcOY46xW1OmS05wmzTWoN1oIYxHP4nVF/48/cMGjVnKK789ZMsqJukiaE5PTe3nJR+3wHG5OOSzOqQpQHN7uA8q1cX+x+H1laaj6fzeIzQyDMXKEhH5XvYIKpGtHOzsFREVC0vb0yoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T4OdjKxwd6xwPR5lRgElodoU4Iw6f85yNJBbWLzE0Q=;
 b=iafMDzr1x/6h4+zpqpBXFQMw0lggEE7J6pTFa2SX9uq2LXx75Aro3WrD78OqUpIUZTxCkUqW0ZVFhqrVfkpM45d+WI7m+EHDp3on2+pe9sUirFfRiME9sE7U7NX3Hq3kKjREjF9+qy7gFFXYZw+HarsGJEakMq2jqnONkrSkwBBDIQMDG2f5IX1HP6Hm8LaLYxYUuIY8w6AtmLEtXF9OpUrnfm5FNFrjFCX8O+hoBe0A/PI7jIc1lvi0zMeSAobRyiQygJbbY+aTZk4FO7FJ0jOUMT9EwM16ix9PGeFqxb3A9kAGR0WGeY217DKm166GRuxtMnVEDDCgrVCA0rtx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T4OdjKxwd6xwPR5lRgElodoU4Iw6f85yNJBbWLzE0Q=;
 b=A27ibfUWpoxbZt9EXCwgHaovblGXe0bm0GG1/rRXtuG1Eja3Cf57GnQN/iksBg7+Ux4oX90p02l7DOjubVXeG6pGRlJQqCF9A7up/qKPJrtH4xu0nPjJSrAsPf16qXVPTfcvujh3KVUl1qaksSHns0+uND8HslpXauoIy07rU5LmEz4helaCE0s6NeiNr5w+nTfN0L/6xSB1WgOmYMCc09THuq/mR8jqg9F04JQH32EyYDi4iNFW2GzsVWCcF43tL4jkMLRRp56ROpqnVN9k2MoXDRgK97fOQ/F7kSxnnJveU+m855S6kbHHKXJG4ChXGjQm/KEsFNsHo59W2RnwkA==
Received: from BYAPR02CA0037.namprd02.prod.outlook.com (2603:10b6:a03:54::14)
 by CY5PR12MB6322.namprd12.prod.outlook.com (2603:10b6:930:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Fri, 1 Aug
 2025 09:58:44 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:54:cafe::8a) by BYAPR02CA0037.outlook.office365.com
 (2603:10b6:a03:54::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 09:58:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.0 via Frontend Transport; Fri, 1 Aug 2025 09:58:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 1 Aug
 2025 02:58:13 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 1 Aug 2025 02:58:08 -0700
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
Subject: [PATCH 2/4] arm64: tegra: Add interrupts for Tegra234 USB wake events
Date: Fri, 1 Aug 2025 17:57:46 +0800
Message-ID: <20250801095748.385437-3-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801095748.385437-1-haotienh@nvidia.com>
References: <20250801095748.385437-1-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|CY5PR12MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 084fdc9a-c81b-4c06-6324-08ddd0e20067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kdtXM1FiUg3vETBNm3cV/j3j+7BC1TyYza2BGGfEoPFEEiER5bn942H9pvfA?=
 =?us-ascii?Q?wF4mPUqZq13ZgBgj8YXrtSTQBgeOBJ5fXG/j0Px2K40g0wjVPV2L0KBYnk9E?=
 =?us-ascii?Q?dE/b2Rm5tHqSrJljE3jii6wadoCHuUG9xVR2tIGMOojs4QJ5FZwsyMltAiHC?=
 =?us-ascii?Q?vHiRlV8kM35K8txVfCpPUUjhDEi3axlHUOFwG4UWxpK14pQSu3Quj+VnyLfk?=
 =?us-ascii?Q?sk77PSdzuTZvdzZ0Pxll0LI9xRZzpZK4MckAMm9luBfaa3a9ylgznka2JI/a?=
 =?us-ascii?Q?s0Prk3bjPHQkXtV87zOuIG9u5WRTW/f9hNj4F30J9ZRwjO6a+WNPk/8e/inP?=
 =?us-ascii?Q?bEucepKQiE+j2uCB6KagJY/PV3dY3ujhowU3BawNeY4nby0gJRI2uF+Vufiv?=
 =?us-ascii?Q?OireqsqtpNZPKYVKAabUUIMJ/AqitJn5sv9My16hUv/ktxDp4FFG6fCWzj3a?=
 =?us-ascii?Q?84V296zVioGap7Ag2hZHANPIHMGFNORUnwjIViea7NNhDoZya8eyhESoS2zm?=
 =?us-ascii?Q?DkVpN6NVgLFYvYqMGMPuM1YnoFzA1BBMsS6LcqC9McM4UgwoC11w2WK3Dym/?=
 =?us-ascii?Q?+0YPEiMrV5SBPF902Uirlc3e8UsTL5idsPpesNBI/OwneM6d+IbCNo2FrS3T?=
 =?us-ascii?Q?teOPuG3LljKghw5t1dNiuSIeYiXTe4ZlYoV5kRAOcGGUWJxSKRFq7FQnUr3i?=
 =?us-ascii?Q?PgqbAvJs9zA1GICbedhokfgxGjapWrHRGa4H6SLEv1AS3lQULqguAjY6eYqf?=
 =?us-ascii?Q?KyMb2dchKF49n5G+yKXyoLsDJjCj3k6jGswLGaTAz0K4X46ZUWBDYGHZVXs5?=
 =?us-ascii?Q?s4ozV2XxrGe3Fb2fdDDxauTWzo4VpbEGzDaKrfLGVw03RWaop8vQtRHR/KtI?=
 =?us-ascii?Q?QsN9BlI27jPAUun4WNdL/hi0y4IcexgCEQSRCCjwm8AmOyUGaVgNk3QztOx5?=
 =?us-ascii?Q?zxzT07OxNkigf/Dd3s4HH6k+DAL0YPLTXTCT5HvxRteTSJIKXO39ZFrrFJ+E?=
 =?us-ascii?Q?m/Hyxh7UsXEAop0XcvauMr/hvzGTVWJWYgZ/6DFyd5D4OHn3vqC+ZGW3eJ2Y?=
 =?us-ascii?Q?9fpY3Zl8e27CFTa/XUnXAo0d+cppjJ00hblbaHcRSGpxqnfXeLiL6b+gaKX4?=
 =?us-ascii?Q?9GDmrwB/8im2e8HS+4qj1PiX5IE9ZV4cAnPkT5td2RNU6GgCJyZ3ALzIKfAR?=
 =?us-ascii?Q?X9kMrFwoalXQQWqcuQbwbLGOspVu/VztqYlB47M/WapzmrrnGfAxk7Oa5KXs?=
 =?us-ascii?Q?UH4D4XqdfCMQSjjiK5YZzy1jwKco/R967d+Q1TuTITM9+DwoLUsYNRoRG5K6?=
 =?us-ascii?Q?TgcSS+dCfrMtL7Fz3qmiV7uOdDkZNlVTUCMmcjQdRpPv3D+8oQBqpqLgQ0pV?=
 =?us-ascii?Q?Hl+5q/nDuKaQD6FLo5tv9Vs1MIjX0srYqSH3inAP4skaZIn5ADIkBoHdloRs?=
 =?us-ascii?Q?7kRfo6u1vhhIfMMvYnQdJJzYiBS3nWUIEHiOCy0FeWZRN87lizmebLin+2mj?=
 =?us-ascii?Q?UB+tHAxmTUl+0K9WS/xaFJlD9e85dlsquKKpkDvmJDQUy84zSJqO91LrPQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 09:58:44.2638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 084fdc9a-c81b-4c06-6324-08ddd0e20067
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6322

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

