Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A82356D6;
	Thu, 17 Apr 2025 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888196; cv=fail; b=oTR+4DD1cnV2HMctuGqgWfc9oRn0awZhLB5ufwssJnCafS+Qvzn6NYdgCfUqrAL1i+kJ36ARycNfYN3YtbDFOEpTguaWckIc0zemNCat6ea9a469HcYZxgZAuwYPrMvEpeCGx1UnYUgCu1A3RRAlN4so/wVE/AVChY7lQ+rau4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888196; c=relaxed/simple;
	bh=QoR7YdgfapyiH7MMYjpCvP21d6/c/k6hriC3bEpB5no=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TLwf7ZW2V18zJD7hWpPYw3pmqpAsMhMf1fNJ5dObC67qcOZwWaZD55ZPkQFhNAMarINdvkjrf2+UHk87swfEz/o+T8b+/LoJPpVKOUsvqREJkXB7qUIROAW3rNPGC8Jj471fr4gZGBR3iS8Y8GTDYe2OaOJS6vBbv+2iuojPX9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZQtOSLk3; arc=fail smtp.client-ip=40.107.220.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZQtOSLk3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvSilLmwcRYebI8W2YupbT+gq1AlT4xfyqRJle2WUvRzbKOT71e573pbFW/8aND3FypRt0hntRuMxyEY4psKeIo0U6bHU9km2oWwt8Hps/KUTaoa5fpkzmpRKytSWpcnJHXXJoXsUA5Qq6SnbPmaUdoclosua5hHV0PUjjxY/8wngoi4DJ5wkuEQQgtX6m3hktS2mdRh8baBFBEebRA5XMiTG2NoDETKkpUwh2OKaRSiQcMSVYvapAX70n/8pggdiLCqDMb0onnEA5Tj7cYyA+0SjW7VMcdgSSXuEho5ijIoKLZ7Ti1mB/S1gcp/VlKjH5PyGd6qgljYRgUsOLvHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQouWKoKqN7ajHzKR0RX6UVtRCSuI2SaUWXkBowT/ZU=;
 b=EZSF+06gIiF/KVhyjP5bpG//psvqOnlZltV9sZx58jX9O8arwsWSPYTEtJSF/a6brMJzYaabsI4KPeKKdqRnIqbAbZLydRuU1ewu/l1XChD5ehx5ybQfCyhtW6V2OUF9X+vvgp824A7MLTPO8TsZclmzEm0KsSg4USRgcNw3HZFqZ/Uar/EUcAdR0LH4aRo7tKRWEHIONDgHqSpyfZ8RpUIwGTUD9jBd/EfsbiWyRfvUKnl2cbXr7eSEwKHN8OilvzoWJsKeory881B/5SqtjyuoKvnjoGL4oIm1beAmy01sdffxBS/EXohcft2ff+pmIlXsV9voQy/8OwNuhyo97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQouWKoKqN7ajHzKR0RX6UVtRCSuI2SaUWXkBowT/ZU=;
 b=ZQtOSLk3JWVIWq3//csFKFsPJiKVYjUxcIBJGCVyn8vPCMY4lgauwoOhEJGb7kX0Kkoydpy1k0CscWu3yLgk6qAj3kwMFkObcuudBLNdKSbn36Ma3pBRYleqMuQez9bvbnONJJF3K1Gj9LK1Z8dzUJ6V1HciNQz1ywet5iJok+sIqQTCIu7UVGiwNhmLIEMWGD7AZrrCDtmGSs1Kd2hS5QvmU5bOzUFoLrIMTwRt3WMsqCToL6BgVHf6prE8nepLr9rvmHV5P5/+wyqh1Kbgn5PZLX2KnmOaynv5mMNP1MHHD6diWzjpy5H1GysfHdpRtbeRyrlQACdSIBHlwoVg5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 11:09:50 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 11:09:50 +0000
