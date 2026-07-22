Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7B158535;
	Wed, 22 Jul 2026 12:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725057; cv=fail; b=tR4BjjyI5rr2yf7Nczgjkzyy0imaEXRGrFneywmi26ZNfzk8zHPBGKCpne45EenwfsjuUOhoKxRtvfVrYDz416KxpBa9nTPDQ1A82+Zss/FL9t6REPyEC2G65hdigQxsRYtyAQ0dMC/+Q/hzf7VYr/zXTUFnNSDU8LiEVzv+olU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725057; c=relaxed/simple;
	bh=y9t/hMHzRzfov3VdF3MVRd+0H99GWQsHD4Zai++Kjhk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RtvNh578a+YUa/Zwc0ie7R7Us2gY0ZsBFcXIdjPqJpo4SG0qu2HmQ4YHFeT5UBe5LrluAXt8wu24cymXTH6MEdRv7WEs+fq5wMwt9wRNAqklp6wdrshdWKuyqANjUHL5o1uRJnC5YkCJInv3z0d0pDwRRZK5/rPndOfPDvMu+8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dn8Lvn5s; arc=fail smtp.client-ip=40.93.195.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dn8Lvn5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFvcnrUB9swgxWXQpXfbcXF9scSo0m6/r0Ry421jv8v+CdbGFBwu5/Rc1iBY5vv+Mmyp2P/F7zP2kcLKenBW/SNIBAFb4rtYuQjUU4cp2ci+lkpBcC7LU+2GFEor8cDevMyPszqubMwwHLeP/OIFnUhvulU7N3h858Ml4iy6oD1+0Nfcmlmrjo6135QI0cP+Xbx9gBg2ljDdoteey3m+Ikc1+lN/WF2A9yPdXRenttf1l2yDS163y1MOz6FQ1oG8sBiZPP2ynw/Hv5pMEGu6BOTk54LMvrWYxyxYyEx2MYEQwuo7ngloSweSZZhNMjMKM5NCMd1U8as3GlgjF7g81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5B5GUChOv3uxM5Bl1oEYzwpLoEqDRyYha0AZCrUVeg=;
 b=b5CRob743lhA2oEhWRt17R3JQPZjcSe1cddmDoSRIaEY8O98ZYHld+qv/KO9gdIiAUWLJKRk0iCO7SKr/pvIi/I4yLJjnVwRjJJnECDf4tX/H82jSD/bK5SpylY8q9v1q3mnuEV3/FxoZCQxGTPzMz65/uXlksoAB/ka1gG+X2YeK1vIz3HBcAVEmEetwtuV2dUfgwji0hmr4/3yQjY/MJ9fH8FMiSLqOvI2kO8IXIhQCwOGKbH70vVYW/mnibNLvo7A4gOov0d66KpzJ612xFuBJIhEKRbi3QmkxWzQEgfvVoEnM3kr96CcFgPl9SDeh99DRIaxouTGLmMfemw/0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5B5GUChOv3uxM5Bl1oEYzwpLoEqDRyYha0AZCrUVeg=;
 b=Dn8Lvn5s9qgkip7ENEmHasJLV88a5+597XKrI8TXsCqwljD33p6KhcCWW91a3U3qK8QDJRQcm+ajtwfmKEbRDijvPbZlBiTa/dusuorNUrtPuoPFmMB+GK0N5CQjSzDH2h4LcUxBHizmu4ncjyy+7HmxED9t1zebtfTZIyhKHuxD7B2dbP6v8tZcbEyaxzcFIr3kbdhJZCT5CHkYz5GMalBtG0M/AKfk1WbK8DEf9PT5wHbu0tzcjj4FvWxpZBYtzjwUZBBNivRyMTAxv6nLzuDltu31WW3o6qSIJc+Jn8MmP/aeHwAo8vfpBKwVnZzLy2t7snjJUoEPk3WVCAlPwA==
