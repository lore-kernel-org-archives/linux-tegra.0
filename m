Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EC3310784;
	Fri,  3 Jul 2026 04:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054646; cv=fail; b=ZsqUAh54tRcY3Uuwm5gvAAs2bIVwRBg15j1o0rsI5xW0m0XRe4cwWe55V8S7gYV/xIlAIZL7G34pxXqjsHICEA7YB5pcpr8meZON4sdc7Unv7LVCmoKgaQ/UckGv/TbmCwfmF22N7zbf3Ooz6pSwizRgVi2MFVmg4UcwyT6oZTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054646; c=relaxed/simple;
	bh=aIFo6jtZbKICrWy28SEg0E0bsBa0G7n/JE5V9aAak48=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TKEyNc/xXXby+LvRVLeQgHDQD8hj5ysF7J+BTcidZAz+DFP5BF/aHO98oJETpnxqwe4J1XJ1oRK8R8FTM7AeYWcxlxkrO462xmDuDZxffu0GtYAgFvIdnHAo6IlXRtqnfFTOC3Jvzipy0kEROFYRIVejRyoNeAoryVRg79zSk40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CtVGqFCy; arc=fail smtp.client-ip=52.101.48.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CtVGqFCy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSpjqSu9nH/Fp8MlrxWBVkAgkfF4RXQxBJvBcREBAQHe00ctwUd3U0VcjpJ4v/Sbf8+XfI+8ElnEHR4ZRhBf53d4yH968BnZr9VG5CEY47e32/gKt2XNTAaxmxvV85uC6zosL8NT6eVL7frGUovaitfCol+8YS3DU8RT1rCyCfhwNBe2hizeZRastafLbnodO2ap9PWD+DI29F2k3aneAibmHbAyIPNnqzACI3UcIMYSWPTIeqA2/FaYGdUmImEYA7gIa9EsGWtPxJ0t3ZSOMgSe2g/oGHwTBfd66O9Ig1Fgs0RiNBLOiVCdB2NR0vBKJ7yKpRNcEOJTe5T7xLxdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTH5fznTjWiHvLT3amQC799yepGRyhDunb8WzBcpwB0=;
 b=O5IwAFGO4h76izMKcV3EPYwzzNblfxBVZdGPrfJe/KG1Yk14OCnqAVukLF8Ti8KfUG5SMPwgEr0bE6DBpLoBMsDmgKitw5uy8y4B8tqCuK0Zgu/TGz/ojWx79xxD7EUzvS+u9kYif9YM6ttxvBiwOqvaoDZmSfyervOwhH4hw/cEvrXdtBabWEaYABPoqHOOnx7CqOfPtA7PY/VvQeljhL6EVoQAFbBRSfGPnSphm7BwsZX/zyQ5kkDjWJtD4wcjwoZVwtlYtHRSS1qaq8X13Pknx0svbJuc6i4TSV2T+ThxKkFUibmJUFo4Mj+xA+drCqqvlZhhgDepgDSCeThgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTH5fznTjWiHvLT3amQC799yepGRyhDunb8WzBcpwB0=;
 b=CtVGqFCymsktR4qv2TJ19rhzcYFGeDVTk2ukGkltuiAP42qD+2zBCrkr3pVbZvQIeRQUTU4IcNx/ttJnAgV0yzA0COw/A+RkZu5mqqeiUV4lVACmZBNQ81ErT6f9IrsV/9oUCIY6dMwIysn6zoyyzWENZJN2cUeLhK00ZCX1/5CUDYzNhKGJyKcawtgBP1TeE99GizbWva2fS8keCHnfl/ZcsaaZYD1+eeVyNhNdZ211F3mHR2yP2Yu3U054eTM1L0LN2ZYxpvtZn8QRTAFjWzfBCzUzDf0U+LSJY9uE2W9Z3xd1rotRSPK4o5wC+TqMv+5SyCuEkmZDyI7aKJHIsQ==
