Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795441010;
	b=QoMx7hH0h868pPioxusQsQinh4UJR0vzM+4bfHBXy1jZSmxm+jXWyrbK+Ff19vXggkO2
	 zFRDWVEnW0zuB7yy85fFxNpzAWcRoH/W2Iyi+aIbq6ikULPW3EtxFB3V6j4oDhevj0G1m
	 spuA7Q9X7ZVLhqz8XJOcMtTpXcgxHctOSwK/LFdD8kGeGo8BwCdICJ8Sy1zWlHgzPpUKJ
	 wa/y7PFDpT5kuHBGa/DAeiF3hROcPybTneuf61kSZaRHIsOJ+jmhQtgainqfT6TE+vMh4
	 NejUJmFPZhK97u2s2iobOT1YWS0wQwDxw6KN957jDtec7rRTVvi1orBN+Y4spRD3lHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441010;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/jYgnNJ1eaAxfY39NefHstRDCZbe1wDlUFbblgfZf+4=;
	b=lyoMc0tww6uBjoP+UmAR497RR1gmsQtuUn4H+3XAILv3l2iqpy7reLuwAtnqD/E8UBt6
	 8j0+a4j5QKVM1Ytw4Rpc1bDnvxjAGHO4wcgcl74d/30+o54qffTV6iFIiIMLzPSt1lpKs
	 h2vtiaqXMgFQs04L1pbNrWSQMibqcHVM+s6fVzjTOWqWW+zdPy/1XBu0MIryuNunVU+Cw
	 np6Qb9U3VHMUQtUI7y3K3kzQWkT8JoX+JIPrCUvhi/MdyZOFQZnQQNmG6cEZnzViajZap
	 uZ2JiZlrcDdg9GeT2L6gAnCbg3igl4r7GCTHwe6vbbJwKaPinctqhuPcjyhCKaCD3Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MOJSFDGp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.43
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20357606A327;
	Mon, 23 Nov 2026 13:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20357606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MOJSFDGp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qciVD4+ZaG+hb5VNJMUF2duE3KYxSvUYc/xvPBjtLm1K5MLGi+1cJhbNGjqUrE7ygYGMZMfNCtCxiQGZ5gtJFQk2NbG1n3an3jNO0isWuo7e+ef+UuJ8MBL44nzGZbIyHaCXAwqJCy/mm/6afQHW/TdzbcWwnlHgIMH1McuFSjS0n6Wxp32ebhmesdCrS62T0M+MVqp7tD1enbT/kzVxVe8Q/lFwczDjNuHn91UIhzL7vL4E/NeOuJidzM0LbVPa/xLp7PcbUpPu2OBoV2ABrxwqiohEAMuqiFTT3bjYns4fF5E75wupJpvn/ecF8cS6U+H4DgJ/iut3SwWi1Dp9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jYgnNJ1eaAxfY39NefHstRDCZbe1wDlUFbblgfZf+4=;
 b=RowmcTNdRarzDu7oSaJptYplkBmH/o16mMU3b1sMtRobMCuV7QycQP3nQsu7IrtOnqmAn/ZkHuj8fSi3+M0qZDtvAnIQxVZ9v5NRFP2g8vF2o7sIWB3fClGct5bTwumeYMdhECBvZx1sMPbjubB01XNHstZJ3qoO180zgCkd6pAkcA6XERUido6mKWw+q5n4HWUZ90PiKLp7N6tg6TFlb5aS0D7Boy+9DjD4kTTgquq6yzk0s4KVYyqwQwVLnTO4tl0yHz7O/RrAgnzM3/wnYPb8w6BKIy1wJPPZxaPjewz4xlXcnanWGDtCQxn0X1l/ZO/FuHQpt0Nfgs2r76BOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jYgnNJ1eaAxfY39NefHstRDCZbe1wDlUFbblgfZf+4=;
 b=MOJSFDGpQzqpynF+Ja1OMLSrfnGmtxv70tRcETGJV8bJAIkat+1B5c8KOU9iZWvpCARmHZ2YjkW4iBpcB9cyJmn6JQVrTsgBjf1SwLqa2ovKSXh5gVuzg/QtLuyvWBTulXbNPU/M0nhQZHAYnmp2J82zHN+dllhmpTaNFKrxkuO6f8K/D58njdw63DXiMZxPQzhV39KxPnmZC++/KwMFr09m3ylkvMJh6hM3vu6EBPAe/GgTk+U5DDIFYs/5Ej+QGeYqv0PTV1gDaqmkhkaP42Idgwf/JjJw5mGlyy3/1Yam9Bmm4rocffMqVQAGHS1+tD7NNA4iLt91JMg2PxJUpQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by SA1PR12MB7125.namprd12.prod.outlook.com (2603:10b6:806:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 13:36:43 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 13:36:43 +0000
Message-ID: <9e84ec1f-2c41-4be8-8ed1-f9350d9f2d67@nvidia.com>
Date: Mon, 23 Nov 2026 13:36:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] dt-bindings: usb: Add Tegra238 XUSB host
 controller support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
 <20261123-sassy-fragrant-markhor-c6fbb3@quoll>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20261123-sassy-fragrant-markhor-c6fbb3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::6) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|SA1PR12MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1fa236-7f77-40ba-e74e-08df4966cf62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|7416014|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/5ZjNrOPUKY49HzAKf2VSs0uydDxlZyPmHzVsY0lcGRQyS6qJVea5hHZL2YR+6S1/s/MFAtI14+/TE9lTyQdj0sJtKTline8EjL6PnCz7RPLfYs0/N//vHpcnMUs0ZcWZgVK6CWvtFAnR3L0geHmNEsGvYlfnrZ//rqRfre4xyxMh/d4t2XD44SaH1nnDxFPOn5w7gGMTrJ8j+0PoWL9bTP9RCq7Ul/wjSdzNodhJacQrAWQqQDWkjDhAHOICj0AsHUc4cioXBX5a+MgHTpWJk8V0sLG3uZzBPPVAltD+FOSoYQ7J2E2Rk6B8jhR+vhnMzpWzIDrqnmvh4X1BZ0wPbM+AuiJXBOmnBry9jl+1oPW4+Wmz7LmHWHiNm5Hp2HyvYl35C5drYPXPf+QYmhTVbfGQ/QvTqVXyunhywLiyTVzR+0ZxDSl8y2aqF8dagUFPrZUZxKQo10cRWKP6YrR/ZfMKpX2m8zDQPeSZdokGDGXPN96WW7+Q7eeS9dVbfc6piHHm8Mpwo5QggouDGLLNE1AAyVgUdLEv6RIprf6dCETcG927gKqh1Tclr32x0g2nsBfKFYdkleMSxfj9HasDiXynbspGCGwKPJ9YQkSnEe/WXTARHLSXMm1US8XjsR1oJ92aqnOIoo+MXnpDR053beB1t9KHG9Mxoh75ZOZ5fY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHpuSndLREQ2b3BDUmtkVDcxUDJ3RHVSOCt2WGpQamIzYzhnbWFTUTdPQytH?=
 =?utf-8?B?S0F6Q2JhZDcyOWZ4cVMyUzE0V0VNYjJTTHVIYm1naDE0SDZ5VnFsdGxoL1gv?=
 =?utf-8?B?OUt2dWxiQUk5SzNuT2c0UW9DZlVhSlViam5MdlVZaklhc1d2ZEdFTlQxYTFl?=
 =?utf-8?B?dXJra1ZhdHBVeXJVS3gydGUrd3NqT1dEYW8wYWNGYmROMjJmNy9vMEJMWGxM?=
 =?utf-8?B?dHRWVjlySHppUWgrZm9wZWVHZ2sxRFZNcWZOMDBuTlZIT1RHLzgrUm1xRWZL?=
 =?utf-8?B?QXFMRnlJNXNTdUczd3JWbnlXdUk1UnRSZXozdll6dVE0T2JSS3BETVBMeWlE?=
 =?utf-8?B?K205Nnp3dkV4bWdUdU5CQ09Iajh0aVVXMFl1Z2loK2k4WGlqQnZDZWd2c1B5?=
 =?utf-8?B?dW5CdEZITGwvaGd6SzM0SU5BOFV4clJLd2V1SnNLK2c2K0kwNlBDQjdjSmwx?=
 =?utf-8?B?UXd5ekJYRmQwbGg2L3haaDVZMGUwcjN6d25NVm5hYXRNa1hPU3lRSGo0QmRZ?=
 =?utf-8?B?Zm9OUXppOWhJeC84ekRUNXUvdW0xcXd6REEzdDRpbGJMSjllY3BFMlRTZzcv?=
 =?utf-8?B?bE0xMGZuNDA5REFZTmpYZ1E3UGhmelFqcDRGOWIwUnd1TU9jeVR1b09pcWkr?=
 =?utf-8?B?ejI2UWt1cnhvZ1B5UXNVVUxkZDNoVEhlVEFRbGV0eHRsMlVNV1Rkb0JUelND?=
 =?utf-8?B?RUVrb2ZnVjFsT0czenpRUkFPSmZENTE1bXhaUnVRbnhHWEdvYnRpYldTcmps?=
 =?utf-8?B?TzIzTDduOFU5V2hOVVpub1JGalFXTnpNV3JiUytobDV1WnVSRzU1dTNHRzBa?=
 =?utf-8?B?eHZmaUM1QWNHR2RpaG8rY1JwTytMZzBtRGNiSldGREovYXI3UUZHdVZ6TEg3?=
 =?utf-8?B?QzIxS1l3K0YwdFYxT2U2NUp2YllMWWo2K3U5ZGVlYXA1c1hOcG5YSHlZNm93?=
 =?utf-8?B?eFFzSWc0YmVzMFpOaHlRUnY0VlhlM21Jc2MwcU04NG9NNCtxZXNMYytlVCt0?=
 =?utf-8?B?Z29OWHY3UjBQcjUxL3NHL241dWhrYkxsV2FPclVzSEZvREZ6RXk5WXp2dmxP?=
 =?utf-8?B?akIzYjYxZFhDWUhLWlhuM3ZrT0V0c1BDR3crK1p5c2d5d0pEM0VMMjBYRnda?=
 =?utf-8?B?dFRxUUpaZUdHdlJpS3VmNHF2L25NVEVpaDhJbFptSnBkWkdsbTNNSUVqcWpR?=
 =?utf-8?B?SDYzWElvYXc0TU5JbVM1RGR1QitTV3Jhd205b0xONFcvOHEzUlU0TEI4ZWdD?=
 =?utf-8?B?VmlvWkdRUzBmaDYyK2hXNWpxSEE0c0U4WEJ5OVViYzFYNkJ2OGZQY1c2b2FX?=
 =?utf-8?B?eTlkR1REMG9iU0hzbjV6Vm8rTTlwSGhOcm9rSTI4YWpKdjdWQ2Z1VWowSTVR?=
 =?utf-8?B?WUp5Tm9oZjZvUkVqZlpyOGt3TFdDVHVKTk5SaWhoRHNLSHM3T0ZNcWlVeTlF?=
 =?utf-8?B?cUJheEUrR3NNZzJjOG9sWGY0Q0JneVVLZ1d5Z2Z5SThqS2VZK0M2dzR6RFEz?=
 =?utf-8?B?Q0RETStiU3FRRFpYYmwvdWdHZ2JmSEFTM2RZcE03bjEzQXZvNmJDTUplSVhD?=
 =?utf-8?B?TWJ0OGlGU3VNQ016ZjEwNDRwc1VhVDFBeWI4eUQ2TkZDZjJTSGJPMHBmUU5V?=
 =?utf-8?B?cENQRE5KaUNyU0pOdllndCtTY0R3cHF2N2tCdDdGeDRDeHdiNnBzTU0wbnkw?=
 =?utf-8?B?bS9LM1lTaE1BamltSjlOK2dHZVpFRmtsVzgyNjdGYVl0WHhMdTBpSnJLd01R?=
 =?utf-8?B?VHVVTER0MVJDVmNSc3RqaHF3bGdhbjM3clM0bDcwYm8xRDQ1ZFBzc3pUSjI3?=
 =?utf-8?B?cTNFY3NCRXJkajltMW9icEVYcUpHNngrK2xTQnFOekxxL2s5TG5INkU2Mllu?=
 =?utf-8?B?YTJkYWxtc0J4YzhlV0wvZmdxT1VQd2g3TGRrRy9Eei9GcGFIbGk3RWVNdy9q?=
 =?utf-8?B?VE1FbHhkK28yY2VXZmRERE1IdllaMEdpRWFwQVA5OWdTL25hdnUxRHJ1QllF?=
 =?utf-8?B?SnU5VDdyeWdlcFFVclc2TkUxMVZDZzRuSWdrQWZGSjg0V09ZNnZGSXpZeXA3?=
 =?utf-8?B?YUZVSDdlelNYb2VpK3lrMmlRaW5kclYzbEtnZnRITDhSMmw4NTU4ZSt6Njlp?=
 =?utf-8?B?R08vYTZ0K0FKMkVhZzMwSGhSRTA1bHJGN3NzYS96OXEvZ0JwQ2ZkQWdwb2x0?=
 =?utf-8?B?L201RzZ4b1RzUnVQcWlqYUR0L0xtVDZLWWpIUWJXRU0yaHBwdWwvWmJ3bEJJ?=
 =?utf-8?B?YjE4eWpvbllIYkY1b3pEMXRKeDNpTy9hUVZBVXBRL3dBSFBDY2lTcGNwYmpX?=
 =?utf-8?B?Szk5bHEvdzRiMU1MOUNVaUdIdFlXTWxuN3RRT1Nmb0k3MXdyaHlBdDhHUjlW?=
 =?utf-8?Q?X6kXQrtww4LZPJmA+l2GChxWLZHUa71euq52/zX2kAUDx?=
