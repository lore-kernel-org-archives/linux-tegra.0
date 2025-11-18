Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60C33554D;
	Tue, 18 Nov 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460547; cv=fail; b=dk1CNynTDj7u7rdxlAqfZa68t6c0rz0AgQqz5bFg+s79A77bF7MLZax904qvSkq7DGzM0MslsfWXE47R/Cn2p/DL9Z0uFt4oH70jbTqP8rgQr4D43TNIjfS1P85ZRRjKNYgrOOGRZ+b1tPsWuQtfUghgAANEomuBK3aAeHwTTgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460547; c=relaxed/simple;
	bh=DZMXkVM8jpHR1s/7AXCJQUscaR37aSGbVrCMDXM/NHw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ohcr2716XL3VMq/RwXDlCmZtJkvnr6yHzrRiZxfRvrjFRSBCZgq2JFF/FUEQ2X4BABFfCOLnOf0P4y5fVUjmPX4CTre83Yxopv7bFdrM6M2HTdJqoNskDQE/9/p27pcpkf9Kd7uQ2MGDSWDMOWqF+muIWx0FHKptFGBoUWukVD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y8PiiLbn; arc=fail smtp.client-ip=52.101.85.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y8PiiLbn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fS7l50EkZ6Y0CKZJQ81HfEQ+TtuGi2ttWGlxAQX2xgcbRjmVYOMRqBES7YIFJwQzTFhjFGqOLqhWbNaEw2m494Kty6zYlUrIKcSJKo78iQ2U4/I32QVNyJwALss5gJNzPDHvljRDc1CCs/1ulALQtW5V4fnVeXOhHEXSsamlYu1JifK3HLatoVGrudU1hN0t/07W1YAfKqCFMJDcgY154dQ1KdOeI5UJYRypEQY07iE+SrbHel6JYfT4PrmDQuimHWHYd1J++iD0sPu+u2O7ewaLj3bIebDNLxwN+8HegcupyqeZCAW1GYur+v4BLB1FuWZTQ5Kh2UzXBvmVgsmIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhsnNDayl+5AVlx8S/wIofbRBbMc50dWppRtYpGTLmA=;
 b=yRDLDutX4jwxB4d7vZtIxpMuvDSaX1h6eowO2k0dD8XMs5RfqaoEPFF0aW5KwysU/pou9k1k6kicqx5rktT3o6QLZaUHjRjjH2fQXm7BvIUBMHfKJRd4AnF8PNayLPPjfurUKO6yWrw8EoAirbKkX6Di6NB4+hBB253YTg9fY5a2rVCW0hM/6HpFkbA8mWowPrcgFiRawg3TIIXFmzTTZhWbhoHs6ZpWxGhzxNfrEwlwWUA4h2RE2bB+LiJvcYhUK3MtfCn/CctKnFKqCbR8pSL44JGUQOuCRb5uBdcmMhA00vjYCGBDYhCWkJ3vgYu37HH7wHMV+9cTpdcigCwcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhsnNDayl+5AVlx8S/wIofbRBbMc50dWppRtYpGTLmA=;
 b=Y8PiiLbnU41UfeQOUuqiDcC+cA4sFCriTfrNNsw/5Ad1VN12w1JcEw9Xv9yaQ+/zp44nnVaStEKc/QtAmGmOKzUpJxy5TaSMB2Rq6zhXdkqi4nPE2rI5ujMMLH7vBIKMI2OfobrsN/CRjzsvgSwikXtmQA5dRFjgr/yucMVQI5X8WFTUXyC1/mFUzkiwi7PZT6owa5UsQJ3kUnBBqfiq2Z0fbc6rdm3BJERW1a88FPOG6GLqiu4Z2tzTs1Q0WwpZlhaDF9XCpciuTYKXa+7WsKAcKwSr/D9cWvgFk+MSQ9SE0qXtFpGXiyOnNtXRArivao5nh/R8lNm4xbtVu6vzQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 10:08:54 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 10:08:54 +0000
