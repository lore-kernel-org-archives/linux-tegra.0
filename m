Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64673DC4A5;
	Thu,  2 Apr 2026 09:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123382; cv=fail; b=fN7HRJz4HFS1WIy96zFz89oHZsW+CUcV4gzA+UZ3zCuQpnDUctbq+E9rPyn0oMzgsEbQP8LYtOYCRvS97Pw148x1tYcF//qWXakhJy/dMPmX8nBNxkbw/4g/5eyPVSn3C2VezvUZOo0FkA9jjCMATs2HHXLXEvyoNbX6YKxqAPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123382; c=relaxed/simple;
	bh=L0b8HcfblHJuO+Ykr0wM1WbaSxtne6AAyv4EKed4XrM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nxYC3A/aQaJl9JlqXdN50PcIqQQKE52CTHEjAsXNFpIulNLvjgo4hz0I5Kue8mG6mBZb5ThdZg7g+RL8PyNuyrJqF45UclTJ2PaEBZBhLrEaH7a5kCE6dKt7k6A4QsAd45bE1hjeCGY6wPbuz7lJ+h+7Vbsc/pNU5wdGAWJJqZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JUc7xtjt; arc=fail smtp.client-ip=52.101.62.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JUc7xtjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poHKVWU7UfV8lQUhISen53DkIaZZkgD6WBTN/nsXGGi/KzgqZ2StJ52ex4ook8YQmMsfw7UPFwPn4lTOldObSyoWBxjoR2uU44sJ1LAOoIZ7YI9oIRBPg6DQ9BD2vDBMFf1oMJRv7O3W9L0diGzpJSsA0V5Uqwc91NoUT2+hgoiLKVuWBT9R5SCsRxoC+MqBB7MHRxAPfS4bDDQuI9HLXucRArSNXaDy0pQ5Y01r0Mn4jhSchOtH8nEWZC7eMxcbC92A6UlwzldfHrzb2C0a0y6se7ku78wqmF9GzXZRs0FGl8ZSc5+5HXdQLH2n1C+6KeXzP2EscLniV7alyapyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wdd9uE7cquAoDThKB/XB3Y2cCBCMNBCClda0Q0pSakI=;
 b=EN+HCnLjliKLjRnPanVOM/8Jk1031tITuEmIwUh++DJNbQoMnwMEasXL4NE9FYsoGl3jCUyBTr14gwRB76HjSXosxm5Qpg2BWYqjS+dDHhRwWlfVXjG6zurAnoeZ0v4fQ3IvfgpJdzKwj0egbTsNw99HsfEkAMHFvautCOGUMUtiIN5MhEbP1USzS+qr8fbZZ2MeUp33Kui2W9S1l+e25boyqacfPSlxamW8Ep0OEqZsd9Vobg+lqZLhsOS0JUoFuhe75aS0XKpdQnQ7elunT607/klZJ9ArfKOdiaZovto3cFrbwkZsXOG7TT2nOv5/FqgBtgARRRCC6PPQsHhCQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wdd9uE7cquAoDThKB/XB3Y2cCBCMNBCClda0Q0pSakI=;
 b=JUc7xtjt0DzEH6cXc11FQxcFEemZ+1jvg//QOHzoSNd9kkUw0XVpJ+W/ODb9VlLaXY4bKUmw/k5ZvQFKKyIbJFFDRFcCTY/NfgjO8SRgOP1WPsRmfnybqUco7OBeF11YSYd8QhxDmPb1vVGL0HK7fSiutshSXm5WVCqU7ySXXAWQgjKmVjevXveS1lEu777d930Ui6r9RenMvp8y6YOU2rLjlkGQvs4IjEGtGwEPuUFuY9QlfzBkYiZWe5hwSE34z3hgfzF+onlr+E45gEQ0qG//0OgmWDFPV+rBwKiAZUMoB6u8JRP94LCrVw0pqrMfwTcyZ8FprayvvKh6aVvGAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB6234.namprd12.prod.outlook.com (2603:10b6:208:3e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 2 Apr
 2026 09:49:34 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 09:49:34 +0000