Received: from DS7PR05CA0022.namprd05.prod.outlook.com (2603:10b6:5:3b9::27)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 04:57:10 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::97) by DS7PR05CA0022.outlook.office365.com
 (2603:10b6:5:3b9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Fri, 3
 Jul 2026 04:57:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 04:57:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 21:56:59 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 21:56:58 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 2 Jul 2026 21:56:58 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Ashish
 Mhetre" <amhetre@nvidia.com>
Subject: [PATCH] memory: tegra: Guard against NULL mc_regs in IRQ handler
Date: Fri, 3 Jul 2026 04:56:53 +0000
Message-ID: <20260703045653.395498-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac38da6-9200-4e49-3432-08ded8bf8a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	qVF8OMAryssFGlEIw6L9+Viv/MvefRyD157DvLHJ9vmFrqfQsWFoHYoolhPkeHwQwKhVkmlhAQZiEZWUd3iCW+q2dSh5/8i4RMNliFRJcITb1kuTg9ZfMfPqVmyo/+mIPYGxINx9AZpMIaxFof1Yzi91s7XnX9grHAcv3AZdsAM/MBJ9SmNTLiOh6/E9L+TO0q0GFJA+lpkkrpLNDAp3Tf5kzlVNCgHUQevdxkLv8W5zUAJjA09LB/xZqxY7+fJLD/AodiK1GXZ7GN+Ck8rUrVOQI06MISXQegOoeKwzmIsGAWTsiPM0GyrMaUuWwzp7gMrZRZVf9uLTBRRe+1Yde7UjJ55gpdTJxEswxI8B49qGshmnrXZ1S5O8iZAjEQ7OJ/sLB0D1wBebyzBPjX33iGKmvcRe34bQbp3RAuvhbed2L9x0opiEgVY1ueuhKGn/B+f8LznWB+uH8vuIQZbVGOGipEe7RjhIagzp15YfFkQdQ9fIqKxQlX/2vAMXpJWRjCKYoK/wlVyB4/6kjyKO7y0uXdP8xZ7cchPVKa8bcPIO1S3c7lUWp6D9vciFjwR+kloFwdW1UL6xD/Lz5T2V2xBJ2JarTrGJUkst3PS44orWsL1oINIa0X+ndv/dGb7iN5ZPsKYPSeKxK51qvtPapqRVTwISNQjrsbigEpK7ZGj3N5BxswTNDwradbQPxOXG+z5wEnvdW0qoZ8aXx78C4Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nXoYPKiltyl2mjlNEzRi5mN3m/Sew7lbt0s38NbTPaKH70mNZDVfEoQuuuH+GD+sT9loktasTNClKWM1TW118AxPm+ZKvzy0bTlFVmuLE2Azf3PnVg+SiB/eC2QJMx/08TvVsMhT4wKQo1I+n7y3zasmApAFss4lSGWH4VpxJ7R+bcC2QQvnHGiiJqgTT81B2h5f3kwCpV/haw45DHTjOdN+hb/wMV63KbV0S1qbjzJJyXgwKWISOaLGc9Pof+SKNNz5BZ4Pr1SrD2RqxDshw4bx2jfFnb6n+BngYUvqbh4LgY07psMsw56TukhNZR11Txuuk1Fg6e+LBA5CHZOwR39fgdNYkFd/Lj6WFpP5tRlF191oBKFrQBR1FcgviV6HrH4/Q/6D/04Vn7bg/lHed/ceq+7HacIYnEmR0qoFjRZh6byZ5ijcZnTi4HwayOa5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 04:57:09.7634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac38da6-9200-4e49-3432-08ded8bf8a04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916

The per-error decode in tegra30_mc_handle_irq() dereferences
mc->soc->regs unconditionally. This 'regs' structure is optional and is
only used for decoding and logging MC error interrupts. The rest of the
MC functionality does not depend on it.

When adding support for the Tegra238 SoC, the 'regs' structure was
initially omitted because it is only used for error logging. We found
that this resulted in a NULL pointer dereference in IRQ context, causing
a crash when an MC error interrupt fired. Although existing upstream
devices will not hit this condition because 'regs' is present, guard
against it to improve the robustness of the driver.

Skip the decode and just clear the interrupt when mc_regs is NULL. This
bypasses the error interrupt logging while keeping the remaining MC
functionality intact.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/mc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec80ea9cc173..6ac7d5f5e597 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -598,6 +598,13 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 	if (!status)
 		return IRQ_NONE;
 
+	if (!mc->soc->regs) {
+		dev_err_ratelimited(mc->dev,
+				    "MC error interrupt 0x%08lx with no error register map, Clearing.\n",
+				    status);
+		goto clear;
+	}
+
 	for_each_set_bit(bit, &status, 32) {
 		const char *error = tegra_mc_status_names[bit] ?: "unknown";
 		const char *client = "unknown", *desc;
@@ -736,6 +743,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 				    desc, perm);
 	}
 
+clear:
 	/* clear interrupts */
 	if (mc->soc->num_channels) {
 		mc_ch_writel(mc, channel, status, MC_INTSTATUS);
-- 
2.50.1

