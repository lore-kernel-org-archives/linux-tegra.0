Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8FA366DD5;
	Tue, 27 Jan 2026 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542209; cv=fail; b=obIEzZitxE0Xgh1p+4hHiZAisTSMcis/Yck74VkJHx9qD9BVuuhwUwcaIskMG8MvozvCVceINmpMOMDRuTY3lTtIWs3l9inankW1R+Ec0050dbYGpCXOT6AFocbhRUK6c0VPYlsQPIRx9p1ypjUy8aaxNSMXwz/Mrw9KdIp6pQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542209; c=relaxed/simple;
	bh=H1C7kZP/1saJTF3szwbCvyp5MoGcJXfSyiIx4owRR1M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dAQAWIh8ks1XT1fcDWu+lMyWVSqeDGzr3/I0d30DhIUyLqA5+kXlY1B3TZWP8KRY7ATVO1lEDdN1Eq4dEA8NTWoUDdOLDw6LfjV06B7JF/OYLxOyiiNKFYmT/u9/2HQCjuxzVeax8DryqTvRljSzL/j4CpjxfVh3j+yN7tbhnPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QXaUwY8E; arc=fail smtp.client-ip=52.101.85.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QXaUwY8E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/ViG2OVIyzRSRepVOlzaSGbtfFKknMf0zvWHK1bsAYBemnstXZEyCMq7hT+8uDMiG7hUM/LRFDH5Xgc1Wd+euHTrgbKXYRTADoEGUnGBPzt7emjmsdJ+iLvKQfTFZFuEp4f1Np7s1Z/e+CFScbaDNaSSXQq97V/ZXdVjBlB0t7RzCxFhQ7CqUdf0vivgQSDt4ecxbnsmHV2BYB2VqCdkLfGRznh24WbGmjeMkAoOXvjlWS1k+HZTz92f5yDHrn6ZHMK3ZdXp5aZu/sdvYcvRFkLU3RNOJx4JkvJzMH2n7igkzkeYeQME9qwCwxu9fKd3k9kasQipBtXVQdH77JS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LC7llaThCbKfDd8Z8oN2/Hl2niOClnAtdzYutENZFag=;
 b=L91jcFyMag/AxcWHYOVZsj7JW+H/KID+6amB/H2VSxfZWeLLNEoihFq3RJaS9KEL0YhSoFSnPfTz4Jt51qExDLHnNR2Ty/LVLLiC7bnzRcX4bUPYHMk8x3mA71dMVUC8AqwN5lGABwSwes1441eN8/TvfKdU6acg3sswNE/CA3yUEZxqv0MghH2e1kE/3hbxgsCB2rCn/uZ04Y+LfacVGTbDLbtOt+UfItnO0wYfQFBcA7xqC43mo8cGIun/2kuTVmVpVYrpIYzTBpuOUCvD4hfs1PzXZ4tOpJbStVdRx8xFSB0LPjlyNPNKX/yZPoMRi1gGVq5+2pVzdOjayb3ipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC7llaThCbKfDd8Z8oN2/Hl2niOClnAtdzYutENZFag=;
 b=QXaUwY8Ez84Wi+rMFTzhcn4lo6dITiXBj5dJ1DFWq5eSI11tV4Fnw01PLUvKyLmmSIv2v0MUVf5j4U166AY736aRjTUAtxfJ0nqNRp7ixIb7XZnbQIQaP+A3ypZNH5eqEr026Disf7Z3pnv5Iyf4kjdnEkgeo7bL04AUXc1WVoPkqpk2jr30umvG60awRNDCJN9qknOycKNMx4ygsTK+/o+oL81Fdm2lH7VD9I7hD8hfQm0MdM3O2da0z8/OK9n68kMnHrpZYW21Tjgz4AUsQai3JqEQ5s7e5iQtGl9Naf+L7ft6djvQY7OmB28B5CjhloOQTUePPhB7uel5byqR4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA0PPF864563BFB.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 19:30:04 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 19:30:04 +0000
Message-ID: <ea920206-37f2-4e39-a931-1206434ee877@nvidia.com>
Date: Tue, 27 Jan 2026 19:29:59 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/4] ASoC: tegra: set reg_default_cb callback
To: "Sheetal ." <sheetal@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan kumar <mkumard@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260123095346.1258556-1-sheetal@nvidia.com>
 <20260123095346.1258556-4-sheetal@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260123095346.1258556-4-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0372.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::24) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA0PPF864563BFB:EE_
