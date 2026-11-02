Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793638825;
	b=JvDhbKu3ivSWYTvSPPQk08hpj68gZ2kwPnKJBHgsXvR+eFe1GVN2z7I/NQ3JVLndgy5d
	 GsUOsJeA82nxk2piJ86Arkbos+GDWaVJQF+2SWg5fM+0vcmbrmxijt7cQ1CaHm4kEqL3d
	 YQ87tXp2+1NoweRchbrT1HcCXJKBLKjKmtOWBGHl2NGt9hO3iK5Ce0KxV+C8LAb7O/Sz8
	 GJTk+QLt0qTzN4+Rg7yMtukOZHjHGNVMuSJuk2uelPtg0nPOx1CVUnlqa/EpKfHSN7T3d
	 CSzQrjuA1GEoUNe93asSDmuSOQWLhnIBZSSBPoBsz/+03g3jrMvl8gip6g4IVx7bq5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638825;
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
	bh=kVwIHwA406kKQ947zRxBHc+OCVZiHNJUibE8sHjhjS4=;
	b=V6qnMliq8hNZPPJoGWr5rNaBVcrJH9qTQSnzC3DNXP4pLLDULWm1j4DLS8QC+UZwgLSl
	 sdC8NSKYtPAsOacwz6s2bBw1bqnDvWIy/E2Ej81JiXl40WlZJ2mdFe1Q+K68x4myRzf4f
	 CBcpdBxAEkwV5DQ9OzfUQVfqEBc9v8zJ4C+XQGy2Qu9/OtmqO+maqfgCuOhoC3ZSfrgyW
	 bDibxfQ0kOu21CjzfqiSvFFCGBYLqh783VCOd0bSCd2RJYhZzEXZ5EkvpSzw0pBF17ovX
	 vJSSMOKRtCIfS2Mj5IXGVW3rRo0T3AvE60eLjspKCvTK+cse9YxChJMDwIVc2doZL4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uJZnSq+L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.3
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5531260AC6D9;
	Mon,  2 Nov 2026 17:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5531260AC6D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uJZnSq+L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=en/wbwJuDoLK18Cq//mhi/ZFEbS/CIF7iZvjvh4Ai5iJc7WYiNeEJTR24AcNKrRbqDKzqgssxQHB1+AJao0QH3BOLTXOYDVDuLPuHACZizPlAdyP58GbZkYIcP07T+bjT70jCtmri/X7Okd6xgttM7hNG6XMDx4WLnHX1rna4h43BZIfrs+D6iptUUw+m/R1oVKZtLqqQdZZU/zTyWrC7adO3STvb66MLOm9PTkVpSeswS2FyWdAxTUPexHwC9+BOBMKOj7dQyL4riKUNmlM5VZdGYCwC8h7LxyF5DXqHBCjxE2co9KnnyCvnAfgmyRYElwC+UwwaoKYpeyM2v2GRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVwIHwA406kKQ947zRxBHc+OCVZiHNJUibE8sHjhjS4=;
 b=J27hn4QNh0MzKtLfrs0jAFW6jmYl/pDGrp/0OS74avDp2ZooshHMl9uHVYedacJWt8e3vyvJ+tYx5bZxnH5225Q/pRrb0U7CRRNljYyEgKeku7f3QOgXUiNubRRJeme60opZRMwjLtzFSJbcTzmv6WfbDNbRiwNdbCLrQ9MKCkDAgRQA5Sev0aO05S80tURE0NbqUXkeBmblBtDatG3nL7pe78El5m/16ci9aL5LCGg9KvEiJ4ZVlGoAYHXLG+Y+ZqxIj7Rs87Rp/reueNyOiV5LAMoWck9yUovlS88TUCIt2TtnsW+LRZyD/IRWLSDl3yFob0W3OOnbJ0XVVzrk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVwIHwA406kKQ947zRxBHc+OCVZiHNJUibE8sHjhjS4=;
 b=uJZnSq+Lb18y/D2QZqlTFCCGo6JN52f7Haznw2qlUQyOCuQMKkObsgP15Ffub3dtOC6HRHEGTWol4ZpMzGMBoq3za54dB4Py7/onBEmROG5BDXwavaPawNCMtFLz3REtwnub6RD+bOivTO6YPj8KKRZ37VBWjWXNsHBl1sB6SgXa45SvmRCyGf9JOZS58WYEAOYE8feU8o1gKZQyS5NxBKRFB2SILBF2dB036Ft/EeXl9kW6jYmhwBjK8QjD/KLlCcOVmYSz8GxrooIMSBFHsNt/a+kl1uYKkF9LV40aBBbqpDsIbjL8p9sBw8kCTmBhFvktnyxURMlzfMlxORs1LQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10592.eurprd04.prod.outlook.com (2603:10a6:800:266::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:00:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:00:19 +0000
From: Frank.Li@oss.nxp.com
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-i2c@vger.kernel.org (open list:MICROCHIP I2C DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	imx@lists.linux.dev (open list:FREESCALE IMX LPI2C DRIVER),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM I2C QCOM GENI DRIVER),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR I2C DRIVERS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 12:00:02 -0500
Message-ID: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: acd10412-0411-4884-a396-08df3902c665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|7416014|1800799024|10067099003|18002099003|261102123227099003|921020|56012099006|261009221227099003|11063799006|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261009221727099003|261009220027099003|261009223327099003|261028144727099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	19vhQFXycOF+lb0wZ5lBJvNC1BEhJxOAIY7s12eLhLobHdTDOH83d5YNQaPhAo4CY06IOJ0s6vKxsaH0V/KrsbOYKHm9Jnd6Ngt1ieNcmY/Z+BneVEVhq79Gn9PQLqX1vGBa62qdIipdL4yM22I6VqhnuGzAuu16qsYheQrBsAhqT2IYPOjemvY2yp/XdRdOkyUOqqIH87d0k3jB7DPypXQni6Jp1T2IfQS6TrbNsMPuBbxzgnljKWtqDYRGJbFphD+EO3PTJDHHXKT8Wosa1E25GsxOyGEARKoniJYMMNYbAtGdE4R9jRttkpbV3aZCwwM2VSMIONoHppGPAno/HJF8oClvGAgWeee29DPVL8LZ0tFnm05i+Q+mFdbpeHI7xF1lj3YA/zLn9z3EC/Y8TbhD+Smyp3w61ETisf40UQ/2yQUV3fZ0gjVfCQUks73+PeAfnpOoD8+DazOhTHGNDaaXGdP2CDqQTuQM5AM+hKOxer6Lst09tZgS+7OVh1Llldn5fwIJ+7C/qTwS2LnJycnE4Ie0hQNlPI+I/tBWZZp0sSvGLk4aLF6zTc8LJtMrlt3a3jvz85x9sybiJevJhs7yBoJ8xRWpxxfIbMjIcfjut+Q725ToBK38Y8gehYsfaeXwlQDB3sXBHpN/GClxCAN0WPSQwjjsrrq6n1kl4gDltN6Krk1Co36fW0EU3JkJ78Fv4D50ZTh0QtZafMke9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(7416014)(1800799024)(10067099003)(18002099003)(261102123227099003)(921020)(56012099006)(261009221227099003)(11063799006)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261009221727099003)(261009220027099003)(261009223327099003)(261028144727099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wx7Z8YZNSpskOPWYPc7blIs+mFHvRxqZ4RqAXSdrKYJS2epwfVLthHXEewYl?=
 =?us-ascii?Q?5bFdCG1nEGAWCthlfjabdcFAScfuqkcGov6sd8aB9u6SCUyM9YraofzZaosr?=
 =?us-ascii?Q?0yvYJLZ5aYbHJJviNmjsFiabz+v7jQUoIqCn3fTzLx3OVcA6AITe++XwPE32?=
 =?us-ascii?Q?HRRZndDTIaJKZKBt1+FtcB04Qq5D376Z772GUKP50kPbhfkw2tw9dqvfQqow?=
 =?us-ascii?Q?2X5tLRvNQYooIA7DD/uabY0CGvNHkCEly7fDOuE7n8XmYoWXW4sUIjBE8Igf?=
 =?us-ascii?Q?QDuaHX1zOxUqsKMISUX+fTn9R/nJRpUCEbWLFtk3P18kFt6ZlTGilLrXXAuv?=
 =?us-ascii?Q?hxnGOx/MJijGkFxEEXQRLulaHmizGFjxeB2PKHY8kAciU91bC85Ld3q1T1ks?=
 =?us-ascii?Q?VGXpWKEWFGOJUfBW60Xkpt/V8WgXnrPg5ggn40SSoK72oxuHINGulAdSxOCf?=
 =?us-ascii?Q?PZVAKlwDLiUHAoIr4aSni8hO8N4KjkSglkTT1OhbHvVNr9ZfOKZEgqM8FWt0?=
 =?us-ascii?Q?mUUWGSfd40h30OzIZ7DQYm6M53h4X3mowh3N+EZDXGN65udSAux1HZzfGKAY?=
 =?us-ascii?Q?cGcLjbFtazg9plZ8Wb5syO29aIrt9AfTzWNyQ6S4xrxhWtFF8DU993Y+dt8P?=
 =?us-ascii?Q?9rJSfknJV4xeuSsbsNG7flmxUC2V4Xasaq5uEq7uwUKWcYwYDFA2v5l2OBut?=
 =?us-ascii?Q?OvQ1kI7a0pitX3e6LXKGbbETWwaPYPwx9kmUvTg74VKR/9xyTFN4B6kzc0lC?=
 =?us-ascii?Q?lsk3EZ/guC0Y56NqwFycWbPMVbaJQQNI5ulDw98U3HG9+YEGG9THheHTP2WO?=
 =?us-ascii?Q?ZG6PeE6ka7PXIp99RoSGLXen+5oLEmx7yKXAn/3kGD8EWrG6g1sbQTaNAlkx?=
 =?us-ascii?Q?tneUr3BJ+TDTJ+4wOfLsDiMYlRXw/2OPRLh12OLPL+q86Qnz5G+cL7S3GifD?=
 =?us-ascii?Q?cfSglP7EykG1GgurRR75UNal4hNPci5did/TDIuB+ISnY+wcR737/2wlrJCp?=
 =?us-ascii?Q?B87EjgRo+BY7VxYSZwIvJiXaV1guVXw2SZYn4OOx00KmMXFhlapcEt2nmmfQ?=
 =?us-ascii?Q?+bVehPh7pHhEZN/ykSnW2nHZE4H5m6IQvbIH+gXONOveYWUr6bFjXX82MXdG?=
 =?us-ascii?Q?kK9AEGgLCKScnJAnt3FZXX9KHneZirhhh2bbuSM1puzpdnBsTwN1IVKhPNfG?=
 =?us-ascii?Q?XldAqi3nGceUVOmvzMY54YLcLcCbNPP+bpka4dOxJTyCi6og5Bf7MmUVwrgi?=
 =?us-ascii?Q?cTcuRNRvw+L5hlx7+VVCLzlygyFR07Cv/BAn09JZUC+4bHdQiI0YSYF++zL3?=
 =?us-ascii?Q?H3KqlVT5klw6xW11W7LygHmGj1GobHBYIt+8GOYtOjtbcLGIQOnduRCL9pr/?=
 =?us-ascii?Q?6qvFtwXyAgOaaM/NQVuFX+4Z7SZ1B8Gxq/Gsl+bpkR8mOoIfU3MDtYyXPS5r?=
 =?us-ascii?Q?Bs42mg9aiJ69/g6TK+cHBU5OXALO9iS5ZazwwOfFRtMnQIZGYEDC6sCVoxMG?=
 =?us-ascii?Q?ct0xHkpOwH1oUsS9ucfNgfG3+aUI4+e12x4l2uhOVXsrJ5Gjhw0UvldAiGTF?=
 =?us-ascii?Q?AjWaxKCsr4KBmUbAQ1U7CfGQTpBhGsPhSrsLYREq8GSuc77+AEjoxEL4T9th?=
 =?us-ascii?Q?npRxoE4RjTTlItSxTTesiX+OVojh+tNODUC6RdVvYM4jLHmIvDEKUrzLfOMe?=
 =?us-ascii?Q?qatMeBHb8VpLq1FGPDqqvQUtuu2qHou96ZytNES7d6zjbSU2v78XAn27WDAS?=
 =?us-ascii?Q?mtqyreSPdV4fFzZrDNyDpkI95eG8YxY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd10412-0411-4884-a396-08df3902c665
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:00:19.2250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBPwc+b90UwNTC57d6Y00HjY///Xkqe9WEpHB5XjRMbXMDWn5BImBSmK0cE8izL7+Fk3ZWILEMg2eBCHg9wIGBVcQEOyFetVFoBblpGFtw3mDOsjB1hOBcjB3k/YwRSd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10592

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper across various I2C bus drivers.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 6 ++----
 drivers/i2c/busses/i2c-imx-lpi2c.c   | 3 +--
 drivers/i2c/busses/i2c-imx.c         | 3 +--
 drivers/i2c/busses/i2c-mxs.c         | 3 +--
 drivers/i2c/busses/i2c-qcom-geni.c   | 3 +--
 drivers/i2c/busses/i2c-qup.c         | 6 ++----
 drivers/i2c/busses/i2c-rcar.c        | 3 +--
 drivers/i2c/busses/i2c-sh_mobile.c   | 3 +--
 drivers/i2c/busses/i2c-stm32.c       | 3 +--
 drivers/i2c/busses/i2c-tegra.c       | 3 +--
 10 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index e0c3de5e82033..24f45a1d00c1d 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -256,8 +256,7 @@ static void at91_twi_write_data_dma(struct at91_twi_dev *dev)
 		goto error;
 	}
 
