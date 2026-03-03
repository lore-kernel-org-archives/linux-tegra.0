Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A63E51EB;
	Tue,  3 Mar 2026 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547872; cv=fail; b=GnSIBLEw8lDbFVgVkGtG9rmtxSJMUVJ5PRLY4XzB6lldxf5jT0vS+Z+VUzMWnmpVGOf70LeKQUUvlt+Lkqd9g8jgfa/DImLh+CDiAq3zF5AaNAveccNHFbm1KNwv/2PTOdudjn/SAapNxzY1j6LYyuTU75Avdt9uXcfNwPuovQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547872; c=relaxed/simple;
	bh=HMX2PdzvYBF0uGAcc91lD0s9XSEBnlC/EUyXqA+Ui/w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rTJrOFEsXWnSHo2qsX48pqfRR+lBrGZ/HRCJbvFDuxK305yeMz/Gdiqx7CMV515xUQTIFr+AtW4dVYbpnoan4bRb5MI91+OrK/K8qyeQ9ebQjQvASLCenZiMMARFoBky91Bli7AUreaTMmU0G3APlhrGgfYXnapOmzFNvdT24Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t8fieNwp; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t8fieNwp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSRUSFiOC53fjFNj/N/8Hb0K+jiIcN9GHhwrqloGE081q+8/R30KgMnWUqhRaSSzlzgQ/nZTGOClqj3h2qAdLUSxY9Ol+cs+d9kLfhgL7YJdsJz/c4DUMpu63q78UCm0dLgr3p2OKV7nQHWBzc+MudHFQ/lMpHG7wheznbjNnYh28UcqZcz8n8eUir2z6baC58rfWXWNMjjA/FIECxr0uIT0bfbYp3Qp+VtKh0Vo4DNgpIcdYiF5bi/5kMpJsmGJr4UtJsYjEc85H5SkAW+HlMS8I+3HbTuZs0uC2OE3RIdLcj/gwqF8eGKQ/Nm6bj3uZtmDCfITrQ3Vm5WoPBtAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l13dl3aO0jX+eI4/tLrLl3VAR8qyR/8kmc8Pbq/ydG8=;
 b=guupO1hJwZmpYZB3uRaHPENPOfpfUqqNfoegFwTpYbj+gQJ7r+xJqjqVWyYKnrsGoy1RsLN7KUnIk0c7ED/Uj2V0MMnVmIY9pKwbQ0DZtYCTB5GSn+CCgh2vJ3pwJVUwtuso+6ElAkz9hmLC63j3UN8rlOppHCawjimPwDF/7JtmBm8sMqWBbkiobOLwC4jAO5EfDSCZtMQd71OSeKYKGUlkYT2twLBPmdQpsBL3mI1TgkbszaeelEL1sRbJ5PneqsoCdQ54l+cXmc/ucEy3SXViCfhKOVWKvPpA5Zuz+VnU9z6BFf4TmjnpxaP0Tw9Y87QnrSeT+uecq+Dnx8Wgww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l13dl3aO0jX+eI4/tLrLl3VAR8qyR/8kmc8Pbq/ydG8=;
 b=t8fieNwp6Mb9LwXqKfcuhjCra73+Cw8YO4RRigBa+OauZuNE1ffmUGPb71SF6hcnQ8Wa0wJyuvfmy37yydiyMsH3QbsZ92gawrvYELaW6kevztRXm9JkemhL39s3adPmes+sOOHsPQ9iBQtkg/a1sXJJFKwILFvIZU8YiTj5vYE2ZevSA/diulyKnZVmnk7fQvMS/DUyV3W5JiD1+bjXr/DzJPWf8OzZvRSiEhdHXc9xhI/oQeRtpmMvFWfe6cgtrKON7jFV5TJZ/U2UXCJ2LlS7rU0A3fG55+D1xR9lQSW8YrA8yqfJ4+e+aNb1PXDG6V3Ajh7WD5V3da7PSgWbBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:24:27 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:24:26 +0000
