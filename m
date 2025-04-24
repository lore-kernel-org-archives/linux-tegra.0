Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8061DDA00;
	Thu, 24 Apr 2025 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479837; cv=fail; b=oRakSl6GZQDWjRTqMzb/3kOXmxfQik7ELHmGTFqFeY9naCINS8fY3jaa5LP1DJPXNwDUj2gjKbK6HpIy0o0QrOsAsSX8HqOSyw/6uEktKG36SZElOA0QJ9oCqCz0FLY0rDAO3c3rd9xMiXqIUPsIyC3yJxhmN7sAjH8KZqqEj+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479837; c=relaxed/simple;
	bh=BntXqyGqsdv9V+8D6bQJWzx5dyaFWPY0lhbFAMsnvC0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=POYvjBi/2nzpkAzuCsVBa10gVL3fJhKNohEgvwn2TRkz+lIA/j/AIixQVtMy1d+OF5usFaCSdMn/pl1lDl5gGOaSasEeMv50YCCsCnGygl94eqy3tyPfQ++3h/YUrvehGv4cAzB6eciPMjpe3aHAlwLBP9mTc0kvthPTadyBuD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gfyd175u; arc=fail smtp.client-ip=40.107.102.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gfyd175u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On6XXH1GHCNPlazK9vyohJ2KAf3owTR52nlbwoCMPBNrBE69BHENgF9eqXc8DDjlt4nmDi0xLDbawXapzu/TBNJyihXv1pdNwkaZTewHAh1jqcWCOo0mjrThCUJmvaYMDweOJ/IQiZVxlYWt+xYMs1fZ8da+F8Y6GtBKxufQ4eV45Zh9LftybwZtGzNEA04Ey4MonVeGuWHxNtOSqN5Qa1z2HcVCsfFFd+cZdNNvDdgyqz9RH6/5ibQnkeHu0avC9Eie6OYVZLoJWU4MZygoUeByrEm1tBp2W8hB2Sl56lFd0YVXxbHsMIIlHd50ZQM1k+rv5raTvgX8LCqX62gOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp3mqGQEB/74QI1ClysAOTQ5IBokIE5su4LxK5HVToU=;
 b=WI7zwK+LLzSr/+poUs+ap2miYJiPmQlApEKBEiMJ67/+54vWK3XIxZ2NLzJ6LJbKdn/ZIodw+uvCD7DSRRmsrMNGLxnAKwWvyT/ceTCIECXv/RkiyiyYdjiHqQK16eVd1LwED6UzUdA908ZlaQ9QBCEx7Tch1jdzFwDEV4aVZplY9xSzRz5EZQJHH/OBNkqZacSUcNDHjncXK3bk3qYK3J27fj91kTgDbhMTlm1nQr4aEdzcuvwDwXN1PSLDIRDa/Yt8+lQU9tChnbrZtYE4UQM7FHqMeOHDYfUJsy5BHNTUujTkjU6J6s3rAbAt22qH9R8ku6ExEsp1fxxLaMDuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp3mqGQEB/74QI1ClysAOTQ5IBokIE5su4LxK5HVToU=;
 b=gfyd175uoRv7vkMlHu7qvCnEBS9l3PG4JkuOPrzrfalOJDxtK1JlTt6l+op39rUQRdWliShp/lOhLqu1j9peoqt89Ymxi0RynhgE0mNxxIK/4fUHA38RPe39aB15QbK9/H3n6w7IpoIJCa1Ld4XQJ+WIR0goZldNA5FDyzNNHbMgL2xhV70ypbFhlDq7BWLYY12ucE9cR/5zKpbWgfRBRg0d7d/+sEfWhO25Q/r0gpHi1j/A0yAe+Y/Yqtg+jIUlwPtTThkm/EtHyBEQSMwAR5W+Z0z2x0c90kaO4uVgfgYgkH9OviRkFeBewXUak7Zw5ogT8sgKk7Y3lrE/E7zztA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 07:30:30 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 07:30:29 +0000
