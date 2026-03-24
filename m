Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3C33A75A9;
	Tue, 24 Mar 2026 06:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332069; cv=fail; b=CsDIS4fMW+vQvm1uv7fnPOdjw5UEwr6Em1Tw62NYhUwGn76ZjceHwbODycrkF26ETYbR9F0aLIQ1/5OHiweHJBP55JYTf16HazywuOsNlfDwksJ3pcmnfJZZKo4OrpxDStfMOl/fa1scPi3h09iGabay6SulxvmLWY6qPdTwRkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332069; c=relaxed/simple;
	bh=34hXBTb5r3Kpu0fs9hUiRTiHWg29jutudz3ZzJu/o68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o05oWt+UhizigqBfYVjvlrkhcpfvgg6p4SIIQj1YJoY6a/rwxEPDZUODLdQwKuYHHU2g+yaHkZ9uoIqmLvFwUyienZGruMddpirJ3PwviiXwAcQL3iJ45Edjrm9LvdImuzzsokgih/9jBb7DEr8ZgwNBx8JdBFwl8yjU1jRzRlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NzOcOV3H; arc=fail smtp.client-ip=40.93.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NzOcOV3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkAh+eK7uZJaaL1B6yJnquF0nppsUMP/C1nvhVr8sByUxMbqfz/ApUA6rn//epWUyCLFk/lJTLjrn8nL0sISXqSwSfqn4S44jjSBi32Zk+YiUoK5sXSFEKG7H+PsuMG4DG5VDmMeJTLCDIdt8AFtU54nCh92lcM7gnEgLyD6fyxRsBZCTXJZW+I+H0hwnKIGbwB8AMPJ3nR0+66DsRYwFPvWXheCuJqAh1FIFj6PY5iUm//2YZ2slCfJicrhelz1zPHiF7YrUemVNOZFlaK2e07w9h+Vd0PlggR9MdfyjuzZMralNaAbL6mGnZa/rt/GZHtde328XJWJnefU4ag5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcVTfi90pV6swGLHPmbIIfEwpZSauxEyHTnGicUrBAs=;
 b=okfEj6baKUYhrNLz3gFNYgrzR4+Zmj41hAHZNTfzKU464l/Ec/pv40gVgRb/GqVokDaDnVngzPZBfcgTZZv0HLFKhAHY4kws08V5JfV56EfJQuM+urK3femmGzubN4JDg4IOx0llQnTX5C1W5CnN/ygVyh8FF9wA28P3BcQyMDTIP4GVsEpkFmj5+gDfmcPZhLylxcHQmH2G9pb+6TvhJKMuD9UY0rAxlUpP4W8Vljdn3Xiar9pouhSHoV99NNc6wwu+Rhxr+l4ALWXmLHsbp8lijz6IxrqNWPhM2LXPzW2NWcdg373Y8CbmWdFb4/U8VuhISmrtXU7rL8lh1PkVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcVTfi90pV6swGLHPmbIIfEwpZSauxEyHTnGicUrBAs=;
 b=NzOcOV3H9I/hd4ShNL6KyinaPnbniXKSI9e0Fl9zKRm4LtNl2p88m8An4trv3F4glgC9Z+21qp2hq9Q1fCnJ06NE/7UEGk5poAZ2oXbwaJ8MKGdTCbt9br/4jSLdEvoZww2nyePYuGhzN0YWw0p6457bysm0QL44uJrK/JzeYrZnjMV5QxsiMU+vUkRxpdK5dNuE1/Wa3qjb4fD1gPCLscQSM2UqY0unkX1JTHSER91v4tZBRfpAd/u8JO7MM+XSXzvgSET+Y7T9N34EBjAaSxeIUMIGCZx9lyA2j5kdCLh9e4X2gE4LhhQMX68Q+ywDUUaoCLBDr8iWlm7aZriq3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Tue, 24 Mar
 2026 06:01:05 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 06:01:04 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-tegra@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