Message-ID: <92292069-a60d-4ea8-9c3a-182a5c0cd267@nvidia.com>
Date: Tue, 3 Mar 2026 14:24:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: tegra: Add support for Tegra238 soundcard
To: Krzysztof Kozlowski <krzk@kernel.org>, "Sheetal ." <sheetal@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sameer Pujar <spujar@nvidia.com>, Mohan kumar <mkumard@nvidia.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aditya Bavanari <abavanari@nvidia.com>
References: <20260302085323.3139571-1-sheetal@nvidia.com>
 <20260302085323.3139571-3-sheetal@nvidia.com>
 <7447fde1-7eae-4bbc-b36e-fc0da9609c8c@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <7447fde1-7eae-4bbc-b36e-fc0da9609c8c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: aacbe3c6-b950-412e-4de3-08de79309304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	MRNdb+Q4dIAe6+I/dvkRZYwqeh7uhQ+dLLFdaXQfQmnoqvyKYep7cSKyp3V0YPQANbE+XPkTLvfMkLTsuoMc0L5hU5dnvIjOjP4Fo7k62LS+0OXkkYTv3DwfgfziBUI851Wxv5eN301jNeyjaj6951ncKkdFqdEziOkARrRDphe3BZylp49HIW1wSPDwFQ1LW7AScCYHeEFcahCBA00QOiHOp9j5YbXAtzSthTrHTh8GSHv1DWrVoQHzbITLHhUi+ANrXAoG2VcH1mnPbP1oGy0l/DVE6zU0Kt8VH5cPx3MdUlnpzSYlWUTwvYpfQPyU1ya1zja01/FNQ+JfwxQ1/axGTCtRvc1g6k1dB1xZNQI5Ya5FkUb2EC7BTvFqG4HnvC9qNS2nOwBo3oruiR2bsLLuIopUnXdiNko0vsYXyr1npBTrZlRweu8EZgjYIA35Ll5KACT1hwNhdvWDoQ+m5Ytl0/Baavtzl1XhFz81lJvvx+M6VxN4Ewj9ILS/EcpFU5eiI7WYuLS1Xx+fjSkdvrIAMhxWWSw12vq4ODJ3EARMaPvUCXzVia/w5ZC8c5j+LFh+ahKahTxL3T8icy+Pv4CFmbnTQKq/LwrLb9p/nTxA1Z6c6fgLVCcG6ocqgw3ACQmqudKkLndSLJUt/IxJIWpjCqworFC8AnYYj/3qW7pi4Mq2NWnioNdp2m2iA3OOErniTTCcz9cKVaDwJFHAIfcCyEU73SVvgqHBc+dEoX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUxXYjYyd3lFRVBNL05sSFI4USsraC9lb0htWW5HcFl3UUdOTnFmQURyWWF0?=
 =?utf-8?B?VWdxRVlOOHdOVi9BYWQxNFNOS1F0VGVTeFp0SDVqaTFWdmRHclFMVGlnT2dM?=
 =?utf-8?B?YlJKZ0dEa3hCVWFnNkNVem13RDVWNy90b0EraGY5S25xZmVqL2I3eWxVMktV?=
 =?utf-8?B?RytWdjFmcTlsQy81enI0YjZlTGJJMi9RanRnQmhOL3RTSkwzL1BYTVRNaWZR?=
 =?utf-8?B?KzhsVFlwWDdPRmxSejhhajA4SStuVEpMTkVTVGNqQ1pDaUxHRnM4NERqdnBm?=
 =?utf-8?B?Z0NCSWxjN2V6ZWtVeHNEYW05aWxlTUFzUzh6RndaRXZPbGZiRHlkYVdCaHFS?=
 =?utf-8?B?N1Mxa2xPN2YyeVR5cHV6aW52djErUU5xaTY0eTQ5dHVmN0QzZ3JzOXIrQURz?=
 =?utf-8?B?QSsyL2FObE1ISWRTeUlPSnlRTEo5eVpyRXZiRFhMRkJyUWpZTHJQeW03TlZl?=
 =?utf-8?B?dEFpeGRCZ3AzazhkdHlPLzFac1N6aHAxNGJ2dzZQaEt4dmRLZHQ1L2tWaWMz?=
 =?utf-8?B?QVpyeCs3ajN6dXhiNUQxTkV0dng5UTFPRG9BNHMzRUF0V3craGdkOHZiZ1JI?=
 =?utf-8?B?bXVUaHNkSzF1R1IwWTBoUDdSemZ0YnhrZ1FzUXFoczFjaVBOMVI0Qk5qRm5v?=
 =?utf-8?B?dGpVcVdlajBra1dwWmM3VmovR3pqN1lqaktVc1M2dm9aYlRmV2FwRlZwUWxD?=
 =?utf-8?B?ZGsraStMRklCSG1rcWN2K2ZJNHkyUU13RnJtTDlVamV4cE1yUkhjR3hPdnl6?=
 =?utf-8?B?ZUtEV3JGWG01NnltdFpXUTVoZmhnS3IwOUNVQmFMM3Vhank5NW43Z0s3Uk5C?=
 =?utf-8?B?S2RLRXZZb1crRGZUdzNoN1UwbjRGaUJRejJZTWg5bVVYU291dDNjNG1SMVh1?=
 =?utf-8?B?c25Fd3duSTJpQUJhUmZXa2RJUGp5QURMTG5KNysyMGtKWkhPU3gzM0VyM3lr?=
 =?utf-8?B?cWtMWFkxbkxZajVibTJqTFZUNFFsQ0NaQjVMY2hBWDZFRGd6cEwxOTJSMVRk?=
 =?utf-8?B?Wm05QlRnQXpKN0tUQkNlUVRLM1hZNjFvdlVUTGtBY3F6V0NnRVJRNm9UUXdL?=
 =?utf-8?B?TUdlNGpaRVZNYTU1WW9WTm55WEM4a1NxcVpjdUk1UWIvWkxOOFkxeFdrQ3pn?=
 =?utf-8?B?eG5keEdJVDFZL2Y1NHZlZXBlMnRaWk9DYU5jeUVRZVZqcWhHNVRKMTdSejlj?=
 =?utf-8?B?enZOK1VhbW5UaXM1emY4VER5SFp2MGxwRG85Tmc1SnF5dW5ybEk0b01pNUdK?=
 =?utf-8?B?ZTFYMjhxRHBMK0hvSGNReW9PY3lYdHBYTWtSbjdMdFlteW9IRzhoUHNTRWRP?=
 =?utf-8?B?ekI5aGQ5RkpCU1FpTHhiWVFMRk4xL0pDdVpuNEIxYklUL005NGI5ZmwzTS92?=
 =?utf-8?B?VHZzamIvLzMxUVBDblRHdFlYc2UwSUJReThIbElVb2gyZFVXNEVza2IxOFNZ?=
 =?utf-8?B?MWFaTnFlN1dKVkRielh5dzBVVWltZWJyN2VqbkN2RUhEdkdFcmFGcFU4ZEo0?=
 =?utf-8?B?Vi9YNU1FN01Sa01mWUw1UnhSSWg4Ukhxc3kzSkE4NTZ1WkxzWkpmSHE1WXFJ?=
 =?utf-8?B?cEpmajJDYS94ZHBhRnl1Nmprb3hXM092K3hBVVN1SFpXM2p0YjZLckNqd3l2?=
 =?utf-8?B?c0JybEVkZTV6WHlEOTJrVktIV1RucHhMam9uYURTMFpkbWE2QTBGS3Z4VEtK?=
 =?utf-8?B?RTZjaldrVzhicVVkTDllaFFXcW9YZVBERkpLNlpROGQzSUNSOW9zWVUwN0xQ?=
 =?utf-8?B?VGV3ekxzUkN6S24yTXNrTlVtdzVKZjA0dGlpdm5FL3A0c2JZSENmUUs1SU1n?=
 =?utf-8?B?TTRVcnI2Nk5XR2VJV1hDeWt6R0dsNndyM1gvNmdkVFI0S3pXV205WEpVVVJk?=
 =?utf-8?B?dVVKY1l0WkxuS3E1bWlnT3NVWlBKazB3NFVaUXhhSnNhN3I2TW5BNVN5TUFZ?=
 =?utf-8?B?UkNqY1FiWDZwcVlBZDVWeUF4YU02WnYvTlhJakVvTVNRMy9xRkhoek92WUZQ?=
 =?utf-8?B?UFlyZXl2aGxDdWljSkp5QjNwYnhsNit2VmpMSW95NWErTEJqRGQ4bXYvSkh3?=
 =?utf-8?B?aWtXS2I1QzQxRFAva0hOekRCK3FDSzcvcldyUk5Eb2liZFc2MHNHSm9vTENL?=
 =?utf-8?B?K3gwZ3lpTnJnelR1eDV5UnZnK242MzZzWmlrQWpuK1FVUnRIajJNL1N1QnNS?=
 =?utf-8?B?aUFRY09aeVlxc0kwWGVkZ3FPbUdjd1lEMVhERGdiN3VIRVpYQ2ZVV25UQndl?=
 =?utf-8?B?SGxHYjVNVVJDUW1MU0VIaDkxOW1vd0owZ1Z4dTJKa0hYNlp1S1ZGWVBGdzcx?=
 =?utf-8?B?L0JMSUR0VUJqeDJZRTA2TDUxbFFYYkF0dTVrY1dUd0NQTkY4ZVpwZWhiUVMz?=
 =?utf-8?Q?hMgj6m4xmRHyCNMYKc4/Joz07b8xAiCyP2fY8y8ZH1zLY?=
