Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012048.outbound.protection.outlook.com [40.93.195.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0F3B52E3;
	Mon,  9 Mar 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064487; cv=fail; b=mPQ2yN6BnPcSW8u74rE/0jsjgc7zW3vp/AIuyrgwFsFo723sFPzsMPG0jk/EhthOz6Jk0j4I7+LKgyNcrjKqWX+d3AOjKFwVDzLqFCQHMLC3y4NAOc1cQLcyMUCWyUm2bTHps3fihxXpdP627zFIvScQXkh/1VJMKEnOaEHVN8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064487; c=relaxed/simple;
	bh=cMl+aiem0qvLMv/Kv0zTj826dUvM5j1uGLkNT6zo/mo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C3l4dVWeNHhvdz5HJMVBDBcrS6hz89zw2QdMybOF2lX+G/f4hSgu+/lnGDd0zG6ZrIlklzY9Rmye5+zOT006d0IFZzwnqCQRc5LOZui5sTBOcB66P0eWtelIR26MA0zVG0q4xxENyRQOF+rOveX/95NjP1y+f64JSl0ND/LGqp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EDKbmxrZ; arc=fail smtp.client-ip=40.93.195.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EDKbmxrZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huV3Ohgb0PWD4aobvIrKz19v8wblYpFPVsbkfkSU8PCApY9K5X99CtX5aDttNJ9CL0ZmPefwISBWIdcX5TCzXrg3cSaOT/CC6ykwwLKFg+Kraf4mtLoGHRXjKIOOWQxroLWxze3445uLBThznzj26NUkr9DzrOHwm/v9J5ZC1M+D1RsABTsSpnF+4+IEYKYzJgNvDvDnJIMpVvtzuhBvmgjmwXcu/rdlLPB4CRRKOJqYDdfmQBvFNp5FIBA/TjKlqhbOD1FjbT20xQq3scDkNLGRSv2eoIkyIZAJOLUaylZ8CsP4cZOW7/awaVbPya1S9aHlT1IXDLRO3XoYQ3RNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dCsmKnpItLcqRc2vFhig5BH2C0nC+gTOUqabcbuhyU=;
 b=SZPYEfRcSNcTjPFh7EpIdJB4WLC3v+Qzsa2iq3MTgcsMYPHSsSXWKXpGMHuwB2PcvsmqtZhraKnluHTlyK8ja4HUvAD0BZati4Lu8ZWKE8rYQ7YYzmizX8f7mWjZbf7fuh/v+NnyGrU8P+4vtM+LKUcGyEnWdhRcWAJsLz5k1l9Q5QVcR/GHP+qeVGOjE/XP9Np4x3cUFqMMUnvvTC5uvoFKfHoT7+AwUpK0gwG7nT4JeVbPSyWOLQm1l4sLRgvVrxnCBHAQ6ZzNC60t8jrX8Z7s+SyhfHvo34Y4S2ENT1rVtzjkmsK96F2dhva9wSZWwf6BgaVjLo83HMDyZqtbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dCsmKnpItLcqRc2vFhig5BH2C0nC+gTOUqabcbuhyU=;
 b=EDKbmxrZwQT+bFAxzTamowVEzg0DHBMUG6Cr/KOIe4v71TTXHQpYl3QewkqamIjbF/V3+EinrmxH04Qg79fLwfBtHGj7B2kMGqxe+j708CCsl9B+bVd7UEtuwNPefHm8Z5WgJoSJwuhZJSZCUieQHdKsyfQrFuIYXnmENnmzvd8NMVNH1t4KIKNtNzygcxk9PuiSFnmBPM68TXf3byAp4+JxmRryevagum8deLF9FMpq9Tf2NCREchoK7XGotHLbjDzVLRp2X5GFu44xQ7mt4N2MJ8mRvNYps5AyqhRB8B5qUBufNWCg0KtKn7TkzYHUSmYiifi1YFHLnxeAW+F+/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 13:54:39 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 13:54:39 +0000
Message-ID: <e2995078-d30d-4a4d-aee4-55cfb4a24537@nvidia.com>
Date: Mon, 9 Mar 2026 13:54:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: tegra: Add Tegra238 sound card support
To: "Sheetal ." <sheetal@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sameer Pujar <spujar@nvidia.com>, Mohan kumar <mkumard@nvidia.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303100249.3214529-1-sheetal@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260303100249.3214529-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 96249e40-7376-4563-c745-08de7de36836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	Efk7CqOjTbnt7g8HcsPc8G95sDRyBHZ1hK+JaneL+nVXHx8Qd6Mv4spcvwDryhNkmyt5XpziEZPmIDjuRkEBp6W7/3RjtYiIIBhOFQh5z95PymrTIvA1rR9HZcf9fn1hAtn8MdD8fCzJr6OVmzODmQI1U8toyZPwnrW5zWf+9DKI9QeOKS3BeRuVQojy3+qBjMDt6miG9K2llp5vtnBObUBqBpTMo/xJu+CHRf7dt3kmyxZE7hTGPEl4Pgr5WvFCS6ZM6eppkRGz79II8XZwp3HTuoefWvB+26lHN0/9Kg/A+5n263fB2HDq68+cxMLo9Sl4W536XGYpaR3LrqQE2BQGHVW31FwJIneNMR1KWADl5JiWdNiTL7SFgERnuMrymrHyOVzQDQrsZb7cQjdTpXAYYmHJMyvdZIemEMUGIsUpUVbmJgh1eS81UwNB9BT5TkbY0J1vx83+UTYbmN1Uk63kGmTagzzO/1m6daVgfX7a4TWvJHUZiUoO97IoEwV0WOLKsBAH00CYroJ6BXX3h/CLoq3KBHwnCcgbZxbEwHb/q1cUPLSooSTBGX3Mwpd/Fbo9Y+F9KX4o2ayNqGjgPHUR9xuHUmiDzdW7qqY6ASclAqVhkpUzjfFgXCL0ynUkVptiDcpn6Fr9MY7xW0DU809fl+pY1yUnvRn6QEYX7yP7OIdnpc7/qYk46HSF1uWA/llZeTX9SR5Bm89UqviMdqnZLKU40IXPf2t1D/Kbnzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3BzOGZKS0pOUUgwUXpNRGEzM3ZmWk9IQ2E2ZGIzK2RQaFNia1N4SVMyWGJR?=
 =?utf-8?B?VFpTYVZmdkNlSDAxdE10cE5LMDJ5NXdDOEVlN1lzYXJ0K2I5U3g5WWtEUGIy?=
 =?utf-8?B?M3ZIY0FYZHlpQ0t5R3R5SWNRcFlZazlsTE5abll1RW5GOW9yMGtpcVVtWU5h?=
 =?utf-8?B?cWVPcksrNzUzZmg2UHJxRU1LODNSU0RHVmxHTHVWZUZjajZndVVxMU5wZFJK?=
 =?utf-8?B?V3pYSTErSmRRWFpoNHpyenM5MjhCYU5jNk9Ka3NwZTFxRVc4cXo3dVJYOGR3?=
 =?utf-8?B?TzB1eTliWk1KaG9ZMUZyVDUyQWpwOW1RRDBZdUp3M25odzNCSEdhMGFpZDY0?=
 =?utf-8?B?WEhLM2sxVXR6bFZuRWliRDl2VkVzblhYeVhxVFZLQmF5SDNsRkoxdjVHbjh6?=
 =?utf-8?B?Wi92WUF1N3RiMDVWa2hwMU8xU1VtdmtFVG0wU2pXWkx3S2U4K2UydmtuMXdi?=
 =?utf-8?B?cU94YVRHKzZBVVZXZldycUpoakRRajVhdlF2SXhoVHNRRUl6VkJXTkE4eUpv?=
 =?utf-8?B?OE9OeTFLRkE4dlVSZThBbUt5YmFEUzNCVEo5TUcwQzc4eit4SUpxU3hCSENi?=
 =?utf-8?B?QWUvdkh2YUQ2Qm05dFRoa1hXYnFmRXFJWW5TenZJK2Q1VDd3NXh4TTBXMVpD?=
 =?utf-8?B?bGZNWDBnMmVlSm5YaHArMjR6aHcwNHIvOHNIR1dHMmtVZnlTZnJXTnFRR0JZ?=
 =?utf-8?B?bEJob3AvdWVhbTBsNlN1Y3pxK2RCeGxCYmZRZnVPNCttMzZmaHV5MTJTQTVQ?=
 =?utf-8?B?aFRxRDdsTkdva0V6eFoyQ3JGWnpoZ1V4QVlBZVN5dUpoY1cwZ2cvY1BTK0h4?=
 =?utf-8?B?RWEwa2E3N2VTZXlEMDdOdTlvMjlkNmxwUlV4K2lLTnFpMGJMbTVrem42UUl4?=
 =?utf-8?B?ZzI1Ym1YR3dwTmR1Wi94cWs5Y0Vnd0Y0eUlzWXFnY0NXRERrTDRJcjBHS1Fs?=
 =?utf-8?B?Q1VzWFl4cWNVSGtFQ3FYcTh4cG5YS2huOXdiTzNLeTE2NWNyZkttSVNGQ0t0?=
 =?utf-8?B?UHQ1Qjl2RTI2b1RqRzAwUnBFSHdVTzBEaHFMbmZhT0E2SjdYWUFnMjZINTU3?=
 =?utf-8?B?Nkx4NkRiSEpUUVdDQ2RjdTM5NWo5aFJRbVRGRXZGRC85Ujg4cFg4MjlZRS9G?=
 =?utf-8?B?bkg0RnNMMDhvdEZkdWQyN080SjdsLzdCamgzV2E4TFN3VmxrUGJmdllQSUNm?=
 =?utf-8?B?OFIyUm5EcXo2dG1tWTc3TGczaW1xbFlyUzRBNk9yY3M3ZmloNWJvRHVjYWZ6?=
 =?utf-8?B?K1R5d0Q4OFRwbjBUVldoVmdhQm9oN1NzbGhBSnFHc1pQeHAxOTA0RXdXN2ZD?=
 =?utf-8?B?Q1BUcjVFZUhIMFRqVXhqM21pUGlkd3o1S3g0TGxDV2x1b1dOWVIvY2M2a0ky?=
 =?utf-8?B?RHZjTktZdUoraE1Rb0dsQkh0MmJVc3Fmd056Q2VLV1cyalRUZ0lCa1RoSThH?=
 =?utf-8?B?R285L1c3c3F2ZGlVYkdSRDg1S2IxWitzTjA0VnMrUWxOQjdZRlQwck5jRVJD?=
 =?utf-8?B?ODZSbjI2WFYzeEZDTFZiTXZIVHBWbnFrSTVaRE40SFYxMHVUZDB6V0ZpWGRM?=
 =?utf-8?B?L3BtY2kzVWtZakZsUGszU0FWS0N2Q000VzA1bDhiV01pdUNMRmxycUlibXRs?=
 =?utf-8?B?R28yVDI4YXFxa09CVjZRVzZMTUVCSHNWSzJLV2c0d3NJVnpOQkliR01rR0dB?=
 =?utf-8?B?QjdSQ0FrbWZtNDZXaEMzNnlJRUpFS2J6Mjgxa1J4NXNMR1gvS0h1ZjQ2ZlU4?=
 =?utf-8?B?dEpHVXdJMGkzUVc1c3FtdVdOOGtYN3VBNGdrN2l1aHdLSGtiejNqTkpwQzVF?=
 =?utf-8?B?akpNNHk2YWVUMHFMaXZCLzY5d3Z2ZlYydW5Kc1ViT2MrNnRtTmkwSkVCMzN4?=
 =?utf-8?B?WmY2VE0wbzBlb0RiWXBCYUpvc0RjYmw4dG43eWpXQ1laMTdLTk9qWmlwOUZp?=
 =?utf-8?B?N0FEMmlQbklSZGJOUFA5dTBjbjhUcjNqOVhJTGtYZDN5K1ZNZG5CTUxhWFlL?=
 =?utf-8?B?SmJYdS9STWRKcy9aQTBMbEJUMTlkM2Q4RElWWGh4SWN0RWtPR2l4cXFnMVI0?=
 =?utf-8?B?dk1jUFAyQzFhS1Zib1ZoZUJpRkZIdU9VejJjcGpLWFBMcjhTQ21DWWpaeTh5?=
 =?utf-8?B?eUhabDZXMmsvZGM3MlRvbitNOUo5SDA1Y0NhSjM4YnN2RkNVZGM3OGJvZHNF?=
 =?utf-8?B?QWlQeWFGaU5zdHdDOGNyVU1yWnVHZy9MckI3b1V1NVYxbTBQT01VWWhUUUti?=
 =?utf-8?B?L2hWd1ZCME5taHZGOWlhN1Q4U1dUelFuQ3ZSODE4Yzg5SlNhTnFEM1dXbEFB?=
 =?utf-8?B?eGM3c2xNRWdZWHFYUDgySHJ0dmpjOEdTVnkzSy9pTUtpUjY2MGhxalRNdHNm?=
 =?utf-8?Q?EjS9xLkc/ryBBFSivgo1f0Y100n4fmkVGjYy5z/XnHE2E?=
X-MS-Exchange-AntiSpam-MessageData-1: gENFooifaqOkFA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96249e40-7376-4563-c745-08de7de36836
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:54:39.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rm0rjAh0JjvaNT2XAtHGW8grdaECF2PCwhJV4hYaUbB8dZ/f22LI1FyDOop6Y1vDwU6F8hGFewWGMbM1Sx7HOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425


On 03/03/2026 10:02, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> Add Tegra238 sound card support in the Tegra audio graph card driver,
> as Tegra238 requires different PLLA and PLLA_OUT0 clock rates compared
> to other Tegra platforms.
> 
> Changes in v2:
> - Drop SPDX-FileCopyrightText year update from patch 2/2
> 
> Sheetal (2):
>    ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
>    ASoC: tegra: Add support for Tegra238 soundcard
> 
>   .../sound/nvidia,tegra-audio-graph-card.yaml        |  1 +
>   sound/soc/tegra/tegra_audio_graph_card.c            | 11 ++++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