Message-ID: <6456eb35-3771-4820-b316-3b5ba6c74453@nvidia.com>
Date: Thu, 17 Apr 2025 12:09:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
 daniel.lezcano@linaro.org, tglx@linutronix.de, pohsuns@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 sumitg@nvidia.com
References: <20250417093110.2751877-1-robelin@nvidia.com>
 <20250417093110.2751877-2-robelin@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250417093110.2751877-2-robelin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0489.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::14) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 440816fa-93a9-46ae-efbe-08dd7da05f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0FEMWQ5ZGNZM0wzZnA2RG9sanFheFNUelBPS0NTOXdrdmwxQXdScHA5VFNx?=
 =?utf-8?B?S2J3M29xekhDckZkNDNVeWx0V0JxTFQ4VHdTTjZPaHpqNUxSUzVxamY2WW5j?=
 =?utf-8?B?ZHZERXh5MWd6bUR3aDU2YXgwdUtMV0NTWWtXR1IzTW9xTDg2bjJreGZGYnA4?=
 =?utf-8?B?RW5ETGNvVUpsRTVmTHMyckV2dlNzQnMzbHQwaGtxTExWU29HMFlPMWFXYkx4?=
 =?utf-8?B?aURHKy9aK3llZ0NVRjI5ampZSjdVUjJWZUk3czVjUFJnU2FhTkE5T01Lb0xn?=
 =?utf-8?B?WTZuSVR6WXhuY3B2UWxLQUFGTnhsN2NsSEp2ZUNHeUJzSDF5UlZMWUhIaEpp?=
 =?utf-8?B?VTg1ajBVM1FJV2luTDdERVJuNXk0dWVNV2xjNmY0ZXlQQ0QrZVg0MUlMb1Vh?=
 =?utf-8?B?SFhVWlRxSm5mNEFNcnNZYWFHYk1YOFNMcFJLVldSQjZZNm1wV3FidHR3YlIz?=
 =?utf-8?B?R0llZmxRZHptbWJCYWFxcEpZNzQ2ckg5ZXE4Um9qYjczRlA2cmtQT0J3ajlG?=
 =?utf-8?B?REJ2bG9qZStjeHVnLzZaQStoSnZ1U3BZVy9DSVlxaFhQVXI5TGJNcXNMTnJU?=
 =?utf-8?B?RHhYZkF4UDg3TERDK0RYWVRHZDBBV1JuWHRlZmN1MUc2RnN4aVVoTjdyTVdB?=
 =?utf-8?B?WFN5LzFUZHRaaEdsa1ZFVXJtRFZoclFhaFl3MUt3Ujk2eWkvRXhhT2J5TzJ4?=
 =?utf-8?B?ZUtGWU5KV1Z4M0F4WVBPM1ZVZ2NXUitnSHRMaTh5MHZ2dVlOOEJIdk91SVhl?=
 =?utf-8?B?dGllQW1aSjErQnc2SDl5RllrNTJjUlhmWVI5TkNwWG4zd1N1anZuTTRxZ2Ex?=
 =?utf-8?B?eDNJcFV2VFBMQk1DeGRGU3lDMUp6MTRFclhPOXk5c1UyNHRCbUdPNy9ZSS9S?=
 =?utf-8?B?c3F2RU05cmtrelpBbTdsd0F5cHNHZ1h0KzM0dWNQVDFHbVBOMVc0MFBEZ2Yw?=
 =?utf-8?B?RlRvZ01RNGJxUWpoMld2TEFJN1BIVmlKK2p4Q0VDaEhHWnJFeVdycjRwcXY0?=
 =?utf-8?B?T3RyQnRaOW9oNDk5Rmw4MlhVUURteWh4RUNXL2VMdWZVV01DQWpXc3BVS2sr?=
 =?utf-8?B?V2FHQ2RBV2pkUjJOdENock9KVnphdGlIT0xLV2hYY0ZJOEZCeVpIWVBYN1NC?=
 =?utf-8?B?cnBBenBmaVhJTGw4QWhRUUZoYUV3VDJ6cVlmblNlczVyV3R6RUR4aHpvdVBv?=
 =?utf-8?B?UndYcXlGaUw4VmpDOHFtYTF6RU9DcjR3YlpsNDZBenlBZk8zS3ZQTWhCL28w?=
 =?utf-8?B?RUptK05zbEl2Y0hsemlGbEpLNTY2eHI2dEhzZEJyZEpKaUtzd1ZNYkhKZjhS?=
 =?utf-8?B?a3ZpQjhPN1BKK0RocU5PYVVURkJmSnFROGM5S0xLTlB6YUFMbWhoV2Ryb25v?=
 =?utf-8?B?VjBXTXphQlNvWml4UDJXTkViOU1oSlp4dTM1VkhVei9ydi9acGVqSjkxK3U3?=
 =?utf-8?B?emlMSGFEVDF0akVmQVpmU0tkTmgzNnQ1MU1lZDNWdW9ObkRGdEpmVTIrTEVI?=
 =?utf-8?B?T0ZjZVBiVjJiS2VVc0pqUTVORXU0RXVPL2dqa3dWVE9iNTNwQXhKRWJFUVJo?=
 =?utf-8?B?bVhUM2lOc2Y1K1JQUlB0R0l4WGUxZzJKNE4wOUQrTUdwaDVhVjhUbm1JdE9S?=
 =?utf-8?B?NFZLenlyZGpuQW85Vk1PYU9BaGxEbnE2KysxVXV2RHNRaFpHYmpZWkZLOUl0?=
 =?utf-8?B?ZHdUdWhQUkhXM1hSQ1lyZytyejdxZ3JzYUJEYXJuU3FXcmFGSStrODc2UEN0?=
 =?utf-8?B?QlZjZ0Y3cUJkSExUOEp3ZjVGMTZsdWdrZ0JvYlRRQ05xTlV1SkpMMkR6bE5W?=
 =?utf-8?B?MnhwZURTNHhGdDVOMGEyMVo3dFNEWDNmMlI0Uis0NTdnVDRENkdUUnVqdGlR?=
 =?utf-8?B?RDdZTXBZeHBaZXQ3TkhYd2dnSVUyL2QzMkk3QUNjYlcwWFAxOHVPNU5PMHdT?=
 =?utf-8?Q?MBaR0e/fqCs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEgzZng3Q1FhY29GSWZ4dmNVWDVWdXIwb0VEV2ZSSnFGM1lqWW9WdWdtWDZn?=
 =?utf-8?B?MC8rK2xUTldGV29uWnl1eC90c2hvbndHMEZDKzZXVUZrRnNBaEF2NTFqZmk4?=
 =?utf-8?B?UGIzWUxJK0d5eW92SThrYUl6cHJIcVVHbnpMZlJOTDVrc3ZVaUt3VTdWN1hw?=
 =?utf-8?B?OWQzZTgzalZTNHRJNWFKdStHeTM0S3JMVzlSbFdIV0ZBZ2x6MUtxQTF4WmRi?=
 =?utf-8?B?OWlqNjl1VzQwdEp5MUY0OHBBM0R3ZUl1MjZsYytEYzZNQ3ZnNmxaZGpMNkVi?=
 =?utf-8?B?SlZpcnRXa3lGc1BiM0Z2UU9mU0oxcHZGZWJuMzRnemlncjk5NlcvSFY3NVo2?=
 =?utf-8?B?UU1CY2RPZkJWR0NXbVd3VHQyNitvQ3FHblZPNmdiOGE1QldKb3FXMlRVRnQv?=
 =?utf-8?B?NEpjYUZRbnhlN0ppRmZUVlBMOGMvd0FUL2FUZFJrSTZYN25hR1c4MzBGQXRq?=
 =?utf-8?B?akZwcmY1ekpiLy9TZTcyZVJrYUNRa2tsaG5iZUR2YnhDZVZFcDBSTWFoTnha?=
 =?utf-8?B?cllsZnFQT2JGeGplMmRFaVZwdGVXWlNlT1RSU0tpZmtUY1VLMEMrcGV3QkZP?=
 =?utf-8?B?RW0zazhPSXIxRGxsMW5lN1B6VE5DbnNRTXRFWWp3VXJVSDA3TnE5RDRNSVZs?=
 =?utf-8?B?V3dVcncrcWZueGx0NURNTGVXek83eEU5Vk1IM1pFbW93aEtucm9Jd044OURp?=
 =?utf-8?B?N05ydFRVa1BUcDlPSEFtdVNJYm5CUUJyNVVVeVBKUEUvVXZNaVBwV2gvVHFv?=
 =?utf-8?B?SDRseUg0ZWpUdENRejFRY1F0L1RWSjRjVm9PU3RKS1JiUmJsT0ExS1d2Yk14?=
 =?utf-8?B?WnNSZ0tPU3hPRnJvZGZUM3NwNFl5K29XUUpjVjkwTUdRdmNmWEkrSjNXM2U5?=
 =?utf-8?B?d2JWczUvZXIrQUdwT0Iyc2hjS3dGbEdIcFVSOGtJU2ZZN0tIZC9rdGpaZ1ly?=
 =?utf-8?B?Zkc2VXM5Z0h5emU0bG5KY2U5RUlGSHlXSmtvc3VibmdIMnFyYXRXQllCOG1B?=
 =?utf-8?B?TThmbnJNb3lLODM4QVluekxha3p3RnNzN2IrVENrQkxUcHRwWkIvdy9zMjR2?=
 =?utf-8?B?R3NQSjlGeEp2cGlQUWovUno5WnhhUnRuRVdITzlTTms5VFhxUXFld2o0U2gv?=
 =?utf-8?B?SXVMKzAzR1FYemYxb0haOFgzK0ZoYWJPTVRBQndRZWJtSXI4ZCtHUk1VNTZw?=
 =?utf-8?B?V2JkbDlibWpkd2pRb1lsbVVGRFFFVjFxamVYMTJ1UHdHME9ld3BOci9TVmI1?=
 =?utf-8?B?OWpyTVZqVzlaSjViS2FkNDJZNi9lMXkzbjdUSHRzbkY5bkRQZVE4RFdwUTNx?=
 =?utf-8?B?VmlkaDRSeU9ia0JQWEg4NThPcFFCZmoreERwSGhMbWlUU1NYLzcrRFpCdFY3?=
 =?utf-8?B?ampZT0IwTXpLRzJPY21CSUVteFpzeU9pa01SY2tIR01tUitOd21SM3NZTjRR?=
 =?utf-8?B?RC9XbTVieUt0S2NlcFBCcS8wMW5CVmFlSE5jWnZIOCttMHRPS1VlbDVkdGpI?=
 =?utf-8?B?emZkcXUxdTRtbWRwTDdXSkEwWnpHbWhsZjk5NU51YU1FQnFOMWJKcG54alJT?=
 =?utf-8?B?SEM2ZTl5VXFyQ0pJYUVqRExkQ1BCU0dkc00zM2M2bDBRQWNhODVXK1JkWFpZ?=
 =?utf-8?B?TmxnZXFxWlVERHBtVWpQdFhpY3pVN2FzYVJmQXZFSmhERjFySFhWT1hxUi81?=
 =?utf-8?B?SmkybkFnTW5FSFhPanR3V3FpanV6d2F0NEh3cFVRSmtlRlZQU3FzcUpFUUdC?=
 =?utf-8?B?anNHTGttSVVOWTVWMnVsaUlOamdjT0dJMnRZWjdhc0VpV2FVT0RhUTNJR0JB?=
 =?utf-8?B?U0ltOEx4RXo1cVByc0pmSm9NTk1iU1Z3b29pZzdpRGJIeVVrNUpWb1d2Qm15?=
 =?utf-8?B?SXAxVE9EZVp6a1ZtL3JaVzYrM3NOR0dqZU1TRllMNGpzVmpxaForQS9ENVFo?=
 =?utf-8?B?RjV6WCtDL1BFNDUvaTFiaUZKWHRmYTdkVkw4T0tHUHBPVEk3UVlWL0tFbUtw?=
 =?utf-8?B?TnJaZmtwbGxuRU1kRmFkUC9DcS9wdUJOSEcvQy9kRXlZRDdSOW9lT1VhSUhp?=
 =?utf-8?B?aDRDYkVNaTNDRHoweXJ4emVxcUR5eTJSaGgralY2eldwL2JyYjY2QjlhbDlk?=
 =?utf-8?B?d1ZBbm52Um1oZVdoQzhHRTR3YlUwQjUwYVZlSXNrRnpQM1lFOWNaNEoxWDNX?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440816fa-93a9-46ae-efbe-08dd7da05f14
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:09:50.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/V13ZhcsSxCegHuceShaVGtPDMgCbnTstGlrO/ikkenisslAxVqkj+8i5NKSWd6X2Ghy3pS8P6Ej9n0eVBvJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671


