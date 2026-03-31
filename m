Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBA735949;
	Tue, 31 Mar 2026 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774960386; cv=fail; b=egxFNjwlnpr9yzcbIf9SPUMkMdiimtdeLvuqMHwpils1Ev9jd2TeDslaEOXxP5oQRfLL1wi+RrDwKK7e6EHpzDPxh5wRx2TF8OLdRAV/YdzQibG73KotcRSC217oRxQHtgmoWxNTVLBDlC40tg1zKnTCK0kOciEJ10JiTnlv/PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774960386; c=relaxed/simple;
	bh=y9NrI60AW908j2BhhfbVLEv8DBsU5cdlUWxKj0LwVAU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r+3PonUGM+i92ACNEzoHZ8KJhkpuhUO1Z00kFGjoCQttRMQU/vhi+t4ROvVFj5J47XWbc8yoXaFJ1HcGSru8vp0KSvyjvb5UZ7cmN/b0TmcSi3tpA+mZlsZ6ir1LYhyD3mSANk7FEe6wNV3vmRczMRenxLOEkgzs5YFUHHG8mNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gwdXBtpn; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gwdXBtpn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJOFJu6EaJbJuYnE0jTvp1AHv9E/VBYajy3UdG1bQyxyRi+gVOEJDfS6LwzQpfH/4Qpv0R9ULQpeciAYAmVWAIOdtNiQu7qW2tzy/x+s72Sy2UA9wijJ9D885QB9QVtwCQ/WvtEy8iCfHpV6Bdb2YLD6Uzdcm6yJI4SIndgjh+VSS7hJ+8e+65F2L8rwNSNQvSmutpU/7hOavG7QYfyyCiinhCNreCUk20TZhTJBbBGuvAbZwf7ANltEw1fwO+LOwqxFJg2HnWDIsVR6dpfaEz29CpYodIGkOIsYQDlX4Yf4uCrn/WaPACV49KOQL5z+ZDAf6Kb07SRwBX5lkf6R8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IDtO9DKwASo7dEA8RDtUgQ8MjtNK9UzHzGzJcmc7A0=;
 b=bPQqa+UMP7PHr8w06giDdp3Qq/16rrqfi3sBhouB/NFfXq5mRRP3I9Cph2x5Lh9nqQWGCGWXbiDlqTmBQCIbIGqIvQ+v2OLtpXDXVQBkXEnAVezBzKK/b9KDP/d9w94WI8p0GmhYEdexVsfccXW/dJtgGSAEwoB69EQModfsOfkZ9JeoUmahJ6ufoEL3Q+LGdTx+F8zpjS234yGcT3qu0RPH93QZDRsJYSJ5RW+zqAvSjzlVvIZlbpYEke0x97JNoY8iQVdZ01jUFiFhX4IlUe05/XjgypThGMoMrhv6De4K1wcMW1RSn89YVLuSdeeMLZUl5ThXl0CoPgERwU2nHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IDtO9DKwASo7dEA8RDtUgQ8MjtNK9UzHzGzJcmc7A0=;
 b=gwdXBtpnpuHPp4N49zpB6QQVuDraStm3KxsgrY0oKN04AAkAeVFBvjZ91LqT4LwtMFQeluiF/YTT/DOCvvuS0X/pvIGdE6O9DR4kI3YCoR1rKPO0hIX3T9qmvyXEQzRqJYJHfsAWKuHpAR3pTtVisqba98l0NGZGF5DkUjAkyNdPeL+eUTWCBcFMNRK09DtSyDwj/Krz54K5pO7iZxDnbEY00EQxu8fGcqw/Ng+6mHu8sNiryKzanWZkhJJdQkViWMqa/c279VY1sJxuoVC04ug3nYk+R7ScOvqWdYAe6k/9CEDFTrpAeXCbDJV7wDzow2r3MpwBOqVcb3lRl1jNiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Tue, 31 Mar
 2026 12:33:00 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 12:33:00 +0000
