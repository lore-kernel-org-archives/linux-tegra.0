Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641845;
	b=DfI70HBCZ/HP7zoN2rNTZVs6yVRV157ASUo6X4fE3v7K49BS/CpLgfWLd7ti9joNZ7Vr
	 SL7EGUykqjyTWEE7MTx+pwAeZf+cPzHLKMekpk6lB148SPVt3Xd3Osgo09BOOmII1xwi5
	 fP371/3ymQNOKnBK9lwwLZyjenEUT6e+ZItfhUGMDBg5/6fUElt6Rt1R2dpI1UBBNd2sI
	 wPmLp491Zxhd5bNS42wwXED8rEiE4EVjiQ4XDV7zi7MsgNDmnVILUeftMGdIqhKGMqpVx
	 T1Ta0rS/o+AEl2q8il7A7Saq+mG5fzTAsRY4VBTb57XbGXElvy6DPBLn3cBWBLpN32Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641845;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=w6DqD+7S4w2N93TbZ0eFAw5qJOUPfLrfJDXy8sDxQMc=;
	b=z55qYyJM+Ocm27mIantpp3YwJg/NYPXISKdPCfux2ECWdkpv9S8p7TX4bovJ1dEssprS
	 +7ru2w3TMrk37TXW6T5atESbhvzCDScn4H8fFnDA4RJi/FXEOUosejACkA7AOexp5f0aP
	 bCamwtpKHzgx8FPLQctH1n2zx3OD9Q1tqqK6PwbGjwe6QAB4fDGet3IE1btV4MOpl8E7Q
	 fPESnuXoyMZZF016fzBmXVRHEeRbKh+vEHckM3fYCwdB0LFL6/HVcloxV4DtbUTHt1UFN
	 nMDc5fGfPmICn+aGhekpMEIFLwuYToD0+pnd8jGzMWdlfnoAO0Z2D3WnjKF7UBwy0/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=t5nwlo06;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6073606A337;
	Mon,  2 Nov 2026 17:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6073606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=t5nwlo06
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=In3xMZkfG1IUXVbcM1/ZGkVyui8Bo7WMFhCbTis2yM9JIPbSCAjWV8P5OWntMZ50QvkSKOhbvNq/t3s9PH2ezx3dZ4GoU/CQNBPBVZ9FbK+uMODk9lKG7+gHV1fPLdbeXSDSqCpXJ3ztcNV+rP/ffH7t35RinB53vEskT59XWCKNBui0KvDR6c370hMJyeM5723DRjlp87bCpFyXFmpucsSe2KI5Ft9n2ObQQqQL2M5SyZAi/8+8gqUANB6RexCFJtGe1FrlQd6Z1sGVp9NAFjxN3+K7OCn/3jsT5mbGVptWmdFBQmeLLW5R4T0Uow0Pglcehj2GD1phbtG9WgLi/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6DqD+7S4w2N93TbZ0eFAw5qJOUPfLrfJDXy8sDxQMc=;
 b=Lq3+C6qZ1u1HJC8cIhmJKJ4rAkvXyLDiyd/3OSh8SzZkfw1DEumUPzXCxpIo3sGVi8GYY3buI9eHQZw0UaFqJHHOGpwsA5HMYUUgoScHAwF03jRSY+6PNzlFCKf4IlOalO8gs38sn32r1Ir0n/VfHqLFkS84+e9S+iNic0zbKKcsZmzBsbhetAmdv3AYVEYAGWSc2+wgA6qG5nl3qlxxIKP+YHVV3u45gvKEl3gvCyfjMZ+8DPr10OWUcBHuevWdzxi6AZbgLZ9OMc8rdEJAFZjmsAjWwnvpkCpE+WfMc5fXTw6AYUd2NbhyXQzwqcKyUNR4gCyIy0soDkIIrTtZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6DqD+7S4w2N93TbZ0eFAw5qJOUPfLrfJDXy8sDxQMc=;
 b=t5nwlo06pojJFzdWoMhe5f1t1e1dJCxO+mDGJ+7SmfoJ1cCZ6k9LYCQGMplw8j63dUaDMsSBaICjkMgMAKbeX9/w0k27hKFC+5sO3BcR49FAadSnma9ZnsGmJz8mdFYqmzB+3PtySEsT0RmUOJU//lxpnwNJKJGVseXkSM89PwDyGSkFrtRY3DciwUXv2XcpgmWcUj0fRoX+MxfuHXohZ+7l22QNiKjeI/VCzW/IKTySqc77oLZiG/W7HFalKYSXwbhlHy25u4/zQrVDkhtn6n9o41xNn9vdMJX6Dbt7WrkwL98TGtQ1iIW6NyG7J8IWBs6uE0TcPY+Am9RZrz7jSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA2PR04MB10237.eurprd04.prod.outlook.com (2603:10a6:102:401::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:50:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:50:40 +0000
