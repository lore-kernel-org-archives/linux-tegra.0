Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842709;
	b=DRXlJGHhTkD+qDXBhQTbtR75Io2yCOT0GKGJjpJQnwhW08zmm6c4BHd0vg4pNWKMYy5D
	 eGJDUQAoPOeX5AZqVR9GM4Szt/5RSiyeCOiiK2s0WbR94FDfvqAcYR3gZVNcf2ernp/m4
	 6+pIQ/X4EbGZ2HHSwaUOF0VKW6JQgETnSfxflj7VqlnO+Rt8e3qGR873MGHt5hXsRD8+f
	 fCFU07U8+g8OPVpl09kRkQDvREuRztbZJEgLlpN7uDB8fAQDx8NeFt8RcaU3bOxPIdEos
	 b//lGQi6Noxd+/M869i9lwgt/kZWChPa9e7L/qJJYSvsMkpsnge9WZ+fhu2krluablA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842709;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ejMjlzdNQ8+u3i/FdRjsxcEf8uKco6uvCuNvjRBzP/o=;
	b=45fNpCziiSuJZmUe8D7xQoytN1sOpzzbVNsYbDgjmoxGPbrsJ+COQ08ZyzHpbK/3lnTo
	 b/yxztYGcnP5hxYupjLdSoMp7/YeKIxgcc4OAbKq8YzLDd1bmleXjkglO4YpuvovbilvM
	 1i25IzcZYjCvTcSfz7mfBlM2Iiy1RDbx9npkiL+5KnHboURNU7B3oUuMqokd9ra+ovfma
	 UqWeEAVI1b8VePZrMlZ6zDW14MM/cP4+zr84DRRcF5TPtx5FFk9w0zDuebOeb+7gXz2RF
	 aa2xaG7A5LdYiZC7DB1ICOVprJKVB0CyICGT7qhWmCG0iWB0mIYJx9CBvz8x3iYRZKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="AKHI/tyy";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.48
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F380606A329;
	Mon, 16 Nov 2026 15:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F380606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AKHI/tyy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1IYBt+3uOuT4sme+VtgiGH1wCcbZ3LvezHhEmcklvpDJ5/hLht45uRJ2G17UjEpfdGVQ9kGky2QIg8HTG8pf2aCd3CxyXBvaycHtCmvp4YBthwYpqso8kbQ7KtBUADc720wqlY3i1ZehIHAQBJTnFK0oyvhjnu6q/mjP7W3mh6aOHLIfGfAnBvpltCR0iswvid6A8c7WtnJ8jpmFTHkOZIjzJ/43B4TjUYmPyy7p3EH3d/QdRZTDu40T/5W8GLkZO7kPH5MF05AG3+HotJpV4dHGtLkvvkkkqaarrpJntQkeaoLTesUnZO6JeDnQfwsyzutvuX4TqF/txWlcAadyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejMjlzdNQ8+u3i/FdRjsxcEf8uKco6uvCuNvjRBzP/o=;
 b=ZPdfMmaZNaRVETAm4bQjQDsA1CHzgOIqKHWUu5P3bCMtUriLzXvkiVs9sow1aXCSTErxmX2oidWMROv/RuayoF+BV0Pqpjod6V4FqHb5N4rpmIam0PmhXbAjbWqddWxaqfy7n8RozUZw3KbCCx22kzMUmYhek+g4duLLYLqTigDqEpyOjuu/Eg9cbLohliDYPLVr5BKh9HMiJnRxAHpxH2BkxCelrSd1Bpv3EPK3oiLsLulZqqYGTsDx4iQwPvfRLiH9gq2ljdFXy+ag3SX4nQdJKr6Crk61lGlS7/w1PKnUXzLkE1njS8drL0mppvLSa77Lu5X/14xtMWBRZ787TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejMjlzdNQ8+u3i/FdRjsxcEf8uKco6uvCuNvjRBzP/o=;
 b=AKHI/tyykkaZLxHLBtmhLgHW9EsdbcTIxFCxqkwIRTAMfgfDJXeZn7qBdHfIQGLOqnySqQ9vOllLH3T1obh+qfV7Wgc8/3nmsEH2wPumnQSTUoh3fsdpDxIuOKAgV9Gdkj4HRWgrrEJ5fFUpC6CVp5BhINi4PK/bxPfj9hc/22gxkGM5PfKG1HbY/qaGLIumSM3OTn8bI4b9IvTbKuK37xFNfGSSKUtN9zyKp0BISxIdraDzBaxDCq8/XBwl6qHcekdBHBWLM5utlZlO8cnLvxT5szIygfCGHsqjgR8UpoVpzlKnoOPNnORdRiNuUY3uE0pVLPknP5gldQZkdlQVyg==
