Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFFA41CB5E;
	Thu,  3 Sep 2026 07:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421583; cv=fail; b=ove/muJepyyI0vONxAPVaup8skXE5R8yk3tjSddHnRAITjvnP0AGzgsWgIQoyb8u+SGM4JhUwV7Uk6EUoCkOWX8mB00T/11l/Si5rWpxeAmpkvKTY48zhbysw2lAN5Fx4il6stSfJk37ulAHUYNbl/4htXskD6+zCayIT+kxL5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421583; c=relaxed/simple;
	bh=xRrRTzSxNTuC8++In9Pa8w2o1JiJVpUUC4b8E0cybbY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A4ChxOz6l/HMiTC2B0GVtK9xsvkRthsZI0zRAiff5TeyLaMtVoDUT33s7ZUHL/c9ZrpqS7apv9RxesipNSRC/bYdzZcx8qV9Ua9G+J4BLsaiSKhIcBkHlOA0bt21MhHidmWueFh+NE/JKys7n9uRpCS4T9h5ZwyY0vlo9FWWOR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fzQY51LJ; arc=fail smtp.client-ip=52.101.52.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fzQY51LJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Phai3YXk0jkgGFb9HWD+1NDHffhIA5QFevbGL8pzWp05tv7lz8dWRJopMeD4Nhv7h40rVP+MUKIZO6UE+gYcZrClipRwkIis/i0Fy+z8N0eSPZx9JgCHQ9O2Qb5bwpbQnrNkDPfHQPtcyKWnYayZxnLkFS/zINFF+b9hBGstlx8DhUcfXQLLj4IYw2cZ+DYy3BrtZ0BYj8CypW+1HI5XFpFwa4+HhGxe3HiYs06nyMRTn/brYmAbqfLwXWpaMEjFTuScCoE3UnfpIPXggAcN278ghMUKYH3LMNbWfOgxBWZVYApIHSeDBe7NuzK6PzncXa2s0ZVcLEw9CHquXibbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uZWANCSAAMqU1VrJwZR3XJ6OLJQJG459xCCWgcc4W0=;
 b=Y5sIKRo6ztxGUP0RD70kxdkozfU7IJqQKM8XmvHkuTBeb76lj7Mw65Bu9LRdrx3dwE2MGzw5V9Zit3PvKvUy368dO8mT+RfXimqEL4F+cS6cIVp23M78j6Q7t5Q7BVi5SDo32DND170f1lVTfiA3fB7iUXqvfdjKSjLhkvTRtGNuCcKixekbMVmTC5q1+q3D92oy8sG1d/EF05wHrRv8sP5Be/eio4yI+6lXge4TuCkbZ4Eivt1Z706hpTzossBTaj8tHsRyMdQsL9iXbcE2DB8lKKyvVCGTVWUZcmpGXHo8diHUlgWgpX+9k1BlyGDCdmRYAjM8kozfsTpq4d4gBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uZWANCSAAMqU1VrJwZR3XJ6OLJQJG459xCCWgcc4W0=;
 b=fzQY51LJOx+OWEVHzSyCfac99zMSc7siMg0+gHTlvLegHqJ4MuIsQ7s+CRA7Ue2L/8cJd5hee9izDo1isanQy+o2J5yarUObb5d6mV6xuIRaGbUiS4TaO0DOQIiDY4t/ztYIT8cbTNElhgmXr4tFirnDfNKjjkEG6cRJ6ToByZkOxvYNyc25sjifrj0rjZ1C1kxwVMvNnteC48rbbyn2iDzP4KB+gsuGBKL8BgEnVCRcBufMdN98gjhkt/Evm92n9TngWOKbZej7UrWuhOKRgojwb9ZPz61kTtNf1tHsOucKSBZCjyMr1mwdVfezRGzUBpzEf0XbOktwXpeEMjsZvw==
Received: from BN9PR03CA0974.namprd03.prod.outlook.com (2603:10b6:408:109::19)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:46:15 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::97) by BN9PR03CA0974.outlook.office365.com
 (2603:10b6:408:109::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Thu, 3
 Sep 2026 07:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:46:14 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:56 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:56 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 00:45:53 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
	<mathias.nyman@intel.com>, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 3/3] usb: host: xhci-tegra: Add Tegra264 XHCI support
