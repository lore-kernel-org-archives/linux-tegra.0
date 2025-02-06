Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E50522FF35;
	Thu,  6 Feb 2025 22:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738880894; cv=fail; b=V698yeSvgqylmMB4O057P8VTuXUcA+COQU8FTmKre1s6TSRHPQVU4U3qPRKe5Al/76/Ewn87wvjU4I5H7vfJNRpGUsEMxUyhRLyzq152/oFfKsqlDR92d7aLqc4dnAoVlmkgXvJBB7hUISbozXdVnqoEYA/a3jWWIdFkcV/Jt5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738880894; c=relaxed/simple;
	bh=li+xXLSvrBt5R268dmTm3VFapTNa6qiRkWtdCvmeoRM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nq5tCDksTgYk+CVw7pIs9xRBZtFdmJQSlKxllHqV81S6jDDQHw2JmQIrw51xns2j9bA25715VmsxQYpO8WFrpLRn+NKBN59CzFmXlKguHFbIsHZ9zKnrrUQUnie69sZ7uqUCSaYw0PZpvTPabkvCMC0T2i634y1xSIQK4FQSLTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EJ+xXT8l; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EJ+xXT8l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oexlz96VjMyiuSGN/yLUxWcAQvww3raIWtlV+ysAb+c0MrDEqr79Th4wxPaqQXIUaBD2tNNEt7I6qNPZlzvRrw1USS/DH6YTvYjWNr+J/WKxOrRe7ptu+hQbHdqcVxVg6/E7NEkWpkgbMNIpH+LLVws2hQohZq/rZFbUunhWeB8zEzY/rxLZAnAC2aAWbygVDxjRw4cZibQWnhIj803aSPbTUdufNtYUnoUG/A1lOsDP05FriuJBx6MF3nX7smB5czBpZWhhJAtswu0J8DnmooYkbGnwMAv4I/3fy83Q8nKcmZZWJGJKTWi3281hvlC7KGHQ7O8VFi7T42QS0mwhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59lQhBqRvc6In2JGgqwHkIwhVPqUxsvK80OAsatkzFc=;
 b=QPuCC8N+h3DqLs9WjezIQ1p0tuei4+GrdWa2VH61JYGlEFy4s1+q+MwtBKbtXWRujP5sf3ujM/FOd29K2GEnmDYYQdmr+k5dye5YA8xIY4j69OkmqgUzfUC0KtJM/AwvFx5qvoqOZlWOFCzSazjC72oXPSifwtSdKJL7a1H3HvTvl0r6X3slPzqOilVzBa5D8KEsyAFiZYz316gKAJbGUbY5/bBayws3mqNbog4t9LfxoIujF4iZLIThNx3Sn+wth/dS/Hu1dIuQRJ/LJ7cxXrIGUy/jiNENSbUK5623tYcIDaDKNDzoIgAKqKkCO5or4O0xm/CcgNOtaNt1P5RPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59lQhBqRvc6In2JGgqwHkIwhVPqUxsvK80OAsatkzFc=;
 b=EJ+xXT8lcRXgSUGwfGMVMhMVD9KW2nl6FZfdrYsmQwclGG6Rir5jQ64Rsli4iaeUTlYeU9+922iVo7ZA0BYVtjskIJRQTCqDsqfSMi/MRnTnDfzpnjvbbQmyGJELUJZRGV46vC9aj9y82Pk79Q91dEd7TDjhkRRqZ6tuRpec/zXO+qz/qJZSIPTmbPaqjXec3CJ1pJw4ZEnmY9yyDPb7gZub3GUiTBDsrRo9hwxS7oOFWUMJdyiv7s9oIqBU8WO+655UBKd/iMdXDox/rx+6FO3CI6SWb1wGNjgWN4RknXtNzaJOilK0l1o7i8y4Xv83nYFsDxdNpsuCMMUqiGLBbw==