Received: from PH0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:5::35)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 15:24:55 +0000
Received: from PH1PEPF00062F29.namprd02.prod.outlook.com
 (2603:10b6:510:5:cafe::85) by PH0PR07CA0030.outlook.office365.com
 (2603:10b6:510:5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 15:24:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F29.mail.protection.outlook.com (10.167.243.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:24:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:31 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:27 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:04 +0000
Subject: [PATCH v2 07/12] usb: gadget: tegra-xudc: Fix CNT65 configuration
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-tegra-usb-v2-7-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
In-Reply-To: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F29:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad879c8-6e0f-472a-8574-08df43f5c47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|7416014|1800799024|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|10067099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	YPnLLpYipZAJ5xcZHH9070BX4T1gkU2IwYJsqHZwb9FXMmwjme9R41i4pDR627rnZ8IRbjyr8ix6pNNpUADd/tTs/9wQj2NxgQsKTJqv43VwlAOIoV3edRF85BM9oUc24JRMGiT4gE0r6i1Tg1UtbXbD8ssb21C84I/CgYtwQz4dMtg9ey3RQcX4EsSDyAeBmQy2c3eA1THuIgcwDGQkw9OAW50H+EuklizNwkuK/GZQDuBPcSz12ap3LG0NXx+uP2eO1o0lWBnMG3BvHDutJJsIp35bw7e1OK10hyDTF3l+Dw3EVT5CAo9uZC+5Lq+zkWTWoo1yVRonNKOyyIQ+msm9Gwd4mjuLv2JUvPKB+fDalltXBm0sBkviHVO39+G4+NjN83nQZHM+DMuDCkW5lMoJ9XAnz0IJlfuiwSOI05w6OznpmS2KCu8Q6U22Y8j8hm6g0zbUzcpMcJ3jj83cUoXpIDbi7dUt55pY0xCGXiJ6dXv97+uYNg9Uh0SaXLzjoNl2k4772JXbxAIZqLr5xPHLAX/qtElp1bPInbi0A0U7JLaDu+eaW9mWRjednYxbDhcBVPvmbn3BAbbHDc8XY5MCDmcp5KOcawQ6KdbdLhfXJrwhpYAmKyZcbJWgwyV02I3hJ4zZC+YlHSz4B7i2j5BPT8vdgVgZ6OwZ59ilr0nVaUpqwxoZ5yP+lu57iWb6+QG7OJ6u01SskdB17AsbAQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(7416014)(1800799024)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(10067099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LDN/P8tq5EbGie0YmCCLZbx3SJd5NGdey/zDy9x3O9giQvpJVA8jMm+oqPhK6LyqwGlh0h4cOtOSJukMQ7JmPnCUwuhl8BwaShXvtPx/q8t1RlrOv3JP6wpDW4chwupkICPByPZEsY/YqPjJc33evYsODdDIMBYOuVqJlyO375JP+bWoqP4v5h7VNFTr3AW5fD4j5TsTGsUBXxD4z2qGdw8hhkFhDJWMlaH5RlLOcWLspYvj5JH853dk3NSrjxatp6oNlJoQGm1RsQ9ORMgM68jK6CpbbfeufmcGMGRrQ4xYkbI+ZtBKrSqyOGVOddIwCD5t2AGhFlZTd0s34vKc8y9ursf1Qi4Yss1PGIUOewORTKt8i/roZJa6dEZ5bMxGS1E3wXtX3oENt95QR1xd/NtICpbioBFP2m8Y6Bh2SvcvxL5/XlQo8fvs3sf4k4dY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:55.1671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad879c8-6e0f-472a-8574-08df43f5c47e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F29.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407

Both tegra_xudc_limit_port_speed() and tegra_xudc_restore_port_speed()
prepare a value for SSPX_CORE_CNT65 but write it to SSPX_CORE_CNT66.
This leaves CNT65 unchanged and overwrites the preserved bits of CNT66
with those read from CNT65.

Write the prepared value to CNT65 in both paths so the Gen1 and Gen2
timing values are programmed correctly and CNT66 retains its own
preserved bits.

Fixes: 88607a821ffc ("usb: gadget: tegra-xudc: add port_speed_quirk")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index a7736627e6e2..b2af5107747c 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -642,7 +642,7 @@ static void tegra_xudc_limit_port_speed(struct tegra_xudc *xudc)
 	val = xudc_readl(xudc, SSPX_CORE_CNT65);
 	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, SSPX_CORE_CNT65);
 
 	val = xudc_readl(xudc, SSPX_CORE_CNT66);
 	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
@@ -678,7 +678,7 @@ static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
 	val = xudc_readl(xudc, SSPX_CORE_CNT65);
 	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0xE10);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, SSPX_CORE_CNT65);
 
 	val = xudc_readl(xudc, SSPX_CORE_CNT66);
 	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);

-- 
2.43.0

