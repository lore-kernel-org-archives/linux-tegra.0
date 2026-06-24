Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA45E2F7F09;
	Wed, 24 Jun 2026 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782324564; cv=fail; b=GhQPNuKsjsSfV9BCuAoq61RjJq2w7GKUimoGy3W7gH9+PQRATC3T2H5o7znBWAT293XiH3cxuoGEzVzxd8RpqLobV3/MvCEc8joqbTzsEVM68AZjWbAWPHpnhsRxz+lQGH1dpsWs7RzZ+oGv08nmhh6kK1lUdJ18vafEW5PDCOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782324564; c=relaxed/simple;
	bh=2AxRXRt0c3IyOwJ3Zngrjduy50yzbU5wSJDOiv31siI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ebuxOAsRKtt4lUj84NvRNCkR+7ujNPLNdcOzXrCT4nCuKtMyATPAHHoa/NfrYca2qhwk95obJlFhLGLQsqsGsq3BTMTs4p6y8x+wXU5524l32Kd7b2zrvIc/Z+extTqusz/qXE5ghvGDbbiGX/bcKXLJB7vMd0YJNtrRMMhlPaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qzyZDDSX; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qzyZDDSX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRDlt3I/yfiNFkL8L2QoujXbk3tzP1igC//q+g4G7HzqhI/lgf1k9rmNVNLt2zqZ+QphcZLlbMLHP10Qyy32/Ka5fy/hsiClwJIuSgkgAkdQBucqi/eiuJ9dzto22qb8moYgZjXjhO6739H06RZhdlcHKABgQ28LWDgLiC1EfyXQju0EfsXr+zmgmrVGxwspaIzrFcQAJxDyKHKrgjcQUUWyHqom982LCGvs03zk2r0+gELrPDL679CLWKUDU/W5l6BJa4jeVyRp/RYNFn2f6MP5t00Wo0+CuIS5gqwjkbLTN8aQ6l5nItAPeEDxX98AcOjQQrHval1C9utsO902Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6hD1dsJa8NYYyd/LdUoy6LsgAYHPy0CEAYK5slR0xY=;
 b=iJL7i0uz7WmhZROd0GX3IAQNnv6M7y3ql/YJHHA0A7FKldFLXmrey9MzDokLsyXUx57wBV5YeOF9bgqJgw0nOdkiRyDnck6tznRAQHKSOiBQ9eqlxOIsKN5hJOe8z8t6/XoUfZK7F52X1fa09MZnr6OrG13PZIEizR5KEBE5hTENNTnXDNFekfSskpOsQaABRXKhGA1cTlQLdCLgYN+LkhRf43K6NOj2t+wSln8vPRP29wTgbn0mp76OdSQqJlqSylwuNUhF282iQktr5IuShjHvfHptne3gUGS/5iNmR+nx8+i8IzzKA01TGoVtYf0/a2IGYqVVq9FgB4iP+TX3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6hD1dsJa8NYYyd/LdUoy6LsgAYHPy0CEAYK5slR0xY=;
 b=qzyZDDSXYCKRkCY6ptmvtPM/4+PpXRWzWjBULRpB5J+rKxHKSle0giDbsWLHdmFcXGxhXWYDn7ayPuRtYnktfJBAu4bZJOh0zIsY6WKoyCQNAO4gpVQG7ur7i6JqMsjibk+jtnCLL/aZU+8cQ/4NO/XUYOHIRAgCRBsabuHnlCzwUc9XFqriZEvFK5g51qXkYaCZTBJeqPtSf9/u5H5HTDjNggZ3BrrUQZpm3bM4po+yxuoK/aM3VhJZdJiFStYpC/h3Qe/7QWhu2f2QTrwn6JA5AXsE/dx2evsKqnfPppFrcumFB/28YAlQrBBLOHsrecwgr8+lORSI8ZuFOpDCCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10121.eurprd04.prod.outlook.com (2603:10a6:102:408::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 18:09:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 18:09:19 +0000
Date: Wed, 24 Jun 2026 14:09:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/12] i3c: dw-i3c-master: Add ACPI core clock
 frequency quirk
