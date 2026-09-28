Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A464C7555;
	Mon, 28 Sep 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603865; cv=fail; b=QkvjhB/9WhphiO3BnQbKn9J1B2RaRJv71YyIJEwMD5n8lWv7W78EhYeZMCzXGj9d8NGd3byiT6AVBh5LdUwe4V+bigcuh+TtplH9t2iU60QiRg2tSeYIV/0LmXwBpEcAB63e72nO3F3pzKnAi5FnFQc5BFoQDhbppagO3+9PjSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603865; c=relaxed/simple;
	bh=gDrmGsDaZxuYLQqhLdf4ZsAPeMP3qIYWGqek22nGJUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FC/or6Ynp6PAJ8bxGqnIdm2bQ5soP5FpgMRV+a0vdG9A+dF06w30SkmIG6hPpCzXtQBvvjZrFuFo1Fqpt8i8qv4SxJZYpjPRwA21v2cYln3PQRDmhJCLhCjyuBW+BUpB+u52nMK7LLbRrOQ0uvQwlvDqzTf6/XXuEqByp6pxeL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K/GWX7mv; arc=fail smtp.client-ip=52.101.48.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K/GWX7mv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch1xSmWUvhHE2BMrz2n+wh+wC1P/fKg0NANnBl8A/jFLGKhrczOoSdLUyRZkSkPlqWkqLGQycv9y+z8CtsCN6csokbRM+TkFc3D0RNzHIiP1fVEDD1JmpzB90OAqnFHmOPX5thAaRR34r3zCuKb9lcHGl/imbr5jjWleaVmTYRduvD8cIbSuafHDWCpWzC3EvrTfNi3fLwSOu12oH/55AD187t/hIqUzEZ73z/NDrNuYiOxVK/VOoO1tsuQpjiHC5JZRlTfBoDX4yhFF1gMU1C4SBQuxnYNxdcRibWDl62cG636AMe+wToHW2kUmWjzV6S7lHSyJvyaVH3woSfF9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XktqydI6oE7do/pflpHh7NwwkedVojninSmA+k9H6oQ=;
 b=kjcSB3sd1/SuMhfBPXECCU1kzXFm5uWfXVpKwsJ5TL7A4EGhhpCeoRxDpg0z5Om0Mtb6906QZjGGvGo39jOZYWYYA+2W1LlUycpheJOAUsb9hMyWa3cVS0o7zx6dmCj/CpuSGY//d6LRX68asLBDDw/dXNd/YmV09Khd4+7RtDwn/iQt3agV/1h+sUhSmaSu0L4Dzd11BqQtC9yQJU8Ab/SyrEfG1JZeDH7oxU99jvYuDkmcxZkCY3BkBH0BComOkv7S8v8XIj3rcwNchbxE4LlduOsLsRvgdqiPd4EdNMzBVvaOsz623aJ2AReN474iST6rQkXqrZ71Y+cUXkCuhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XktqydI6oE7do/pflpHh7NwwkedVojninSmA+k9H6oQ=;
 b=K/GWX7mvmAD8eQoLlYJRm2dMsP/UbPu4dHy0MmwKA2aBR+vUDw9seJgx/dlrsf2Q9CLYcsFazbhk6sW3iSKLUwJj1QcZAtT0nZdCeLqo8BSabCpMAbQP3jItUxtW6GZv+swr/ALno9gdf94T2yQAN2p03qrc9byit7OZGZJyjqyV4jsTrr9rdRhV35XVVE5XanOL8RqpGzgKHg28bBUEoyToX6cG4ilDec6qFPWsAO1Q9LwSB3Wl9KpqQmRRB16orKAKN+CXYKC+kOnc2lFJeWmlup8jcn6+VfAz3hR8LE0FNJU3MvgughotHWLmvu6MHtmAoyfvBw7mf3IprD/9pQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 13:57:40 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 13:57:40 +0000
