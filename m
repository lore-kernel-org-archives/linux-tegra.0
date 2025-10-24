Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1776631065B;
	Fri, 24 Oct 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303009; cv=fail; b=mC/pfCvijOighHzqcy1IdSI0LPMVzYdPp5Me1eYvvPsGRDevle4uKrTlXq5KCy3bfahbTv3hXJB/q8s0+cLaT0PUvpMCtqQfiWFxWjvZAoCzTTuFiq69GkRjd7JqQ1QsM4AqlAL9g5aFu/oY6a/KCjd7zavxm2HJ+1dkSKc7GZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303009; c=relaxed/simple;
	bh=tmuh4P9XAxhjmgTLWA60Wv/a3JL0Gkk8Yn4r3tdkNss=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jRN5DT02kyCH5MUwBJEWMhdb1J7cr9mtlID3uS+2o/XYphFqrlS3M/2DfS6UX2A1bjLhtQcQbsdt4yqMyVFLsXndlfNK0Q7//ybAGxIo4xJimNbjRWpo9nhMHYY11UL8InBDhNm7KihRDstnLi2bw6v5atAhQA11umN+P3YsTyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jCPc1ywC; arc=fail smtp.client-ip=52.101.52.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jCPc1ywC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+Epd7bj9SXqox9OqwxiKQxcGmXJex9/NO6LEcWoko3d9SYvTPgfXcSJkDN5SmdYPRG5HEjy2cTHgwDSK25dHHchhyru7ezGqN6d+Y29f1WcKZfNlLNC1i496mL3ZYMXhprWYZgQeTzmBySLtxn4eD2wfdB2PFtz8QyIp7GdSlxQzgcuAAE7zwxR5Fu5rbkiK3rL1RPkbZWiVorLtK0+XWRbNwprqe9ISnAFFXt2d7nJNxbGvtmvgSrgknzQSavUPzq1TBCMpfyyh5XX4tOCprsv5b4AJVuFxB2DDgZEvfotk/G+HUGCeeyt1vhAU2B1INotiPkxc7VlmOBpPQXknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzMVsQjukLwB+RNehmRUYfMS/fgcyxyrysnOK4/+Qes=;
 b=IuEn9JoAQpzyMHBa/Wr5Kw31fzrbmfa7cLLiIUjnn0IlO6xaiEx27ttyMr+Ofdeso5W9/z8kCEcOb1n4+f2eDaLTrwWpaND4tCi92ePuwKDaphuaVps1Hi4mvRCdF14PDzOHLHfVpavNjMiJhvZDLOMKlxhZiXdDedY2Nx7s2Rlr4BgXgOKpTFspkdsQcSqZDc28eIZJcQnrYzDtn52VbuuhdIjmlw9ZyknxWMLe8GHUpNFh3H10vG7cIQtXrFhestWDSL4wPVd2Gr0g/IK/j8AAMBVfiwic6D+l27Dx28h8FvdDVePVOsZM3DWcwF93OLy56v2mSNUoAjOolXjHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzMVsQjukLwB+RNehmRUYfMS/fgcyxyrysnOK4/+Qes=;
 b=jCPc1ywCoXAaNFSd0GJBtkemhPBbJaErN43HcJ+qjjAnFDPqbK9QKc9Mv6F3ubTmtgdUjX3kG/Rq5A/0Cp8P87QUWTqamlQL76t1tiWfQpZsG2sJ3P1cOkVSmMOhbdAP1GGH2V5/WG8GttJ6N6T+KePpeFs6JT4DkLjCcC9zCh63W+aQ97MyGGmwBzBA9abtaib21XmMtGis2M0Rc1y+ZLf0rXlIgcD3jld2ThV0irSQYlZIvGaEwN5lzpGlvCrfNwG+Q56s68Yv2Tz/Ikh7piIzYKqn8m9u2zSld0DlbZTIz24xPheGMwr91poAzOGsH4ViOOvHqRVUICeZzX5e7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:50:05 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:50:05 +0000
