Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984503C0603;
	Wed, 16 Sep 2026 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541524; cv=fail; b=f1114mAXtXs2rN993w47AA2bXdV+h6WutKOXSxMiBhoU6mMkR5ymBQ2emlR0j7vJ6Avy1KZSlSuL4dlHmOk5BBpwKw80kUK1TuvahFw++XeP2JjOrpT5YHIVncR06KdaVKraUXOQJxjAMLpVTsjohT0+75I9R3+UsKZ+IInn5Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541524; c=relaxed/simple;
	bh=1ZCf9eTWBeQmBwl/mfkV410oAgMobgGOP3FQ87LBZGw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O0OPMCQwQ2DyIBoJQCDWrfMHScpzwyMYynVLLK1DDAZkA6P6/+fS2nbKkS+4fSwIT9BF+UDz3eyTuzfwwQG2Mcpmjpw4M+20OFWctQy9yZ/41Hfj/zIjh4eSigShmhQ3SJWfld9XAGcF0XfGD49sFnMdNAwD7fYPjAu7zGPKyVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ffjfSG8y; arc=fail smtp.client-ip=52.101.43.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ffjfSG8y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+Ar1wq3RMh9aE6X7u+EiE5YBDyKVleUGwf3koC1wdEpB5A2aZzWLWrV3AMKvE0xXx0NrYQ4IyIVIGOLin45EutVNvkbJQLxcBNOw5eaPZ2AEOLBbNEvBbV0uzGo/HUnsHMQQdHpax90H/fo3d9xgIrncspbuc7H9OssyqJ4cvqvA9vwUPd5ksdHtZksXuCY+wPuwMsmM1DGqFAIzFu5ga32oVljHqsKLeNheBo00b/N5J2DPJLi/ofOOhEmm6qoTOCI0/X5qRSTUQFLupMDBe7axER9yjdGUphfQ86dhY2krwgZybrfTsJgAcgIMQRpCiKvUf1jnJeHA48RxXwlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQAAwpNFVuBKg/y5o6R2UhgnZYrhwoyBrGcvI+oR+3o=;
 b=m+lQUWBQ2tGlA5Ms+qRoNgmxJL6saCNNlk0P6sNzR4a0WDQ7r7CRWklItReQmxS785hfYHKyz5exdBvqsTWynwHgTpKoVAK56Y27/+TA95xLiAKXgjfyskbGzerDrlSvl4BypSAzKQcu0mLB8lG9RkiCGJKYgZLmfC234J2Xp6P0F6YCzF+5xQVnPL+A/uo/B6q/HmgdRYfdPtHz11jyMah+ELRYdJRIzKflpSwcH8R9EBGp6TCIlneuzHcUxruWnrcw7dWSmsG8nj9RKSFFhhfzhXDsNmOVxyVrJgafQqSdjGcx/euqEVyEDidogx37L4RTmxfpQrUyGokujxmgGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQAAwpNFVuBKg/y5o6R2UhgnZYrhwoyBrGcvI+oR+3o=;
 b=ffjfSG8yAZsiskRTK9qhvd+S4OuZVRZxeHQ5o1WpUaJ0CQGfCk1f+k05O9/N5G55dulIYTquqQizUhtioRoPL4MbCohpqpkdqmrtVviXuSbKOk8JghuSahWGvC0XminpRU/29C32pck6E0AiCszxr7XaHyf5651WjK52fxNWDdpQxaHboj1Vm7MC2qXdfboY1E2p5yMn3cW4Nt/reWhi7YV+Qr5VheystWoDaXNind307+t/9Sh5q54Vh0ulfqmvTUBJz1FuvcUu58DelWAO3iXL04CgbeQ+2ttv+/xIi3VZwtlCoStmBWec1C6f9KkI+F+3FWed6CVHHAGIJVSHTg==