X-MS-Exchange-AntiSpam-MessageData-1: b3LT+TSUoLBbTQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aacbe3c6-b950-412e-4de3-08de79309304
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:24:26.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avWzXMXa/f5aS11zcpc1kVGZxpp1Hvoojs69HhPuvJfBR6oMUbnNTg1aNsCQf5eVFB8EKb3RW/OXAHfysj8oTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384


On 02/03/2026 09:04, Krzysztof Kozlowski wrote:
> On 02/03/2026 09:53, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
>>
>> Tegra238 platforms use different clock rates for plla and
>> plla_out0 clocks. Add Tegra238 support in the Tegra
>> sound card driver to apply specific clock configurations.
>>
>> Signed-off-by: Aditya Bavanari <abavanari@nvidia.com>
>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>> ---
>>   sound/soc/tegra/tegra_audio_graph_card.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
>> index 94b5ab77649b..b6dadd6a3d3d 100644
>> --- a/sound/soc/tegra/tegra_audio_graph_card.c
>> +++ b/sound/soc/tegra/tegra_audio_graph_card.c
>> @@ -1,5 +1,5 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>> -// SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION. All rights reserved.
>> +// SPDX-FileCopyrightText: Copyright (c) 2020-2026 NVIDIA CORPORATION. All rights reserved.
> 
> If updating it, you should rather drop it and use standard copyright.
> This tag is not supported in kernel in general and I document it only
> because it already spread all over.

To be clear, you mean that 'SPDX-FileCopyrightText' is not supported? 
Where exactly do you document it for reference?

I know that Rob previously indicated that the 'Copyright' string in the 
above was redundant, but we have been told to keep this by the people at 
NVIDIA that specify how we should be formatting such tags when adding 
NVIDIA copyrights.

Jon

-- 
nvpublic