Message-ID: <0c5b19f3-9ac8-452e-97be-0256aa0ccb0e@nvidia.com>
Date: Mon, 28 Sep 2026 14:57:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: usb: Add Tegra238 XUSB host controller
 support
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
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
 <20260921-tegra-usb-v1-1-74a925a35d82@nvidia.com>
 <20260925-alligator-of-authentic-economy-f631fd@quoll>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260925-alligator-of-authentic-economy-f631fd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::18) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: be8fcafe-c889-4b89-18cd-08df1d6875a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|23010399003|376014|22082099003|10067099003|4143699003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	JGZT1gAB80bWDbpFY2k+uVbdPhSy7G+87zCejbIlzeHSK79/MkMcDV6KsjJoqaKXxKex9nbJ/AziQtPUNYesMeZKlm6M0EBcyvRnzV+pgzWHzaEGPqg3+3K5H5UBJY1MG9aG4zsiPhPvTT5eLf3W0ZFzOmgWeYilWHGabF83gzr+GpkSK/4PUbzJ5Ts7F1Or9/UQBgX5blT82pFc1YxJbCZ1eaEKirOGiULrDPzNHgL4UgFDAxbTi8R2DJgWw0jRPq1TRzqT+w6rmCnjvxbRiV8FDnHqASJMKAhqPeEzW6nMUHVwRfPery+4yWgO9vnVvcbkNVshprXv+PAbGB9lIStLQ/HYe7Uvufe3GulRi47C7Aor+t88+npi3QSH55ZEb0OktZfem+CeCj60D4VOeKWCI/iDP/9hl+nz43v7WwwtLX4QeronfZn8fOwKFPqgpo4tT6hVjpqAzXXgOGc2dfjiPTSxBwku0Kv6QUDLrX/BVOEhPFwdwXiGUDYzn3imPgvRdhQQ6WmX9RTTFDtOC7YxgtI3ulVoCbRXfcu8quOs/krdxR1BUktYTtGIAfOHVO6KRdXfLwj1QwI+16q6xJ9BVVnYhQonTvULzs92gdcFeka2QJK2WmDExWbSDMWvL7U7bdhxZ5MAgheMjDUk6bDCrdOY/G+Qg0bZZsp7cQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(23010399003)(376014)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjN2QmtDTmlLaHhabjNGcXpHeWdtbHVzcVRrQVRLS3NROWRySFBJQXR4VzN6?=
 =?utf-8?B?S2pubmxCY0Y0cVdsSmk2ZTZoNDQ2Q2lxTzlZRk5xdnhaNHY3b21TR1FHdkl4?=
 =?utf-8?B?L2UvS3hCb3UrdUhjRzZZRTRMV2lNNytPZmhMVzIrRGlHYmpCQ0dCOW5vSnVx?=
 =?utf-8?B?RUpRclNHT0s0TXhoQUV0L3g0VThFNU5IVi9vam5nK1N2TDgvWjF5aktkWEZY?=
 =?utf-8?B?M3lKaFdHQnZsWVNrY3Q5bzJoaFdJN0Z0SGg4WjVRWDhmdWFwSTBBSmNoNTMy?=
 =?utf-8?B?SytSTHFLbi9VeDRrUXB3NjVwdVM5dk9HMkRRMFhqSEU0Zm4rcnlrNWQ2dk9q?=
 =?utf-8?B?YjYwRzE4Vm5UbDR2bXJoeGw2bXJ5U1JZUEFSK0VwRHpNV0tJelVSSHZQYnhU?=
 =?utf-8?B?NmM0U0wzWGJ5UllXamY5SjJhR0cvQVVNdEM1ME5UWEU4amlLQncranJDSWtG?=
 =?utf-8?B?YjNTUmhKekI0cm9PeXpLcHlibVkwQVJZOVhGMURFTWo5VzFwMWdmSjhpSHZs?=
 =?utf-8?B?SVQ3RTJvWVFSb0dHWHFDRXV2b1YwVm1PUTh6dWFxTmQyNW03RVVmcmFNRExL?=
 =?utf-8?B?ditoSUhicFRkRjhNOWdHZmNQK1MxWEtyNzBnYitiMnFyK3VVRG1jTzRXRzc4?=
 =?utf-8?B?RFR5OXBTR2t1anFYMTBJak45Vkh0TVhEN0dGemZuaTdPNlpqZ0NXV2NPRGEz?=
 =?utf-8?B?VGMyMUNRKzVpWmJycVhMbDBpZ0NjMEdSMEYybkhFVUpDamhGZ255RjFuSEVM?=
 =?utf-8?B?VmU0SGJGWE4rdGFmOHBpMHlaV2oyT1o3M2NnTkhUZm5rbnM4Z29EZ3Z3TkQ1?=
 =?utf-8?B?NG4zRmFDeWlhaXVraDhMR1k4b3VDNm40YTNpM1daVkVZaVNBWDBNa2ZsSEJQ?=
 =?utf-8?B?MVMzeEtJTGZaTGVyRkFialA3U3JGYVRYSE9HSS9Mb0R5SU1VTnlhNDFPdytP?=
 =?utf-8?B?SmppdXorRnF6eVZ0dmV2ZlJBK2JXVlYzQTNKVTRVL2lqWitGNFh4UFV4cHNP?=
 =?utf-8?B?Y1BycjRlTkdEbzA3ek1OOFZCQ2Y3a052ZzlJdFg5NmtBbzNqRythcmdvU2w2?=
 =?utf-8?B?ZmlRTFUvclJKTzN6Wm0wRG1QcU5vODkvNlBtMTlpQjM0NHJ4Z2JPeThBTnh0?=
 =?utf-8?B?VTE1Yk5LVUI3QUcvd096TVpjNWlBQnRXcDh6RUF2S1ZEQ1dEcnRGOEhtdFdG?=
 =?utf-8?B?T1VlUmxkTHhXVHFMZEQ3S3lZQ1MvMVlLdFBleHN4bkZneVcwR1YzdVhKK3pt?=
 =?utf-8?B?OUh2cjd2Z3lFWWIwdlpBemJDTy9CZU40a3VJZmlNRWRpL251WGFlRk50bHlp?=
 =?utf-8?B?aDVWMFhpbHhmWEx0QldPNm5mbGpnbmNDNm5XYXd2QnYxeW1kVEpONFI5OUFG?=
 =?utf-8?B?eHFLQ0FtUmJWTG1WY1FkUzlLS2dIcE5xZjEzRSsrVFVlT1VxbStjUkIxQStn?=
 =?utf-8?B?dEp3V0svYVo2SzFxeGFuallZaUVVV1FlQ3BUZzVBWUZSOHZUQWtkcGpUdy9m?=
 =?utf-8?B?OXRPR2tUNHRiSjkwaTVKNUs4M0o0U2MxV1FJUG1kL0xDeXEvRllNZXJhNG5s?=
 =?utf-8?B?RjBUbk1Ydk1Nend4eldycmhWQ3BmMnQ2cGEwTGhhUUxaVHE1YjhIRDBxOXow?=
 =?utf-8?B?SzZINnJiSmFiUjVkOUNSQSt3MEh4VzFOczZXMWFtdzAvRFdiVFQ5LzluTTlx?=
 =?utf-8?B?emZJeWV3WDhlSG1IT09JbGppVjhDRFVHZGlmMERyYzJ4czR6QkpRVFdzTVdB?=
 =?utf-8?B?QU0rTjhteVR4NEttUlVydzA2TDNsSnZTTUhLdS9rSWNRb29oNzRtYU1NMnVp?=
 =?utf-8?B?bHJxUkhQWXNLL2hvRzdBRGFDODdudUtWNTZXWmp2V1pnZTRFU2I0YlYwdzd2?=
 =?utf-8?B?UTUrbnRiMWVIYmljZzMybVdUWlFYNGxOL1hYU2E3bVFtU1BNdFdIUjIrQ2dp?=
 =?utf-8?B?SkduelJIMXZIS1E1dWY3TS9aVTZNV3BOV2F6dkU1dExTNU5LdFVZRlBpNHN5?=
 =?utf-8?B?MjJPS1o5U2tVcWZrb2FrMCtQb09MY0lSM3pVWlQyS1pjRmdUSHNjNVFTd2VT?=
 =?utf-8?B?ZFZOTVFQd2pIckZJMksrdUw3NzIzazduRFl1eStwM3I2WWhXVkdEdXQ0L0dN?=
 =?utf-8?B?SW8vdUhyWHRDdkpaR1hEejdUQjQxZ3BkWDdLK3pZNlFYajN1d2tPOTJwTW5x?=
 =?utf-8?B?amhKQzF1N2JidDhHZ0FDWDBzejlLUGFKejcyRXg3R05iR3dESGUvdk1XUjlx?=
 =?utf-8?B?ZVpBSlpTNkNBdDRONE5Fc2Q5Q3NIejF0N2k0dk01cEpqZkZwMkpqRkhReFNq?=
 =?utf-8?B?VUh4V1V5bGVwS2R5aHZSeXprWHFsaEdIb04rNS93RTAzZS9RMmE1cjB6eE02?=
 =?utf-8?Q?/kW8UzEhV8aAJjNJFr8RCz7ZCauI2uLK0+I2TAZDRhIHw?=