Date: Tue, 24 Mar 2026 15:01:00 +0900
Message-ID: <2776817.iZASKD2KPV@senjougahara>
In-Reply-To: <20260324015722.12507-1-rosenp@gmail.com>
References: <20260324015722.12507-1-rosenp@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::17) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: d6602204-ee05-4af2-fac6-08de896abbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	89U73cJenVtck48dtqCECDr0wlkFN9JnwvMAQHizWGL658osCLnsV4PHf+LL8fEUcJ820yWXq7DTQ8R+xSYdGRENzMPyXbz+rVdO5H6OcFbO4PrkYmWvWFo2mOfx92pH5IG2xMOXPB5f+1wu45wE3EO6iAR67pt7z4I+QvbC4ZO+n2oUnIZJe7WDbbifU/1Cw9v5iQOF8a1fklYm/IakxKloHhkAn8ogRilrSzwLhTCa5yLEJRPJgQalJm95VW2OWi2SS4pjy/syJnbkRoqHczm8ufx6Kr+p/lVHBG2aDG9GZx8Lm1VsGEsFvFD5z0MgP7aojOUtG/WzUHPnn7K9xBQlTdNbgpvaYM/jx+AnYQDbFd4WoRt001ine6Ktd+TgIHs7EcoALOCYdC38shTcBTTf3CBXvXjhuFzk3HIKTKeRAI9C3l1uw7fVYcxWE56RXcTga/KPjwBLvfrOtlER3V7dFMJUxtIV/2pH7JJKsm25ErtdMctRyfKuNrY1J+Pso32aifgoBYv5RmUU/xfnE+72bx7Ax2g6DNojYOgw4+rPoEu6CkaEftxJHZH1MAwPPlcOxcvQufW4hmJOFOfZVqSVuE0PtKDV6SNVg/UnNnz0xtUT4RJp1VBOSTgHVzJ49o4CvzavgVk89EV/Cb5wwwoC6J9vm/vI4vgKDfQgtz4Vw25UFBAgoluDmAsw4EuFvj9QR8VAw/Q6pn93S8pC0eydTzfiFTKGt3mNg4kIShA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWpzbnJJdnJLUmxaTFhIdk15VW1rdXhlVDgyNENxYjhabkd2RURKSW9VbWEz?=
 =?utf-8?B?RTBTQ0Y4OTZ3UjJGM3ArYUw4RlR6blJjUC94UkdidFVqNXN2bXQzRk01a3pV?=
 =?utf-8?B?RHpEVDB0QVdkMW8yMm1rTHg0bDhMRFdBa21XOWVKNVlFRGk2UVcwak9maGQ2?=
 =?utf-8?B?b0hlRjZlajJORE40akc5dlBCZ3ZhdUx5YkI1c1lYcHR5LzFuUWtsRGJsTzFB?=
 =?utf-8?B?amFPRTFLdS9ja09LbVBsbnJkVmVraHBUQUlsT3daejRSRm5pbGdBTnlKLzR4?=
 =?utf-8?B?SzRGZWNPU3VweUZTbXFMMTR0eHFFUWpwTmpZTStoVTNjZ05pOE9nR3UyaEtl?=
 =?utf-8?B?KzkxZGFuNXQ5SGR4bm0rWmUwMXBBNTJPMXpyQzBjSlMvY0dkb2ZUMzl5WHRw?=
 =?utf-8?B?d3U2cnd4Z1NtVDNxa0ZJMlg5bnh0QmJxbk5jOWZXb3NzQWljbzd3Y2hQN1Vz?=
 =?utf-8?B?b28relphYTMvWUtqaFAzdHNmalMvaGRrTkxlM1JQL3BvMmYrQXJkTGNoWWU3?=
 =?utf-8?B?bDdJWWJTd0tYa0RxWEVvL1ZFendZTlY1Q2Y1VWl6cWRVMFo0aVNjSzZYVTAy?=
 =?utf-8?B?OWlab0xLQ1kxZk1hVWwxT0Nxb0lrTXlPSWZ4RnpBRGRidmY4cnZNd3JaazYv?=
 =?utf-8?B?YWp3MXovMDkrZGRyS1MvS284dnd5WnpYVXJSMU0yQTVSWWJlb2tDaGczVDhz?=
 =?utf-8?B?VlVLWXdIVWt2MGJONHRsWmFhVTlNMFcwYXVpN1lEV2hXNncvMmRQL29NL2VP?=
 =?utf-8?B?aXdZYWZERGhVbzc5RmNzQk1hak8zYVQvWkJSR1N5VEYyYXdXZENibnNaSW5q?=
 =?utf-8?B?cHpta3ZzTFVUQmpZWkVpR2d1aC9Ta1FTWGt2Tkd6ZldCbzhhQmRRd2wxcHJJ?=
 =?utf-8?B?aDNENi9sV2thOHpLay9PUHl4L2xUQnlFMUY3bnZVUi9lSUJ2TkZQY2RaaWhm?=
 =?utf-8?B?VGpUWFBkWXJQMklxZHpCWEJ3cWVGbngwT0w1MUFkLzFxb1RHdFkzc01EKzZR?=
 =?utf-8?B?aWR5Z0RIYkNjdDFycjdERHg3NmErRFRLdnRKZ1crL21Fa3hTZ2gyRGlXZkI2?=
 =?utf-8?B?M1o1akppSklxakhlQjY1RWNCMnNlakFJRytRTnNwSUI3aHRwdzFDdXV6VzRC?=
 =?utf-8?B?YlNLc3E4bVRBNWRaMW9mT0ZqcUpHK0wrQXpQVnY2SzF0Z1UydlNjVGhEMXMv?=
 =?utf-8?B?MGw0WWhQNVBPa2Y5SkZpYTBBRmhQc3dkVmN2dFZWZnZrdUFsYkM3TVVjVXBp?=
 =?utf-8?B?Mkg0aEtWTDRHV0lvR2VVeTZiMkdxMVBJVmxlRVV6eEk0NGFwLzFyYUIvTURZ?=
 =?utf-8?B?WHhzZUIwWjRQWC9sYzQ5aVE5TXFnbUpHZHB3dlRZK1R0TUxTNkY4ME5mWmdP?=
 =?utf-8?B?MG5HY0xMZmFnL1dDZnhSck1ENkpDYjd1aGxSYmNUbjVNL0Nvc0twUytVRVJi?=
 =?utf-8?B?WCtYU0w0Z0huU1EvOVp4MTAyV2NLdFdObkVtNXJOUzl5MXltcUJwcVI1L2Rj?=
 =?utf-8?B?MWV4VGhyK1dDdk5SYjBFSjZtY2VFWDNpc0dKb040VGx4djUzYzRaQmRYUnNt?=
 =?utf-8?B?emlGbzJvNmhYeGpBZzcrb2Z3aENXcXNTOEx4K2RreEZnSDRUbjE3cTZaTXMz?=
 =?utf-8?B?SmFaZjBRNFNDNXZYSmVtZkNiemZiSXoxR1BCY284WUpPVkx1ME8ydEowQTVL?=
 =?utf-8?B?bTJkYmZLUlpBNXZ4TDRhcUpSTU1Yc0VBbmRNY3hRMm9FTU5mQytWK1BZcnpx?=
 =?utf-8?B?Q0ZUM3hNc2RKR1FyOTNYNzB5cW9HRmJIU0pyMXAzOG02cG9tSjE4QU91SzZO?=
 =?utf-8?B?Y2lnN0NkblVUU05Sc1JYTU80bWZFaXovM3VWQ3A1ZG9LK25SUEkxZndFeG5H?=
 =?utf-8?B?RFRuQTMxM252eHIyM215WUJ6MkQ0U29CbUVXY2NRa3lXbFZVeUtTU21HK1FG?=
 =?utf-8?B?T1M5VVg3VUxiUERvb0xhN3E2ZWxZLytvMmxxNExRVGFuSnM5eFhwY2NaYUNL?=
 =?utf-8?B?aU5wNFEzWXdhUWNuV2JyWFc4eS9xb1NjMG5QMGFJUkkrZDhQOGVQc1NFSzBX?=
 =?utf-8?B?TFhKMDFXb3FlalQ3b1BCTzJQdEw2by9WTWdtVHduZFMyMjVaRGV6Z0w0SjJT?=
 =?utf-8?B?aHhidnBOQTZNbzY3cWF3YXlCZmxUQUpqNlIzeU1QRGV3VXZVcm5JenJwWTdK?=
 =?utf-8?B?cXphWE9rc2lNSlBTb3BpelFXS1BRY05KS0pHaTEwTStWTUNWQUxmUm9OOVF6?=
 =?utf-8?B?KzN2U3ZPS3JVNDNSMHJFOG1DUXJhQWkybzNsOTErZFlOeFV0UmJRVytZTHRD?=
 =?utf-8?B?VlVuaHlHeVU4M0xPS0F6WWx6VmR2NVZsRzRvemlPUTFsMlFycE9sWGdPN21h?=
 =?utf-8?Q?q9V9XanP3Vn0RXH+qB6wcPqOJvQepeLrDrmi4CrMsYNIF?=
