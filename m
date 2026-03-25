Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C383E4C86;
	Wed, 25 Mar 2026 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453543; cv=fail; b=ubXg25dXkYGv+HJzhzuAVEALsE/Hp1uMSqpQ9NfpCm7J6cAeroY26JxyahUTBTgGwA3/OwYZD7Svzg2VgcxILI15b35MRHZ1wSekqD/qlsf38L6cNN3SbqZtBE3ZoFaTld1RXS+1M1Lya7e2CaFRDwo5C0DjcNGDrrEQIzbuxq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453543; c=relaxed/simple;
	bh=7kokPLZ+jrcWgfpuqBZ8br3zWEZ9uhAPb+yL7kwKa3Q=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dgvpnXFXMkTh65xsFlX4Lz68jqC0KfRU/tssjvKlq6AO35MXPKkiu8uGFfcxoCjFDX1mGwMr0owhlO+N8gqU/4PivnvEFEr/3G2tJqiWqvv5PEve009q2fLHrO0Tg0yADdjprGUPO1Ku+p48OSOvec/34w+2CPS3Bdk8OxkBqiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uuEAHXPS; arc=fail smtp.client-ip=52.101.46.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uuEAHXPS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdkgID8+NqbDP3WVaHjxN8bXIY3rrqLndgl8TqS+IiuvokGK9dPDGhO2I3NI5wMS+BMV4d+IuLphlVOvaBBDi0QkIG/whsopHUmQnC8+/KiZSUJrWn3t/Srt4jW8lv2KtKiSgWH9aEE3T2IAPcA3PrKc6EoRfKgPl/e8BIBq1CllRqnFIkncG3SrmPCOytLDeOuVhLscD23+CGWg3gHFSntDskraxMDDjLwMqeEKQ7sre9Gk0BzuYN/Lp2+96Drh13jGBY0hKVZsX4dcmN5k/KR/iREqZIrPGcKyrv/umhpNRE8e+YVWHLE26mmBbhQue8ynqWONhQZbTjRuiWVcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkB2zl4u5F7twFsOTlBUyWOOiXQW8I4x8PA9OD8wKo4=;
 b=GAeQ0ZsFH1ZKycBq02UUTu/aoucO488b/QcM66Mw0uoY3ALIoXMME0Ni7jpGI6qIYgfMOqeZ4AE358kr8avaFngOI/f4bBpRYACSeSFncq7CKQNOD86O/MH2ZK4SibGPy/dp8l2MEIODuE9q867qE/FHVXZmSSpNHHwmJjxZUb9275HkgIPuMFz2+pQ48OpuTR6WsDLBx8pMf+0Z/PCvk9FD5X4uOh/cdGlj4PRocrnaXvDIX9J2PGrBQqO3H5FmdTt0JlnS8JGdBoxjCw6kBUAy5fINTX/FTmjPbf0IiViLvyF6nQ7mQoisSNh505BeN2EFv0KJ+HFnw/a13JvOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkB2zl4u5F7twFsOTlBUyWOOiXQW8I4x8PA9OD8wKo4=;
 b=uuEAHXPSf9dmIEVBdg1KvhIE5jP/WNkIyG8i3i+Ef8dhZKS9r31sDHxyUVhQw5R9zxIyiW/OiE+aKIoJGrY95oG/ujIybr8dIIZy7d6nlceqVmbkI4JuyMQ6ZH0lTR1gkGYUIkzv5U1wp/CfKmjlU7s/L3+Wijloh3G5BHnryuuMWi0Z4CW3ZpHH+3v/v0h3aoaKBlDp9W4b54Pyk8t6b0/FeOrF9OPBpyvulOpZomqAQIw4i4xe9n/JeZOZazAaxJXFZ48HbJk4hY7xMzy4N9H7Xcqtrp5BsV+R1RZ2j9dpRXHgOXfe3TmC613wOPWONrihpdqqmHBMQxa2m+JQ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Wed, 25 Mar
 2026 15:45:39 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 15:45:37 +0000