Message-ID: <dc3a518e-940b-40e6-aacc-9e1356d266f5@nvidia.com>
Date: Thu, 2 Apr 2026 10:49:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: timestamp: Add Tegra264 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Suneel Garapati <suneelg@nvidia.com>
Cc: dipenp@nvidia.com, thierry.reding@gmail.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, amhetre@nvidia.com, sheetal@nvidia.com,
 kkartik@nvidia.com, robh@kernel.org, pshete@nvidia.com,
 timestamp@list.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401213831.187569-1-suneelg@nvidia.com>
 <20260401213831.187569-2-suneelg@nvidia.com>
 <20260402-neat-amiable-puma-d747ea@quoll>
 <1902fb50-ed1e-49a3-b210-cd9167824c1b@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <1902fb50-ed1e-49a3-b210-cd9167824c1b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: fccb7b1a-18bd-486e-dd37-08de909d2578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Js4da+07jrcQPJymcgFxdPZ8D01o/YwCMQtlS19UQyEPlQ2ZSlNO48NMaB1tOEQWSsIc+cfwAOWi0bbtfPZz5n9L5iK6yBA8/1kqE+QLqVD1g71spyGBSCtxeG3P/HfGl8qmI1FLFZ287GWhDHe0WR1pakmPbQkCkG6uOaHgaKH2wVCOF88zVf3QCSjzm8bovDoshZyops8iDU3wdjvfw3LyfsIVIJIx3dIuWAMw+o8fDEvWo7SLTnJuNiEUeaS5qx17co4WkDGACJB2GAVl7h07/HeK0braDdS5isfFoWjpJucX4i83RfkrevK38tmXiHLRBWq5FQGht8AV8uCJG5qWoG4Ao7Fiu5zb17+u/XRxIR9iXg7/U1lfVbQvC46C1ckYDtUwJ0VNBqr0TgqR+KeTkA4hOYAmvadHlUcrVmGrFHEnd96abhTREFXFSr/HZjxGJOTU8lKKaHgTB8vHNlWG9ofwIPdmvvj2nJp9g7zixhk1fQKirZxtf6gtY6HWvkxptahHaeHtpUyU3plWaPXTADeZQE7HJ2A3/zgGrvVkKKb4zlF7cKQMVJRtaLMGrpk9tMbdq2HDvtMbIR8URxr3Ze+dKRPubN5k7nAQ42uGlkAz+UObYF730lcuD4J3WHsaHmVGpEId/d7bMnYXUwnIgiD4fUbqegcRXwvk5hwooPDZiNEgIawcSfoa27wnImDroa7N/ZlOvdR7gWD8jfXFTeJdfA0Hk0QE/mDj+TU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU9rY3pHYm9IUjlyL3hsVEhaYkd2YVBlaUxtUkhMS2dvSE1LNE5lYm55cEx2?=
 =?utf-8?B?MU1pMSs1aTB0NXdGNEVyck1ucWYyZFZDaXVyaXVYQUZVcVFWMlpMNTVTLyti?=
 =?utf-8?B?SDBjNHo3Q1F6MVhud2cvZFNOZTJZZE1KTGVQam95alFvRkpmWld0MFpLMTFR?=
 =?utf-8?B?M1NBUm5IZEZJTmZpN3pxU2trcUkrUWg3bHBoaWc0dzJIN3Q0Mm9hSW5LeThp?=
 =?utf-8?B?WFNXa0FSdWtWU2F4WkdGWXAvZm9zUC8vN0dyMWJWV1FHWGNNR2ROQkl4RDFj?=
 =?utf-8?B?V0Z0R0YwZzBjaFFRdG5ETDRETGNCK0dNM0c5cmk4aTFuRFg3TWFoNC85M0RK?=
 =?utf-8?B?WlFCbnRBSGhVcklhbnozY3VYRFdnaldhaGZ5dTdRWkJXR2NsS0UyekVJTXA1?=
 =?utf-8?B?a3FGTUp5OXcvSWNhRzlKNUdLbGZYS3lUVThhVVMySXAzS05zalBVaTBJQlhG?=
 =?utf-8?B?T1IzbTNXRWFBSTlmTDZFdkE4UHFJbVV1ajBPUEozcXNLaUlTcHprd3N3NDFx?=
 =?utf-8?B?WkdoYVh2RXliWEhOQTI5WWJnRytOa0JrNjdYZ3JSeW5IVXc2TytrbmV1bFhY?=
 =?utf-8?B?dUNHdk9rWUl4WDhyOEZxN3dkaVhSTVY1NTdLNXpPU21zWXZNbE1WaGVTOHNZ?=
 =?utf-8?B?OTNYQkIvYzZtKzlGVkxwMVhCTTJRa1JyOEU2TXI3aVpnNDdvQ0VQSllDN1lG?=
 =?utf-8?B?RlRhL1BtaW41UmVsek5TMDRoakFvYXFoSldGSE1jWmJkLzdpUGFrY2hwT3Qw?=
 =?utf-8?B?Z21uY0FUVGJmSUw4Snd2WkNiT2FsOVdQd1c0ZGdNM3cyeEVyN1BuRnZ4dUtl?=
 =?utf-8?B?V0pUS3greHQ0UmJxN05aMnc0UzduNTlDeVNINEo0VnFtSy94QnpMejQ0RDg0?=
 =?utf-8?B?Z1BzNU1wNWlLYlhCc1ZUcWhqdWFaSTl0Vi9YVlh6NjFHKzdIQ2dWdTlNQ3FX?=
 =?utf-8?B?aHRpcHFvSFdXNkM4TU05Wk00cWRSL0ErVjg1aTJzeGFlc21YcnlBcUxkOXVl?=
 =?utf-8?B?Vkp6ZDlTTjVXRjB2OUhvaTBuMlFvOUpEUzdkRkRmaUJGa2M0cVEzMDl6RVp0?=
 =?utf-8?B?VGorc0pOemlrbFViYk1TMlNqOFVYK1pWdWNMNGwrMTNRdG5EemdxVnBiVzk0?=
 =?utf-8?B?cE93RDhlL0tkL2tObWNndHVyTSs0bUdZL2o4dDhxR1NPQThueDdGaVhTTDVK?=
 =?utf-8?B?MHp3bTBLZTZPbERjVFJFbTRyWG5rdFY0aDVHN1lzdklKTHZzTkhwRW1BZGFY?=
 =?utf-8?B?WS9FOHEwV2p4RjdBUGE0ZkFEYlZQemc0ZWhoUlpkazlmL2o3WU44dHZDdHB4?=
 =?utf-8?B?V2FkUzFnZ2YvTlRJYTZqdnp4ckhTWU5iWW8rOFN2Zm9Wd2xGTmFmbVRhbFVk?=
 =?utf-8?B?Z0R6aWZxNURxUFNTMVBtUVU1WWlUaXpZTFRqbzhVbTRHV2JXVlBkREsrcUJa?=
 =?utf-8?B?WWsvOTlvekpENWMzQ0gySWJjeHB6NFZ4WlY0aVhhRnNqWWtFOWFXMCtjYVRs?=
 =?utf-8?B?Y0pHU09FeTQvUTJ2WFoxekFkOGJMQWpRczFRUE5pVDRsaWlBVzRZeHdrWUtK?=
 =?utf-8?B?am9IQVB0RDd0TVRHZnNXY0tFcGFvQWV0NStHSVBndHMvSGVTUUkwUHFPUkRT?=
 =?utf-8?B?QlFrMWlScEcvNHg1OTF2aXpoNmw2U0g1amlreS9SNEFBRDhRRjBKRFFUS3dF?=
 =?utf-8?B?S3RsckFTc1dyMGpQUGRlTU9qUDROekMrU3AxRzJ2OTBFd0E5eENnREk1WVRx?=
 =?utf-8?B?dGs0eVlXNXZ6ZDlwRUxUcXRITmpaV3IwZnRqQkV6ZGI5Vlp0blNVQkgveldG?=
 =?utf-8?B?a3ZYZHNSbTJiMGpoS1h4bllJU1RRN2NpdUsvaDV2NlQ2RkQ5Q2ZaZm1aTnNl?=
 =?utf-8?B?dDZpalZ0UlYwRmYvRURaVXFkN2xYWkpxZXJXUFJBY3QwNksvQTRVbU0zMTA0?=
 =?utf-8?B?ZVNjZkxnbFFwUWIrcFhvRmROSjNFOE1UQXNHeG1WS0xlZ1Jab1FFdzdjOVZ5?=
 =?utf-8?B?eFdqNWlXZzNmYzNNcGVzT0ZXRWRqUzl0Qkl2TFNjQTBKd0hCenJkNEsrZDNL?=
 =?utf-8?B?b0xJQUxhelJZN0l0dlZqUytwLzcveWlCSHV4R0VNckJRTzMxL3UzU00vNTFn?=
 =?utf-8?B?MGtRV21MaldrMHgxenZoM1BrY0lTcXRIM1lzTGQrdGNNamhuMDRnV09iWjBo?=
 =?utf-8?B?VkhZV0dGSEptVVhaRnl2cWFZRmFnbnlwQTR5SDNkeEMxOXZQZ2ZDQnhLdnVz?=
 =?utf-8?B?QU43bzNFeDZzbFYwaVFIaFU2MlpMUHE1OXpWZmZURDVsd2tNRFg4U0xRSTMz?=
 =?utf-8?B?cWROaC9iS3RvZ3cxUFM0aU1Ka3B4eXJxdmk2VEhmYnkzMytyaFB3ZXhYTjZn?=
 =?utf-8?Q?7qhLcGqJ56f6wLqCZCXu5Ins4jYIIZkkEiitfZZDL7ldD?=