X-MS-Exchange-AntiSpam-MessageData-1: 1thZyqyheP3DOQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1fa236-7f77-40ba-e74e-08df4966cf62
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 13:36:42.6758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1OTvJZV+wpkQvjMjwcf/VKyq97y41CKMx2ok7sou2S+Y5x0yrR3p7d/yVblPjBtMu5pg3SERqQWLEuI0+7sXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7125


On 23/11/2026 11:44, Krzysztof Kozlowski wrote:
> On Mon, Nov 16, 2026 at 03:23:59PM +0000, Jon Hunter wrote:
>>    reg:
>> @@ -140,6 +141,16 @@ properties:
>>          - usb3-2
>>          - usb3-3
>>  
>> +  resets:
>> +    items:
>> +      - description: XUSB host controller reset
>> +      - description: XUSB SuperSpeed reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: xusb_host
>> +      - const: xusb_ss
> 
> Drop xusb_ prefix, that's the name of this device.


While I don't disagree, this is consistent with the other naming for
things such as ...

  clock-names:
    items:
      - const: xusb_host
      - const: xusb_falcon_src
      - const: xusb_ss
      - const: xusb_ss_src
      - const: xusb_hs_src
      - const: xusb_fs_src
      - const: pll_u_480m
      - const: clk_m
      - const: pll_e

  power-domain-names:
    items:
      - const: xusb_host
      - const: xusb_ss

We probably should have dropped the 'xusb_' for all of these. Given the
above do you still prefer we drop 'xusb_' for the resets?

Jon


-- 
nvpublic

