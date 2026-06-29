Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684CD3FAE0C;
	Mon, 29 Jun 2026 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725699; cv=fail; b=SQZG1b7gVl7rxf/t4RNoIRxusNbFzQtavi/cftpgS7fJ9f8geHyl7Tq94EIZU2y3vh0ohY99Pgbn8vHolJDoXCMv8XR3/UaHErcxxw5JSc1Fl6XNiO5jVIFOwNj8kI0Dl9/ghzprgEMKC0q7UNMig/fLP3s47pcWO3Vng84rQcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725699; c=relaxed/simple;
	bh=dYjYGMdk9fevddHXVC8pHMkqhCMzYWdmcZRrs/04RD4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YynTPp+rSRFhun7mdGwJToTWMNpE1W3uU7VcVxR0ltL8pEIiH26uWIgW7byJrIuStuFI8muK2HCEwr15+SbUf7QgOtTYlNzowUIgK2YbSdkPXmC1Nc7w0Crwho45WIPaL4SVgUNQmOfgRTMiA12GEmtOKVfwaocVlEXKwKjVV9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GC9j349a; arc=fail smtp.client-ip=40.107.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GC9j349a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYJK0j13AIgyNb8xQ+fxUkoRoyfNNFbqkw4JDlOvFsOVPdmifhjWfgj1wQgM9f8uI+hE0y7yJy3GGzNOa+D0f68acHICQT8pSbTwZ9IJHcxXPIRAtUsxftrVZ1lR8vBiVA26ZM2BkdPbU4Puy8g1exvWcoEGT91s9Yz9u3Zb3JR7zQ9CsJ5aon3wmfLgtNLVyguIzGay9nxCV4cUAI5koT0KhhqkEf+bPcOd2LED/Iu3oLkhNCxHD/+GTeHnGJgnh+VNj5QMpbJEoimIZlrM+6K260xPtT9ULEothdvrQR/cdVREiIXmy9OqTDdOXf0VJmIifADjBYU+Ta6XEIU/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChNY/jPgzaE932DgCuyb7thiBWLTBhuHH8ZuN8c3I8k=;
 b=RhDdBr70R6/EKODH4FN1AKJeL86dLNxUDpYzrqz7g5nmYtAK8cRcHReXsrlwd/9g0Ao82vzbW2H6I8t2LhdM5ZOK2B5XQCwD91BAlw/M24Oa9Wm+7PVbEdPwlDCHQTVixhY+IJ2Q7ChbT8UinqPOytyow/eep27tI5SjMfO39JYpfr/b+a8cuRAshjaE0hmKx0/aBVr56YDA/OzibpmGFz9egtZrPTzfllqjIQwnh45t8c8k4e2GigUl2m0SJcMHHqWsIbFurG26GV+p3VjFv1ZqDTxZmjvxu0GkWy38hbu7UAmpaTdbjTmnO59g4QETCYzjwOB1xbbvf9SXGFwV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChNY/jPgzaE932DgCuyb7thiBWLTBhuHH8ZuN8c3I8k=;
 b=GC9j349aqCoKpFL0xIHdaD785l9uA+pLMdF51nuoCrf5YKxq3nFOePElqxRCDxw9gTOn6X8FGxe2ySOxDph5fSJ+h5AN2M6B4oTI0mB9UV6j4Bruw168yW0WnbpS4fYvlNLIH0lCidOB1BDRYMlv/0hZhmdFJgfNDB7Ty1ty9dOklHIRPQHjEaBYUmEmejVb9tEui9uGK5hakdqolpJ6Qhl8t7NKpkj2MXMxNd9bMPL3J9OAnbK3FgJ4EFfb1kdzqT+/HkAm8Vii+FXPiK+GO34CREJ6tYox0FCYMTbpXpemJxSSfD0PPO+QXEHogTOeok+XlgyyxXGnfb2gn5KYxQ==
