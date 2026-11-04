Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790625;
	b=1moceZ9Q7XhFiMDjiVOoYOJeC+hXe+YNrrcMOO/vP8QWsE31yazsOovcpq+R8+Sd2Mfm
	 z3KhbwzU3BkHibIXullb9gzg8kWquJFLi7tj2IRoPYNu9xxOWu8pr+ciWeHJMY5obHMUQ
	 OfQUmxtA6nQ//+MWVYpuKH2RnBBHi57aAuh7LkAZNNyghv+9KLoZbve+H78lBWJC6nssN
	 fKNRh8W825a+36fjJh2cfg8XHZXXOT+aonmLKI+IYDnea9H1c4cq7OsKldz9eLFwN+Og5
	 PWlJK1R3++M1hr2xE+CnokbKP2uqsL90sObWtEEEzXre3SbqjyDofNmo+8cLtrm0WSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790625;
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
	bh=osDrozbv6iGld2yJRG1BKUNY0NH12DhK/Eo1WMLm9j0=;
	b=l3h7X+t5OYWo+PVnfecytzyHUxY9alYXcRK7P/decFUbegVKgKBaolEmiqCWUzSVgaFl
	 GYGij705V0Wssol4az/iYb68TGheixqFL+9TX4TnTxi1ZXr8JLDHWGqKoZvkZuUUhqmgU
	 2iL5tQL5lDIf8r9mE3dwHA4UXchXAlS2hEqDE7Jtz2lANqSJktPZkESQzU3vwOKK+2rxn
	 WxS3INafSPDioObdJ4AislvHHijZtalPrwUtb/Vm1Zsxf1gwxE7AbDMgIFbpSpK6x4LYH
	 CXWaXzTpymQ699UbUP8B/HuwJTWF2KHblS7QjjctbbLszF952EzSlENfF9OAh2aNsAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nMZTInMD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.53
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E55606A336;
	Wed,  4 Nov 2026 11:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E55606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nMZTInMD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K79HzofxSA0YA2oY3CzCOb2vh+zdu16f0I4ReR11tO0X7m4uTfcAcEAmzVAqABea8vu3tshm1htdgIZok5TXRwBzPSuvTTM0s6aGJQyP6X3q8LqB8tV0kQKaf6FVSQbPKHs9Eeg2lFSkhcsDNoTGLY+46GmYjo0HECF+R5I+gLxFnN+Om5TmGRu6HkSxfm/2eqfijkOcV1JRdlajHVGfpp4OT37m6GUXjvocpl2u1nz5kGJTCzvDHzPRDsUjs1ST6asAiwoB3iyugtIXKSuTgSWbMYro+PrayWzv581PNWYIfCJEzUk+PA2UWYY6fa01cwLLJyiLmU9WzpWCElB1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osDrozbv6iGld2yJRG1BKUNY0NH12DhK/Eo1WMLm9j0=;
 b=MInN0EJPUVxngTgZCpOiEBQ17pWoWSNiYaJyemoVzEF6NO+9qMIY46iprp5E914KnpXTETKMVnLjpz/F4jKwc2mlZV9w2/NBTNEMRifu5X+4r0CsrwYl+h4e2xEGsrytMNqwavxFtNOhpGdlPkbjsRuzT9D/cZKWzdjldrQRpfJYjzqqwbFqdHF6xQEPP92Rb8w1WtvKlDKBeGiyTyWAY5MpRuLoTO2IHT85HiH6PFVHE6hIsJfIsqzATfaF43w9op3B43+Z0OSDv42rm+rVihuDrKvHWGgAR9KM8Jx62hsw+HTfh2Ba3oJg5J32SmwKrjqyaHuqKd54cStROOi8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osDrozbv6iGld2yJRG1BKUNY0NH12DhK/Eo1WMLm9j0=;
 b=nMZTInMDVJiIsTc9eOxU4/AtlPxscziWSrlkrLpGexpDjAxYmlMPtJgcv0VuOKDonR8HRJ4Wk+B8MvRgdPYZJ0+2m0fXUSouBwjA2S0occvBvhBn+ADqlOk5rPdNRcQi6BINtAkSmzBKvrb9MyX8x7eXRkHDn0kgv18/2RaI9zAXC0Bfnvva1TkHpkzk7wzyxnkIIlyoOtN1ifhd4M1lXv0NpDfh52i/ASXm5G+O952W0AmU0x6iYJiPkuXEu2jVPe6iY+lHQR0xGWM7PsYYRkJYdQHVxC/fseXHGbrxdRujaiJA1yasE+oFdyomvzmVe2J2WV4Ph+et46t/icplVg==
