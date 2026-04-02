Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A483CCFBB;
	Thu,  2 Apr 2026 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125309; cv=fail; b=M2buWmZ/uab15o38baHKbXQQpaz6bCYqxJcyVJ7c+nUWsBMtmqsrlge4aZRGZz/eySn8vvl1r5kHAIALvBGbkmHd3aHfm0r7GUwPacu8njneGRu/BPk4mSpOif3lc7Gq5A+L4vZMSaqqSrWEtqT2Gksog2NZGV/VVxYzFxmkr9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125309; c=relaxed/simple;
	bh=Zl5bv56RF8Vvw25pTv9aby9c1YxSH2XT8JGtZ0MfY7E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TYc/BesIBTSf/UTlR/8vKUE5wtPL+A6pIPR6v2ay0BJvOXEfK5qgXJuZaUhWpLnGEF+nfyaq2VK03nEXUY2T8D0zfgkZsCpljyCI1+nxps8Cl/OjjgoIIW5n+bFu5PUkd7HIPJOz4HZWMck30Eowt1JjQm1msMTbWEp4Y2Lq6y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pEO50kpb; arc=fail smtp.client-ip=52.101.48.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pEO50kpb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa8ujRY40p1UwPDtvEvOuddrpZXRvPlpMlsR9llAnor99OURcPQHTZ2CwQskf289nKOxyukaq5N1Rdk2yF/BBJbjM5YPt+qiFrwp3m/N+nRgKVXaD0H4yc0U7fxhgJh7vZ70jtovJlvD7WhPJ8E8+8H3fmFja24Hj5C1J+wPyTOlUkXwrZswrSmrb0jXN4MP3J5+L/64BjHwaFGtmTfqlQ9Pv1CRyxQst2Hlj/nSCMWPu9jrawQrpEnjIauASqvo3SJR0XS5nSj9I3v6ycdEkPkfubIzVbjzkh4VLhfxuDCdUQepcFjAusFPxdJQtazzFcXdKr3fa3RrYDzzBzGgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCeHpRMKufPPKJmnG+kHWf5LnUZaAh7AiKk2qe3uZG8=;
 b=BUW7J4aXxYI1Hsl3nnfD4cHWu5PPwKtKoN6ps4bxEvj8D2q2vNJTnIZPG0SK8MKHb1Zwb4odQFuyjGrrQyI/mDlnXIqRbXd/gMstOxaFSB0Z6NOzhjhMwudjf9O67Jo2QOPNuRI9DiXfvL6FR3kri3qoj2hnPwx1PR4oJzNzbaALeK3vAQGH1tyCCTBUC3NygDq4TAAmPoqfD8Ssx1/TfQW4d138qlmxCQqmyRBGPiG+YS4JexENeCJy71yJesD4wN4G1Q4mHrTZKAPgDR/b0FJcR09L1E9dLsZc7c3sU8p9Y+Q1N9OxN1VCGF+Cq/axrFsqIHA8TGTJ42W/SBF+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCeHpRMKufPPKJmnG+kHWf5LnUZaAh7AiKk2qe3uZG8=;
 b=pEO50kpbxn9ipT9D0Q07n0O13zPQ0JI73yqi7I0QeOgWAkWuc4Wff6Ym8Q9m4/J4BDo3HueCXpYydVlwuBtrFXjRRhv+vcqBdTEedmlEF4xoh0Lpmi8hMY6wMShz7Oc7BVBRZQKOP+P2ojdLb0WuDxBtHAynR7FDt/EKjJOpiAZX34ygvF5gEpcmdim2qlZkwCSRp6wQYnm5HYY0nolbav58k76jK/5X6sjUfilTdHGCUcDwcMwthf3+yp3q6EX5WdCPNJaM4y2Uu3QtyAraWOMfqDRHObYTGMjEsSnzN9WWO1ucx03fThg7WXaZi5POIp5c6s/uwL5PLnZQEo/zSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 10:21:44 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 10:21:44 +0000
