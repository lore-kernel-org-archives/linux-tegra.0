Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD867FBBD;
	Thu,  9 May 2024 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715291928; cv=fail; b=p36DSmxznQTYPTgqQ4si+LHFOuZh27To3yUQFGR6omRuR4O5ihyzcFGXDrLOxUx5/pudt8Indz9t2wKpHDRKtuJ0fbDXt30CYANxaksREc8ut7YXIJ5wgx6ofQLTJNxa8sKcdtrMtwuYQ022zQ6MPhx4jWiqUOMSDwcZiH4FqcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715291928; c=relaxed/simple;
	bh=HWw8EMf2EjW1rPQGjaop/i/GB/3v1gbUTTvBITUw32U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N6Kz9jiXGm2PQCL1uxGtdSeHEn8ssyJ/Pd40Q7iEr58t072wvJPKHWlXs57wV0DsJ14bfpA59UJ3CfMivkCTaj8SffLB5Ybj0czryxF2tFFeDaY2zk6DkeqV6F0gKvkXdVWiGOpQqcAFrti9tzodj+rmBQ9LJcVAEXhhunxFGHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=odUVopuH; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="odUVopuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5soOqM8Pf2hfA3dROy2Uzh7QjJfLVgTsl2mDiF9T07ToR+DfKaAA0hvGETBaxlMtQBODKnzv9K4FOQE91ww5AMhprFbGof2AbmkBzH7x6mIkCygeBskD9kBSsF816c3150pULs3YXmW/FZlS3KG3fN8tYvIF1RKQ/qwSJaGQfrTQgwyR3+OiF1Qw7GUjhgezHk6LpKgctc+3lluBES/VDD10e7DejnmWvgMrkfP41WwDvcxrN/91ce/gYu2F3i9bFCfxJQtxwgwzpxbw6vum3+w+3LCUGMP2qeXz0WiPm5q7CZ2sMvUO3pSu5vCk4OFw5QTTLEcBP/M3LN24IuB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHgpLtW4TBrunHeSHgUhxytO9Q2Un5KqhI3MTOCgTuY=;
 b=K9NBOjbjTCySSnulD5H7265N3dPwlcKoLvvV0NOkBh5pzsyKtzYU2NvXSsgV0Xxm5oP1faVnVQ6WPi0efrN6/OEOJ/hCOU4j2Gw68hnmY/dTT0CikxDT+bu9P3JRjPDuKmnBJ+9l06qNw5pi75GPYpCRDjIsWDN6FfKz/sNUAPNLyKzVk2UeQwO2uYxsEN7WWqukf/w4PcL2I9q7RkOfpYkjInkQO/CC2hXW808rFVshkUFbzkElAPoqW9Z5is/mmKUK1CeX90nW+BNp/IDBXM56qYfnln3WFxzNi/Au503tWbjHS9lEbDKamcTLeMxxc8xNt7UkVYsfMUVs6/ClHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHgpLtW4TBrunHeSHgUhxytO9Q2Un5KqhI3MTOCgTuY=;
 b=odUVopuH11sm5eV6kUCuykcP8jCC3V25cpRGTvn19ruxwaDqMJDu8x9JK6ZgrTpmg462L4XBYuOg/2lAu0Hi6ZdckjpaqnyDfEGnaxfA53+YKziXZpyM8AV7kgCfr0hU9Y+NSBOasuPhq2UIZm0v8g7nq6DOtkiF9o5QeyJNzwCh0nRAFMRiJNgG+wTvZbhLuZOBRgCEhTO9Ze+iFcaEJp0o/bdJ/B2i4qlTEJ6u2wkrA19ED5g/fgH0PvR42HuwEH3N9DIVLL4J46JBb7jzNPBjK3ML2RZWzh0Y7VxLMJNUqDCm/+rbM/LexXKX+ml+t7L28ayh4PisNW8VzRKwOg==
