Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794518080;
	b=z7TF1fAHlj3gO5NrwhX1N0ra+p6loqoXFoUZCQGaJ5WYVXqLE1eJO1nptX/x0DeONCCt
	 KuhlK7bHCBt8f8HQqGmNXyA6pOX7Q+M1SEjvOwZmWky5es3wH4OR9MveFLEP4P0jnspGl
	 NyH99YKnPAkVS3q71qUc4S1d87XFmlttn9vzhaRYOlpQNPJ5InjtppE8LORJBi6s4Bg/U
	 XU+2UheuAzjyAXDcq7QG1XDY97rRM4/asolfOuvXvecLF+0exCwdNKmJLxoXSDHTrK+Tr
	 uo1UWoXGCYfHXHcoXToZSAY1XfDkO5YaPnhU8vtRfc2yFmDHUMLCy/LSIBTi17pyEdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518080;
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
	bh=TR0QQFyoAiD893Ky6AW4pYiB5WMlI1Y5GEI+ntijvyg=;
	b=ZeSHMiGTSa1s65HgioRKusQdCPC9PiIe5aXdST22mwCQmTdyb3NiZftP5acDeQXxgVvU
	 LJwo3Fcy1312DGKX2OGHfHRTJx7No6KvW6bq2WbjafAzPSmWFyYO7r9O9eB5ri+JV09TZ
	 UHL5QUcdBfTlc8CBVAq9ehIMCprIqcOk5e7CFp1AeCRn9AeHJqZlY4a/OmBdczZllf7hO
	 +wkFuIr1plxwweihFeY4KyRtoBRvsNra9Yve0V5osembV6GrHoSyJtgq6nBQXKV1bJCcF
	 hF+r5JenVBrNx/X7mpl7dWy0WNLHCgRznEkuhTsxtuI656khBbwhHgzsSFWAA5+kFpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qELu4JUo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.22
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E8606A31C;
	Thu, 12 Nov 2026 21:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qELu4JUo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcaPcqB13MsygtU7W5Vk+ck/DrbOJ11SJxWAAJvO5cSOYQBqMNNSoGD3jHQzTv18u8dQASUlxczwdemCENalYvJ9Z+IKak+yiZPx8pPlSHeCV57goLvWpmCT2a92VVoVy3W9MW4KI26Vy5Tiy5lLBPUpuz6k2xkXF0d+6962V/E8wp+9aXRjT07o1mmHCQuuEg+rYVo6lZVQEcSsxCPckTWfxfbCsH0LOyp+RcfDVBZ1IGPWQKEmgyEEFyLLNRg+rB94quDdJeRghzhs7K9R5KY4gqj1KwbYsMo8JuCfZRCWemHm8btJMRmojLpaw5oet4jYSugN1mqHyKsxFKZHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR0QQFyoAiD893Ky6AW4pYiB5WMlI1Y5GEI+ntijvyg=;
 b=aAKr9xDIBw3cQEn9oU21xTEKiR9G0G8zrJ4wegXjbbf2T629wU/+Di3AzXXU/4wibmLVmQPX99odnCkpRnFIPlCKTZocr5CyErf6PBmuqKF6wtFzK1SDJqjYGCi4X20KqMqCPTWZ4+kr1nMfE5sXTRjxRC43m0xkCl4Vb8XKbSMY0RsSKmRfXEzgusNLZjVyipTuaUq2Fq7OyfeK4CPM20TcxHiqx0ycoqT4nigWsgJp+vR/DjkCDqAjkMXNsmhvqAPdcuwW8YnZwpJWF2lL+ACpDdTBJF7vfDpJAm8Ht6R3lZbTEjp+fRds2VnTim3JC5mzyKNSTiFhDgUNZBTQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR0QQFyoAiD893Ky6AW4pYiB5WMlI1Y5GEI+ntijvyg=;
 b=qELu4JUoQRv8C7e85LiKBTijrG1w+ouoNVZlZihwlag2hGc+/85rojvPhcl5Iigk72V1k94kJ13zR/l4NAIFkIuveMFbbHwOhK14ya0DVK/hhO2744xdYyEdfdDzBjb0stjk/xnXqNsNfyooGkKLwqu8d2Eb9Jn2Lf4d4AvPqJGNgvbBIR4LAVrfNvtJBji8VO4pJrnTJOsewReba4BMZ8FH2Fa3OE8GCg7zBQNTE02YBja6mnXnbcVVxgIzevUt5OidtGhIAtCk8qVPHtG6vL7Ep+RHWuRuyCsmXPn/RFEMzycUfwDX5CYFMjz6nQOSpnooRwjn6P7PMA6e+3522g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA1PR04MB10180.eurprd04.prod.outlook.com (2603:10a6:102:45d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 21:14:36 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 21:14:36 +0000
Date: Thu, 12 Nov 2026 15:13:58 -0600
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
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Subject: Re: [PATCH 3/3] dmaengine: tegra210-adma: Add Tegra268 support
Message-ID: <avYsFsaNj_1_sb2z@SMW015318>
References: <20261104110932.1097294-1-sheetal@nvidia.com>
 <20261104110932.1097294-4-sheetal@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104110932.1097294-4-sheetal@nvidia.com>
X-ClientProxiedBy: PA7P264CA0540.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA1PR04MB10180:EE_
X-MS-Office365-Filtering-Correlation-Id: 5036670b-7e09-4227-df3c-08df4101f47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|23010399003|22082099003|18002099003|6133799003|4143699003|11063799006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261022113327099003|261022105027099003|261021121427099003|56012099006|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jYrYfAbksqyHsuGibdJmO72jQeD8UY8YKGmdk1Aj7TURjYO1KnX6OQEoIYH14ihcY30v+HLUs/M75ETjhiyCYaE3yx9+/+WHsVY8oMn2F/2inTMtaM1mTXbHG7fzJdbOqnaYJdb621OILTLEJTcHflNlQyEpegHRst7Qi1k45kuQsTlMCvYYg6UZVqjqViLd4nI7zop5T3TTxvwypOLS8jV0QQ0PVKnPZhLBshpcUzLKqKMNPDQiA6B58s4sbiaqFHGBtjxAjG1Cw2B2wXJ0LixR/UT79ASJ7qO2dhdZTB7imBiMW5uWtVAH9p+d83BSeKET7oiiYWVteb5znzhIq9Aj0eYP+J/nDGntctIx91FWGxH5xhtszc/e5yK40mum9lF7H+K4ikce+JJAkZTsByU5WLkEVkCmnioumZw5YKHqMfBzShS21yBddCICH58P8w2gM1eZyzmBHAa/60r9T/mdU+EVxk58RAJK1WPk3o7EVMTKOZfyK+Y0SvIP9Uw8KH7r9xM7nnkHuZuv4ZpcKqRSHyPTaqvNaooKXxf5UXhUKUx1Lz4o/WtNqOHq+vpD3NsS6C57btGki1IA37VmcTXm5Fo8fDsFwYuONkhPST1019cJvAeD8cO4093NQ7zVKoMQJj8IslWrzFNthd9KNDQYHtVYeV6NPpsojNDL/sQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021121427099003)(56012099006)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sB87MscMxJRMyAHGxmRgvtD1LfvlbgArAtJ4uhIJEqPM/bXyTclmFKYpsvy1?=
 =?us-ascii?Q?ZA4W1UU7b/O05me34ghy6M2j7eNM28JAi5kWxrjr2lKGm6URI02ngbA4p3ZU?=
 =?us-ascii?Q?Uklmcv8+Harud8zptPqiM3xpPrnUKPZzOTZqQhsz9hzteqrl9B+l7T3vFk7B?=
 =?us-ascii?Q?ha5N+Q2yVldaojKdvbsQmN207iSpmmkPzBacJnxX7ObKih7v35TtEwU0L5pY?=
 =?us-ascii?Q?TKDVeuwEmfIsEXPoAQfThEu4zWtOc3o8d74LRGIoqtkFQTvTG5U/BtgAgyAu?=
 =?us-ascii?Q?K969HVJmiPnVisTMZQKIfGJ5ixuEGx48e9edpXHYFyG94vS84/2LQ1l8m0i1?=
 =?us-ascii?Q?WSj3Aj9Rluer9CNOL8SLy7uSCf9st51nqAXdmCSKC7j/drk9j4cB8vPoTUqZ?=
 =?us-ascii?Q?Iuu5IdUbyjLaJA6uu/k2eFsP2h77M1nTsSkmLcQBU4daqJzrysrNYwjwon15?=
 =?us-ascii?Q?2+4Elw7dgXwVPbDOLiK4T9Q9xliuhO5KfdcYq64/smWbb7L8YoaXUMGIrg3t?=
 =?us-ascii?Q?jpYLUJKcU+k+GBHSpmIBf2pRU/v6rqi4J/6cUDNdiYwugZf25iFrDTeqK4zW?=
 =?us-ascii?Q?M6rE8peygbbCvg+WPnl4JuX0FmPmIAxVN3D/F7cUYiebuGCds3+8zOi9mMXc?=
 =?us-ascii?Q?x8DyArwY8pabDav8M9RskJBNCdZPNimHH1L50/w5u8CYm7ct/P5vw18GLfQ2?=
 =?us-ascii?Q?q3J4jTvcIvqEphbqOKctUOrzEuwvBw1l3esefGmeoLWmEV+UgV4KLqFeIx88?=
 =?us-ascii?Q?4nbbU9BlC/fV9cOyYJ4njRtIC35UuV4rxD+5fc2SIfn//xV42kX2ZVHrJC1B?=
 =?us-ascii?Q?tg+0O5t1sHvSiA2u9fm2igq9ufkrtDCFMaZgsUpGsqwUuEbkN++Em9AMJZzk?=
 =?us-ascii?Q?XV40SwKx+D7GSbKfIFY64a4Mx2BBIPCBPBkf1vWoN1cq5yWDhAeyWF25IKGv?=
 =?us-ascii?Q?tSjfBnApMmC2r3H9r27pPd2Qds+JkZrSrkp8AU/tYUXalUK3ZfVi9FPNCB0b?=
 =?us-ascii?Q?s0jSIH65+qCF/jPilQGmqPh0b+P50eJAT1ynt1lqeZFI2X1WVJSKZazfhxBD?=
 =?us-ascii?Q?so3J5osiHYjyiOI9BCVBoxgr7cxrWudVqqbQDUYzpLVC1XK2dFE+9ICqq1PV?=
 =?us-ascii?Q?NhfIt0Y+Xge3KNXL/OxVAcXB5BNzPyIs4rpXeXoLLSaxn38MGYk04KeYP3un?=
 =?us-ascii?Q?JYjBZbgLOI6l4R61WM0Y1Cm65qhKiflu0Vt3Hk8g4VAW+KCMQlGrnAWEDkuY?=
 =?us-ascii?Q?JyvIN31lA/Xf0aBTpeBzZfrPye6PRxCTT/E11AgsIRxhoVX0mNpAjrVhpvvy?=
 =?us-ascii?Q?jgPdNziX+wRARUiJAyoujEDo0f6FSnnRk1cBewmCsFG4J7QTkYCmRo969OFg?=
 =?us-ascii?Q?GlMQyVMyKiqCZJzXxVz7uvVgEfa1iJuQOMlPEpkNL9vw8NA89Pbs3OKolMA5?=
 =?us-ascii?Q?qtygYpHJLDB4/4uFPsXZahyaDAKteU+mZVGa+PNtzkwKJdba/MX89KcApOm1?=
 =?us-ascii?Q?475vRBEZ04jcCntNQB98aGVk2YueGFeHDXO1mqDPLqKroBEV49V6eob7VWjA?=
 =?us-ascii?Q?Ou7+xqyBinFqp5GauOvuTHbL7E1XkR4Bau5S3P/VrSZDyEb68zFfmBYC9dML?=
 =?us-ascii?Q?eoqkyObddQK4ceCZNX0tZ/EbIqb/BRPqsw9/IbV9ognm3N+xaENdBBk2ENaE?=
 =?us-ascii?Q?/EBFZGzasMM51Nn1wHHPwaNWPzIo+h8ys4m8fj7c3RXi0vYjF3bc8TvfqvVc?=
 =?us-ascii?Q?q8haK0lEwpXL7axMSmTk5rLy9fKaZJypi0tNQdsgXEqxOBRmQLGY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5036670b-7e09-4227-df3c-08df4101f47b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 21:14:36.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5axEwYADBzpgiDm4xB7/Br+x6ypEWqsg+Pl6prB4hZpe2aYJ7nOuFYqus5L4LYDyuHhvEUrmEmnIliU8HHi21a8WKmFs08/hcgNd6//dU1phSWamPvsyoso4lOZzLmTs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10180

