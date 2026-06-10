Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF13264F1;
	Wed, 10 Jun 2026 01:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055789; cv=fail; b=ukFr/hTmZhzEqi2U8YZ1n1bSqSXGJEEqHoaxvCKSnIrzoKHvuci5UBWUmLvaD/ndvtiYm/er9Pr6yg0/+tSz3R0d5h6VREZgIFkz48zf9f8aO0vATJnU2ZSVELkY9sjdtkuE+pGni8SOH8pb4VGc2mxkFIjH1gL7Th9fK91ir04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055789; c=relaxed/simple;
	bh=FnkKNgL7v0emSNhTCZzelF0dPNJ5qo9tzyS/LVxheL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F+ZVclifdHgIJQn6GA9BK5TaT0Rqyh8pjl+mMTmkzSdBUKtsfmHjm8iEP5XMIXX0Cxk/IkQwKJ3NfBE9A3D7R5FJreBJFMCWnCTqcAQ8oegRLuTZk8RzrI//txjJX/KLDea81itxiUqj6HSG00YrHcZSZdFCno+eZJogbVB0bmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ay/GNGMT; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ay/GNGMT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUvxfy+gkTaKayIy/Lrg4JCVvmvWWIUWN7RtbrgijzfSJwYLARJ7TTv32LHnh0gajxfnMnvdIRt939z4XcdDxmdR4sjX6sLOG2L8ZDN1HEPw+z4vHu5SlWZFVuKt88ySaZTE/KPnyDOqP6zy9Fpu8edyoKE+arDhRUJ2rsaDtoe730SY5rB54RGqfHlE4kJVJTA99dKi0Ld2HUqfOCYFRTIIAS8ysQg6AYQamU1HOyR/SOy/1XQuype6BFUF45287iX8H0XWAM636RqPXKc2lnrvHgUdDHAaBvREImM04avTwktyRgrJRRUnLqmIQm0JvBuy8g/bd5GqIIWihxkAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sU8g3HhvbQA90bR9GEkFXM3BeDJo06Dgx7YeR5pOCE=;
 b=SLSuMxqyLVY6AvQ+GYQ9XhARQcuu0nORA3EmAvCkCVwwgN0fPC3ztvkSiLwViwRsSrN/QDZOSDyqym6B4o64zq4Yps1OSrY8NxCMzJF/AwI/X2AQxMXZakNOenWwFyVk84kjVTohAnCpyIcj5E8Aerpm9wTUkLKDu1aU2Gukb7ROC/tABJ02LXP87PFplthmcz637FEIReVxl9PWZKQVuf3aAW1bzX3knKT0qVmKw3b02fNQ1M3ooGlZuNriFdXSXce196oCR42J+qOOFGeWmt1sqUGc0DRZJA7jPHq4pkkZVBCUmfX9EcPZ0qmbLJi3u41efLywAYMbRMBcVrqXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sU8g3HhvbQA90bR9GEkFXM3BeDJo06Dgx7YeR5pOCE=;
 b=ay/GNGMTIZxXOzJX1Rv2sKSwhfOU8Dph8NNWfEKLuJoonuSnJQLoSW3EA29TDeIsVtijrZBAV3xmRBIHHl0J591TRc2S9o2C+Ak1NzyaQVRSCztupqFyWCcWOO3278qe5nQhhoDu70hixh/CQ1S9EOrq4cX0l+RiN6ZdY6eBDHs9Ta5BxyhaMrQ/SXxc/0VnchC7evwtbR2L4nDt+WBtpmZe9/ss60O1Wc1x2jnX3KLwWaS73ZDM0db3+dpYGW3RyseAvZS0U0CdTdWLUHKHSMmZ9v9g0hcUtYaLCEk7M+tngtH/WqCsIVBIvm9K7z1lQgitdvY79GzcUitWzC1rsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11447.eurprd04.prod.outlook.com (2603:10a6:150:29f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 01:43:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 01:43:01 +0000
Date: Tue, 9 Jun 2026 20:42:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] dmaengine: tegra210-adma: use platform to ioremap
Message-ID: <aijBHDBy6QnlQVM3@SMW015318>
References: <20260609212531.22044-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609212531.22044-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8P220CA0036.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11447:EE_
X-MS-Office365-Filtering-Correlation-Id: bd62d051-e992-4ffd-34e0-08dec6919b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ps/vpJVWrur+MmsT5lrEk4pN8OCz6RSFpBt6dd4clxc9xTnbiTys06UFlAHWjk46h8n3bNgPIhaD1vw/IYvJDt93fJ5V1Cr4s1WvbcHUf7tvujku1/i0rJ27R0JQWBLznTY6V8g55gkU7QUzHU7n0BmBY13kvTkCwBPPsvoHw9He4GLdCKgbrEKJKAKGsJ+EEZtinRH7u3jdl+MLfiCHOm+4C172xKR+7Eg9gh100rlMF7MbmzMXtSdOR8Wf68D9eCZGfcf6bKhZ0MPBgVVjmKi6Ns4Cfi5i51VS6pj5iXFzWO4jGK8Zrosv9zutDhSaLW22yru1LdrLfpJip98STBJVupgsIMfhbqVjXY4283Ob9reGzgX7KI/KtbEY/VccugrINNMUMdpLuJziQrHIhOMcZvLmR+a5+23MSFyJHgAzQ4t+YQRAo5O/olK1fHlTsWK+o9RG+0gU9k3o8bk/hjjNXl91a8+tHfJWe9cI7It0wFK30lPKECmkblYEJP454LUYhVj8Ua+gjSA0xVU48Mo3cgRfNFNzS4iKKi4sDDYM3dXjqK/McXq4gyVvcpXCH5aPlKbXEaAEKtkXP1k7H6l8iEd7APX4sTSbFyOlCk9Cf4uq+lAyAyV+bCN+rx8fGjzchaVzOtwdwDjecqEidqZFfXbmXO0z7kIQOYq/prg2aRXgVldm0Wz0c1nvcchq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JLB0oIwWRGUs7ER+EQeSfgLysW6SqyxB5DsNfBeTpNgMULPqDnA4aAEY2gF5?=
 =?us-ascii?Q?1miW7NF7PYe8+lWKlFamGn2djbu4Fiv11whJMKZMvmxRf6SdY7hkdntoV/2W?=
 =?us-ascii?Q?/biPfUYqUv77Ge66JrrDxmSseXSDXlHs0agI0bsSwf8eMnIU4QzI8Z5/xNT0?=
 =?us-ascii?Q?LxBKBU6Nl3ZqQ7LkieYZ4w/FObXCLFHBu2iXDyzaZlXrM5dsiQanT9oFd2w1?=
 =?us-ascii?Q?TM9uexh4Qt9PTOt80jDUCuM9y0grBX1LjYlVvLhHqcni0s8AU1cycV3s8Tjj?=
 =?us-ascii?Q?qLDNssqAZBUvsVpczMmgfJaEWplCnNBMdUTyd++iaeVVCspyOcI4SaJ1/nCD?=
 =?us-ascii?Q?kcs8ZOvjdrAGXMLrHlkWegd6W3RwefabZljmkPS2I1eXUNYt+GV987R7CVte?=
 =?us-ascii?Q?G1d4THGk8/a2TXM/xHM2m68Z1zuiXM6m/EEuzjdJnDngWG0tYseAdYDFZZkY?=
 =?us-ascii?Q?jwCIC4M0hThQ1RqoInIyT7AgGUkq45TKdAuAPT4hrCL2o8DBurPDKVPxOfV4?=
 =?us-ascii?Q?1y2h2bsTv3/S+w0Fzj9VYmiJn3gAB1wM33Fe/1vLFVFfoavCIErN7KWBKqpe?=
 =?us-ascii?Q?Y8ScNIDb8ltUw90EoJ1aQSzWHpwBEVHg2PyjPhLzKldsjfizEaf19TjkisFw?=
 =?us-ascii?Q?pBe3Q2YhbQmoA8JDavlSoHkPRmqflA6b9+2My2eVestL2pm2okg5gzyONHdy?=
 =?us-ascii?Q?zRV0b10J+D5qOzjt1rlqBuZElkVv8WSwUioXbdPPwm9b/yukQp2Jdkqz86dq?=
 =?us-ascii?Q?Hr1qVVSp/G+9qHpEr4WG5LVfgEbBg+/HYrD3IvbU8sGxbIFw+Mfn21ogJwjB?=
 =?us-ascii?Q?bpVUSFLTSB1IHlPquNhaXvi5Z6yxhghlMOHP3tbQYB/h8hcQdzOL3CXG7str?=
 =?us-ascii?Q?4IBOIbvmL7x+gQszT4OkrFil4e+EecyrQJzRPcu6zM+lXtWvtIdE/ZpK6OFT?=
 =?us-ascii?Q?p0HiZEHw9rqCF4j1hvfMIArzS7+E91Iy+A+STQlG556wp0UEYPpJcA2kKkhZ?=
 =?us-ascii?Q?o51v1W52D4BxwgaJXc3Nq17j6WSbggu5+SiHPQ5z04FPjUiOWzsqvpUpHKjZ?=
 =?us-ascii?Q?KnCqO/9MfcsrHUiovX335ZdbehXRg7eqtpEkv7OZXj5zCNE00UznVWUV6s78?=
 =?us-ascii?Q?5X8O11o0bV2uOxS6cIXg3G6iZN9X4ruuK9c5pZQ/ZfT01aIDg+oXbB4FK01m?=
 =?us-ascii?Q?sFHedLxuRCtmxZ6ZDBbOpm1z8ml59utQjtq44+2WXVBw1aB5J32SA2wJBH/d?=
 =?us-ascii?Q?7MNq0HcBxH99PpYPZOO6jvOiWcMEO8M4mhF+edN563PWghmbHgw4YixDjWYh?=
 =?us-ascii?Q?P4wcMF4gOBOCsu+6BC7NpSPl60ttEdpV2QdiNMMphV3pQcbeSSTx6iUIhput?=
 =?us-ascii?Q?O/RnownpXEn2mbIVv30LMVBI02eCY8zxPlsbOfUfgKfh6N6OSs4IYinwHr1i?=
 =?us-ascii?Q?Vnq8aNv2+5NrLvIxKh+dJA2thC/pPxvWBu8wUIgozXDbxqRORPUDG1EUXMML?=
 =?us-ascii?Q?U7ggTYFBncA8jUyLj1SJHVNIZIOmsyiQj3XmBZsJXB8A7qtAb9poKsP5Sx2A?=
 =?us-ascii?Q?DGXPK+tpjxBn4FjfgJAchIqH8hVRBKp1Wi8v1v8+pZjXLeO303APGLijjCsm?=
 =?us-ascii?Q?OREh06bCfEGFvF2Ov1nowuFI+dUARGXZM9GV6NcaDJWcV6iBQjQgFmsgrJr+?=
 =?us-ascii?Q?LqK+ECl3oUT+heZkYeG7z0Qjff/Llybf8buK8ScR2/UJpNTxjBFM6khewIDM?=
 =?us-ascii?Q?Li2p8xTUtyuB7Pui3aQDZvmyxbRIae2HRjr+kkLbjn+z9QiLHNmH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd62d051-e992-4ffd-34e0-08dec6919b8a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 01:43:01.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zswXVZqQM0+9/xjqUEhH9s2q8xvzFz7J/xiIKVzm5dT9qUiWjHUPbGfID4dY//9EoV6kN1G60+ekGjUydhSoZEW2RVO4+gy6u6YvZiMb0FKXdL/URU6SUWEg5KTPVBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11447

