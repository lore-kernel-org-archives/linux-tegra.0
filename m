Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF1370D43;
	Tue,  3 Mar 2026 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555932; cv=fail; b=ZQ5gndirw7HF8aFyi4x04/4moI5wADVoJcU0QcsWFHuejNNLBTZgv/HC3/cCpKB4CE5n7ft2h7VuvuCgNpCwpsiZoxlnEX6PTmEnvIIyCqLwXWhxFG3eban3R2tmYnoias/SUKIqqcleCKMiZYOCmDMU2avPdjZ9oMi1BOBeUoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555932; c=relaxed/simple;
	bh=yibIWPGQKE6a4kzkDNpV/SezOZUWv4TDppU+0VRL20o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hZqUZ/BIzRTISFic+r1HNztheAYATmyt33RJ/PgJtBqKJFi0lmCj7tZdYtd0Us9LfkyKpIN4Qa73MRQgxom6mZp5PRwK2v/tiR0K5NQqMzpYCIbPF8bBwjo0xrr/x7uKOyeht07BG/SqCk90DXLbyZ97s0VXY5UqmAuUrxLP43g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OsbBRLFo; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OsbBRLFo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHJIj2CN7e95bSx7MZgNvm7vKb5xyW3xDfUqou6tEhf4wueJNCGtq26w/hlR3R+EurTFCLa2Ae20ZM0Q75n2YY/KhGOJYknpLYPSIKdhicpXpUxFrZXPLaSzr6FwvqCF4F6T8Jlasa8bfD8+Bc9ajvOZI51ibVcrfPlaF9VH75j7YimHZhkWy8HUTzvx+44mkoI3Km4RJuLnV2tiM3Z0WIbjBo/BVeQHVcKa8EpMnuaySGNkhwVDia2BpenT8ZeXi3cMHzjQLzlkJUL+rliiTZhstqO7CLT6llCDEeFGnPWJzoRc/6UR8UVqVBFHDVn4o87HmqIJtaJEMFME9M9Q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeeCvG6ulCfy1RGoV7+r0wk99bLiK+NxvuH5XkadKuM=;
 b=YpJvQk/usVXvQzP/lcF+1eGrV+vxtkNiJ/Hr5CE25+CW5HrO1ORO6++paKrTvfpzU2iHDuSnGmClb3QUBNoeizMJ1cJY5xcPDmOf4HPj5I3U7oB0BdJZVZhACu5oCWDy4zn6EZuZ4oXqqNUbqcSN43STYJa9fZZBsnh0UQSGlYvnCspucnmHcOPDZbstRaRCijp6JgRF/aBSizo2WxSjvyGTLre0RYRF0PAv6WJQMylmoo4XB+em8neQbjPqZZbUyBr+XkPYnn9JG47XlnckBVhtWLNpout5tyMXreZLDckWUJ663XrB4pRP4ZnG4Ud7T6aVl5/GVH1ULCmYUdhOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeeCvG6ulCfy1RGoV7+r0wk99bLiK+NxvuH5XkadKuM=;
 b=OsbBRLFo92OZX1uhnyyoByDXcVnVUGgQgq+lJUD+E2PUk++2wkdsOABrklaw8QaugZDshe0E1vL3kLdawGGg923klOX4YeD8Kkqjx4HglcbrRyporGWibx806wLe+E35wQdsb5fftN23kBhahK1mZwiGY54ne0RlyoK6rehENS3QJWL9YN5vAtnSCQEY3skgMoPi6boYRTBRg8RRAA2Yd00zhaijTfTciupOoqPifwRg7n4ZrQckeLstiRrGpVszBgr/kMWFyViubQjhHd+8OEKLyQxc6NVcRZBaLVWxHTtbPgbDbt+fMHujU3MyTBWE/LCBqHJlvzFTFZUqc+43qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:38:46 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 16:38:45 +0000
