Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F43C3BEC;
	Thu,  5 Mar 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723852; cv=fail; b=cMuG7ETdRUsRwpB2K6N7ZVFLcKJKnGrqjOZGhr49aFkeaqaZklS6FPbaf29iNbI5ACp4xq+nk968KH+dlhZtDH0UXUWEYoBRUKqLpuCWeTiMPOLx4HPfKKpUDjkWaez+2rz+L+n7T4QOhASrd9fX9CNkbSU2d0NnVDgkSCavp9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723852; c=relaxed/simple;
	bh=q+JqwN36UcBJgHyx2yt6pIsbBWUVCNbGHmjlz47YvQg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iAOOVPuoThtL9CE1wJv3TL/zunxY5rjccfrNScuHuv1Hhc4yva2QpTE79cjGXmsCmYUPteYCaLD/KUwRY3ZD1v9hVnpWbUtK1Rgkq8on4GsVEseyJy5OjbtlACuxkmsE6jRY4vIXIGmnfh2vFuO33Pg0bDqeNX/BboZALloz0kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pZqoKKCg; arc=fail smtp.client-ip=52.101.53.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pZqoKKCg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeXozrjIMNgN+LXL6niZeW/ycBL6RFOEOlCJQWW9cMGWm2IOspp1rOzJtiObHPeIQoZYX5MdXFgtpBoeBVysXS0T6rrFlTNX0EnP0RW1sI543kF2H+seJyR6lTNgtULrUUII6H1SctiNCvUJj+WJF4xYZVcVxxbsCA9rVfLiFIl0x9fb0YSYhwx8p4FroVfZwEicfcMuWGV75YWRWtgn6v8dBq6WyuI7dKGlbpBiOvIJMRoI8Uw73A4AntfLSW58/vDo2stf4NjJITYURYWi1nrcTZ/TvOJO2AKCxsR4ESSFH79J+TRib0254D2qKGWyDkIZZbFSTJHir+J94o+tEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ7yIxtNlf9GMihJ7feTS+uG/VfThM7aEYhS1CBvkLs=;
 b=kI8ULyvB0i47PQk6Mef7+WQmacnkzDXjsqW1AJpsIIIivvUDI/B6VOitVgVEtM5lYADqmLJ7abTSI/B+4+eo3cVDMN/6i0atCw5O4ZUJ5eREJmSSt1NGeXDDahKHC9M3DNWELrZhGOZrjtOOhR/Mo3JmSyDL+R6KxZw/bumpuW8MXzRQntNW/O7Ja/bsvZQF9jnEO992mLC4VIlh1ay3sY2aZSRacrYQsaYoIDUGEPC/Fc3pXlWE6MuNi5O2DNnDx2ObaR+oIuxh8DGsBzZnAEVgIyOKEoMKfzrgt8VC53Ww44TGqpMXAbBEpwvzBBesPVWAAAf7AadHzWNhc4+r6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ7yIxtNlf9GMihJ7feTS+uG/VfThM7aEYhS1CBvkLs=;
 b=pZqoKKCgCs59ZvXFipIn8e/V5GTWyOC8OghnfmFMtnOmZLgyzksT+8EQ0jgrJXk6auU9mMqWT1M83DYk4qcLkaWGdbVcOQcDVxfjztXsDYSc/W8pBOZhUTCNjxg1z4zKxIVkQrjbJtZDZ6nRRNM7YX4Pn+RQsUTG+Eivd00dq62YtUlQIPK4CK1Oz/wSjnyiHutsw3yPecvQ9jFNNf8ll62VpqozHxXR+j8AhAr1CQhCASxkOHN9L9Anl6a7nJ/SFfrylSqwxtTLHINJm+2TPvMBBoreA8AoenVWigGOU27mFlBMsJseiZwJAxIbY8snZLGanJYjToAtSSuDT7cnxA==
