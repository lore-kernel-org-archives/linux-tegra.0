Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B63101C7;
	Tue, 16 Dec 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765881436; cv=fail; b=UXZpiYYLFr6hRHxz8Y42SnOAh0uUXuHN16VYlwTdpYlmVJtXwQmj1+GhM63nhJCVekBsrqFHr0LG9x13fXMAaAS8qagmtwcGWAex17Lakpw9G8o5weXL8cW+cYbK/8mv4VuqvBJt/sRyz3Re85a+ihhBks8iwWJpFSmBWX7SC40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765881436; c=relaxed/simple;
	bh=xf6iH/gXSSmN0aVjed3VrJzfLwizBaKhUD2zuPYfb+c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AvWOOSoFMX8AQHaRSMxZSqluiuFOsqxue7shOgGopPEvu9KfXnuKQtERMz8j2lBA+YGUrZTxJp99NQVbHyB0LPbDMVUdg2NUohLLirE7zcvRbi8gaHH19pF37z3H0gGVAcoJU0z7KRPsLAm0+H/RHP7Un7+e4c9iqc1OafW4y5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K2WTQsk7; arc=fail smtp.client-ip=52.101.193.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K2WTQsk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwnwWfHwRY6ISasIhGliOc0bRcvBT95ciyM6zj2DHCjN+jN3i7Ed/VEs69Cqdjk/lrtC2doCD08RNzHtB6l6mTIo6kk44Zw0r0uLDIQZHNDt2YDPqhdcTkxegNN1TndSfAVeTD0Gp+KhNXJYjgEJvOyjSYtuI56QmVhKEf1a701zFpCjlLfnD1iJoJkRh6XbDh0g1H1AlNuIoc8sR1SfqBPFSkSTuOozqhP0wK68sTDQs1WUkhBK7IHc3/eucZjjWQgH0q4GjOsrLR7ktiK/wR/NXp3AKnXiixIQIJ2f1wi6tyoHvf0TMW8jR5xZuQNLvnRyIxWuEAgAL5jJntC8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAYjn7XT223/pmJB1dX15x/fP10XasakFl3Ah3nzz7M=;
 b=tPTAZzS0TsiODN0/aQGVhu+IISiaOI5JHqzjTNIDGYNe697hCDaUCdn7MRGTp0betxFb4vRIRUJZCw+cIQo1tFOdhgpdKVBObRibnXdvIOd5VWBzhp6TmOSHx1fwyjYXmsO6Pj2IlTPzyfPupopqYP8Z+Xv5xK1X7CgPeNiyP3t4z6ABv7lK6o24lXB/n5/4n2NOX9S5iLdzCzuVoMoy4UfekR/tj2IBhHu6c0v7YzgqGJ20EfHOpgfH1MM7jGZdM7DxgOIrU3xX/SumQAClcDrVMiztDu29q4CvtcdyFUNah8EJ9VStsl4O2jFI2i4v3lR6s+6K7vfZDIZ/JxQaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAYjn7XT223/pmJB1dX15x/fP10XasakFl3Ah3nzz7M=;
 b=K2WTQsk7Za8hnexqgTMdbswoJP+rkPJc60mC+ZVVezHcWNth1dbdyqwB/GKeMLXo+xtFjyqLujWuoymv0TchUpAAatO3YmC6UtdLbDj/Ka+ix2WxsQLWbNyU/5ZuMzI/ODgilbDQUII13SxqlGwXDX2xtQZEipMEySHZYPeFuWiz37Ej8BnImYqbSmPwJLPg0jYHmRusfSOx5YOI5Tu4r7AXWygSqEms7V3w82iH1dCVIs5uMDGrlVChtDN+cIJMhnHEE07KwnAHhBqpv592+E36Q4LKCI04NacVz6C4F0RqJMnSkuEpSCLh69LQ9mGlmIA+ZfwTnXXQj5uoaY+vng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 10:37:11 +0000
Received: from IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932]) by IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 10:37:10 +0000
Message-ID: <f2f81d3e-ac2d-4b24-b071-7beb4fb867e3@nvidia.com>
Date: Tue, 16 Dec 2025 16:06:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tegra: Fix uninitialized flat cache warning in
 tegra210_ahub
