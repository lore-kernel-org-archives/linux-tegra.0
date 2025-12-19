Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB02BEC2A;
	Fri, 19 Dec 2025 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142354; cv=fail; b=b4Zxw2Slygpvsy0F5YUwROmfl2OuqcF+QHodj7zkPj6w2ddGHYkXnpC3/8BuIO7dpjkegR/Fxmyr2XrY480PnVi5o3QeZcLPsh+xJoob/8d/htuwkQ+sVFz8znnmzYWNXfVGFOfNPWNvGogUYyOov27LU8aiR9oB3l88L6uEDgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142354; c=relaxed/simple;
	bh=FXGoVa0SLFbpwufmGBao5OwNJ4XsDLTtbq82qNa/P0U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h9lEVDD5IOFbnb+XaMbUVO9NHYICfAtN11IrFFFYqRDxUOPNutCqp27Q55NSyxl4nSRolu+AsjX2RFuyW+ENioFnfFQD27fxn9FIVQZZA6nTHjqnN5H0jRUstkDnAcMgdMMk4nEMVJB3ox8BDvdi+vQ2FAWOThJrmMQU/LaqF2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Des/Q1Le; arc=fail smtp.client-ip=52.101.61.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Des/Q1Le"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjJjrOtL9nSFLGC/3N+9jyJbeoQEQhivBUkjv7K2luzNw0PFFts8UJ/Uxfxk4NTkITRtSjMchuYhFErGZPwvUvSYmLtnImaLFVoEeNR5KOmGXGtVSBNe+ABu/ihNvfK5vY3tPYlunOHZyZCcqZb2GnS2N+Ev5obEUQFHlUbu4sKmbwPpKTOxV7jU7/SIxG/9vS6fgk+Pu5iZm3y+1b6Fm7aQBB8fPSVP4nX2VE+PbSHlrIRITUNtudELqsYee2rzblvAN1CNxn5X23Wlnb/+t0F4HkW2ZTP1DevQ0r09Bozn5zSoQCbN0iuAsFt/r3XsGSFMSWhejRf9l7laG2nuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OTz97QF7ogfomM+/tHGwWeTF1q3Dcm560O49/k5R0w=;
 b=vBELLbz88vVa8w+fosCJ7w8i/Kw7I1YqPyQ/B+1rlQeDJPXbJDQCzpEzUQtKCx5MN4Z2u7C9K80QCJx7G0haeOojhoLYJb27Wo+T5OI9XN/psRA3ev5fSXXLvNP+6TLk2uGVbvSWKMj2oN5yNi+hducoEpShEBsTHh9HmkK/qm9gt+CPMdE1nsFtHxhobOywJIw4O7PfH1o6aQ3fMDewH2EmdtsR851JSR2suGg9rTXlSy+sDYSs+0kPtD+KllTWuFhWCfuRmgM2etreR1P5H+d+rsU4rs9bPpB8JPa7BAUsDIcKUy/6L7U9xn2KL19hna8L17Y95pAaDM4ao66f8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OTz97QF7ogfomM+/tHGwWeTF1q3Dcm560O49/k5R0w=;
 b=Des/Q1LeR76kBiM5eCyKPJgFgcxkwX80llOrzULmX+jseejnmz7vsKn1n+TydZwVyy2PbUCD5r0rEJFJ28INpONBc+qZkE1JT3TMK6slefxKNeZHw9H+W94n36PaE/p4x30G0CDwxNUiJaJYFpYd7UseLGAVviKbr8n3ac7dqd2ok2JyoLtnpLbgdFtGXsrnp19qxhm9yYLh7r1DWldqv7/N/8OlW5upM+PgK/Iz/2SqOfN9YbZ2vDh9I9Mp6Ocg6nOcpE2YVMhU7enJ4GMTTKMnC67FPR1IJJBfkMlmGmjHFappf2kcbIGlbQCDrJbt+7Xr+QTrGQejUXBDGqBjAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY5PR12MB6551.namprd12.prod.outlook.com (2603:10b6:930:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 11:05:48 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 11:05:47 +0000
Message-ID: <c3a2767b-5f2e-4a9e-a700-713e542d9214@nvidia.com>
Date: Fri, 19 Dec 2025 11:05:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
 <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
 <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com>
 <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
 <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com>
 <45057c95-1dba-4302-94fa-f63941ee2b20@nvidia.com>
 <CALHNRZ8gJbyuD+0yFQwCJ+g7OcffjkXopRSJKoDnr5WMmUVGwQ@mail.gmail.com>
 <0c5eddc0-8b37-4199-a8b8-f235ac3aa476@nvidia.com>
 <CALHNRZ_zhZ3a7h8nSWkpGv6+unKn6DkSA9tKQ6cmb5TXjGcC9w@mail.gmail.com>
 <4900cf8f-9ec8-48d6-8187-126e111cd048@nvidia.com>
 <CALHNRZ_vZm7n-fZSVA1YzUPz0=znX_D6aBZ0nwUyjKdwcrO1=w@mail.gmail.com>
 <CALHNRZ-PGV9OcuB4aGsqw+aj5xUpRTEd4_+v7=j9=oMo9rk0oQ@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ-PGV9OcuB4aGsqw+aj5xUpRTEd4_+v7=j9=oMo9rk0oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0499.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY5PR12MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 9883e9bf-6fd8-4f48-4262-08de3eee903f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RndtMVlabDYzMzB2WGRkbVhjaytzUlVFM0NQU3B0TmtsOFU2alFIWm1wVnM2?=
 =?utf-8?B?dngwUzIvWDBTSzR3Tm1vYTZ0dFVlV0hJTzFXekJLaFpHQm8xc1Y0eGgzT01M?=
 =?utf-8?B?Z0JxWGcvMkJ1ZmpscUdyYVNScHJpeWszc2w1QUkzU09ObndGREVTQ1hkVE9t?=
 =?utf-8?B?alYyR0kyWGxvTm1xUjE2K2w0WmVjRXozNW81c00zTGs1bkE3UmdhN1k3V3g2?=
 =?utf-8?B?dE5wcnJYanFWQTNwZERCdlZLd3dYdFp3Vk1ZSFRoakE3WVIveEQ3UzNlaHl0?=
 =?utf-8?B?K2Q4dWk3ckdYR3V4ME54Q0sycVpPeTVGTDF2Q0JDQUtOcGlHaEpQUU1ad3RB?=
 =?utf-8?B?ZzFPSUhXNzlLR1FzVk1aUnNrby9uSzY0Q3ZoSnRUVkY0VGNXQ1JLTUVDYVlk?=
 =?utf-8?B?NEEvY2YweDA1d2p5K1lFb1RWOTJvTHU2THdEZTJMT1hpZXJBb3cvL1RuUVZv?=
 =?utf-8?B?Q3ErMEMyU2NJbnM0WEcrTnBPay83aXI0WnFaTlU0OGUvTVkvZG93RlFpNVRZ?=
 =?utf-8?B?cldRbUFKVjhCRXBwdXJtRlZmaWFJN3RKUVlsdXBrZXUrQk5ZVHlDVm9vcCta?=
 =?utf-8?B?V1lGQXJtcHNqYXRVamh2YzlrT1JKazNDRGxDYW8wWmxrL1RmV1RWSlBSWS9K?=
 =?utf-8?B?SWdOcWFjWjBrQmtMQ3YyVWVoS2JzRFplMEtHa0RkQUh0K3NlOWtQL0xUTGZW?=
 =?utf-8?B?VDVHbUhmeDYySzJ6dThKTGU1a1hBV1NJWWlGblFSV2dLR1lXWDFJOFJ3aVpr?=
 =?utf-8?B?Z04rcmFuTFFOekc5YzZTbGc5MlZENnprRUtrd1pqNEFldnVIUG43SDVNRXlY?=
 =?utf-8?B?elgzUktuVmp6Y3hRNVdXWVJpSWxodzVwSmN1RHNwZC9CUDdtVHZvNFp3dzRK?=
 =?utf-8?B?eTNRakxPVkp6bncvZk5ZWk11a2hnQThPQUgvc0RXK1c5SnFaV0lIWTlxeC9N?=
 =?utf-8?B?czdhckt6UnhSdThqTUhEWFYwR2FVYkZOR3BVNm1OYXpNeXlnd3p3NHZYKzlB?=
 =?utf-8?B?aE4zU01WREZjcCtNZmRtMFR2blg5c200c2tzcnZ2L2c0SE0wRVc4aEZqeU9W?=
 =?utf-8?B?a0huU1RNMVEzbm5mVzRuTHBRUkVFd3VzZ0M2Mlo4WGN0M2wvY3Fkbm4ycTZn?=
 =?utf-8?B?T0phczFVOGExb1VWN2YzZE8rZDF2WmppTFEwSmJHT00yUmFkOTdtV1A2eHV1?=
 =?utf-8?B?Rk4yYVNHKzhVSkY5SWRaYkkzY1VLenMrWERGeDgydXVjZU55WFNHZzk4Witx?=
 =?utf-8?B?NkNEdlhGdG5tUDRud1FISzV5d1R5U2Uzdkt5NUlhMDFBRkZNNEV1bWdkZjVG?=
 =?utf-8?B?c3lLc2ZZSlZOQko5bzlOWWdQM3E2bGZBcU94NjhTRERUaWFROWptdlJxSkdM?=
 =?utf-8?B?N21kbDBIeDVGZ0lYbHlCY01POXNiVS8yL2l1WUtYeExHZ0cxR01TSnI5cHh4?=
 =?utf-8?B?ZlJoQUZVeEJUTkRzOUc4Vm9RNkNKWjl3VmxjRWlMY1lsMkRBd3lCWGllbVVC?=
 =?utf-8?B?UEYyRXdhbU96WGVHSzZhOXdWbk9EZmdKNGFZQzVsdGlBYlhlU0I2SnYxVTR6?=
 =?utf-8?B?QkpxMnNrZWJycXBVck9tb0JEVm5vL0hRcjRhMlZUazRKMndPYVVSazRyMUdm?=
 =?utf-8?B?YWJpNy9pclFSSU1pa1ZxbGlhUU42bVhzc3dHc2FGbVYrVHhwQWlHbVdnWTF0?=
 =?utf-8?B?aThDU3VYMW43aXdoLzhOV05RaUs3UHpFUk5OMFdobnVlSjJ1VW8zK29Ea2ho?=
 =?utf-8?B?ZWRGOG1sSWZDRk5LRkdxaVIvZGUyZldwV0dKb0FnWjBFUWxDKzVzdFJETUpx?=
 =?utf-8?B?bUQ0bDV1ZDU5V0V6ckZ5Ny9rRDhONWdJT29pMkpzMkphLzNLbXovUVlHVGI5?=
 =?utf-8?B?OTc5SmlYTWZuM2YzNXBaTGVFNWtidXB4Z1ZrdFNYcFF3Yll3em9XWjdzeWx4?=
 =?utf-8?Q?9NRls96JyaAYDXTOaR6RhK0FTkTHRH2i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVJmcER3TW1lUzZtWU5rTWlZMnNXVnE1Z2hOWkpwRHFzV2pvYmtIbFI0bldO?=
 =?utf-8?B?QWVpZkRSMnhiQUptOGp1QS9pSFZtNjVZWXl4MGwvTWxKVjZST1BxVStMa2dM?=
 =?utf-8?B?ZmIvSkxEVkNrS0lSNXB3cTNLaVBobGthOVNDQ21RQ09zeW84VnlFbnN1SnZk?=
 =?utf-8?B?dkVSc05WMmJmeEc4QmFGYjNNcDFydmtIc1RLaitISzNiMEFvdll2enhRemdq?=
 =?utf-8?B?eWpKUEdxbWh3MlVRak81WFlXZytPT2VaeS8wRmN4NGQwa0E4K2VQRHlsVEhh?=
 =?utf-8?B?MGJPQm9oK1FpUXlXbVlLY0lKbWI4Q210MlZMZ0VXU1hIeEQ0NXg1dStmK0Vn?=
 =?utf-8?B?Rmo1ay9PcVUzOEViNjRHKzdaSFpyUlNWVitPLzYvMTNJVmhCV056YW9NeTIx?=
 =?utf-8?B?ZEQvMU1zK2dDbVMwOWZmRjhvcHFobW9ucHJXUmowRm9OUmxQL1NhMGF6US81?=
 =?utf-8?B?Nmk0YWoyTnRuK282cTlMeG85bEpmcU9hUFBUOEpuS2QvM2hrekVSSm4xRGg3?=
 =?utf-8?B?dmpaeHVhclRLL0xWQmh0cGpwZkY0bHZXZXljUExMRHlkMGM0RS9WY2crWVUw?=
 =?utf-8?B?OWRlQlhSdi9YdVliS0pnR1h2Rm55R0hCL2FxRFYwUnc0YXpTckJuNlJwMWkw?=
 =?utf-8?B?V0piTk56VHRpWlBQSlJxb3RCT2xnRTRzdThXQTlTbVBHMzJmTW9ZaTNsbmdn?=
 =?utf-8?B?aG1NZkJmZ2NGMTYyK1ZhTU05Z3JZUHBMK3FrenVBWkFmaDZuZ2lqUURVbUpE?=
 =?utf-8?B?VUl0d0UvcTZNUHBrU01ZWWdpQmhFbUpqb2FjOFpKeU5CLzBaeEJUemFKSUEv?=
 =?utf-8?B?REZpR1gvTkZScEcxYW94UUpGSk5RcVd2aG8rVG8vdU9uaEFURzJENmExb3J5?=
 =?utf-8?B?NmxjU24vYXpzaEtKZERFVkI0QllJeklaTS80dklRQksxUlZYK2h3NHFHLzFm?=
 =?utf-8?B?RUQrZjZJalEybFJNWWsxSnBaemIzOWpGdXJweTFJdC9YejBURFZzSWVKUlVl?=
 =?utf-8?B?YzR5RkpQeENmcm5WQ0RUWnZrWjJYRE84VUNNTkc1ZDJDci9sWC85M3hKMzNZ?=
 =?utf-8?B?M2toYk1MYzBmMC9JT25PYUJWaTdTamU0VjJBdGtmZkN1VE5jb3hQSndHd01x?=
 =?utf-8?B?aXMrU3JPcmZNUjQyaHlKNEpSQWxFeCtwVHVHZVcxdzBDMDJ4aWZkbDExK0Uz?=
 =?utf-8?B?c04vVERTQ1BRVUZGTVB3VFRFLzZ3dkF4Y241cmFNWVBsYy8vckhQTmZjOXNY?=
 =?utf-8?B?MnFpd3RyWTRabDdYYUxDWU82cE5aQUxhTFEydWlDUWFMbEV0RVVqcEtIM2cw?=
 =?utf-8?B?Y0RtQVlseS9xWFMrd2NJdDcrVE9DejRrajljWjJBeTRrNlBBaENQUUpZV2hP?=
 =?utf-8?B?eld5MU8vT1hZNDZKYmRMMjkxMGR3REN0NG52RGtZWTFxQ1ZleWdqNGlCUER0?=
 =?utf-8?B?RVlwNS9qZmdydmJmZDFjSHZjend0aG5pM0NGQnRmM3pzd2tNL0JhdnFQU0F1?=
 =?utf-8?B?SXhOUmZVem5nWTRFUzdWTUxvOTA0aWY1ZG1oeGxGdk1lWWxpZzBISnRSdzJE?=
 =?utf-8?B?b3lEYXBNNDZjNVpRdmFVRE9IUE5qbWFSMzNPSytDaWhBRmtZY3E1Z01Xdm1x?=
 =?utf-8?B?ZXBnNzdXbTluZmRwNWpHREFVbWc2RlJoUXMwUmJZdStUVnFDNysrTjBkdzNI?=
 =?utf-8?B?anovYnBqZEdBWW95K2YvYjFMY2NNSGhFRzJWOHJ3ckdJenRlQlRUbVlocUFH?=
 =?utf-8?B?SER5ZE9tancrL0ZFWDMxSElUNmd2c2ZpTjBjMzFYdDBJNHVXbFVqTDdsb1Vk?=
 =?utf-8?B?R1FNTFVKR0xyRnBPTCt5Yis4b3dDZUo0Y3c0bnFuZTNoZjQ5eW1VZGhCa1h2?=
 =?utf-8?B?Y3RqbzdwQUdac3hrTTd2bEdaSXluZXgzNUpvdFp3L0JkRCs0OStOUWpJcWJY?=
 =?utf-8?B?Z2gvSS9qOFdyeVdxdlRmaXJtcGJ0UnF6Q3JraFMySitOVzcwdGcrWWoxaU1D?=
 =?utf-8?B?dDJ4WUh5Z2o0TDROQ3lUVzFySktsdVZ3cHNBQWhySFV0aWVPQnlDU3JYc3BQ?=
 =?utf-8?B?NU9sZEluT1VHR3NvbVY5V3MwU3RDMTRSa0hXVkszV2tYeWVKUG5BQXhhS1JM?=
 =?utf-8?B?TG51TGRFcjNMRHZDZndoNmh6NkhVYVM2eUVNRERrUmt1TmFvbS9QczRXYVN1?=
 =?utf-8?Q?Oe4G+lwvskeKxdW5Vule1vbQ+FipGLV8Dj5Tlp47SEWS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9883e9bf-6fd8-4f48-4262-08de3eee903f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:05:47.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 678gKHZqnl/X8YoioL/gzpRwbuVqfh4bjY2XaDC2L5GFJkymeUD6H+F0ZAOyS8L241V1zGWNcB22C/j3VbSbjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6551


On 18/12/2025 21:20, Aaron Kling wrote:

...

> Turns out, this is actually semi-operable. There's a blocklist in the
> cpufreq-dt driver that includes all tegra archs <= t234 except for
> t186 and t194. If I add t194 to that list, then the log lines go away.
> However, it does not fix the nfs boot issue. I was finally able to
> replicate it by setting up my own nfs rootfs. This series does not
> affect it though, fwiw, it's the dt series that triggers this. Before
> it, nfsroot boots as expected. After it, the reported issue happens.
> After adding t194 to the cpufreq-dt blocklist, the issue still
> happens. But... if I add "blacklist=cpufreq-dt" to the kernel
> bootargs, nfs works again. I don't get this.
> 
> So, summary:
> * Adding opp tables to the cpu nodes causes cpufreq-dt to try to
> handle cpufreq for the soc
> * Adding tegra194 to the cpufreq-dt-platdev blocklist stops log
> messages about the attempt
> * However, it still affects the ethernet driver, causing watchdog
> timeouts and adapter resets
> * Blacklisting the cpufreq-dt driver entirely prevents the issue
> 
> I'm not sure what to make of this. Anyone have thoughts? I will send a
> patch separately to add t186 and t194 to the cpufreq-dt-platdev block
> list as this needs to happen in any case.

Great glad you see the same and thanks for the summary.

Have you looked at what the CPU and EMC frequencies are doing? I still 
don't understand the connection to the ethernet driver.

Have you tried setting the performance governor for CPUFREQ to see if 
that works? That would tell us if the CPU speed is related.

Jon

-- 
nvpublic

