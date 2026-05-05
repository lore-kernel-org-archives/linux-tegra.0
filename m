Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490243636A;
	Tue,  5 May 2026 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988846; cv=fail; b=p1PNZjToI5MYvpQEOaEjt5L/P8uUKa/W1L3xNGXV59673fBGp+J8fZ37djMuph2pUvlOfzPqBjb05bSI0CPl5fq04/lAi0kut9BxiutkyFZfQCkPKDKvbOTFmV9YvabqsJJNiFeza5M84nRE+gnC9RUd1eMzB/TtDZ238BuhWtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988846; c=relaxed/simple;
	bh=y+u9Lo1SZ9dkTq9G9OE2Jrr3iASfsGxu1CvAKsULiw0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zqwc8Duys5VckC3ZJsERzDbTWc5rK5s28/km3js5r5HdAuEUWRwmaV/S07w8eGFlpZUHxtN5xcfadMWaEeFn4Gki0JJDRrILtsUsNFGzZuON20z08TdH6bhXWPgIqd3DqUw3S0sYpHe74vRkAoW64KJjctBmWZ3UDciunzG7Z+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RDNlwQne; arc=fail smtp.client-ip=52.101.52.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RDNlwQne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmd5XFvusHCvN3UnetzN/zOGbhVFdNAL14S/Vr9lxJhcbvN2bT97W6EJCfHLOyyVHxR+buGco3tTZTiAFGP/6g7o+yBMdGQvy90pZ6S2Uc/mHG9pz24Iw2TvQiDsGia3w+s1Ntag3dpa5cwxOIo6CctkcBJ7tP5M0esjh28P2zlIFqMMu3l2QaJarhSkqv4uJc/qci6WTJn1IJpGgi3XSnOD2gBpMlZmNpBGrW18bgLQRZCPNSOAHavb8F4glrH8DqW0Z/EWaL5+RpfZwgGx6q44TEqjgZTfnDvrCKYeQK5QfLNk8WciqvtJXv4eg+AEyJPuxPPXeiLbirCi0BWcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yldrHqEio3sPRnwQbXh45phOSrRaS9GG8yReaZ/tGsg=;
 b=NlbWOp6Ne4KR3YQIKPrv6zL03PuXiDC+ztsVQIWPM57OKRCAGl5HUHl3fLAHZGx8j2HyVtQI1yMtyiQ2g6uwSZ6RkbYWarQyagAlv6NsAK1TR/GUTY9k04OoHzTv/1GsZgsStIWAXj//tTwKyBwWopm2rGxQ/gf/UmdtczAat9+uxX3mGGpuZc7J0GnJMtoZAe8nKS38CXqjyLOmXYcOMnELPO40LUdR4e55dJingSVzZwsTDSKPqXmB2653g2rzLvSRyzJw2opxeJ3rWm5yC40d/LGIFFQFHvjh4WpAuKnJsisqHVmENdnXBMcsSI4f8whHuT+VNqc+qofsfIrsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yldrHqEio3sPRnwQbXh45phOSrRaS9GG8yReaZ/tGsg=;
 b=RDNlwQnecYkcHhn8q3+XVZROl2jdgSocmGjhvSaCtjGOakTmVzVRcP2ekmRITqzf3Nr9mXVjkpVXkfpiFRw+x8y73ASH+aej8PJdc/2n6zZGyQzPeL33RAYT6pNSobaOEt8QKKN/+lXy+WPHqj7ewpqhGuzspnilcqevQljE8LdW+5SdYScsuQbNiy/D0wMGd5EvXAWr512oGgklQ/bngheyxcbf0ggKvAArPC4Psb9dVHMvOzWlQXW4P0hqEeum029hTho4ESohDAjX1HqUuWWjbA5MgTccv+vhnqIyfhvQWrzkOXxhMuYxwVLsqcozCaF07H+f4bq81XcX56DQ8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 13:47:15 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 13:47:15 +0000