Message-ID: <c285f424-fab6-4dd3-aae0-f9c60e572683@nvidia.com>
Date: Tue, 3 Mar 2026 16:38:39 +0000
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
 <92292069-a60d-4ea8-9c3a-182a5c0cd267@nvidia.com>
 <38e38531-ad06-4971-b750-e77a3268b97a@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <38e38531-ad06-4971-b750-e77a3268b97a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0098.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db83166-be2a-495d-087b-08de79435625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	naqu2KY9NPMAMD8Y8esIWKahrrfG5Kj71b4KCifogV+uhuq4RnpaIjlgF+TVHF/3rqTvkpBlXZK/uNOeleelqojf/6pVUtf/q8tj8QGTSA1IE47VLRGq/H8TLW0MkVrBX0MgAsbs+bbbaE9o665/rmpYFSwrEpJYyAuEV4oPXMutE0YvRJwnOip+ytd/6LiMj1ooyoPEPyqupEX4nT3OkJpXvlWq/rKz4gE/eiCUGI6JGKRDW1ba0gcKUPjOzNDoDGhmycrpHviy2BZPlmnfB1vayfM2Yn4t8CfrQyiSBf+2yplTtNY0A5mI26gEsZdX6pzK/b+9nCObKXWJ1jNK5+Hgn+ldsv1Jhl/nwsAwoHKWModiIYenGzCTysYSZf/JLMtNSmDATG0UiLjEmtD0g/GNpBsII4SC9K7E/gzGRHVQAmZN3ZkKN2nBprYHBFjHLLnwuXwxRrnro4qQKPN4FrBn219GYdCePAwVKzKcnds/TfR1+/PjHKUT3G811hXJdL/pPzFmrwv/vkPh8WbBGzBz4EEnaIuEOW7JfdFpsbS2/dzOXpeEKQ/laniecvnRhpAwqu0nZHhCLPMhVMKEBXE772+DWS/gKVd/qwT6Gw7WKdT79aM4mOupc6wLcxCZV+ADlWIk4fPbCwuEJazVS8gx7/CjSK/pjaDyi03vq8MDd4FweVehCPkuoNWpGL7rIR/6AjPDb0zSEwyjmDUHGrLWI6JG0I7JB9doF5TWfqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFIwclFpYmFCRE1JK1VZRW9nSVQzTGIzbUVxeGJYa1ltMytUT1Uwa1J5ai9M?=
 =?utf-8?B?V1pQb2FYUWxSNGNkU1VlS1RxaWR5OUE3L0czZlBmRUhrNXdhQmZWdVpjVVN2?=
 =?utf-8?B?ZzlGVGI3UzdYbHQxajZhdHFFWk9BRGQ2dzYxcGVrcm1xM1FwVUFtMmd6MEVj?=
 =?utf-8?B?TWRHbmIyQXVwQmFQK2dnUXhDd054RHhiMzJGWGJ6Z3JHdi9tK1JZR3crSjhH?=
 =?utf-8?B?VVBMUUV5WFk5VS9CdWR5cWwrb2tRNThsS2JaWmdOWlc5YXNnSHN2c2hRV0FQ?=
 =?utf-8?B?d29lM1Z1dC9PVVhLaTRJK2gzUDM0dVdUbmRiNEdpZTYreEM0S0REZkFhY3ow?=
 =?utf-8?B?YWtMazRMV0ZsK0NiQUN2SUVjOHcxOU9rRFl1V1JuUHRrRm1EV0wzZ0hQMnUv?=
 =?utf-8?B?TzZ3RE4wQnFRR1Qyd3pmdE5sZHh1b0FyOGx1aUxSQnA3aUpLSGZrejQ5dHlX?=
 =?utf-8?B?bTR4VURzQmdOQlJmMFM5eEtpc01Qa3p0ZEplN1ZHTXNvdFNDWjJMY2hMaDdR?=
 =?utf-8?B?TXlMS3VSajBlVlhZUSszNDJGd2szbHF3bUVjQmlPRGxQbW1DaGhxSkN6WlNa?=
 =?utf-8?B?T29TRjBtaXdyTGNYYUJTWVVMUVVYV0lraUdYemdMYW1qUmt1aXJtaC9ub2hj?=
 =?utf-8?B?RWRaWGo4QjNFdHgrTmE5amhNektYeWppUWFFS2ZqdjFxUEtkbUd0YVgvZTFJ?=
 =?utf-8?B?eEN6MVhYL2dnSWIwb0l6a3ZUYmIzSStNcGI2YlNVWHhGQnZ3cmJvL0RHaDdL?=
 =?utf-8?B?NkVPNG9TVE00b0p1R3BzVzVLb2kzSXVzNmQ1cy9uNzMrR0VCTS80TmRYbGVT?=
 =?utf-8?B?VDBOZ0JiUjhDQzQ5b3hhS29YekZNelBnQWNZMm50Q1hhVmdRZVY1MldBUlRl?=
 =?utf-8?B?cXVFRlFnZHpkaFJVaU5UL2lmSUZwUkRMZUoxeFFUYy9jUWkxWmVKQVlwQ0ZF?=
 =?utf-8?B?UE5JQWV6RC9KRksydlBwL0RFVXUwSVpqSTNVL0N4M2QvUW54cXlpV3BjQTFy?=
 =?utf-8?B?QjFiYm5keW1qZ0ZFSlVIUDJtVG5GdmxBSG81bkNWMFNlZlJYaElXTE1ReUNY?=
 =?utf-8?B?OTBKRmpuT3hBV3FtYm93UjlMRS9wSUZDMnlRbXhxK3ZKbzd4cUljZDNEbjRM?=
 =?utf-8?B?ZVBndHJDMEYxTHZzMk0wc2NpWTdZRVJoeWsyMDlTK0h5OWtyVHV0SVFjeXVX?=
 =?utf-8?B?MTFGNU9JWUh1UlRlMjZDRzM4eWJ0QTlQMlM0eXZZTjVodGQ0NHJ2Unk4czVM?=
 =?utf-8?B?T0w1L3NLVmhpSERjTUJId3lScEh5NE5lM2VBbHJFOVFNOVRqSldUTlJWdEsz?=
 =?utf-8?B?bnZubzkvMnpYWWVQS2t1dnlURTRRSFRUN3F2TlBka3l6b2pCSXZ3MzVkZFYx?=
 =?utf-8?B?elVBbjFwa2gvdmk4bEVjb0oyU1h3SEt1ZnA0NEVzN2hmNUlQQjFoMi9HanlC?=
 =?utf-8?B?bnVaSHhaTGsyUVRrK3M1WnZQaWJ3S2NxMy9qTHBrWHJlQWtNL2tWUjZ0cDZo?=
 =?utf-8?B?QStvcjYzWDZXc3B5NTlCVkJ6REk0Z25ZdjVWaCt1RmRTK3pOTWNvSEV0WjRl?=
 =?utf-8?B?eXZmcTlWUjJkS2toRFdCMTNOR0EyWXg5NEtkY3pHVHZKbTVJT01la3JVR2E3?=
 =?utf-8?B?UCsyOWF1aXRQR1g5TmJmN2UvbjFZK3h1YjZXbEtnTGZRUi85c09CY3FCYWVn?=
 =?utf-8?B?bkUzaGtpY1JWNEQ0Y2NXS3QwMG55bk16WFQ5aXVxc1pjVmFYTzVMZjVpR0Vn?=
 =?utf-8?B?aGlDQTB0OEwrdndVY2hMSyszaUZ6NUJBOVBRSEtTSG5YbW1IT0xIbVUwWEdj?=
 =?utf-8?B?ZGFoN0ZZQjZXVjMyZktXVXA2OVVXTXp2M0NjRUF4Z1hMQnBWUjhNT1hEOURL?=
 =?utf-8?B?WGFNbUFyNExPOXFiYXlwTEVNNjhySnI3Q2o5VTE3VXA0MnNhYkFCbnd1Slkv?=
 =?utf-8?B?eHFYbWQ0cVhYWUdpbW00RlRnNXN2OHRRMFhabmpmOFVCYlJCMFlmaExOS0dO?=
 =?utf-8?B?aG1oS3UrdE4vZUQvN3VtdEFZdXRTd2Y0d0FXdzQ0cndhY0hMZlRwdW1ZbHdM?=
 =?utf-8?B?aHU2SGRQUkFjeGwyRTNFSjNKdkIvQmdRTVRFOGYrQUpOV0xOTm1jZ2RncXoz?=
 =?utf-8?B?NDljMEIzajZIVEdyejJDbGRqc29vTm42bHp5cFJvT0dzVktiYjN0b1Z5dk1o?=
 =?utf-8?B?alh1Z3hxeTNITHJNL1RkS1NrcEdaOXBpeER6OW9leEtNU1YwMmtsbnA5VVdy?=
 =?utf-8?B?d2tQQ1hqei9HalBISnpvUmgwalAxaUpnOHoyc1pQSlg2S1RIZnRSNVovRzJG?=
 =?utf-8?B?RUVTd3FyVU4wek1SeXJJeGJjYzN0dGlkaXd1b0p0aUZXaVgrSy9GeWY3aGg0?=
 =?utf-8?Q?z0rw4UqDyN01LnMZV9Eato8jcQU9xWwbbXpUFzwQNpdH9?=
