Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38DC35B13E;
	Tue, 18 Nov 2025 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475106; cv=fail; b=nLjLfFUF3yR8y24eTiLvYKgp1bLrpJ7Z8LCQwr7S7RHKX/ToIAF8n9tyMhrJcOuFYpjx4zBYeLsnrbFgSBzQxOMgm+Aa8QGL+ocQ7/qj0XRliFpXUkaMUQ4fKqH7NvZI3HvDnd/huw6lJfWpvfHEwuLmkfqJGzD6yHF7P4x/XgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475106; c=relaxed/simple;
	bh=gQfg1a3X8P9nnZvYl1w00A+b9FiCCm5jZcna3lEy6Hc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UaxAdmliE/YefLTiHsZ6kk9f9Lz7kaNdhPNgtFpBTEnr3kWXFHo9yi8fjx0milRZsOUlnXMULKcOnX2WnKJKODXdVC2uFwUqBmJRGPLtSTMRnWEmqfAI8PQHvXgzO8JlWCkRnzUnAGOB8/PeSV7qTiaTS+18xeE50RSDO1hMoBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eFTLPAWG; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eFTLPAWG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJ9xRpTGQrEC/W0+iFHh+PztwOo27t9t1nTgo86NGDdrX5poBxTZ3JDVomhDEmgSvUFtUMxBB0Pmvv6LVORi7oKjIjBuQBiNI+6OFsg1bHLiEceTkN+5+S1JxtFzLDi0lzqwF7t51g3gQFQ5HINqfaRxC2KeD3X2DLR8wif19YXjJEM3CQIwWKss7fPBG82yrfaMj67B7+knEQVMkQ0JkG6EokMYe2ZAa0VYoDADlZ6jk5uxcNCrRwwrWI3eTKCGBA3FPZEmYyVRdtGlZiEhOhn6JmiJF/I4XHBlGV9AruEyRA8Tly3o4XlJEmrKUUvACvTAtzNEnsTmpdhhScTspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DE9obvO62iLcwO99DB0PRZIoCyW8Gs/TB6g/ffR7dw=;
 b=LHmOhbltfe8rLLJ+O/JAFyDV4Bt1CbEYE+pgnw3wDuKFoNTPYpZn9RbDR68AQV7WebGMSvFW3yOU4n2CCoZEi2w8JVytZTIkJ4USv1F3hIhXznF5klUSRIJTGgyrt44vLST9m7VeTDhfxAWBuJy7QThPPOI2xTS7R0NfJTU3wMJKUg5BERwK7Or4F2KxnjVf+0D1CZz04XaztVdq0/i4+JHaYRSpf69+dhjpIHT4eX1eRd/kWnLgPS2Coym2+LEJitpC8x4FY5HEuMOrhZnM0X1ldgpaUiCJh9lsNyAooqz/bXnDOH6nwjDD/FQxevtdsj/35jxx2GIM3kRvAgomzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DE9obvO62iLcwO99DB0PRZIoCyW8Gs/TB6g/ffR7dw=;
 b=eFTLPAWGSb6b4jPtTkmtQvdTTeZ11j+bY9J99v+GfW9t7r1OGL5srB4fyUBMFblf6JwX4pR47Of8aMh0jEd3/9LG/KdiMg0aVhmkDchQEqcCzgAE9Sq4b6+s+scG3JuJ+hCdv2Uf7wq/srloiBXn/XsqVvrBEql+w2/NoWbJ+f/8VTP3Q7OFL4FyWm6XaBevAdLojqq/c7mQw4sQ//NLXFclYd/TBvoXiUQaNXYy/YCGnvac1DunCUWM5xnDFTqgf4HZ8xbY1XAw2Y2OOIoa5QrlFd9ihBGi6EIIDqLCvrUmtWY3ZvJ3QisNhy9uoqg80shtEEsVkhe+wXnu7LMGXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB999110.namprd12.prod.outlook.com (2603:10b6:806:4a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 14:11:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 14:11:42 +0000