Message-ID: <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
Date: Tue, 5 May 2026 14:47:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 mark.rutland@arm.com, lpieralisi@kernel.org,
 bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
 <adO1lS2g8Hewj0Ol@baldur>
 <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0488.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c649089-fecc-42fc-6893-08deaaacd139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pbVy6qaQ+YwxgOYnLP8nQnKzCzELDFGX4kDRLm9f8rGGu2MEneFYe2GnxuNWKjHwmVKGs9C6jlw0Y+a5TkMYljlsry4kZKSTZO5Ef/+X4Q358pBPJpNKrrUsRRAmGOI4sBZY0Oxvdq4+k6jgetIuZew3PxFBY3+uSt48iVJgbMtFdatPNeow2D647zcsUephKL2AUGOMCeVuIwPap4Q4panNF/8+LY3LAXIUfFQ995bvIkCJRroEsew0BMtgcVEUwtzEfsT7b2umW16ggsXOxeijYfXBHjXCCxntVNKFdmMKKVBlN12MduJ5FVw4drHCQsH1GiFc7HH9AHSLOsQqCTDmofwakg2NQaRl0GNyAMFMkmsUQosOrSh8LbZfAiF3X+yi7xrROU8bfL+EdRAsrD3IeKvwvvP4PcD0KuIFIsLMJ1DI3vgu/9qgqXQn9uBU8FRo7NNocaroCpzRE5W6lgNRUELlYAVjy2HjIg5WQgMHIZFPZpekn4/4NNFZD5pJ5li2ekOOr+UwMFzSp4iZgh12E9DYxUtQQbvVGtYgGHIGqgeweaZP5JSX2tZsrmKqJOZ+YBvqlyLi5SmR41zZa3dMHMpQWrM1k7hD4vQqjHkkqHA8MDoJ07o0fUN+W+9JQl4zyCBvpKRbjf+v44Sisoh3Cgu4YheJNzWQlsx2hQyo+nWwSTXaSvASwdLGj/Q3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2s2TGdZOEE3TDRyK3BIeC9OZTUrN0tqU3YxOXY0d0IxbWZoMEIyRDlWc3lQ?=
 =?utf-8?B?bEJHM2s1blFXRzlWNWdHVnY5bkpRSVhXT2R2MDZXdlAvVU1RMnl6VFo4L0tG?=
 =?utf-8?B?a01rSzVueXIzYTJpRU15NC9xMlgrTDg2RlRWTnlnZUp1Y2ptYnFIeEFFR3M3?=
 =?utf-8?B?OVZnVDd3eUFNdVMyYk1LRWhUOUhSSElSOVhZaGxxamdWOXpJZGNtWnZlTWhz?=
 =?utf-8?B?dW1SOTJjOFNQeitONXZ3enJtL0s0MGkzMGs4RkJrY1pWeW1uSkxRMlZtN2NH?=
 =?utf-8?B?Y2JGTXIyakpPQ1FyTGVIakY4eHJXd3JqZjZoLzlrUi9QUjRudEI4SE9qazBE?=
 =?utf-8?B?UG12OVFxZ2xsUHRjMWNaTGg0NzQ5SFduc0dIeVpiYnJvQ29KMkRNeFl1Z2pU?=
 =?utf-8?B?Vkh3Nmc3VDJpNDJ3MnBxY25VTmdVcmc5YllXeWRBS21SQ0hrdTE5U1NNTVk4?=
 =?utf-8?B?c254b1pMVEJlR1VJQ0wzcEVZTjJPRndyRElKQ1hkL0kwamxLZkw4ek9pR1Zk?=
 =?utf-8?B?bTJSaXNQby9kNzl2enUzVUZYZnMwa3QwMGgxYmVNQzFUc1hVTjBxTzhJWkEr?=
 =?utf-8?B?VDNYaVg0RTlYNVl0Wm11WU9DblArYUcxSFF0OUJ2RkV2dXEwbnBMVlZRbGtI?=
 =?utf-8?B?YUExQlZ3K0RuNWliNU5HUmFJQ0dEb3NlbTdTMTZKTHlQZlBkalorN2s3Yk11?=
 =?utf-8?B?aXp1ZTV5RnVKc3pwM2tiZFFoYlJFY1h2cmlJZjI1eGNKNXJ6Ykhza0hUdktP?=
 =?utf-8?B?NEFRMllNYWJIUmNpNWhQYytRRHRhSWw2TUdSVEcrVTg0Yzl2NW5lZ3dCSU9h?=
 =?utf-8?B?L1dvOVYyU1VFTHJBR0xmWS9pSlgraWNQcnV6V3d2QnNkU2F3NFRwOE5JdXUv?=
 =?utf-8?B?TERCdHlaZEhNV2F5VXJ0Y1ZQOHZWYzVmWHYrbU96cnJXdHA4M2EyOXFBK2l6?=
 =?utf-8?B?eDR4MytYVEdwdzBSQndla0cwV05HZ1JPQjJVdEVxWjdmS3RabE42bEZHblBx?=
 =?utf-8?B?UnFCMVJXSlIwTDgrUEkrUmVXQkFoekxCdnU1dlg4RGs2Z3JWZGJlSVVYcHpC?=
 =?utf-8?B?bXJoemlMbWJlNHdlSktKbVdScXBkaEV4a0MvdkpLQnZqWmRhT3Z0ZXdROE1Y?=
 =?utf-8?B?YmFNRHNQc0M4YW9oUUwzOXFQc3EyNkJlQjBpVGVBaUFvM3N5UURHTEZoU2xB?=
 =?utf-8?B?Zi9HZDhFV2g0QU1pVnRjY0JVTGRUM2w4RGJXWGUzY0wyMTI4NDNPZklTT3Fn?=
 =?utf-8?B?eS9xZHl5RHIzZTB4TkxEY1BDRzF1akU5UDJYbExXNUg4TlNOVmpBY0xlRFU4?=
 =?utf-8?B?b0d1N09zWUpCRERjTHBCaXF5WjBZbkxLbjlDMFJOWDA2U2ZjOTBJTHFpWTJG?=
 =?utf-8?B?eHRaY1g4NjBzRzdua21MTGRKcDdleWhzWkNtY0lrWmJSQU5LMzFCY0gxeGs4?=
 =?utf-8?B?MXZiKzg1djJlQjBzWHRNSjNIS1J3Qk9hcU1LRmQyWTYrY0dxdHNnQ1ZhUWly?=
 =?utf-8?B?MEgreXF5Rjh1K2hHUWFPMVRuYURIUzBUVFJ1UVZLTGtORGV4RUVmbjNoVzVa?=
 =?utf-8?B?NXlEeEhlbFJpQ0VYQUs4Mnluc0hLNlAxUitvQ1UrMldCT3NnUDJ0TUp1OStF?=
 =?utf-8?B?K0FhNWdlenpVZ3VwcU1RZnhHUGZQYUxnSDl4dkR0TXNEOFRBYUpjNU51NGpV?=
 =?utf-8?B?NFlrczg3aVM4K05UOWowR2c1a3ZGNkcvbDJSOUVGOGJ5NURzNkFySnJuUDNp?=
 =?utf-8?B?TXF1OUVHc3NUNVZPWnNJOWxhTTRHTE1NZzJQMmtKRHNRdEFVSW1NQjZid2dX?=
 =?utf-8?B?TVpQdzlMOU1ISU9FRjN3N3NTNVorZjZQTTQwYWQwdmFBZjlkOUdncG9lZnhi?=
 =?utf-8?B?UmFaR3VWbGRuRWxYY1M0eE1zdkRUV1E1K1M3dUs0dTJ3SENTY0dtYjN1NWNn?=
 =?utf-8?B?THBSVDRYQUJBa1lmTnd1L0FrMzUxU2NFZnJuWFcyVitZelRhSnNDNGVUaEFG?=
 =?utf-8?B?ZUg2eDI0OU03WkxLdzhVMHlPVCtWem9QdjRkTTZrZDZRbHRGWXR6eExOeGlP?=
 =?utf-8?B?YWo5SmVrOXlSZW51ZENSdi9GU0ZEdnFENTNteEluSEtYTkxoWU16dWVvTG8w?=
 =?utf-8?B?Skl2OTVGV0M0Y0ZnVkZycFIxNngwUWFQajdlS2M3ZktXZEx4OEs5NUVSYmky?=
 =?utf-8?B?WTFKcEc4YXdmd1RZQmVhR0xsWWJxTk5Cdm5XVlBxQUJ0akhzM2YrbHpmUXls?=
 =?utf-8?B?UTBzajdyemZnT1FMOWo3Z3VlUkxkQ3hvOTNpMS9MQThuK01iaTVDMmlseXdR?=
 =?utf-8?B?NVpUdHVxSGtISHNueFF3Y2dMWEhJQjV1d3g4N2duVlZPNXZmZXBzUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c649089-fecc-42fc-6893-08deaaacd139
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:47:15.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcBXyKWPXA3qtuAfpiKsUtcYsXlypSmJCM/Oj5mi8SfA6HPjYxG8gtf27HI7aoFcKlulynwKWnBxA/qeWiwlsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417

Hi Mani,

On 06/04/2026 15:29, Manivannan Sadhasivam wrote:

...

> Sure. It makes logical sense to relate this API behavior with the state of CX.
> I'll send v2 with the updated commit message.

Did you ever send a V2? I am not sure if I missed it and so wanted to check.

Thanks
Jon

-- 
nvpublic