Received: from SN1PR12CA0086.namprd12.prod.outlook.com (2603:10b6:802:21::21)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 21:58:41 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::44) by SN1PR12CA0086.outlook.office365.com
 (2603:10b6:802:21::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48 via Frontend
 Transport; Thu, 9 May 2024 21:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Thu, 9 May 2024 21:58:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 May 2024
 14:58:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 May 2024
 14:58:23 -0700
Received: from build-bwicaksono-20240418T183603007.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 9 May 2024 14:58:22 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <suzuki.poulose@arm.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH] arm64: defconfig: enable NVIDIA CoreSight PMU driver
Date: Thu, 9 May 2024 21:58:08 +0000
Message-ID: <20240509215808.126217-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d55c377-fd2c-4ab3-19e6-08dc70732ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aiD4s8XIBV/qA1fF1Qtu8hcol2stpqnDAkABOe1nUb0yCVNh5hfXAWBs+Je3?=
 =?us-ascii?Q?p7E/7Vl6bA4Y/a6Hoxksa8QcJ0CoAUFu0DxUa97xzt4sDiSIGfw+I4rJLDPh?=
 =?us-ascii?Q?pt6TjQHBUX8AXiBwOdE6O3siO1Ooxksu/5/Ix8UHnnEcEB3o1ywWbaolDrb2?=
 =?us-ascii?Q?RqDKpuUf7BhgV0PBOPkFmkZZYUbkPyQy/IaOmKVNltd1Z3yANwJ47sNGLoES?=
 =?us-ascii?Q?AJrfE95QRtzpfIEBEHdUpRS8+czXAKcfwRExq8FlFRLd513KE4MCac5kJfTE?=
 =?us-ascii?Q?Ed+OmqV7w8IYxh3xrHUOuBMzVRmzvXZwJqVSbLlMqIXSHN5y0blQbP2ll1NV?=
 =?us-ascii?Q?AHNXkiyqGd77puO1IHw7xcOD/8iYl7SSaRGvyRKSJrhfjEXThFlsxWo2hGtX?=
 =?us-ascii?Q?XLP5NBxzfqQdc8BU8D7AYqYna+KUe2A+aeoiTaI5D2N6I/2XPVP5oS6PnZ/m?=
 =?us-ascii?Q?6u8DxOrJWpofA6N2PNwFlek2KSjoNG/hm5za62mG6URdBIxuM3WYuFVfij6c?=
 =?us-ascii?Q?uez4DZUODJqwGsu4FxihCKMctSt7YC4lnR0K1zEip8BL6GiejfP8v3gpvSvv?=
 =?us-ascii?Q?DpZS8+WHeiGkJpftbQdWcLgndYLTKw5jGRMcFrBEoBlBh8rPESyFGAQOfXBY?=
 =?us-ascii?Q?RHUVf9Wb5f6SEPxX3rRWY5zL9uLkUMd8geJS6EmVlKlQkEIUwqIU76IKzFRz?=
 =?us-ascii?Q?7cuTCZ7WTzn47fOW5t4OgEl53iDGjZpSJoCRPmn5iNN1ujxHmykWgOT0IL9n?=
 =?us-ascii?Q?vrMjTB4cnRGfApQyIJz3X4iVEhL3jmj3k4LCJCJvB9RJbRsOaTjB62f58BqT?=
 =?us-ascii?Q?Ti0kuNj3rK/aicGUlyPtq82FOPIcMqYuUeDuAv6HFAjKYKpulSPjz0CF3HAm?=
 =?us-ascii?Q?VroqEBZeB/NrNL3zXLHar7iZk20zj6SprK5aTQ5L6jDzL08OizORZRxPVnSP?=
 =?us-ascii?Q?VNDYMgHOZTW/iNqLKp7fRoT2ISF1ebVmzflXRPNcjVlx8T/IKZkTpAzmxSVQ?=
 =?us-ascii?Q?Q2T6in4Q2QYRhraQLNV6hPAiE5pI9EE3Ld0BwIkMU5d/TXg4iSMfiVTe0MLk?=
 =?us-ascii?Q?CVHXb3CY3UU3ECkTKCUep8S2h7ex1XHP63rEEe9FymZAvAyk9ZG+RBMz9x3n?=
 =?us-ascii?Q?XebbuFOObzZQLwdQvEfkixupU3zmeTsq9ekzL2+/ZQX3ABBLBzvnQm/fjVXv?=
 =?us-ascii?Q?Qmb5cyz0JbdGLyqJYZao6VpjWl/sInXaWxFDcUGFXVU3XVh/WnEZ/xP+qZkL?=
 =?us-ascii?Q?XPcHT/lJZdUhXr9zdcy/o04yzd9TjhkjCBoHv4esp2psBqKSthSJS8H00SoC?=
 =?us-ascii?Q?waHXYToT8bfi+uUf8uqIFOn6UgFXubdwQVWL9VdZBODfeHYsdxB8Gx65Sv6s?=
 =?us-ascii?Q?2TBTT0UUiq8Bp3Q0QOJ8Ly2TVWuW?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 21:58:38.6152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d55c377-fd2c-4ab3-19e6-08dc70732ec8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778

Enable NVIDIA driver for Coresight PMU arch device.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8e003466f929..36383115ed2a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1555,6 +1555,7 @@ CONFIG_ARM_SPE_PMU=m
 CONFIG_ARM_DMC620_PMU=m
 CONFIG_HISI_PMU=y
 CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
+CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
 CONFIG_NVMEM_IMX_OCOTP=y
-- 
2.25.1