Message-ID: <b3d2a384-b57d-460a-b008-475021874641@nvidia.com>
Date: Tue, 31 Mar 2026 13:32:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: memory: tegra: Add nvidia,tegra238-mc
 compatible
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, =thierry.reding@kernel.org, sumitg@nvidia.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260331112347.3897841-1-amhetre@nvidia.com>
 <20260331112347.3897841-3-amhetre@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260331112347.3897841-3-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c5eaf0-942a-4b9c-35c2-08de8f21a513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x9KDyxZnx4TkX+k5CnLZ7oQ8Eof1cJdYd+XX0sTvEj8iTBSvVsLQGkpi+07r5B+1d4o4xneHUsutyTHvYDsfrdu3kXF/SB5UMXdaJntgnWlbvgzIeW/MV+Pt0t6SAVRI9kMOuAOidVZ8VyBRlRu+tFevbKM845O+iJy5K6Y9IY3rQQHNTqjDvif2C5e3DK9MZ9PNXFN/52y8vF7UvkzHjt+ZUcVFRVXTLZmxi5dGq0XiArx51BdwCKh8I1w/jWKsE5zukAIp63PFPXn+BSowR+rkF1b4RGRIdI+T0kawjokxRQd5+Cj6vBTJTLgNnlBxTRVr0E9T4E57ibcVGoJtXPI6xdHt6i1FoP2GIo2jkygEwRlMs8FnWOpFJrrdUTpNs6YZKDbz2iIS4YpjL7ha+55FIAGTcHy3Oj08coPiCQGPP+Tq9LH4Fm/yNWUJurrgRG63K1hPoQZnndKKCcszEM8MGmyJ7uTPAwyUMCONSDCg1JUxNffkDlRdhND2t50+P3BQRMet81PlUoxZLJ+YWJ+aomjH2ellEYmQYB6AkZ7/w0eeThmr24pLZGZa6i+WGcB89bKzTVp9/idlVYCsM3ckdBDqGU+YL4qTOtcQpIsVTHDVWWHidc8DGmktoTa95yCMrWnhq2Xu3Z1/4/E/Y305wyNKCgW6vbaVjoTXIqvkvdBy79XH80yXA/3pSELflUZgpn3uVaNmkmZXSKva6EcL7tRo1f5oeJEX7SVeto0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXh1UllzTkxKZ1cyYnp2RXBqdWNjT3kyYllqS0xkcHVzdytqcTZNK29CVzVt?=
 =?utf-8?B?U1hzbUs3YXFBc2hCQi94ZnVweis4a0MzckU4aGJGcUUxeDVraTRQanpuNGpC?=
 =?utf-8?B?RUFtZURoZlpBYWsrZmxMQ0czSTkyNEt4UDg2OUdrUU9VTklvUmZnTm85Z2RB?=
 =?utf-8?B?TDc2VEpRTHJsQ2dQOWxUT0ZrM095enhtamtIelhGaFcycE4vcXBiTEMydDNy?=
 =?utf-8?B?V3B4YTEzYnQyampNR3BZYkM1TnpBRU9XejlDZitOQWZDNzVxSkJYUEZKcFQv?=
 =?utf-8?B?SEl3aHo1NVFSTFdRSWJDL251d1BUWFcrMmcrR1cwWU1OZnRiKzBGZzlCVGlS?=
 =?utf-8?B?UmZmV3dDSTFrUG50NU1xMksyZHNKb3RoWFlnQXVNd3g4YkFZOVFxdnNQbDlY?=
 =?utf-8?B?QjVDdm51SXVVc2dQeXJ4YXBRcnhiVkhJTDJKOG56eXd1b2hvNEJSUkE0TTc1?=
 =?utf-8?B?TUplaW5tQ3VMTldjQ2ZTME5oMm1IaXRRU25XOEYvVjhaVVBMclVQZ091QjJk?=
 =?utf-8?B?Si8wbzVKUENpVlVsbzBiOWZkbzhTYUhodHQ2OE1paHNRWFNhZVpzVTJ0aVN4?=
 =?utf-8?B?TDhKdnZHYnlkNEp4KzRyQ1V5MzJGVFJmQ0xpaUE0VC8wTnVHNnk0WTNkeW11?=
 =?utf-8?B?a0M5N3JMTXlLRTF1MGpvQmRYTGEzR2VRRk1qVzRwMWJRMnNpT2lNQkp5VGdC?=
 =?utf-8?B?ck03dUFYYm1LVHJkbmZSVUlwZWxvL1ZLOXZpR01Qa0dOcGgwNGZSbHlrWjdJ?=
 =?utf-8?B?UHFGeHZ3NFJ0ZUVRaExlS2JjalgveTZHZDE5cnhPWkNYYURNZ2x0SWVnMHVI?=
 =?utf-8?B?U0c3STRXV2EwYTZCRE1xVW9OdU83UEFKNTNPMmNOclQ4VCtyYVFlNVFlcVhD?=
 =?utf-8?B?QVk0SFREVGhPdEdtSlRPc2hzUmhwaGVjdzJPcjYvWlFxYmw2a1k4Y2VHR0lN?=
 =?utf-8?B?SXFIT29odlA5TmMyUnJoYjYxclJETE1FazEwL2d0ejd6RGRvZnFDQUhUUDEz?=
 =?utf-8?B?dk95dXhSUDRPcUdRcTFyNkg0ZU8wVTRFTEkvSG0yd01ZVTZhOTc2SENvSHpV?=
 =?utf-8?B?MjVQZ3Z2QVFNODhyN0VKZGsxYURtQ3AvZGVYNDZYOFFWVlRHVWFiL01aQzh1?=
 =?utf-8?B?ZEhpWWRQVnp0aktvK2NVdEdzQ0g1T25SemFMNW15bFY3OUhjS1FBY1h5T2Vt?=
 =?utf-8?B?ZnpwVDVoMkdSWmxsNWhVN0FiVUY3ZTR2Nnk5NHZoeEZCaXFRb3VpNTJMMkwz?=
 =?utf-8?B?WXVVak00alpjUGZXOHlvUEhlNi93ZWQwc1ZLNXcreUlRdGQ3cEhtbnpGMWdS?=
 =?utf-8?B?Q0dRTVlwVlNtdzc5MmgwRXJOcUM0U2ttUjJLYk5VQlhpNXRyak9zQTNRZWJW?=
 =?utf-8?B?WGltMHpWRTZWNXNLZlR6aWNDSXlWRGs2SW02M0pncG5vQjZueldYYzBkRGhM?=
 =?utf-8?B?Y3BtNitHUlBmeHk0a1Mxb2FTMkNYU2FxZ3RNRUdyVUMwb1JDSXNQcHV4UEpQ?=
 =?utf-8?B?Yy96RnI3L1NqaVo3Y2I0U095aFNZSk9aeVFBdkVQZmhhdDBwWUJTQzhHZGpu?=
 =?utf-8?B?bXJZRnhNK1FXM2lVMU44SVU3Tmg5YU4vcEYrSGdXczhsL0ZKSDJ0UmtoaGZG?=
 =?utf-8?B?bFp6NktZUEw1M3lHZWMxbHFyQ1NzVFFST1JpdzRxSXU5aytjWHg1aUNocGRk?=
 =?utf-8?B?dElTVmlYNVYwZFZJeUh1SFVjL2NvRThuSFg0eC9Ob05YOGIxM2tRZjBMREpW?=
 =?utf-8?B?N1h3cDkweVdjaWxsT0ZLVjQxaUsrZXBRaHlCSDRaY1lHR3lWdzV6QWtuRWZP?=
 =?utf-8?B?TlZIZHNYSVJwZnZnMkJOUDhwdXBaUTJoeDhBeUMydEdzUE9SdHlvblhtRGZa?=
 =?utf-8?B?cWQ5ZVVMRzQzZTRodHdBbGRQQ0EwNEdCNC9TRTNhUnYxMmZ3NEhHd0hFUlk3?=
 =?utf-8?B?bGR3aWZCM2FEdmdpUmJFYUVYRVRubllsVkR1eFkxaFQ0czJJV2dRclNZRUlK?=
 =?utf-8?B?ZXRsYk1mU3BBRFIvVzZQVHNCK3lNTnowcE5PTjdLT0FicFJnYmRPcXpFR1lP?=
 =?utf-8?B?OVNCdFB5QksxRjh6emw1RHNVbktPV3pQZElJdHdCNDFuMWhHbzJMS0orMEFR?=
 =?utf-8?B?N2V6SmQ1SU1JdXd4cTJJb3hrSjVRaStDak1GdzkrR2JHOGxUekJtcndKRTkz?=
 =?utf-8?B?ZjlraU5tY1NWeEQreTl6ZlovU0lsSHdyUkVRTG9QaUJoV0dvRXVtYW4vczB0?=
 =?utf-8?B?M1pyVElyMXJuekVGc0dKbXFUcHppNFo0QmlvSWZhT2tqNzZUQnB0UllTWk5F?=
 =?utf-8?B?Vjk3emFITW1KVEtzMU5rT084aWtFZ29BNkJ0akJjN2hPQzNrV3Aydz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c5eaf0-942a-4b9c-35c2-08de8f21a513
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 12:33:00.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tltjg7YihR1wq9vdMc8jEqiF8LDY80jNnpciQKt0FJLuuqJS8P8c2VHX9ydahCLNnggQEeG40MDABvn1mTmRBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977


