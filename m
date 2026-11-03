Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793743032;
	b=YWLNZ9xEIE2kTSZa67I5Civffjtzds+S+VQoS+Bfh0i88ttTLZLaw2ePhDTlUqF2k9IO
	 aKZqZE/E+oy4456D0e3bD5LUqBVzNXTefsiwDamYYfqAVqOY9r3GhJo4E4a4B31IgKZkc
	 z2Q+xn0KP1YybUx5AUAkj1Uo2W8Tlv4PFu9YZC2BcEhd7Qv10ByZP/DsBDTOtpFIKuXuJ
	 fUICK2JhFi788LbxTagN5TqovrP1/YW0lFSsWOVTIWczI0iMradkN2dCzrZdPUL4CodZF
	 z0vW7+06MZT+r7Ll7VpROLOHruwHrhOcsnamnsPAb1wqQgXZlPQ05zFHPkLDgM5lYgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743032;
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
	bh=uAdqswjusKvrvf48Gfu8PbdPaG6CCT0ACaEEUYCsu7g=;
	b=PG0RJKpilsxLwBIbSZ8US8vpPVFGkiDFnGL9sKaTmgR/chb39Onjvg18Bfg6W8m2erPr
	 gBbjiP0BZWCTxS2laGP2mRHcZAq95fo/dZg4e4SUkkMq9GhE8i4O0smpAxuhkyPT+d2HZ
	 cRzT1K3P1LMt5oVs1/V2/a+UgoLvtVnIbvv45NlcaWgeWKyjeJLLPFY65YgYNq43xL62/
	 w+uFjLt47CeW5UOTC9qJ0rnl7CpwZ9NaQ/ZRaqIIIA80bjFQP6R1ltzJm7cIxHSwFgiQQ
	 gBLSZIyFifIa8tGDM7Xrkiyb3RpBIlEEtEjUlqIJezcgtI6ZYwKjc9iz5q6yOI/uE9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PLhyp4Ch;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15D606A339;
	Tue,  3 Nov 2026 21:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F15D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PLhyp4Ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/OzwrQUBCcOQYAV6lbgMZV/4x9Fg2jFa6YwviwCmRwASdvV5kNbGjJcRyzRhkfWXGZ/bYz9VRkNrSGrIaVTbCow6h9tSPjBMsK8TWfg8h1+0ppC3Yfww6sxMgwHGGruKOvJYFCOu8r+NwfOJrw/K/s52+FNw4hpJp/JgYyssIeeoAIhmOQ68g+yQlv7utnvXvLA+cFZDWOXEYVABVbA1m0TFHhVcFPY2z36gOyhe/1Oan+8i4q7X7HyVIWCCu9rOgy5K1MgQ1j/lerdb+7dLyJJ2/H0b+2qp3X6eW1vXwFj5KCIycw/p9FbRK+SxleEMmY25my+xX+dqdacs9IqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAdqswjusKvrvf48Gfu8PbdPaG6CCT0ACaEEUYCsu7g=;
 b=FhUqIW50bR6LWoXWvvMOW08IzJIjkGBGPy1xWZVMt6rxVQ6JFPGyq+WY5gSDwuiIT7N7H0X5zJjZsamjf8A8NKVHPFChh0vLHLvAS2i/eDAtBXod72KehjcaqTR3h+KVXhLzpSOQDhssv7j7k8+ejaZ53DlLSjAV+kYrEJPTfESJ4dIY/uH7xJjBb5VUS7Lo/3DF3HWeE013LkaFEdkLvRooRHP08QFGtzJuUIj4KCNELh6Na/J5MXvwkAJFz7WH9qlNoC3kDaw2sadjWNwqUwtBHKTAayz8kArKadWaDc+8vmG6V4rNcb1L7Gj7vP0Z/LGK5/8bzHOmXCfpVMo1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAdqswjusKvrvf48Gfu8PbdPaG6CCT0ACaEEUYCsu7g=;
 b=PLhyp4ChWmutcu8kzd08Y0kP+Mzg3uNSTlGgJ6OxKPceZwqlH0T5oWY7b6N4stNpkkx0vfeXsMK6xfHd2GaOwce3iDWrSsuSDYhBQA58kgBOtpp1VkcHYtLebJdikjH5T75QKSqRI2MVHxwCLUxNxBLK8oeHKZEsHiTP0vb92ZOUO/kaifVYYvnIqdskRHUk32Dk4lbmgzGCLdFT9KHTazKz43njn3M0ua+bC7jWKTEgTNeaMjnMKi8Z8L44tM754TYDXMtsyRqeNjC7wUrj786wmdjmROumZYqJ1s/bQmdwcfvSI7o/AKMoEIov7987wQe+v94KZ4UWcpSvXf+yvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10600.eurprd04.prod.outlook.com (2603:10a6:10:588::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:57:08 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 21:57:08 +0000
From: Frank.Li@oss.nxp.com
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] soc: fuse-tegra20: replace chan->device->dev with dmaengine_get_provider_device()
Date: Tue,  3 Nov 2026 16:56:57 -0500
Message-ID: <20261103215701.1818638-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10600:EE_
X-MS-Office365-Filtering-Correlation-Id: 76529e14-a22d-4733-3236-08df39f567f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261021123027099003|261026140227099003|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1D6Iv/1O2y8sKirdEzHr7a6B36EKGxwfLRS5RT90Cv7XDR4lRKxo/4lfzxkaXr2joEa4zBedvjn9fRjqA2kUi3XcQq7CwWA7XyUnRkSJgDHRSeQfi26jETuPE/ogCnPV2KqlD7HVvinypyeaHAVd98BMaD0bGBSxiEcKwODhQRAOgsyDS+Eo6QgCYHHlD/JsxnKvycXL7nBRd8GuFrS6C8kR9j4JyKIwUJTozecLvcsniCO3Hj8QoEXEIeDVteYltAtWOvJWY3IODi9HdGzOR782lD4YrfvMPoAktwADkiLLzMtPL+wD3zPqVo12UqwuhCTCLdD3tXfOl21abn9OaN9GfpXodD3P+3714qdJ5p7lKxGhY3ti3kwnRAuQNtBnkkOocukSl7XESfuU4jssXiDF+huxP8zfOOA8UJEBMG1BCVD5jBzAH3pAB9L6p7PmngtW7rLXBbI4ERQr3STOwCptMtUYwwgblId5gqFxk0YYLkwH//9s3EC23zhP5J/vCvJJIKbybewULTFTVoMheVGwYIK2yDwITlHvfbmt9I9QkxtWOBLxYDhA7C6C4zlXqaveN8QSuUg6XeADPxwVELk94IbjE1QTlquc4c82NCCKkEDAsti3XYrNvK56DVzRJzUlWvERO2Z5sQln8yrpc8XV2eZkdVMmQBIYOsuf9N0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261021123027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PsxUGKdamJPktf9X7aEhvwcpnqFMhQvEVWlSsPwr9nQKhFUseryLc5G3vb7/?=
 =?us-ascii?Q?IYgcgTefMEy5X0YjVAQ6kEnzAM6Atdx6zVfFsMLcoQKH5Qb0L20ngn8ypRAi?=
 =?us-ascii?Q?PF3vAYbQ68Ea5338hd2Oe9Ad96/24PEPWpshU1AUgauXMTwTcCROUoKA6q6u?=
 =?us-ascii?Q?zSmpDEoV6ksU8J781S8XwnZUqJoWONW8d4rJ4TGlfIGV2FoMiuv+iGSVj7+T?=
 =?us-ascii?Q?FkxGzETdk3ybKYKWmMkYmtUfovubR+CVmIsX1n4D1veYxS1Du5Fc938eAoGB?=
 =?us-ascii?Q?n9pIqm0DTJXUAfRBougwpjZozeQ8I04PBzers67nTj58TNaddLua6uxokGd3?=
 =?us-ascii?Q?LL6tQaM4DMjFbWUw9aaxw4/nXentzC3qdzIssCcNB1XhYDg9NJNiJi6SKueH?=
 =?us-ascii?Q?r605hpdA2njpsXGelOgmB+k3/7PtsbNaKyZ/Svumv6ttQCKqzz0NPZwS1S3L?=
 =?us-ascii?Q?LCgjdlo1jTC1tLN58iWSFHTycGZYxTiL4OJdsD2sQ4GAPJCeUI3zt/n5Nn0k?=
 =?us-ascii?Q?jkwuNay5KePfujsDXP9eod9k2oK905AlZ4WbhEv/q/8r1fOGhqWVHihzqTdg?=
 =?us-ascii?Q?7mErLow+DkAQ+/fM9TyDjzfIuEq9uvC3dPBsbos5cY4dFetJp/X1KY00vP/B?=
 =?us-ascii?Q?e1UebMFb4TxWpYjT0S5QBDTElNultrQsxKjxpK4QUr59CnTWmAS18G0UMdH2?=
 =?us-ascii?Q?WFB4YE4Wda4Fwq2UHTkK3BwwKAhOnw9l6qHhL60DuEctPhIRKIfhSeoTVPff?=
 =?us-ascii?Q?edgJqrGO2VwGXluCSZ+IzHh29lgs0Th2RtbR9cHgVlkNZ6MG9QdWHmcQiZj8?=
 =?us-ascii?Q?oFVIHfcOwAVrtBz8phurYvWzkExsUl52yKomUXPzvNRVlWw6/U3Z0FaKX0OZ?=
 =?us-ascii?Q?1Lbd29I9ZZJof6e9QchtDyGIJgREKrOk/8tO6mvz8jKzpJwNIxvM5vj1Jg+m?=
 =?us-ascii?Q?quh2GoZQdubZ0aGi8a68iESA+A39hZEAJwg0uWvsQEhRL73GtgKmi7wb6rrp?=
 =?us-ascii?Q?gNy2QRdl6cWSzQxMMT9X6m/D7Z0yml0Sh92yR4xNbFShZYVHuLcpS8s7yKbe?=
 =?us-ascii?Q?6s0RJEClzYPJWfTzot4V1snSh5wrdqJiOg3rGpVFxB0mhw6C7vPuojYK+Psu?=
 =?us-ascii?Q?3nThT5+xYSlKhJZNDYFJVigtrzdJkKnQtz+OBWurFXTluVZjzAkaQrmf05g3?=
 =?us-ascii?Q?0+wU0xHWG30qeRz+UbqDmbqLCCNrJJvih1Zkec1/pry965yffWAxxL9zbJRs?=
 =?us-ascii?Q?+pq8Es8r60/JHAXOFUKA2IXBv/jtz2Z6Hl5xgqJ6SZBqc502Xv8uN+WBgInE?=
 =?us-ascii?Q?mJA9k2IBQ12rTYqFM6FwW8GJX9ARhvuQj3CfLk5eE4SB14O2oKaOuZaIqFIn?=
 =?us-ascii?Q?wd+BmetCLd6KXWFDZsFp2C2JXsR6zzcLaHqtfJqKSmkOqtI8XBpgee5nriuq?=
 =?us-ascii?Q?NKYhDd7uJfW3hO3xaTy5e9KIfydSVmF6ljhhvca/nDQC3izlvd4z/thW22zr?=
 =?us-ascii?Q?plKcmlxr0H3mBNR6QJ6Y4Do/g/zcyIe8s8XPgG5INNCjXl6uy+mbPvfaxyGM?=
 =?us-ascii?Q?WiYLDMnYOe+KLRGyRHbSy/uGVp6rRhXZHbk9/cq+SYTCmOyeNhq+f13O9DX6?=
 =?us-ascii?Q?hguFK3op3fgJBd3JVmb8HxDBqhm9vm8DOtK5kxAYi/tAp18SMs6aQlSq2CAb?=
 =?us-ascii?Q?gj7SmiMvLrzLFaKGaofSRKQEc762eJl29hmhXAmzZtwHlzbAX8AlDpGZb7mv?=
 =?us-ascii?Q?F4FX9YEeto7gBzb4UNaKqffRA1mUf2OcRGPZFBYXfENXh6g/lHoJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76529e14-a22d-4733-3236-08df39f567f2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:57:08.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGYbtYetfg4P/x5o8Aq9tM2uc72q5K0s2FOAuhXZJPNRnXHNHD12Wu0MlToSazMtMtJ3/sDiZaKZmO/nc9P8ANa/4JxZNeJ2+yJ3iXuohQi4HrTm2gENv/QDXwPh0nN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10600

From: Frank Li <Frank.Li@nxp.com>

Use the dmaengine_get_provider_device() API instead of directly
accessing chan->device->dev to get the DMA provider device.

No functional change. Prepare make to struct dma_device private to the DMA
engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/soc/tegra/fuse/fuse-tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index fdecf7b7c2466..8ff5d7abfc65d 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -89,7 +89,7 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 
 static bool dma_filter(struct dma_chan *chan, void *filter_param)
 {
-	struct device_node *np = chan->device->dev->of_node;
+	struct device_node *np = dmaengine_get_provider_device(chan)->of_node;
 
 	return of_device_is_compatible(np, "nvidia,tegra20-apbdma");
 }
-- 
2.43.0

