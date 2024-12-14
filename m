Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3B539A;
	Sat, 14 Dec 2024 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734136509; cv=fail; b=WHDai6PWI9gsyrJ24sYu18x7cmQYihSkzOmzuN5Hj4qVYJMXg9mDLb5OBYbsXo5/7w3Nq1mGMfdoxQFY4RU5q9Y30HpHUZQOFnuSmbihs2ZSZaqPGrvANoDv2D/I6+dhVRaTU4t15vhRxGJdH3Rz0PQKoiPory/zPgdcQifvPpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734136509; c=relaxed/simple;
	bh=ADcmsWOHZSG3aM++xKkm/NjDrULj84NvnCqjoYikakc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gz+0RvsGjfnV5WjPn/jpXgrUNGqlvWHVu8iZkBNFHqj098Xp5NG8mJ8PDqMJiZf88bB1iZ0Uf0wkv5d8tvAwcrrI6YZ31sTGJbWJJLQNrtjndpPzocgfVEN6SqlsQgv3cDifHm2KjSZ034exe1nlC0F5LYNYpU6TNvRFez6pYQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gfvHVexr; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gfvHVexr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJVR0fISaGFVuT8xlK/C/EThw3dztZw1wt0T0vwFVi5T+sQ0ckR8SDyihiHGv/aazhEJqlbqLeQKhuSsmvGpcAgVx3xHcJtYtvKTPqabqNsNWcpnb5lFBsJOZ2iDk/Oyn/DaXR2BbR/re2rVHjKoT3TN4rWS3GbV+5v9TJUJtgqzxu9y77qeStgun/FlWC3GvgNXMdTr0ivO+uW/ss1fy8C82U/xUVOPGKnweFFO4/Z84PZQj8kMFwU7Iz8wJCVsKUgl8Bd2y7wiAMgEcxgLN2LdDKj1vlXh3SXf4gSZ571pIO03QIii7EnwZkCaE3R4gneSY+zB6tvhHGd7V3rfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTkzvh9Fd8hyGP1DSHL/ssxG2HpTUERUNehL2acJYD8=;
 b=O43bpdEqKp61NiTGjnwqQo664sTS43y8t8/ffKoa9XS7W8lizOqehvY1CEH2380kPAeZo3ZFMUZs7RdQ0EUOaTY11hVBtt9Havr1l9u8z3vVL548gMYLFLt9fLu9rOhr0fHEBpeuCBsmgswexwxgUM2tZ8u8+Cdh10Cr5n2Y/hA3o8z7FIJmZZ0di6imufGsi2jzxYtvytdSrbLDszizSDerQIfWOToAVOOh0HkHvM/SHyHc6nkUpIzhW78dryN1up+D9ptKoUYwbRshp2edMuM4E8AV3TEoxdpM/p+0RNMbcCbQ+ApIK4O0f4qMsIR+lmmerJHajeJqgd5TQ/VulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTkzvh9Fd8hyGP1DSHL/ssxG2HpTUERUNehL2acJYD8=;
 b=gfvHVexrOZtdlGQbfeWPkCCgnc8kNTo0eqVVxQv1zL9npuQZxbpRoxMr1lynE/2bHUWpLkhCiankzYJkRCzIYdllaATMePSzD9v2Q2VpX4/N4zDVwXvrK6aKA4/r9dOhXJ9Uwv6smTfO8M0wPYBe6mQ7qZCwZ/1E7S7ohCzLizwTkOoveU5OdKr0Ohi6bXdQYg4k05uX4kJQDex51A1tEbQ/N+qv+Le7SMC6iRnORBIwxoBvxGx1ScFouDiERUxsLZ/eT2IjpR7Wkh+tsXg0EOH5kD3hadGeQUytwMMYBQiAxkVzNKpqivZOfAFEdcG4FzdvWSzjJIXHVQbuyTfGtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.11; Sat, 14 Dec 2024 00:35:04 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.8251.008; Sat, 14 Dec 2024
 00:35:04 +0000
