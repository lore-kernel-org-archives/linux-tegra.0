Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7D23D29E;
	Wed, 21 May 2025 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827222; cv=fail; b=Ao4T+bSoVWcfMwbNbSngsJDDbtg+vJ/glyNTBshj5aaAqAxB+t8Tx2agZWIB9JoxPmVYv1EMC6rCAYPDhzuwphmM0Dq19lmiHg9HzwwM1P2LbXZhbA91MsCkfMx9bZtQ68FztfTJnYiPjsNEq10aWxTpOoqD994NetkJA1ZfcoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827222; c=relaxed/simple;
	bh=n80ffdiDUnl/rqvBLLMmIdgCdaiY0qfv4/MprzRUvyI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pn58soRcTtF13kSrX5FEgXuIVKKBWMwlf0ZBq9zJ/yFQUbAJ5GxmyzX1RXTWnEjUaVEO7K5uuw+nIsI1hYHGoS/zi4WqIh9jUIofv9KK5q19EDZLgNZE1fjxogoyUAALp7LHyVdICEayn2U4tUQu/FB87/P6+ZBT3yjwY4fjvP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fyBHbvBx; arc=fail smtp.client-ip=40.107.102.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fyBHbvBx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3YoSbfcAZis1na0PpGVhcFSrL93O38XmovBML3aGpC2sineohwxD6g+TJ7wX15lWvd7MvwGO3eLZQl72Yz5/rh4m0T1JPeaKdu1fWoZk17D2cuNC65XKoeaGh0khzCLmjESnEihqj8fj4FNcllMELGYHeup7e5RomEdrRnhuXixXiKICf1pXmbzFOL6VJlL7Ydef2SgHdNLQpvEcfQvyG8O+BOHqWwbw8o0ALF2WJeuaPZAlvNkwQJ40OKXcJP0nvzQs9KIFHjiMlodXth/zE10dlHYC7v0hzV1aq4yKHxC3iyy1+dFtUPIzK9zeikINp3sWWN7d9Y1glOH7wO69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF3xHunMCLsGrEN6dKMybSH9TpkTkTEB1jIdrZuCea8=;
 b=gPxMrJ6JR0/WICbF/imoCyo8ppvCKlIyBDEXZysyeM7bfNLBOkMunJmumxzSL52wDfkms/st2IafLw8GKSKjfaHwMGdYkhci4UelX4HW/kf9kuegNOe+kCMEkxwZrtQ9VenGWjP6FqbfOLuDeoKU2bfboYt/bDisRQA/X7QD93DgE+X9Llh4KzMmF0VuBRKrcf33ZdO3W5XULALGESuU939ohmDRUGRHvXpCY5SgQ3OfBV0rCb/S2/0h5BieRRCjWv/SEbHse/wgNbjtyJy+A5RYI+zv80msy21IRTANZndVuydY0Og2ylDqbl79lqDc0BNiwWUbtG+6sij3LLuZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF3xHunMCLsGrEN6dKMybSH9TpkTkTEB1jIdrZuCea8=;
 b=fyBHbvBxYjBETPxywYNSOFv6JorOzKhUi8JPFN/nNiK9Dv9LOwAaB9vJ+Ujq/RVh+lNHC9ga0g9/CTthmZK8lFvrkm3/CwQ32LPhwiYqdesvHuTI/hQ3PlgZPAjWV9bSCv8KwHmziDeqv5hRQlSJfQBZAKbjGsP8hqpBbQ5m6K60K7EvglibfI7NT4CdML9ddwqiMiXQZ0qWU6CISHL7u3D9XCuemRSndKJ11LrrC6R9CyGp+3YtTrsIOhyS7vlrD7wdapf8c/PLfz3+CxZpVq86qdiqV/9bAq+Cf30HO++blV4kKngININksXDuHf3b4G9n1GY0h18y4Z8x38aJBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by SN7PR12MB6932.namprd12.prod.outlook.com (2603:10b6:806:260::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 11:33:32 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 11:33:32 +0000
Message-ID: <35ac71b7-2b75-4a33-8e36-28b905690b02@nvidia.com>
Date: Wed, 21 May 2025 17:03:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
 <9694bc9c-4ad0-46c2-8626-e569734f2e47@nvidia.com>
 <ed48f3cf-077d-4b42-ba0a-ba35d849d4dd@linux.intel.com>
 <b9884fbe-bdc7-489b-b4e6-981121333707@nvidia.com>
 <72b3954d-55d5-45ed-8a51-c0b1edd3783c@linux.intel.com>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <72b3954d-55d5-45ed-8a51-c0b1edd3783c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|SN7PR12MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d38b0d-ac89-4d16-b3cc-08dd985b50a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDE3cXVqem5Hc0pWbWhoWmp3bENDQWpuQVJpeGdOSnRuUkkrUXRNcmtvRWxs?=
 =?utf-8?B?WGFYc3p4eFk2a3ozYjRHMEl4T0xteWROaThiN1VkWUtoRGtWM3VDMWNFbEJa?=
 =?utf-8?B?OFBiWjF0NXA4VUlOTE5odHRMU3YyVzBmeXk1b0dsN2VlOU9ndXM3SnRpTHAw?=
 =?utf-8?B?Rm9obG96T3NIZXpLSENDUGdBSE5nVGtSTUxWRnJZdWduV1NPODdGb1B6MWxV?=
 =?utf-8?B?Yml3MXhFUVlMaEw0b1NWK1pGSjhPeWIyVlkxM0Y2QzhuY2NqNXR2Q1ZpaWQ3?=
 =?utf-8?B?cXhvQUxremJXSmx3QUdXZ2FRb21PdjlKZHEvY20rSWVpb2ZUbWtEbGZNY0N5?=
 =?utf-8?B?UUtrWkVpMVo5bk5zdkRoNlJrMlliS2laY3dRbnllQUcxOUxFNjBBb3Jkdkpj?=
 =?utf-8?B?ZDV1YzRWaFpTMWRtNHN4dFFzYVJmd3FmV2FHQURTRWpIRGVWcnpkc0lDTmo2?=
 =?utf-8?B?bW5IZEJidjZqMGYyVnk3VnBxSmMzQkpnSzRHbmlycllseEo4T3I1Tmw3eHRD?=
 =?utf-8?B?azV6TkNqRlNWR3gra1pTMngzL2t3N2IxWCtiSEtRMktYZHdUSlVkaXdDZ1Iw?=
 =?utf-8?B?TURLTldXVFZGakxsUllUdmh2YmtDait5bCs1TDVHYllFdFRkNW5TTTY1V3RY?=
 =?utf-8?B?OGVPOCtFejgxMDZYdzl6ZmhtQ0NjdmJkZlZid0dKeG5SeTRTRzhtU2JUcFh2?=
 =?utf-8?B?NjFNZUI4ckJXUitOdE9KdERscm5CSzNhWkJ3cXd3ZUpXcW40RlRqV2ZiRXha?=
 =?utf-8?B?ZXdWREZUL0lWMjc4Zkl0NlgvWVIxR0p2L213ODFCVzVOMmZEMCt2R2dSYmtl?=
 =?utf-8?B?S2thUy93aFR4ZVJlMDF5ZnZSQXBTWnZETmt4Ykh5dUVnckpCRkFxaThQbEw4?=
 =?utf-8?B?OVFIRTZaYnFMSHVpbHJ4RUhRMmw1OUZMN0pSVWwyWUkxZnR5OGRKNHFmODR3?=
 =?utf-8?B?eVprU3hMMFViTnpTRXlBZHBRRjJqcUtPenlQRm1UTVJSOC9wWnB0ZGNqaFhq?=
 =?utf-8?B?Rk1FbkVCWU9adUZQZ0tWM0RFb2k2Q2RDT3ZoUFlWUFN0b3o5aFROT2ZIdVdN?=
 =?utf-8?B?cXJwVlVveUNwMFpzT3dpWEQ1bkdxUnhIQ1BYWTY5NWZob2J1SHhrR1pRUlVJ?=
 =?utf-8?B?U1JVajB5eEUwaG9KMjZ6MGJsWVJBdjUwSkpubisyaUpmWERWM0M4NzRSSGFi?=
 =?utf-8?B?Z3VuWWpXWFN3eXJqK0xSSzkxdTNSTFhyL3p3UXVzQ1JxVlpjbHV0RWpKNGNQ?=
 =?utf-8?B?YW0yWnBvR0JsVlZSeHNIMWNRd093cUhnYUo1SlJFaEFHd081dTFaazZQRGYw?=
 =?utf-8?B?VUtOalVuRHJWNHQxMS8yWnVCVVFLak9lMVd6T2N5WDNnT0ZVWTVQQnlQdU5Y?=
 =?utf-8?B?a3VSZEk3azhMMG1hZkJKdWNMUVBEMXVReGU5TE13dGErWlhZYzRDeVU5blEy?=
 =?utf-8?B?Ym1QSTNyS3Q1dHdGTnAvZmRkV1doVW1xU1pWb2t0MGxXb3krRTdjOFBEb3Bu?=
 =?utf-8?B?MjRneDQvaC9weFYwTExMN2NhTHRtVmlZOWdIekhYbU1NN3IvTlJaOXJkeEpK?=
 =?utf-8?B?aEd1ZzN4WmUxOUdlU2RrUUdIOHkrcU1WemQrWlgrQUtmMkR4RVVSTUtwNG9h?=
 =?utf-8?B?RGZzRlBGNW5RZjRMNzBHUUlCeERkbllrVko0emgveFo5VEtaSnhHeXVNMHFY?=
 =?utf-8?B?Smd0NjNYOHU3MlozaFJSZHhuMzRaU3JNbGJWSUxtR3hWYjNlTjF1MnpmRlNX?=
 =?utf-8?B?WUhRalkzQmsySStJZ2xjcGw1a2VCZE56UHUzdE9sTUJuSWJ2MW1yd1BqWnFG?=
 =?utf-8?B?SWNtZjV6b1JlbWxtd1ljVzBUUHBvOFZtU1V0SGhFY0hBZStwUG56MXgzTlNI?=
 =?utf-8?B?UHRNQ1NjamMzYUNnWHc1aHpyc3YwdTMxSGN4T1UzUWh3TTl6ZXF3aU90VVpM?=
 =?utf-8?Q?kQ8r+9aByd8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3ZjMDdQWndDbDRDaXBISFNva0NtQ0dhdXNkTkRWblR2MmRDOUcvTkJMY2Y4?=
 =?utf-8?B?QVV2OUlDYTNzMUxuVzBiMXNXYTdmakpkSENlRllWWjdnL1F3N2VuUVc0REFz?=
 =?utf-8?B?MnA5Rng3WnNpMnZvODlTQk5FRlFzdlYwR2t2Z3ZnZWhHbkd3eC9nckx0N2xm?=
 =?utf-8?B?dzdPcjNBOXhUUFMwdnRFcWZYdGw1ZGdtNUc0VmF5bWlaYW9iL3MzTFVDcWtE?=
 =?utf-8?B?QWN3SVk5M0tiWEk2SjFtVWxUdjNRRjlrbndVVGE5N1drRVZVbUF4RXJZcUFJ?=
 =?utf-8?B?bU5rcFFhb3hXZlFDdCtFTHV4bnRudks1dGNQaGxXeCs0bFUzRTFaekZKKzRC?=
 =?utf-8?B?eHBpV0lLZ2lhYXhseldKUXpIaDFuQzJKTC95YjF3VVo2N2E4bnYxUENSTkRk?=
 =?utf-8?B?clh4WW9KTnlYWCtvMzV1ekZWeXZucW5FbXgyRmw5a3hJVmpBakptcXp1YTEz?=
 =?utf-8?B?UGFWcC91R0FteGhrSWlmNGh6b2Y0eFoySkMwcng3MU8wMWROQThTRmc0bEZC?=
 =?utf-8?B?Z2tQL2c2V0ZZOXFsSzY1TGRqMHpLWkc1WlR0NWVPZkI1U2ZaQW1aYjBkQVNS?=
 =?utf-8?B?VHZvWGlleUNWTmZCQlBYWFpUWVdVdzVOMXRpanpPMDJtOWtDbXNSaFd5cGNk?=
 =?utf-8?B?cVRzdGh6Rndlek9sVzF2aDNHQ1M5RGV1Y3pNU1F4T1lFOW9YWC9mK1ZxT2xp?=
 =?utf-8?B?c2p6MWw0VEhvS1BPTisvUnlCZlpTU1F2b0VYeUhwaSs4YUpTZjFRSUFXVk5a?=
 =?utf-8?B?ZVhGUWJHcjdJdWN3b0NSS2lreDd5ek5jTzhEbXNleGNWSUlTMWdra0UxazNY?=
 =?utf-8?B?OFZodWxsTFlnODNwVVhhTC9uUTZHV2ttcjhhUU5VWW10MHFWVW43TWg2TC9q?=
 =?utf-8?B?OVdsOEdrVm5OdlM0ZnZ6RnRRQkhZQ0VySGpwRldTUVRvVUFWOHBhNVgzVkI1?=
 =?utf-8?B?b3JORWpRcHZiS0tJQ3B3VkdrQkoyU0l4S0Vwb0FjT0xJN1J0RmVtK2FTUlNF?=
 =?utf-8?B?aDdlQkZBUTJ1eWwxbmtVZmlRMWc0Rk8zdW83UE9nS2JwdG5aOWhpNGRiUHF0?=
 =?utf-8?B?UDgxTExhcCtaT2tGWmh3Mm1Dc0s4OHhpZWVGVWw2alZBMGRlWFFTRHIvZXBt?=
 =?utf-8?B?TVNKZTNqY0ovSjhPcU5PSUJkOGwwT1Qra0Vxa2RHRk1KUHcwUjEveWNGQ0VV?=
 =?utf-8?B?cTNMTHVxQkI0SDhkS1dNTlhoQkx6VVc3UzFnc2Z1N3ZwaWtzcHBZN1NKUGNp?=
 =?utf-8?B?VEpnKzZmekdEK24xNU1vdWtwbmtjS1dZODJib0VsN3laenBMUzN3NWZDQzdq?=
 =?utf-8?B?TkFqSWJBOHZvKzJCanpzZ2RmL0NzcE9tRXNWVDM2N0EvTnVXczRuODNJeTlx?=
 =?utf-8?B?QStYWHRiS3ZJMjhYeXBGejFyRVdRdGVQSkdaRjMwaUh4YjczQmhUS3ozQkha?=
 =?utf-8?B?amJqcGJCNVhSMW5JcmRtOExvdmZSZXo5RFhQTWlNbDdvM1d2eXBrTVlVOEYy?=
 =?utf-8?B?bzRBMlRWN2pJZVkyYmhFL0R4a3cyM0RIUFdrMVkrelFlQ3duVUd3Q1c1YUR0?=
 =?utf-8?B?WDNWM3ZOaUd1b1ViSURoQisxYXhYV0d0cllHLyswK3lnRnoyTHczc0RyWjlC?=
 =?utf-8?B?Y1RKS3pCOEhCbWd2WXhseDhSaXlLZGFXdHdoeEIySUs2WExXdlVNK2Q5Tlh3?=
 =?utf-8?B?ZWZpeVRQNnRIZUcvNGg1eUZYZ21LK01zR0dGMDFwRGs1WGFaTVppUkRkUkNt?=
 =?utf-8?B?SXFCdVI1WFd3TjBpN084NkxMa201ejdtMUxvYUNJZm5qcERoZlg0TGdZYjQy?=
 =?utf-8?B?Nm83NkJhY2lDWlc3MktDMTRHWmlkU0R5QXBvaGRqOTViMjNJR0pQTXFGeXov?=
 =?utf-8?B?NXllcjFkL3FpMjNCTGhmK1BucGYveVRzcndoNENwUEttMElITFh3QXJyTXlJ?=
 =?utf-8?B?NmpvUTh2SzlrNVdzNW5PbFBNNnlBcVVhaFRzZ0pTQVhZbFBXNi9wRkFUQ1I5?=
 =?utf-8?B?L2hCOEtManNEL2g4cUdQQXhTYVUyaHUrNDFMODZWRUl4VzQwcllxLzREcFdl?=
 =?utf-8?B?YlFuc2labDQxZERqUWQyc1QvanY5Zkc3V1IwUXdlZE5KUDlmRDhHSCtENG5Z?=
 =?utf-8?Q?iQPmmuyd27fM7s0XR0OuKvSvz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d38b0d-ac89-4d16-b3cc-08dd985b50a9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 11:33:32.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +coGkSQKrXHNHnVrFfwssDRYtbxnUmFE/U4Mz9L2vKA0uuhbR5tdFwYNR4iaafrXyGS1yQtlEwAPk819x+qgfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6932



On 21-05-2025 13:47, Péter Ujfalusi wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 21/05/2025 08:25, Sheetal . wrote:
>>>
>>> Picked the patch to run it through our CI:
>>> https://github.com/thesofproject/linux/pull/5414
>>
>> Please share feedback or comments if any.
> 
> sorry fort he delay, but we have CI maintenance and movement.
> 
> The patch looks good and makes sense, it was just hard to tell from the
> commit message what is the reason for it.

Thanks for the feedback. I will send [RFC PATCH v3] with the refined 
commit message.

> 
> Reviewed-by: Peter Ujfalusi <peter.ujflausi@linux.intel.com>
> 