X-MS-Exchange-AntiSpam-MessageData-1: 8kDCaNpKqjHZCg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccb7b1a-18bd-486e-dd37-08de909d2578
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:49:34.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24WIepCHg/LopxFzBc7O6U4bPnilK1mg/+Of1ZimocbrFQXzgH3cuS+Vc1Dqg7S6H3LjW82zfFwOisTPtNa0Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6234


On 02/04/2026 09:47, Krzysztof Kozlowski wrote:
> On 02/04/2026 10:47, Krzysztof Kozlowski wrote:
>> On Wed, Apr 01, 2026 at 09:38:29PM +0000, Suneel Garapati wrote:
>>>     reg:
>>>       maxItems: 1
>>> @@ -112,6 +114,7 @@ allOf:
>>>             contains:
>>>               enum:
>>>                 - nvidia,tegra234-gte-aon
>>> +              - nvidia,tegra264-gte-aon
>>
>> And why exactly the slices are variable here? Explain that in commit
>> msg.
> 
> s/Explain/Shortly describe/

So this is not related to slices, but indicating the 
'nvidia,gpio-controller' property is required for the AON controller. 
However, maybe your comment still applies and you want the commit 
message to be explicit that for the AON instance the 
'nvidia,gpio-controller' is needed?

Jon

-- 
nvpublic

