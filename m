Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8253BB135;
	Mon, 31 Aug 2026 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202794; cv=fail; b=Oobbj9GVGp/QDuiqwRlLXPf3PCvSfbb3dscmYVPlJyPMWx9+PpN/aTccczshinvXYcmiwJVWY4o0YOh7UHkaxqC6f5Bcm1pnZM9eXBcDwH9ZF+mLwgHPNKr55NaZXFGAa1YepqWB9P7bMqqrP8Ru6DW3SDJ3WO/ifMzZnWANJds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202794; c=relaxed/simple;
	bh=Ld3FGEXMBOeViykDPRl+0Ly1zovGQPxtY59HFAOO/x0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YOJn7UafPlz2cA2LNt+j4VujSohn5R3+yKMRQnrD56Hn965BMwLF+qnWRkpCQ36fe4p2vRMGi2r9VLIQy26T9NMhJrbwSqsSDKRf5ghQxsKzV0sxNore4NNFQvpYC47uQ4KSMrL7T1CMNLTo43i0re1P/YSyaMj75/GjCIEZWmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lm/mdKiA; arc=fail smtp.client-ip=52.101.62.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lm/mdKiA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6t9O27E09AFqZqx5a2KhAhXWOSNnExm4t0bYLrAQEv4Y+kVt7DOzmAAXkSyC/ss8kkBEdGuh3jkXZj+jCpDvRPXpQvnUNBmJg1BgJBt68h26Z6tbCOiKiQklmP+mXI4A1ROoKR1bP3oajbUJ9vtUkXl7gLS93+kTs80bj2r8V2kGoBWrEeoLb2vzjr+GFqKtnX2ay3X0JbRzJ0wZvhmiYnOTrgM5h3Gr6edIlw79Vpp9nh5yGu+akdd13lDZES9q4PIRoZ3oibycmcZZgjq2zylW6XdarMJTRLMSKoiCBNPS5fiHU/Km89yI0fmyx28gN42xiYtePW00Mr12HkOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ci08GH7H9WirG8EwlGHeI9F6B9GZUXF7G3++42U0pOs=;
 b=GnqJNJeGkfPSxHsTnLhm4PIGo1LDh32b0UqKwm0N/OsoDBzJrYVeKG5oOEKwH6HMGzpZkhduT3JB8fInsVUjJ5OYjJ4NFhAn6qyNggVoyKBedZYGlv4V+E8XqlT/r0+9TrGUTiwElOBhEjSp3UxgW0Rm/PRJrsu1UbAUr/wIO+YhqO8EUq4oieKTJEo95O9my4h06bNUVNqt5BRuNAv9iTymH+lWtB2MCfPH2m1Za3WejIE6m0YF5Zm0du48dak/a9JYEkwjm8soHNKwD8hRjRWFkEQWFkPkhWR8gYjn4+eDqtBqNLChm74/Nlpqn/6WVoPxNXr9C8kLqi2m7XYVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci08GH7H9WirG8EwlGHeI9F6B9GZUXF7G3++42U0pOs=;
 b=lm/mdKiAl9IG4IsnnIysJSJ5q09KT1m/NshCn937G/ob5eIKJ+Njtq3CWIZjje713PZnJW6lci1Qy47a5V7L6XkKyCk0rJj/n1bDIRFHK6l1TKhXwCXTJvu0Pg/V3GaL/CI1EQW7Olm/TqNjWYzyrO0I8+ty0StU4+kT1DvOlF8CasFdUMg5UmYUMmqWWKNf/fFAiwZcasNbjCcl1+gbUYbcHx2GwUCKJMto7TrX+R+WLkLSFqlhCt3LkQwaEjjWW1pw0oe92G9bXb3Zj6llS+8cECB42xcZt5M4d76A8p1JzsAaUCxu5Y8Tg/+pX0VVSGgk6bZlLh7XBc9x26BmVQ==