X-MS-Exchange-AntiSpam-MessageData-1: d7tJyOUfpBjA8g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6602204-ee05-4af2-fac6-08de896abbda
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 06:01:04.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enDhiVN5wOOlvco5nyIx/FqFh7t+ohdlfBw8Ql3Dqr8P75FjBVjx7NEfHxd1kPZIRFKe+MphyfGtanrTasbdUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477

On Tuesday, March 24, 2026 10:57=E2=80=AFAM Rosen Penev wrote:
> For this driver specifically, there's no arch specific stuff needed.
>=20
> Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
> CLK_TEGRA_BPMP also depends on TEGRA_BPMP.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: also build the tegra clk stuff.
>  drivers/clk/Makefile           | 2 +-
>  drivers/firmware/tegra/Kconfig | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 760d9643705f..334d5c522394 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)		+=3D stm32/
>  obj-y					+=3D starfive/
>  obj-$(CONFIG_ARCH_SUNXI)		+=3D sunxi/
>  obj-y					+=3D sunxi-ng/
> -obj-$(CONFIG_ARCH_TEGRA)		+=3D tegra/
> +obj-y					+=3D tegra/

clk/tegra/Makefile doesn't separately check for ARCH_TEGRA, so this will ca=
use=20
much of it to get built on non-Tegra platforms as well.

Cheers,
Mikko

>  obj-y					+=3D tenstorrent/
>  obj-$(CONFIG_ARCH_THEAD)		+=3D thead/
>  obj-y					+=3D ti/
> diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kcon=
fig
> index 91f2320c0d0f..ae21f460807d 100644
> --- a/drivers/firmware/tegra/Kconfig
> +++ b/drivers/firmware/tegra/Kconfig
> @@ -3,7 +3,7 @@ menu "Tegra firmware driver"
>=20
>  config TEGRA_IVC
>  	bool "Tegra IVC protocol" if COMPILE_TEST
> -	depends on ARCH_TEGRA
> +	depends on ARCH_TEGRA || COMPILE_TEST
>  	help
>  	  IVC (Inter-VM Communication) protocol is part of the IPC
>  	  (Inter Processor Communication) framework on Tegra. It maintains=20
the
> @@ -13,7 +13,7 @@ config TEGRA_IVC
>=20
>  config TEGRA_BPMP
>  	bool "Tegra BPMP driver"
> -	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
> +	depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
>  	depends on !CPU_BIG_ENDIAN
>  	select TEGRA_IVC
>  	help
> --
> 2.53.0




