Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB903264C8;
	Tue, 21 Jul 2026 04:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607037; cv=fail; b=iPdsrPyzwJExTnizkyFLt0gE7k0IoMRYsqBEl7YaDTiU06aRX3InYTQE3Ow9JANDcCxDid4V0c40G+k//ee2lcGZ2T0lHzsOOgSelxvUKb1mO2Q5ZhefEG4IrctNiRkBAEwnd7TY+FJLTyjEDMK8i9RwFuI9p5hpHa1hAQVJoW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607037; c=relaxed/simple;
	bh=i+C5zyKRtOYna5YMeTQKPLCshsb4DdWPM8gqIES5b7c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtZNG6E8g/6E4Yk/AG271P2Ik263OvAAFftkMBmgWuCMgwPRiIK2nZXbXBQORRc4PtK9apbSCn8biTbD7yA/bbZ+z7IPmvLWfSpB2GgqigqfKTUigfdXHF8bgCqufY6d5HFkJ/6FYRBWKD3jTLHajAFr7YpKBEqno+3981t/ykc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c60BejqJ; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c60BejqJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIQV0GvIaSGB5WVFk/HLCpYvdhxfJGIV5WwAj97AENMHWVqnipa+Kr+pLM2v+st0yckBoQ0gkI+j1iQEqOv08MqAheArHgh77+rWW5HLpH/bn10pcdqtG6kp8aORCFnNIaHw606YXesq1vm9OJnEdP7reqWUH1TgNUYVYnuhg+BdhxQwMK96thUL9d+NVtWs0RWUlxeH8YRI4eIsonuBF0RewY7kbCPiBkJchakoyWcDa9JjT+GaOS+ioJaydCB3Dx4gSj+r78b+HvmWu5Cr4LwYShFcERWHgYATVPFLgd1K6R6VFzskGYAsSXrDEkIf6NrGDnJ3YVwCDaX7UyiB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E90CpKULU66cA34AC6jiI/LuL0mmi448982dtTO6EKY=;
 b=kXFatHZ0A9mTw7GrXvmL2OzTusnBngq/U8jOVH9UDSxSOeL6/wuXfFxGMFsZU8eFKZjmfWHo26PaN16ZB6HAacI5MZcFXPESBkSOFq15AmljGTK/WSOzfXk0oo8N3MEpA7qbdqeCBONBK7Lsp/rcFRAOKbNXIXszd1D5Soeh63zPjpolnks+aXZO2nHQ7WjytIaNvRIkQJEu3tRI65PK17LvIE8GXtGT3/QhOgBL9ViZJw5odz3Xe5xkSp01QOOqSA1G+UQyqozHDUI8D1M3nWOuRGPL+ZQ5TxrFsb6WpiVElO8+905+hKlUK7ZGxZlQ0teq4BS7IiTenAoV6VIWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E90CpKULU66cA34AC6jiI/LuL0mmi448982dtTO6EKY=;
 b=c60BejqJWGQWHGyvtnp+A5YxvgLXdTMpYLgI+Yj7bLzvnGoksFl77m7HPpQEYO87IigGi9oiKUXMYdOa/Nrwd89nV+5CRTTzxqJ1FM706+mxb52z7xrpxJJQChrUs9W6MMLkHaAm7ETueExhqLdrqx0d3U4K92uusCOcl5VBMDfvOIKcHKvDIRnRD7cI7P/BrqXP6yznstWroU7jawYg1fnAJ2h1BCba0jUAf+SqTOYlANoxzZ8eez3wjbd1+0DRJbtwStPDvgPX30aiSjGFE6Kx+MG09I1TXZI5e0QQNdTtMNglt8a4DbHenmYH1oaDyKlWz8GZbx4Q3jYraBlZhw==
Received: from MN0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:52c::31)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:28 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::3a) by MN0PR05CA0006.outlook.office365.com
 (2603:10b6:208:52c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:10:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:27 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:09 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:09 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:10:04 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v6 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Tue, 21 Jul 2026 04:07:57 +0000
Message-ID: <20260721040805.1696503-10-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: dc91438f-f67c-448c-175e-08dee6ddff34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dI7e5gOD99EGJkuRZQ57Bhx24OEKfoJDcNT4ItR5Hl2wMqc1vxQpVa+nk9Q0VrHQOCMLAAUR01S9jnoxS54qfxC/3kOAY/4qQzfOJMcRWUJGaXppAUBN3oSgBrNryeg3DGlvob/va61VJV0qjaCJRBiNVqm7KCcEeyegISYAQSwAIDpldYUAZddlZ6QfRGQbSbbPKLCf4qw//RWSttWB1HkqMmnmfWKMJJCSJpS3GLMGrgXfVGmRp8G91oiMPcW07q1BNjIhvZ+IYn7Xzo8GgAyfZ2BPGx9Vy+gWbir5eN/zXq24/xi22tXTjGjm6NU4at68vQRms0VXZY75u8JrYobL8djaMNPy2S7vGC4z8U8H0tQZl9GAxuC8AWc5002qBB4/8T/E1yUXY/vMFiEPLOwNXAI85wFtr8MZ0aL5ELKq3dT+DNvGrA8S3GUDIEAXt/CNfnndjhK+BMTolB8ButqOfoD7gMishKSsTnlPhRedfus43HafzI/9HvRDFPJbS21BZLLETRGhrc1jhz55ukZmuoWV17Nmo+EW3Xou8QfpaKgDVUVpmyALKFa5Vi00W8Gqa/+c7Rj7oUyWgzjPH4aWbmfV4wX0MbQmfT9cLnqPEu9kAmWtE1ih2dfakXopxUA1sxiAyUohmJmE2Czkgl3QYPvqC/jrom0jKKOxl5Z251uEMuJsJiUAxbSkhxjIqKkCzmVXWmBtkxJYYA+ltQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	546CUBImCkkbAWtxvH+w1Xkb1twlaDQnh+ZkY8kBhNlAc5N5GCAbNz0jkEJOLGmbSyCSCSXEcCowMEeaaKtdb9d+o9bYi8Sw3p+RpFM5VYMMovxfe0kzXRW6bNtuyUznIeZAgrZdY1xeb2TR/x13V78GF8YW+Orjh3xkTh0ROmqggIMbuHtNnK0WeNWkcrKdvbdftJ0vLyoMBNjgdcNqou2kENufEWeK6Ene5wMoGokAZJl+O2c9ZKA4SA1ew5oBun847ZLq+BGdx9TqYQ05a9DabK5vy6MX9lzlcV2fLPD4la5NOdoTUTqY/4Lp4hLI6x17paKe09l9EtEX0WIRV0UEEhFGKL/NNPOieNpVS3ySHh00xM4sk47zT9IqsfO+JZCuJV6LAc6roOm1Fcmkm7ad7INdXyj5GBhObp8sooFsqBz+QaLEJksQLeDm8xZe
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:27.5131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc91438f-f67c-448c-175e-08dee6ddff34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 3ec3ab1c13b4..efe37f5224c7 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1860,11 +1860,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
-static const struct acpi_device_id amd_i3c_device_match[] = {
+static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
 	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
+	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
 	{ }
 };
-MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
 
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
@@ -1873,7 +1874,7 @@ static struct platform_driver dw_i3c_driver = {
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
-		.acpi_match_table = amd_i3c_device_match,
+		.acpi_match_table = dw_i3c_master_acpi_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.43.0