X-MS-Exchange-AntiSpam-MessageData-1: fB+aU8wkfc25Xg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db83166-be2a-495d-087b-08de79435625
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:38:44.9423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuN6ObN/GHuRF2+r8Tlx3K3vR9eoIw1j+gNw5G5C9VOWne7vQwEBvvaZXZ97jHIRijcvKy/E64C8Xb4v0fialg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143


On 03/03/2026 14:54, Krzysztof Kozlowski wrote:

...

>> Where exactly do you document it for reference?
> 
> paste SPDX-FileCopyrightText in lore

Got it!

>> I know that Rob previously indicated that the 'Copyright' string in the
>> above was redundant, but we have been told to keep this by the people at
>> NVIDIA that specify how we should be formatting such tags when adding
>> NVIDIA copyrights.
> 
> For the kernel, for most of us, most likely legally it is redundant and
> Rob was right, but some companies insist on it and I don't want to
> discuss with them, because they never use actual arguments except "my
> legal told me I must do", so you can have it. That's not a problem.

Before I had requested we change this everywhere but there was concern 
that we would have slightly different variants in different places. What 
I could ask if for the kernel we can just use ...

  SPDX-FileCopyrightText: <date> NVIDIA CORPORATION. All rights reserved.

Although I see some instances in the kernel with 'NVIDIA CORPORATION & 
AFFILIATES' and so they may want ...

  SPDX-FileCopyrightText: <date> NVIDIA CORPORATION & AFFILIATES. All
   rights reserved.

Anyway, would the above be acceptable?

Jon
-- 
nvpublic

