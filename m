Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A25414A17;
	Thu,  3 Sep 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421580; cv=fail; b=iCHW5Q/yGZAuwe4lbAvHaMYWirXT3+Gc3HCFDrT6kyMpMkE9AP5LvTFWeWX0w58ntcd0IBGFzZc0ug5S87Fl8ywgqwNpRJyNaB8GEqpyu7G5Y92QVToMyhu4D2VMQnerdBpQgrBwyeRRwGABBr3IyhnOpZty5Qswq9ZYayTX15k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421580; c=relaxed/simple;
	bh=AYeygpII5ZiZWzozZIsfvyEZTKfdR6pX83/4jcIoMRc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MSlMfwycOTCRUZG6gwy8RBbSYRLOVpL1PQgXkkDqoX70rcMbTLHwaolsvrZAlVSYWRG1yM/7KF5nx1MKKr1OkYcrWxz3X6R+0P4bwvPcCHGCO1b+ygrz8xsnACUw5aFSZWbLw44tFIRFH6Hz9HDvyjtJtjDnE5hPbFU5c7sfFZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WCIQXMS9; arc=fail smtp.client-ip=52.101.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WCIQXMS9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1uKhRUOiu4Kxt1GL01lY5uXbP+ppi/W5MBfygyUHG0mP0GQEF2QbaVlPITDQiq0RVhRF2YcZ+Xj+nf5TIfvRXGBB4xVRyAH9fLg3i8KiEYFEvmKWtBu374cDai4M4+14xc560hFT6q77QDcApOTjqkJsi2ZUnEAVJ8lgP2Epmnu7Pq9b0MvJfQmH61GPVpZokdm1nyqMuVOlsz29yC8wdxbAV2jDU3qeNbQzOEg2gaYQMs410RcK7tyi83HEuheqLragGRmt5dydKWU5Wt5Uh4H5cUwLKwGCIroACJBTtH+znnnxJ4GH/5Vk2H9uVIorLfXKbDQG7412VQvwopkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olxox7Krj1n3+dwlmw8uOzM3bvoCdvvSOLRCvBI1+Qw=;
 b=sm+2XvCI8sjM08Cn0+ua73IiMQYm0cSuQyvLJKsL4Y1An0Ti2dNpUChMhHchwujBcxw+BNnK3mxVduhJQOzcsfxVXYD6rmGbfYmuyJNX3kqcbNVfWbDKfloUF9hPf6AIR6zZ9XatHhffcKXCI12p4HCtqhVxcQAhrpKxuBFIHje0Zh34JLt6CwC8QsEjvCX5Z+QVX+ThTDODlFRAyZTqwoHPcFQOL+SKWM20Kj3NKS0whS0ywZ92oIlR3/0qvN/bbeVUNXbE+3G9lIip6vZ/FjtlL80ojW9ExZTsrphLmR0FRpjidvJ1dVncBD71y2qjrBsAR0/NqkmtkvyXsMKiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olxox7Krj1n3+dwlmw8uOzM3bvoCdvvSOLRCvBI1+Qw=;
 b=WCIQXMS9xeu2tuKE4fKeOLDgUo2cax917CBdv3DnnsCxrUNuFoU5LMMYMGbZg3HHsFZ2zwbBCU/cmEP/GrsM/n3mNUv/49h4v8eaKwB4kxZB+zZ/HR6wt1ZaUW4cLJyENBi+rqFHyS1wFhYa5oUUFRU8AyiIWp8iDwj/l6ig6OTmN8FaM+fzNwquYdfI7J9pP2c4yswdSAEa0wdJLaNa6u5uFsFwr37K4Ti8nXlP7FCPs85ww5yUTR2Z9Mt1gvyJ6OeClD5o3AjpvFBJUv9vRPr3fL7ZWUie5i1ZgzpECF7QUBNqUSYUWWdFpvnF1EwalEppcIRTPmY8G4L/PRAonw==
Received: from CH0PR03CA0111.namprd03.prod.outlook.com (2603:10b6:610:cd::26)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:46:11 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::2d) by CH0PR03CA0111.outlook.office365.com
 (2603:10b6:610:cd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 07:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:46:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:53 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:52 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 00:45:50 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
	<mathias.nyman@intel.com>, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 2/3] usb: host: xhci-tegra: Skip MBOX MSG_ENABLED on Tegra264
