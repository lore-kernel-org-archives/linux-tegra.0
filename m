Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB84A3D45;
	Fri,  4 Sep 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537807; cv=fail; b=G1sXukZkLAFD5wM4vQ+9r5jVZrBx02iryogU4q87TSvcyEJ5KnXtondApUTlxG7ldJvmjathMm0Z/r55j//6KDLizBUvuE8Q0Gy3YCXG1eVePzSl9TcmphlPM/31awKu1Jdse/AdUXBvejZJeSxNVt424LcneVMM0KkIuOapPJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537807; c=relaxed/simple;
	bh=ZKrIjI0VajTOiM1WjTfZtRqakCMtP2tF+M7bxHd2fOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gqGq0IwYMzWWWSl4XjucJsJynQhTyLrvYpyeyGk4YnLPbcTah184ZmJT5TgvsDq+ktE115jrALWPc7rzjp3kwiqG++zD2+S1xrxoVPw1CeHRN2aRNTaMToVicC/xhjUrGEaSH7YQmnQigsbnM5W+5DFkFRcdF0ABTsugujtu8xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qEFRfD56; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qEFRfD56"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl06H6+52OV55Ip0lbLLGm0V9VAXMbxuxmXyZuOCbmVWYF2vf8hBk3IE7qhpDR6uOMBlqcQCVM/nGE0iOwvjQGz559v6BFtWi2/94aQ7UOBy0B8krO4ErZ2npiAGyeth0/ZKOMhGnKVS6O4uXIul+ftqa9FzJuybCQB306aWNNm+S846UV+Y76v7L9T+ybm3YAjmjLYAB/vDkg7qzmqjP4pSBSGn+rTCQsvgSsZleHHlXEbXW+IxUVycwaZhQSeYTWQcjTsXBdG60IlsLb8j//dbN2daMy7kdTJx5LXO8UpicKbOmGZvz2PgO6DoSmJZWwBh4GY2z1iPuS5OQU9/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeoYE+wP/hZ73/Una2p/BsJnlKVMQwY7i/kdvuSzlz8=;
 b=jjwj/osQosP5/lvyMwOtJhCBBgb2TA8ABaL7sf1zkmaGjcT8hy4pAVxnqoplMkejbe2DnofaRwJIhYKGtr5Q5x+Y1O+CWfee61Ri39NguHfWdOtGTO7jvTIDIsRq9KeEEILa7QwdUMZHut9UXqhWSZNey0QjrUgsstCgubvbCIV45FD0P/K6CT1TF414Np2FCPi7OQxBuaEBoGheePBiEDL10h8bywAkZnJgxO9jA8WXpufZQHgE0rqyDqv1BdqmocVN+jvTvJXGMnBnQFOzrDdKsKfEZvJejcc8cOpLWen/isyD3BTYHp/VXkeFHZ9zNWDuZ8es1Go+RPghH+GDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeoYE+wP/hZ73/Una2p/BsJnlKVMQwY7i/kdvuSzlz8=;
 b=qEFRfD569yYKylGKL7G3YZr9LjakE7IKYC+HWRyrmZUdpDP0T8XQ6t6uD1ZvAv3h24uYbpTOEKmhLl5N00ruQXbE9i69ELItCjOUy+rwdQvnPpatdO+fIdHWt5QZJUTiHjhcS9A1Wzxg1akFRy/Qi/UMVqZwELKGr3IWnHimdOG2n9jCCoOZdZf8WShW+7AijexRPUhN2lCzN4uk/+KWSCF0pr9D9zgBqkMAA24BpXx5YrQ4p5OFVkTUV06ildpguqJug0eEBmls7gSuiaQnWw2LSwhiBfpiJwKNj+3DSI/Nd/8A9c0oEaw6RZMcZCVD1VxltkKZBWOekbD75mJMRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 16:03:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 16:03:13 +0000