Message-ID: <8a372dab-ab8f-4635-a5ff-bd7c8ed4756d@nvidia.com>
Date: Fri, 13 Dec 2024 16:35:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
To: Krzysztof Kozlowski <krzk@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20241212211114.330245-1-bgriffis@nvidia.com>
 <942ae75e-51d1-4265-adec-e1446fe0ff48@linaro.org>
 <7ab2cc1a-a461-495f-824d-9dd62973cf48@nvidia.com>
 <ac09839a-b356-489c-9ab9-54a567fdcf95@kernel.org>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <ac09839a-b356-489c-9ab9-54a567fdcf95@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:610:76::13) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: 691b5f80-e7cf-479c-a257-08dd1bd726d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RG9zYW5mR0dzMldRdnZ6ZGE2c2l3TEV3WlJDdXRNSEJUQ01HZEJtaTIzKzJ2?=
 =?utf-8?B?SGMzcGNUclc0UXNoeUJtNUNkdkl2SmU4TUFneTg3enN6TTBJMzJobktwYUUx?=
 =?utf-8?B?cU5vQ2FnV3FhTDgwWTZ3aVd4M3lpUzgwMjkzcHMxYXNmdTUweWxaVUlvVERu?=
 =?utf-8?B?OFJ6RFlObDNEc1lUWC9YZmpRUzRrdi9HRGpIaFNPb1NRa21ma29vay9Da09n?=
 =?utf-8?B?VzNnaWN5Q2pTcUxXdXU0bE9ZaTRNdUw1VUpINUdFWFpuUFg3bWdFNDI4b3Zq?=
 =?utf-8?B?a0Z3Nko2K3R1Q2dBbUluczcrT3N0ZXRxbk5vdUZ4cG1UcTlKN3gwZ1Fra0wz?=
 =?utf-8?B?aFFscDU2cStZTVVROSsrOSs2Nm9vWGltWS82SUxHeVBTL2oxbVRxdGF1UlMw?=
 =?utf-8?B?MHJIQTc0b2hoeTNBRlMzd1ZFL1F6RkZwbnlyM3RneEMrQ0FENWl4WllhYU5E?=
 =?utf-8?B?ZUNYZmYzODRxbks4cTlGQ1MzLzlHcVJiTDVTVzZkMXR0ejVPV21ReHJGRWlY?=
 =?utf-8?B?enVJTkxnVHdPQ2VtV0dBZVdJeTZFd3lQTXpad0QzQkhRQVdQR2RaZHdrdGZj?=
 =?utf-8?B?RWdTbW5pTG4zaGUxanc2UjV2bGdORlVKSmxGeW1wMWUxa0VZMHIyck1Zb3hn?=
 =?utf-8?B?alducjU4NE1VK21vZ25hY1NoVjIweHorcklaM1hNTzJUZGpLazFIT28wUnN0?=
 =?utf-8?B?VEljems4NjJzNXBRZldkcTNIOUpCaXBhalJMRDIyZldzYmJGcko0bmhxT1Q2?=
 =?utf-8?B?czhRUjZCMWppRGJJUGplVTVpZk1rMHc2RkFCaUhWZXN6TW5OM2R1UVFMZHIx?=
 =?utf-8?B?Zmwxd1NsdWZKOUNzdGhKZ3pjTXlQcGFqVEltT2pDYno0STFYWW5xQ21oODlq?=
 =?utf-8?B?KytId1poY2FsMGtvaWpQTnRCNEt3bnNtQ29qa1VQcXcrRXJkL0h0N1V1VHl5?=
 =?utf-8?B?MmtxQ1hxRjV0aW04R0RIMVhGWFBTVk9QcTUyejJQTTE5OGtDSXVoa1JzbVRY?=
 =?utf-8?B?a2hzN1YvL0gxVHpKTzhyRVFiOW11UTZMOEdsYlNpeG9iQUtRYU1XbVAxTTd2?=
 =?utf-8?B?Nm5xcmNVd1MvYXcxbjU1VUpEdE4zMXF6eDNNYXc4YXhxakUySFloSzJCTEtN?=
 =?utf-8?B?eWk4QUpPUjlaekpHT2lOSEtxK3B0TjZFOWk4Y3dVa3BBZm9SUE1ZSzRSbU1j?=
 =?utf-8?B?UFkyREhlTGhXL2Y4dUlIQVBmYkVZd0gveGltaExScUN4SUxoRXZKMzA3anlu?=
 =?utf-8?B?U3JmYXhRbjFUUGEwM2k0aFhyOFRmRmxzK3FHQ3NlRHltd0ZkeUpuSUxhaVN4?=
 =?utf-8?B?YWZ1ZFpsdTI2aUtuM0VWTXZqdG9mL01FOUtDR3JPVjF6bVVJSDd6Y25VQ05Q?=
 =?utf-8?B?WUpaMHJHTE9uK0pFTksyTjNJRXV6N1MzWEN4NHZFSFVMT3EvZWJiMU1Qejdz?=
 =?utf-8?B?M1ZJTlZ1M0xLWkVLOUhKMHNXOUlEMzB6T1FVWkRYUW9QMERGVE9PYUhLckNr?=
 =?utf-8?B?RFM5amU3YmhjYzBpRHFEZVpaaWRIYXo0V0Y1YVIrR3UvN3laNGZoYnU2aU4y?=
 =?utf-8?B?YVVldFRWbWFyeFp6RUZVUEFaVUxJLzNXaEtHN0xWY2JDeWJaRkF0bjVCL3E1?=
 =?utf-8?B?SnFhZGlsUEczN0xuMkp3NEs5SU8zazZmTjJlSUprdXVUYmptYjQyamlKeWgv?=
 =?utf-8?B?cTdMelNvL0dLczVIWDBxT1FpczQxeU42dVRWcmFiOCtHODdMZjRvTnpid01P?=
 =?utf-8?B?V0piZ2ZaSGtBRlVwVmNvQ3F6NXFvZGlMblVKdHRSZ1hMZzRKVDgzWWxDUHFq?=
 =?utf-8?B?bzNLUFZ5RXpRY283aGQ3QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUlrQWpibTZJNGx3SnpyZTZHQW94ZFdtV3pSMnpmMnd6SU9YRUJDcnZNYTVB?=
 =?utf-8?B?dktTTkVQallVWmdONXZZY3k0ZjdoK3kwbHZlbXJaYTNrNkRRK1ljUHc5eXlU?=
 =?utf-8?B?am92NWdVMHhFdjFBZGNGNTF3WGEwM1BBTTEwclF6eGo4bjRidjdkeUZlVkNp?=
 =?utf-8?B?dXprTDl3bXV6WVlHVDJDWmZkMFRUd2h3Yjd0SnhkMjJtR0pRWHVCbDZuSDk5?=
 =?utf-8?B?SFZqbjNabms1cm9Ya3JVREpneVcrZEZ1S2tneVJSWFZHNE5FQzl5a3RPdi96?=
 =?utf-8?B?YVExQkVvYjVjQ1V1MllteWV1OTk1cWN4ektXV3ExZTgyV3hNNEpUOGd2Rmk0?=
 =?utf-8?B?ZFZYY01lcFQ4MnJXY2xjVmxyeVg5R0h6MncvNFc1K3lkQ0Uvc1laWU1WWFRO?=
 =?utf-8?B?OU1mUTVpaGJiZE1RYUM4MGFtQ0dBd2dKSFZlZ3FPRmZhaUdha1ZzUGszelpl?=
 =?utf-8?B?Y3JlSG0vcTNRWHY1MktwbTltQTdJOEF4VW44V2hEb05tSXkxcCt6VjFVeURN?=
 =?utf-8?B?N3VvMjd4RHVKZFgwNUljRlk1bHRBeXFoU2dzaURscUwyNFpXeEZlNU9EbENr?=
 =?utf-8?B?bDIrZ0lMbisrbUZ3Y21hUDFUZjhuVEE0MlBqWHh2Uys3YStkT3RoUmlNTHc0?=
 =?utf-8?B?UmVGMnFzSk9PYW5jRmNieHZySTdObW5zWVRERjY1M1hqbitLT3Q4dHhLNUd6?=
 =?utf-8?B?VGhiVEhVUEVYdy9ZVGp2WUgrcVhwMCs4dklLS1dydEVJRE1IWlgzbVJxYk9t?=
 =?utf-8?B?MkwzVTI1ejUrOWFUY05hZWpsUUV2Rk1xck9RaWw5TWZkY1dvUkhXemJQd2Zp?=
 =?utf-8?B?SHhWV0xOY2JVdnIxYll4b25CZlA3UHI1M2w1dExhZVEvUTk1eXVDdk12N3V3?=
 =?utf-8?B?TFdLTFdoWnR5UjU4YlMrM2F0VUUzZ0RROUdydTJaT25taEpXV21GMHJpZG5Y?=
 =?utf-8?B?eGdHVzFNNkxwLzh3bFZWQUcwZUJzNldqeEVQay9KR0RSYVI5N2V6Um5qdTJW?=
 =?utf-8?B?TWcxQkZkMld4QTBIMzQ2dEtYYjdqNHdIMndaSy9MQVR6L0phYlVRSGllQnM2?=
 =?utf-8?B?cjMxWHdVWXVjaVdnZEplMTVtYVNHRHVJakJ6Yksvd0d5eHhwcGkvZC94dnB4?=
 =?utf-8?B?RmlzOWhaUGlxUzEzWGVXaDM5Q3lLNFRaN3N4WHp6M3FlUWRkWDhSMzFVTCtC?=
 =?utf-8?B?ODRjQkJyU1VoQkFoa2hWOEdjRjQxM2NiRUVJRVVuYnNHeHNnWTNSby92M3Va?=
 =?utf-8?B?bDZuSzNodlRIUWJGRjJEMS80Wmw2REcyS3pjNTFXUHEvM2lhTVFTQ1N4YXB5?=
 =?utf-8?B?bjdZN1YyVjRGa1RpWXlFeGFDOTNVNDJWVndOSStYUFplMHR5bHY4RmRGaCtk?=
 =?utf-8?B?NmZmcGtkTC9SdVlzOGFyRnh5Nm9sZDNLSThaTXBaN0VaNHJPUFdzQUFqUFJr?=
 =?utf-8?B?QlNLSU0wMFQ2a0pTQXRLdEJsMzdXVFArcm8wUnEyRDRWZW5IYmtNTjVsYWNW?=
 =?utf-8?B?OExjc3pMSVBDYTBDbEswRWloQS84Vnp3eXpxVHFJTkVXS3dPQSt5QkxBVkc3?=
 =?utf-8?B?Um5zYWRpM2VEc0ZrNW9KeC9HeHZCc2tzMVZwMVg0MXVkRnJndW5iWUZpNVJl?=
 =?utf-8?B?Zk42WUdZZjdGc1dNSW50a3Mvekp6ZjdtUno4bGVNalJNM3hjektVNnhWa0dP?=
 =?utf-8?B?SEdwQ0hsenlCcTZKQTRIcytpNm1UMHFOdEFNSXI4T3gwNDlNa1B5NXNWTDRS?=
 =?utf-8?B?OFR3RkZwOHhPc25FdTRIb2ZjRUVGTVVscUViZHV4bmQremZzcWJOSXJDYmhN?=
 =?utf-8?B?bzdwNnhta1d2UXBrd3JrVXdGZUgza092UERpMTBTaklxcEJmUEp1MmVtb0E1?=
 =?utf-8?B?MERvVUhrUWhTclNsZzJNL0cxSUxJTGdHNnAzZm9SdmFnai8rYkhuSUVaQmFR?=
 =?utf-8?B?ZTdlYzJsOTMyQzdpeXNOS1pycFdFYTZVSU5scGh0VUxGTldGODNSdDZISzF1?=
 =?utf-8?B?eEtxSlNkM25LQmpwbk16bXlOS0haSjF4UC9CM1JqSmdENWF6Uk1DK3RYUGFT?=
 =?utf-8?B?Y1c5aUFFRW1WckVpeTZQd21oeHF1Um5obVgxVlRSREE5MEI4eDNtQll4U2xt?=
 =?utf-8?Q?XGeKtiAFESvsi1XiUUQC7AQBI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691b5f80-e7cf-479c-a257-08dd1bd726d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 00:35:04.2245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwBj34EKx8kyZF6sebQN3NYIUYcGwvHb0DiirF9LYYoCQ/5gmpZimZF03LneRxnFE/ujv+93WworhXfxtSZkyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151

On 12/13/24 05:26, Krzysztof Kozlowski wrote:
> Yeah, that was just an assumption, but three independent people are
> Ccing address which does not exist in the kernel and it is impossible to
> get/deduce/invent. Three patchsets from three different people...
> 
> Best regards,
> Krzysztof

I am developing and testing on mainline.  However, when I checked the 
get_maintainer.pl output on first glance it looked unchanged and I 
copied/pasted an old "git send-email" command that had the older email 
address.

And you are probably getting multiple of them due to me "helping" other 
people by sharing some of the commands/syntax.

I apologize for the mistake.  I will check that more carefully from now 
on. I sent out v2 and made sure to get this correct!
