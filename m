Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61981DD9AC;
	Thu, 16 Jan 2025 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737040780; cv=fail; b=pJoFl08fXmzh9boV37u6QfCT0H4AkGDTJPvTbIknbj82vJqhfH5/LTyGLzaj0yzyCWmgkbxjYol0FNwSdTATxQORlTjzv6T9VPYGCl/wp40ae3i6q0gfbXukPtIxRNlNLD51lTV49h38ECKeHVpGWD2KWuPT1Mo7vEODXcDKLLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737040780; c=relaxed/simple;
	bh=y30RvptQ9bSwCicNQIa77ovMW91jNYhCGMK4YHuznkg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KmXJ6fXfKNVnD8k5aDF/SDzyf6klFPgbsPxziIrBTN6QcdCTsnqX5mQUKHNg33to08YokFAUd8WeTD9uz7129MHtwFrwmwD3RjTXO+8bhubz0ZU3rfFTiMiq6LRIqG/BK1rnhModPHkRgeIYfmc48rnF6j4Mw7G1gzmdkJhL5HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DwB/7uzX; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DwB/7uzX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMo0TK4oOVwUz2nn1oWA3BPOw/MzhqPcY39OAVFi3szj/odEhdHgSWANYM4w2MSlrzzIj+d9lLjNmFKMuku07RXbH3zLAIfTcZA4Zt3vY1PeWfWac7FVkHJUcuCmr36wYnDYuDuxjRJjZtF/ahiF6vZb4KoEEGtuJaF14JzVoHOhqJgZ+6NZfRlQ/rsXU66SARJW1PY+BmBKaboo2OOgbZZPyMDxYYABk3SMwo5SKP/KkLdcaR1FZoFbGVvZrw3ZuqLNQn3/jfkanypkJ78A1NvjAVqHE/ibvuSUoa3lek1ViAQg657KdeSSEDuschrZuhXhFUwtQVCIT66rbOXauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v56m9RsS2BiaY/+euo+nEp3Qfou1gV+lWjeCouySy10=;
 b=vDXtiIdFRaabF3GshcvAJXR/ZFzduLDSESfjGivZCrdMpDTNWoZ273l9yjgD4R97yMmytoqAtRUcDkYs5IVxtuQmlDt1f9/d8Gp1UMpJMU/gVFdboVK/qyJgQjTv73k25MykMzEcjbjeEJ1HOsVQp+GIdaKNlduBuR6ZnwY0HcEaXxTJMfOHBT4oUtUREFzACtpOvxEukhajUPOB6kkH6oJtxROAnWJirWfLoFXcx4xGkRl0ABEGBdw2XFDPcUUE8KI7f67JBmJ6ba5ojF8PgKOny5Rte1z3VT164YwN3LP+uuOEd6cBVChdw04zJNhlGX69F1xc7IkfgaXiFUUcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v56m9RsS2BiaY/+euo+nEp3Qfou1gV+lWjeCouySy10=;
 b=DwB/7uzXNvU+M0Kf4eqdBkFhCrlkvTYAVMExC5ZDXjTLJf+BudIG/iJQcfM6VSbQ736LpvHgYPcQvjJqZEtNGjrzznXZxUaWHJQ2SEVAzxJ3sLQwI8KVCl45PpSKQ9uz+pwYWCWTIsrYSUYHxlYVE9pJRktumU4Lg59HGvh4mepZv3P4UBuOe1ATnr/dkvI9dZ3VTqySgPWJzEWe/GZIMv72Edjlqo1zlZi3Ly+Sjz3lUUYkihGUKvMQVaQ300irUuw0i3cIfkn9FE9SQmmpH2cFKIiY8sELCS7sToxvCSLK4dm2e0FyQTxSf1jR3+FD3baKdtRiGlTA1JFEPFxDPw==