X-MS-Office365-Filtering-Correlation-Id: 359df894-0dc2-4cf1-5dae-08de5dda7888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFNDZVUvS3pnbzhBOVRYYUxoV0VCaFJlVWJiRWZlZEF0Z20rK3JiQ05YejZh?=
 =?utf-8?B?TW1QVnZGM2RLWm1MWFFEN1hSMnJWbllhUHVZSnRLVFZpU0FFVSttZzVMMGNR?=
 =?utf-8?B?cERhUExjWS8zT3gvQVBBd1pkbmxDOTZWeHZkY3k5TkZUS2dSTHlQK3kvRUhk?=
 =?utf-8?B?dUQxVTFnM1F4UUZNRW5XUzF4YW92SlAzSXFmY25VckluRGlPVnluWWQwUWdG?=
 =?utf-8?B?ZytTTTJFQ2x4anJEVnpvS1VHWTNlakY4WUl0cVhzYkdBVkNZZGJWVG9NL3k0?=
 =?utf-8?B?eUZJb3dhUVJhcWdCaDIvR0p1enVlT0dBSGR3K21BUjA1WDUzQ0lYZFpiVHo1?=
 =?utf-8?B?MHhoeVUvcmcyM21IT0UrU0ZZVlI1cVRES2ZqTU53eEdHbW41eVVsZjhxYW5M?=
 =?utf-8?B?MjJaT3ZYR2hMM2ErV1dPOEZrWUJnVjVLRU93eVBta2N6VmtWNUxFd2VnVEhM?=
 =?utf-8?B?TTQyZkY1MjgvNXhPMktoaTRWczZ5V3lEbmhDRjY2dXdrS2p6VG42S3dVZFVI?=
 =?utf-8?B?dm1LZmlyVmRBSjJEWVhRcUozRmxsTTBOb3F1bmthQndxTE8yU2QrZkdnbTJj?=
 =?utf-8?B?Yy9oWFFtY0NhU0xEVENnUm1mZ0VwWnpUS1B4NWwwSkU5NktiaGNZaUVwK2Zi?=
 =?utf-8?B?d3dBSUhKc3pCUDFQcnYrRlpTM2paZ2NIc3hFdmMxUExmWWZSblZjSjZWV3ND?=
 =?utf-8?B?NzhvRFU5OEt5eTRDOXdiZTFKM3h6RitXbk9GRk1LanpTODBuS0pvR0FMSTc4?=
 =?utf-8?B?eWVPMjRBMzl6S3U3RGtCSWJRdmh0Wit2cU1hMnpGZlFpZk54WWxRMFhwV05v?=
 =?utf-8?B?MXVDYjVXTnF4aGUyS0d5NmtQbXRHNC8wbkVWUkRwZVhlbHVqY0h5NXgwc1Aw?=
 =?utf-8?B?MktqUkFvRzgzSStHTWlJeUxUMUFXakR0cWJlQTE2cnBFMVo1SHdRZVl4azFm?=
 =?utf-8?B?cGJZOXp3VFVNOCtDd09SUi9mcTU4M0NwOEh5bjdFYnlrRmVEbjA4cFhWNHNG?=
 =?utf-8?B?Y2lJNzYvTGowV1Y2aVpkaGZpZ3k5Z3Y2aUdsL1M1MWc1ZGJYYUNCemJNeDRO?=
 =?utf-8?B?Smw1dnQ4WUpHMmc4VVhmYmZ0L1pGTDFIVW00MHBuOUFaNy8wekpqVjFVK2dt?=
 =?utf-8?B?R2FzK1kxUTE1WWhFN2R6MDA5V2hoaDRpZEJBODk3MlNuN3RiRUtmLzJrWWxG?=
 =?utf-8?B?OTk1bFhZdUV3M3dRM21LdDZ4MzlYQUdQalRwc1RsZ2lxYUZyVnZ4djZGQk9m?=
 =?utf-8?B?OGROY29FMVBNUVp2MnpUVFJuRFQ5R0xSWVpLMGNSRGY4TFYrMkdjK0RrdGRQ?=
 =?utf-8?B?TEgra0tCWGZXdk11d2hoaXFHQTE1TG5jbU45Qm12anFHTTJ2TVl5WFduU1Na?=
 =?utf-8?B?TkswWVpGZ3F1MDcrOC82TEJJWVdrd1lGRCsxRkpuRk54MVAzRllldXlHeW9u?=
 =?utf-8?B?azJoRmpZNTR2Y2lBa0J6cElQK1J2MThyTUZadkZ6bEhEaDhFMUlXcFR3MGpP?=
 =?utf-8?B?TFQySm00WjFVMTNGejNSdGRCWGhUa2JkM0tSWlkrQlJiay9SNDZVR2N2RGho?=
 =?utf-8?B?Q2E2eS9ma3ByeTBFdU5tQkpzM1hBY21VSDVNS1l4SlJZd00wMGdBR3JkUmN5?=
 =?utf-8?B?QjhKeGVvZXZvWERwYmphT0xQR05MQVpkL1lHUi9kak1wbkh1ZlplWC9idXNS?=
 =?utf-8?B?VzlOc3VFdWJRRWJqQTE5OWNnTTkvM1dvUGRPMjZmQ1VZSnl4ZSs4VXNPeGYy?=
 =?utf-8?B?S2grYVE0Qm53Z3FxU0xuN3NHMEtPZXN2YVpEL1lSMDdZV241dTl5eTFsWGhJ?=
 =?utf-8?B?WUV5c2VYNWdpYWxWUTVhN2Y3a1FVQy9Vd1VIUGlzalFxNW1KQ0lhWWJ4RG1W?=
 =?utf-8?B?SkZJeE0yUm9XS1k3WCtHM2wxSnl2SHBzYmc0aU02NTVFZzF5Y0h2alJ6V3BG?=
 =?utf-8?B?R0JlRGRYK2xaa0xyNE4zMjJjVi9YSzVyREM3TCt3OG5LSTBidE0yVjdlVTQv?=
 =?utf-8?B?WmExS29nNE9BcjVMYk1ETnBuM1pVU1crQzVCNUhKT3hDV2E5VVpyWS85MTFF?=
 =?utf-8?B?anNsSFVEbWZmZ0paUTVCTWNuQTVHQ3BVbThqbHZyQ0lGRlFsYnpLRldOUEo1?=
 =?utf-8?Q?vUMA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTJPLzY0c2luUnJscUVreGRlUEFEZ29BMG1MRE0xTGVCRWNRYTZlanowMHIw?=
 =?utf-8?B?R1B5RHp3UVBucEZZZW5mTGxrQlJsbHpoNE5TdkhDZEZ2YWNCaDZQL2Q5d2l3?=
 =?utf-8?B?SlhtRy96YUNKaWFpTmtFWlVjUzRQbml2U2VTbVR5Qnpid3J4ejR6dmZ3b1pY?=
 =?utf-8?B?RGE5a29IbHV5b2d2VUFHanRpSjVoc0F3RzFCMXFTcUluci9CanFGR29tYlNR?=
 =?utf-8?B?UVJGd3g5S3NUc05nK0QzeG1vNU5lM2FUWWMydnQwc2NOTU1DN2hiVlhPa0Js?=
 =?utf-8?B?cVRCUklqdUJHNFFmbGdGcFVkc0Jld0liWlc0QUd6a3E1R0w4Y0o1SFFRSW9l?=
 =?utf-8?B?b2ZadUtSVGI3dFREN1paMUVYSTFZTW5vbkZ5K3FxaUM1d2tOUnBhVStLT281?=
 =?utf-8?B?dDRhQ05tamNuTDVYYWQ0aGNWYkQ5QmdKSWxRWDEzMDRNRnV5YVdmamp0ZEk4?=
 =?utf-8?B?dkcyaGlZam85VXdaejZ2aXU5elYrL1Z0aVBWMGFyYWRjUXZvMEZzZ3FTbUFu?=
 =?utf-8?B?QlBZSkRBVDBHNHFHSmxReDl0SmxOOEZvTnRWaXZDTHp4MWtEUi9xQjkvdlE1?=
 =?utf-8?B?ZWdXenpNV0h3U21KU3Q1c1lCdWtqZGQ3NzBocXNMZlRKbEIwOVcwVmQvY3h0?=
 =?utf-8?B?YkFVM09RL3BING5VeG5GZWxQMldGZHQ3djdGdGpFZmVielE0TEpXbCtqSUU0?=
 =?utf-8?B?UVA4VUM1OGEwTnVzRUR1clpHdXM2eFJXSmRRWE1xdjFWampUVEIrTFhMSmJp?=
 =?utf-8?B?Qm9VQldZTU90WjdIM0djK04yUHhuZTh1WjBLUm92QXgxamgxRitMSDRJYk5y?=
 =?utf-8?B?Uktlb2xEMlpSV3lqanNyclA2ZWpPTFZZSkllNTlyV3FnTCtuWFFpUEtNRFRy?=
 =?utf-8?B?VFZDQndpRjBwY094VzR2YmRaREIrb0ErQVJYQWtZZ0FiYzBkaWN2YnNxZkY4?=
 =?utf-8?B?OTlDMVRqVlRNRHBmSmhCaXF4c0wwcGMybDNHQzNITHZMRnVFanhOcVNrSERH?=
 =?utf-8?B?d2MrVjdtRUF0cGhpYmdpUjlmTE5RanZRR1RFaVRERlhnajFjMm9jVHNjU0tq?=
 =?utf-8?B?RWpZMVlDeGp4VWtUYWRhY1N6aTdIb0d5cDczcU9wMEhYdkJYMzNpYmVHNklK?=
 =?utf-8?B?QjZDeTlkRS9uU3MrY1pzcm1uejRzTjFlZER2RklWUlMySW55UjFWRGVNZjRo?=
 =?utf-8?B?V2JQMnZmSGp2blNHZHVvUDBqbjZmTVloQWpyZzNrMnY5aEl3WitBRFpxbWpF?=
 =?utf-8?B?SzJlaGI5K1pIQWY2bHhzVjV0SG5XdnBMSVQzZ2Y4MW5BUkdKY3RtNDI2M3dD?=
 =?utf-8?B?bDN3MlN0cUJJWE1TQjZIQW9hWm53bDgrK2VGb09HMi9USHFZMmc5NXFPTERM?=
 =?utf-8?B?YWhhd1ZiMFNjTkcwdHBhVm1hNllSUVN6TXVUbnM0Rm53eFlhaG91WFFObVcv?=
 =?utf-8?B?RmloUjZBMTNxeW8vam9LR2hMYjcwZkg3T3VnbWR0YXdIb2NHQ1ZzRmp0Sjhi?=
 =?utf-8?B?ajBnR0hxa25oTG9OZWpBMlRqZHFPTVk0b2N5aEJCbkgzODk5QlBpM09KUWZJ?=
 =?utf-8?B?YmIvRnY3Q1dUTVFmdXdidjdMb0NzaVpRNVhrTUYxSmNJZGxQR0xZV3ppNjU4?=
 =?utf-8?B?ejlqT1dELzBLamFOREJEMUo2NE9TNDVxdFoyYVFUbjRUclEwY21hRllUNG54?=
 =?utf-8?B?MldXdVdkdzVabjJqNGdhMTZ2c25GSXpBZ2tLNGs4M2pUTTFpbU9HK3lBa01H?=
 =?utf-8?B?eTQzM1IxU1l5YTM3T3Q1WTQ4YVZaZlFoS2htNU5NVlE1dFNwU1ZsSG84Q0xG?=
 =?utf-8?B?MjcwNDIvQmdxZTZJNmFsYVdNQm5wd1NwNlF1RDUrKzZjM1huc0VLOU9ZYm9n?=
 =?utf-8?B?UGQwUEJtVkQzYTV2L3Jva2JJQ3VuandhbzRibC9aaFZpdTdHdGRjMGhNTWsz?=
 =?utf-8?B?V29TTkZRTkZYU2YxMXB4elQ3VW0vaWgzK1hnNUhHSHJ6UHlBc0djSU40T0k1?=
 =?utf-8?B?emZJQUltS0h5SmM0dVp5TU1VTkUvS05kSjE0eHJmSFdxbm5BS0RCS1R6Mllt?=
 =?utf-8?B?eDFPdiszRG5JSmNDQlhUYjAvVlpNTGdQbGRpTmphL213eGQveTAwZU03UVRs?=
 =?utf-8?B?L2RtcmN5Ky9kZ0RHaTBSNmFDcE56TXkzMlZUSTc2ZllLR0xqNG8yd3dLdkEz?=
 =?utf-8?B?eXJmOU96c3dJdmJyWTVlampVcjhYUE14dlBucmpIVWhQRHBBMW1XWWFRbUdN?=
 =?utf-8?B?RW1LNi9hTHZaMWZWRSttYklqNVFzTnE4bGlDMEJXbXFES1AwZlRCZXpLc2xk?=
 =?utf-8?B?R3NpaUl5RGFaZXRDZ2NXNW9RRWs4NzlWRnMvOGlTbGN0eFhPY2Uydz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359df894-0dc2-4cf1-5dae-08de5dda7888
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:30:04.2126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4s4XOqDdZYgFzMZ/a8qXdNnr4VQeWqFt6a1P6ckstpiDloJqKsDeYvMsIWI/0hYqbXyp6z/t1SSXmWCXCOTzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF864563BFB



On 23/01/2026 09:53, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> Set reg_default_cb so REGCACHE_FLAT can supply zero defaults without
> large reg_defaults tables, simplifying cache initialization for
> zero-reset registers.
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

