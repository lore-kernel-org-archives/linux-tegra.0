Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F22DA755;
	Mon, 11 Aug 2025 07:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898461; cv=fail; b=e7JgERyJtVvs8/QaAFliZPPjHN/iM1rRaVlOIihIS6DcArWI370g7TF04kCnYLhOOeEwa1VqqORCCBVlYcVN6ijwiljgc1a0cAS112NkTVyl+UGbVQyxvHorkQBFlgtIXEk4QLLnkJnPuPhv5vg7I9W5fmSyzx5c9pCCTYSdZ7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898461; c=relaxed/simple;
	bh=Dq3mjWYyRtbpr9QwgJ2dWBqIXTb+morBDUDnhhQ5kcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L15ppGuBWzJpEckuR5+s/5TtOBKFxHQjXLhyHUb/miL+pluVAlIcrk7OWN/YD810Fmr4V1EMb8WCSjIclw/lA+U613fy6lf+70C7cqPsMinfPjkbJtUVF/QHULshBA0vhFzp5qwU0OSl3Yo6YVqofLfj1/djGfmFUgRgFwIpEDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NbN5z62G; arc=fail smtp.client-ip=40.107.220.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NbN5z62G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9I5MqHzxNvnvNbnztCBim7mF1BU39E1fqSGbK7hxylGpXQv3BthAiAqpozFoxRTdBVxZUDZIug1+eh9JAxBVVVdj7eP41xwF1l3jGvxLQrcM7V85wIvMXAWrPIvEseDnB0YIvqV9LgLMKFVK4khd6jzfdH+GJClFkB5M14XRnMeNhuQfTcLHzSf11AMk5uBUgkv5vhB5lRppx6YnZr1+0njy3gj7Z6pNqks2NSrj7acvEL8Fz9/1bVSCxw68OetOfOJG1baAmKCTEJjyoEhrf1V0Dz2BuEAP2qEbqZrmVfC9+TIwCuLF90zcE2z1lvhUJKCDW1SuSA62r8Cg4sl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T4OdjKxwd6xwPR5lRgElodoU4Iw6f85yNJBbWLzE0Q=;
 b=BrNCxgWZyqTBlyYGUBcALOyBV88Tk7DQbbOZywsDXklS1Ryiiga4VkUHoqvkqOO1W/lLIibOF9WwbeeMpizHXmbRF7JfC+ub7GqUhS7ObhrEFzz2lbvv6+GDx6woYmmmLmOXqcJjNsbJXNtANRF+d0aOrJbHG9ueZwYNa80eZ8Biq9zCvaNMfmmeJhI3gCvJxDMyw2rB1NwHuZ9dgwW3L0VyAHYH1T8AJtB6oPeESrU1OqKoZ94vrxLV/zpmEcGEQH4HKPN0ezo05J5E4JK3vdsGDvNKhrSpfMEK9lrTN08X48Biyf7adXBJVICzb68bkhihJzmIP62MknIKJlUM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T4OdjKxwd6xwPR5lRgElodoU4Iw6f85yNJBbWLzE0Q=;
 b=NbN5z62G1tfQS05swvqcWH6jskaNTVMztHT2KQQ9QneUE2OznxJGMmVivukQyjXyzBFIb0Xq7gmzKyIXOV0ZCF2LCeOsSci9pZ49tdghzwn1kFQc5lIBvLrlpSSnb3VH6tR7eC2HJfqSV2neVgC1sYzx7OKXlyx7TRXJrJPF2QpHnEbKrgLf2aSMoHQ5lzRIkRRvHQpEZGL3i7bAIn2hz0+g7hpNOQwnOQ9Ffe1MgMYEP8Ygq9UP0m8yje0NsMYFF8C+/tURGnhTspCqrLgW7sKFRfgK037Gc7yL+mWojbV5C0Gd3YjvOu0b2Wuq7a29qEwj3aFwqN6TylLDA2yoPA==