Received: from PH8PR20CA0023.namprd20.prod.outlook.com (2603:10b6:510:23c::29)
 by SA5PPF50009C446.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:17:26 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::c7) by PH8PR20CA0023.outlook.office365.com
 (2603:10b6:510:23c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 15:17:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:17:25 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 07:17:05 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 07:17:04 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 07:17:02 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix RTC aliases
Date: Thu, 5 Mar 2026 15:16:59 +0000
Message-ID: <20260305151659.703273-1-jonathanh@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SA5PPF50009C446:EE_
X-MS-Office365-Filtering-Correlation-Id: a08eb4a1-1c01-4578-8bdf-08de7aca4f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info:
	LvEDoXQA5tO9S6Mch9I1mp5c0TJnpD9brsECq19zuJz4J4yPjcmuMEERhTDUuLnu7HPIi0kDJ2Lh5Mrv4kt2l0N2oUu+JFx2vBIjbnmqxEeDh+dDHAHv/SWPli1vhKvbGwcLKMRLlZwrNIot81L3xL+jGZZm6spN0HscKZGu0MFjGdj1/3fONRdoChEcnbobuJbUzwtkqxVE2+erBgrUfPnj+dkdZcEGrDXwf/SVF5PgMWCznRchj8VCgQQ1u8a3phvgLtQV5IzPMRmeaYiVBIbewOXRf7dQKJ1NTIoyA1fr4yDKr2ug70VhySJLEqsi9Rq+YjGc2AKgz3qqYQVoZ7OJt8n+X5rhg7jYbMnMGjFVm9F8u0wLpxvxC3VbCHKrlb9zNGyd/NBE7Qc4DRHNj+P6rySMv4pkrI1uiIlogM8haZ74RMHmqaKOJsYOWkVAbIPRBwUskp327I4oztx1s4CqBxNzTEW6djjl9DSltTGKjhw6Pd5SiKUVreL77uXZJmkQ3kMoLwYuvRs23RRjSXLV19DabFo9oWY+pjX8jcc9/++rt31LaOuFKeu8jvDfDaSMY5anYxC62PlPvVpYLhPGmjlAJ03mRA2ZOPMJnHuYM7tMaT68lcASgMhqEufG5UyJ7eNjcWye4rVL4XVLbWp+Uazx+YVqJT7LMCHGJ+nd4sdTMily0RbHoll3wkpuWfElDb0wq5iUO3xm+hlWSfcwSR0M5dVpV0vp8qW+ayy9ZKyi9C5coZE0un/peSUGCFn444bUtMHSUWsHx0n07A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EAMBKdtUhBjfsISWaL9DdoJDu0s2vHAJjBK1ajsMAnK5K0bLH/NqLl0k5x9TmcB5u4bTIl0Mg5lHa9y1dvayXglF0pGRUbqWmtBkw243IGe3fOrzJgUcq6RsvLP7zL9kgtYzHjEy0YAisNq1sMQxXHI7THun2elHqHmsg0F9aPXEQOhYTHznR2kkrrMB1KER1xytgtI4Ebxiow8tM+GDu1jfjrWcvdW7kpPWrOnHm1yXejXTxm0bF7W+G/8OEMcdbEPCSmFXCFZrVchgTE0L5uyzr1tJcq0O1iAzGTq/LBAvYW9AUPiRkhyw5POqN9dZjF28H/oSYqcROC3Xq4HPtgTLZ9yU4ZLe08bBaErXlgBuxMI8Ia/RJl1OA10Xxw+W0CVUAklh6uuKtN1+B3AxZ0xuHDht4ZAwh/wjscdA5fDIFI+1GbIr8kHPaswzzBr9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:17:25.9692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a08eb4a1-1c01-4578-8bdf-08de7aca4f03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF50009C446

The following warning is observed on the Tegra234 Jetson platforms ...

 rtc-nvidia-vrs10 4-003c: /aliases ID 0 not available

This happens because the 'rtc@c2a0000' device is registered before the
vrs10 RTC and so is assigned the 'rtc0' alias. We want the vrs10 RTC to
be the default RTC because this RTC maintains time across power cycles.
Fix this by adding a 'rtc1' alias for the 'rtc@c2a0000' device.

Fixes: b1806f2b4e78 ("arm64: tegra: Add device-tree node for NVVRS RTC")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 58bf55c0e414..c10d041c183b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -9,6 +9,7 @@ aliases {
 		mmc0 = "/bus@0/mmc@3460000";
 		mmc1 = "/bus@0/mmc@3400000";
 		rtc0 = "/bpmp/i2c/pmic@3c";
+		rtc1 = "/bus@0/rtc@c2a0000";
 	};
 
 	bus@0 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index ab391a71c3d3..9e9e80d57623 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -8,6 +8,7 @@ / {
 	aliases {
 		mmc0 = "/bus@0/mmc@3400000";
 		rtc0 = "/bpmp/i2c/pmic@3c";
+		rtc1 = "/bus@0/rtc@c2a0000";
 	};
 
 	bus@0 {
-- 
2.43.0

