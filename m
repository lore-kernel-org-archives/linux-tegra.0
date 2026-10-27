Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793131246;
	b=fd4b36GwS46ZHcCfLWBmE57cNJOtOU3NkWca+/rAehXkUDOl0sZvhfp8EnWZAvsQZQ3t
	 PFzA1UXpqx/mL2JJ5gnNY7IkHJSGuDg4FBB3SiCgu9R+CM/QPAzU1QXdIdRWpjs24Tk0g
	 uiVermhR0Fiptw1nNfpPrFGxqj8DWs8GUve+ac6tI7PuNeNNmJCr4dtgCPRyYcXrFBQhW
	 Wl/MbtUF3wGzh80m2tMVrj2OE5aQKh41ebxAjBsZI1ZXnWcBc7/nLGkbTGEmmHqfLmBBZ
	 mooc3vZQ1o80ZZx5oCawMgr0X+HuBv3VAWSgVtyRS+NRDwBBLRrbe8pGJrh3GkFAsVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131246;
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
	bh=7jCaM2gqdsEkg4UEEjbQO2Bad+AqkqdZ5asWb5c6gjY=;
	b=l8JyxBFlqJcrg4OSgpfkAUoAImTJGC6uSdGtEyuFix+qGT6khfhIFz2H1uKtYdhP/Kjv
	 IRBlFU2ITI1AKXdFQubU212q45xiXG57T3QWUWao+UR/6KgytPhSdeRVEosxCtXTVCKpR
	 yz9FwCvw9P0VeXRyA5Ej57Fsj0qCCnVbEp8fSzhCUNr5Dw7Ra4ovIY7MwDS1YNifNA7Em
	 zLxDMo3BSZdxf4zk+s9bF7rGsj8nLkCVU0Fia4eunP1DjqI2NCTZUNpVPTV6ALXR5apf1
	 EkNfFT09UWbdcJw3UKUZ9QM2erokD5zEb5sw94xFfgh98vTbuqGxMs+6glHQ0FDsucQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LQuB8zPk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.8
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAE606A31F;
	Tue, 27 Oct 2026 20:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BAE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LQuB8zPk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUAQWTcD5+vwL5jsM8X1zsgg0QY3fUb5ILt4jkOz34lVN9oMWXBjp1jSNgjLVhf87NzjebUavXOQjgE1QZszfwOp8C6G+UKHIMcUmCSGNVlF54QHJVhcL+p0iwUgE7QshVJQ38/psgU+KC3P+L69oZxErZzCheWlwzyvOTl+/3n0S8J1qNGNLt/a1NOYkRXIbZ9J/FqnGlYfpQmCiuIMnURuyWi5aGKX8oVhTeTm6PbQWU9twGAngV9wYh9Sh+2LIs/P12DrS+8xxFQtTkKmTvtqXqHXqAlA/NnTdmSVyp85nD8/YZM9TsoyuOeLxtuafLDWE0Cl7jvnan2WnUZ2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jCaM2gqdsEkg4UEEjbQO2Bad+AqkqdZ5asWb5c6gjY=;
 b=KKDKfesAQYh3BuwMhJonEPoSgfshWTnLExm7OlKOlIFJtuZbgbru/SqXpEwXa0dpDTYiSLFwG1o8/kt6pe0w/LZ6mVf4EC8RUNuDRIjlwf2T7k9ZKD7omhTzo76k0MMHfikRSryNjhTSIBYnCVz3TP/Nm5CAehz4I/wU99CwhtfHTxTpkbN9IsLOZY1viGgBT9AxmkkVp8I49GGijZyt8FSbNmONYkVXv1ZjaUoyOO6cILO4OUTWQlQZFEpQDH8CNK1oVU9ksx3oglKMCFAodd9R89fqwKJq2YAK/qVQU5RlFuTGR4Wui7vHYr8cUETz7AIarmO94XKxJctUQqTsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jCaM2gqdsEkg4UEEjbQO2Bad+AqkqdZ5asWb5c6gjY=;
 b=LQuB8zPkl3Q2AFduk0Fz1HRqS3/lY42XTuoJD1BefCLzqY402qmjEfAEq+oMhF1M9f1936DY6QWPOlu/skmo15QEOM98WQCgfNYROOkvooAb/fKjUfJetP+alMrrTotYPTedDcnwKcBNQBsMq0DXBqVo+KAKUMC8gZu8QHIf6u5n3XsQFeowi7E9brISJVDscqmyxpkvwf8pk/rC2PbYTuyLdDkmOnUZ3DSj1JhJnDjZ8T68rjVcH+elTE2bKSL26DFjrg/ZY7ZPeuSk7mmB8HNnuUrOdpSHhwmVXhP+MUznA+5I3gJS+gwASUDmMlpt+5NUguD8o/268Cr1ll986w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA6PR04MB445650.eurprd04.prod.outlook.com (2603:10a6:250:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 20:00:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 20:00:41 +0000
Date: Tue, 27 Oct 2026 15:00:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Andy Shevchenko <andy@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
Message-ID: <auEC3HAXyvYHbKDf@SMW015318>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
X-ClientProxiedBy: PH8PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA6PR04MB445650:EE_
X-MS-Office365-Filtering-Correlation-Id: 0321162f-f231-42cd-f191-08df3464fa8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|23010399003|376014|261026121527099003|11063799006|4143699003|56012099006|261022105027099003|261021123027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	BwHEHUcXEgzolieVC4JdEws/zbwJimfMrrbkQZ1JII3o1xOimmqcE2tLm/yiOCU/DO+mB/H7V+XxypOJB876u66C85W9C1p1VshfBdLYPWPl7sCPwyZIUIuYeWgZWh67jUBJjOiIiipHR7DiRvuZ6ByozBojWPgIb9fdMYbqh5/hNtIoRYjON1kA4PWud1jvNbeDtQS+6aMXRXjTtaU72TCmzHbWecFzzAYbolcBOUGv0lzmu421aRYvNi6MUw+L43U3Kvv5NOY+pfqhnAWKVh9zTvJmvWuTEydSgeQxBGmLzBP4ZD4EcHOsJ8wq/BF7XBKUB8FcRoT05PNyHrjJYN3yRVhudLRtWuPwA31y+wGsqUOpQGZbRjYwdFDoePbTNOEqAVE2hvbAqYp/kvGZYhHEEBA20soKW3XZpyzSD43KVb1ILdDIK31ldXyOim4hfrOUm/Oq9d1Kdg0NIFfxF20PoxnTvFrGLYBOCvtDYUrNyGdnH8FU55xluw2v69mxXn2hFI0K/exyjiFZMtj/r0n2xAZDWgnD6P+/ooSLWWJG/tJCHUfjB1Pm9OYkxFuNHf3df0wpUpXHJc0LKbzLWRnGzat6R2fRpKO4DuCID1N87EAc6+nlflZ5Xg3wwivoVS7X2y3ftvA3IS5LzV8nOHox/zOeHKAcJTkNUj8rAIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(23010399003)(376014)(261026121527099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AEuwKf9YWkTFLaNIFGxKFnXgn0dHbyUP9zeU9FvV9Z90NKuF76TgmGOx+WbA?=
 =?us-ascii?Q?hWknQDw6aYmDb2X46XD6rXsA/0Wv827W5xEcs/k0PtOgL/vDXv5NqAE9QZKf?=
 =?us-ascii?Q?A3pizYhtjuK/h8TgheTC85PEXwoldgnfPyikG4fQJ5mF9J4f491k2GARixTM?=
 =?us-ascii?Q?rz83TCqaFTa9j92auG5vvMzhUp+sSKUYV/QdDrgj1s0uCheV0Wsp41tY+u4n?=
 =?us-ascii?Q?d+q8UdjFAwh9V9eX7/UmCEojEkdm+tumVC3E+M3EP5rV5DnX952NlMsbLgpG?=
 =?us-ascii?Q?swUai/FFeSyuWs5Td3zDj2fpIqWK2/SXcs52L6qqKPSvgRXRJ5ordiitr1Q+?=
 =?us-ascii?Q?WzwszOKog6vZTL85tbyKeLJ3l06qYzCLCgPODRW3uQ5S7FJlGAaua2+JmNSF?=
 =?us-ascii?Q?no6WRZZ5v2JxSic6AYMoes+JZDhC9uYRnWwoVqxgq1GCy+RaNSzqWJQUi9y2?=
 =?us-ascii?Q?u1r7D+vYqTVP+IxHpOcYCR2S2rNYAk/aGhejAMrWvspCNVB4wfisuX/s031Z?=
 =?us-ascii?Q?nZPcKTXUbJPUpTMhclQ6YyPxbirHGdkJxU6VGorEbWhTlaJLVD+0/E6/so7W?=
 =?us-ascii?Q?q1m6xcs/OZbvZxxbaQBNm1vLflYw0AcsOyb6zJ6UaR/2GPm0y6wR83Khg3+i?=
 =?us-ascii?Q?IededmjfbmPtCfTdbTwv20gx5FBwwkwiS86vm24gd36KqqNJ6TYz9XQTEcZp?=
 =?us-ascii?Q?J0Al3D1Q1gr4zM0mO5Jpur93BoIb8bl62bBFPudUCAD1lCMNQVUqXFwaAJkF?=
 =?us-ascii?Q?QfViCPTui4jt/wVqqXqu+rIxzfqABlibHdJG72hhP9+dVAX7DqaEDwnP71QL?=
 =?us-ascii?Q?qXB4OxQKYwZEi1opI4nWp3V3loNL5A3QGOAruHkyXOmEMZbI0FgUN6sNkTRt?=
 =?us-ascii?Q?b8nP5kUT53vrdtgeUCDFaOMELvScUA/7+EqPdX3nNHFRODfgEzLlP04pXKun?=
 =?us-ascii?Q?cQZPAVel5B2AuNLz05MPRZDL3WT/LjPlhdmT1XBqLWCylODJxaKlPN7ohBxx?=
 =?us-ascii?Q?DCj5HR0k5VGejp7hOD5WrUNuXF3TxQvQkeO5n+b7qcz+mKXxnVRkp5MvWuls?=
 =?us-ascii?Q?80zCCNtb+OelkRwrSQFuzX7C7ah+wQJ7nNrYVZ5GTv4fEjqkiMgggkjSDh59?=
 =?us-ascii?Q?V+c7eQWy/MIpszWh/AzfGUH5FBcN3nn1Te667W2sF3R+EuNHG3+tzIh4frpE?=
 =?us-ascii?Q?GPm4rTZCRE0ZcIDpo1gK2Hj/p5HZjtw/wzFqJ7BRcDKdOtpdbFNqZHYJ9lVf?=
 =?us-ascii?Q?Kks5LMkDQpcTps45eU1IdGW09QtSnMiPWtLzQfr/CocwdnVdTAc5/quO60zr?=
 =?us-ascii?Q?He0JwPbInTzWbq3p3lZdkvdjEH/cF976kdGIxwq3L4sT24Gb8oemUqotekJx?=
 =?us-ascii?Q?8Y6AwXd56IBEuNVhslFzp+RmbfHWxlbZaY+Iccv8XTYmc8gfA2laiqx+V5j6?=
 =?us-ascii?Q?P5rRWEhub5cXHcXpON3km7BHZf8myvj3s4zr6n/Utvaka+wv1aZMvep6qQTS?=
 =?us-ascii?Q?r3fcJKXqCQI3QseTRxmKSOFW16BMYQmsRN5VWpDAIhHLoNRHVM0WoH+9wJwp?=
 =?us-ascii?Q?fiebgsEJWutG3XYv2CznLAtImX6BWwUAjVu1Qifg6knDcNLF/l5eWc+scFhF?=
 =?us-ascii?Q?XjdvoRsf36UKC6hn2D7dafzU4qmuGOrDXpnDLvAR56dfph11lN2o1OKgCwlo?=
 =?us-ascii?Q?RlwdioljBEMjbTSNm3OhDaWeR2I5z4MzfVZQVunO6obGKxeihjhMMpMsGRS8?=
 =?us-ascii?Q?0IdKPjRiFT62ERXSYzrOxWl7y66hscq6+DKxgOFz4Z7HLgVonz0V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0321162f-f231-42cd-f191-08df3464fa8b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 20:00:41.6748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzTiQvnRpxNr48lcRbomnzeWSVih4KAfddLOL1w8dgHmSh9eee6iwKKJL3mi9HO4P79LDjbGJDSNGR6Wk03DT4HojZxk/2eUW/PX50V5dq6ZczXQ+vTtZDTvE5JkhkeZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB445650

On Tue, Oct 27, 2026 at 12:22:26PM -0600, James Hilliard wrote:
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/amba-pl08x.c                       | 11 ++---------
>  drivers/dma/amd/ptdma/ptdma-dmaengine.c        |  9 +--------
>  drivers/dma/arm-dma350.c                       |  9 +--------
>  drivers/dma/bcm2835-dma.c                      |  9 +--------
>  drivers/dma/dma-axi-dmac.c                     |  9 +--------
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  9 +--------
>  drivers/dma/fsl-edma-main.c                    |  9 +--------
>  drivers/dma/fsl-qdma.c                         |  9 +--------
>  drivers/dma/hisi_dma.c                         |  9 +--------
>  drivers/dma/hsu/hsu.c                          |  9 +--------
>  drivers/dma/idma64.c                           |  9 +--------
>  drivers/dma/img-mdc-dma.c                      |  9 +--------
>  drivers/dma/k3dma.c                            |  9 +--------
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------
>  drivers/dma/loongson/loongson2-apb-cmc-dma.c   |  9 +--------
>  drivers/dma/loongson/loongson2-apb-dma.c       | 14 +-------------
>  drivers/dma/milbeaut-hdmac.c                   |  7 +------
>  drivers/dma/milbeaut-xdmac.c                   |  7 +------
>  drivers/dma/stm32/stm32-dma.c                  |  9 +--------
>  drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
>  drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
>  drivers/dma/tegra210-adma.c                    |  9 +--------
>  drivers/dma/ti/edma.c                          | 11 ++---------
>  drivers/dma/ti/omap-dma.c                      |  9 +--------
>  drivers/dma/uniphier-mdmac.c                   |  7 +------
>  drivers/dma/uniphier-xdmac.c                   |  7 +------
>  drivers/dma/virt-dma.h                         | 15 +++++++++++++++
>  27 files changed, 43 insertions(+), 205 deletions(-)

Thanks do such cleanup.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