X-MS-Exchange-AntiSpam-MessageData-1: 0Nkw03HROAJP1A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8fcafe-c889-4b89-18cd-08df1d6875a7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:57:39.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVar6OSeyhcrN5+kQ2x2NARL1WttjNX5397MTvU5TJ//ws50N+82b8IHV9pkJnfxrOaw/RLswBYXgMJY6qsdoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443


On 25/09/2026 14:27, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 01:19:01PM +0100, Jon Hunter wrote:
>> Add a compatible string for the Tegra238 XUSB host controller. The
>> Tegra238 XUSB host controller is similar to that found on the Tegra234
>> device but only supports 3 PHYs compared to the 4 PHYs on the Tegra234.
>> Hence, the binding is also updated to limit the number of PHYs that can
>> be specified for the Tegra238 device.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   .../bindings/usb/nvidia,tegra234-xusb.yaml           | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>> index 3f56110be915..9d605db7e77f 100644
>> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>> @@ -19,6 +19,7 @@ properties:
>>     compatible:
>>       enum:
>>         - nvidia,tegra234-xusb
>> +      - nvidia,tegra238-xusb
>>         - nvidia,tegra264-xusb
>>   
>>     reg:
>> @@ -154,6 +155,25 @@ properties:
>>   
>>   allOf:
>>     - $ref: usb-xhci.yaml
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nvidia,tegra238-xusb
>> +    then:
>> +      properties:
>> +        phys:
> 
> minItems: to be explicit. I would expect minItems: 6, but your phy-names
> is flexible, so probably wording in your commit msg should be "*up to* 3
> PHYs compared to the...."
ACK. I will update the commit message to make this clear that this is
'up to 3 PHYs'.

Jon

-- 
nvpublic