On 31/03/2026 12:23, Ashish Mhetre wrote:
> Document the device tree binding for the Tegra238 memory controller.
> Tegra238 has 8 memory controller channels plus broadcast and stream-id
> registers.
> 
> Add the stream ID header (nvidia,tegra238-mc.h) defining ISO and NISO
> stream IDs for SMMU configuration.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   .../nvidia,tegra186-mc.yaml                   | 31 ++++++++
>   .../dt-bindings/memory/nvidia,tegra238-mc.h   | 74 +++++++++++++++++++
>   2 files changed, 105 insertions(+)
>   create mode 100644 include/dt-bindings/memory/nvidia,tegra238-mc.h
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> index 7b03b589168b..e008cb1ccd28 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -32,6 +32,7 @@ properties:
>             - nvidia,tegra186-mc
>             - nvidia,tegra194-mc
>             - nvidia,tegra234-mc
> +          - nvidia,tegra238-mc
>             - nvidia,tegra264-mc
>   
>     reg:
> @@ -266,6 +267,36 @@ allOf:
>   
>           interrupt-names: false
>   
> +  - if:
> +      properties:
> +        compatible:
> +          const: nvidia,tegra238-mc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 10
> +          maxItems: 10
> +          description: 8 memory controller channels, 1 broadcast, and 1 for stream-id registers

To be consistent with existing bindings, this should be "9 memory 
controller channels and 1 for stream-id registers". It appears that the 
broadcast is just consider to be a memory controller channel.

Jon

-- 
nvpublic