Message-ID: <b6bae185-52cd-48bf-8638-53f68004f987@nvidia.com>
Date: Wed, 25 Mar 2026 15:45:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc/tegra: pmc: Add PMC support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, thierry.reding@gmail.com,
 jirislaby@kernel.org, pshete@nvidia.com, chleroy@kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324082847.550771-1-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260324082847.550771-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR14CA0048.namprd14.prod.outlook.com
 (2603:10b6:5:18f::25) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 218027bb-29ec-4ce4-e8b9-08de8a858f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3SQ5SOHPxGh4s15F4xmyMg+V5eO+hc2C8mwmP8kiINw1aXCx3J8e1y8dvG+XVzmAiolRGSzNJ9kdRuzo+5iEvZ9aKHVpAEWUF24TQ6csY8Yr0XVWgZXvjBxyjBQhcgi7FU755y1AGBTiLUYm+by+vdJJTVlMSwsdyeme8OOX2SpQDVtuLvFA1qAHgeJUJvx9a33qPfH09Gnx+GgI1pKi+g5OHniKZ+t9LLH5ACu4MF5UD6Q0sopkRWHH1xztckajvjy8AdSWHnceYVCDiND6AtYwzfo0eEEHlKROTJKq/1VVVi7XGNA2mncOMlPDbVf78v/3xDkOYAdIMKNjLtJHY3xdPGnKrPs9mAXGd08cbka5KzFok/hAC7KcOjsFJNwgw38WOM0zpWYdPoXbHuJWAe1d00zMZSSGlSxmCt53Tyj0vhO9t6NJCpDDNf7bTFMz2FGYYoto2cyeJ0hYpw2Or2betZ7ygY/q8/SiQaHoTHu2m9LJS9j8Yk6wGtUhevOY05H3g+kyNh3VJi02dX/G6Ac0dGHwF27JHPmXaSL5LzozKMg/zaak5IoAa2ydn6pKCoUGeImJT2c9em16aEuN4/Og3xBlRkpU4feRY1M3U7wh2n5iN7P/uxBNWTX1DBE9zrCd6vczhw88oaLSSHOAo2qJr2bHm/611H+q61Kd7Qo7R3ThwlrkBabAMgZ77g2IS5keW5DblVC336QkEKdmNQLKlYBUwzadTe1afUrfXXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akllZFdVYW00aU4wSmFZQWgxQTNId2w1ZXEyR08wdkNtbmFhalhOVVpMMy85?=
 =?utf-8?B?N3BZblhqTzloM3llWDdZbjk1UVpKeDRMcGNHTmswcFNiS2lTdWZyYTFTbEJC?=
 =?utf-8?B?bUFtQ0QwMkM5ZXk1VURybkF6Z2lXMi9kUVlPMnJYSUZudEwzdHVYbzVHS0Jk?=
 =?utf-8?B?MlZjQ29vT0JFVUZ3MFlrbnZNd0FOLzAxSHlPUDUyTVlNQ2U5WFcwUzk3Rk1L?=
 =?utf-8?B?Qzhta01lV2YrRmdjVGhKU2ZhN3VjNHpYbXlDam9SQ2U4cnRjbU9yOEJMY2V2?=
 =?utf-8?B?blBuYWhqem16Tk5zaHVKNXRKNnM1UnhNUW90U0RWMkViaTdkOGw2RWd6blJR?=
 =?utf-8?B?WWNXV1M4MlB3aWNNQlVoSkZpeDd5Z0YvTktIelMzTHpFUkFqcHAvNnUvY3l5?=
 =?utf-8?B?R3FXdWdSU0QzWlhEOVJpWGhlVVp2NnlDbWNpUE9GWVM3NGc4b0lJRldqaWdu?=
 =?utf-8?B?Wk5xK1FTVVZwemQ1WlVLcHh3QnF2R3ZuN3NGU0RiQ2pvc1VtVTJ1bEYvcUts?=
 =?utf-8?B?SE81UWFoaEhtZHRiZzREVSs3UEVDR3dseDdWUjh1Z24rMjZuWGtabGRvL0Jo?=
 =?utf-8?B?Q1ZrVUZXYjhZTU9jbGV5ckJ1cC9DT0NtRmE3WlRzWTdoZEt6OEFzQ3daMjlk?=
 =?utf-8?B?Yzh5K09rRXhVTWg1N0ZNcFA5cjlsTjF4ZG5tTXQxQk9tSFRyd05LbzR1bk5R?=
 =?utf-8?B?c2FhUUVmTWJnZk1sMHAxU2dRZkpRL2xDdU5IZU5OQWZwL1FYa1U2RkN3U3Zl?=
 =?utf-8?B?ak9hcU1Xclg2ajMyREprL29jdW9Jd29iVmhlbjNsanh4eUJQWE5aR1RMd2hS?=
 =?utf-8?B?UWxhK3hoUlg4SmVzRmFML1FpUDZjWWROOXBHL3BuU1lJVnc2d2dqSXN2QmlD?=
 =?utf-8?B?TnhSQm1XQ1lBM2pmamFNVVhjY0RYYStpQmh3VXNBOUFQKzFUZ1IycFlXZCtG?=
 =?utf-8?B?SmNWWmtMZFNBT2lQUWdlL05UWGtRbU1JTGpwSSt3UFRaMkhYOXQrRExCdzRY?=
 =?utf-8?B?b2xwRFFyaTV0M2o1K3J2ZVV1ZThsVEgweVltZjZyeFhoaUNlME5wQmVtWEdr?=
 =?utf-8?B?R3RKNC9sRVRxR0VzV0VrT0krek80ejVRSFl6Wno3VU4zdUY4ZHg5Tkh0NHR1?=
 =?utf-8?B?ejV3UFgrRk14WFdXdDFodThFZzFLZnM1SlJSMkhwVFVaTUw1WG9IYThTQ0lL?=
 =?utf-8?B?emIrNkg5Z3Z2TWt1WEd4YmdSNi9uVW5LMVEra00zVzZmak53dkwwRS90UHFY?=
 =?utf-8?B?TkRJdEoxUDJ3STdaa2kzTVZOb200WWs3cCtQckxtaDErcDlzMFJnSXBCNndN?=
 =?utf-8?B?b0pQZ2k0YSsyMGxmenZkY2FzQkFoWllES1h2OVhyV08xaS95WjNjL3lraitD?=
 =?utf-8?B?a0hVSUx0cXhDalI0UTUrdkVTZmhLQXZBZkgzeGZMYU5XWjR1U0dCZ2hjWXpU?=
 =?utf-8?B?V0UzekdGRnlQM3ZnZU95Sm1BS0hqZGhKcnV0QW5tamlsVW51SFlsb29VcHdN?=
 =?utf-8?B?bHRCU0ZVMU5QYnBQYm0wNndiZmdlRy9yeVJtRWY3N3lUYnpFYUp6MG5lMEdt?=
 =?utf-8?B?UFpZUmIvNC9tRU80cGFGVU1neWM2QnNxbWVXVkRQMHUrSndvWHV1a0x1cVFB?=
 =?utf-8?B?U3NmVE50NzFzM09CRThSRmg4ditld0tyb0VHZkM0QytDSXVOTHJWTHpPTSto?=
 =?utf-8?B?V1VDaWJLVGtWQUJOY2NsN0pEWFhQY2EwaEVPajV3ZEFOR0pkeE0xUjVyNG1v?=
 =?utf-8?B?K2taRWxFcXlOcWVMa2l6ZnBBc254ekIxQTdzaGdqbXhTYTA5QVlqRnhxNC84?=
 =?utf-8?B?OW4xQW9sczR0Qmt4cHNOU1lDNGJ5Z2xWRkdWb1ZvMXJkV2lWeFp2a3ptZ0pI?=
 =?utf-8?B?enBiYkN4TUg5RjV3QXF4ZisrOHBHZWQvODg3T3dSQ3gvVW10SEovQTgzMVNh?=
 =?utf-8?B?b1FtRHhvL252YmZnRGhabE9Fd1JIK3J0emw5eUhHUWEwTG5NdkZJVzVoTHZY?=
 =?utf-8?B?SVh4bEZ2VUxxVWlQWDN0am8vbTBQdit6a25iU1pwNTRwTW9aUk42U05UZ0sr?=
 =?utf-8?B?V0c3emEzdDJjdWZGUWs3MjVSUXVLZzRNdGgzYmx6RXBWOTI2SUx3b2I5Qmho?=
 =?utf-8?B?V01IZEhkajJuMDY5MS92RzEvNEM2WVZGRVNLbzZ2YW51WUlPQlNXWWFnOG1C?=
 =?utf-8?B?b0hFaWZSVnlrTGVCSjBBaEk0WjZYc0l6S1A3U3U5RXBCalBRQUNISmU2bmFm?=
 =?utf-8?B?RkZwNTVkN2YzTTJ5V2htbS9hTytFRitNTlhLbjFxZUExcndPV09HMzF2UnlV?=
 =?utf-8?B?NXEzVUg1cm5mWEpWajJRbHhzUGlUdU1QdGpxYzF4T3hZSHZyUXZ4RUdwY2wr?=
 =?utf-8?Q?ZrVkV8JJNPMsQY0TUE9yl5Zq9Kme7PJh/NAILq8hD7rkg?=