On 17/04/2025 10:31, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
> 
> This change adds support for WDIOC_GETTIMELEFT so userspace
> programs can get the number of seconds before system reset by
> the watchdog timer via ioctl.
> 
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>   drivers/clocksource/timer-tegra186.c | 56 +++++++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index ea742889ee06..201b24ca59f4 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -1,8 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/clocksource.h>
>   #include <linux/module.h>
>   #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
>   
>   #define TMRSR 0x004
>   #define  TMRSR_INTR_CLR BIT(30)
> +#define  TMRSR_PCV GENMASK(28, 0)
>   
>   #define TMRCSSR 0x008
>   #define  TMRCSSR_SRC_USEC (0 << 0)
> @@ -46,6 +48,9 @@
>   #define  WDTCR_TIMER_SOURCE_MASK 0xf
>   #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>   
> +#define WDTSR 0x004
> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> +
>   #define WDTCMDR 0x008
>   #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>   #define  WDTCMDR_START_COUNTER BIT(0)
> @@ -235,12 +240,61 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> +	u32 timeleft, expiration, val;
> +
> +	if (!watchdog_active(&wdt->base)) {
> +		/* return zero if the watchdog timer is not activated. */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Reset occurs on the fifth expiration of the
> +	 * watchdog timer and so when the watchdog timer is configured,
> +	 * the actual value programmed into the counter is 1/5 of the
> +	 * timeout value. Once the counter reaches 0, expiration count
> +	 * will be increased by 1 and the down counter restarts.
> +	 * Hence to get the time left before system reset we must
> +	 * combine 2 parts:
> +	 * 1. value of the current down counter
> +	 * 2. (number of counter expirations remaining) * (timeout/5)
> +	 */
> +
> +	/* Get the current number of counter expirations. Should be a
> +	 * value between 0 and 4
> +	 */
> +	val = readl_relaxed(wdt->regs + WDTSR);
> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);

The above says 'should be between 0 and 4', however, we never check.

I am wondering if we should ...

if (WARN_ON(expiration > 4)
     expiration = 4;

To avoid any overflow later on.

> +
> +	/* Get the current counter value in microsecond.
> +	 */
> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft = FIELD_GET(TMRSR_PCV, val);
> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain. Do the multiplication first on purpose just to keep
> +	 * the precision due to the integer division.
> +	 */
> +	timeleft += wdt->base.timeout * (4 - expiration) / 5;
> +	/*
> +	 * Convert the current counter value to seconds,
> +	 * rounding up to the nearest second.
> +	 */
> +	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
> +	return timeleft;
> +}
> +
>   static const struct watchdog_ops tegra186_wdt_ops = {
>   	.owner = THIS_MODULE,
>   	.start = tegra186_wdt_start,
>   	.stop = tegra186_wdt_stop,
>   	.ping = tegra186_wdt_ping,
>   	.set_timeout = tegra186_wdt_set_timeout,
> +	.get_timeleft = tegra186_wdt_get_timeleft,
>   };
>   
>   static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,

-- 
nvpublic