Date: Fri, 4 Sep 2026 12:02:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: vkoul@kernel.org, Frank.Li@nxp.com, afaerber@suse.de,
	alexandre.torgue@foss.st.com, amelie.delaunay@foss.st.com,
	andersson@kernel.org, angelogioacchino.delregno@collabora.com,
	baolin.wang@linux.alibaba.com, biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	cosmin-gabriel.tanislav.xa@renesas.com, daniel@zonque.org,
	dmaengine@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	geert+renesas@glider.be, haojian.zhuang@gmail.com,
	hayashi.kunihiko@socionext.com, imx@lists.linux.dev,
	jernej.skrabec@gmail.com, john.madieu.xa@bp.renesas.com,
	jonathanh@nvidia.com, kees@kernel.org, keguang.zhang@gmail.com,
	ldewangan@nvidia.com, linmq006@gmail.com,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	magnus.damm@gmail.com, mani@kernel.org, matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com, mhiramat@kernel.org, orsonzhai@gmail.com,
	patrice.chotard@foss.st.com, pjw@kernel.org,
	quic_jseerapu@quicinc.com, robert.jarzmik@free.fr,
	samuel.holland@sifive.com, sean.wang@mediatek.com,
	thierry.reding@kernel.org, thomasandreatta2000@gmail.com,
	vigneshr@ti.com, wens@kernel.org, wsa+renesas@sang-engineering.com,
	zhang.lyra@gmail.com, zhengxingda@iscas.ac.cn
Subject: Re: [PATCH 00/26] dmaengine: Remove redundant
 dev_err()/dev_err_probe() calls
Message-ID: <aprrssx-LorAEjV4@lizhi-Precision-Tower-5810>
References: <alYmNl--mxMK1-86@vaman>
 <20260715064443.525836-1-panchuang@vivo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715064443.525836-1-panchuang@vivo.com>