Message-ID: <5bd3d519-1a0a-4dbb-9d1d-880a6f0f5ba8@nvidia.com>
Date: Fri, 24 Oct 2025 11:50:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
To: =?UTF-8?Q?Bruno_Sobreira_Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Gabriel Somlo <gsomlo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024013528.1542-1-brunofrancadevsec@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251024013528.1542-1-brunofrancadevsec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0626.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2a982a-b0c5-4f15-3043-08de12eb1760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVZYSnY4K0tmRlhTa1lxODVkSkhpUGU3SzJlbURXVStxSFFqWVFhVXpnYjdG?=
 =?utf-8?B?ZGdSUFY0YUhIeUVzSndyWWZTNHZaUGpjOWRrYXRuUEpxTHJTSnR2aVV1SzZF?=
 =?utf-8?B?Yi9EZThMNGxYUmZFY0VVYjErWEtKaENrWVRJclZZR2x6UTJXTFMwdThLckZW?=
 =?utf-8?B?dUtGUC9wL29XSkYyOGVVRFU5TFBKVFVIaEZRbkpEL0c3RGpKTXRTUTVnWTlu?=
 =?utf-8?B?KzBPdG90THd6TDNZSmh6MGZLaE1ZMUIwb1ZISXgxZ2d5ZUpZOWdiUkFCRGNU?=
 =?utf-8?B?R3dVcUNLMHhaY092SWhZZVJ6SXZCc3BpTTczSjQ2RDRPVE1QYmZIMTd1RnFC?=
 =?utf-8?B?QlFTNWtITlNQL2xETm1YMVdlNExHeXNEZERqcGErWU9SVThkYk94OFdsYU1h?=
 =?utf-8?B?RkNnNERlaXBEb1ZMWW92ZWlFa1k3L0hBNjlWMlliTTQ0TkVlaStKTm9JMEU4?=
 =?utf-8?B?TkFNQ0tnbmJ0S0liYmxZOXl2V2IyL3lzeElnbzFwdE5lYWRDanBXZEEzZVMy?=
 =?utf-8?B?NkxrVVVXVXFLajAxMjM0Vjk2TnFzcHdEV1VCNklVSmZEZzlTNWd6anBhZjlE?=
 =?utf-8?B?VE9zSkRjejZhU09mQjBqTW01VmNCQSthY293c3U4TEx5STVycjZhaWVuZzJz?=
 =?utf-8?B?Q1VqclplRDA2SzdPWFh0L2VRWDRyR0VRWGUvQTNNNjdvUWRHdVN2bjRtRnJH?=
 =?utf-8?B?c2wydC9RSG44YjNSVFRDSExGekI4dlVMbUZleTlBZUxpZUhKSHVQR1pVYmk2?=
 =?utf-8?B?V0NxYVRkT25PYnYyUXJ1ZjA0NFJ6UStQenVFSWZPLzBkYVVqaWxGaU11WFY3?=
 =?utf-8?B?NG02K2tJVDJxdThjaGRsSUxCSllZWU9wNVo3ZW90MktIaTJtYnJ4NnJVOXRL?=
 =?utf-8?B?Ym05VVJMMUozK0tvd3doeDZmRDk2SnpJQ0h4R3QzOWRYSWZFTHFnbFU2dUFX?=
 =?utf-8?B?Tk9hRjd5T0NFWnRqcVUvMXlPZjJqcGd2TUNlSXozNlJFWWVMVDZ6ajFuVGFq?=
 =?utf-8?B?TmJETld6ZTJJaVp4YlhmdndYTTRzTWZBQnFHR1J5U29zaHZsUmIrLzRZNGFU?=
 =?utf-8?B?c3NCc0x5OXo0ejkyYUdKV0pvd0dicjEycmhCbTB5Z2pMSkF1SDNNaHYyZzJi?=
 =?utf-8?B?N2ZTdUFORkU4alRnR3pWcEVVdVBaRXU2bm1WT05KK2YyUFA4aUo0UkdEZ3ZY?=
 =?utf-8?B?dTFpbWRiVWNnaE9XK05VWUVVby8vaGd5eTNobUR5L1Nabjk0czhpNTVOV3E2?=
 =?utf-8?B?VkgyY29LN2lONmJURTJrejBlallQOXhzMWFwdm1zdnNacmpVK0xyNTlRYTdM?=
 =?utf-8?B?ckVsUXQ1QTVXOHNpdzQ5NjVNbXhtK2xodHRRRGlaVXpMNTRxa1p2MjJjQ3B0?=
 =?utf-8?B?eThueDcxWWJaWEsxM1VXbnY5MFZxWHlLZTZnZkVvSStSU01vdmxzVHpEQm5t?=
 =?utf-8?B?a05CUXpscXoxT0dlandTN0tuQlo2WUM1K3ZXZFB0VW4xSk55bW43MHMwUis0?=
 =?utf-8?B?NEMzaVNJMldwd1g1aSs3RS9xTkdWQ29MVzRzVHdxcTd5RE5VZEQzdFl6YXRa?=
 =?utf-8?B?ek1HZ0JTbnA4anV5QVowbDgzUzdtV0lhRGYvOXp3aDAzTnRFcnZ0U2FCVFhs?=
 =?utf-8?B?ckRINTdseGtEQVU1MkZRV0RSY0xpTS9QT1lxWEc0VkNDNTQwMEJJOVRTODlU?=
 =?utf-8?B?WGlPNDdzdTZIQWtzZEdZSW9IZzNRc2oxTUpEUERQa0lJUFJLR2F3cVVlWDhB?=
 =?utf-8?B?WXNSN1FXMTQveExoQ2xMQ2ZxY1NUaGFTNXJPajRwclJLL3RSd0ZNN2szYW5G?=
 =?utf-8?B?cTNhcmxKYWYzOGpuelU5eEZDZG12V2l6cmNkdW41ZnlIaTJ1Tml5cjFFN1Mx?=
 =?utf-8?B?MWlXSzgrUnJBRkdDR0d0OXpDaUY2M09xZFlvQ1orTW5mU2o2OTUvNEI0VWg2?=
 =?utf-8?Q?bdNNgPKYy2lyd8JoCHWoE2b1IQMsnqqa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWxuZHNOQTVzTzlOaTN2SmZGeGFNTGJuTWd0SGtPeEZwSDFrVEJ3NjNWS0Nk?=
 =?utf-8?B?VnYzRWpaZWEzcVo5YmpuMU9lY0NtQkgxUjY5SEtBUEZXOVVMNmtBUmszMDQ2?=
 =?utf-8?B?VjAwcVpEQWYyRm5PUDhMMWh1QWRtdDJaN2k5cXJyZWtSSU1XeVhKRG5zNWFI?=
 =?utf-8?B?UHZHb2dRQnYzS0dXY3VDNG9GMmhvVGtwMHlPMmhCbUJ6cjJyTnpFRGFUeTYw?=
 =?utf-8?B?SVZRbk1vbEg5RHdlMzZNME9IT2dCYlNubVlQZlpicnVKY0ZiZkxEOGt1R3Vn?=
 =?utf-8?B?eEZJQVE2THR5TEhpb08wTzRuQUErQnVIZkthR1M1OTNBenhUL0dVTHpOMjFt?=
 =?utf-8?B?UDBRZVVEd050eDQwd0VGMmFiTGVjQ3RudEYrMXl5R3lVRnJ3VW10dTFJMGJL?=
 =?utf-8?B?SnZYL3JFRG5xcTRPcG9PWENwWXovWEUxZU05dVBYcjRFRWlwVVVlbGN2MEZu?=
 =?utf-8?B?MTMya1ZwVE1ZbXkzOVhoMnluVHRIZ0x3MUJnUnlPdGU4TGVnVTQzbzRZYkY0?=
 =?utf-8?B?dm12STNLcFBJWklUMEhtZ2FlN0N0Q0MzL3Uya1YrY2tMTVdGOXNrWXFYcnJU?=
 =?utf-8?B?UlExVCtSVDBXQ3R0SHhhb21oSWpVcnFpbHJRbXd1QzRteDlUWGt5UnAyc0Vl?=
 =?utf-8?B?R3JuWWYwWm1ucGR5dVlOSE5ybTJuaVRMb0xmOHZ3NStXNHBKQi9mZjV4MEJZ?=
 =?utf-8?B?dkkxM3JGS01uYllPbkxNejlJaHExeU1VQUdJczZtWE95cWtEZ3RhZExzVDZr?=
 =?utf-8?B?TmNqYjNvaWRCUWtyUG1PZ0Rpd3A4MDgzbzV4Y1NRVEF2L0tHcXcyUWs3Y2pk?=
 =?utf-8?B?SW4xZnpuYnlRUmFWcHM4M0hTeWNjR3RiUE5ZaGFhdlh2WTZBc1NGamhqMlhY?=
 =?utf-8?B?Z3IwTXlFdEpWeGROemlLbmx4dG9nM2lKbzFyUXRIUjk2a29TWm1wN0Ywekk5?=
 =?utf-8?B?YzZuczNLNE9tQkVXMEtEdVN2cHkwQ1c1a2JURnFub01uWnNWN2M3bUk1Vkln?=
 =?utf-8?B?RUhQc2Z5cEJkNWZWZ3hMTzRTdGNuRXp4bTBKaVVTMEk2RGRWMjhUUGhFUEJq?=
 =?utf-8?B?YjVNSnFHbnJyb3BLNk5VNmZ3bTFnajFhYnNWU1NjQjZvZEw0VFBLNnB0cXdw?=
 =?utf-8?B?ZE9LUkZGcmkvVWNsRVlxaDNlYWhuTEpVVlpjeEUxK1krVkJCUzRTbFVlTmhw?=
 =?utf-8?B?SGlSTUdSV0tyZ1NLRTA4VTFaNmhJaVVrckZSOGlzbElyTFJtdU4xbFFnU3RO?=
 =?utf-8?B?UzQ2aUZpdDZmYkxDZktvaTl2ajNCU3V2Ti8yWXRoMWJhMEpBN0tOcThmYk5q?=
 =?utf-8?B?SjUyNmF0ZzRsS3hCbFA5V1dQZTF3UWZXbU9PWmhhRXE0MWs1YXI4YjdCZnFl?=
 =?utf-8?B?aWR3eWR1ZklDYTVHYmwzd1NYbnZ3bFA2Wmp1NGh2ajREdDFOZlJaODBRUHJG?=
 =?utf-8?B?S2RpeHVkMEdLY0R2UlFWNGdwWUhPelF1SEM0cUZPZU1oc0ZCOXRWMDJsT1hO?=
 =?utf-8?B?L3M1S0syOHRNaEFyYnNoVUZlTEgxYkZiVWR2SXVGeitrQXNzMW1GSlpndVNX?=
 =?utf-8?B?WHIrNmVuTmwvWmZWdUNFamZoWnhHdlVieUVRTHNLbmJtTGJXeGRlV2I0bGVm?=
 =?utf-8?B?bklyNE1oYVFXM0RBc0QraE9tUWFrREtmWm04bzlINk9uQUhKUGh5NUozdllv?=
 =?utf-8?B?bDZBNkd1d0xkeDQ4TUtNZ1ltbkVET3JUV1dZbENMYjdXZUVITzMzVTdWcnZm?=
 =?utf-8?B?QlgyN3pLK2RIcnJWUW5JaFNwUGpOVFBFZjE5M2FBRExBdDMxT20zUzV3Ti9J?=
 =?utf-8?B?bTFyQS91TDJaOFUxYzFCMlIyWjJ3YVBUaERqV3lWVlhCd0FnZDRyWm13RXZJ?=
 =?utf-8?B?S1BzZ3lnU09QZzdMNDRkWDhaZjM3YlpWN0hqR0lzY2FIcUV2cXpIcjhqREM3?=
 =?utf-8?B?eGorYmVkMFJCSTNLMVJSRFVkYXZxc1VlOEUxZzlsY1VBMUMvUVBzWUcvMy8v?=
 =?utf-8?B?clQrK25VZXlGOThRWWpsbCsyUFpqRng5MUh1U1J3bDBpT3paOVh1MmNnUita?=
 =?utf-8?B?N1BQYkMxa3pGazF6S2wwTlBOV3FZMXFqMzd1Q2RaR2JSeTdldThMbUNydm5J?=
 =?utf-8?B?MURSeVZJZkg1RkxyQUZNazNzdkZid2ZaRGhCK0swV3EzSzhPN3ZGN29jWWtz?=
 =?utf-8?B?aGNNVHVDN1ZxazZKb3BFdWdOakRyeW5WTWJNeUhRMFRQMzhuOVQ1OFN4SVh4?=
 =?utf-8?B?bnlZNDQwV1lsMnhHckk3QmpITmZ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2a982a-b0c5-4f15-3043-08de12eb1760
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:50:05.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/udUOT5/pSiOq5r73d91NHusvvTQ08e/1D+C0kh06GXrUmYw4x5RMbRkbtiPqt78u1Tccjy3qFe/qtDmDAp/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073



On 24/10/2025 02:35, Bruno Sobreira França wrote:
> Fix a typo spotted during code reading.
> 
> Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
> ---
> Changes in v3:
>    - Improve commit message
> Changes in v2:
>    - Really fix the spelling error
> ---
>   drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
> index 846b17ffc2f9..e1deda188fdb 100644
> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> @@ -1836,7 +1836,7 @@ print_errlog1_2(struct seq_file *file, struct tegra194_cbb *cbb,
>   }
>   
>   /*
> - * Print transcation type, error code and description from ErrLog0 for all
> + * Print transaction type, error code and description from ErrLog0 for all
>    * errors. For NOC slave errors, all relevant error info is printed using
>    * ErrLog0 only. But additional information is printed for errors from
>    * APB slaves because for them:

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