Received: from SJ0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:a03:3a0::26)
 by SJ5PPF6785369A4.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::997) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 07:47:37 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::8c) by SJ0PR03CA0261.outlook.office365.com
 (2603:10b6:a03:3a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.21 via Frontend Transport; Mon,
 11 Aug 2025 07:47:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 07:47:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 00:47:17 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 00:47:13 -0700
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
Subject: [PATCH v3 2/4] arm64: tegra: Add interrupts for Tegra234 USB wake events
Date: Mon, 11 Aug 2025 15:45:56 +0800
Message-ID: <20250811074558.1062048-3-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811074558.1062048-1-haotienh@nvidia.com>
References: <20250811074558.1062048-1-haotienh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SJ5PPF6785369A4:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f5f41a-c132-45bf-0c15-08ddd8ab5713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7p07/2sPrExLp8fJKL9Mf7YpI7oKT+rq0X9/LXUfDjvHKvodjGBDQAJUtMO6?=
 =?us-ascii?Q?6Fa9mjk/C6824AkcQnP0UNw/HRhHby+VIrFpzXiBa5WIbFnPgLlcENaka6Ig?=
 =?us-ascii?Q?vthq68ZEq/aSegCMI0Kg0P/gyqZIR6wd7GBRulmF1JCs4h7XSyxSU02UoByb?=
 =?us-ascii?Q?Ta8ee+Piny7lphyH6j5S5hBFjPjoCBI/zFkoB3VV4C8PUPbtMGJO+VTN5lxM?=
 =?us-ascii?Q?295sC6kJaxvZYPmRBnpasR4wupy8DD3gVNVRLydmn9uhjvGd6Uo/xPZSPqlG?=
 =?us-ascii?Q?qUG0IgFet3LIDNspXvTmOeaejZNVy1ZzqTFoY3aFng5x0MWR9URNDjOKclSd?=
 =?us-ascii?Q?boOBlr7VB1vXincV3BoWwogkq+R6g+2OIF4mj2tUdozdO95iO3+prGR9etpn?=
 =?us-ascii?Q?WRbND+Y22gBT1qQHJc3hAf46ZeauTaOMBXpbbyj6RydArFDEvY4cvqpQ5rI8?=
 =?us-ascii?Q?KFp27cvUJLAfHBpVxPFXZXzWjQnxgfjSLMhUOQuMXQzMPktc8qAagBwQTrfo?=
 =?us-ascii?Q?h78jRZodB1LCge3ZtrMWT1ZtwdDk15lyEj213iFYWGXFX5i4KDXy5JTCOsOZ?=
 =?us-ascii?Q?rllh0YtlHFE9QgDdUY6i1WyvE0wMZW8ISbnr2m+GHP6FXm02Urq0+UFEDGlZ?=
 =?us-ascii?Q?nU3udwIv9YBYD/K1Im3rEKIocl9VOuErxtQKwaK59t8PF0CdXkYQDS0u5ZhE?=
 =?us-ascii?Q?E6LLDo+t7fNK7HWyNWaLjDWmYvi8HxlIg/WWLKbNFslYLKI+vplCKds9S8Pq?=
 =?us-ascii?Q?1PS/ONuVlrpt6mmXag78YyJUKXiVR0UJRtz33g4VUw3GpA1CdNsV8RAllpXs?=
 =?us-ascii?Q?+dZkSOi4HICqCMB3aRv6AzgbAh2LL6NYpTFi2IbPPY9ePMKVY8Qb30THX8Yr?=
 =?us-ascii?Q?ywLlznrXEIZCd3cA9kFKAnAB6D4eeGTUMoE9KAHpwuLg4JbZP18P42D61Fuz?=
 =?us-ascii?Q?GnNwFZPiEZDyaTh1prNB53xapUcyRRjx0Cm8CK5jc3Rk1ckesZ8UP8cA0Z6+?=
 =?us-ascii?Q?vmmO6PbzezMsY4eQEhYab9tZZGGJwKkbWavqCwhjMinb76scfgFXuhBVrlbC?=
 =?us-ascii?Q?fW9P/oEWgPAozsefqSlXN5PwwxRs8tSM5+BNh8g9EW+W6MAtvbLVKGCRQbBt?=
 =?us-ascii?Q?byHm6PVWX4cbh8416SfrvU5Dfunhrltr4naFsMCid7rQ0gkeeddFFuXkg40N?=
 =?us-ascii?Q?fElEmjZOloxFZHmEx6GEGO+G1g3RkjGPnv4q38HMApkT5fYbmi2Ee/yhtwpz?=
 =?us-ascii?Q?u3sgFM8HqzQ/VQOMnr6T2hgY840Ip5IrqO5MpUpuWwy2HEuFdu0NBBQW08ZR?=
 =?us-ascii?Q?Rn+uoMphJsiliPWijuy5VoU4u89d5K6w2oP901GYf0ILs388bC3Fizwm65Ph?=
 =?us-ascii?Q?9kfYmxdUvw1UJBz0NTv3UHomujjp5m1XPcsH1FdhhR5bF6bv8o0TfMR4YEu6?=
 =?us-ascii?Q?V0prBddw0W98UZVOQUUKvWnW11Bt2SuQiYZjDbRQ8TDWyb51DqcmiI6ISfFr?=
 =?us-ascii?Q?AmqRtpai8cKPP0cCPwjjnJRG6nPeBJSc8IhJl9qAFYwYRobwbcpiP/6NeQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:47:36.7071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f5f41a-c132-45bf-0c15-08ddd8ab5713
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6785369A4

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