-	txdesc->callback = at91_twi_write_data_dma_callback;
-	txdesc->callback_param = dev;
+	dmaengine_desc_set_callback(txdesc, at91_twi_write_data_dma_callback, NULL, dev);
 
 	dma->xfer_in_progress = true;
 	dmaengine_submit(txdesc);
@@ -374,8 +373,7 @@ static void at91_twi_read_data_dma(struct at91_twi_dev *dev)
 		goto error;
 	}
 
-	rxdesc->callback = at91_twi_read_data_dma_callback;
-	rxdesc->callback_param = dev;
+	dmaengine_desc_set_callback(rxdesc, at91_twi_read_data_dma_callback, NULL, dev);
 
 	dma->xfer_in_progress = true;
 	dmaengine_submit(rxdesc);
diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 7302464c371ae..7242f6409189d 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -887,8 +887,7 @@ static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
 	}
 
 	reinit_completion(&lpi2c_imx->complete);
-	desc->callback = lpi2c_dma_callback;
-	desc->callback_param = lpi2c_imx;
+	dmaengine_desc_set_callback(desc, lpi2c_dma_callback, NULL, lpi2c_imx);
 
 	cookie = dmaengine_submit(desc);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151f..38d15a8253c7e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -498,8 +498,7 @@ static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
 	}
 
 	reinit_completion(&dma->cmd_complete);
