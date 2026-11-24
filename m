Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795550881;
	b=mIvlc6W9GeJ5PI3sGsS9RJQAOi/9VOnJlAt242l3YekRV7zGvVdnmdmk6ans0n7Qdcoq
	 42wwGsPUeaE7he9eaL3rIaIDIR1h6QQbVCM0F6jxDXvgAIjmDJj5HcoxXOV1d/HPSLpRC
	 nTtQiwWjLDeQgXNBVnFoslZ+ZCHtA/w2sc3gg8BZ9iSxpiC+eppAy38vja8eFSFnh+sxP
	 KyPYEQgE9R9NS4JmwH7IbeegD1ug041ANrKbueC3Du/lF2IgMazlAgODv22GaGft0aGaa
	 k3+GDvLGXke1xb7TadXFaenEVnqxKLAUZL/V5OMZldMIybpqwac4Dv+DgV29erMCEsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550881;
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
	bh=PzUMsOWqv2KflZxlxCUcnvi0KWwUa4H7CNQwM3ltAr0=;
	b=OhcVjZWmna/zk2jRHYZc2b/tEhCYDP4lq/JTZz88oR8twCM08GrNFjiUezm/f4VVhUXC
	 LALBQck6Gt97lMf/ITGmjt0C+cy29HIX2omhqGGswoUkrWJT23vyhzy7Dms1R0lfQJLqA
	 H5vm7SCxXYEUV+LtLEBo990K98wauwKAFglY8NDLjX+fbe8kXrGFUAUorZqQcvGhyeEX7
	 x0Pb3e08RDaQOILcjjzSZO9keaDn6e8Sz08OG5NnsG5HRNINW1SDQmnDJNkzYsGQuFNI9
	 jr3tOK8dGEcZsRZMYE0+uiC1dVrXdkjQUvTRjmM9g8mBgGqGDa+qcpdRt/sogpKjydQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HMjwcuhM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F5C606A31E;
	Tue, 24 Nov 2026 20:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F5C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HMjwcuhM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fm1KCnkN1+XVWiJ2jOI9lClXNr4nDBXtt8L48Rl/Qr5YARIUAFd/9s+LtumchM+ZuWyXK0SAxGuijnJiC/NHwpAFwwYzHdh99gFeY/cW/ajPvYGKF9MZcsl3aAQF/Q4A8qqUl5Dbr0nSG7iBPjH+mp+i6YOEIWWQwJWJpyU0gz8a83CBDzi/x8bzbkAEhETCSuE6stG64QqcUHA2wpiUtLIVicJZzCWBVV/XwfexfgyiKYdxyMDtGtgng6Bn+rUXuvIXbwg3ENvOiqEK8bz90Wi2LfRCh/z5Z9rJhoY6gIlkHw3Y+TxgsNMQuyUEbwM+K4RG0FsZumgs0rZSKroD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzUMsOWqv2KflZxlxCUcnvi0KWwUa4H7CNQwM3ltAr0=;
 b=QmKBhWqFAOM6Gd57AhEpi26WqsU+ka1BOQfnoMeG7UhYjp2pLXd+rMmAHKJQjSUn6eiNBhSwR4TsHCSE2ikAfGiJXDVFLQei9kf7mJIH+k52V0jQa8/REhZj9ua273v0qfrLMhAcwE2nqOHd+MS123oBOGbh6SHIbLUeEbKwlXQueagFzbYaulbw4miqtsZMugQZbYfwKGPtaPwAIb5h2wG7gb4Xdee9uN0O3mzJo/BD77rGuNjJgSUFsnHET4BKZ96NihA2RU7u/SEpG1QtlB5tBqja5ZerF78LqyTDEc3I+qLpam3UbRiLOGt/dsNzFtiZeXNNQpTop43uNXSY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzUMsOWqv2KflZxlxCUcnvi0KWwUa4H7CNQwM3ltAr0=;
 b=HMjwcuhMSSsmqHSsZ6YRrxZ0FXyhylRGbGlYvmvjWIQ4XEhCW1aZAHZOBgKL9PCbbdmp4RqFCt6mA9gxgqo9lnoPgCahsJa13zV4i2G8X6erAVzYy80wHHKFL+ELS9VbhMrXEMxZ0Z0i6zP5CpJ82O/TQVJco7cd57lJikXQTHtvlCi9diE3/ssYufnH1/47D2hoiFYZ06ZCDX/+3TT89vfPkci4CpSvNJ/GS3EA6jN/KVH7tyT3WH68z5xNugbsdwbqTdgencvABsr6hmWCMifuV9FilM2NRw2BBvfsL4h7wPQiWigU2iGXDrrodKRstUHKxm092+fBcXbDlGd6hw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 20:07:57 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 20:07:57 +0000