Date: Thu, 3 Sep 2026 15:45:39 +0800
Message-ID: <20260903074539.613220-4-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|CH2PR12MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: f168f218-5a2f-497b-5540-08df098f6e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	M0xQzzljPWtp3Mamj3QfZGRrW03gt03YKDifVkaA1jYXQUKEWHdNuDMIRV769U+8ZJKqT6Ow5LDjXTx6ZRqWzHOzrJfuWNNuTEuOsdcFbeaHk2Vcc5CRvxS6B1GlmE7iN7iWTRPh3RZS8D1uVcbWpYXdlPL/uLSC1hw/HIZNBPXtGoPy8yTV+n+iF8JuP1sInBPM79tDRJ+ozQacfm7xvLkbR/Wmqrd+3Walv7fp2uVwR1MTHNSnZFwpZl7sNEW3E99sbFdV2FwZOFHy29wqoTqtPVLLt7nXOtF54Rfqu7bEWIvxyHp3Z2WkwNcHlIruw/UVXpOgd46J5TGlDILf/QOax7GnOEACTidui9Jdz++KtO4T82VSs0RYqzozK0y22jzu6NJ+J76/AgI588hVdceogMuMAr2JdufsCOjxyyMMJVFsVaTo456uRGsJEQkni/L7a2FSj1ZJZ9qhbKFp5X0Gsl9YYohJr83fLNc57qef+DXy5h6s4BlmWjZL/IC59YPmb0wjBX6xYUXgOwm525x6iND1jqnLVoGLstC/JJr+hLVxvQ4imV+PAMv4DFaEyKXXbkcquZB2O3M897xA+/94O8hRpMupGAuP7OmzUWGD2iFK7cu8vMpB755nrZanvKAt38lp0BivcQG9CsLMMuLOSs6emb7it9DJRgasS2CCyRXMSv/aj2QWSFFOX1CzCeSC8zyHQw4ND+UuOjHgzQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nI23L9fF2T6AeSOBbQ5atp64t0s+IBBeQ5iXveSDLFA5diKm35RKqfreEQ2yIZXnMQ/2IAeqTjlp5BTi9Iv4MBOmdLUAod0j46W3gWF0On+qBqKjML5xO5zBATSzVii17EjT0KY66O4QPhCRI801YQR29FvIVLUClk6kWW6QKGBVqGup8HMGjVQ8w8WDiTuMT9Pw/80Saw3VYM3wqG2z2DOUx9Sec6t/1A7/NHnTjis0lNRAHCqJfKTLk4IIjgCCM2B6w/oc/uKgu+DfPtDxKEh8iBBR3eotAmMACF8jmGB0MsysKxC/3gma25IeCPsMAmqU1zjcBScyz2GZrowfngh7KzbG607rubRbqzOYoOisfXcnbN/B+4xlG/F8ZcYvvcdmjebj78BDs5lgrURO6IDXXwj7V7afMgApZQIqs40WMS22XQPypu6Xv8bD6cEV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:46:14.6875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f168f218-5a2f-497b-5540-08df098f6e7f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197

This change adds Tegra264 XUSB host mode controller support.
The host controller is very similar to the existing Tegra234 XHCI,
except the number of max_num_wakes.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3: No change
V1 -> V2: No change
 drivers/usb/host/xhci-tegra.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 7d56f35ec9e7..9a55d5818efb 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2752,12 +2752,40 @@ static const struct tegra_xusb_soc tegra234_soc = {
 	.enable_firmware_messages = true,
 };
 
+static const struct tegra_xusb_soc tegra264_soc = {
+	.supply_names = tegra194_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
+	.phy_types = tegra194_phy_types,
+	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.max_num_wakes = 8,
+	.context = &tegra186_xusb_context,
+	.ports = {
+		.usb3 = { .offset = 0, .count = 4, },
+		.usb2 = { .offset = 4, .count = 4, },
+	},
+	.scale_ss_clock = false,
+	.has_ipfs = false,
+	.otg_reset_sspi = false,
+	.ops = &tegra234_ops,
+	.mbox = {
+		.cmd = XUSB_BAR2_ARU_MBOX_CMD,
+		.data_in = XUSB_BAR2_ARU_MBOX_DATA_IN,
+		.data_out = XUSB_BAR2_ARU_MBOX_DATA_OUT,
+		.owner = XUSB_BAR2_ARU_MBOX_OWNER,
+		.smi_intr = XUSB_BAR2_ARU_SMI_INTR,
+	},
+	.lpm_support = true,
+	.has_bar2 = true,
+	.enable_firmware_messages = false,
+};
+
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
 	{ .compatible = "nvidia,tegra210-xusb", .data = &tegra210_soc },
 	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
 	{ .compatible = "nvidia,tegra194-xusb", .data = &tegra194_soc },
 	{ .compatible = "nvidia,tegra234-xusb", .data = &tegra234_soc },
+	{ .compatible = "nvidia,tegra264-xusb", .data = &tegra264_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
-- 
2.25.1

