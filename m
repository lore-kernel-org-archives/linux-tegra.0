Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795151010;
	b=3b39Q9Cko7JvlahSj+0opFxSAelTH8GVMPVqEZ0825Qd9dYsjE3K15X/bQEWdOZnNer/
	 qIzUlRU19EmZUVGOP3z4lGLYMSJqc/4E8a3c7Jv+lDkWESYo8C3fTgGlNr/gPK8OBRv/E
	 QjJCB5Drdm9K3Hy9xoILcHxccHfGZ0rSCoMPmWnKQl7fRLoddRQog3LGq7GZtkxS3fVcV
	 mUQISxFht40yYi1H4JgkE0sOFqRykX4QBse2yuPIGuU6egOWyNrIpT3a7qtz3zUUx5P/V
	 0jS93n+yKH11JGAe8XSZT5vGrKWFmujU0EZeUZjXir1NqDmkfjUK7xdwLAW6CUx0jcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151010;
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
	bh=+0V/dNvc5RBbLkFSxKfuS9divPuoFbAMAAHCiYVUYyg=;
	b=FeGDe9YunVC3QI5MR6Dg3T0SsO/XxBxW8U00D/gWKgkfl2i8Hd/KEf2lC8Xzi/GaGLWi
	 uFL8Cb93X/tEJTa195bXTNnYwgp6dxosmatBiraV7r8SZxOtyspTuWwfQDveZ3oH6ZXCF
	 QYTGIGTo2maZXZGIkGpkG7clp/lHAIapVAbyik7hLN/ud5tL207P6R3ZISwOEwBr4Nc3U
	 CzL9LdldKo8TDfL5+fKoGYUYhVd8dUhV78WJ1jNAx/b+QowoM3QI8/0aaFlTE6bBAB37z
	 TJXatH85UsrpqXPivMjdYkNLycrnneBI+TUdh3oqQbgDPy7BAkt/12Je8l+ejmYTMwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RmtObtjL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.14
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02912606A335;
	Fri, 20 Nov 2026 05:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02912606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RmtObtjL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtKpf5mquXMTnNJUjQUlzP9zWxy7X0S3HX6+pFQLJReko8Bt62boVu5rieTFBqG81FCoKePcWS9Koa8NW4J2XlmR4djn0pIaW6C2cvZpsZwqWNW2RArvWFJbMsIweoguC9kFkvtwlebVDWKBIniC3bbEKyes7ZWfzzv2m/67g8+CctJ5b/j3aq5WYm7c1fwbRSOs+D1XDSOTgwgucZkysXiFUQ/XWZLC/eTI7BPqeM5ACdJbaJP7eFgNuE7ZKPxTEcENpI6yJ9vkCI+r2l/74bl7hs/CLHrG9Xf3lC1fh+3n5qc0SAlO+cdq2+WyhBMz4GkqYjcH2WLIVEAZBpzCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0V/dNvc5RBbLkFSxKfuS9divPuoFbAMAAHCiYVUYyg=;
 b=qs7JPFb08ne5ffLcbapieYHheN+Jo37BIsbhq4bcLcldwMhP4oxfoCFVrIGoSRhqvfwfjRDXlVWbsjG+j0i17SHpskj7jDq9oyglBVdq52O6fWU+2aUxkU+nFPVi1h9439g5U2drV7DCCPSBJcIbS8gVSyowBJheGwxOnWN6yICY5yrKHyiXQ3zERyZlP5t4mlikZ7UFl46PIFUr9MYYgSO+CEwRDUsQ8I0SutA4xmEj334fvyq7kCxGSKjw6TRSgc9DK8VzSRM0k1Dkl4OZ4wzfowMdbMJ8ogfc4Q66HtjXCNRKHOsyFo/ABTz+TWENZTK6+G7Iym54ERKx+QRYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0V/dNvc5RBbLkFSxKfuS9divPuoFbAMAAHCiYVUYyg=;
 b=RmtObtjLFK1OhmhJ1AOySurh+HrBbDwR+G8fmfzRsSP1486bLf3kjFpRUw1P1RV2WSHUMys3u23x8BhYj74jMNjk3LmjzU0we3tGgOsO2jwiIVph9OJ3plOdnUUNcIYhsOxhphMkJMKEvvuL0rclIQqhQlW+aNRQ3zo5ERrjuJ0rB+r1Xjt4W5wPVZhvSVf4p1kPszk9F1KqynN5lw7eq7ydNNZWnH4UoKtF7SotX8QoG78XtLp9DXP0vp5bjf6yjdim6ADt+/B4fYLHm9F/DKvpBglym1bK9F10BSQTQO0aqW9wh82VBA+stHNY0LN41f8aO+Qpg97XRIS6MSAQnw==
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by DS0PR12MB999264.namprd12.prod.outlook.com (2603:10b6:8:42e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 05:03:25 +0000
Received: from MW3PEPF00001653.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::57) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Fri,
 20 Nov 2026 05:03:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MW3PEPF00001653.mail.protection.outlook.com (10.167.249.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.2 via Frontend Transport; Fri, 20 Nov 2026 05:03:25 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:05 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:05 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.57 via
 Frontend Transport; Thu, 19 Nov 2026 21:03:04 -0800
From: Sheetal <sheetal@nvidia.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <Frank.Li@kernel.org>, <ldewangan@nvidia.com>, <jonathanh@nvidia.com>,
	<thierry.reding@kernel.org>, <mkumard@nvidia.com>, <spujar@nvidia.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sheetal@nvidia.com>, Anupama Kunkulagunta <akunkulagunt@nvidia.com>, "Frank
 Li" <Frank.Li@nxp.com>
Subject: [PATCH v2 3/3] dmaengine: tegra210-adma: Add Tegra268 support
Date: Fri, 20 Nov 2026 05:02:54 +0000
Message-ID: <20261120050254.1343679-4-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MW3PEPF00001653:EE_|DS0PR12MB999264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fea13ca-08a7-4e64-4050-08df46c39b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YBvQ1tRaHSCtt6j228ggjRMcf9hm6UmTq7wT3o2eSJ1it0wl4IkfIsZ4DMIw4ip4GFYyzk9N5TA3o4jVvAuUWb+Dcn/qN6gDYHvBjaHnN6we0DsOfADya+wmu7hN69O4rHQ056N4iCsC74Al0BMAEl77KsuLYOlzX0IefZAvfq/gk5sSlFosqYxWFm3cAzkTzhwTu5W8izkmBNYoDs/n6nawr/hazHHD1ekJACSrRfW+tU33hRyTms+leBWjkX3iNjXYCym1wdAE9H7h2gPTjFYNUBUm5CA4qHKeSiJPdbmJQXcO85Wd7HGzhJDbcAw/yupTyZU8llzk1UsBq5X7MwzpOd3x8UGjvaYkjTczHsBA6/RSk91KTHGT+0obbJxXfIa5Bz31uXAbR+rTqzYaiHP74sBkfnfYY+zXLIRx4z1dC9WF70gnOKJzPiYSTV+lhlyxXy2J9kXPxkMowBsslv0bXYDeTadCyGT+p11TbDdzdbuxIReRvnf4VS5YiYL5mEcPQKsPgY8ATaxgKOdYuKFtc2DAI0NXrvxaTg0wbKu4P9WiR7v5QaWA9/kkC86NDZhIUSmh9otUss39svtwXQwPwgv/lWKzb5OnINXfTRpOJO75U6Dk4ynLBf4hPplSBD5B2cMiA8QVNpbddBdef//sIhMdSe7MCx9dxtc6mOaCm43I8zzjenGBg+EAOfAaI0fVsMjcllVFNH2cIQ2AKw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5+X88VmJ7jEVNgjbwvFbelmv7qqO2BxqukDug5KEj+uHrpQTNUscdbbkUiGBLKiYovuKd7rU0CcJkBg6q4vgREZeLSk4neysHtcYQY0KNomxTJhljXq9CVj26nbtI88XCZdLo1cQJwGHhUDzKYvbAhZeI+6cmeuM2cZUA7uZFY62XLzPQqYwawgeaW5DtJENG8W7PALE1iKqJUGl11qSnmVIkvu0/GkB0bKKYUKvYuXUiKmZrfdUZUek5wDISyHXYaL/gClAHuoiey/CzfAfapxJ8KnAyozVPhobMOVW6UA/m23bMbKEC9j0Jf/Vyvzbw/x7K/kiUkl4gwP+UjpVXX9uzMuclMuvswI1nOE1hEc9NI/KUNLwNZx/wVif8lAeXLkfZy7KZTTlmP19VHpWF7OlLYLqxjkfW3mlLys8qPSZJaAE345UyDAtXzqi8bVx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:03:25.1196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fea13ca-08a7-4e64-4050-08df46c39b8e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001653.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999264

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Tegra268 has 10 bidirectional ADMA channels to support the five RX and
five TX ADMA interfaces exposed by the audio processing engine (APE).
Only DMA request IDs 1 through 5 are valid for this device. Set
nr_channels to 10 and ch_req_max to 5 to match these limits.

Reuse the Tegra264 register layout and page configuration helper.
Derive the channel and request masks from the SoC data so the helper
handles both devices while preserving the existing Tegra264 register
values. Keep request bit 0 set, as in the Tegra264 programming.

Add the Tegra268 compatible and SoC data, including its six ADMA pages
and uniform FIFO size.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/tegra210-adma.c | 49 +++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 2640ea7d6ff2..a2955769d692 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -279,6 +280,8 @@ static void tegra186_adma_global_page_config(struct tegra_adma *tdma)
 static void tegra264_adma_global_page_config(struct tegra_adma *tdma)
 {
 	u32 global_page_offset = tdma->ch_page_no * TEGRA264_ADMA_GLOBAL_PAGE_OFFSET;
+	u64 ch_mask = GENMASK_ULL(tdma->cdata->nr_channels - 1, 0);
+	u64 req_mask = GENMASK_ULL(tdma->cdata->ch_req_max, 0);
 
 	/* If the default page (page1) is not used, then clear page1 registers */
 	if (tdma->ch_page_no) {
@@ -291,12 +294,18 @@ static void tegra264_adma_global_page_config(struct tegra_adma *tdma)
 	}
 
 	/* Program global registers for selected page */
-	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_0 + global_page_offset, 0xffffffff);
-	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_1 + global_page_offset, 0xffffffff);
-	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_0 + global_page_offset, 0xffffffff);
-	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_1 + global_page_offset, 0x1);
-	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_0 + global_page_offset, 0xffffffff);
-	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_1 + global_page_offset, 0x1);
+	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_0 + global_page_offset,
+		   lower_32_bits(ch_mask));
+	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_1 + global_page_offset,
+		   upper_32_bits(ch_mask));
+	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_0 + global_page_offset,
+		   lower_32_bits(req_mask));
+	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_1 + global_page_offset,
+		   upper_32_bits(req_mask));
+	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_0 + global_page_offset,
+		   lower_32_bits(req_mask));
+	tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_1 + global_page_offset,
+		   upper_32_bits(req_mask));
 }
 
 static int tegra_adma_init(struct tegra_adma *tdma)
