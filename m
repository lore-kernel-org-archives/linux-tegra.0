Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795151002;
	b=1bn34kZ9hxqfGdQf4llkmcIISZ4SucLKlQcZAqeTZKNE1JL7e3Cid/2uzESRgDoN/fTT
	 ItAnsIsX9ni3aGhen2yuTuq4JUVcdCZ4L89zdgTlYlSq8ptde/ARq3W0uwIz6tCnXrCq5
	 Ja30cfHUryF5ke+3h3nKjT8YIv+2feMT77ouIP/i1cPPpn9qgsCSxpEWwwl1yg4LwINje
	 GgLchbqHmOzBMnCcGJLyygE1E/GmIRFsIqiE9mZh+3TDV1jq9SIcPUR/Gwt2qNwyKS0zf
	 rnlOt1cTjcpPPJv3/S2+JuPQxlVIZE+YGo5SIqTCCvwhMb31+zfqXShhO3B+/Lv3YaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151002;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
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
	bh=7bbzO3YKN99XusMVdgP2AihRgUbqmQ05zF+hDAb2ExI=;
	b=tpD8j4kA09UBNL6LYFIet4bJfd8h0mCL4pWy1ZcEKxzES0JAvU7winws3UeeoljsRqZC
	 RNnzZ4v3OPBzSuFQ2MEtaQYQB0YMx7xKsonjeaj8s8mFIXgI+cg+3NyyC5haD2OgSHygj
	 K6bPe+7C1cjoTlDLOAE18JCDA50axLiRfAcMxE5lV5HqG2aCY1qlYVTdC3pjvLNiWdrKJ
	 OW722CSTeVZWuaCty378yGG/c7Ei1Hz0BmfSwiGXimH/Hryt3bD2o61rwyDJpKcf0bATR
	 ghQS4kI+9JiqCRC9KS3CxIdKCHk5FWTBIbS0pvlY8kde1sj7SzNGobzBwMRwscJw6sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Nwi9TJ90;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.14
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC20606A320;
	Fri, 20 Nov 2026 05:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC20606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Nwi9TJ90
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAWcBVXNgT5lXafgniuT3fVNl8SI70165zPQU6Vxq7gXglHFgzAH9a8pxehbDHJZ6i545Nwu/mgBHPSVNMfrwNfzep3Fj5TTcEWwAiYNvYSmuSB8EEKQAV9yVpX6WeN3gcv9GhrhTjxKiZkXsOy7Ey0NAKEjLOthvHQa+MDd+3rZmE07Xx90D5eF/bHYKq9LkDsXzRYKrdtZympMPHJ+A1orijwS6lppMqdlbGCw7WsS/x+Dp8DZeLBKPFf1PqUJLoF4lcbGGJKI61H3IRODYjnMw+c4oabLnfk5QPZNyqa/BOI4FA+pjw4kBgL/qBlCYvd0ohZgLB06yz8QNFgKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bbzO3YKN99XusMVdgP2AihRgUbqmQ05zF+hDAb2ExI=;
 b=EOD45VXSh9ShowlaPUMF/FEaAQlSEEQaEHG+xaLEwEtcvr6a4asOPhCt+kOWGGSvA79JjE89CMCtIumxEeXUKK+D+4Sld1/bUem/9Hz8pW8Cv6C6s8Y4RKOhTPXVFK6mDZLw8KAevPhE290qZxKRIuWOSzv/gA2/flf9UwBJTNOT6vXBXb5VrECocmzj0lIs7HYBrBS7l126eQKU5uuKZnfGFRW+zVQ4lG28SGhQEpIlaPyIrBOKysvHU4sRkZb2Qfi1NX7ejKU7GC8tr+5mDfHa8XktC/5+uZmRxcf5otOEXwCpQBJJUgI+vhgc1uoESidbdqrtHqp8WsMQ/lmKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bbzO3YKN99XusMVdgP2AihRgUbqmQ05zF+hDAb2ExI=;
 b=Nwi9TJ90qBE0X5U5Vb5K9xvh/ipbX4T7oDKT3ulUsDZb2qIpvFVH/FjURqRCgYn31hZUsgfQmEzfe+hBMIKuCl9vO0xKgGV5bwqTLjkueVulnFioTzVGe9pD/V7YRFAaKgV/TmvezbPeTYsGNqn8lEsNn0oQAWjfkDF9neA+SS10Bve+fuDSaXFdTzmWwyrwRKYveKo6g0EcW8+Xw/9TX6tkC9m1A4TXRKIN58UFzKtRxjF1cA7TerkapoHGYGp42z7p2QKWLc4eXDNqglJmpn9poyMQNGyJDH6befySDWROsZbksOv1zdhPNoN9g5Psuczawq8iHtE0GGI6ScCU4A==
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by LV0PR12MB999067.namprd12.prod.outlook.com (2603:10b6:408:32d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 05:03:17 +0000
Received: from SJ1PEPF000037AB.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::36) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.1 via Frontend Transport; Fri, 20
 Nov 2026 05:03:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000037AB.mail.protection.outlook.com (10.167.244.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:03:16 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:04 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:04 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.57 via
 Frontend Transport; Thu, 19 Nov 2026 21:03:03 -0800
From: Sheetal <sheetal@nvidia.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <Frank.Li@kernel.org>, <ldewangan@nvidia.com>, <jonathanh@nvidia.com>,
	<thierry.reding@kernel.org>, <mkumard@nvidia.com>, <spujar@nvidia.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sheetal@nvidia.com>
Subject: [PATCH v2 2/3] dmaengine: tegra210-adma: Make Tegra264 FIFO size explicit
Date: Fri, 20 Nov 2026 05:02:53 +0000
Message-ID: <20261120050254.1343679-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120050254.1343679-1-sheetal@nvidia.com>
References: <20261120050254.1343679-1-sheetal@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AB:EE_|LV0PR12MB999067:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6d3ea4-9b8f-4392-8426-08df46c39686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|23010399003|11063799006|261009223027099003|261021121427099003|261102123227099003|56012099006|261028144727099003|261026140227099003|261022105027099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	adt2Lz47sBfYb4RzcQITkMzbTCu2RPRvENedV/abzO780HUOnVqLVexUlyoVPF32j9wcdQvSJTizneWmARMyERCs565o8HpTimp3xCh8wcS1uf0r7VTxm5qgbzz07T9m6xO7WZF53EPhI/U5v3HZALDS8yOqW9+wzKC3ZXlS2JFlz/wsHiwn8hZslxdPphwQ56iBmE4o9fSR4D1nunYYhgzIkDNuFLajEXgyEgr+KdT5UFq3vhmDXcccFBlxD6Jlv3afNt6pxsv9/oJUGHlcLf6mY+FHong4fTtJVvuoD7A903Bn6Q42K4EV7nHUeBFztndEIyx1xFOzO89VeZcvvZS+GGXO8ozMJC+oaf6/ISoN+vhs89crqeu7Xwhtm++8cvYdnYwvntzVidcY1UcHjf7hzawtJCTaImWTf3SqJ1d2BdDB7h986vKVWSmg3Djo+vU3hX5F5CSpx4Yo36AVd9flEcaFUYpEKwEltcqJc4wFYe9l/nnVnltw0Uy1QrT4nee74liwg6EZpsEN7RDQkw4Qs2DNdw7io6mPZkcqpHuyYHViU1ZHT/amvzlTLIqjgoymwm67Bp5d9moEpIoZ9klUs02W6Rq9ob9efL8c0bs57cj6AdoKWET3TGf/rHLhfmstxdjfBMFVN8mlsS+QdjihTRZ+UBc5XfbpvyiM7sCFR8TluM7lU8UD92V4u7t+XWBmdQqNSKIsZ3MXFdR56w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(11063799006)(261009223027099003)(261021121427099003)(261102123227099003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7SFBoINFXzbQhFGNAQ+I+C+B8+qDmnl8xJ8p7r/sh4MxN619QfIxQ5ukO3OvJDkIeUOmevpwQEtJbT40ACgQECp3wEhf50dv0fU2raA7l6Jh7859MTGWiwtnv+fmctGMV/TxtiwiKtE8PcqLl1GbciIo9ZZJ6YIShENqmAVwPtxTeo/BFwOzxQizctg4f5uw423ZKBtidNHQGLAAxwcyIB0xmP/a7L/0kb9p6gGn4eHcEgaBaECpdss6OdENJNcjTH+oHTFEaAW+6MQKhbMAI0mV6nyVMrEQ/2gNVlKC/4Eblv7Ck3ttQkre/+++ECrV1vVky76RM2nGPFwzi8jcyG0Uj3KTfSFHW2HWqCQiPfzxI0HYB0u337vaXstGrjQ4UPGhOIcQHFs3vvU2nT+xgIerhWSDCzk+PZDPweFJUJMVGdyCOWPW82M6ocShI9ob
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:03:16.7541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6d3ea4-9b8f-4392-8426-08df46c39686
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999067

Tegra264 uses the same ADMA FIFO size for every ADMAIF request. The
driver currently obtains this by setting sreq_index_offset to zero,
which makes every valid request select a FIFO size of 2.

Add a SoC data field for the uniform FIFO size and set it to 2 for
Tegra264. Retain the request-index-based FIFO selection for earlier
SoCs. This preserves existing FIFO programming and allows devices
with a different uniform FIFO size to specify it in their SoC data.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v2:
- Retain .sreq_index_offset = 0; omit the unrelated cleanup.

 drivers/dma/tegra210-adma.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 21a381d022cf..2640ea7d6ff2 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -101,6 +101,7 @@ struct tegra_adma;
  * @ch_reg_size: Size of DMA channel register space.
  * @nr_channels: Number of DMA channels available.
  * @ch_fifo_size_mask: Mask for FIFO size field.
+ * @ch_fifo_size: FIFO size for devices with uniform channel FIFO size.
  * @sreq_index_offset: Slave channel index offset.
  * @max_page: Maximum ADMA Channel Page.
  * @set_global_pg_config: Global page programming.
@@ -125,6 +126,7 @@ struct tegra_adma_chip_data {
 	unsigned int ch_reg_size;
 	unsigned int nr_channels;
 	unsigned int ch_fifo_size_mask;
+	unsigned int ch_fifo_size;
 	unsigned int sreq_index_offset;
 	unsigned int max_page;
 	void (*set_global_pg_config)(struct tegra_adma *tdma);
@@ -725,18 +727,28 @@ static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
 	 *
 	 * ADMA FIFO size is set as per below (based on default ADMAIF channel
 	 * FIFO sizes):
+	 * For Tegra264:
+	 *    fifo_size = ch_fifo_size
+	 * For devices prior to Tegra264:
 	 *    fifo_size = 0x2 (sreq_index > sreq_index_offset)
 	 *    fifo_size = 0x3 (sreq_index <= sreq_index_offset)
 	 *
 	 */
-	if (tdc->sreq_index > cdata->sreq_index_offset)
+	if (cdata->ch_fifo_size) {
 		ch_regs->fifo_ctrl =
-			ADMA_CH_REG_FIELD_VAL(2, cdata->ch_fifo_size_mask,
-					      fifo_size_shift);
-	else
-		ch_regs->fifo_ctrl =
-			ADMA_CH_REG_FIELD_VAL(3, cdata->ch_fifo_size_mask,
+			ADMA_CH_REG_FIELD_VAL(cdata->ch_fifo_size,
+					      cdata->ch_fifo_size_mask,
 					      fifo_size_shift);
+	} else {
+		if (tdc->sreq_index > cdata->sreq_index_offset)
+			ch_regs->fifo_ctrl =
+				ADMA_CH_REG_FIELD_VAL(2, cdata->ch_fifo_size_mask,
+						      fifo_size_shift);
+		else
+			ch_regs->fifo_ctrl =
+				ADMA_CH_REG_FIELD_VAL(3, cdata->ch_fifo_size_mask,
+						      fifo_size_shift);
+	}
 
 	ch_regs->tc = desc->period_len & ADMA_CH_TC_COUNT_MASK;
 
@@ -1018,6 +1030,7 @@ static const struct tegra_adma_chip_data tegra264_chip_data = {
 	.ch_reg_size		= 0x100,
 	.nr_channels		= 64,
 	.ch_fifo_size_mask	= 0x7f,
+	.ch_fifo_size		= 2,
 	.sreq_index_offset	= 0,
 	.max_page		= 10,
 	.set_global_pg_config	= tegra264_adma_global_page_config,