Message-ID: <ajwdRyiY5M82BqPv@lizhi-Precision-Tower-5810>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-9-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624102153.1770072-9-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SA1P222CA0070.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10121:EE_
X-MS-Office365-Filtering-Correlation-Id: 547fbd86-a18d-4794-7ed7-08ded21bb5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|23010399003|366016|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ykxs9n3ek+KiL3skFvHUXhtJlx/z2gqiD+DBwNv+E6OK5WBZPbHAqACThg3QmPRVUalMXxScC1fHdgY054psL5P4jcgjrwKQj89aSAU/CikWr+6KGSYK1oFX0bhuPX0EqhPV6D2NRV6vRAiv1LsFXSEJOsz0AjsCjE0xl2XxD7iovYMup7ZB77hHNjU1Xw3l0LfX/A8CDH9Pf+OHDbmBI0f2km71hkuoviUMZwCZQdQLKVOHtR9gXIbxJvYWM6oc9IRPAjQ1JUFPCmpdwyW17wCXfzppG87cbipIuqDP9ja+yAGsp4tavZQMRdet0R4T38FW/BtEM72pfenOKfzc0Gt0O6KKhNt1vdKeMTUqiOqokxxqx3iwDZQ9Bd4sQgfXAKhnGfV2w3FtZ65IMQdBNBOvRWC7lslJtKicwYBkJdIiVq8gAB5PujPpCQGFeG95Pys6gqUDGLt9M+dEnpJ34vVfZDa8aMmD+XM5tLGunjIoso4RUlUHKs8JHb6KYaq5tR2zR334gkkX2GIc6jvHy9XLWnnXJJgq/f9VSMQ6oTMc5PwEUodaicU27F3A+1jfzVKJiOwHz6QKDyW/jC+ahIk7mqzmyYKQ1K8WLRGqSmLgVd0cw1BcNjJEGLUlerubNyooAqM9bYw0tz4Tw1qa7nw/zRvKxPpuLzFYRvnzPNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Bd2vqvAG6xIEY1Uk4bOvPHv9pATPOThJvi+6z0BE7UHUgdjIrmYIQoniYd0?=
 =?us-ascii?Q?pcXF5OCKkahMz3eNXo9qCWEfAURpfr6OvTMVPA7yc/XZin3X5213MWGfLw3p?=
 =?us-ascii?Q?YhHRgayu3nMvUIQy4nzY3BWfgtzxuqU6F+r5R/JXQxo7VMlOPerPa8UZAH6B?=
 =?us-ascii?Q?xSuXQQuoXlZvYSFTOfEahR2qjA5oC1IwiTyiw05+jNk4NEgXXHh9SQym8vmR?=
 =?us-ascii?Q?g/eXo0qMavKTuGZ5GhrtLrs7mUIprR/w1NF45Nfwzmh8mXJl3xNQHcg2DEI4?=
 =?us-ascii?Q?ibqlKZA5HlwIYzNIERvaX/pY73nephE3dXKyZt7+ZoaMpCVbrez7eXbXE2MA?=
 =?us-ascii?Q?qpavRIXo0Lmk9OC9eM0ra8GYI+aA1q1cJTaAdGWSVJADHY7X0dfsdUf6+5nb?=
 =?us-ascii?Q?Smzc8ZO9TAql1JS0eJm/jeqAmlyxYBj8MTBJX284v2DffwXLaTmkmlyKiZBZ?=
 =?us-ascii?Q?ZGoJo0vvx0MMw6t6r6iiSpRKXuPeq25wsZUXWXV+4kmdaAJV1aRNVVxJa3A6?=
 =?us-ascii?Q?RXU5GhKuUdOSanLRcXNTKhZOQ5qeC00w6QVYa/q5cdtWbVX1wQZtTfHIUOHJ?=
 =?us-ascii?Q?e37P3Xw/JIyEEYSLFta2vLznSdK1RZ49bGGAFVTLubPSnyATkmivXUVQBbWA?=
 =?us-ascii?Q?QQGkMXvKThA1w2vzhhkdCl7kX/EXWQBQGFsiXeC/0CIZcq78X1w3+pmJXRQQ?=
 =?us-ascii?Q?9wWD7ykrw+9dhY0B8ZVmZ5zEmIvsp6qZzq0G4toSvEOhCrOB8EDjJhwIfD0E?=
 =?us-ascii?Q?5Df+cW1dP4GBrRVAn29sCSCAHy5HsQpkw/+iXjadBxauwPhVZD6iV/Voosf/?=
 =?us-ascii?Q?DHCwsMDqWlIZE5uo99pjyoWNwqnT1zeI0/3S6jSjmOEySVG22DrzHT7RRmul?=
 =?us-ascii?Q?li0ir6VjQBXH4zYCikXH2iLQLJoScDhmyG8zueRrZkSp0wGs/uBKWvcR6zJk?=
 =?us-ascii?Q?gc6QLSts2vAm4Et2kS5XnMz60TEzR33dI//6OVqpeZwpqWNHzLMH6RexK9HT?=
 =?us-ascii?Q?xVuVfmknwQkUASf6akW3VSeT4hL8fXiziz0Er1kOLgiXI38zm5mSUVgDn7W1?=
 =?us-ascii?Q?GZW+th3NvwVxLZ/yOB4Gnu32cv+iSODADA4NGgVg5MA3KSdgGXJ/oLgC+GRs?=
 =?us-ascii?Q?k3ec56pgkLCsY6KWUHbU02kDFZbmMtcao8zuWTA7QRJyc6tudopH9v7APIIr?=
 =?us-ascii?Q?WX7OsL7g2CJ0XaJ3YrMCtgu7u8oCc+Lv/oOtZsq1/cvi508EAu9afEuIAqJ4?=
 =?us-ascii?Q?vYQ/wCmfqzNWODtMldHrVP7xpfejku2Tni45a4QT5VMcvh4m90AJoP/HnJt2?=
 =?us-ascii?Q?TumkPEcTeg3sS5JlSjOm357JeyJGBGQGublQNhzrMGGI00beIWnfqEZaN9re?=
 =?us-ascii?Q?rjqQC9ZG39TaGPosoo2qDMtfRIIMtAJWgbb4buHBNVxLlg7TPv0HbXBqjr+C?=
 =?us-ascii?Q?pBE6QQ7I2wUOrnIFVzQKeWnNna5URSzGN3bMaL6BQNbhII+1DKjSn8ulYFwC?=
 =?us-ascii?Q?/LcDEqUZ5SDqiHJTAVjK/Aa3Z/g6i7ms2VkAsheSQQ1Dh6Z1asmKb0faujhp?=
 =?us-ascii?Q?RQXpP4bZYQZtD/6JDXtAfSYl5/+78w7LySAA9pLlmTpbqH9EIkNf8PvXo8SO?=
 =?us-ascii?Q?XqwUD1AQN37rdYkDoQXihdQws62CbGBG/UrVOttp2xqCP/+pE+/M1XdQPM2d?=
 =?us-ascii?Q?ZvveBm3qWOxEBgRs6B0PqOCqvuVd31sYo1C+pgiIDYCU4eJKrDoVL1Z/XCZZ?=
 =?us-ascii?Q?nZQMQG3OR9dxYOyd5Dy25fxwQamMc647AZJ+kFc89EeRrIVrhxl3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547fbd86-a18d-4794-7ed7-08ded21bb5cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:19.1660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce7ggzC77HsErGi4+1Au04+6ZhIH35B4VkrgYZAoI9Hjiu0KP1nC6c7HyvRhOKIWnnYkOElg278nswazYvfeE9Ts+N5tqsMLSOQaPyrFIMA1HEFryA835nPPGNQ4CbVJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10121

