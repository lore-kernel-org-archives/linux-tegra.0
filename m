Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F43FA5F8;
	Mon, 29 Jun 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725711; cv=fail; b=btGpDni46SGNAXbaQsC8bQjLUoXKJxZ0ZO+1pR2SqgDWw1XTYHhHMQttTyEvPdVxslJ3Rwz7b/wROJZdQtfYxstfddoLUkES+UAQg1AY6HUnSotX9YcoBfvBza/OnDBBekDS43MtEKPdGNBIw2KYTTRFrzkvZ+jHXO/eebIFfic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725711; c=relaxed/simple;
	bh=RkTMTDE1oBX5dN3QO37fwsOF2p+l9PyK9DVL6qSMB14=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=feQCCLtl/ddFg9kP9cWvs1iAHDS+IiQ3UJN+PDlRy8Nx0ve7R9kChsQSzm9mqg9YMy4Ga31yQZYmO5q5CDDzWWMv9kfNasPd9EZcze48ZszGDzEdOZVs2nO/Ir9CEqm29eFpFOJnUArv5VIXWM9Y8wSdw3S5QXDL5VhmikoYpsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UAyZxs7o; arc=fail smtp.client-ip=52.101.61.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UAyZxs7o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdzn5jQJpnEbFVqpa/sbZnuDAhVi7+y68FDmuwNRHEsiV5OJNQ75pLwkSItzol32jgxiAZgGJPUrT0PLJPrBjBQOomU2+kyOFqNFjxSKdSta0uDOUVTq6GEhL0kyzeKZHs8zYRVvibQQG9GNL3IlKnjY3ThsfU2PJIUnLs7UWxdPWQ6JVCRgGqT4FrIP/8L/4D/jIJeHUTSQ0Z9htPhvW6vtIXGjyLpIHfIb78nOO6ehKs5BPMDnxmxpDqo7fgTEFtMuGJXGnKcjrlSSe4NtzkkG5ymE9T7bAUrJ1xeYk/lwGu3Gu1cL0OfXbAKH61ZGL4wAzpRz5Gz0PrMNKGveZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjkHkopujLaEZvza8XmxE3rbAUtMZNz0Eb/fxKnXmYo=;
 b=UO80+URB3hnFwAd0d5a3UelroigD9SqvZKjqg/HnVcYQdGME2FFDmxhU1Ix2j1YFyftTsMzEnDKDuHcpk3Kq4t7HtfYsAr5dgU0TYqz1GE5zbbWuucNAYYwMhZ9hBQ52aNq+7p1I/HiGKdjXeM28BYjS47RTYGYceVBr7FddcMwsjCRoWZylKfCSKagRO9t90+NZg5R8FgEEvJCiFnOEXYVGSnK9KxZI4tw0D3q3SXg0sibP+jZ9WxR2f6rylDPbuCGW/7YCky0LIaOD/4SftjEXWAhzEzcl1lK+iy8QzwhYKrWO0z+rtXRikpU3IM8/R0CWUbCZfwDd/KtbfHwJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjkHkopujLaEZvza8XmxE3rbAUtMZNz0Eb/fxKnXmYo=;
 b=UAyZxs7oSsnn9TQDfWHcPrGsYDfoRpT6c1Ou3eRGvFJ5CwW/haZ9336UDezSjIYCR45px5ooT991Gq/R8L82V5cjtjWYaeD0W4QQVCHnoPk9H0uYkn5vc/xw17UNhFeDZl0AkQrIAIy6zMHBwPmOMtLyFLiiUlKaQ2rUeg5BURX2eTv9D0s6FEf3amF6ShcRqHMKj2hZa+9O4s4Jk/XW6FSKE04GjF/162IXdSLSwX9N6PBvnDeVYM774HD4N+it89k4qA2lTIEs+OxOUHkHT6oUOCbfSLoz7TQpVf/UGB9tp3oSXw3l0ApQ/b3yVEsFgCfvbo5gyGmvnt54iGH5Rg==
