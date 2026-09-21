Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B949502E;
	Mon, 21 Sep 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993195; cv=fail; b=VF1fD4xhRA7I53QpzGwd4lcd+OCSLjtxB2mFyTj2UGp0ZBL3iGrjEcOw/DtLz/Cuu3ruDEPsHLzdoH8260JLYVIojtGvbEtJId95fbsB5jdUir/T1TqN8KMyh7qHiTZFgv0RX2CsdOpWtBFhlAofZrwbSCvPWiFigWHmVhHZveU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993195; c=relaxed/simple;
	bh=yTl74d6iJCX8Dloqerfshf941yNP3xwtYtj9vHlPmPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tfBZ0Rt1ixa1SsLhOA+ujqBoNoO1DvSyFU0yWIUf7Q5OkkNKKR1asNXbjDuMDSdR6wOHgIz0fFsB1P2XyRA2CYLgOn9zI9kGc2anHSTKh50QiMQNkNi7dv3ob5sbPrh2h4aQCcDhqOOD3HUZG8H9YKERTIYCsdRv4JCycB5U+ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gmr27PVi; arc=fail smtp.client-ip=52.101.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gmr27PVi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMj+FAzpPT/j/HkL7uQTDuH/IltSI245sRhxu+XAYIYHIeAfiVhieVVev2wujnmbqe5bPCkeu8tNWdjxaNra6yweZjKwQxCPu8/njW5P74jVLp0NVXA7aEfk6SjuIArCDG9IsVQ0aeYuvxLtiuMFCfzdtNgDGQN+UqvwUF4QY3iP1NmzpqGnPyKjGb/J7F0T0Zu3CbDnOUj0ofRQPWUg1HXpKhnFPvWoedM7n2GrwnRDZO3d974z548hmsrUsG2IvX1CyIrPmLs4PsYTMNI2R3Y4xS9JEhs3jmVdfqCsIrZ5Qq8+sSg1qgfXq1Pawudu/4FBFnA6u2/CVbpFPxdE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqPKQ7PlDoAiIiNxGlg06W/T4szdLTrMer4IqaNCZYQ=;
 b=vCtjpdL70tvaM0mA8buYCdmbAGIy9U7tsbukOdo71pGzBhnIUjUF0DSxfZ+AFFWuDv+KHG0LtrFdD6smMsWBU7C00xNUpx+RJR3HEif0C+QIlPTT8mycNGs2JOQiGe2N2/IRgXcxon+ELlvwv/dNHI2GhzQ9ENPGGofTeY+DjCeuIAT5wKK2uow/VOMZuchS7ktVYA60wlZBcEYF4oy0RMuXqZaMIIGMTNt0E9SSnLWMoPlvis0UVgq7WORHE6jNlZWEaD3W1c1kKra5u0AQpBeCWis9c5bhRNCBp9t4MMm4OvHvDCTnnHaSKWIwKUXRrZoJVvSvkEzY55lYZ/4ujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqPKQ7PlDoAiIiNxGlg06W/T4szdLTrMer4IqaNCZYQ=;
 b=Gmr27PViy015ee/NbNJOwXtXVPYEm0WSs5Y0ekmYYQtpd7TnheG3d2jlJByLB/C0z3FpB1wphDzZJ2zuia5aEZ+1aqdY2TxxLAXq6g4jM0gIUpYbVxk00o7JdMf9zhxHDGq/zEM7a3S9/YrbRxVtBh/xtrwtych/8U0ABVK1AqmL7WujEBEuGkdCd+Gea31YZ5AsdzWOTP1Y/FheRLEzvFaTUVGFq+pMva4JhP9gYsR+cbmlmUSPnl7tlsBEmp+J3w/QoKFWcFUYf2G/BFtqaA4jIPiT910UudHXL4Cqw8jnVnBFBEZK9sJGx1tM8KQbyv+aC1ws/w8i2onH5GMHhQ==