On Wed, Jun 24, 2026 at 10:21:02AM +0000, Akhil R wrote:
> Some ACPI-enumerated devices like Tegra410 do not expose the controller
> core clock through the clk framework. Unlike device tree, ACPI on Arm does
> not model clock providers. The hardware is expected to have its clocks
> enabled by firmware before the OS takes over.
>
> Make the core clock optional and allow selected ACPI devices to provide the
> core clock rate through the "clock-frequency" _DSD property when the core
> clock is absent.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 29030fd9594a..8e40d178d500 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -242,6 +242,7 @@
>  /* List of quirks */
>  #define AMD_I3C_OD_PP_TIMING		BIT(1)
>  #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
> +#define DW_I3C_ACPI_SKIP_CLK_RST	BIT(3)
>
>  struct dw_i3c_cmd {
>  	u32 cmd_lo;
> @@ -556,13 +557,33 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
>
> +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
> +{
> +	unsigned int core_rate_prop;
> +
> +	if (master->core_clk)
> +		return clk_get_rate(master->core_clk);
> +
> +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
> +		dev_err(master->dev, "missing core clock\n");
> +		return 0;
> +	}
> +
> +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop)) {
> +		dev_err(master->dev, "missing clock-frequency property\n");
> +		return 0;
> +	}
> +
> +	return core_rate_prop;
> +}
> +
>  static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  {
>  	unsigned long core_rate, core_period;
>  	u32 scl_timing;
>  	u8 hcnt, lcnt;
>
> -	core_rate = clk_get_rate(master->core_clk);
> +	core_rate = dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
>
> @@ -615,7 +636,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
>  	u16 hcnt, lcnt;
>  	u32 scl_timing;
>
> -	core_rate = clk_get_rate(master->core_clk);
> +	core_rate = dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
>
> @@ -1577,7 +1598,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
>
> -	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	master->core_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(master->core_clk))
>  		return PTR_ERR(master->core_clk);
>
> --
> 2.43.0
>