Message-ID: <5ea58a03-a349-49be-9549-0836d4bc3254@nvidia.com>
Date: Thu, 2 Apr 2026 11:21:38 +0100
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
 <dc3a518e-940b-40e6-aacc-9e1356d266f5@nvidia.com>
 <c4f41a94-50d0-4f7d-b5cb-2fc966129440@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <c4f41a94-50d0-4f7d-b5cb-2fc966129440@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: e13d95f1-244c-4a42-1eb8-08de90a1a387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fRsYPy0GAMZHspV5vpBRcmyJfRTt74BJQAxKJKh0OeT+35RqsJa97wFAXhxTPSuGn9Hk6tLGfqAMUbQTPMCaX6GQ8dSbCjLRnmnOxndPfn5tQOIz913EKvMuSA9z6mZfv0oiinnRsZIv7864gjtSUUlUmlVey6xoKko7y6urTY4DKOxsTdnXgEDqqlhW3QjMp5CvJahq9HHk3kFHtCAJU+210cVP7O5BsrxeQHO+jZZ4bHYSaXBr6LVz9d23mySt59YhKj4sWWWBtVeU4Dkhc1P4FgC6RDOFyQcBAoNEr2HFbqZ+hjGmrFUkKaqsHeoetqDypFIA/4uWG0r1IgidjudbgCPpmN9eyE25SsZFtPVST1Nb1aRBEzZwsvG1+iWO7oc589gqwJCp/7j3hbdkljMSiP75KJ0TtptRAjk/0eRTCIY+mWPGsdh3kb1k0hceksgk+XwpvXO4FaJUc6LITFxFDLKkd3ofljlPVKqKLyigJc4oeyszZSZ3O3Z2ojJFpaBtO/eOdNJllJ9ESlJ4FTgsPJMf8dPGqi7nr1xH7n0KnYcFfP6/8yYbc/Z+e8jN/uDBZCgGAqCEGhJTl5VbMzkrBbj9df2Y45K4u+LIeroWFgd239bU1Z9vw9BFZ+zpPBTZ5lymh3fk6OqmUzIfrRd6YY6cPfkrI8cyh29FVcBfIZ/rVor8ChfQ9LiK1Sx+IMvOazSpaHdhPqkQsnWeCw5Yj5yM++pLtQLUA/5wQ2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFYwUmdJQmw0cDVGZjBNKzNIeDVjcmwvWERud0hNY2ZzQzFxdzVsRERuVW9W?=
 =?utf-8?B?K0tZb3M4eXNBV1N0a1FCdkkvUkNiVW9BelhzemRxRXRrUCtWZlBOU1h2a0l5?=
 =?utf-8?B?WEtIa1IyYkwzWEdIL3cva05kU2xOeHJPS1kvMHJNNkQ5YTU5bFNNZkFOQm1S?=
 =?utf-8?B?b3BGRXBMdHFDN2FsZTZEREhLVXU4Q1JxTTFYa2F3aUVkbThrQzY5djYza1Y0?=
 =?utf-8?B?c09EMDZLYk40dGR0YmVIcUE4Q09NdFkwbGd2SVZwbElRY0hqaGhtbVJzSHlK?=
 =?utf-8?B?aWZxUVZ3REVvN2YxbThKWVJqTDdaUitySlVTOHdJZnIxY3RnRnBTck1vQjhJ?=
 =?utf-8?B?NkxRSVRDOFhEZ25YTGxJblFxODAwOUxZUjgwZElMb3NPRTlLaFI2TmM3TVJu?=
 =?utf-8?B?aTJWZi91c1F2N01BckNjQ0xGbU9ta2pLZUJNQ2hKTUsxM2o1eEQ5b1BLVXU1?=
 =?utf-8?B?UmcyMnJwTjJhMVNBcVJraUV4aTFCdmFWTTlHLzZYQms2ZlQ4V1FwUlJ2bllN?=
 =?utf-8?B?UUpjV3l1VGJ5TmtxT081bit6VzJIemU4N2pXK21WV1JMVGV5akJOM1JaUFBp?=
 =?utf-8?B?S05mcEpQVlhiZjZKcVJESnAybGNmcUFTRWdBS21ORmNkajlNWTdpeUZYNjJ0?=
 =?utf-8?B?cFREZzZhRU13Zm5vMTBtbWZwRStleXZEeHhhWGRWd3J2dUJTbzRQZ2l1WXVO?=
 =?utf-8?B?UHN2NTNlaWs5Ujl2emszcm1RelF1OU1UM3lqL3pyYk1XRGtWZjYra1FxN2M5?=
 =?utf-8?B?dTA5b0xpdldhYWpqb3dTaHppY2k0aHhRbDJxc1VmL3h1TkFNa29ubTUraW5P?=
 =?utf-8?B?MkJHQnVuRlZmNTNvazlBUU1kVGwxenJiVkphdjR0Mk9YN3VwQ1E2ZWJMZE1N?=
 =?utf-8?B?L1hRTDdsaHIwaHNZOGc4WDRVSHFsV2dZS2hUY2JjL0o1TWJienUwYWFzNlIw?=
 =?utf-8?B?WFVhRlF6S2pocW43eVVuVXpOdGpXL2xDNjMrOUFOc1dZSnRJZVRUSUkxTzN4?=
 =?utf-8?B?d1pnZzI0cUpMei9lVkwrRWt4ZDRjYmNsVlhLVEhmM1FmeXprREx5bTlMckg5?=
 =?utf-8?B?ek9NQkxSd0pycW9KeHdIUXFmVUhqT2s1OGZzY0NaTVlRNG91TGgyajY3UEVJ?=
 =?utf-8?B?eUlBOXRYR1FYdkFDeDFMT29oY0JrR2VCVFBZYkVuWFFqcm85M1l3V3pkTkJo?=
 =?utf-8?B?RzAzYndBcllXOERZVHVoOE12UjRlWHZvcnRHYjJZOGpEN3FKZ01TMktiaDZ2?=
 =?utf-8?B?d3MxOUFuUjJkbWY4OC9KYVNISmNsWks0UVd2ZTBsa3paUERtMnNTMEp4SE9S?=
 =?utf-8?B?QmxhU1E3bGdUdExaUFY1Mm1OK2VXVHpQRXRISjJsUTFiODVLajBXU1RWVnZH?=
 =?utf-8?B?ZFJwcXFtSE1ndGJZT2NudnFhSGRSa3EweG1BWC82ODFxdENucjRnZFF0bmpn?=
 =?utf-8?B?eGt1d0JZMXYyM25Qc2tsd0RCd0N0TXNOd3k5MC9vNndWeG96QjlwdkpEWGIz?=
 =?utf-8?B?T3ZyYUE2bGN5Y2RJancrS0JtS1VYOW5OeTNnZ29HcUhobGN2clI1bE9JL1RP?=
 =?utf-8?B?cGwxckthdSt1alJSWmQxc3k4N0o3L2Vpb09uaDN0aXBpdlc0MmRtdmRPWW5U?=
 =?utf-8?B?T0xuek1yK0g4bThGSWxRbm5uTnd0cFpra2VIcC8zUjYwRVFUS0JGS0RHYVkw?=
 =?utf-8?B?OW5OMkhnNC9ncUNsT1JCQWlXRnJoTk9VdERsNUVGckFNN1hrSHJuQkRpdFB3?=
 =?utf-8?B?UFpiOXlrRW9LMTJFU3lWd0IvK2RKR1pTNkx6UjlSamxnOWV1b1Q3K0RWQ2oy?=
 =?utf-8?B?ZlpuMjMvOVJqeHNud3A0Yy9OZU1vYVgrTThLK3hmY0hCaXFHT2svaE03NURN?=
 =?utf-8?B?aFhUMjA5T3ZpLzU1MjFRTTZENWs3c0NEVE4wMkpBMkFNazY5Z2dIM2V5TUJK?=
 =?utf-8?B?cVpyRng2MVJiOVRRVS9kV2JYNEFXb1hFUnhINWZCL0hUcXdtTVVDdWl0NFVi?=
 =?utf-8?B?alRWZXZDUkVlTCt3aUduenNPQ3duRmxYS1ovcEJnRzZqemdyTjBzL3VzUFU3?=
 =?utf-8?B?bG9oZi9lM1NYRnNoK2svTURRNlN5b2E0c2Ftc0RsdXFIcUtvQzh0eDBmMkNZ?=
 =?utf-8?B?MEFyY1ptSk9tL3MzakxBcXRLZXQ2eHFHRG1XVWZ3ZnZRY0w2UkI2Uy9VTmFU?=
 =?utf-8?B?Q0JNdjlKdUJZdXgzSW5kZ1ZiK0FDdjVOZ2JsQ0VWTER3YmFyaHVnWUtXTmdU?=
 =?utf-8?B?Tjc4ZmZJMEZ6RldqZFJlTE9vNmdwZXdmWi90TE1UOENVRXlPbHhwNVppL3B0?=
 =?utf-8?B?a3ZobkVkdUxBRmxWdzZKZG5UTkk2Ym1MSUd4YkFuSFQ2RXFUMUpjWUhOcFBs?=
 =?utf-8?Q?r4a0OiWSXgy/0uJk44wuLHPX2oqKjyBCLoYBszpGNJkgD?=