Received: from BN0PR04CA0080.namprd04.prod.outlook.com (2603:10b6:408:ea::25)
 by CH3PR12MB8994.namprd12.prod.outlook.com (2603:10b6:610:171::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:19:44 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::9f) by BN0PR04CA0080.outlook.office365.com
 (2603:10b6:408:ea::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:19:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:27 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:24 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:04 +0100
Subject: [PATCH 4/9] usb: xhci: tegra: Add support for Tegra238
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-4-74a925a35d82@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
In-Reply-To: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|CH3PR12MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: e060eb7e-94e3-450f-ddea-08df17da9f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bCpBH6eu0NPeQgfGpKCTv8Yo6t7qyQ9dkMdIOCBtDMAVZEv0FIOOkwv5ZDjUOLhrh4t0/Vy4qB9S/02OnKSrlWXkmG4GXQUo7VPYZM9Jq7uVHiuvdv08yGeJbQ1rHvrtU4vJbdr789zpH4XR5suzhaHIAk3su9H+QNsKDT+0CA5qCFROwRraPBzRezGlcpgrwJ6G1praELm/ZpQDUmswOiBfPlqBlTJTMtTR3jAWzP1V+C2cnpG2LuE1yS+QshrXAUrKg4oacXnRvGnBdK0I6FxUFsrOBbTXZFvLFkOP/aUlL2MA5RpvWTkTiYFE/iYiumPdmn5dhqxlS+ir5zJm8z164pt45jO9HWPDs88qRpbIYiMw9OPnLOpYh8/xz51eGlfkdIFcY/OFoMOMa3stxVl3E2mZR6z5OCsff7TwDEpv5v9OH57LunCrM25a0SAnPFkOHwMxToYHc3h2QRhgD6g3dbVWxazrMaHDBUyqTpuwIsn1j6/STBPffxbZhi1TwoEZB8vB8qkZ4C5NSEO/7PNzMb5f0cLxEvI1HDHcyGkKkrAGl5FF25FsIAvQJ+tNdVl/f5gxrze+HSqOTuWq+eHh/law5kXmadv5rWTvQRTEWBSDp4h0xMCMAf9CPRVF4aM17Qn6Re8VQtd9uQhCqHrZjWvdj1XSILQufr3S22NrwRLSV5LMDIyG17hpcskSxKzqU0vAJ8ofM9LHLj52OQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NfRxTawJAfM44qZkzyrzBT/DfYWIhLeuyC66tSmKcDIIY1tdpBD/jLSRO0SfyFBrbMHUTppsWPdbqWd1G49DltV/RUt4/YjCkH+PjTv7rOU2jjApA5c4jV738HzIGVBC8PHJf7yaNsJezShiFAVe7Mv2jK+V93lV1rBF0Ql4IF9gGJ3EwOzXf0r0secZPWSQEHIFYK/hUrhv7vHt1AmR/Rmi7FXBNXIHt42VJbSyPMHLzbRTuQSiyiydt2PH1THM/y1sP7UbQ+44sVjX+04X01fMa/MpD18r2IUjEMPVKokGU11GSPehmhvmn+SoTF/okQq76pAoacM5AWygbjfh5CcbGNfAI0abmIWzSezWUVC7I/zglwPORdB8zYRwbNAwKabo6XIwPZ6HbhFEVc4uKYC0pDt5SKhn0Bz71sJW57rATMxa/JQeZfmzl5ddegqo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:44.6512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e060eb7e-94e3-450f-ddea-08df17da9f00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994

Add XHCI support for the Tegra238 SoC which is similar to the Tegra234
XHCI but only supports 3 USB2/3 ports compared to the 4 USB2/3 ports on
Tegra234.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 50d733b2ad71..78ffe415ead4 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2749,6 +2749,37 @@ static const struct tegra_xusb_soc tegra234_soc = {
 	.enable_firmware_messages = true,
 };
 
+static const struct tegra_xusb_phy_type tegra238_phy_types[] = {
+	{ .name = "usb3", .num = 3, },
+	{ .name = "usb2", .num = 3, },
+};
+
+static const struct tegra_xusb_soc tegra238_soc = {
+	.supply_names = tegra194_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
+	.phy_types = tegra238_phy_types,
+	.num_types = ARRAY_SIZE(tegra238_phy_types),
+	.context = &tegra186_xusb_context,
+	.ports = {
+		.usb3 = { .offset = 0, .count = 3, },
+		.usb2 = { .offset = 3, .count = 3, },
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
+	.enable_firmware_messages = true,
+};
+
 static const struct tegra_xusb_soc tegra264_soc = {
 	.supply_names = tegra194_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
@@ -2782,6 +2813,7 @@ static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
 	{ .compatible = "nvidia,tegra194-xusb", .data = &tegra194_soc },
 	{ .compatible = "nvidia,tegra234-xusb", .data = &tegra234_soc },
+	{ .compatible = "nvidia,tegra238-xusb", .data = &tegra238_soc },
 	{ .compatible = "nvidia,tegra264-xusb", .data = &tegra264_soc },
 	{ },
 };

-- 
2.43.0