Message-ID: <a153d595-cc77-4996-a9d5-9ac0497b9e82@nvidia.com>
Date: Thu, 24 Apr 2025 08:30:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] phy: tegra: xusb: remove a stray unlock
To: Dan Carpenter <dan.carpenter@linaro.org>, Wayne Chang <waynec@nvidia.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aAjmR6To4EnvRl4G@stanley.mountain>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aAjmR6To4EnvRl4G@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0504.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::23) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 59dac438-2e52-4dec-fe1f-08dd8301e3b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlJaZWZWVGkvSTlucCt2ZUlqaGhCSzdXT1IvZS9NdjdZd05UNk9RbER5Qmpz?=
 =?utf-8?B?YjdrcjBJVFpKV2pKSVBjOXFTRkthVGtwaHJ1V2xkWlBkVC9SNWdIUkpTRTBK?=
 =?utf-8?B?ZDNqcHl3ZmdYM3VaMkcxb0kweUZEaUdpVFAxclkraGVkZjlnOTBWMzdEU05v?=
 =?utf-8?B?YkV6bjBoVUhWWE1MeTdJNHRETlJ5VGRyN0U2bHhteFpCaWdsaW5MZHdiTWNR?=
 =?utf-8?B?UEIwVUxPU0hlVkJYbWhxZDRwWm1LMEk2SU9tRFB6d0NySlJjamErNmprdHY1?=
 =?utf-8?B?OUVjblNSV1BDS2tDbFBoclhyd3E3eEFYcytlakJyYURObi9aUndPVDZZTzhh?=
 =?utf-8?B?VzRTbW83Yk50QURlcUhkV2lBU3oyM0N6SVcyYWU2b2dHZWJIeVE1SGVLRUJy?=
 =?utf-8?B?akFQL3pZdlBNUDVXQ2x4Y2FTWDNzWmlHRG01UDd6ODdJdU1yQ0tOV3RQOWs5?=
 =?utf-8?B?TW1nVXgzdVUxeFkyRUhIYWFIaTBtK3pBd3huNkphcytjbFRxOEEvYklPTmRX?=
 =?utf-8?B?d0x1VXRDQ09ZclVLRXJXODBHRk1mcG9FMkJXOE84WDBNMUpnS3JDbm5TQU9H?=
 =?utf-8?B?bllwVUswVG52bEQvdEhQbW1wMko4bFdVSVN4MmN1K0tqdWVLei9GM29UMTI0?=
 =?utf-8?B?QzB6dmV4USs1SmdpWHM4Slo0d1gvTjhYQklzTUNkbmd6WU1tVEp2YlJWOHlD?=
 =?utf-8?B?TGZhZnFZNVVMU1J3TlljTFBlNmdlUFJTbmVGTHdyeHFBeWlXaXc5RUZReWpa?=
 =?utf-8?B?ME9jVlk1c3A1dU8xcXZwSEJHc05YajNNdDhMTlZBdVlWNDhoRCtzOGFhOXBa?=
 =?utf-8?B?clpQUVVlRmxtaTVBdklIbUd1aXFYTlBoeUpzSmJuTTVHT0hNZUY5aktrclBL?=
 =?utf-8?B?WC9SSEd6MzAvSUZwd3gvMWFhZjBYNjE3cldFWmNvbi9wSnNLaVdxUjFKbmhS?=
 =?utf-8?B?cURGbTBCZHJzYUZId2NWMWVVSTNRdWgyanBrRUtrL2ZNUStqTWJIQmhLNTUy?=
 =?utf-8?B?elJ1dnhsN1hGUXJXOTNrUkNiSzhNVWNoTWhObmYzYkk1R0p5YnRza1M1TFJj?=
 =?utf-8?B?MlFhcW5Ib1FOL2x5amRBTWwyTHc4UWZuUllkNXI1Q3lVY3BZWHJrV0RIOWx2?=
 =?utf-8?B?RU5qSkwxVGxEdXd4dGtjclA3RnowTTZKOUF1TmJkUkxsVnZVK2FNUUt2K1RD?=
 =?utf-8?B?V1ZSV2tzQWN0YVVrMlcxT25UUzdxcVRQbVFLckh0Nm1PbzNaUmlzcUZ0bUFS?=
 =?utf-8?B?TjdWVEE3NHdldS9HbFFwRVJyZkdtYk1FaG5ZcFVVSlVoYm9IeVVkbXh4WFhO?=
 =?utf-8?B?SlVmRzk0dzhrUHR3NGFwR2pjandWRXQ3ZGpVODUrSTB0VkVsWXdtUEVsbDM1?=
 =?utf-8?B?YUVqT1VqS3VwU3dHMXkralUxRGpMcm5FZU9BaWs4SGdlTXBMenB0QXRQVlIv?=
 =?utf-8?B?VWV5RjY0OU9EU2RtNFIvZ2lHVXU2eG4wTVJiYTV5QVpQeUhXVU5lZlRWWUM2?=
 =?utf-8?B?cklVNWVDZ3U4RmV1RGpBTTMzempYazFwOHFkRnM5bVU2ekRNRkEybU14MGdi?=
 =?utf-8?B?OFREOE1JWGNId296cmVQb3REQ3lTWHZleGwweXNqcTQ4RVJ4bWUzTTZWdklX?=
 =?utf-8?B?L2pIcU1zbVhETm45aW1tWEZmM09MdFEvbFRyU3JEK3FxNjEyRDEwV2drbHVR?=
 =?utf-8?B?NHJLRSs3QmlIMWQ5NHRRNFQxVzRaMUhIaTV1dlhWa2Z3cW14bmExVFNUUzcr?=
 =?utf-8?B?ZzR2cUlNdE5XM1p1R1V3MUxsdDA5bjJSN0JvcVgzai9tZzgxeWhmc21SRkhU?=
 =?utf-8?B?R2g0Y1ZyU1JXdEFGTXdEdTlMU0RicGxscEdzS0tSVkhkdTNCZVhuQ2dwMUxR?=
 =?utf-8?B?bkcwSTZiOElndlVLV0pab2FhMG5ndmlROEdUNGFJeFpiWjFsVExnVVlCL0Nr?=
 =?utf-8?Q?EsmrtkBarIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STE4b1cxU1o4TlBkZHFkalV0clNzN0dQRU9wRGF4d21UM1NqUVJNK3JUTTd3?=
 =?utf-8?B?Q2hKRVhEOUJweFBaenNoQVBZYXV5ODZvc2UyVEVEOEFubEgyZ0Z4TVE0Yjdx?=
 =?utf-8?B?OXo4YXNJWUR2OVVEQ29TeGY1ZUpsMWNIWm5iRG1BVDh1V280aWJBUzJsRzJW?=
 =?utf-8?B?MnhldGhlWDZPWUFGZlgrMVpCZkttRk0vcHhOUFpUSXhRM3ZEa09sSTg3Mmgv?=
 =?utf-8?B?YUViVXZyZmNiUHhqY3UyWEFoVTZFdHh5Mkl1RnB5ZUcwSnRmL1dsckJIOFA2?=
 =?utf-8?B?TmlUVnpJOGV6eklSaGk0Y3kzcFkvSnFJOXduRGcyaUhnUDVyaVV0LytRNXpQ?=
 =?utf-8?B?OXN5MFNUZ29SRWR6VWpRVGxPT1NCWGVWeDRUanhwOXJrRkdmQS9BT1dISTNO?=
 =?utf-8?B?VXlMMHpUYUtTSTg2TElJQkMxb1BwY0lONHB6SmF5YXBiK0N2WHI0SnhObnJD?=
 =?utf-8?B?WWNvcGlMMlUrRnROWnYrcWQxTG5tNnlCZzdqNE1pUGZuRitZOXpoek9KRE5t?=
 =?utf-8?B?SFBqTW1vcDJmV094YWppRkx2UGp4aHphTmdIVzl5TTlzenBzNXFMVCs1cHJF?=
 =?utf-8?B?eGgraHRTZXV1RFZ5dmttdk1jZnFxVHJac0sxQ1Q2ZDRGZ0NMeldrOTIyc3VX?=
 =?utf-8?B?QzhPdzNYWU95UkhEQ2w1ZTM5QW9GcEdLV08yM2hYLzBJUldQN01Uc2Y3RU5h?=
 =?utf-8?B?dGpQU2RycGdnVWZaT1hvWGs0M2RrWkJHNXp3WHlMS0k2NS9KdjdrREkwK3kr?=
 =?utf-8?B?V2F4MTBtb3NCa1NGV3VMaFI5YTlwOEpCVEV5UGt3bURpdDl6dVhZUXBUTGEv?=
 =?utf-8?B?WUhUend2MTBZU3JXTkE0YjlUazM2SmFqSWpGaEJGby81aEJuL2JRZG93R2VW?=
 =?utf-8?B?T0FmUXdTRENpOHFDMTd0WG02TEFTYU84OFNFMHV0NHAzM3VTMFl1Z1FKTFBB?=
 =?utf-8?B?SXJkempqNlhTTVM4S0N6dGh6cGlDNzJVOVRTOFpTWmhSTTBvd1hOT3ZOWTlo?=
 =?utf-8?B?eVUvOEwrOUVWWldEMWJvd0FVWXpwTm9RdkJ0N2RQNlZMbDM3NTVjbVpkSGh5?=
 =?utf-8?B?cldhalJJRzgrRjFQT0ZpTkpPb3RaNU9WYkJ3aURSREs0NlhzMEtMbmZuOW85?=
 =?utf-8?B?SUlhdGVHVWRvOGt3d01EQlhEWHJXUThacExIYVl2SnpWSlNjRnUzVnBNNlBi?=
 =?utf-8?B?Y2tQRkR3Rk5IaDYyZzR5TnR0blB6aXpYVlJBajRscUhOK1d3THF2ZXdDS25K?=
 =?utf-8?B?aHVCbVJmRUpENmRQcDZpNTVZOUR6UlZnSnE2WXJGcDdBSW9ZUEVKVm1CbEFn?=
 =?utf-8?B?aCtkbnBkNktxdGxEenl3S2IyNW45MkJBNWZJQnB0ZVh3SVA3bFVWSnA0TVN1?=
 =?utf-8?B?L0pTNllmb1E2QXVkQWdNSWgrUFZwamYyUjFCZHZ5TUREbFZ0eWo1SmdhdE1D?=
 =?utf-8?B?eTM1N0h5dnpvT0R0T3Y2YnhlWStHdmhOVFhjYk51cUZPSEU0Mk9MelI5OEVV?=
 =?utf-8?B?TUlhU2RNY1pyUXd2enJZZ2hWZy9LR3d1RGxZZmxTWEV4bmQrVlNFK25LN0t1?=
 =?utf-8?B?L0d6cldHMHZSQlVIK05CSitQd0t6Tm1HYVo3Yzc0K0wxR1d6ZmY2VzQwdjJD?=
 =?utf-8?B?cER1ZWR4TmkrWGhuVk91TThQc0NrcXBvUmE2ZFZ2OXpteXlxSlk1bFhRQkts?=
 =?utf-8?B?d0x3WDN6WFBlTm1vTy91NHJ1Ry92dXVDMVdiQUg4QnFvWnMzcU52NEZTMFkr?=
 =?utf-8?B?VUovUGVSN3RyRUhLVXhqQUtUREdXVktmNWRMOEZzU3AzRGFkNDZxTzczclds?=
 =?utf-8?B?UVJxTTZ3dDhROW95NDVWMjgwUStid2p1N256M1pSaFVOMFltd0FEbkFkUWtC?=
 =?utf-8?B?TDdJczVvY3VISXFrdTBwRHk5MzUxNlFBMktVZXgzZExDNGFJelloeWpPNXlu?=
 =?utf-8?B?cURnRlhXbDJxMkNrZlBzKzBEMEdEUDNzOEc0OWVudGszWUQ4d2NHYkJhZXpW?=
 =?utf-8?B?NXhNZkNIMVVGWEsrZWcweERZNlF5Z21yS2FvR1B3bVdBT3FQckhnaXg1VXJL?=
 =?utf-8?B?UkY0dkZUWWpWcktKMjNrSFJKRFJ4UEcrZUU1dTcveG9YdXVadTA3SjM5cFg2?=
 =?utf-8?Q?y1RhJwf4C1UXm8Izi4M9I44mb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59dac438-2e52-4dec-fe1f-08dd8301e3b6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 07:30:29.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MnEv2/sfdFd9NuHhltkaD3hlJ56JHFyprajdj3rJlQi56i6otS9c+IxZOXX48bFx725U3exwrrVH4p+xFRIzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8803


On 23/04/2025 14:08, Dan Carpenter wrote:
> We used to take a lock in tegra186_utmi_bias_pad_power_on() but now we
> have moved the lock into the caller.  Unfortunately, when we moved the
> lock this unlock was left behind and it results in a double unlock.
> Delete it now.
> 
> Fixes: b47158fb4295 ("phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/phy/tegra/xusb-tegra186.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index cc7b8a6a999f..23a23f2d64e5 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -656,8 +656,6 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
>   	} else {
>   		clk_disable_unprepare(priv->usb2_trk_clk);
>   	}
> -
> -	mutex_unlock(&padctl->lock);
>   }
>   
>   static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for catching and fixing this!

Jon

-- 
nvpublic