Received: from MN2PR05CA0042.namprd05.prod.outlook.com (2603:10b6:208:236::11)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:34:53 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::6c) by MN2PR05CA0042.outlook.office365.com
 (2603:10b6:208:236::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 09:34:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:34:53 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 02:34:41 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 02:34:41 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Jun 2026 02:34:38 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 5/8] phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
Date: Mon, 29 Jun 2026 17:34:03 +0800
Message-ID: <20260629093406.1118594-6-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: d0aea1a7-51bb-4cd0-142f-08ded5c1acc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DWUxCCW/DpPHcyKNPXMCSc6XgY0HXRoc8qGz+MJkObX2Ko4WEG73cKJiOuOGj4PXTy7JpsjkM818ues1S0l4gxG9nOw9od6nVAywrEP1cBeFg/esYn4Zzvvk5MYl7LrzbtQqEOWBtNe7X14gjlPaGayOf9RhuP8IK4E0aIgnQ8qsKnK8F993WLPd3VpNXjC1gbxipb6dEEPeI8GBwlEEdMHl0rvJiVFA04heqMwKg4RCubj0sgplkNmjtb8J5q4Er0zJuvMhvVrdbuJoKiQhFSkay7t93V6BXgcDXcgqtQNLjNB834szw9avFoGRpIj0qnKSQEs0dvzAOq0g5uo99vg82XzubG/1zD3bS4DYQPyoaUqT6M1zIODBnoSdSx4gvXgwqRIYpu1w4hlVmZ7qI9VzgAAgfH1VZND2t6P0KfxlsyEV/o3WONJ/FWWAOwv0IGMo8jblk27XQTP5FcZOhdpNyOGLdMUc/OHVp7jMvd8B/xp27+wh++rxfQmDfQmDtrBYs4IYEKy1i0BR9QbP9iLIKHyIxezqiXmzogRVeFM8cwNHP051FdIllUQP85il5gd+knOKhzmTMj2Gd2xq1w4oshag2NR0IWIgVPBvefm8C8I1N8XGsC5eebpP1P5jaxFVZU8sqMziUZfE8fEyuD5pCvSvjuJqXWyKzZl5TCAweWb+daJ2HPkxXmZRNcnbN/r5hYmdetvfP0ACgZ+m6w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i9JtgCrfkbF4d4babZ0mF/GjHcre15UpUQf1GCtwtxBVNBdWngiaZjhnRaZ44V59/MqFTJcyRO68EsgJ/ehmr8Cqfzq2mu6+tWTQaXh92QpqpFz0nu9pPgAAsAu2f9kYuFfU7u1NnbbaGYPPgplGR9TE9SCALpJduYdGvT9EjabvDCodE3AA8seDYPOzK/9dH8oXNpX9yEMPUNzA3H4ahk5pFUvIQN/gO5SqF4Iunlec7svJ6OGUD6vQY2Ez9WkMaFJ2MasrU418uBW9+rDXKAczZhQoy6FAMBrF/zLLiYmf8Pwv97t/2BN19SNutDyPToea/g0tZY3xgLaa6w5I0IKeF6U6M5wEgiJRLfK/3512ZLNiolz/pVndPbJP9y6VhRC1xkRI5NfgmIWJYDHZxLtaa38lm4jcAXz6swQCPoBmFu1JpYKvnAwqbkAjOo4w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:34:53.5289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0aea1a7-51bb-4cd0-142f-08ded5c1acc5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315

On Tegra264, the UTMI bias tracking circuit runs at 1 MHz and needs
more cycles for the biases to settle than on earlier SoCs such as
Tegra234. The existing timeout is therefore not long enough and can
cause spurious polling failures during bias pad power-on. Therefore,
increase the timeout to 200 cycles to support Tegra264 devices

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 800be0cbb3f9..9c1bcd4a72ac 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -636,7 +636,7 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 
 	if (padctl->soc->poll_trk_completed) {
 		err = padctl_readl_poll(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1,
-					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 100);
+					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 200);
 		if (err) {
 			/* The failure with polling on trk complete will not
 			 * cause the failure of powering on the bias pad.
-- 
2.25.1