Message-ID: <77b9e0cd-2597-4d52-a352-dd029ccb6a42@nvidia.com>
Date: Tue, 18 Nov 2025 10:08:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: tegra: pmc: Update aotag as an optional
 aperture
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
References: <20251114161711.2655355-1-jonathanh@nvidia.com>
 <20251115-accurate-fair-salmon-64eca9@kuoka>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251115-accurate-fair-salmon-64eca9@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: 49346b8b-1512-4ced-c768-08de268a7ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ty93SE5TK2JoOVhCWVJpVTdnMVV3WU5pOXBDazJmcGxUNnZDb1RLRHlwRi9R?=
 =?utf-8?B?Y3l3aWxkNnpVWGNHVnR1VHBsUHN0T2xGUFp1ZGhhdHdpY29UMHNVak1raGRa?=
 =?utf-8?B?U0VnNjhObHdDMGl4SnhqRFpQaHlmaVJZcXZrZ3ZmS1BzYmlUVUZaUjlsL0lN?=
 =?utf-8?B?UVJQam94c0hlMFNtaDdJOW1NSkFxK0xEOVk2R3lLTElRQjlWRC9paFdjOWNP?=
 =?utf-8?B?dFRLTHczQ0QzZFNlVzFGbXphMVpsMGlCc21NL2NPT3FaaHIrQTY3NGFGcXhk?=
 =?utf-8?B?TlhUR3RPb0FEQUdvTm81OTJ0U3BjQXB4YStFME4remk3RHBXMHdtOUFpK2cr?=
 =?utf-8?B?OUdyUkVzcnp0Qmk1Z0tUNi9JbTdFeW9SZXZ6RFE3QVhRQnVSbjFKYVdXYWNo?=
 =?utf-8?B?T01nU0IxRWFLek5QSFlJSVBGNEhiTmo0aFdWcUNQQlpXTFFmcGJGdTJuRzVD?=
 =?utf-8?B?N0xwUGtYV3BrRUU1QTRORUJ3bTF3ZmlOd0JSYVJ3dHMyT3dMUXZnS09uY3dl?=
 =?utf-8?B?RlR2cjBObm1OM1hVSUlkZDNjR1FsNzdlbU9xcWhCamN4UDNQbkk2TUJZcFM0?=
 =?utf-8?B?ZGxXSkJqVzRsQW04ZFdiSGM1bHRyNDBuSk5Ka2pLSTRTZURkblZTSEE2Vnpn?=
 =?utf-8?B?eVVYNzBJbDBzdlg5N2VpN2tROTNPVFBSRndmSkRRZDQwQWRERmpJUVlwWUkr?=
 =?utf-8?B?U0RQZEcrRVVOOFFlQWhFVk51MXpzOTRMdVJHa1drcmx0MkN6L3VmaVJFanJR?=
 =?utf-8?B?SmxTbTFpdHlkajgwYWRxcDY4ZkpUcmFLcnY3ZWE5UTgxb3pjRmk0MXpVcUhw?=
 =?utf-8?B?aVBSQWZlZVA2SnRadlIrWmVCdWFwQ3d1dkhDakZ1SndzM2RWTzRzU2JJMVFF?=
 =?utf-8?B?UXZHRXJDeWVZcm5lQnBHV09jc3hoc0EvZEF0WFlLcS8ybysvMmkvM083L3g0?=
 =?utf-8?B?U2hXQWZhbWZCVEY5cDRYeUwvYXZsRU4zdEVEdWljaTliZzFDZTNFWG5IVFZV?=
 =?utf-8?B?MlJOdGE1eHYvWjRlZUsvT2ZTQ3Q5bTFpUFV2QXF4dkJDZHErRUdKSzVYRGI4?=
 =?utf-8?B?UGxPV2pXNTJmcWpWMlF1RlFaY2EyRkZmQ3ZsZ1V3ZXRrYVZQMG5MQ0ZqbzFl?=
 =?utf-8?B?b2xOMThnalp6TEFUQ1pHY0p5UFY1dHYzcmtkM3JLUDhoNC9kSXJjOE5IRUMr?=
 =?utf-8?B?YTBOSlplb3o2SU9hZDV4K3pkVkxpbFZCd0RFY3NmaXhwUUJZdkhWM2VidXh2?=
 =?utf-8?B?MC8wakx6QXNSVko3K29YUmlnMkphMHRTNGJlN1I5OThnQjRKNUNuNGRONmF0?=
 =?utf-8?B?d0c1R2M0WFdUMmRIWFI5T1dHblFWcm1NSnJnWEF6M3JBcFpZaUN1eTgvTGZL?=
 =?utf-8?B?ZlRNRW1oSXhncFNTbHcxOUNab2NhODBxaHdUTlBmUTNvWjdxRnZlemcwQnZy?=
 =?utf-8?B?QTVFdDkrVUZhOEJVMit2dmJlenZPd0o2MWV6TEJFUFpHZG1XMjlUMHBUZkd5?=
 =?utf-8?B?SXBPTGlzR2ZSMXFSQU9ObjJBVVNIa0NtZ2YybFQrdzduZDlXREpiRE9jeStl?=
 =?utf-8?B?c0dqRDRUNGZ2UDNOLzgrV3VRYkluOGIwUkJobUlvVDhuUG9RZGRSbnBmcHVo?=
 =?utf-8?B?ZFh1T2s4NS83NXBZRHFIMVZxV0l0WGUrdUxXd3BkYjZ2c0hjRHNpa0pIcVJZ?=
 =?utf-8?B?aWptL2lCSkZ4bTVQcWo1RTdmQzZIeUJJSjNzR3JHbFZFV0dXd2lYU2NGU2Vx?=
 =?utf-8?B?STdWL081ZDQ5SFhzeGxGWS9lRDlUU3NtQ3JjWThjNzJGT0s0YkY4VVlxYVl2?=
 =?utf-8?B?Tk0ybU5SLzF3RzAwUmxxNm52SVQ2azhXK295Sm9PNG5Qb0EvUlBmOXUvdUdE?=
 =?utf-8?B?ZlpTd1c1dDgzWm1YM1QwclgwSy9lei96Ukx1bnVWb29Fc1FKc0cwaEh0UzlJ?=
 =?utf-8?Q?4Rg5m7l0B6Sd8CeGb9uSFfgXnZMbi2Vs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzhVVXp1NHJMcmpoUGUwTW5oT0FnbXVtL2NqbG5sQWdWZzZIWUM2MytmRFZw?=
 =?utf-8?B?TlVhRUMrbVVzaGRicGxibXl1amNJYk9VWS9ESnlnbldGdE5iV21ZUWxuR0di?=
 =?utf-8?B?aGMrR2lTRU5tNGRGRWRFL0I4YVFMcmtrRjRUVWhpdWFVRWV0YjA1Smd5alo3?=
 =?utf-8?B?WkcwWFBmYjJwMzJwb0k5NlpWSzNWTDdVdFV6NUE1blVzVWpNNnpCM3g1V3BC?=
 =?utf-8?B?QVFFTEdMam1xbmR4L25RV1RKNXdGeFJIOVZvbGljcVlPYUMvV0dmUHMzVzYr?=
 =?utf-8?B?TlZkeGFlQWlJRXhLZlFRZkIyY1FISjJESUxoaUtiZlBDcGYzUEpsMldIekJo?=
 =?utf-8?B?aEtCS0N1WmdoTUdQSFJkc3hZSCtmQVVyaytZaE82K3lvbzRvdlF6T2t2UXhl?=
 =?utf-8?B?T2VRVmdsalA4TytPamptdHpCTFI4dFZkT05hbWg1MW1mdUpWZGtYaXdoVkxI?=
 =?utf-8?B?RWRkNHNwUVdCV1I5L3hBUSs3Zkp4UW5WUXpoOXRuSU1iTDVzNzZIZ1piSlpz?=
 =?utf-8?B?VHorU211Uk9nRWx1Z0JmOE45NmpHWEkxVHVWeFdqZVA0VFZvTnVVbUJkYitR?=
 =?utf-8?B?bTdIdTJJcDJlMGp4YXRnRk1DYzhpa3hFdUFaT0wxOFV2M3FDMzVTM0JqVlJm?=
 =?utf-8?B?cmhTQy9jbWIxNzNZcmxUOXVzeVhyV3JpYWozVHhvb1BTMlFjSFJWVklEeGg2?=
 =?utf-8?B?cys0cVhIMVVYWk9PT3pSTTYzWXc0blZvWWpvSk1TdTF5RUVxdjJmVWhhSmo4?=
 =?utf-8?B?QjFtQ24zT0Z2V0JJdHExdzhBYnF6S2hjMVk2TmhzSk9RdFBhZ3N3eWVXSFNX?=
 =?utf-8?B?SWhZMEJDcXUxVmUzSVhMNlVIb0syaG1UNUZDU0hjVlNlWHNuZDIrZXIyTmJ1?=
 =?utf-8?B?WGRLZzJHbHhDMW9Qa3Z0UlBLMjRzRHZCdUVDU1dYdzFGcnFQRm9LbFBJd1kx?=
 =?utf-8?B?NFlIZzRCSmlIOGZsZlQ3bTZOdkpJVnNGTnZ0U3JkcmpqVFdZRWhaeGlEMTRu?=
 =?utf-8?B?MEhNZTFXbTQrM21tVjh4UmQ3eExraXMzT2gyUGdjcUNQNlVXcU0vVHAzTFJU?=
 =?utf-8?B?VUt5MkRSQ3BFbzNNbHpBWGJ2UVVXSEVCSmwzYVFPcmxCWFJDd01qZVBka2Ji?=
 =?utf-8?B?VFl2NUVqZ0h5K2tCQWs4bEZjVzhFbU9KNXpMdUdvTVdiVHdaT1hsZlJGdzJV?=
 =?utf-8?B?UmV4NGpIdFVxS3hyUDR4YnljQUJDU29xcHFMb3pSS1RmR3RUbGxPMWdNeHJC?=
 =?utf-8?B?SjVoMGU5K0FHbjVlT005TXlPYnhJVzBKeEpzR3Faa3IxT2lpaWFQcTNCd1lS?=
 =?utf-8?B?RHVPbXJFWEY4OHg1K21vclkrTVR2d3o4M3VaRzRxV1RmNUk3ZVVMYm1ZNUx6?=
 =?utf-8?B?czJBaTJrTTFmMnNFanVhM0Y0dGFLSndzVmVDRnQ0dlQ4SXJjTlpGaWEvWk9M?=
 =?utf-8?B?Y0tWcXFKaVoybDV5Qm41Nm1pRG1lL3R4MEtycEtPQXJxZ0xyWVV1SE9rMmp3?=
 =?utf-8?B?TWdzL0tYUENScTJ6em1saGJQOWRVOWY5Uld0aTJ4cjJJaXVqZnhZSWFPaFRv?=
 =?utf-8?B?dm9xZmhLb0tYV3lEM01nVU5sUWRxUkRLZlBQVjJFU2VrZThFK2NkQjIxT3RB?=
 =?utf-8?B?VW9qNUZNMDdjZnNNUnJWN0h6SklHK3RacWx5eXpIWVU5WXBsQkZaQWFmUjlv?=
 =?utf-8?B?Z1RMOTAvK3IxZVM3QTdVQ2ZOLzE0NUx2RVV6MEdkNFdSU0lnb1RzSG9sZlY0?=
 =?utf-8?B?L1dqVC9RL2pTNUNvSGJSMzY2dTB0UnpremROS3YwVktFUjcxLzYxK2Q2NnpI?=
 =?utf-8?B?cTZuaTlPWSt3a05Od09QNWpQbHlSQk8vZm9QSW51UFlZZEcyc05URFNlRFBD?=
 =?utf-8?B?TmZtR2VROEh1Z3VwSTRnYmdJME91WGxFaTNybDRzTDcweTFaRktyelNIRm5T?=
 =?utf-8?B?REFWcW5VQjZNUDJQU3Z5eU5uQjdlb0dFSWRVYnRXS1V4VVkxNzRjUERBKzRL?=
 =?utf-8?B?aWNoSVcxTjdwR053amhaOTA1MVJiRStFNUhFYXpRZ1E3V0U5czlHQThBU3VC?=
 =?utf-8?B?OExvaDNCeWFia2VmazdwOE1qM3dhZk5OU2hTSHBxdTlsa0tXZ3UxakM3Zjh4?=
 =?utf-8?Q?uQ3coMr+t7Q26RfiLbZDWgCf6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49346b8b-1512-4ced-c768-08de268a7ae0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 10:08:54.5855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBNefIvAY0G7yhMjQY2j1EgvH1CPvOXD7cKyBJCsKiUpdtw0ZVgA+jQwHayuWyoxOfh2pHV2BK+Vdm00Uni7Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104