Received: from BN9PR03CA0454.namprd03.prod.outlook.com (2603:10b6:408:139::9)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Thu, 16 Jan
 2025 15:19:33 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::11) by BN9PR03CA0454.outlook.office365.com
 (2603:10b6:408:139::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 15:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 15:19:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 07:19:08 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 07:19:07 -0800
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 16 Jan
 2025 07:19:06 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Resize aperture for the IGX PCIe C5 slot
Date: Thu, 16 Jan 2025 15:19:03 +0000
Message-ID: <20250116151903.476047-1-jonathanh@nvidia.com>
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
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b06f83-b4bd-4c2a-90a1-08dd36412e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v3s73KSMifPNJxjAfxg+vu/90tiAc28bw5Isf5G7IoZyOunHsgRu88Hq9FOe?=
 =?us-ascii?Q?C6GFAiMJi4UxUD+WhdkSP1hg6OShVdItTuhNYlHIfMIWPYzQyEEDDMz39pAb?=
 =?us-ascii?Q?317YbfnEy56/Rp2qjiLqjmmvVNi5ZcpmyFOYDQHK2CiRLFZUemn9T+/n3xSp?=
 =?us-ascii?Q?Tq96fo46oMcMUS4oWPe0xYLGBOzcrX8EmKFXv0unsFKOgnbFJLjEvtxmdGej?=
 =?us-ascii?Q?QvHTiriALP6FliwpPPmD8YnIJI35nyRslCpdXe725bEsPTH8XJEjRfpg59nn?=
 =?us-ascii?Q?8RjXAnCbcPeuqa8v60XNTqJ4XT598fdXjhyUt31nyCOu16yJ3XPzApOtwtnN?=
 =?us-ascii?Q?ChVwbsuVFjg8KXcf55mkpf8kDnS+a1Q1K1c+KzltZNpxvQyzlb0ZZv9igABW?=
 =?us-ascii?Q?r4X548YvnWDGrhusGFHDrhzC1U4hyoJrIIZCS7WWmrCz4MsFJO0dcIQ5BtJ4?=
 =?us-ascii?Q?V+3+2uUMs6WFx94nHaVH5OKpNCI2yUGL9SjIXjkSZSZvhb4MxdE/lA1UCThx?=
 =?us-ascii?Q?2i28heD/ULar7ibXOTtWfqAYvyApuBPEvJtsGKX8cQLFDwbyJKSQTQqN01et?=
 =?us-ascii?Q?nAyhB1I/cnGHP5+q0a8Nic5iKc8G5ffHo0PXoLodpd1OYkPYobtRcox0+904?=
 =?us-ascii?Q?9vA6bL6ohYPLxCB4M7mmQoX/SoR87sXsZpGRbefeWLB0LKHWNMG+xGCkw9Bm?=
 =?us-ascii?Q?QlfOxTG9AX5NOPR4Hbvd+x04cnelWapoOmJmIzMRdHr5kW7dCCuCYrzmQnk0?=
 =?us-ascii?Q?vOROoIu0vsMf1Fa8Yck4Cgws2sFZlOj70V21l8TMZxndLras6BPFQuJTHZvv?=
 =?us-ascii?Q?y/WA7bB2f6jA2VG0PnusYb7JSGuam7CLfFvS1Kq0tlGQBB460KDjDyaXi/eB?=
 =?us-ascii?Q?/7YZrwanTnFkQT6AT71kypdnP8/VJDzd7YdH46wH1Kk4iTxGK+qU0jmCOx18?=
 =?us-ascii?Q?5V7StqZHshfT3N0o9M1VpunRhj32WGLesGGmf3+V7Y6LQw67lDhQGWDb5lam?=
 =?us-ascii?Q?+eEwfdOHE4Mw1GDxNriw71zGmCw6DeE3QVcIB70/hvrrHFOalAT1lKh5Ejgu?=
 =?us-ascii?Q?yWwzDNkzY16aVUujcr1dkf2gTIFcejRSI0s5TNKESQj+hP5z9HiUqiHLiSNH?=
 =?us-ascii?Q?aIHp4OOV19/kC3aRiqKkjXPH5jq/5TgfVH/2EHDP5rpx6yh9OOjw4yqae3zK?=
 =?us-ascii?Q?rfabKDKjouMdZIzyL+XQA6i9FvOEkmqVZQgTDLR9Dvt2rfhOLIq7jqDWWSQs?=
 =?us-ascii?Q?TWiwU+bFJI4uVfgke6+kc659+xofBEq42U8qFC9qVsJYvSkfqpAEdoIoOXTZ?=
 =?us-ascii?Q?MPGYIsUz1vRvdLiBtfjkoyvnrWag3hRjM9qpKEKU7/prSB9ihBiu/irG+SfZ?=
 =?us-ascii?Q?0QzunV6YVhXOLYZ251+wl9dvUeFwd7Bj91oR3ghlmX+5qy5rfask8+VhCz1v?=
 =?us-ascii?Q?O6CtwyBwJp289llJ2DPb2Z/rsgyauG5XOqVRj66bmlD3cL91JtQ9IKxCKahd?=
 =?us-ascii?Q?SjjGXm+9UocJm9o=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:19:33.2948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b06f83-b4bd-4c2a-90a1-08dd36412e5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819

Some discrete graphics cards such as the NVIDIA RTX A6000 support
resizable BARs. When connecting an A6000 card to the NVIDIA IGX Orin
platform, resizing the BAR1 aperture to 8GB fails because the current
device-tree configuration for the PCIe C5 slot cannot support this.
Fix this by updating the device-tree 'reg' and 'ranges' properties for
the PCIe C5 slot to support this.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 36e888053746..9ce55b4d2de8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -302,6 +302,16 @@ pcie@14160000 {
 		};
 
 		pcie@141a0000 {
+			reg = <0x00 0x141a0000 0x0 0x00020000   /* appl registers (128K)      */
+			       0x00 0x3a000000 0x0 0x00040000   /* configuration space (256K) */
+			       0x00 0x3a040000 0x0 0x00040000   /* iATU_DMA reg space (256K)  */
+			       0x00 0x3a080000 0x0 0x00040000   /* DBI reg space (256K)       */
+			       0x2e 0x20000000 0x0 0x10000000>; /* ECAM (256MB)               */
+
+			ranges = <0x81000000 0x00 0x3a100000 0x00 0x3a100000 0x0 0x00100000      /* downstream I/O (1MB) */
+				  0x82000000 0x00 0x40000000 0x2e 0x30000000 0x0 0x08000000      /* non-prefetchable memory (128MB) */
+				  0xc3000000 0x28 0x00000000 0x28 0x00000000 0x6 0x20000000>;    /* prefetchable memory (25088MB) */
+
 			status = "okay";
 			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
 			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-- 
2.43.0