Received: from SN6PR05CA0014.namprd05.prod.outlook.com (2603:10b6:805:de::27)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 22:28:08 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:805:de:cafe::d4) by SN6PR05CA0014.outlook.office365.com
 (2603:10b6:805:de::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.6 via Frontend Transport; Thu, 6
 Feb 2025 22:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 22:28:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Feb 2025
 14:27:48 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 14:27:48 -0800
Received: from build-yijuh-20230530T223047391.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 6 Feb 2025 14:27:48 -0800
From: Ivy Huang <yijuh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Brad Griffis
	<bgriffis@nvidia.com>
CC: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, "Wayne
 Chang" <waynec@nvidia.com>, Ivy Huang <yijuh@nvidia.com>
Subject: [PATCH] arm64: tegra: Enable Tegra234 USB remote wakeup
Date: Thu, 6 Feb 2025 22:27:31 +0000
Message-ID: <20250206222731.3691073-1-yijuh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9f86ac-fea1-45a1-7bfd-08dd46fd8865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r2R5YnAdzKcdEfffJ2X52xFV4gAG1pdDsZBqMbOe0lUE+eXllVHuUQ8lpIoQ?=
 =?us-ascii?Q?gD/2CPSV3QXt01qQrMPASJ6u7W35ncM9KtAFoZ+JzwERX1jSWdm/8SOwPvYn?=
 =?us-ascii?Q?k0poSNn17fWtdGlIgDwCbSZ/T+Ko5vlTMpG5Z+fa1xVp5N/yIJAHms4alX+E?=
 =?us-ascii?Q?+mPMyAO70r29FM5RR63+laMki019bIDedHbyEgAX2WVpJarDd34Rwf1RJzgT?=
 =?us-ascii?Q?uIhvGH+dIrurUBa46jC0O6hIX2EkCq3Yfqp/BDg0n4R1WqFjTYrCJNJoVHHi?=
 =?us-ascii?Q?80tdqYA5kgu0/7rEvhWTP/sKXgl5dfc/ODpQbkBxTex5/vv83d0Z2RPr6ZWj?=
 =?us-ascii?Q?dnFYLVvcqWC+lHa/GC/WvJrtC5veQAju7C9G3eC9UWMUyc8EgD+WdV2qb0cW?=
 =?us-ascii?Q?xgyMWNc1n6oroIPlE+icBezAa/yGcLPxrwxbGKlDsOSiyT1hLQqNqv7w5Du+?=
 =?us-ascii?Q?sOlXQ/COxfGGz45ARffEl6hFUz5Z2QCQw1ZSYmLfyUH+4AKljVD60upaWTVI?=
 =?us-ascii?Q?2EYQR1QU/lriTq7LoQBhVTfzDewg5sGHOETNYTEdEvgHjmqXXeo17S70tLnY?=
 =?us-ascii?Q?nF2hTZJKPiyu8VAP5KBC4XK9Vy7CIzSXidXzscIOwvLgGmwbXD9cDwCvkSQp?=
 =?us-ascii?Q?aQwZC7OdkPyBe9CpljveUSEvT9dM+ouUClE2b5bmny9hK+rWq2L+LqPa3cRn?=
 =?us-ascii?Q?Uz9ANabTWIqc8zr58A+M+3msLmyuF4x1JPSn4PYWkY+K+NmurhY0L9gLMS7N?=
 =?us-ascii?Q?QQqDyKBK4YkxAA0ZSRl1P7HLgOptIVCQE+giL0dEhAqcykrEf9kj2VAVY0bV?=
 =?us-ascii?Q?RVz54mTKnd9MmGc8oeQ5luk7F/+JFXPCuBiJ9hmItLH4T1ayNr/Ter34LIzt?=
 =?us-ascii?Q?1TrDtf8kCtPCEEEQsm//VCHMRfYWAhhxd5rvRwMX/6m09C/5ykTCgTjUEO/6?=
 =?us-ascii?Q?+ZDUqdrbv+ycUHt/mCmUJ3rq0+PXaJWyTVvOW8rfpZNslRJNJQJPT4+GFUAQ?=
 =?us-ascii?Q?Uj3dm/vNUFBUznqg02P4+TqIxrwqsjccQP7UO+w5vvJY8MFS3mIgMTe/fb7U?=
 =?us-ascii?Q?kDtDYzFx0bSX9+ZmwJpt54gFx8S6yrVp3CDvVFigg2olmwkoumOcbS9blJxk?=
 =?us-ascii?Q?Xj+/eMG+YavQT/eh02GQjq29OsJ3HKz7mtzElXPmlx9Hu02fT2bEheBERaO3?=
 =?us-ascii?Q?RbN+yKkbfrjFHJCf6I6VcEXvh1V9lQMXKzoRKtoMou832iShOp/8cGj7YV8G?=
 =?us-ascii?Q?UGN5hwLbYOws79S8leQPmziCdHRo/eq7kQWpodbw0gFujTmAqB1Vq2MwPT8I?=
 =?us-ascii?Q?Ou/PaXO4hpjq+ISh5WnwEPOCTEPEJ7RH8Cg4X+w9BT8jPlWYw5WV0sfIh0ZQ?=
 =?us-ascii?Q?b1aWs4sTYI5+0V8Ktj9ExXO+qPX+wBiYBW9Z4vLP8AjkE9lTwM0cGQcgmT2y?=
 =?us-ascii?Q?7+o+bbp9W9bOXsAKJmVuHuqS+VFlP639Mk4IEBj1VEw4eBHcKxMB1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:28:08.3625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9f86ac-fea1-45a1-7bfd-08dd46fd8865
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044

From: Haotien Hsu <haotienh@nvidia.com>

Populate the USB wake-up interrupts for Tegra234 to enable
the USB device to wake the system up from low power modes.

Signed-off-by: Henry Lin <henryl@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
Signed-off-by: Ivy Huang <yijuh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 2601b43b2d8c..bbd5f7c2bf03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -3254,8 +3254,22 @@
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
+			/*
+			 * wake0, wake1, wake2 are for USB3.0 ports
+			 * wake3, wake4, wake5, wake6 are for USB2.0 ports
+			 */
+			interrupt-names = "xhci", "mbox",
+				  "wake0", "wake1", "wake2", "wake3",
+				  "wake4", "wake5", "wake6";
 
 			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
 				 <&bpmp TEGRA234_CLK_XUSB_FALCON>,
-- 
2.17.1