To: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Sander Vanheule <sander@svanheule.net>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251208052040.4025612-1-sheetal@nvidia.com>
 <176580711685.161056.2870238132964388874.b4-ty@kernel.org>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <176580711685.161056.2870238132964388874.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::15) To IA0PR12MB7697.namprd12.prod.outlook.com
 (2603:10b6:208:433::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB7697:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcec181-da13-45e6-eb39-08de3c8f1148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3RrcjgvdWc3SVE5MTIvdi9nZ3l3bEdkb3F3M0RHNldvN1VmZDd5VjZJb2l1?=
 =?utf-8?B?emk5cW9jdWxkMWRVam5jb2s5RTI2WkkxdU4rL3c3dHpvUDAzaXNvejBlN3J6?=
 =?utf-8?B?MGtmdGo4alEzaFdrelVub2lKdVg5bHIxWHhSVVJNaG1ZZ01pR29jWHd4VDds?=
 =?utf-8?B?MEFpQmtkMHVqWUxod1MwTkx6WVB6NjNzdXZpYjhsMXRjZmhWOUVna2tKSVZN?=
 =?utf-8?B?Sm40aGxJZnFHNDBrQlRFamZEaGFEaE85VlhhNTdabUU2ZXNQaGlPaVpCS0Rv?=
 =?utf-8?B?UUdxdWJtakJOYlg0L3ZMaXhaTVJFclRIem9uTVA2L3FUZHVQTy84dE9RYlZC?=
 =?utf-8?B?Q3BlMm0xZGFZM281TWxZTWxzbUZxVXoyaDRBRjJzbzNKMG1Pdyt0Rm0rbkov?=
 =?utf-8?B?eFprTkZvSWhwcjgwNWcxektpdVpiNkx2Sks4R3lWdFlwcWllNTVCTUtVR0o2?=
 =?utf-8?B?OEVJWnpoV3BTZnpFbkczcFk2QzYxbVlXR1hldVJxQklYaThSSVVpOWMyeUdz?=
 =?utf-8?B?Q29XaER1R0RTUHlia2dtZVc1VVFaSVNnbjNYMUFyZUhHdzYwYjdCaHkxbVov?=
 =?utf-8?B?dTZjZHRiTm03YTZrTmV4cmNEZnV2TlNQbnUyUHNHNWhka2tBUStBT3Y2UmZ4?=
 =?utf-8?B?M3pRVWI4cHNhdC9mS0xzTzRLTDhpc3hLVEtQZDU0VnFtLzdWaDErZXNHd1dY?=
 =?utf-8?B?K2oySzJkWEZzWVdGSzdLL0U2NGN0WHJITHM4OTg4T2ZHZC9wd2xPaDlpQWJ1?=
 =?utf-8?B?aTdMbENlNkpTSnBScUNFdng2S2xGZkc5d3ZpZjZrZTY3ZnN2bmRsN2o3NzVB?=
 =?utf-8?B?RmtJTFJZay9YMWUxWWoxckdUb29FMUJkWTZnbWdlcXQ0eC9OMlNFRnNORlJa?=
 =?utf-8?B?b00yS3dPeWVUTjMvVGFxRWlCSG9wZG5rVnVkaVpoYnZ5MVFQMkREb2NLYlg5?=
 =?utf-8?B?UjNLTnNvb1ZDVFl0aXB1Q20rSzB0bi9vREJTbXlHSFNRWTZ2V2ZvSGlyR3ow?=
 =?utf-8?B?d1Z1eXFTZnFTNUV5WEU3SXVPeWNFemZ2MVg1Tjd3cDZvMXBnbkl0S21rUkRT?=
 =?utf-8?B?VkdKRW1tK3BrTU5Lekl1WDVEcjNJbzlsc3BpV1pHNUxHam82dDNOeUN3aXFT?=
 =?utf-8?B?c2QxdkZTSVJPSnFFZE9UQmtMaERTUkRTUFlHK0ZKSmtLZVI2NWhEQ2xnMlNM?=
 =?utf-8?B?VWRjUmRPbXRHVTJYcW9ZRStaYmJYZzllOGc1ZGw3RmhHZUJIeHFJZThXbHVi?=
 =?utf-8?B?ZE9SZGxtUi90c0RKeDlvOGU2Vk9CTDFkNWdjNGZqRzhwYU9GMmxrMlpuVWNL?=
 =?utf-8?B?S0pPQ0N0V3Jhbis4Qy9IVklqalBpakV4NGYrSFVNVCsrSWdRYTBMd0FmbUtX?=
 =?utf-8?B?M0JlTFhTaG1rK2FLZm1Ccy9UU1RvTWc4WlhoaFhCZExtQlRsZTB3NHBkb1E1?=
 =?utf-8?B?OXJiRHlRQUMzaGoyVVJsZVlKSVdHNGFVRkh6aGdqczhCbFAzZUw0WlVRYWNh?=
 =?utf-8?B?RE12YVVHcnJ5dm95aStRNENFcXI5aTAvTlFjOFBRZUFCekhvUHlCRjdqd04y?=
 =?utf-8?B?NVVRWkt2eFdibk1iQnNWUmFZWGRFUVh0ek4ycDhYMVZLVnBUMHkzRTk0MFdr?=
 =?utf-8?B?S2hBVUh4MFlPc2M5QTVWOXZ4NlNycFdJNndIWlVRcjczeEtQZEl4R3NkTDNT?=
 =?utf-8?B?VkEzRS8wWHV4Ly9OL0YzaHlrZjZaSFVQNElaWmZ4T2ZhNXJZakhHU3JadUxp?=
 =?utf-8?B?MjhVL1dHS3JCUXpQTnFmTVdrZEE4aXVZNlppU3lPcXg1cUxRWlc2UVMwYTds?=
 =?utf-8?B?WmhnYUdLWUZFQ3ByczF1NWlEdXprbWRFQnlENEkvcEVkNnZ2b1RVNTYxK2Iw?=
 =?utf-8?B?dVh5dzlzU0swdFYxTFJpdlhweEpRbUpUS0FLN2ZLOGRmNnI5TVZiUU0xWG5z?=
 =?utf-8?B?MjZ1SHFVdytSQlBoWm1KaVVHYi83eTN1bll1TmphbnlweDc1V2hRR0diZ1Zx?=
 =?utf-8?B?TklmZXlTMnFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFNUcGpId0lKOVo1YW9RMGRTSDNUdmxQMnpqZFYxM1VGSG5rWUhXMHY5MDha?=
 =?utf-8?B?SC9Ld0ovWXVZK0RBSVJtWE5POEh1M0J1ajJKbHJuUmRvUmtkT1VUYXVkMHMy?=
 =?utf-8?B?bkpEc2licEZEY3dSQmRxUGVDaWFLNW5pTS9TMnVPRUVSK2MvSDM5Nzk5djAw?=
 =?utf-8?B?NWZQbHVtSkNHR2ZoTHJYY0tvalNGUkE1Nmc4dFljbzhkNTJRYnVrajJDbWJN?=
 =?utf-8?B?UGhmZk1RUGVodTR2Y2Z5ajRvcTJhdWltbkxXUG9EbW1sKzFoNFNvUGQwcXIy?=
 =?utf-8?B?THlHQ3hUb1lrdUxIaGwzSFpDVjh6cjNoYmpsNlFJRGFLSWpkTXBWMWhZVThl?=
 =?utf-8?B?NkcyUzAzckpNb2h4U2txZ3NtdkhhZmtYcFBqSnUxeVBlaXZxci92UWI1ckp2?=
 =?utf-8?B?eXMvRnVwa1RFMitTbmdnRHdnTVJsN28yOVExNmRveDVtL0MzY01uYUx1UmtQ?=
 =?utf-8?B?U1Y3MUkyMHZaR3VZb1RxaWx5YmpWWkp6YzRVb1RtVVYwWmdOUkxxT0hHSzR5?=
 =?utf-8?B?RG00UmNudFFSZDBQOWFpMjhBbXRsaTU5Ymt1WGg4V3h4enFGeFBHbHYyWTJi?=
 =?utf-8?B?NWFBcGFJZWlVdVV4Yk5xYzF6RktNdnJYdGVnYW9UeUd6MTl2SzBuQzErTExX?=
 =?utf-8?B?OW1rUlBPTEh6SDVXNkYzWHc4MXhVZFBZV3VrS2dOQ0ZzbXc5WWk2MjJJT0Q5?=
 =?utf-8?B?UDk5bG11MzA4V3FMUFRtOWpON2ptakVxSHFGRmV2b0NjeEt5NHZ2UTYwaEJr?=
 =?utf-8?B?ZjZFT3kwSGVaWmlBeUkzaXgwYXgyUEI2ZGhYTHFFdnNvS2tNTzZaY00zNFlS?=
 =?utf-8?B?ODl3eU9HNWNWaS9JKzVFZWZ6K3dtSlNYK0hvdHlQNU10WU5qemJqRU55NTZX?=
 =?utf-8?B?eUZiRjVDU0ZsOW1MS1pBcXUwblprYWlodG5BMnh3bWxDSnNUTzI2cG5iUUlk?=
 =?utf-8?B?TnpBbExrRjM0dmVvTWFVY2tQWmJTNXlYT0V1V092SlJwME1Ua2Jnb0lOaDNX?=
 =?utf-8?B?N3JRdHZnYlJLUkhxQncwdHVXclkycy9RakR6QW5XdENZNlVRUVdRVE9SRDhp?=
 =?utf-8?B?K0tKZkF4U0hTVFlydDJCZ2FXL0lUOGlHalAvYUlEWWU1QUNSVUJaRkFyNm55?=
 =?utf-8?B?Ym9BYS9JZ25VTkRoOEd5Nlp4WHFYSUFUYXc5Zm1LUFpJVHRqamZieE1PL0tN?=
 =?utf-8?B?b0doT3FmSGE4RWlIaWlCdUFSQTB5bDc5d1VxM0tweWdxMFplWm8zNWdMczJy?=
 =?utf-8?B?OHpnWXNGNXlhanBXZVloVkd1d2JhZEtEZUE0b0V0ejR5cWV0aDVSbHh0WnJO?=
 =?utf-8?B?UXpwUmdMRVBlTnFHbmt2NWxZSG52eFU3R2RPNllIZTVMN2RHTXB2ZjdSWHZ1?=
 =?utf-8?B?OFdXbFgra09wcGQ3ZEswZ0ViUjdLUWRSdExEamFxNTlNM2l4ekZIU1hLdCt5?=
 =?utf-8?B?SmVzSkNCY0ZOdHNrNjlyQ29MeHF0LzhXYTh4UjcrTEZsc0tKSk4valJaWjJ5?=
 =?utf-8?B?aVNmUmxHR21ScXdkTmJZYWVqRFlUbU5hLzRRZmtDNElEdUZKWW5LcURMTjlY?=
 =?utf-8?B?WEFhM0RLNitpQTFMWW9MdGZvV2RkVWgzTnRoNklSR3Y4S3g3Q2MxTERWZEJn?=
 =?utf-8?B?Nk1Td3RITkYzT2x6VXJMRWpGc0RlRnE4WVRsbGVkVkhuWDVyNnpXR29EM1pi?=
 =?utf-8?B?alR2MGJDVnhlMk5jT3o0bTNsSlBsZzJ0NTdkeHlqN0w3amtjZTdyVDliYmpL?=
 =?utf-8?B?bnZsMWFMRmZmVndkVGdqQ25ya0hqRGtNV0R4d3BhbnVTNVhWb2FBS3FDUjdO?=
 =?utf-8?B?YWMyTThSNTdTUXdWZGwyZnIzYlBEL2huUUJ1YUdKaU4wSmtYUGxnT0RZWVFi?=
 =?utf-8?B?Z3A2NExyWTVaVFhNblEvMU5MdlluRFVJVEtraVRCazVscHpGdkpaR3p4dmNz?=
 =?utf-8?B?ZlFJeGZrQVdCSy95S1B5L21VTkF6UnFxMCt2QzZXTVUweHgydlpNRGN2SzJa?=
 =?utf-8?B?UThiRDc0SzdCMDRQcThwb0hyZUE3MXMrYmwzZG4xNzgvWERHdG5WWml5WjNU?=
 =?utf-8?B?eHF1Si8xZ3FxWHQ2NzRDdjkraUN4WkZiVUJGWkE2akZ5N2JQcUxJTm9hZTBV?=
 =?utf-8?Q?gdbVpXnA5z73U2Xvz1RO1nJyO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcec181-da13-45e6-eb39-08de3c8f1148
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 10:37:10.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOGdpD/PhMjwdu/K0GHdV15Hy+rZgUm4B3MqjuLfP+nn4R+q45HZi6kx8Pt3h5rlElHQaEI3BgHl6wiRK+UZgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217

Hi Mark,

This patch is causing issues with the tegra AHUB driver. Could you 
please drop it, or should I send a revert?

Thanks,
Sheetal

On 15-12-2025 19:28, Mark Brown wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, 08 Dec 2025 10:50:40 +0530, Sheetal . wrote:
>> The tegra210_ahub driver started triggering a warning after commit
>> e062bdfdd6ad ("regmap: warn users about uninitialized flat cache"),
>> which flags drivers using REGCACHE_FLAT without register defaults.
>> Since the driver omits default definitions because its registers are
>> zero initialized, the following warning is shown:
>>
>>    WARNING KERN tegra210-ahub 2900800.ahub: using zero-initialized flat cache, this may cause unexpected behavior
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: tegra: Fix uninitialized flat cache warning in tegra210_ahub
>        commit: 4d4021b0bbd1fad7c72b9155863f5b3ccb43ae91
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 