Message-ID: <d7b5fa60-c6ec-45f2-8bc3-ba79dccf6c5d@nvidia.com>
Date: Tue, 18 Nov 2025 14:11:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: tegra: pmc: Update aotag as an optional
 aperture
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
References: <20251114161711.2655355-1-jonathanh@nvidia.com>
 <20251115-accurate-fair-salmon-64eca9@kuoka>
 <77b9e0cd-2597-4d52-a352-dd029ccb6a42@nvidia.com>
 <e39fcaeb-b516-41f1-89a4-fa3328c07deb@kernel.org>
 <9e88368b-2bcd-4f38-abcb-00b8ff6845ea@nvidia.com>
 <d10995d5-1e32-4d51-b748-e77e7f103a3a@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <d10995d5-1e32-4d51-b748-e77e7f103a3a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB999110:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d27ed04-28b8-405a-9122-08de26ac653e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDhJWHhCeWdtdEFMdStVUTJvSDBLUU01cHdDbXEvVmpaYmtwRDFkMXBrRlQ4?=
 =?utf-8?B?dUxsMjZ0dHQ5VC90dTBzWTBXMkw4RDVlWkxDVXRrVEl3MDExWTI2MGhRSnB3?=
 =?utf-8?B?OGI2b1E0dXExNHdsQVZCTDFEOTNHUFo2UVpwNUJkWVFmeld3WHNQWE1SNGx6?=
 =?utf-8?B?aDhhYXJEeXI0U3JtSVRxa05KRzRuWlZaM2tUWStnTTdmQ0d6M0s2ejFYQzJl?=
 =?utf-8?B?SnNZc1BtZWdtWkJ1bUVlWk1ueStFNndSUnVJUUpjaW5KZG5UNWo5K1YvVmJo?=
 =?utf-8?B?MzVBclE3ZkJjUUg4SmdiNytIempiWkdDZ2ZEY084U3d1Tlk1OUhTWjRwMVBp?=
 =?utf-8?B?eGgvdllQdWZDUnVCeDVtSmZuUGtmZlhOVlpVazlmdXpYdEF6Y2ZSaWhPV2xq?=
 =?utf-8?B?Nnpoakc5MTNZcjFhQ3FGSTJZQW14TEh1eDQwcVRCUnFzVUlFZmJWSDZ1ZTBr?=
 =?utf-8?B?c1Q5Qm94R3ZpZ1htUmdqOFJJNFloUEVramxPWlBDcXE1OXliVWhaeTBTZnhx?=
 =?utf-8?B?aSsyMEZ2Ti9QUUNVWmw2NWVIMWJ1S0xtRlkvb3I1c0lRcm5DaXpLQ0VOWUs5?=
 =?utf-8?B?NGxrdmxIdmp5R05tVFgraXU1NTVEdDdXQW1RVEU1c0ZrY1MrNjJ1RXVrZEdw?=
 =?utf-8?B?d0c2bHlEVkx0QXJRYlp5R01nS2Rsd3BZWlRCZVdta3Y3eGpMZXVVU0hPTXhI?=
 =?utf-8?B?c1FsUE1xQjVtR0xRWWJWVnBNZWtFQitzQlljNTE5T3paeExHbjg1NzdOMnY5?=
 =?utf-8?B?aGNVZG93UW8zc3p2eTFtVlpESnd4cm5xRk9BdXpCV2NRWS9LbWt4SHAwQm9q?=
 =?utf-8?B?RmluL2dCa0RJMnI1a2ZPdzV6T0ErazdPLzlXbHBYZUJiTnZWWUJpbTlkbnZ4?=
 =?utf-8?B?Ym5GWmFPT2V4TlorUDZodzB6TUxaSDhGSGxnMWxlUEdJRWtGQXlCcFgvVkdM?=
 =?utf-8?B?MGliaEdnQ21yZ1FheHFvdlZCV0IzWW1mN25rcndTUkxtaGJwSlRvc0VWMnZh?=
 =?utf-8?B?b3NHRkprMVZkQ0tOT0syd1p2QlhVYVN6cEVlLzFUc1JiWm4zMVRMeUNqSkdp?=
 =?utf-8?B?bXVGM2F6MTdvbUQ3dkc3NFlRZzFZbkQwM0lDTWxpc0ZHNW40MGF4a1k4L0JQ?=
 =?utf-8?B?a3Y2dW40eCtXVER1bG00Q2FwbHJyZTRVNkJtYmRxVmFqWlpJWk00MkpkV1NM?=
 =?utf-8?B?amprODRweWVpMXFWVWxla1EyVUFsK0syeWx5enJFTG1JNDBmMkxCZDdZR2Q0?=
 =?utf-8?B?SXpzenNVVEV1ZUdLVVRob01xaWVybnNGbVFWR1dGUlM1YS8rUnhRd3lZeGtw?=
 =?utf-8?B?ekYvYjg0cm44bzA3VENVQzN5TXpGRDJUWFdLZ3dJRkhmK2pwai9vMnUyc3p6?=
 =?utf-8?B?cmdMRTc4eGVDLzlWUlgxMEIyeDhvUHA1YzkvNnhsWUVZd2psVzBJdGFYOTda?=
 =?utf-8?B?Z2xlanYyT3lLSk9RYWJoVmYzYktpUnBwMlNvb1ozRVpLUUNwbXo5NmdsVWZG?=
 =?utf-8?B?VnAvSjJkS0wyWU93NnI5NEVZaTdpejdsZStIWWRIUXU1czJFWGlFK2RDSjF1?=
 =?utf-8?B?OWE0Y1VDU3pjdXhxOHRKUmR0N2w4Ykh6ZUdidXFRSlFPZWg4YkFTTUdJcHNE?=
 =?utf-8?B?Q3Z2UnZNNS8zSS9PcjVEL1Vwb3U4RHRhSm42ZjYvUnAweHhzaG93ejkvQUpB?=
 =?utf-8?B?aGZDZEJ5RjZsUFlkdGlqeDIvUTl0OWJXeTFHN3I1M2cvNjk1M0k0UUNLenJl?=
 =?utf-8?B?aENpMWlBRE9IRS9VdzZVTmN4WmZEVFZqTFg5SU9VK3dwRnBnWWZTVTBYU1Q0?=
 =?utf-8?B?MEJEOGY0RTUzNVFneGd3SVY5S2gxaitNdml3UkMySHpzMVZWaVdZOHlVYW5r?=
 =?utf-8?B?dXV2SmlVdGl3a1RsaGMwYXhsb3o4R2dWallWS3hoTVFhdWFFbW1QL2d5eUFx?=
 =?utf-8?Q?5TG+YREQrFk7TMvsRFuuXMfeM/Yg+qHd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk1qeHRkVWdkTDZtaHJucUdjTkswS0tERHJSNkp1Q1BRZlhpRDV0MmxhRHRt?=
 =?utf-8?B?Z25mRCtZMDNCUlZCRVhweTVBRjNaVUxsenZQeEVvUnFBSmlnQ1ZJYy9qSDd2?=
 =?utf-8?B?clhsTENmTXFKaEllcWtQRHlBN1VYN1lMTENsQnVqY1hJV2I1RHYrWWMvUVQv?=
 =?utf-8?B?amVtRXR4OS9ZZzZJcW0xK0JETTBLZTBTNTd2ckt0elFQdzBZWmt5V0FpOGUv?=
 =?utf-8?B?dzdVNlRkMk44RTBUcGV4eHNETjR6UzVpZGdPSEo0M1JBMzcwb0FtYi9nanBN?=
 =?utf-8?B?L3lVS2llakJPWk1JeHVQbUpmNzNZUE9QTUhNeTJ2WnNZUmJubGRiWE5CSVZG?=
 =?utf-8?B?RXZCTVlGTUVFNGlYR3VQYXA3Ui8vZWJtajYwVlRlM3ExdW92enV0dDZUb0o3?=
 =?utf-8?B?dFdBT0wyOWFXUWt3TFdIYXRrc3dOTFdoY0YyWUhmc21aeFBWYm8vLzFEM1pi?=
 =?utf-8?B?L3k4Z3NwZUhFMytiV0JSTGRlQ0psVzFKdXFxVFpFNzdvRHg4R3R4ck16c1J5?=
 =?utf-8?B?YmxNL0hHcDF2QjYwV3RzRm41ckZnRzUraG5mZGlmdG4xeGgrQ3FTRVJzWTVs?=
 =?utf-8?B?ZXNjM05MZkswU0Nzblo2eU0wc3pNMy9IM3lBbUpxeW1nZlRUa3VaVU5UcU1Y?=
 =?utf-8?B?Ry8zZTdjYWJZYUhTRGJ0U0VWbmtQOVY0QVF3clNCSTdRVmRkNlM0TWkxWndl?=
 =?utf-8?B?TmxJdFR1RkJJeUtvTzJPY0xEeGFaUEtKZEdPUis0TDJGUHloUTdOS3VXdUMz?=
 =?utf-8?B?TDRxckx0WWNxVGZVY2JUR3ZOTUtMaVI2NU04RFEzMjNkTFlRMkV5UHFrd0JV?=
 =?utf-8?B?TjBKOVdJQ25ncGV3VzVScE9wdHFwTEM1NlY5c2VyQks3MkJiNTkvT21WUzRV?=
 =?utf-8?B?cHJRYTdEWkd4L3FWYld5YkE3QldGN0pvR3ludGxWbCtWT1B6cDAyMU4wQWZT?=
 =?utf-8?B?aEJwczgzUDRBU3JYMzQ1TmNOT09KNVJKN2NuUXBhaWdhN2Q4MUJ5RWxJc2Nt?=
 =?utf-8?B?aVJqSjBRRkJmNG9PZFFwWWp2MFB3NjhCR2tHb3RLc2lGS0ZtVnFFclFPeW9M?=
 =?utf-8?B?UUc5ME9aeXdZTDlxTHhuM3p6ZlFRZkMxQ2xOeWwxQndYVU9EeHM1NmU0MWpE?=
 =?utf-8?B?Y0J2YURSQU40eE9yNjRvTHFHWEZ4N3JOekx6L3ZIRy9KRm1Hb21yV0FvSkVs?=
 =?utf-8?B?MjluMUdCL1NxRDVKbjhuRlV3S2ZnamlvVW1UZ2Q5V2w3UndwSGg1Z0pVR3Fy?=
 =?utf-8?B?eDhqNkI0anV3MDV5U010T2pPbkt4SEM0dWVvdHdOaHJScnVwVU15VDJFM2NL?=
 =?utf-8?B?TkZCZzJMVjBVRWhCYm93dGF1OVRqWGJyNFdtaWVZQUVmSkdFdGtsdHl2ZGpO?=
 =?utf-8?B?YXV3K2NISEg1bVhHVnBVVGZFeUw0R3prM0kwM2hONXRJSzBFNUpQRXltWUNY?=
 =?utf-8?B?L0ZFa1lITTlyYVJyQjdhSkZwck4vd3UzL1ovaGljcWVHT1B0YXhqdHhQZlVZ?=
 =?utf-8?B?dytsRyttOWVBeHhybTFrZGpScm5wUW4rdFZvSk4wRmUvS1ZCMHIySFhrZkJz?=
 =?utf-8?B?bEcrc2dSQ0RmRWU4Q1NQckphRDZRV3c4UzlQdDl4R093NmtzeE5SYVpyV2Uv?=
 =?utf-8?B?TWpuSG8zTVR0YlFyK3IzRHlKWEVpZXREOEs4dWFDeXp5VTlhZE5jUnJPakdJ?=
 =?utf-8?B?VnN2dUx5UE1HWjdOYXJQZy9YSVVjZUpMcXFkSm9PVzNiM3ZiaTBOdTBMb0h4?=
 =?utf-8?B?TmNnbkY4L2Z0Q3JvYWN4S2M0RjRmaXVBa2FxZDZHekt6SDFNRHQ2dEc2aDB4?=
 =?utf-8?B?S0FaeHdBSmpUalA2TVA1ZEhZVktUZWMrM3hETXFXNno0SjV2UlpTYnNrSUtx?=
 =?utf-8?B?ckU1dUsrcW15QXhVUG9pb29hL1NaUGtZWkpJLzl5NUNNcURtaGlGN1ZLN3ox?=
 =?utf-8?B?dzNWRHk5SFB2enlnOWFXdnBaT1dVZmVWZTBWb1NqYVYza2d1SkdsMHY5L3h1?=
 =?utf-8?B?UlMvcGYzQjNuTzgvMjRCY012WWZyRlhhQ003RFkxaFo0NHJpS2M3TWNLaVhU?=
 =?utf-8?B?NTNMWDN5MGhYRXl6dmxOMjdZMDRWQkVjNFFEQ2JKd3JiY3VJOWd4MzVxN2Nh?=
 =?utf-8?Q?CyfsYG9xwhddi1iVVYqiAqFxR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d27ed04-28b8-405a-9122-08de26ac653e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:11:41.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN2o/+uFzlmudoA2V2JltK5VqzUGYJerXpc9adcXGGOhkRL3EE6mU4J4D+0FJkwZqix+DUE8hWPdF8GcAa8NOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999110


On 18/11/2025 13:08, Krzysztof Kozlowski wrote:
> On 18/11/2025 12:11, Jon Hunter wrote:
>>        then:
>>          properties:
>>            reg-names:
>> @@ -184,7 +187,7 @@ examples:
>>                  <0x0c370000 0x10000>,
>>                  <0x0c380000 0x10000>,
>>                  <0x0c390000 0x10000>;
>> -        reg-names = "pmc", "wake", "aotag", "scratch";
>> +        reg-names = "pmc", "wake", "scratch", "scratch";
>>            nvidia,invert-interrupt;
>>    
>>            sdmmc1_3v3: sdmmc1-3v3 {
>>
>>
>> The above did not trigger any errors even though I introduced
>> an error in the example. Anything I am missing?
> 
> You are right - dtschema does not work here. That's a bug, because it
> should and we already rely on that for many other bindings. You can add
> "uniqueItems: true" as workaround, but we should fix it in dtschema, so
> you can go with my approach anyway.

Thanks. Looks like I can't add 'uniqueItems' to reg-names ...

Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml: properties:reg-names: Additional properties are not allowed ('uniqueItems' was unexpected)
     	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

Would it be OK to go with your proposal for now without
the uniqueItems?

Thanks
Jon

-- 
nvpublic