Received: from BN0PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:e8::29)
 by DS0PR12MB999081.namprd12.prod.outlook.com (2603:10b6:8:2ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 06:51:51 +0000
Received: from LV8PEPF0000006C.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::30) by BN0PR04CA0054.outlook.office365.com
 (2603:10b6:408:e8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Wed, 16
 Sep 2026 06:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 LV8PEPF0000006C.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 06:51:51 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 23:51:33 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 23:51:32 -0700
Received: from build-pshete-bionic-20260708.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Tue, 15 Sep 2026 23:51:32 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pshete@nvidia.com>, <bhelgaas@google.com>,
	<u.kleine-koenig@baylibre.com>, <arnd@arndb.de>
Subject: [PATCH] pinctrl: tegra238: Fix register bank for AON pin groups
Date: Wed, 16 Sep 2026 06:51:32 +0000
Message-ID: <20260916065132.1411576-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006C:EE_|DS0PR12MB999081:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fe2933-e05f-4ad9-4501-08df13befcce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|56012099006|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	oja74cgcY4wLibRxN6zIC6kpFSH25DiC+OhZ+bAAodNlikgQeSmBtHzN27m2KyBYNgxLiV9cuFF1O8L2CV23yPGXVi+j7JrkzRTXdl9hrt+EyLW6rrZE9zdDgSHtd+jvberYTf73pAnkRotYlroDl0t0R1L8QZRxCtHTzl0Gr5XY/5TA+/fijDgFsa8wpmmvpl6KnAYLIZzfvPWeTZH1nST65NFbyT6BYhm1++8tkQEdHciZ9jv5rQzvdpOD1Pw25SFVht3ePs6m5lVe7bzFx14Rtj2LQxbDcExoF1SMGPU5rQ7RLdsf2JYi4YZ9pD7oBun+iVxHu03zFSRoN60ZW7pyk+AqCvjJlrihEQBB34J3JYkFqZwoSo49n1X4D6SU1pGz9Ygv1kgwcRummxt2lwOtIpRdbUVXr1W2avN6Y5rKNiKTzREbk2ej9aeNEBUWyfjx06rY2lr24oXDQj/aVZqYBieRceabOcn5aISfvfCrLpE0afcwWNKLuTl/lwRXP6ohZGjUAIeyG7eWNBP2WwXZHNOJTc5yF/4wK4CtOL6B07RpODiQv1L1f20TnKAYXhv3LFKoJ+dtfY4B3NUWcEUepWsipQAxpY45zOMdt5f2Ub1wa9MUutsSLSYEuvw30If5b8vebRnLw5ZQjvSILj6NOCeoB46XyulyqiOpvD15EqhupgfVcoYmD2od+dBE5ubynWpJ+9VvZfDeTEMj/A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fxqCctlRTZg8rle6mn9nDflZyddwLAII3RC5nBpnw/qg2ItVwOopYgvei/OpHhAE4LLs6NI9n3Dvf+Fm7kQIqK8NnhucaqBm8Klr92fQ8uUZ8y0GFhi+5hcSH83fJEaEzD5ZVaU0t+fEo98xlwxT43DW6EeKxcPP2NV4jD5HQ2wMQ6Zw9W/9BQxrCZeQVHZcSVw28L18ytvC1XJy3o/kZs6skEc+44PLfaWPcvBpNHTsm/qgzIgI7lY/XwZZi7fpxhMCd0/OeVrS0Ofk2bTh0zfsSp2z8Olm/QFrFX3ozfuRFwytEHEaxLgvIv8GDBzMcijrBj7P+KQ10sdM7FFyVLwZOWq3DJ6RARdmS5x/eJXbZq0YoqfwS0J/a15VR9WCk7H0tb0FdOlu+GlB8JxNBKo5IgW+eacaetkmnDTn3KEyp3sYdyMsYbBwrTnC+vy0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:51:51.4110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fe2933-e05f-4ad9-4501-08df13befcce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000006C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999081

The AON pin controller has a single register region and therefore,
the bank defined in the tegra238_functions[] and tegra238_aon_groups[]
for the AON pin groups must be 0. However, commit 25cac7292d49
("pinctrl: tegra: Add Tegra238 pinmux driver") incorrectly specified the
bank for these pins as 1 and not 0. This means that in the
tegra_pinctrl_probe() function we use an invalid index when accessing
the pmx->regs[] array which causes an incorrect address to be used for
accessing the pinmux registers.

Fix this by correcting the bank for the AON pin groups.

Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra238.c | 204 +++++++++++------------
 1 file changed, 102 insertions(+), 102 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra238.c b/drivers/pinctrl/tegra/pinctrl-tegra238.c
index ec482365f14f..40aba285944e 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra238.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra238.c
@@ -1744,57 +1744,57 @@ static const char * const tegra238_functions[] = {
 #define drive_sdmmc1_dat0_pu2		DRV_PINGROUP_ENTRY_Y(0x8034,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
 #define drive_ufs0_rst_n_pv1		DRV_PINGROUP_ENTRY_Y(0x11004,	12,	5,	24,	5,	-1,	-1,	-1,	-1,	0)
 #define drive_ufs0_ref_clk_pv0		DRV_PINGROUP_ENTRY_Y(0x1100c,	12,	5,	24,	5,	-1,	-1,	-1,	-1,	0)
-#define drive_batt_oc_paa4		    DRV_PINGROUP_ENTRY_Y(0x1024,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_bootv_ctl_n_paa0		DRV_PINGROUP_ENTRY_Y(0x102c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_vcomp_alert_paa2		DRV_PINGROUP_ENTRY_Y(0x105c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_hdmi_cec_pbb0		    DRV_PINGROUP_ENTRY_Y(0x1064,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_touch_clk_pdd3		DRV_PINGROUP_ENTRY_Y(0x106c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart3_rx_pcc6		    DRV_PINGROUP_ENTRY_Y(0x1074,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart3_tx_pcc5		    DRV_PINGROUP_ENTRY_Y(0x107c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen8_i2c_sda_pdd2		DRV_PINGROUP_ENTRY_Y(0x1084,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen8_i2c_scl_pdd1		DRV_PINGROUP_ENTRY_Y(0x108c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_mosi_pcc2		DRV_PINGROUP_ENTRY_Y(0x1094,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen2_i2c_scl_pcc7		DRV_PINGROUP_ENTRY_Y(0x109c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_cs0_pcc3		    DRV_PINGROUP_ENTRY_Y(0x10a4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen2_i2c_sda_pdd0		DRV_PINGROUP_ENTRY_Y(0x10ac,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_sck_pcc0		    DRV_PINGROUP_ENTRY_Y(0x10b4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_miso_pcc1		DRV_PINGROUP_ENTRY_Y(0x10bc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio49_pee2		DRV_PINGROUP_ENTRY_Y(0x10c4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio50_pee4		DRV_PINGROUP_ENTRY_Y(0x10cc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio82_pee3		DRV_PINGROUP_ENTRY_Y(0x10d4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio71_pff2		DRV_PINGROUP_ENTRY_Y(0x10dc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio76_pff7		DRV_PINGROUP_ENTRY_Y(0x10e4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio74_pff5		DRV_PINGROUP_ENTRY_Y(0x10ec,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio00_paa1		DRV_PINGROUP_ENTRY_Y(0x10f4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio19_pdd6		DRV_PINGROUP_ENTRY_Y(0x10fc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio86_phh3		DRV_PINGROUP_ENTRY_Y(0x1104,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio72_pff3		DRV_PINGROUP_ENTRY_Y(0x110c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio77_pgg0		DRV_PINGROUP_ENTRY_Y(0x1114,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio80_pff6		DRV_PINGROUP_ENTRY_Y(0x111c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio84_pgg1		DRV_PINGROUP_ENTRY_Y(0x1124,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio83_pee5		DRV_PINGROUP_ENTRY_Y(0x112c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio73_pff4		DRV_PINGROUP_ENTRY_Y(0x1134,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio70_pff1		DRV_PINGROUP_ENTRY_Y(0x113c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio04_paa5		DRV_PINGROUP_ENTRY_Y(0x1144,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio85_pgg6		DRV_PINGROUP_ENTRY_Y(0x114c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio69_pff0		DRV_PINGROUP_ENTRY_Y(0x1154,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio25_paa6		DRV_PINGROUP_ENTRY_Y(0x115c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_gpio26_paa7		DRV_PINGROUP_ENTRY_Y(0x1164,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart5_tx_pgg7		    DRV_PINGROUP_ENTRY_Y(0x116c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart5_rx_phh0		    DRV_PINGROUP_ENTRY_Y(0x1174,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart2_tx_pgg2		    DRV_PINGROUP_ENTRY_Y(0x117c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart2_rx_pgg3		    DRV_PINGROUP_ENTRY_Y(0x1184,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart2_cts_pgg5		DRV_PINGROUP_ENTRY_Y(0x118c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart2_rts_pgg4		DRV_PINGROUP_ENTRY_Y(0x1194,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart5_cts_phh2		DRV_PINGROUP_ENTRY_Y(0x119c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart5_rts_phh1		DRV_PINGROUP_ENTRY_Y(0x11a4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_pwm7_pee1			    DRV_PINGROUP_ENTRY_Y(0x11ac,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_pwm2_pdd7			    DRV_PINGROUP_ENTRY_Y(0x11b4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_pwm3_pee0			    DRV_PINGROUP_ENTRY_Y(0x11bc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_pwm1_paa3			    DRV_PINGROUP_ENTRY_Y(0x11c4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_cs1_pcc4		    DRV_PINGROUP_ENTRY_Y(0x11cc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_dmic1_clk_pdd4		DRV_PINGROUP_ENTRY_Y(0x11d4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_dmic1_dat_pdd5		DRV_PINGROUP_ENTRY_Y(0x11dc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
+#define drive_batt_oc_paa4		    DRV_PINGROUP_ENTRY_Y(0x1024,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_bootv_ctl_n_paa0		DRV_PINGROUP_ENTRY_Y(0x102c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_vcomp_alert_paa2		DRV_PINGROUP_ENTRY_Y(0x105c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_hdmi_cec_pbb0		    DRV_PINGROUP_ENTRY_Y(0x1064,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_touch_clk_pdd3		DRV_PINGROUP_ENTRY_Y(0x106c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart3_rx_pcc6		    DRV_PINGROUP_ENTRY_Y(0x1074,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart3_tx_pcc5		    DRV_PINGROUP_ENTRY_Y(0x107c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen8_i2c_sda_pdd2		DRV_PINGROUP_ENTRY_Y(0x1084,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen8_i2c_scl_pdd1		DRV_PINGROUP_ENTRY_Y(0x108c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_mosi_pcc2		DRV_PINGROUP_ENTRY_Y(0x1094,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen2_i2c_scl_pcc7		DRV_PINGROUP_ENTRY_Y(0x109c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_cs0_pcc3		    DRV_PINGROUP_ENTRY_Y(0x10a4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen2_i2c_sda_pdd0		DRV_PINGROUP_ENTRY_Y(0x10ac,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_sck_pcc0		    DRV_PINGROUP_ENTRY_Y(0x10b4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_miso_pcc1		DRV_PINGROUP_ENTRY_Y(0x10bc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio49_pee2		DRV_PINGROUP_ENTRY_Y(0x10c4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio50_pee4		DRV_PINGROUP_ENTRY_Y(0x10cc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio82_pee3		DRV_PINGROUP_ENTRY_Y(0x10d4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio71_pff2		DRV_PINGROUP_ENTRY_Y(0x10dc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio76_pff7		DRV_PINGROUP_ENTRY_Y(0x10e4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio74_pff5		DRV_PINGROUP_ENTRY_Y(0x10ec,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio00_paa1		DRV_PINGROUP_ENTRY_Y(0x10f4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio19_pdd6		DRV_PINGROUP_ENTRY_Y(0x10fc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio86_phh3		DRV_PINGROUP_ENTRY_Y(0x1104,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio72_pff3		DRV_PINGROUP_ENTRY_Y(0x110c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio77_pgg0		DRV_PINGROUP_ENTRY_Y(0x1114,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio80_pff6		DRV_PINGROUP_ENTRY_Y(0x111c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio84_pgg1		DRV_PINGROUP_ENTRY_Y(0x1124,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio83_pee5		DRV_PINGROUP_ENTRY_Y(0x112c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio73_pff4		DRV_PINGROUP_ENTRY_Y(0x1134,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio70_pff1		DRV_PINGROUP_ENTRY_Y(0x113c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio04_paa5		DRV_PINGROUP_ENTRY_Y(0x1144,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio85_pgg6		DRV_PINGROUP_ENTRY_Y(0x114c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio69_pff0		DRV_PINGROUP_ENTRY_Y(0x1154,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio25_paa6		DRV_PINGROUP_ENTRY_Y(0x115c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_gpio26_paa7		DRV_PINGROUP_ENTRY_Y(0x1164,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart5_tx_pgg7		    DRV_PINGROUP_ENTRY_Y(0x116c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart5_rx_phh0		    DRV_PINGROUP_ENTRY_Y(0x1174,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart2_tx_pgg2		    DRV_PINGROUP_ENTRY_Y(0x117c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart2_rx_pgg3		    DRV_PINGROUP_ENTRY_Y(0x1184,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart2_cts_pgg5		DRV_PINGROUP_ENTRY_Y(0x118c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart2_rts_pgg4		DRV_PINGROUP_ENTRY_Y(0x1194,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart5_cts_phh2		DRV_PINGROUP_ENTRY_Y(0x119c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart5_rts_phh1		DRV_PINGROUP_ENTRY_Y(0x11a4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_pwm7_pee1			    DRV_PINGROUP_ENTRY_Y(0x11ac,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_pwm2_pdd7			    DRV_PINGROUP_ENTRY_Y(0x11b4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_pwm3_pee0			    DRV_PINGROUP_ENTRY_Y(0x11bc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_pwm1_paa3			    DRV_PINGROUP_ENTRY_Y(0x11c4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_cs1_pcc4		    DRV_PINGROUP_ENTRY_Y(0x11cc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_dmic1_clk_pdd4		DRV_PINGROUP_ENTRY_Y(0x11d4,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_dmic1_dat_pdd5		DRV_PINGROUP_ENTRY_Y(0x11dc,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
 
 #define drive_sdmmc1_comp		DRV_PINGROUP_ENTRY_N
 
@@ -1961,57 +1961,57 @@ static const struct tegra_pingroup tegra238_groups[] = {
 };
 
 static const struct tegra_pingroup tegra238_aon_groups[] = {
-	PINGROUP(bootv_ctl_n_paa0,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1028,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio00_paa1,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10f0,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(vcomp_alert_paa2,	SOC_THERM_OC1,	RSVD1,			RSVD2,		RSVD3,		0x1058,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(pwm1_paa3,		GP_PWM1,	RSVD1,			RSVD2,		RSVD3,		0x11c0,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(batt_oc_paa4,		SOC_THERM_OC2,	RSVD1,			RSVD2,		RSVD3,		0x1020,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio04_paa5,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1140,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio25_paa6,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1158,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio26_paa7,	RSVD0,		SOC_THERM_OC3,		RSVD2,		RSVD3,		0x1160,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(hdmi_cec_pbb0,		HDMI_CEC,	RSVD1,			RSVD2,		RSVD3,		0x1060,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(spi2_sck_pcc0,		SPI2_SCK,	RSVD1,			RSVD2,		RSVD3,		0x10b0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(spi2_miso_pcc1,	SPI2_DIN,	RSVD1,			RSVD2,		RSVD3,		0x10b8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(spi2_mosi_pcc2,	SPI2_DOUT,	RSVD1,			RSVD2,		RSVD3,		0x1090,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(spi2_cs0_pcc3,		SPI2_CS0,	RSVD1,			RSVD2,		RSVD3,		0x10a0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(spi2_cs1_pcc4,		SPI2_CS1,	RSVD1,			RSVD2,		RSVD3,		0x11c8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart3_tx_pcc5,		UARTC_TXD,	RSVD1,			RSVD2,		RSVD3,		0x1078,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart3_rx_pcc6,		UARTC_RXD,	RSVD1,			RSVD2,		RSVD3,		0x1070,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(gen2_i2c_scl_pcc7,	I2C2_CLK,	RSVD1,			RSVD2,		RSVD3,		0x1098,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(gen2_i2c_sda_pdd0,	I2C2_DAT,	RSVD1,			RSVD2,		RSVD3,		0x10a8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(gen8_i2c_scl_pdd1,	I2C8_CLK,	RSVD1,			RSVD2,		RSVD3,		0x1088,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(gen8_i2c_sda_pdd2,	I2C8_DAT,	RSVD1,			RSVD2,		RSVD3,		0x1080,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(touch_clk_pdd3,	GP_PWM4,	TOUCH_CLK,		RSVD2,		RSVD3,		0x1068,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(dmic1_clk_pdd4,	DMIC1_CLK,	RSVD1,			DMIC5_CLK,	RSVD3,		0x11d0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(dmic1_dat_pdd5,	DMIC1_DAT,	RSVD1,			DMIC5_DAT,	RSVD3,		0x11d8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio19_pdd6,	RSVD0,		WDT_RESET_OUTB,		RSVD2,		RSVD3,		0x10f8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio49_pee2,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10c0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio50_pee4,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10c8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio82_pee3,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10d0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio71_pff2,	PPC_MODE_1,	RSVD1,			RSVD2,		RSVD3,		0x10d8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio76_pff7,	RSVD0,		RSVD1,			TSC_EDGE_OUT0,	TSC_EDGE_OUT0A,	0x10e0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio74_pff5,	PPC_READY,	PPC_I2C_DAT,		RSVD2,		RSVD3,		0x10e8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio86_phh3,	RSVD0,		SPI5_CS1,		TSC_EDGE_OUT3,	TSC_EDGE_OUT0D,	0x1100,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio72_pff3,	PPC_MODE_2,	RSVD1,			RSVD2,		RSVD3,		0x1108,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio77_pgg0,	RSVD0,		RSVD1,			TSC_EDGE_OUT1,	TSC_EDGE_OUT0B,	0x1110,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio80_pff6,	RSVD0,		PPC_RST_N,		RSVD2,		RSVD3,		0x1118,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio84_pgg1,	RSVD0,		RSVD1,			TSC_EDGE_OUT2,	TSC_EDGE_OUT0C,	0x1120,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio83_pee5,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1128,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio73_pff4,	PPC_CC,		PPC_I2C_CLK,		RSVD2,		RSVD3,		0x1130,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio70_pff1,	PPC_MODE_0,	RSVD1,			RSVD2,		RSVD3,		0x1138,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio85_pgg6,	RSVD0,		SPI4_CS1,		RSVD2,		RSVD3,		0x1148,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(soc_gpio69_pff0,	PPC_INT_N,	RSVD1,			RSVD2,		RSVD3,		0x1150,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart5_tx_pgg7,		UARTE_TXD,	SPI5_SCK,		RSVD2,		RSVD3,		0x1168,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart5_rx_phh0,		UARTE_RXD,	SPI5_MISO,		RSVD2,		RSVD3,		0x1170,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart2_tx_pgg2,		UARTB_TXD,	SPI4_SCK,		RSVD2,		RSVD3,		0x1178,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart2_rx_pgg3,		UARTB_RXD,	SPI4_MISO,		RSVD2,		RSVD3,		0x1180,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart2_cts_pgg5,	UARTB_CTS,	SPI4_CS0,		RSVD2,		RSVD3,		0x1188,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart2_rts_pgg4,	UARTB_RTS,	SPI4_MOSI,		RSVD2,		RSVD3,		0x1190,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart5_cts_phh2,	UARTE_CTS,	SPI5_CS0,		RSVD2,		RSVD3,		0x1198,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(uart5_rts_phh1,	UARTE_RTS,	SPI5_MOSI,		RSVD2,		RSVD3,		0x11a0,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(pwm2_pdd7,		GP_PWM2,	LED_BLINK,		RSVD2,		RSVD3,		0x11b0,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(pwm3_pee0,		GP_PWM3,	RSVD1,			RSVD2,		RSVD3,		0x11b8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-	PINGROUP(pwm7_pee1,		GP_PWM7,	RSVD1,			RSVD2,		RSVD3,		0x11a8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(bootv_ctl_n_paa0,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1028,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio00_paa1,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10f0,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(vcomp_alert_paa2,	SOC_THERM_OC1,	RSVD1,			RSVD2,		RSVD3,		0x1058,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(pwm1_paa3,		GP_PWM1,	RSVD1,			RSVD2,		RSVD3,		0x11c0,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(batt_oc_paa4,		SOC_THERM_OC2,	RSVD1,			RSVD2,		RSVD3,		0x1020,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio04_paa5,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1140,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio25_paa6,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1158,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio26_paa7,	RSVD0,		SOC_THERM_OC3,		RSVD2,		RSVD3,		0x1160,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(hdmi_cec_pbb0,		HDMI_CEC,	RSVD1,			RSVD2,		RSVD3,		0x1060,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(spi2_sck_pcc0,		SPI2_SCK,	RSVD1,			RSVD2,		RSVD3,		0x10b0,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(spi2_miso_pcc1,	SPI2_DIN,	RSVD1,			RSVD2,		RSVD3,		0x10b8,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(spi2_mosi_pcc2,	SPI2_DOUT,	RSVD1,			RSVD2,		RSVD3,		0x1090,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(spi2_cs0_pcc3,		SPI2_CS0,	RSVD1,			RSVD2,		RSVD3,		0x10a0,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(spi2_cs1_pcc4,		SPI2_CS1,	RSVD1,			RSVD2,		RSVD3,		0x11c8,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart3_tx_pcc5,		UARTC_TXD,	RSVD1,			RSVD2,		RSVD3,		0x1078,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart3_rx_pcc6,		UARTC_RXD,	RSVD1,			RSVD2,		RSVD3,		0x1070,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(gen2_i2c_scl_pcc7,	I2C2_CLK,	RSVD1,			RSVD2,		RSVD3,		0x1098,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(gen2_i2c_sda_pdd0,	I2C2_DAT,	RSVD1,			RSVD2,		RSVD3,		0x10a8,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(gen8_i2c_scl_pdd1,	I2C8_CLK,	RSVD1,			RSVD2,		RSVD3,		0x1088,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(gen8_i2c_sda_pdd2,	I2C8_DAT,	RSVD1,			RSVD2,		RSVD3,		0x1080,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(touch_clk_pdd3,	GP_PWM4,	TOUCH_CLK,		RSVD2,		RSVD3,		0x1068,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(dmic1_clk_pdd4,	DMIC1_CLK,	RSVD1,			DMIC5_CLK,	RSVD3,		0x11d0,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(dmic1_dat_pdd5,	DMIC1_DAT,	RSVD1,			DMIC5_DAT,	RSVD3,		0x11d8,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio19_pdd6,	RSVD0,		WDT_RESET_OUTB,		RSVD2,		RSVD3,		0x10f8,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio49_pee2,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10c0,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio50_pee4,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10c8,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio82_pee3,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10d0,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio71_pff2,	PPC_MODE_1,	RSVD1,			RSVD2,		RSVD3,		0x10d8,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio76_pff7,	RSVD0,		RSVD1,			TSC_EDGE_OUT0,	TSC_EDGE_OUT0A,	0x10e0,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio74_pff5,	PPC_READY,	PPC_I2C_DAT,		RSVD2,		RSVD3,		0x10e8,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio86_phh3,	RSVD0,		SPI5_CS1,		TSC_EDGE_OUT3,	TSC_EDGE_OUT0D,	0x1100,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio72_pff3,	PPC_MODE_2,	RSVD1,			RSVD2,		RSVD3,		0x1108,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio77_pgg0,	RSVD0,		RSVD1,			TSC_EDGE_OUT1,	TSC_EDGE_OUT0B,	0x1110,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio80_pff6,	RSVD0,		PPC_RST_N,		RSVD2,		RSVD3,		0x1118,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio84_pgg1,	RSVD0,		RSVD1,			TSC_EDGE_OUT2,	TSC_EDGE_OUT0C,	0x1120,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio83_pee5,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1128,		0,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio73_pff4,	PPC_CC,		PPC_I2C_CLK,		RSVD2,		RSVD3,		0x1130,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio70_pff1,	PPC_MODE_0,	RSVD1,			RSVD2,		RSVD3,		0x1138,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio85_pgg6,	RSVD0,		SPI4_CS1,		RSVD2,		RSVD3,		0x1148,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio69_pff0,	PPC_INT_N,	RSVD1,			RSVD2,		RSVD3,		0x1150,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_tx_pgg7,		UARTE_TXD,	SPI5_SCK,		RSVD2,		RSVD3,		0x1168,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_rx_phh0,		UARTE_RXD,	SPI5_MISO,		RSVD2,		RSVD3,		0x1170,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_tx_pgg2,		UARTB_TXD,	SPI4_SCK,		RSVD2,		RSVD3,		0x1178,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_rx_pgg3,		UARTB_RXD,	SPI4_MISO,		RSVD2,		RSVD3,		0x1180,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_cts_pgg5,	UARTB_CTS,	SPI4_CS0,		RSVD2,		RSVD3,		0x1188,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_rts_pgg4,	UARTB_RTS,	SPI4_MOSI,		RSVD2,		RSVD3,		0x1190,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_cts_phh2,	UARTE_CTS,	SPI5_CS0,		RSVD2,		RSVD3,		0x1198,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_rts_phh1,	UARTE_RTS,	SPI5_MOSI,		RSVD2,		RSVD3,		0x11a0,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(pwm2_pdd7,		GP_PWM2,	LED_BLINK,		RSVD2,		RSVD3,		0x11b0,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(pwm3_pee0,		GP_PWM3,	RSVD1,			RSVD2,		RSVD3,		0x11b8,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(pwm7_pee1,		GP_PWM7,	RSVD1,			RSVD2,		RSVD3,		0x11a8,		0,	Y,	5,	7,	6,	8,	-1,	10,	12),
 };
 
 static const struct tegra_pinctrl_soc_data tegra238_pinctrl_aon = {
-- 
2.17.1