On Tue, Jun 09, 2026 at 02:25:31PM -0700, Rosen Penev wrote:

Nit: subject
dmaengine: tegra210-adma: use devm_platform_ioremap_resource()

> Simpler to call devm_platform_ioremap_resource() as it returns multiple
> error messages for whichever part fails.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v4: rebase and reword commit message
>  v3: change subject
>  v2: reword commit message
>  drivers/dma/tegra210-adma.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index ceaee1e33e68..21a381d022cf 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -1087,15 +1087,9 @@ static int tegra_adma_probe(struct platform_device *pdev)
>  		}
>  	} else {
>  		/* If no 'page' property found, then reg DT binding would be legacy */
> -		res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		if (res_base) {
> -			tdma->base_addr = devm_ioremap_resource(&pdev->dev, res_base);
> -			if (IS_ERR(tdma->base_addr))
> -				return PTR_ERR(tdma->base_addr);
> -		} else {
> -			return dev_err_probe(&pdev->dev, -ENODEV,
> -					     "failed to get memory resource\n");
> -		}
> +		tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(tdma->base_addr))
> +			return PTR_ERR(tdma->base_addr);
>
>  		tdma->ch_base_addr = tdma->base_addr + cdata->ch_base_offset;
>  	}
> --
> 2.54.0
>
