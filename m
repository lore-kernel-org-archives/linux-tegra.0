Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790624;
	b=obFux4YukzGK+Qg8WCrVDMI5jbNTZol7mJl+SlQoSgUjQcN9bPSydgqTyA3jEMp1+Hw1
	 NsaY/GpA5+kIrxFFd3fhn8lH5a2AVnTdolBM9Jv4aNtrlczARajX60BrfcTEV5F/3UrZn
	 D71hspNbAd9DS0U9+ZYbSibrnhzPMZCuL8Ri+T78FE+0FA3D1sopXI33XTIPqJvFxGTkG
	 vdmpSOZkd3kpJy4McBMVBtkrvkywyb6Wf9qJqbBlB1l+4Ae7almMXjb03abZuZ3hL6Mj+
	 tpBtsn+f+nTGQuB3Y05SCpIbzVdcnqXV33tYHzlxuRZC4qGDEGggRVoDXnenTpSjirA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790624;
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
	bh=MU6o1qg08IXkz9CRv61UvB4t27knTE5k1VivPe3sQhs=;
	b=Yq4E0UDAqjEtTH7M5ldF3iJIElpL1zGG2HmSO8blOaRXNa8EVm9j+rIHT3APca43jaZx
	 veC3PgQHQiDuDo/DK860IH5c6gpMJiUU6SvwQsiTTtjX4V/fcRxh/JNfnQS0zkmq/8CsQ
	 vgrH7xLVgnwLt+EF0mSwvI4/FD6uYNxkn2xn404nDODGyqMG2pr+zc4hDwdOWP6KFq14Z
	 NXAPIvT8qd7pTQF0CaPxRAYx98DiNHuGmXDSZHLmWkeL2lNW8vL+IuBb+s/8k9Pk8zQhG
	 YC/tgMntyL/nviZkrHn86s45nQ9cYpNU67vfNKrz+zaxkU/DysAvLVtOxIYo0Y8w6/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QXGpE9dz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.55
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0932F606D81C;
	Wed,  4 Nov 2026 11:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0932F606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QXGpE9dz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFxfBRZr/77QyE1x5ND5vBk2LHGYcw0CKUWZDxoYw1dNooqCD9GC5n+wRTSfxR+tDoMULnbQipPkafvN/tO9sV/aDSPw8bCoctxshYUE8+QgL6HYD+oGIQiNWwE31IX8JJQetZGyWY9ZAih3TFcfJYKNf9ExTq19sW7upXfufQ+f9mi7V8QLg1xNfCfYC026/7E4pcm3nU7PQVqj9XA6DlytMFb5NcBKnjDU3/5Im6zXSCWztnp2+Kpx/e5rvxwgc+V8OJcIuFiBEjINvkmKk/oWQgcxiIlreANqxfmOi3K5dWmJ46PaicEoyZojFN01ZcXBp/6OmP0u2GWHXyLuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MU6o1qg08IXkz9CRv61UvB4t27knTE5k1VivPe3sQhs=;
 b=yD3azij/nuB6Hw7NetVOQp/eyarlofff77Xca9B0AkXeEjMpOuLWEZK44/EmHvoucgFgbhYC3YE7V4beETdvY7rTpIKgOqmOHuZ0RWm9Dop6EqO1mRUh2QXUZloMIhG9gqPogxIjvdAIHS9vebs2BnYw8YoEDfpUakaZJLeqAw4Dbz9JN5tjiZWfm6cU9rGa2eCVHMUHueYCGj86okEz5Ahlt2ei8smCf+MAfzGBehTZFuGhia0/j6B1Zcj3F5ZUcy/SHUNEq006jsEKuuPW5Of2JiOKkVgaXmIcCA30UabiDAE6zAYRb6EhWYl3W4MzcrHRXHm4Dpuattce8W2/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MU6o1qg08IXkz9CRv61UvB4t27knTE5k1VivPe3sQhs=;
 b=QXGpE9dztw6ybDqLi4A6jQBYXNJlAC4Rzaq8LTEb0YDZ+iseFchhUiI6Je33bMPn1+qJXcEZIiuzK5GEGWyYjaGS+e1HeSyEfam2f9FRWhR7PIIvBaXMmvdtc6MDzBJPELLKNyV2u+nR3nyHHNFcZzFZnABvD6IIKufoTATG/4YX/iS6a6kG4m8oW6mEnGJvUxToYXNb6VMyVE+FLDwbcAHznsHJgIP6XgeskwULPV+2KMWCItujzj1UjCNTl2zO5f9UrRc7wSyb8VUhtib8rbnPgm29dy7Dze9Fn3bPBbESEkirnxsHHKbcHpsdt3a/oIhz2pf8X0fASii4MdNv4A==