@@ -727,7 +736,7 @@ static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
 	 *
 	 * ADMA FIFO size is set as per below (based on default ADMAIF channel
 	 * FIFO sizes):
-	 * For Tegra264:
+	 * For Tegra264 and Tegra268:
 	 *    fifo_size = ch_fifo_size
 	 * For devices prior to Tegra264:
 	 *    fifo_size = 0x2 (sreq_index > sreq_index_offset)
@@ -1036,10 +1045,36 @@ static const struct tegra_adma_chip_data tegra264_chip_data = {
 	.set_global_pg_config	= tegra264_adma_global_page_config,
 };
 
+static const struct tegra_adma_chip_data tegra268_chip_data = {
+	.adma_get_burst_config	= tegra186_adma_get_burst_config,
+	.global_reg_offset	= 0,
+	.global_int_clear	= 0x800c,
+	.global_ch_fifo_base	= ADMA_GLOBAL_CH_FIFO_CTRL,
+	.global_ch_config_base	= ADMA_GLOBAL_CH_CONFIG,
+	.ch_req_tx_shift	= 26,
+	.ch_req_rx_shift	= 20,
+	.ch_dir_shift		= 10,
+	.ch_mode_shift		= 7,
+	.ch_base_offset		= 0x10000,
+	.ch_tc_offset_diff	= 4,
+	.ch_config		= ADMA_GLOBAL_CH_CONFIG_WEIGHT_FOR_WRR(1) |
+				  ADMA_GLOBAL_CH_CONFIG_OUTSTANDING_REQS(8),
+	.ch_req_mask		= 0x3f,
+	.ch_dir_mask		= 7,
+	.ch_req_max		= 5,
+	.ch_reg_size		= 0x100,
+	.nr_channels		= 10,
+	.ch_fifo_size_mask	= 0x7f,
+	.ch_fifo_size		= 5,
+	.max_page		= 6,
+	.set_global_pg_config	= tegra264_adma_global_page_config,
+};
+
 static const struct of_device_id tegra_adma_of_match[] = {
 	{ .compatible = "nvidia,tegra210-adma", .data = &tegra210_chip_data },
 	{ .compatible = "nvidia,tegra186-adma", .data = &tegra186_chip_data },
 	{ .compatible = "nvidia,tegra264-adma", .data = &tegra264_chip_data },
+	{ .compatible = "nvidia,tegra268-adma", .data = &tegra268_chip_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_adma_of_match);