X-MS-Exchange-AntiSpam-MessageData-1: M6ErQqe2nLba9w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218027bb-29ec-4ce4-e8b9-08de8a858f4a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:45:37.4451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M64/EBBzLJtCCxH43Yc0eCKMxlifSWV/bQ3vvJoi5Te0SVDKeJ8qxcsVNiFioVOwbI0WQreCX3f6LsRztbln9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307


On 24/03/2026 08:28, Kartik Rajput wrote:
> Tegra410 uses PMC driver only to retrieve system reset reason using PMC
> sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
> not use the early initialisation sequence.
> 
> Add PMC support for Tegra410, which uses the PMC driver to retrieve
> the system reset reason via PMC sysfs.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> Changes in v2:
> 	* Updated commit message.
> ---
>   drivers/soc/tegra/pmc.c | 128 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 128 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index a1a2966512d1..f17dcfd0aeae 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -11,6 +11,7 @@
>   
>   #define pr_fmt(fmt) "tegra-pmc: " fmt
>   
> +#include <linux/acpi.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
> @@ -3095,12 +3096,30 @@ static void tegra_pmc_reset_suspend_mode(void *data)
>   	pmc->suspend_mode = TEGRA_SUSPEND_NOT_READY;
>   }
>   
> +static int tegra_pmc_acpi_probe(struct platform_device *pdev)
> +{
> +	pmc->soc = device_get_match_data(&pdev->dev);
> +	pmc->dev = &pdev->dev;
> +
> +	pmc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pmc->base))
> +		return PTR_ERR(pmc->base);
> +
> +	tegra_pmc_reset_sysfs_init(pmc);
> +	platform_set_drvdata(pdev, pmc);
> +
> +	return 0;
> +}
> +
>   static int tegra_pmc_probe(struct platform_device *pdev)
>   {
>   	void __iomem *base;
>   	struct resource *res;
>   	int err;
>   
> +	if (is_acpi_node(dev_fwnode(&pdev->dev)))
> +		return tegra_pmc_acpi_probe(pdev);
> +
>   	/*
>   	 * Early initialisation should have configured an initial
>   	 * register mapping and setup the soc data pointer. If these
> @@ -4615,6 +4634,108 @@ static const struct tegra_pmc_soc tegra264_pmc_soc = {
>   	.max_wake_vectors = 4,
>   };
>   
> +static const char * const tegra410_reset_sources[] = {
> +	"SYS_RESET_N",		/* 0x0 */
> +	"CSDC_RTC_XTAL",
> +	"VREFRO_POWER_BAD",
> +	"FMON_32K",
> +	"FMON_OSC",
> +	"POD_RTC",
> +	"POD_IO",
> +	"POD_PLUS_IO_SPLL",
> +	"POD_PLUS_IO_VMON",	/* 0x8 */
> +	"POD_PLUS_SOC",
> +	"VMON_PLUS_UV",
> +	"VMON_PLUS_OV",
> +	"FUSECRC_FAULT",
> +	"OSC_FAULT",
> +	"BPMP_BOOT_FAULT",
> +	"SCPM_BPMP_CORE_CLK",
> +	"SCPM_PSC_SE_CLK",	/* 0x10 */
> +	"VMON_SOC_MIN",
> +	"VMON_SOC_MAX",
> +	"NVJTAG_SEL_MONITOR",
> +	"L0_RST_REQ_N",
> +	"NV_THERM_FAULT",
> +	"PSC_SW",
> +	"POD_C2C_LPI_0",
> +	"POD_C2C_LPI_1",	/* 0x18 */
> +	"BPMP_FMON",
> +	"FMON_SPLL_OUT",
> +	"L1_RST_REQ_N",
> +	"OCP_RECOVERY",
> +	"AO_WDT_POR",
> +	"BPMP_WDT_POR",
> +	"RAS_WDT_POR",
> +	"TOP_0_WDT_POR",	/* 0x20 */
> +	"TOP_1_WDT_POR",
> +	"TOP_2_WDT_POR",
> +	"PSC_WDT_POR",
> +	"OOBHUB_WDT_POR",
> +	"MSS_SEQ_WDT_POR",
> +	"SW_MAIN",
> +	"L0L1_RST_OUT_N",
> +	"HSM",			/* 0x28 */
> +	"CSITE_SW",
> +	"AO_WDT_DBG",
> +	"BPMP_WDT_DBG",
> +	"RAS_WDT_DBG",
> +	"TOP_0_WDT_DBG",
> +	"TOP_1_WDT_DBG",
> +	"TOP_2_WDT_DBG",
> +	"PSC_WDT_DBG",		/* 0x30 */
> +	"TSC_0_WDT_DBG",
> +	"TSC_1_WDT_DBG",
> +	"OOBHUB_WDT_DBG",
> +	"MSS_SEQ_WDT_DBG",
> +	"L2_RST_REQ_N",
> +	"L2_RST_OUT_N",
> +	"SC7"
> +};
> +
> +static const struct tegra_pmc_regs tegra410_pmc_regs = {
> +	.rst_status = 0x8,
> +	.rst_source_shift = 0x2,
> +	.rst_source_mask = 0xfc,
> +	.rst_level_shift = 0x0,
> +	.rst_level_mask = 0x3,
> +};
> +
> +static const struct tegra_pmc_soc tegra410_pmc_soc = {
> +	.supports_core_domain = false,

Not needed since there are no powergates

> +	.num_powergates = 0,
> +	.powergates = NULL,
> +	.num_cpu_powergates = 0,
> +	.cpu_powergates = NULL,
> +	.has_tsense_reset = false,

Not needed as you have a different probe function.

> +	.has_gpu_clamps = false,

It should not be necessary to explicitly set this because this is only 
used if there are powergates.

> +	.needs_mbist_war = false,

Same with this.

> +	.has_impl_33v_pwr = false,

This is only needed for if you have IO pads.

> +	.maybe_tz_only = false,

Only used in early init and so also not needed.

> +	.num_io_pads = 0,
> +	.io_pads = NULL,
> +	.num_pin_descs = 0,
> +	.pin_descs = NULL,
> +	.regs = &tegra410_pmc_regs,
> +	.init = NULL,
> +	.setup_irq_polarity = NULL,
> +	.set_wake_filters = NULL,
> +	.irq_set_wake = NULL,
> +	.irq_set_type = NULL,
> +	.reset_sources = tegra410_reset_sources,
> +	.num_reset_sources = ARRAY_SIZE(tegra410_reset_sources),
> +	.reset_levels = tegra186_reset_levels,
> +	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
> +	.num_wake_events = 0,
> +	.wake_events = NULL,
> +	.max_wake_events = 0,
> +	.max_wake_vectors = 0,
> +	.pmc_clks_data = NULL,
> +	.num_pmc_clks = 0,
> +	.has_blink_output = false,

Not needed as there are no clocks.

> +	.has_single_mmio_aperture = false,

Not needed as you have a ACPI specific probe function.

In general, I think that we should only init things here and need to be 
explicitly initialised.

Jon

-- 
nvpublic

