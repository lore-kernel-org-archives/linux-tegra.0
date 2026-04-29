Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1F2D876A;
	Wed, 29 Apr 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454860; cv=fail; b=W24pu2S8RLQLsowxJTkKbf/RxWSD5fXPkO0WwPlryqew6X0MABPgVDTjiGOlSqUYzMSlA/0IbZMktjgAyjoQmoNk7nE7QSdLxUymthdQ+E8r/RdddccLZfbrdMZ38+tiRVrNjBC/TPvYsMCEaZxJJ/XzFJYLkcS4f03EfBw3hhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454860; c=relaxed/simple;
	bh=ykv9qsU+oUMUIsGaEGj7B1u2TCMLGLUBhUMv0kav54I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mr59dhTJj0tIC24fNmqTcro7TxCU8Ro0f9JwL0biltNYfq2PJxHe6Nqwrj4qKmT5Yr0x/X/rjwxJcn/7iPt35fHyXNqOi6YSpyNyrGsTxBjOA8WIyI3eY0Pk/IaI4yNw+ii3qPVntJh6nRkHrCgdVFdbyzg4bREm8aq63sp1qLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Za4cQI65; arc=fail smtp.client-ip=52.101.85.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Za4cQI65"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWPy0CZWtf/EXkad2+fsWMgibJO8MSeFE74oezv6b0qH5W6hGqPQ8jBHwQS1azkecpBw7D08uwXWkrFpCk1KRoizRa431LEFZWh/TM2UJeBnTZ3NCdQ4JLckuvVm2Pxr8ktszuU2mWdHsuDfLjW2qMzZV2S5815ja5UDOowr4lPfGGbUbjTjzETA3s3QUu6ijL87o0abJnKA0v8YY1LltRuW5dghUJNmvmKRgk+gaMAh2rXjgOOgYPVCjT+l/uDTn5RK9a7EoFckC1wUIaqkU83oUKWoBvrwyJHi6fAxbyTIPxqcN2dRv8kjovjgsemTkbwsNejfYkXGS/qrGN97CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3e0KBXIbmLw9RgSfZBrfy/sJOAA/ajKtHlFq+573ss=;
 b=PYM5hCccfXA/tlDT8TkEgUB/5AApFeHhNfGfaL/cAcXmSVfdJAhpMErlJq6iFp9pf1G/epgIAMLTtG03RNo1Ttd4E870v0+L7dR7jHfzLPoYdjPnvsWT6PK1eMKd7PtPhFE1oQyVYTwzjPkjIDyRF3NaIiWtxg5U9kVwuuTirM2mHINb1z9QwpNMCBrkLmmaZ8RDTJLgGZ/Q+mDxLwwuGRauh5yUwpAPFdyt943Em1QnN88M0QJeqsxqY8B3T+akUfQ8iKvC0gNUq8ZUB0A3xAzj2D4VgBFAo4qfL8OGIyblBJTYwzjRqJPY4b4FCl2SQVrXunkybRigkSnHF7yjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3e0KBXIbmLw9RgSfZBrfy/sJOAA/ajKtHlFq+573ss=;
 b=Za4cQI65PKvaErj/wUJw+96UgrKtRb9BxPRnA5XMSDbj1REBBehko/AWZizrTJsST5JK9lbt20fgtrmnHLJ8zNROfa1CYpvqnncaBocU6cTm4CgttOOrrl7QwaF0Y8HxRQVlwHKTQm1aY1wJ0vaqwoXE8MyBbxkDNaokDBebfTH1rOjQUWovv9+Mnmv075aIupjttYuvmswZ9ayjfMaj6PPqXBvfvhQ7WPFFVoW1ZSRX1T+gsyHNN54pz20JtiE4hbC958kEuh1X2lOKWzagn6hTVdrr1QYDozplq8pAds+kdsCWDN3fdF9D+rgRk5WtV6QyL8H+dDxzhWy9SioZXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by DS5PPF5A66AFD1C.namprd12.prod.outlook.com (2603:10b6:f:fc00::64d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 29 Apr
 2026 09:27:34 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 09:27:34 +0000
Message-ID: <8e873293-0f56-4ec9-a469-ea5d0fddebd2@nvidia.com>
Date: Wed, 29 Apr 2026 10:27:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: memory: tegra: Add nvidia,tegra238-mc
 compatible
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, =thierry.reding@kernel.org, sumitg@nvidia.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260427073419.567360-1-amhetre@nvidia.com>
 <20260427073419.567360-2-amhetre@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260427073419.567360-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|DS5PPF5A66AFD1C:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6c3985-8866-4055-58d8-08dea5d18b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FNysAYTpLI3v7pFOtMJXnM+48RKxRsAtRT8DkAUuL+98fntQZW2SXJhhzG2/CX9ls02RXOIIoPg84U0y7oc3MhZUholar/FwhZQ9wrlEUDItkbf3cwSTJxPw9JOBBFa9frG1lP9pm9BIzZUbJN3zWWE1EoZz7tw4G4NsC3Ra143/xZYiIQu4qEn0HvdSsuXKzHtl9yy7rSFqj8JhABZPcYcqYy/pXYwInzUu69dQ3F/K80O9ItWmhNRm9R9DBVg/NijfbzhFqqHjvrgS8FSMM7DR4mu2G6qblrs14C5z17p7P7PXO2c/u8OGR+v0NlioLrIpzB4rLnPWicXZX0TymyA3WqprvYqKxGIl8TditCfTCaHTljUAc9t1PpTzZiWwIH5KF9Lsj2aMSX5LY82rhpXb+eIwVczO0Zf/vmwUAz1OrX8yjKhR6ZUJUrTOckhdEt6fmV/KY4J5dcT8AdBi6BIzKKibwiso8iSuJb2lKPiIDGkWsHZpGcbkClHQjOcW38cF9IxhHWQDCuPqd8pXgBV3Qr1+Buetju3BKL2iUKqlEpxGrjEkUlZCOHGg0yoFlSwM2PGvgqbipYAohguMzlQNV3XBm3PKCP9tT4VLAfnMM8Qnb6PPxhTDXzcdrrx+S+daPcWJauWBzLmxITPeZfBiYEyjpNf+VNOLtujYripCZK2nSZreWm0qpJEH2swP0qbOFJ7gWCUWCv2NPYgK3odxQa0M3MBE9h7UpnJeFtQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTJ4SEpReVBZcWZCSWpKdlhkcDNDTWhNcktmakUvTGNKQ1FkUjY3MXN2Ty8x?=
 =?utf-8?B?a285clVLeTYvNTU0MldPU01CR1VBT2txT1hoOEkrSGVrT2hGYmZvRDNINC9i?=
 =?utf-8?B?NEFodjAwQTR3MU9zYW1xOCtQNCtCajNPY0c5T2xza0RGVnlFUUxZM250QkN1?=
 =?utf-8?B?dWRCS2p5Tlh6NUtibXFoOFcvTExPTVBwbEt2elc1UHhLbmVRdmlCWnZPWmhJ?=
 =?utf-8?B?VklSd1ZNM3Y4bEoyWlptalcvMGpRbG1uTFhUNmU4c2gxVkZkRkZ5eGxVbDl5?=
 =?utf-8?B?RmQrZTVBWkFzY2hXRXVzR1IyVFRIZmFaTktVeURtUEpyRXdmaU0zU09hMGhJ?=
 =?utf-8?B?UXZtUHhmSXNxZ2dMeDZYWFVLRFRpcXloanRIRmo4SzZTMm9uT2prSjNuZzJT?=
 =?utf-8?B?RXNRa3RkbHhvZXBRZStGTHp5L3dxV2lVcUdFUjVPcmpRV0lCNjRGODRSdUJY?=
 =?utf-8?B?WW1WSnVhUVBYMUtsTDNPcHg5ODZsclN6SU1TQVYvc3dlOUl0bEFpZDdEdkF4?=
 =?utf-8?B?WmRIcWJYTWNQUHJYU0dnODFDWXRzeFJMdGI0VkNrSlZMU0xTeURMMGxzS2VE?=
 =?utf-8?B?LytPYjdxNnFCYU5nZjVCSWtvMk51aGFyMi9YbGhwdlRyTUx5bmhsS3Q0TXdD?=
 =?utf-8?B?V1pKSlFQdEhwbHNUYlhlSDFuR0tsKzVCUU0zUUtCRjN3KzR4SHcrVW9BaFZL?=
 =?utf-8?B?WlExWFU1ZnQzYXlaSlVJc1liNDNKd3dSVHo4T1poWGo2bDN1RGJvWUtXckVl?=
 =?utf-8?B?YlZCS3NJU0xZWUR1U010anN4NW9YYlBiUjVDRmxlWUlWSFJ2MnUwN0ZxcGNu?=
 =?utf-8?B?K2R3RzVtaXo4RVlRVE9PaEZCOGt6T1MvYzNjWjFFSXBjbzE5b2x2RzhWTS9U?=
 =?utf-8?B?eXpxYmNyVlB0QVg0NTV5dXRMSGNxdWdsSXFiK1Uvb0RJODhVQkRydHd1VEtS?=
 =?utf-8?B?NExjMVFxcllGTmV3RVd5d3JuZSszQThCTGdjVE8wSytLTlRsTDZ6aE9VNTNH?=
 =?utf-8?B?enFSdGlXYlg3SEdEd2R3bGR0bkE5NGpzMnFEZjlLN3VubFFZYVRrOWh6WHBZ?=
 =?utf-8?B?eEQxd09GYURaM0p4cEIvTzhyZFVENkQ0cUh4U0lmcVdQYjh1Z0F4NVNFR09Y?=
 =?utf-8?B?dEVEbHR1elNnNGtLYkFRVUJmaDFmK21abUxCTnpDbUl4ZDFORnBKREtvN21i?=
 =?utf-8?B?RExGSFVrMnRQdGZWV05hYjM4QW0wTVoxbmRMYklSVDhrdU5vaUhlRE5NNjB4?=
 =?utf-8?B?cmxZbGpLamVnNC8ycU5idUtCTVZISGhIcndjZnFIeDM5TjRZaEgyNitIdEth?=
 =?utf-8?B?RjJ6a1VkTndJZ0Z5YWxGKzhOcDU3b1d1T2ZkNGY1emo1TFFrbWZFMUJsL2s5?=
 =?utf-8?B?TFZoQkZxREIySi81dTMwb0RkcWp6clZOeUdYVWFhZW9pUkJTVXdkV01MOFA5?=
 =?utf-8?B?M1JudTNoMDZOSEwwczhSaHlyTGp2aGRIelRETk5lYXJhMUlGeU4rWXhxVHE3?=
 =?utf-8?B?aDNDSWpLZUFqUXFwemdzOW5vRkRyalNMZkIwN3FhTjN0MDd0c0h4Z0VkUHl1?=
 =?utf-8?B?M0duenRwcmtFUDdJS1NtRGc5S3dXNnRsbkdxTUk1KzRlUzdqWlh4cklqY2pL?=
 =?utf-8?B?eEN4TmlPRFp2bWR2LzJxbWtZWTYyelc5NVB1Ly9oVTZCM1RVWDhTRnpaYlNm?=
 =?utf-8?B?bGVJOE1pZFVNTmlpZkx2cXZGNTZRUUhadVBpQWIydmNVRHBsbXZxSTFjdDlF?=
 =?utf-8?B?QnVEbmRpOTZYSGpabldaRnN1bGduSyt2L04vYll3aVB6aC9aYTlqWUJRN3Nh?=
 =?utf-8?B?WXp3MkI5THQzSEZHR3p2MlQ0RHJkamFqYU9tREdBSll5eUJlT3M0SFM4UHM1?=
 =?utf-8?B?NzVqYklpSk5hR0RtYTFHWngvT1RSNmhvcUpWZE9hNTc3dm8ydWhzdW84Z2hU?=
 =?utf-8?B?b3g1dU5Fd00xL2d5SHRhNEhBYXBpSzFjWGZZZFRWUFgyQldOcWlxMHlXTmk3?=
 =?utf-8?B?QWNBUmJ6NDZDTWoyY1M1Z0ZBM3N4MlhndkdhREMzN1EyTTlaWGV5ZHlkd2sz?=
 =?utf-8?B?Qm5jMFZhaWZvYWM3dFF3M3hyS0dZT21URjZaQWxPVTQrOHNMOHpCQ0tGbDll?=
 =?utf-8?B?YzZxdllDY3lvNmY3OVFxcm5lb1l2MmlkRHdxTjBicFZjb0h3QVNGb2YxU2wv?=
 =?utf-8?B?Z3VSS3k1d1kxZHNEbWorcnFNRXY3am03K2ZXVTlDam1jU3BqbWxVSWpUTXl5?=
 =?utf-8?B?M0FGUTZ0dm14MTJJUHUrN2paOWsvYk0wbXVXUEU4Z1J4WjFOOHFGV01NWWVh?=
 =?utf-8?B?RmRPY01RcXp1QzE3YVQyRUFTMHJ1Njh4TGJrRWJVUE5WSTQ1SmN2MVVuOFhj?=
 =?utf-8?Q?Hgvd9pbKS5Z5bdfRFzoxng5qk9PxHpv+2XC47bd+J/SsZ?=
X-MS-Exchange-AntiSpam-MessageData-1: V/n05NXNNrwmsw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6c3985-8866-4055-58d8-08dea5d18b99
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:27:34.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLI/y7arLglFxEznBJy3U6+zRlkgGLeuZi61VunBThshRjgkrhQnXsdKBEuErFoLpX4C4KRj+Zcq7OFeAAOcBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5A66AFD1C


On 27/04/2026 08:34, Ashish Mhetre wrote:
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
> index 7b03b589168b..6c374e2b1543 100644
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
> +          description: 9 memory controller channels and 1 for stream-id registers
> +
> +        reg-names:
> +          items:
> +            - const: sid
> +            - const: broadcast
> +            - const: ch0
> +            - const: ch1
> +            - const: ch2
> +            - const: ch3
> +            - const: ch4
> +            - const: ch5
> +            - const: ch6
> +            - const: ch7
> +
> +        interrupts:
> +          items:
> +            - description: MC general interrupt
> +
> +        interrupt-names: false
> +
>     - if:
>         properties:
>           compatible:
> diff --git a/include/dt-bindings/memory/nvidia,tegra238-mc.h b/include/dt-bindings/memory/nvidia,tegra238-mc.h
> new file mode 100644
> index 000000000000..be24c0eb3f15
> --- /dev/null
> +++ b/include/dt-bindings/memory/nvidia,tegra238-mc.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
> +
> +#ifndef DT_BINDINGS_MEMORY_TEGRA238_MC_H
> +#define DT_BINDINGS_MEMORY_TEGRA238_MC_H
> +
> +/* special clients */
> +#define TEGRA238_SID_INVALID		0x0
> +#define TEGRA238_SID_PASSTHROUGH	0x7f
> +
> +/* ISO stream IDs */
> +#define TEGRA238_SID_ISO_NVDISPLAY	0x1
> +#define TEGRA238_SID_ISO_APE0		0x2
> +#define TEGRA238_SID_ISO_APE1		0x3
> +
> +/* NISO stream IDs */
> +#define TEGRA238_SID_AON		0x1
> +#define TEGRA238_SID_BPMP		0x2
> +#define TEGRA238_SID_ETR		0x3
> +#define TEGRA238_SID_FDE		0x4
> +#define TEGRA238_SID_HC		0x5
> +#define TEGRA238_SID_HDA		0x6
> +#define TEGRA238_SID_NVDEC		0x7
> +#define TEGRA238_SID_NVDISPLAY		0x8
> +#define TEGRA238_SID_NVENC		0x9
> +#define TEGRA238_SID_OFA		0xa
> +#define TEGRA238_SID_PCIE0		0xb
> +#define TEGRA238_SID_PCIE1		0xc
> +#define TEGRA238_SID_PCIE2		0xd
> +#define TEGRA238_SID_PCIE3		0xe
> +#define TEGRA238_SID_HWMP_PMA		0xf
> +#define TEGRA238_SID_PSC		0x10
> +#define TEGRA238_SID_SDMMC1A		0x11
> +#define TEGRA238_SID_SDMMC4A		0x12
> +#define TEGRA238_SID_SES_SE0		0x13
> +#define TEGRA238_SID_SES_SE1		0x14
> +#define TEGRA238_SID_SES_SE2		0x15
> +#define TEGRA238_SID_SEU1_SE0		0x16
> +#define TEGRA238_SID_SEU1_SE1		0x17
> +#define TEGRA238_SID_SEU1_SE2		0x18
> +#define TEGRA238_SID_TSEC		0x19
> +#define TEGRA238_SID_UFSHC		0x1a
> +#define TEGRA238_SID_VIC		0x1b
> +#define TEGRA238_SID_XUSB_HOST		0x1c
> +#define TEGRA238_SID_XUSB_DEV		0x1d
> +#define TEGRA238_SID_GPCDMA_0		0x1e
> +#define TEGRA238_SID_SMMU_TEST		0x1f
> +
> +/* Host1x virtualization clients. */
> +#define TEGRA238_SID_HOST1X_CTX0	0x20
> +#define TEGRA238_SID_HOST1X_CTX1	0x21
> +#define TEGRA238_SID_HOST1X_CTX2	0x22
> +#define TEGRA238_SID_HOST1X_CTX3	0x23
> +#define TEGRA238_SID_HOST1X_CTX4	0x24
> +#define TEGRA238_SID_HOST1X_CTX5	0x25
> +#define TEGRA238_SID_HOST1X_CTX6	0x26
> +#define TEGRA238_SID_HOST1X_CTX7	0x27
> +
> +#define TEGRA238_SID_XUSB_VF0		0x28
> +#define TEGRA238_SID_XUSB_VF1		0x29
> +#define TEGRA238_SID_XUSB_VF2		0x2a
> +#define TEGRA238_SID_XUSB_VF3		0x2b
> +
> +/* Host1x command buffers */
> +#define TEGRA238_SID_HC_VM0		0x2c
> +#define TEGRA238_SID_HC_VM1		0x2d
> +#define TEGRA238_SID_HC_VM2		0x2e
> +#define TEGRA238_SID_HC_VM3		0x2f
> +#define TEGRA238_SID_HC_VM4		0x30
> +#define TEGRA238_SID_HC_VM5		0x31
> +#define TEGRA238_SID_HC_VM6		0x32
> +#define TEGRA238_SID_HC_VM7		0x33
> +
> +#endif

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