Received: from CY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:930:1e::28)
 by DM6PR12MB4433.namprd12.prod.outlook.com (2603:10b6:5:2a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:10:19 +0000
Received: from PH3PEPF0005961B.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::69) by CY5PR04CA0025.outlook.office365.com
 (2603:10b6:930:1e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:10:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH3PEPF0005961B.mail.protection.outlook.com (10.167.243.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:10:19 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:03 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:10:02 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:10:02 -0800
From: Sheetal <sheetal@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Frank Li <Frank.Li@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar
	<spujar@nvidia.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 2/3] dmaengine: tegra210-adma: Make Tegra264 FIFO size explicit
Date: Wed, 4 Nov 2026 11:09:31 +0000
Message-ID: <20261104110932.1097294-3-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961B:EE_|DM6PR12MB4433:EE_
X-MS-Office365-Filtering-Correlation-Id: 06388c55-6a2d-4a9b-34e2-08df3a643659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	tc3SfXyJgOhs1hFgBByir6ymButAbJJK02CeilnElvKiyQWXzjqmKpOHDq0lq/eH5WvpRR69nj3jT9Lkcitp1Db1QzAIS0hB65KbdGetazt4uPOl/fem/kTNxz5ku/zQiBTNGJWCKz5XUe3zySrDGpXwIQMHmYxuSqC9PoNzwmmDZwXAy9mI4OrPkfHczN+EYOWjizUECd1Sjh1pnTVhK+4ix5vRuHaH32531+iRDQ1ebp/TbUTBKAfGuAtZ0KjRXCsb3QSzH2Xz4h7VmBCSWuXOyo6C/V5AMGvSODrRDTEU5t8kjxN5rsaBTi2ZcGULXKRbfm/E93YmKO7XvQYModmqj/MFD9F5stuMLh5N0AY0DJdmyGERxwVH6YebuZg1S10gIQFi1f4ojk35ncaVhdZxkjFc61sWMBezjkJQgRey3SGS06pUB37fIFDl/YIv06OztT99m7kKdUbsRceUH1vOfQMMNcMc7P4qjw83szbQ9dcqgWPiO9qNHMiJGZDko8C0BrmrC5BdQ+CdDr74+Iq+L6G6GFT80sYeAT+6rbG2dFJc0RHxqmYrfJqQyXmp1acDsQT9BsHf0Cc5fH4kkak1VIV41FXc8T9D6KM4X+ztBHxaG+1pf2rB5NRH+8uJErP6gNYYlrzhNk00UGheOv4eBrbOcDIYtyhJOrPqWR6qsvtKxz3qwLBb/skIfy1UJRvSG8TImHLAVIB81M/s6A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lTqg1emMTSE5vdJPKuOjd8WAVh2jdGeVr5ptURyFFIU0zlKdV0IrUR3axHX3Ibg6naql/Z+eMewlmxuUX9uY/NxjASl0L43cgyXO2ChiYoV8/ge8dgP0IAVS7BXzmsTXNLwbJ+nRPwNcMvUqTzTXbXhvZZXrZ0KkK45EIBnFprNxOeRw81NhZLiv39nyKXErZhPq+5u0SO9dqw8fzRjyzvetUSn+zaCxBfhlYCsTmf0pdhvPz2fbr4qMf5m2kwpIYtPHN/zzu/C9+ad0gxC6PLh88L28UTCAaZyrRIo2AeRqY4T31Z4TzQGWS0a4DHU2wKO8Cr9gAd2oH7/oqJOj/cbRpkx9HqRETDSIF6lDQtfbxJrJumfs+TCXZOilBbIQ6RL/ctexw/sCcAUREqZUKLk5CClusJqP55HcpPCc0JUVV/KZWI7IAbCbdmHz/PeB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:10:19.1870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06388c55-6a2d-4a9b-34e2-08df3a643659
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4433

Tegra264 uses the same ADMA FIFO size for every ADMAIF request. The
driver currently obtains this by setting sreq_index_offset to zero,
which makes every valid request select a FIFO size of 2.

Add a SoC data field for the uniform FIFO size and set it to 2 for
Tegra264. Retain the request-index-based FIFO selection for earlier
SoCs. This preserves existing FIFO programming and allows devices
with a different uniform FIFO size to specify it in their SoC data.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 drivers/dma/tegra210-adma.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 21a381d022cf..293a1119e07a 100644
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
 
@@ -1018,7 +1030,7 @@ static const struct tegra_adma_chip_data tegra264_chip_data = {
 	.ch_reg_size		= 0x100,
 	.nr_channels		= 64,
 	.ch_fifo_size_mask	= 0x7f,
-	.sreq_index_offset	= 0,
+	.ch_fifo_size		= 2,
 	.max_page		= 10,
 	.set_global_pg_config	= tegra264_adma_global_page_config,
 };
-- 
2.43.0

