Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794517820;
	b=wWNfJlxmXAmhTst4XOq+J5puK265gFMECMu8hmr558rEWtbthJYrvbOBLorWDBmcT0Sy
	 JkptnzAzyQbA9uxOf2VJH8rjh0MtwS/OsGXU3yYRdysZYtICxf3UZf9X4oIbPjUveVIG5
	 pULT4QQa/1aETWe7Cxeq4nJlpv006bZUEcMYgU8ygA9z/2vxNan4BG/kmKf78MVjuSA2y
	 IdyTQbiQPKh+WQdDtT90rkNknwzHYMf4WTTQ/GskYrVYunVOxwon56M+qqPUQ8t3bVodJ
	 De9xvnzp0RVo4N0Ll5e4IELrymCHHsRuwgn9pbgIM11xcJwRcXcJ9eFsRGrJFEfzGZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517820;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=N89vpPvqcf9xlTjc2NkEa4uZdkAymWfVAPbJWSt9X0A=;
	b=Fp7zqXpmAB5cgBM+v20bv7P3T3XTufm0oMTB0AglVqpaPT4uQUSIB4wgpTcKRIax0tFF
	 a+U7oTt1NbOcSN15adlujKfPRYWPzGy/54mjR0WuyLAH8R55qws5Q6Ddbp8B9/YY3foXS
	 ilGKOjy5YF41Ygp1c/plkywyvBdWeyq7pxaGRvPv6aqrDA0BJ2PjU38CR+MRUIarLUGyj
	 Nh618VWuIOqoPo8SohWotQYbjmvi6fwgysNDvwanZ7jtSegWRiRB2hGKNZuaZfzBrzyZD
	 z8GKZc0FdaDqFEhD87L8I9eGSkwYNZ2+ur08hWLj0ae8YTlL02R8m3Z+HlDVyjQIQ7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=h1hjdxea;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.43
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3018606A321;
	Thu, 12 Nov 2026 21:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3018606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=h1hjdxea
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fr9bh547Gn8hAKMmi/8S5km8nQ1u0un9V4HFVEeovLIW1IdFbeyRvbbIRA9v+FBK1MSMjQVfsVlHPKz6wD3N148sdEmvG87f/jpbnwlrBm1U3tytRz5GSX1v8MRwTL2nc399SksWDO7lweYFYvdMEZLBaLe4lSx9hTsiWFrvu3xPkFfuPbj2/oLJtHCDU/tc9QXQSQv170s1uRDwKSL52VU/Osjndn1H/V+eSbh4OHokhnzB0UxNEOw/I8iFa4qeBsmOFANWqlaKBdHdMZFIeFTH7wtDQPS+yxyqINa+qtFIZ56vMGVLVt4iBnp8ZjyImJaac28ir/EAiTHJg6NIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N89vpPvqcf9xlTjc2NkEa4uZdkAymWfVAPbJWSt9X0A=;
 b=ZQJO3pbqv+tcscj0aylLweyYrIrhYbEzM5kSrpvq88UvwS9+2Q10FmAYbW5r5HKItKRDxToi5XwEO6Et0ED4wFfB0sdPUJhUsoUqKicjYjucqQJRj0H3slko3/8QrMI/LXZ9+VIZCS+p4qk7VTQaCXXDoRwTqi5b9B0TokdWsQq1cWgXO13eYRr9igTuMTjQFwXHXQ7+xjD355+1KSypNP/Nis99P3s0eZZKmBZRYre9kAWPa3mxnkXLiNVckbqAnA95h92/qv56IW4Y7r4h/Dn5kCTpT1tx+9g6FN/oNDGusAw2QUypxHJaTGPtIopYWCAS2ekFMb9pFLuXWdPjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N89vpPvqcf9xlTjc2NkEa4uZdkAymWfVAPbJWSt9X0A=;
 b=h1hjdxeanw4JHVn/JYwlhgiJuXDmxwCc9kLQV8iC7V2rhoSktm7nsnJK01ZOg8SDDT4ZwFWPZ4sqs+gwOVPNs4BKSwCimC3WHGJOi1Nf7C/dhnEfIjt+z8TRdx71lBtB1htyNiU6BipmhCAZ3jDiKBNc8/zoj2PSgE/N9QxQTEzuMseMNOzGCMeUPmvFLB/AYpcwt2pQR2Xr8RWuj0MGoU9sLP7GvEo2nCjtljb1iaNCuiGXGhiw9CQEr3Wf2lHnGr5QMI+NdjYanvQaE6YLNIQ0KyLTXF4d4jrlTGcCMX6IgtG9kD7Wmn84FhZ4qnigHGkC1H5DBXUCsGnyKApd/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA1PR04MB10180.eurprd04.prod.outlook.com (2603:10a6:102:45d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 21:10:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 21:10:15 +0000
Date: Thu, 12 Nov 2026 15:10:03 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Sheetal <sheetal@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: tegra210-adma: Make Tegra264 FIFO size
 explicit
Message-ID: <avYrK2KgrAVdOPtm@SMW015318>
References: <20261104110932.1097294-1-sheetal@nvidia.com>
 <20261104110932.1097294-3-sheetal@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104110932.1097294-3-sheetal@nvidia.com>
X-ClientProxiedBy: AS9P194CA0025.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::15) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA1PR04MB10180:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5be7f3-ac35-4ec7-aa33-08df410158e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|23010399003|22082099003|18002099003|4143699003|11063799006|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261022105027099003|56012099006|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	BLu91MVM3EdSx0+Ac7Rbw5sMeXNmksajf9+QGwpXB3N8PwIp8fRFZfwcT/eIOmeasRAl49fQ5/hPohc3iOwVyYdgwAvWr+yYRvUd/UL9Zpc6W+A86kYAHpNlSP6gYXALgM81ORErwLWaEHuxZP9+haBPm46JtMEC+JlYcU40gtlcwGe6SeuRiF6L/Qzuz+v8fI9QoKZMYXh13in4lBWnBsKkaYtkbSG4kcBKLU4ggfIyw3fjg/K4D1/ufK+yfAKtkB/aKn7NHi8nE7mbvFdUDwuZYhJJ2jpTs7Rok1IzAl0p2yygeZyP8JiinUysE/UhdfRIBL586IWry0bmgeK2D3ukNHQ6rlo8AC5SVg1+aiS1//bEX3GfR4luIxjjxDHC7Exa9ZCXQWJYkd3Vj9Pouib+8KtsfBdkuY91EhFQwViPPSRPwSCNgqEqEh+SWI1ejUCqGerFapz+Gv9Tl+RPUX+8Cv1S3mXSn4s1Ii3kPfQIoKyc2yBfPD7QrslrDuF5538XCeXaF5egGmUKsdOBTUV+a6LnRmaH62KUZhNENNTZx7P5gGePt5Cwq6lmyrsKUHX8qh52KRmF8OvLeyXzv3jL4CWg1VUTk9CVrYa/7fMgUhhw5nn7XEboVnknUPF3JUChEum+ZDvvJXbFX4ehXoLkiTKpXcOe9PYoJ5OvkJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(56012099006)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n33PXkgr+psAnf5Kx/rCq4cEpPUNfldbYlDOTeZbL8MPcEv6J746i6KiiTWZ?=
 =?us-ascii?Q?Ade3B4tXf9469qSf8xffjn4n0qOKCClrmAtRbA+dG/EDHVkMUa6v5cV1i8Vs?=
 =?us-ascii?Q?F3+yijvxOFMIOtD6EDVkYkOmgI3ram7sdpDAoxCGG8+3KUUFeDinzbBFDta4?=
 =?us-ascii?Q?B8tjf8fqNu3sMvESpJ7EsqOjsbDvCWAzLqLTW71aCGCEt6X856OzsnS314dx?=
 =?us-ascii?Q?Hh/c1xGULlqwS3i1A/oof04CSieviAYv5jQ2e35bRvHgvDjdSlcfyvXVpG+b?=
 =?us-ascii?Q?B0ZbF4rGoSRLm9Mco0oGVlAjmep6RZGGE0gAEtJY1Je2qmLkc0Z/MKzXbVs0?=
 =?us-ascii?Q?F3+Z0XAjRJqn05OL5nIsGG68+5jczfs1neeethAtd8retjEV0f9CE6M8zHGO?=
 =?us-ascii?Q?PrD2LOUwM42WjYaIhQWteUfN136q7U2liT2k5e9HM3tu9V2SBCRb3uCBeeKY?=
 =?us-ascii?Q?nOegSKD/YIY6hO36NbIwLX4cFb4e9TZ7gT2KXOte5/Sf6/ZgfTKwyj3QqYZ3?=
 =?us-ascii?Q?sKuWD9SLk5kFMauDouLJbw5DVZCOFCs1w5g+oZJmOWsSylXzSZCSAiuojEgl?=
 =?us-ascii?Q?4Q5t2jzh25R3Ce4ZVqJ5eGp0Wl84Lqr901QZ4qmaTretaiL2invDGKe10obf?=
 =?us-ascii?Q?9B+GKouWNe14V2/+lkhFrw2IWluQUU92GS7FLoNFlRlZfjJ1xJruhc3irTiW?=
 =?us-ascii?Q?lSMJDdY1KZlBNL1h3O1H8UFBCDxYlz4fxkoHyoELxdRzwuKjGERWwHsHJKAT?=
 =?us-ascii?Q?+FUX5szU9IAPTrwn+7dyS+2q7kbfoJNBO5CSwhQuzNq+fK3L2tcd1GYAcijL?=
 =?us-ascii?Q?vb+aSahQarxHu2UtMAWsRzmrM8wIaHR672zdUyEdsqJqiDvEiXar1dPAkJbh?=
 =?us-ascii?Q?HUNbPmKW/0hlPgKe6PlvyO0qTS65WuNmnUj32R4MNcGnHxVZD9dzMtIoKQhZ?=
 =?us-ascii?Q?HB7irTZ1mY+kdcmo2NaEmNbfp/1RpJEoiFIYP1pXQtp6xA4jEMaxEGclIHQ/?=
 =?us-ascii?Q?JN2xZHGeHhaSTamlYj2qjzocekMHvOPe3rFLSYSKpF73BJaDohT3pBjv0hhe?=
 =?us-ascii?Q?T1S1MFxgAMBwAckojwLGihgMy+3z6Gmi6/5BnovnWRA9nMG/97jgHxxOigKD?=
 =?us-ascii?Q?UuRKlLv90G7WGgsoBMXv+nIFz9F81UQeiuXsXrMnnmrYt/8mcjogwp1x8qae?=
 =?us-ascii?Q?B5G45uDW3qAIfPjgmio07d/8g0N/mh/UI5IIf9+LJIabs0mHWHbxyfK9+Wck?=
 =?us-ascii?Q?197t6iS1v0O1Y1eTJdqZgF543Jyz89r7kG4v3ggmh4eFM2LXmDDTAL8yiSRN?=
 =?us-ascii?Q?w9buW6MQJ2FedGfaPJwVmQA8qo7vG/HsTgJY26Tv17nASHckFNlF6pMOLW+n?=
 =?us-ascii?Q?KiTy8yIIplVQNFoDrHTYUiq4wfsixQg83pByFkUONGqUud7IQRs7C/E694yl?=
 =?us-ascii?Q?fOeFGADWXSmzYk46WaxXZ+drR95iHij9YDMUaH7Uh/FVrQHmtJz6hmH4hOXJ?=
 =?us-ascii?Q?3R0u/pZHCx2oQYpevgrZtRzl4ejE0IgEiqpB/qf+5a1mOIYSsz+0WfVRJVb5?=
 =?us-ascii?Q?Xfo1D0QJ/hz9ntYIMbZVBUejV7XF5hhV3P1++xl8As2SM4Fithl6Fz7OywA0?=
 =?us-ascii?Q?yRupcNHEAloDnfFRY0f4sG9BbLYrDgT5TBnBrNpcAc+51ZpOkqFJ4vLcr3cC?=
 =?us-ascii?Q?YrH/n6PrsEwQRuWdGUYjq1SRCDY13OXvb8xqZHaCh8pYVxzA12k3xnnQj0l5?=
 =?us-ascii?Q?CN/QhPLdsKAW2ejxx3p4DsRRsTP8gw9mOQA6dDSllXFZ5iGzgRL8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5be7f3-ac35-4ec7-aa33-08df410158e6
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 21:10:15.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9I1JlLrfQkILb1yvovjUaMpEe3jQ403qQrtTUOJo4fhOJATagbF+x5nbbI5p3LKqmJ1faMLu6e8XfOb6X1Z70NxWH7F24QcwtbkC63wdTpQgFkxt5xdIaNdMHfJprpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10180

On Wed, Nov 04, 2026 at 11:09:31AM +0000, Sheetal wrote:
>
> Tegra264 uses the same ADMA FIFO size for every ADMAIF request. The
> driver currently obtains this by setting sreq_index_offset to zero,
> which makes every valid request select a FIFO size of 2.
>
> Add a SoC data field for the uniform FIFO size and set it to 2 for
> Tegra264. Retain the request-index-based FIFO selection for earlier
> SoCs. This preserves existing FIFO programming and allows devices
> with a different uniform FIFO size to specify it in their SoC data.
>
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
...
>
>         ch_regs->tc = desc->period_len & ADMA_CH_TC_COUNT_MASK;
>
> @@ -1018,7 +1030,7 @@ static const struct tegra_adma_chip_data tegra264_chip_data = {
>         .ch_reg_size            = 0x100,
>         .nr_channels            = 64,
>         .ch_fifo_size_mask      = 0x7f,
> -       .sreq_index_offset      = 0,

Don't mix this change into this patch? if you want to remove reduntant
init 0, use seperate patch for it.

Frank

> +       .ch_fifo_size           = 2,
>         .max_page               = 10,
>         .set_global_pg_config   = tegra264_adma_global_page_config,
>  };
> --
> 2.43.0
>