-	txdesc->callback = i2c_imx_dma_callback;
-	txdesc->callback_param = i2c_imx;
+	dmaengine_desc_set_callback(txdesc, i2c_imx_dma_callback, NULL, i2c_imx);
 	if (dma_submit_error(dmaengine_submit(txdesc))) {
 		dev_err(dev, "DMA submit failed\n");
 		goto err_submit;
diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index eee4fdcd9df31..cf3fbfdacbe4a 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -283,8 +283,7 @@ static int mxs_i2c_dma_setup_xfer(struct i2c_adapter *adap,
 	 * The last descriptor must have this callback,
 	 * to finish the DMA transaction.
 	 */
-	desc->callback = mxs_i2c_dma_irq_callback;
-	desc->callback_param = i2c;
+	dmaengine_desc_set_callback(desc, mxs_i2c_dma_irq_callback, NULL, i2c);
 
 	/* Start the transfer. */
 	dmaengine_submit(desc);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 50f4fc1330859..0151257036893 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -800,8 +800,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		goto err_config;
 	}
 
-	desc->callback_result = i2c_gpi_cb_result;
-	desc->callback_param = gi2c;
+	dmaengine_desc_set_callback(desc, NULL, i2c_gpi_cb_result, gi2c);
 
 	if (!((msgs[msg_idx].flags & I2C_M_RD) && op == I2C_WRITE))
 		gi2c_gpi_xfer->msg_idx_cnt++;
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index ce30634e1f402..ff3d1278c750b 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -784,8 +784,7 @@ static int qup_i2c_bam_schedule_desc(struct qup_i2c_dev *qup)
 	}
 
 	if (!rx_cnt) {
-		txd->callback = qup_i2c_bam_cb;
-		txd->callback_param = qup;
+		dmaengine_desc_set_callback(txd, qup_i2c_bam_cb, NULL, qup);
 	}
 
 	cookie_tx = dmaengine_submit(txd);