Date: Thu, 3 Sep 2026 15:45:38 +0800
Message-ID: <20260903074539.613220-3-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903074539.613220-1-waynec@nvidia.com>
References: <20260903074539.613220-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d17d48-dcaa-467e-59fd-08df098f6c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N5hh1AcS0PRt8S+fyJytKES3rkdkMojkS/zP0M69Pnvw3jzjIp7JTc29E2dfm1xMPJZXRyfQBXRpnPXhkp44fLad8Ys5hjW0qqWmLHId+lqU/xi9LJ/xgnSURgfrPlgZ+AixcIanQyatnPm/5x+1ibrxiaqZHpr4o6w+81ffrLT/31U/ypBcOcxRiXkmygD4G5zjbIlFCbluZYDBMMAwpBeiFs04kkDb/ashmSFprvRjjVHLaZ2kJalSmxat2GgIPkfL29viN/XqETjNd88tKCdUfR9KuQhrAceH/a5hkwju/XmP3xmeIG6v+xvR6DGA1GOez0FhptHmAa+2CkE7uQbM5gdVglZa0hTbgAbWKTqZ+TNXjjksiQ+EQRytDtMZShz7B+Sdiv42hTSd62PrLUB6wqh0wBpzy23ULyq6bAxdmXtUUj8azOqwdTgrlmKmxHYDhBTV4bQ9GEqohe8n+pZWH3YTZcqkp/Z0mOE17R7TGR+cbpB7zlOsrwrgFc0SbaHZN+mamD7pCzJGwPUBY8p2lG0GTLGrHXBh/o6TzOvkYCohaEol1xCDNpIbAyrzSpoxkX/8JPmCrL+9bLFZg/8Ix+BR8K24Fwaz7CuzIzH8tKoNAN73/Mehhr00b6H5L8zXW/IW2mYC5eFla50XiOFbas4+wIDR4wqBdj5CkL0lTqGW/1HNeUQWxwPO2sDHwwOv0a00Thx2NIkpnmRRnQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7pI7xyh7+d+alrWEA1VfS8ks6hVJNaIZWUy9JQRaaAv+RuDaB4Ugx/uCoi5y4k2hWkrh64d/XS8iFWcRDvtvZTewJA9wJPLWTMoGh+c9yt9VASsGuQX9vpNFVjo+e4ZyZXzvZkPGPwpBX2RApk5/4qN32ICYQPM6+w6AHFuAm6GaCFz/urDHPa727E4qTP4TVV/9cF4BaweD0LGqSdNcXCkpVxdOGz4nPL769lLpabEr4gwE/WBkzwNw1PpwYOe7+6LBiJlzEKv1/okogCnmQE5L3ElzLDnpcC34K5YEnqdK8A7yt/elNEMfv2KCGegpMQ1z9ZZbVbz4kUoqYxFTWvvXPxbJYB/QbdbbzYn3yZcBCBy/UIlLM13l6LOOoQEyReOLFhdU++MZ6HfZizAnLw2780lNBLDLTLKskNYc53rV+EwWncDprgxuyK1YU8Ne
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:46:11.4340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d17d48-dcaa-467e-59fd-08df098f6c8b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Tegra264 XUSB does not use the firmware mailbox handshake to enable
controller messages (MBOX_CMD_MSG_ENABLED). Add a per-SoC flag and
short-circuit __tegra_xusb_enable_firmware_messages() so both probe
and resume avoid sending the command.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3: No change
V1 -> V2: No change
 drivers/usb/host/xhci-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..7d56f35ec9e7 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -250,6 +250,7 @@ struct tegra_xusb_soc {
 	bool otg_set_port_power;
 
 	bool has_bar2;
+	bool enable_firmware_messages;
 };
 
 struct tegra_xusb_context {
@@ -1260,6 +1261,9 @@ static int __tegra_xusb_enable_firmware_messages(struct tegra_xusb *tegra)
 	struct tegra_xusb_mbox_msg msg;
 	int err;
 
+	if (!tegra->soc->enable_firmware_messages)
+		return 0;
+
 	/* Enable firmware messages from controller. */
 	msg.cmd = MBOX_CMD_MSG_ENABLED;
 	msg.data = 0;
@@ -2580,6 +2584,7 @@ static const struct tegra_xusb_soc tegra124_soc = {
 		.owner = 0xf0,
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
+	.enable_firmware_messages = true,
 };
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) || IS_ENABLED(CONFIG_ARCH_TEGRA_132_SOC)
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
@@ -2621,6 +2626,7 @@ static const struct tegra_xusb_soc tegra210_soc = {
 		.owner = 0xf0,
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
+	.enable_firmware_messages = true,
 };
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
@@ -2670,6 +2676,7 @@ static const struct tegra_xusb_soc tegra186_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.lpm_support = true,
+	.enable_firmware_messages = true,
 };
 
 static const char * const tegra194_supply_names[] = {
@@ -2704,6 +2711,7 @@ static const struct tegra_xusb_soc tegra194_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.lpm_support = true,
+	.enable_firmware_messages = true,
 };
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
@@ -2741,6 +2749,7 @@ static const struct tegra_xusb_soc tegra234_soc = {
 	},
 	.lpm_support = true,
 	.has_bar2 = true,
+	.enable_firmware_messages = true,
 };
 
 static const struct of_device_id tegra_xusb_of_match[] = {
-- 
2.25.1