Received: from CH2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:610:50::33)
 by PH0PR12MB7862.namprd12.prod.outlook.com (2603:10b6:510:26d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:10:19 +0000
Received: from CH01EPF000BE940.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::1) by CH2PR16CA0023.outlook.office365.com
 (2603:10b6:610:50::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 11:10:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH01EPF000BE940.mail.protection.outlook.com (10.167.244.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:10:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:04 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:03 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:10:03 -0800
From: Sheetal <sheetal@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Frank Li <Frank.Li@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar
	<spujar@nvidia.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Anupama Kunkulagunta
	<akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 3/3] dmaengine: tegra210-adma: Add Tegra268 support
Date: Wed, 4 Nov 2026 11:09:32 +0000
Message-ID: <20261104110932.1097294-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104110932.1097294-1-sheetal@nvidia.com>
References: <20261104110932.1097294-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE940:EE_|PH0PR12MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d91bec8-f6bc-4b47-aa64-08df3a643651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261022113327099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	pIPj8aAU4GURkFlkRvYx4TA4xo+mf4WgpJ9j+BWvWtHEH3/5EDpkBqDO5xCCvxIt3kUZKuH2cCsWHpYADqZ9lsTJ21EerAPvzpuOCYPl/OsxuqqL7K/IbG5MkRjXswomK/48+NnUXPJEmXHbXSLXjQ7gcv00VCipqNNpkdoKcqUF9vXJlzycW4FyniDS2WoP2ULwc2yHo6Qooi4AJLjiCtsaut0Vyais0OCNrlemhTtcOkVgGYabvB3ngu1ir+BsT29768DSNsMKXy4HY0+lkutKteVVbJ+pQOr2SIaECBwq/5eYpKj5n4d6SOElQqFQUWobwcwkfCcyq6aB08AeN9mFcMKkr0fP7tzF3hjYkmsZ01mHVKnQ05VXPdbbGHSD1Lv14BqZ+oDAn23wkWbsdLHZ2hawl2G8H4OpfkTmASEDvT7BQ6lx9B7WHqMaFNa3giWl2Cc9pChZBDjRQN81juXqc2ftpTeSYq119ggTKo0xRVwy7Qcv5qdgVIEe+yXRbpLv5NB05xdwXvICKsiBRuL6pBRT5YWAAMKUuGeqzhLOUpq/fzgLs0w+0oHMDCS8jzi1JQDyCgFdz34h/3tq1idscafnhv1xYe+UYxXBVRp86G2ikOjDUxXmG6Vbt3fq86tU0F0OYaF22v8f6e19/Nzm67qJ6z6K4XWIPTG8PRD49Hopd9suaohRrc98Fo6UiR1MfNtTH/1TylQ4Qr9P9w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261022113327099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qFnhzs8W3d2AVLMkvrD1Xnzo4NMZOuy8occIBIxt3rDhhcg6udBm53xKcQcZLsGSzt9cwYFxyBT8i+66vRkn9UFjhtBae/AoLTU3aZmyEmUC69eb69mpzQUGbFoSbLHhpEUno7RdQ8mYGwX7hz32/yYPaaPfzctaUwQEJiW23c2lbcIVgeDr8CcT3N2kH/q/DzYOZzfvKTNHDPy7I7lJBbkw2SPyEZAjyo3PqHp405WRDU8azwPiUrAXnw4/0rGo6NOqJEW2FY3EexVoy4eAdBV2exFa2jLUrxXWhmaJKCqWDkfIXFN5nxSC45J9C8irRiB13STFm8bV36x8f8SNiwE0s6TNjeunVNm0mB3kVIezhmJOmV3ihwHrMLuXtOVm6/bTYec0/Or4YsZS/ULXFV/6pa0Pe+FIey/H00+dSUUGmWQRvmNl4Nsw1Nsq4MLE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:10:19.1129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d91bec8-f6bc-4b47-aa64-08df3a643651
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE940.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7862

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
---
 drivers/dma/tegra210-adma.c | 49 +++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 293a1119e07a..2d9dd41141cd 100644
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
@@ -1035,10 +1044,36 @@ static const struct tegra_adma_chip_data tegra264_chip_data = {
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
-- 
2.43.0