Date: Tue, 24 Nov 2026 15:07:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sheetal <sheetal@nvidia.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@kernel.org, mkumard@nvidia.com,
	spujar@nvidia.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: tegra210-adma: Make Tegra264 FIFO size
 explicit
Message-ID: <awXulkfUW7rvYeFe@lizhi-Precision-Tower-5810>
References: <20261120050254.1343679-1-sheetal@nvidia.com>
 <20261120050254.1343679-3-sheetal@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120050254.1343679-3-sheetal@nvidia.com>
X-ClientProxiedBy: CPAP307CA0010.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10511:EE_
X-MS-Office365-Filtering-Correlation-Id: acb9dac5-2b32-4a92-cbaa-08df4a66a1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|19092799006|56012099006|11063799006|10067099003|261028144727099003|261102123227099003|4143699003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	67O3qmuIN04Pf7C28H5DZz+S26FKjj1Sn+DxFYz1n5MVEpJjGVWPRtuvhujpluvE8Ov/lX74iYDkKQ8osQNy41l+nuu/rA5jwBLAbERh0ipwVy+oY7YDQBGoM47uT/ICspJqjY2AVdvH2Kn3M0NB8eCrrxiLT59BJRsBubFirCAWK4cQip58ofJzhz7ov9IRhsyaW5iHSMMfaZn7WbDdL9lJGxFCG8QMxDwBjLfcyAlpe1VhPiq4BzJ1A5Ndro+mS1IsQGssOyhH0DKW+9gIPN5IuhwBp2Cj09XEip/8IPZALlamgSYdYAgagP+zL/mFrLLzkt6LlsZKPMwUfarjQrTLIsWUb+1IBzXEoq3dpWC9TJdfgVMVj9CDK5Cz+EDzzKL8ShIfQgG6JtYX7tDYEqz6zQJOcnhfmWhX2ENY8KWEqdJE1Mvxt0lT9DlrQXl4VXegzV2AK7DRfGA3Q2p67USg7mnyxj+wS1AO0BRYXV7Lz1sEuno/K0EMPKa6YH2N01FD0zJjkZomLq6ENxuhysNm5Ley2gdAYW+/O6kk+Ma4YriUcfouKU8EbPXaKOXR3LtZNbPZvoBtdYZVgKWgVIVVzk1ai0LShJaazwMADwvUAaTJM2PRds3XeVoYSZ/6Rgko71/fjk2yqULlRVf5w4DIr5OyQPVkrgOJ9bPdO+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(19092799006)(56012099006)(11063799006)(10067099003)(261028144727099003)(261102123227099003)(4143699003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yRh/5pXNE4Tr+oUYxBOiw5OzQONswu3NokC712k/gXskEb9Ubr5dj2yeUUVF?=
 =?us-ascii?Q?JMBLv+MzC3DkuQYYdPtQSh6tfTjE5kp/IKAz0sDRkPYnsPUBUWzQBHoaI+go?=
 =?us-ascii?Q?f5XbcQeSfZcXvAGJW7iKghq96DeOzTUD9M9NBCJHkvYG4I/TxP2YNedk2uJV?=
 =?us-ascii?Q?z/TFNHTp6G9FpQsZlhguEWFGf3+ptXDa2y4B76YJ5nWDbg+KgtnUc66Yr6gp?=
 =?us-ascii?Q?qLfVjHoqG1hV7B3yf1srU4fCjXT+YHqtwlwDwObSiS9KtolN0Ak+J/Zqzz6n?=
 =?us-ascii?Q?KUHtXZfTns3icK5tXbyHe4th1pZxOOhuPvMdn3G12tiqZcPRMbD5tIBFNU67?=
 =?us-ascii?Q?iSJFOnCP3CFk/rmuZ+BI9e2L8kyxN0ObX/h3UuRg8RJloT8CkYZqG2ZVZDPs?=
 =?us-ascii?Q?fmp6Yl9yXyw8/CvGk4e3WzE8KqP3CfEKwG0OeIxdxghfsqABwW0atiSFIPPH?=
 =?us-ascii?Q?Eq/R3+NbMfO/cxgaJlqObNj0kL4U6rx2e27ptuOAg+gupz7ZCJ28/LvRnV84?=
 =?us-ascii?Q?UdiOB//zYbXH0cqIQJ6jJpf4mjOzkoLfV5GrJKWAKkAItB4BZC/urVZnbjX7?=
 =?us-ascii?Q?4srB2zntk3Jr+vJMgg3sRUDw8wNruHmrsjDch9xEDpUBsDU3lb5HMZoUhXQA?=
 =?us-ascii?Q?KWfNvD9HccHNP7YJl3mppk1WSPTKv8EHB1m0lOsp0sMf5rPGBRj48+xWW8Ak?=
 =?us-ascii?Q?cvmN09Fk+Tbn/iWVRPj8L+u3JfAp8k/Nwqf74pXkt97O/NK664pHO5VF8zzM?=
 =?us-ascii?Q?l66YWoI1EoRHHlqoWI9u9ByJGy8RbzHN29Fwi2zqT9F0FZz6BOhALkoSIpdO?=
 =?us-ascii?Q?VJg5nWUqtx7ukkKF87V11Fy7i2ILaYYPd1CZt8SofNvzzClXihK+IUI2WWJq?=
 =?us-ascii?Q?xWqA+IP5wkEPBCaSCvUUgLZPYp4NtkLWIkfWjSPggea4/CdHKGi/f5Gx6x30?=
 =?us-ascii?Q?6ToQ0koaO5bQEfnB7OLKSkxyYmjq/jS8fKEpm+WLILdVhLUpk3gYl08c6c57?=
 =?us-ascii?Q?V/lOcymwtfUOsTPrFr5dFZz2ST4L1CCuSKFSZvJRhvCnJeTcq1ld+nOKvGaG?=
 =?us-ascii?Q?1Bvtss5kLBz/Gu4yDIbsj/reMb6k5k0TAWMhzneqtc4WdLBrViBuDJ/Sp9AF?=
 =?us-ascii?Q?gD3EHgY8guk+OdccWIibTVlhRu3q5bf07Am9iCf0PdI9Az32zJS31kKAIZPI?=
 =?us-ascii?Q?Ejtvn8oXiaUq3Hgas4t6z+hJA4C2uwsL5TbfUl5JOHKxR9hLVKiv1LuN6h9t?=
 =?us-ascii?Q?KSRO2fzqiWa+LfdACCy8SGsUurQpX9rfy0zdyWEiIiEGJyzJazsajy3SK6z8?=
 =?us-ascii?Q?k6SP9oh3L6OUk4LViOmpsFqKT6fqLpVNA0Dmwk0caSC1ZWwiaMbuJr/InL+M?=
 =?us-ascii?Q?duac7fSWmO61rnIt0O5Jpq8si2yyb25MbvIWjPmOXPMHXrcWC0vdl0iMTC1N?=
 =?us-ascii?Q?yckCPemudBwSq8Zu6597KWCdPk4cRsattxVLRjho6nOXCv67joClz8DLA0aQ?=
 =?us-ascii?Q?+fPhKfpqivYqKIHZjuCZ8MxQVlVKaGlq2y2/yOUi+CM56Ur8oCFj/CVZFlXE?=
 =?us-ascii?Q?lkpfr37yup4BF8cYIqfA0c6APd079PrFbNoniMXI4NFE2DiOSZ7aRQi/govz?=
 =?us-ascii?Q?nX7K7TBfiH0OEHtfr3r0VM7pAobsndiEQ2fpcctkzRdpBdO+Mgxfqpg8EPRO?=
 =?us-ascii?Q?NudWxexyX4ldX4N/3oV4+V5POtBWWaGVK9lpGHaYwnRhvYfB15hwW9SmTqH9?=
 =?us-ascii?Q?vS/mPs7FX1N27mpN/a52RffBUE+k1XblKnJV63WQB9qpEUD4RTTN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb9dac5-2b32-4a92-cbaa-08df4a66a1ad
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:07:57.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP7gMLHcbIxd9EY6CcMYmqbOS3zCPKtIP46s5n44VhHmx2RbarNr/DXIReFcRjIbcqT6f3PxyablyYldRsAaCxdHtjamELf/mA/Ci64+pabe+flnYUCATYpdxd6cSUnK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511

On Fri, Nov 20, 2026 at 05:02:53AM +0000, Sheetal wrote:
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Retain .sreq_index_offset = 0; omit the unrelated cleanup.
>
>  drivers/dma/tegra210-adma.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index 21a381d022cf..2640ea7d6ff2 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -101,6 +101,7 @@ struct tegra_adma;
>   * @ch_reg_size: Size of DMA channel register space.
>   * @nr_channels: Number of DMA channels available.
>   * @ch_fifo_size_mask: Mask for FIFO size field.
> + * @ch_fifo_size: FIFO size for devices with uniform channel FIFO size.
>   * @sreq_index_offset: Slave channel index offset.
>   * @max_page: Maximum ADMA Channel Page.
>   * @set_global_pg_config: Global page programming.
> @@ -125,6 +126,7 @@ struct tegra_adma_chip_data {
>  	unsigned int ch_reg_size;
>  	unsigned int nr_channels;
>  	unsigned int ch_fifo_size_mask;
> +	unsigned int ch_fifo_size;
>  	unsigned int sreq_index_offset;
>  	unsigned int max_page;
>  	void (*set_global_pg_config)(struct tegra_adma *tdma);
> @@ -725,18 +727,28 @@ static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
>  	 *
>  	 * ADMA FIFO size is set as per below (based on default ADMAIF channel
>  	 * FIFO sizes):
> +	 * For Tegra264:
> +	 *    fifo_size = ch_fifo_size
> +	 * For devices prior to Tegra264:
>  	 *    fifo_size = 0x2 (sreq_index > sreq_index_offset)
>  	 *    fifo_size = 0x3 (sreq_index <= sreq_index_offset)
>  	 *
>  	 */
> -	if (tdc->sreq_index > cdata->sreq_index_offset)
> +	if (cdata->ch_fifo_size) {
>  		ch_regs->fifo_ctrl =
> -			ADMA_CH_REG_FIELD_VAL(2, cdata->ch_fifo_size_mask,
> -					      fifo_size_shift);
> -	else
> -		ch_regs->fifo_ctrl =
> -			ADMA_CH_REG_FIELD_VAL(3, cdata->ch_fifo_size_mask,
> +			ADMA_CH_REG_FIELD_VAL(cdata->ch_fifo_size,
> +					      cdata->ch_fifo_size_mask,
>  					      fifo_size_shift);
> +	} else {
> +		if (tdc->sreq_index > cdata->sreq_index_offset)
> +			ch_regs->fifo_ctrl =
> +				ADMA_CH_REG_FIELD_VAL(2, cdata->ch_fifo_size_mask,
> +						      fifo_size_shift);
> +		else
> +			ch_regs->fifo_ctrl =
> +				ADMA_CH_REG_FIELD_VAL(3, cdata->ch_fifo_size_mask,
> +						      fifo_size_shift);
> +	}
>
>  	ch_regs->tc = desc->period_len & ADMA_CH_TC_COUNT_MASK;
>
> @@ -1018,6 +1030,7 @@ static const struct tegra_adma_chip_data tegra264_chip_data = {
>  	.ch_reg_size		= 0x100,
>  	.nr_channels		= 64,
>  	.ch_fifo_size_mask	= 0x7f,
> +	.ch_fifo_size		= 2,
>  	.sreq_index_offset	= 0,
>  	.max_page		= 10,
>  	.set_global_pg_config	= tegra264_adma_global_page_config,