On 15/11/2025 12:25, Krzysztof Kozlowski wrote:
> On Fri, Nov 14, 2025 at 04:17:10PM +0000, Jon Hunter wrote:
>> Not all Tegra SoCs or all versions of a particular Tegra SoC may include
>> the AOTAG aperture. This change makes "aotag" as an optional aperture for
>> Tegra234 and Tegra264.
>>
>> Co-developed-by: Prathamesh Shete <pshete@nvidia.com>
>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> Admittedly I don't know if there is a better way to handle this,
>> but if there is please let me know!
>>
>>   .../arm/tegra/nvidia,tegra186-pmc.yaml        | 57 ++++++++++++-------
>>   1 file changed, 38 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>> index be70819020c5..defd9000eed2 100644
>> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>> @@ -19,17 +19,12 @@ properties:
>>         - nvidia,tegra264-pmc
>>   
>>     reg:
>> -    minItems: 4
>> +    minItems: 3
>>       maxItems: 5
>>   
>>     reg-names:
>> -    minItems: 4
>> -    items:
>> -      - const: pmc
>> -      - const: wake
>> -      - const: aotag
>> -      - enum: [ scratch, misc ]
>> -      - const: misc
>> +    minItems: 3
>> +    maxItems: 5
> 
>    minItems: 3
>    items:
>      - const: pmc
>      - const: wake
>      - enum: [ aotag, cratch, misc ]
>      - enum: [ scratch, misc ]
>      - const: misc
> 
> Should work, no?

I was thinking about that, but with the above, and if I am understanding 
you correctly, it would permit someone to make the following mistake ...

  reg-names = "pmc", "wake", "scratch", "scratch", "misc";

Hence, I thought that I need to be more explicit and list out all the 
combinations that are supported for a given device. Let me know if I am 
misunderstanding you here.

>>     interrupt-controller: true
>>   
>> @@ -50,12 +45,12 @@ allOf:
>>               const: nvidia,tegra186-pmc
>>       then:
>>         properties:
>> -        reg:
>> -          maxItems: 4
> 
> You need to keep reg here. Each variant needs matching constraints
> between xxx and xxx-names.

ACK! I will correct this.

Thanks
Jon

-- 
nvpublic