From: Frank.Li@oss.nxp.com
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] soc: tegra: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 12:50:30 -0500
Message-ID: <20261102175034.3944745-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA2PR04MB10237:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e89203c-10d8-49be-72db-08df3909cf59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|10067099003|18002099003|261102123227099003|56012099006|11063799006|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	wOYcsdM4JFTAZV6+8y4Cqs8dKFIJZjyF0fgLjPQZGuEMmIeFCXvRIY/BJJOgRkbZy7NCHDW3EpEpgk9sQVsJup7eD+luZ0LkryY6sMGrZSpMwIXvFnAbZ7dn7dXHyE1HVcruMCYkunxm4mDjpBNH2w4hwnr2OrdZDPdxQnPJs1ZJ9QTNVPvdStkK9eXROErsS/nuLAit2mPnwx0E9iZJ1P3G1N6Rh+fDGNQMp0UN8sippONOfYj3DNDCx/AS+ZEQ2TiDX5vuSqLDrUeNkckdnJ3EUTkHJ6XLj1Iv1xrmXQGQq6id17si3YVhs4r998ixV4NLpWvgLH4tj3dCJvq1amovhe+tQMMpWvlGg9iv0LkBVcR3ae094Ts0x8C9QnnfllmW+G4LsaMa8BTNE4bFuFk/hXm6FS9qO0AUiqz+Y5EVxYevFyiqahIL+Xu16pxnAFK5jGJInLxlbFHgbix9cigKEAK7UZa/FPLyMeV73C5ipfkNrSgX/6/0ZFcm+y38jz8ZozH8PtK3UY/KgTu1SqDb7Q3FaoahKLCvIVBjzXYjhTZYu+sR0p0roPEWcQNcMG4i/b78lyNnoBqH5tVRVFkgFi4uhLKm6tr/mfEUzmXxoXV8X3OgVwj38QD9mhyUR3bojgd4+vQAzIbIXsqKP1B7YC59raNzPpj+MS5p8QE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(261102123227099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q+eZ0hrf5wyNfZDWiXrzi75WFU8aTZK9PVNZQFh5sjOmQLFMAmUiIXnaCwPI?=
 =?us-ascii?Q?+0MdU9FIyjeDzygfKqoXSGoI8XaN4OpZD1WG3zBOL47wJuStfpqadL/tAuSF?=
 =?us-ascii?Q?Qm90eDEbE8cEhijXb8bJTPKasV9bE0ph4pgC+TKFWG0GeOcbV1/yDz/38Lyu?=
 =?us-ascii?Q?EzuyT9SeX9Kevv4gMS53d1cMsnLjljUrgvVZui/I4xFpywuEpI3oit5j/4hG?=
 =?us-ascii?Q?OPwBAtpa0wr9TjJk9qcsdhcEU55AQAOZbvzcYLMTFnoxVh1NqdTVO1dMUkAK?=
 =?us-ascii?Q?nTYSBY96J1QHRL3iGyGmL85ioKGlGvdK+Pkgd/lKCBX2fOCl3eV2zql4ljCA?=
 =?us-ascii?Q?HxrAADQFZFzb379arJBfvUEfLuI1cfAuVjb9sG4iE4EfjJkcGUR/0769TX4v?=
 =?us-ascii?Q?bVVoy4OiMSeMqs5K1E2EK4H8XU6FjZE6QmvJvhhk8B32eOCvuZHUGX56Lm6+?=
 =?us-ascii?Q?5gZ3iN7AOAjbm8y/gDe/2euv4bups7jBBSWqBN9suQMmdvUo7iY+38m2aS5h?=
 =?us-ascii?Q?cGAy2m4H7c/7TF1nME1KREKfmj8R8/k7CuA4ydzG3rkt6z1fLMRrYaDQBTlQ?=
 =?us-ascii?Q?hr9c29TzbXOer8P0rRlxokJY+AKMksGMscuX9SwVjdTTA6ykM9wNijz+dF88?=
 =?us-ascii?Q?0fWlkRyTEbO7gQvQomku8rXSKgOa0EGksUQ9IAWvX1lhSoIgak94yOg+OxKB?=
 =?us-ascii?Q?wgo0qAmSMg1XW4z58yIxZC3R/3NkEaKpDOpgdKXW4j/7V4kyl/hIS31mumbT?=
 =?us-ascii?Q?UJRETJxUEMsKOGWkEo+TPHcqTHfP+7O7vK53sVbjr1+ckWiANEp8WD/BRY0f?=
 =?us-ascii?Q?RFjJ7TP3hvP8zP7trK1muGsVmvS+YnHEYdxxmhJRxvXGKCM5uGRvx1GXMeqE?=
 =?us-ascii?Q?9eFedGy1xlOldBKUKN2ZqgqB0UCtYv668xr2X9DmatpXvR1JRFOXIRn+7APw?=
 =?us-ascii?Q?wnyWnO9DNAQr/f1lkxZANdhVYXSEcO8XY4j5EMSQABqxmhrVcU5hZIQmCd46?=
 =?us-ascii?Q?3OoeFbTLvjRrd+YyOclO6t/ntTHCEdY9w8Lr77Bj6J/TUduon5nuRiSm93V8?=
 =?us-ascii?Q?gOPNKLvKlwIaONAytVyNXw+p8KFs8o8e/tsm22ze5xjs+p22XhNR6GeTDKl5?=
 =?us-ascii?Q?wl296X8YWnFOhkrbxvOoNznmf1X4wfM5KoPXDNY5o7G504ca/pUKWIblDRj4?=
 =?us-ascii?Q?66B6a6RTZZ7TCKoiJLwMcZt1XWGB0aoBTwzfAPIbvjFjxcJGluX6KG0+qLky?=
 =?us-ascii?Q?gvCwN3qEIEmVN2cXRG/DR1kx2+sr9VZzZvLX2zNo5GPd2ATV347yDUwvuH3t?=
 =?us-ascii?Q?gryEFpehNmIniDXQobLYe2JmWlCM0UdYzq7uuoIi6TmOx1caIGvIeGCheYtN?=
 =?us-ascii?Q?zfAe6GOjei6UIc5CeNtvm9P0EQ8RGCU1sFq4KsXtt7ZaftcBAgVtfnccGSmp?=
 =?us-ascii?Q?3ITSBV3Z6bAU03IkbudMQtyS4UQ5+SLBX2vwUCLGirQqfPxO6kSUJhWCnMrt?=
 =?us-ascii?Q?yK0d+6pTGoU6XxQXz4tihFufZWu+69CsaHpaR2+CQf7MnUkb0VR5JH/kfaFK?=
 =?us-ascii?Q?BYKTPnvT7aQoV6veHkhhaEMgN5b/q8zOGcsJJKhab8/8Z/zr5ilM8FlUAjT3?=
 =?us-ascii?Q?ePoAaEMdlWtECBKOxr9n5KqqxNmO1laYp0apw5Ogi4Mw9BgKucrzlZJoG6SO?=
 =?us-ascii?Q?c/8nlWAz0VYWRiF5P6q9EyjzSJiBMhhdCDP2uB4t4lN2Z0Z3TK8ZCcm+3BEH?=
 =?us-ascii?Q?uLo31hpM9a+QsMcTlggdWlUSo5jM+w3LXrfUXs6FiA8zLHB7/3dN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e89203c-10d8-49be-72db-08df3909cf59
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:50:40.6772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVzzznI19qEg5gd8ohxqen0A6DsAUZjy1tWeXEAVUYKjHxTq3Rksz5fvo8x3CdAzLc9DyZ0r1zv+3Dg9P82Oc1CwSZEt8rFlsiWg3jZbGkiloBu47flXvXe1m1OWzmcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10237

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with a call to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/soc/tegra/fuse/fuse-tegra20.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index fdecf7b7c2466..b98696f551ea8 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -66,8 +66,7 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	if (!dma_desc)
 		goto out;
 
-	dma_desc->callback = apb_dma_complete;
-	dma_desc->callback_param = fuse;
+	dmaengine_desc_set_callback(dma_desc, apb_dma_complete, NULL, fuse);
 
 	reinit_completion(&fuse->apbdma.wait);
 
-- 
2.43.0