X-ClientProxiedBy: CY8P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:46::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: f59e165f-29f4-4ff7-267b-08df0a9e0637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|7416014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	EGNRqNQyr2mcr6anJTdDTVV2gNnqKI4j86N4WO/z6xfq7o7q+jA6BCJxuap/+9HsGECJlTa3PqtRNRUhMg1cbMe6Qvamqd5QqapY1cA4roXVIpvbH+CvrVKIwVkk7aEjdhrT0FwCkrMnR0nzELeAJ9YapngdEAE7P5G+CXSwJDP/n/5HiQ7yyqkAjoqKnPZGTcLez5ig0bsWTyVmo2mESf+tFTAcXxRg5xcvlXBCJHSl+gL2/ZXij2+j3XSsMn95oDP8WU/F9M6GA0yDm5XYR+37WadgOzC5bWAOfiT/+MijMmThC6PHHf7F1yX/n4kJ1UTj4yWnwHM1GYWtrKGCOaocVqe1bZgz8dQdzghhHQDLWwmoSiWKls4JD7dWtzq8QAaz2imnL382Vt0K4iraGoHarOSM/7JAHLGRZJy2okRsclByuXjLesKucFeGRYrsAd5iNHbKzWkv+PJPEix4SWKI48o2uyEuxY4wkmdCb4xcWkaaO0T5wdjnNhYBlFh+eMnkPKINH/f8gy6fqmFR1YFHrNPdn/R+pMlB3Mjt/bOaF6NzGN1Wf6W4UreW/zG0QsUlaQE1aCWcD6LV1XrifK3hgfVqBQGjyOtlGMh0GqnzBJFCUXCr+34WOxhcOSHw6tuhIa228nMPx+XEBTljeLVXet7X7BCZIs+Jk1W/DD7k4L8I2cvHbmVHMt6fwI+LpqovsnyDMfZQrnC7VprAQw23QQWTo3e5jdTFzgOKvtI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(7416014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ggZ2y553LUYUNuPjgSSeapu8scrV+1lJzcIp2oUL8pAm7IRgNgBODpk5umWj?=
 =?us-ascii?Q?nCTwHDEbkuE8Y9JGWvB0R3ScBVtv2ZXaQ7I9icH0Zcvsqg6JHn1EDuKTKm0e?=
 =?us-ascii?Q?JEAlF9YBCh2IFkmQUzjX4C6mpgSG+RxX4xjEe0LSHyve115zMOMCSCPFU+B8?=
 =?us-ascii?Q?IkdVYKXxDCB6O/0XYNjVmkNArt9gje1AoKX4Ib0p76F+nrFThZ1RFm106eTv?=
 =?us-ascii?Q?7FCFFhVz14HpO2uVksv+T4CMDZxjuD5tsV/fQM7d80grESezHk6NYgNCyWks?=
 =?us-ascii?Q?CzuGX0bF0J4As+eJ6BPcDYA5pNmjfieEl4s6yssfg8WUfIVevmh6zpngy/Rv?=
 =?us-ascii?Q?GnSzjT/XA+jGt7PlGRsMVe+Fe5219BNb05nVO8GcXjAcCuuOLv9c8bTIRxpC?=
 =?us-ascii?Q?OtqoiD68yZZ1GuuJc/fgxRo0s1CqDKwCuL/Dg9JVdzQDzFV1X3+6M3ocX5QJ?=
 =?us-ascii?Q?wPGOp3Pfz9Ub3Hck065UtDvG44FEdS9FPoWGJE/zMtLBbOxqCq09W5jzUERF?=
 =?us-ascii?Q?XffJMLeaH7AbNGYmwCW+D0moYSA8MbUBb/FC/ChMNuLuEvOQGR9d2vLJgILZ?=
 =?us-ascii?Q?Fxb5qr82x9aDJc0OqDJdCZBK/frIGY0CZbe5fb2IsoMRFOz7o9UO4hNYjTTb?=
 =?us-ascii?Q?j//Q+X4vYTjIP6hqUwbPrBgYLm1kn8qaK4Ku0hQF49km66xKoRTzSC2sr4Kn?=
 =?us-ascii?Q?+FQONmNo/uE0VKIXs/h2uhk5p5gNkuhQZ5PVquvzKdFq4xMhP80dMyhvoVxr?=
 =?us-ascii?Q?6ZW1terb0VdXYUHcQohPz+lQc+uhkIpv01e5foZzCLRSJuSAviiu8pMrP6QI?=
 =?us-ascii?Q?HnOmlnKlYx/DLoZwockYW7wlH1OEpLZN3T67uwR5BjMT1DIvjarf00ajFryH?=
 =?us-ascii?Q?NiWZpPSeYyrNAeKsW2ZX+TnxmZLTLs+l3Xs8YY3DtNoUCI2aMcQBX4rzqsEa?=
 =?us-ascii?Q?bBpDYV4HNw7FxwScErtGouyInwTAPny5epp/O69QtUQTj1hmnuJO1WQNZwQZ?=
 =?us-ascii?Q?sJaeTRHYmCQM9wZPq0vKGG4XXs4+ZWQQBu7G2AI1D8YPTFptpO8P+ElC1O7I?=
 =?us-ascii?Q?mJ6ELpOEwfda+MlwBPb0rN0hHCF57HUKagNnjzPD4J5ioQBRWevfUlEprtGh?=
 =?us-ascii?Q?fi1Qpj8o9mueaquNS8Ey0VvH+4K5Td+EJGFdmM8breaQzdQocT7z+LqIk+Os?=
 =?us-ascii?Q?L/r9JW4N5PbbmYCOj4FRR72+vLJxVZHg3WULqSBOMAZ+AEkojo/naKpkyWiH?=
 =?us-ascii?Q?0qk4R1eFyqTXM969wsyTzziXXTUk6FOTPgescEJFAmuQRnZ+WkO1iC2ds4G4?=
 =?us-ascii?Q?bQJXxfRCP/8Y85viBCdN4fvKMTXC3M340RwtH7Wlmq5xf5kyAjRH0VSXVlZ4?=
 =?us-ascii?Q?+PI7vIQQObhG8xC5oFzIyIljVbibzXo10y1/eINJXddbO767rgSGot7c1ivH?=
 =?us-ascii?Q?QxDpMd/XKluXI+35OtE01u3Ss+vA6HrXGyNrEEQDQAKr2lGMQVKgfDVJ7NL4?=
 =?us-ascii?Q?M3rlHFSDhkNQ6ShMb9H2FAGfM32+Se+0VB8txg7H/AJJwvdnp5PA4PhrHAS5?=
 =?us-ascii?Q?Jbq3yYuLQ6lsQwyav4ntd/bk+0DBBJdgiTeHZmoVGPacHG4fvN1QbVhNrEYe?=
 =?us-ascii?Q?o0f2irfh7b1CoSBX9vtqmovB07ObHcC6x51PKEANH8JQlw/zAz71FKJkar9z?=
 =?us-ascii?Q?MT5FrClcvtEBGNPlFd+3uMr629s0x7/3wtTLNnQN3Q+YxLbrztIRfspDEnaw?=
 =?us-ascii?Q?wCucmaGT0cAprs18Zr891xOwiQb0HBsDjcUnroHf39aJ74uvcpBC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59e165f-29f4-4ff7-267b-08df0a9e0637
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:03:13.8534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkRvp47PzUm1lyW3Y4uwQM4s9AwxWFJ7qQ6h4Kw5fqck+VtRbZM36DkftDNrkaUkK6SwT//VbFmMcAkjXtJIferJWN9HlKrsNn5O1yholw3eoa6D8lULmp9Y24F/oz4B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

On Wed, Jul 15, 2026 at 02:44:43PM +0800, Pan Chuang wrote:
> On 2026-07-14 20:06, Vinod Koul wrote:
> > On 09-07-26, 16:26, Wolfram Sang wrote:
> >> On Thu, Jul 09, 2026 at 09:58:04PM +0800, Pan Chuang wrote:
> >>> Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
> >>> error handling in devm_request_*_irq()") added automatic error logging
> >>> to devm_request_threaded_irq() and devm_request_any_context_irq() via
> >>> the new devm_request_result() helper. The helper prints device name,
> >>> IRQ number, handler functions, and error code on failure.
> >>>
> >>> Since devm_request_irq() is a static inline wrapper around
> >>> devm_request_threaded_irq(), it also benefits from this automatic
> >>> logging.
> >>>
> >>> This series removes the now-redundant dev_err() and dev_err_probe() calls
> >>> in dmaengine drivers that follow these devm_request_*_irq() functions,
> >>> as the core now provides more detailed diagnostic information on failure.
> >>>
> >>> Pan Chuang (26):
> >>>   dmaengine: fsl-edma-main: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: fsl-qdma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: loongson-loongson1-apb-dma: Remove redundant
> >>>     dev_err()/dev_err_probe()
> >>>   dmaengine: mediatek-mtk-cqdma: Remove redundant
> >>>     dev_err()/dev_err_probe()
> >>>   dmaengine: mediatek-mtk-hsdma: Remove redundant
> >>>     dev_err()/dev_err_probe()
> >>>   dmaengine: mmp_pdma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: moxart-dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: owl-dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: pxa_dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: qcom-gpi: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: sf-pdma-sf-pdma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: sh-rcar-dmac: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: sh-rz-dmac: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: sh-shdmac: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: sh-usb-dmac: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: sprd-dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: st_fdma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: stm32-stm32-dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: stm32-stm32-dma3: Remove redundant
> >>>     dev_err()/dev_err_probe()
> >>>   dmaengine: stm32-stm32-mdma: Remove redundant
> >>>     dev_err()/dev_err_probe()
> >>>   dmaengine: sun4i-dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: sun6i-dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: tegra20-apb-dma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: ti-edma: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: uniphier-xdmac: Remove redundant dev_err()/dev_err_probe()
> >>>   dmaengine: xgene-dma: Remove redundant dev_err()/dev_err_probe()
> >>
> >> One patch per subsystem for such trivial changes, please.
> >
> > Yes pretty please
> >
> Thanks, I'll merge them in v2.

Did you post v2?

Frank

>
> Best Regards,
> PanChuang