Received: from BN9PR03CA0943.namprd03.prod.outlook.com (2603:10b6:408:108::18)
 by PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:59:45 +0000
Received: from BN6PEPF00000074.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::73) by BN9PR03CA0943.outlook.office365.com
 (2603:10b6:408:108::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Mon,
 31 Aug 2026 18:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN6PEPF00000074.mail.protection.outlook.com (10.167.248.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 18:59:45 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:59:16 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:59:15 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Mon, 31 Aug 2026 11:59:12 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH V2 8/8] usb: host: xhci-tegra: Add Tegra264 XHCI support
Date: Tue, 1 Sep 2026 02:58:35 +0800
Message-ID: <20260831185835.3732707-9-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831185835.3732707-1-waynec@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000074:EE_|PH7PR12MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5d041f-76c7-4880-489a-08df079205be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	X26m6v4Dh32WwmRZr/E20ik4tztFmKXvK43GFB4clSnsBJ8qaozKakkUr2nW3BqOE9U0mAXjBvt0DIvuvUNIm17PHI3F44XQp7Hkh9lHvPmi3Kf+qGPxzNJC37OcZoY9eKHG5Mw+UFGD5popfG9lxW7ceBBKqwZOg41/3BzUbklWwHLpIG2G/nTpf+ZETqw7g3o2MVb3V+Y0moZzXcfusSt+xMubok/W56evdnb8fBZ3PFxwzA+8xRpFMsekdVpzkYd54T8rBxC0WX364rfBa55lLgtpZoE1yjmpFoEWSblbJNpZSglPQQtC4VBcflLqaxX1CyxlNHBp7XCxBQUioBCOcdBKyg/+Bb7yzBCowYwTxLUUJewEo8xSVeKFKGHKflUPqr+TGGA18NwDUB+6lmfqQ89k0id1uSaIpZcXxbm1VXAzhV4faE7WejJgC5VlDRJFRnsb0/NUy6vnhybplkp2PlgofFLvSJk1+gVu2LVSh3DkJZ0uOZRWSoPbcjr7+HjQM277ZmjPN3NjnKIICHev168ut0NyrwXLs7hK7Pqe+kJ8Jtv5g0tCCXzpI1oiPJtCjojhJg6VrDhmJOUallazp4wkI8Esj6bMDDjCxXHWn8lcq7fp42hoAtfxhgwIeG17HOTJToTA6g0GAOOkLMEhKADlGKx8J2t9wCH/U0fiLt7LuIOrRhqNAetgKZLaqwFJFCtzSD6wkVUT6mrE+Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hdznwp8VbzBvj9K5m4OJrx1LrCPGnF7CLn0TxZG9LPAkxNiyqrxkqNopTuq6SRhlJI9AL70cqYHX1QuTU0lF67298V9XgF3aUPzogxgL24ZJysWHzddhUlbUKBLwlrOGIXK5f6mmo8OnMRmCSSLzBgpIAD6cEGGluF2h1KpedLkwx6Qicte/0Y4FmOqaQdt1Zstp1DpcPxEsiTobtRVBQ3ons5fFqxdYohqGrb7kQ9nR+2dVLp2nEro5qOuuDjKnG86H1Sq6K82mUxpm9Lx9QclyTRM6DzNsnJoq5gMWqKgSuytVqqYn5MIyGKyPAoCpH5IxROMHHsA1KwB4yMU7T3ZfYITHykUpd7YpIqtR3MgZ1MBVMSlCMdZcQrM3Bw3s3gU3bTT8cILk4MGEfh9/7xPTLkgyfmAUwIn8kFgG9Y5zKKsYzKPvrAiNk37Lsl9y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:59:45.0966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5d041f-76c7-4880-489a-08df079205be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000074.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596

This change adds Tegra264 XUSB host mode controller support.
The host controller is very similar to the existing Tegra234 XHCI,
except the number of max_num_wakes.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
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