On Wed, Nov 04, 2026 at 11:09:32AM +0000, Sheetal wrote:
> [You don't often get email from sheetal@nvidia.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
>
> Tegra268 has 10 bidirectional ADMA channels to support the five RX and
> five TX ADMA interfaces exposed by the audio processing engine (APE).
> Only DMA request IDs 1 through 5 are valid for this device. Set
> nr_channels to 10 and ch_req_max to 5 to match these limits.
>
> Reuse the Tegra264 register layout and page configuration helper.
> Derive the channel and request masks from the SoC data so the helper
> handles both devices while preserving the existing Tegra264 register
> values. Keep request bit 0 set, as in the Tegra264 programming.
>
> Add the Tegra268 compatible and SoC data, including its six ADMA pages
> and uniform FIFO size.
>
> Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/tegra210-adma.c | 49 +++++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index 293a1119e07a..2d9dd41141cd 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
>   */
>
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -279,6 +280,8 @@ static void tegra186_adma_global_page_config(struct tegra_adma *tdma)
>  static void tegra264_adma_global_page_config(struct tegra_adma *tdma)
>  {
>         u32 global_page_offset = tdma->ch_page_no * TEGRA264_ADMA_GLOBAL_PAGE_OFFSET;
> +       u64 ch_mask = GENMASK_ULL(tdma->cdata->nr_channels - 1, 0);
> +       u64 req_mask = GENMASK_ULL(tdma->cdata->ch_req_max, 0);
>
>         /* If the default page (page1) is not used, then clear page1 registers */
>         if (tdma->ch_page_no) {
> @@ -291,12 +294,18 @@ static void tegra264_adma_global_page_config(struct tegra_adma *tdma)
>         }
>
>         /* Program global registers for selected page */
> -       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_0 + global_page_offset, 0xffffffff);
> -       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_1 + global_page_offset, 0xffffffff);
> -       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_0 + global_page_offset, 0xffffffff);
> -       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_1 + global_page_offset, 0x1);
> -       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_0 + global_page_offset, 0xffffffff);
> -       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_1 + global_page_offset, 0x1);
> +       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_0 + global_page_offset,
> +                  lower_32_bits(ch_mask));
> +       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_CHGRP_1 + global_page_offset,
> +                  upper_32_bits(ch_mask));
> +       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_0 + global_page_offset,
> +                  lower_32_bits(req_mask));
> +       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_RX_REQ_1 + global_page_offset,
> +                  upper_32_bits(req_mask));
> +       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_0 + global_page_offset,
> +                  lower_32_bits(req_mask));
> +       tdma_write(tdma, TEGRA264_ADMA_GLOBAL_PAGE_TX_REQ_1 + global_page_offset,
> +                  upper_32_bits(req_mask));
>  }
>
>  static int tegra_adma_init(struct tegra_adma *tdma)
> @@ -727,7 +736,7 @@ static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
>          *
>          * ADMA FIFO size is set as per below (based on default ADMAIF channel
>          * FIFO sizes):
> -        * For Tegra264:
> +        * For Tegra264 and Tegra268:
>          *    fifo_size = ch_fifo_size
>          * For devices prior to Tegra264:
>          *    fifo_size = 0x2 (sreq_index > sreq_index_offset)
> @@ -1035,10 +1044,36 @@ static const struct tegra_adma_chip_data tegra264_chip_data = {
>         .set_global_pg_config   = tegra264_adma_global_page_config,
>  };
>
> +static const struct tegra_adma_chip_data tegra268_chip_data = {
> +       .adma_get_burst_config  = tegra186_adma_get_burst_config,
> +       .global_reg_offset      = 0,
> +       .global_int_clear       = 0x800c,
> +       .global_ch_fifo_base    = ADMA_GLOBAL_CH_FIFO_CTRL,
> +       .global_ch_config_base  = ADMA_GLOBAL_CH_CONFIG,
> +       .ch_req_tx_shift        = 26,
> +       .ch_req_rx_shift        = 20,
> +       .ch_dir_shift           = 10,
> +       .ch_mode_shift          = 7,
> +       .ch_base_offset         = 0x10000,
> +       .ch_tc_offset_diff      = 4,
> +       .ch_config              = ADMA_GLOBAL_CH_CONFIG_WEIGHT_FOR_WRR(1) |
> +                                 ADMA_GLOBAL_CH_CONFIG_OUTSTANDING_REQS(8),
> +       .ch_req_mask            = 0x3f,
> +       .ch_dir_mask            = 7,
> +       .ch_req_max             = 5,
> +       .ch_reg_size            = 0x100,
> +       .nr_channels            = 10,
> +       .ch_fifo_size_mask      = 0x7f,
> +       .ch_fifo_size           = 5,
> +       .max_page               = 6,
> +       .set_global_pg_config   = tegra264_adma_global_page_config,
> +};
> +
>  static const struct of_device_id tegra_adma_of_match[] = {
>         { .compatible = "nvidia,tegra210-adma", .data = &tegra210_chip_data },
>         { .compatible = "nvidia,tegra186-adma", .data = &tegra186_chip_data },
>         { .compatible = "nvidia,tegra264-adma", .data = &tegra264_chip_data },
> +       { .compatible = "nvidia,tegra268-adma", .data = &tegra268_chip_data },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, tegra_adma_of_match);
> --
> 2.43.0
>