Received: from DSZP220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::9) by
 IA0PPF7D094C5BF.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 12:57:29 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::64) by DSZP220CA0008.outlook.office365.com
 (2603:10b6:5:280::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 12:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 12:57:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 05:57:13 -0700
Received: from moonraker.home (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 05:57:11 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	"Daniel Lezcano" <daniel.lezcano@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clocksource/drivers/arm_arch_timer: Mark EL2 virtual timer broken for Tegra194/234
Date: Wed, 22 Jul 2026 13:56:51 +0100
Message-ID: <20260722125651.148595-1-jonathanh@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|IA0PPF7D094C5BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4f42e4-4d5c-46ca-6332-08dee7f0c950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|5023799004|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	W+5KVCnOVQJ93cxBQMBEg4klx+J+5EmyOQvWEvVPLUqmhYImqCJVTY1bn2J+uw2W06B2pVytWKMEZJGEjd5w3GpQMHIyeGlyetRgmUNp75O7REym5OcMwsaxg/WuNtReiKDuGz/agBI6r6jQD44wNCVoKxhRodA0LT9RBIyIHuU4psy4kQUFwhx0BxYCy6UN/9FeZhTx32RqVMmoHx4IZOH1VTK1tziq4vP4npUZs3ogTijmy4lQ2n/97hQic0VoZaxOFuSNoaL9a88BJb1n3WX9Hp7WLQPGPLXG9Qek61w4WQj0Ljf0DaAhXIuZNGu0jJIbtYX8tj/nTQjGXw3dPbQCn1YdQ2Zm5drBBZkK0iiiMsguDzgEI6Yx9I/QYI6QIg87sQfg1VE7SGI+I32/iQM66fw1rkfgZVZKRF+gG/ZcuzQEkcqO1Ve8LqCZvWqYeO4xD4S6hksyoKFUzcDc44xos4iQgG3az5Izp7vaKo1cTWS1FtHrN0Ts2i/A8/ypblLfBdllLsErqYpY3Ay10gUcVLam/Onwnrt/s9JxEsbKyeXuknI3bLeryv9cfMBL9BYlAL+RNUAtbITshvjl2nDyxUFK2fVROXN7JBMWBEqLQmQ3FFiJpstz/en1632p4BKj71ZFTwqD7Mm3UMkv5LfbhNoiph9skkAVjSKQfDz9oOPik12wx/onlgz6CCIgqmUNjmyOZYjFXGLpeUNUYg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(5023799004)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3SchrC4BNWLUowUqE7dNpQ6cgflPSzac0gDYrfVhrFhGaRHdZWs+ghsU19CqoB00dpZiMFvu40bMfriv6bhoKxzSbLgi9NLjaNmRMZ+mO0p6YZDH+L3LcgRLTXC1hRk5QbPTfkat2nGCDFQzi9bV0zYcnmHfs4ktW3g27mZKOwkfqMYbXddnUhMpXps4+AMo7EnfDHm/PviIclodP8i/MkWf5PvvxaV7Rv9DXJ/b4JMRxx3o5lR2r/9fF47a05lwq1gGafTSodEQ89bYLovd8UpoHXcbCJgh2L9P+3dBE2udfyUBKAeAGQWVAM4m5Ago0bcLjtZ8tr/pirh1f0UcKoBTX5qjVvXNSMlE8yfRJBSbYwA6KtHF+sZULy7c5vgF9iH6LQMpNTvINMVkyviY4sR1sejQRj0tPXGNZRYio4rU10y8XTySzv697F/WVFFo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 12:57:28.7331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4f42e4-4d5c-46ca-6332-08dee7f0c950
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF7D094C5BF

The following warning is being observed on Tegra194 and Tegra234
platforms ...

 arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer
  interrupt

Adding the missing EL2 virtual timer in device-tree for Tegra194 and
Tegra234 is causing boot issues for both devices.

The Tegra194 device includes a GIC-400 which defines PPIs for sec-phys,
phys, virt and hyp-phys timer interrupts (per the dt-binding
arm,arch_timer.yaml) but there is no PPI hyp-virt (EL2 virtual) timer
and hence this is not supported for this device.

The Tegra234 device does have a PPI for the EL2 virtual timer, but
during CPU idle transitions into low-power states this timer is not
preserved currently by firmware and hence causes boot issues when CPU
idle is enabled.

Avoid the warning for Tegra194 and Tegra234 devices by marking the EL2
virtual timer as broken.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clocksource/arm_arch_timer.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 4adf756423de..b9ccb560ff8f 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1090,6 +1090,17 @@ static int __init arch_timer_common_init(void)
 	return arch_timer_arch_init();
 }
 
+static bool __init has_broken_el2_vtimer(void)
+{
+	static const char * const broken_el2_vtimer[] __initconst = {
+		"nvidia,tegra194",
+		"nvidia,tegra234",
+		NULL
+	};
+
+	return of_machine_compatible_match(broken_el2_vtimer);
+}
+
 /**
  * arch_timer_select_ppi() - Select suitable PPI for the current system.
  *
@@ -1115,6 +1126,9 @@ static int __init arch_timer_common_init(void)
 static enum arch_timer_ppi_nr __init arch_timer_select_ppi(void)
 {
 	if (is_kernel_in_hyp_mode()) {
+		if (has_broken_el2_vtimer())
+			return ARCH_TIMER_HYP_PPI;
+
 		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI])
 			return ARCH_TIMER_HYP_VIRT_PPI;
 
-- 
2.43.0