X-MS-Exchange-AntiSpam-MessageData-1: doMShx9VOCh2Uw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13d95f1-244c-4a42-1eb8-08de90a1a387
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:21:44.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIStLTvoQLW/ZlZoxRWLE9/RMToMFYXSziT4tbSXZszxQEcgqqb3VanzoWykcyPV1AJWidykGXWdaWjP2TLFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375


On 02/04/2026 10:53, Krzysztof Kozlowski wrote:
> On 02/04/2026 11:49, Jon Hunter wrote:
>>
>> On 02/04/2026 09:47, Krzysztof Kozlowski wrote:
>>> On 02/04/2026 10:47, Krzysztof Kozlowski wrote:
>>>> On Wed, Apr 01, 2026 at 09:38:29PM +0000, Suneel Garapati wrote:
>>>>>      reg:
>>>>>        maxItems: 1
>>>>> @@ -112,6 +114,7 @@ allOf:
>>>>>              contains:
>>>>>                enum:
>>>>>                  - nvidia,tegra234-gte-aon
>>>>> +              - nvidia,tegra264-gte-aon
>>>>
>>>> And why exactly the slices are variable here? Explain that in commit
>>>> msg.
>>>
>>> s/Explain/Shortly describe/
>>
>> So this is not related to slices, but indicating the
>> 'nvidia,gpio-controller' property is required for the AON controller.
>> However, maybe your comment still applies and you want the commit
>> message to be explicit that for the AON instance the
>> 'nvidia,gpio-controller' is needed?
> 
> You have two devices there - AON and LIC - and variable properties. I
> want answer why things are variable. HW is rarely variable. It is
> opposite of variable - afixed.

So note that 'nvidia,slices' is a deprecated property ...

1815e37b6e67 ("dt-bindings: timestamp: Deprecate nvidia,slices property")

I am guessing we did not bother to specify the slices for Tegra264 
because this is no longer being used/supported. And yes, we should have 
made this clear in the commit message :-)

Do you want the commit message updated?

Jon

-- 
nvpublic