@@ -809,8 +808,7 @@ static int qup_i2c_bam_schedule_desc(struct qup_i2c_dev *qup)
 			goto desc_err;
 		}
 
-		rxd->callback = qup_i2c_bam_cb;
-		rxd->callback_param = qup;
+		dmaengine_desc_set_callback(rxd, qup_i2c_bam_cb, NULL, qup);
 		cookie_rx = dmaengine_submit(rxd);
 		if (dma_submit_error(cookie_rx)) {
 			ret = -EINVAL;
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 755064804cb21..15b54d9f56a16 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -531,8 +531,7 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 		return false;
 	}
 
-	txdesc->callback = rcar_i2c_dma_callback;
-	txdesc->callback_param = priv;
+	dmaengine_desc_set_callback(txdesc, rcar_i2c_dma_callback, NULL, priv);
 
 	cookie = dmaengine_submit(txdesc);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 3a55f803e4f15..27f838dd38de7 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -546,8 +546,7 @@ static void sh_mobile_i2c_xfer_dma(struct sh_mobile_i2c_data *pd)
 		return;
 	}
 
-	txdesc->callback = sh_mobile_i2c_dma_callback;
-	txdesc->callback_param = pd;
+	dmaengine_desc_set_callback(txdesc, sh_mobile_i2c_dma_callback, NULL, pd);
 
 	cookie = dmaengine_submit(txdesc);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 064e47d6c96fd..7a0881addd816 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -134,8 +134,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
 
 	reinit_completion(&dma->dma_complete);
 
-	txdesc->callback = callback;
-	txdesc->callback_param = dma_async_param;
+	dmaengine_desc_set_callback(txdesc, callback, NULL, dma_async_param);
 	ret = dma_submit_error(dmaengine_submit(txdesc));
 	if (ret < 0) {
 		dev_err(dev, "DMA submit failed\n");
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 76d21bc51c618..a3c8db6d72ccc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -657,8 +657,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 		return -EINVAL;
 	}
 
-	dma_desc->callback = tegra_i2c_dma_complete;
-	dma_desc->callback_param = i2c_dev;
+	dmaengine_desc_set_callback(dma_desc, tegra_i2c_dma_complete, NULL, i2c_dev);
 
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(i2c_dev->dma_chan);
-- 
2.43.0