Received: from MN2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:208:236::31)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:35:04 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::62) by MN2PR05CA0062.outlook.office365.com
 (2603:10b6:208:236::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 09:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:35:01 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 02:34:49 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 02:34:48 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Jun 2026 02:34:46 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 7/8] usb: host: xhci-tegra: Skip MBOX MSG_ENABLED on Tegra264
Date: Mon, 29 Jun 2026 17:34:05 +0800
Message-ID: <20260629093406.1118594-8-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260629093406.1118594-1-waynec@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4da897-1dfa-4579-1096-08ded5c1b189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700016|1800799024|23010399003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	32IN/ou5903SGndUl7g0qM5x+NAQ/Nq5MbRfy3m8N0sbEPwc5nYRMIeKrOYyhAetUjeDsW0NuvKW5JS6ZqhnOYtnsAf0c4GCNczBNn04KjoqEz6fRwdf2CbFX2uE2ffygACpOAg2eMZk0d7WhQbbNc0W0vq4eLPx4dKMlFOsBBHnZwFERe85IcR9nFTn++aRVICr+LtHv7ds6nC0ZeTitkjfhaY84ZpzGWcL9xy9z3h1thpTtw+FyoSKXtZJ3b1fHbsTw4NcJwknLvuqxwq4M3UYG446qgTvLFLf79eElkMCccNFuNDMyRmXstnoiMpKbx3pjWKXfAFFDdsHQPNm2tAUggvKtVmFj+lLf0IRvnXZg0MDGMH3gGYzhYHcuc/vDzlAhDhp3n0Xk7WGcsDgq9crR1FHyPet4c8lWevg/S34Ws80RF90Fey4MLkl0BJywH+XjRnmFoYerKUb43cf9pdHEQ/8GGq/On4e6JUR9FNBdvCgOjkaA1xFewunlnt8l+3lMRJvOpRC6nJ25rL1tAiqxsOj94urxo7smsABBst534861EzUoZUqdh9/bmmz1VvsnB1bvJGTgZJrFxcLEab0Wzjphs+rR6ZGq92ZUlQlYNX8wJuYa35OkFl204Hl4mHfG667kjIgy4anv7ApET9GLMuOhQzMoAF0W3dDJitfmipSJfeq2iwm9H6MAt5C9TqE+kpn2oYDdbOgUYAT9A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700016)(1800799024)(23010399003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tHayxKG3vYKddRRm3E2mOA5lGSGayVWnCQDHxmx4v2fp2A3oO3M5AsznDQdC6C3tFqIBJUpqmmCqMHboTJnKZI/zf6PiURToN0TRJ/QHktiQ1Yra5yatMCBUffWHFNZHCp/U0h2zqOz3bMRYusIQK7WlBBnxUGSawxwzWpXMSGdpKaKd71MP7k3iIZgF7WavtcEI9OmrqnQsWBazvje5ztidhpnW7R0TPZwtvllbbM0+wWWeODhBoXd2ITzODSEIDKupepnlYifNImCd6udaRVrSDacQRIqmILUwUtxLb0N7pah8ZHgdUYxo5eg/OMLCV2e3uj61Lbd2nc+USAdu4Hicl7Q1RqObDpe8tw36iE+4mbThj3VjjTlaiwKpt9q9WfCyoQ+E1qudJD/UX9l7XfrUCRGYmgPGIqhTNKaxqq6c+zWxNocLNlIFByZg+6du
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:35:01.5285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4da897-1dfa-4579-1096-08ded5c1b189
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203

Tegra264 XUSB does not use the firmware mailbox handshake to enable
controller messages (MBOX_CMD_MSG_ENABLED). Add a per-SoC flag and
short-circuit __tegra_xusb_enable_firmware_messages() so both probe
and resume avoid sending the command.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
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

