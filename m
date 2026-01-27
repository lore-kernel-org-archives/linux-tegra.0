Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E536CDE9;
	Tue, 27 Jan 2026 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542189; cv=fail; b=Hkc2Uz/FyysbzzKCgwxGEo9drvRVRdk7XdezASEmbONAZOAVGFMjNkRyU0jB5SRw+yQH2XpHgdVdHUObLwl/pbRXnEWwjMBhuScQ9HOnwNbcQ/QipIz8NKV6AUOzwB8hsAthjOn+K3aKHQjKIyovQUw9qAE9kHD5iVZt2SL4JJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542189; c=relaxed/simple;
	bh=6hNboug651dO7zOK9cs3AUQYM/cYhy917RdV7t4Tvjw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nr/IK7Ds8hFWp20YQSELXg+eAhlJytZURdXDwk2eTL5k8KfqCButhdY26Kdfrd4u3LB4i6iqr36kfjpFKLXdMgBlWRZrSWwN57BSpj+JXn09wsktxNNcUXGDlKDv43bBq+Lkrvq4IhwpSXD1nmkY22YCSWfT8wpYh4NL2pAdXnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wpg2VH3m; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wpg2VH3m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCDBN4bY8Bpi9xeKxltrrdS0Rc5PCsSWUu+8Qtk+VpfxVMhVolcz+KAT3DpGp01r0p2W0Boh4e13rN4S0E/5IpRxmCAUOFI2IrpuO9FA4CvUwYZ4IOI/AUtCNBw3pjcZWRTM61Cqdu+ibtJfVCKmSAc1xwKk3/dfikv39ztfENin9Ee4jo2ZvpzWSCURYoG5ltDjn0hZ6fUTh71A3mTRhuugvXMJrr7yFyA3dNsPR9YbktDnuL/j5KH4Zamb/rrBiWcAp5SkWGPD0yWLPM6858WDQ9yGmXyve95AEdmHBjCfiqB2PV5v0LG0SXbZRmssMZiwCTyKv7JN+XYj/dlcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZnl3dSxzqrLHaq/eWoAHTOP1i7K94C35xIyO30K56s=;
 b=Q7EzHuKkco3Q5XjWEd7Ej7nkDkqt1yXacqkfg/OJLa3h45adzUQ6xswtoKHE2dQVNx2Ugriabnyxgg/yreJNdPB/YZmIbjinD+2R197G5bvfauEfOQx6IVGwE9dKYK3zj0bwXf33Gz0fYuzd0eq4FzMoR0u5DoTtwM8NS22ia4bJY72Pu0ZCIbSqz0kJxaQt36ObjBfEEjyH9xIxuqHFkMs/Yl7buZsM2aR5bJJedUIQSgniQ+dPf1q4ltEyObsuJztf/0GD08i2UMesB+oJta3Xu9Sjn61YkTjjZYs2xfY45fJA5MXAztOmlD8CtrFxplAi4WuUkYdk5J5PxdSAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZnl3dSxzqrLHaq/eWoAHTOP1i7K94C35xIyO30K56s=;
 b=Wpg2VH3mSZ5kYu5SmQK4qeyCW/cDPR935PRe/Pqsya827B2lE4FcTtSRf56kfTg5WjfZ+ooi1R4MEUeKaq24o1BQaFL7RjoBAI17qNlNEGizhtQrw+DpscjxvqQHBZ7oowjdB1UDBB8lLDRGn8TGRrN17CPxDKtAy0q/bsYyNwdW4sIg5ProTqBPa7jhJUXms1Sz/hbp9Sg7mUAyO6OzNEIUvwb0N2mRA5Ly5L2nmP3EDZ+O5v9j4QRe7/w0TjDUQkJp9qhnTVi0YnIgV4DT5hBVjtgUyhmD77kC6jZw1U+7uA7rBZoruyrrip4e8n9SdWWUebsgOt7jz9FK/EL/Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA0PPF864563BFB.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 19:29:44 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 19:29:44 +0000
Message-ID: <c864a907-06d1-4665-9095-65d9cdecdcf5@nvidia.com>
Date: Tue, 27 Jan 2026 19:29:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/4] regmap: Add reg_default_cb callback for flat
 cache defaults
To: "Sheetal ." <sheetal@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan kumar <mkumard@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260123095346.1258556-1-sheetal@nvidia.com>
 <20260123095346.1258556-3-sheetal@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260123095346.1258556-3-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0366.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA0PPF864563BFB:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fe8bae-7ed6-4593-626d-08de5dda6ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlV2Rms2b2g5RC9OblhsS0phYU1nTFRLMm82RGhMVjI0R01NQ3F3VnFVZDc1?=
 =?utf-8?B?UDArV3c1RHFUaGhoejlUcUNId242di91UnpIMlNXT1JuRXpUWlFTeVpoQ2Qz?=
 =?utf-8?B?NGxWRjRrdHdJc0xZVGJaU2VhSnFwOXdtdmI4KzgvSWVsR0tCWnpKQktzcmla?=
 =?utf-8?B?WHZMVkJLS0hNcHFmVnJOenc3TGRZTHpqVVpBbGU0c3pWc092blk3WXBxSFg5?=
 =?utf-8?B?R3dhKzdhcVQwNXBoeTV3YmQ3UllvUFY1WFQrQ1R1eVd0OFU4dng0aVhFZVha?=
 =?utf-8?B?YU1sWVd6dUdUZGF2NHlNM2VzRzVYa01xT3NuOTNsSThxV0VWWDFieWhlZUYx?=
 =?utf-8?B?OXhpdGlKWkpwZFlrTlZzRHozNDJkdWVpR1pGOHVDUFpLMWkxRDRUczV4T1ZB?=
 =?utf-8?B?UVh0YWRHcWpnbERuWnhhMGl3eldOR3ZwWkMyTmxKckRjVkhKQy9RNEtTTjBU?=
 =?utf-8?B?aWYvbkpwNmZDMlJiN1lCZmRHSDZYY1lNa3dQbm8yb2lGNHFJSUpzZUQ5WENv?=
 =?utf-8?B?RTVqSEVuYmx1VFZTUFc2NGUwNUxZd0poTkpmblhZSDFEYWxZaXRsNjZmWVor?=
 =?utf-8?B?N0xzRmkxVkxLR25UUkVuUlVRYjMrOFU5L3Qvby9EWlNhRjJSUEYzZ2hjK3FD?=
 =?utf-8?B?SWMrTmczRG5jM1p3dmZaMVdzdmE5QnNIRlE4akRVbGF5Tm9oenJIenVCVVlZ?=
 =?utf-8?B?Z1RhQU1VeHJHNVQ0cks5UXhCNVo3Y3lyQ25CS0VpdlZEZHNCZFg4eEtiUFRV?=
 =?utf-8?B?QVRBNTRVY2IvaGprQUNtZVpXVlRjeTRGeEZrZUxNTi83T2trUkJEc3IxUmg1?=
 =?utf-8?B?WVBQVmxDLytOdTdmNWorSVQ4ZEZYbHhWUE94Y2V5MGFwYi94dzdTei8wWFBz?=
 =?utf-8?B?NGxnbHBDcG5WTkl4UkxBWXZldHgreS85U1RwYXUrYmwzT3c3NGU2amtPRlRQ?=
 =?utf-8?B?REVrM2JiZHNpMlRiK1BiWTZPNWpHdnR4RU9SNmlrb2FhZHhoSEtlQmg4ZWI4?=
 =?utf-8?B?ZXN4N05nSUVCOW8vQklnQ2wxdGMzYUhmamVvQlBId0hiWXZmQWtzMFJNcVEr?=
 =?utf-8?B?anNKU3hLK1ZZZzhXelk4WlVwU1pjbVZrbjNSc05mWVEraiszTDdwYmRSWUx2?=
 =?utf-8?B?cHMzUFVJY0lqbjhHM0JGSlpUR2NTbzFkQ1U5NDA1eFVQOE81OHlLT3JiWTVV?=
 =?utf-8?B?RGUvalJHS3V3WWY3TDQzd2cyb2V3cU5FZExxV1JXWXJrM09FZHNKTkNKSy9B?=
 =?utf-8?B?bThNM1hYemtrUGFEdW9hVHdpY29MaXVOYzRCSStlVFVpL2hIeUU5SlhRYzFZ?=
 =?utf-8?B?MWRRd1hEV0ZkVWRrTC9RbExpc1NEM2hVYkxRRS9ZOFBjL3dZK1gyS2h0MmZC?=
 =?utf-8?B?Z1BFS1FrV2dRWFFVTGVHd2s0cjQ5VmFKRkZXMm5salpGUVNxcVp2M0NKYTN4?=
 =?utf-8?B?NmJYclRiYmE0d0hMeE1PMGpQWUlXOWtDeVczcnN4Tll1NFIrRGJydDNhbExP?=
 =?utf-8?B?TnV0Y282MmFmaGc2Vy92OGhDNzdSWUNkbHlaVVdpeXhhTjM2YytyZUJxcXN5?=
 =?utf-8?B?aTlmL1FuOTlYTSsxdmQra3htR1dRNzI4OXo3aEovWVNwUHI5Z2lpbUNpU09h?=
 =?utf-8?B?UlhWVzZFYmZCMUxidGUyb0NUb0dBM2IzWHZnM0RwSVkyL1NnLzFkTlZ1WjhL?=
 =?utf-8?B?TmtndmoyNmwzWTJHYlhUTmNXMjlWOUpRYnhaeEs4ZGRkZnM1cmc2NlFzcDRp?=
 =?utf-8?B?NkFaRjJ4T0xubnN3ZDZMYnFjbzh0Znl5YURNSnM1R3l1SXRGdWJuNDlLeWFq?=
 =?utf-8?B?RnRMTWZRclBKSnJid01IV1Z1SWZ4MVNYS21lN3VDMHc2SEtGRlFqcy9XL2p2?=
 =?utf-8?B?WXZVWWR6R2o4OTNWam4rYklCd0NSZnpsYnEvbVdXaVpiRTRMeGdDaFFYWW56?=
 =?utf-8?B?MlM1LzNta0dwUDdNdUpIN2hIdFcwTktzOStVSlc1TGVZM1ZDME5sMnRYTzdo?=
 =?utf-8?B?QU9HZ2FTVDVXZkJJRUw4MW5rS2FQbWpXNU4yVFVQRVpRRjl4bkYwazJHK0pu?=
 =?utf-8?B?VVZWSWcxQkdGTDV3ZXZDbVhTdXNaZHAzZktNK3d3bjRnVkIyTW1aQ0VCUy85?=
 =?utf-8?Q?SMWQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG0zRWc3a3VhRHVlZTdBNFNCdkEwQXJPZUt2OHo5NFBYOUlMRStQSUYzNmZp?=
 =?utf-8?B?MTJ4RjZueHpCOU5oWXlzcDNHWWFBbU1CODEvYzdwWnhDSHFKK3pZN3Nwd3h5?=
 =?utf-8?B?TDZaQUtTeS9BMlVyRU9HZVRmeCtHeVhLRnpkZHJXNTM3ZUVwWWNEYWJxZkJx?=
 =?utf-8?B?dmM4SzBwUzFkNS9hOEhsY1JqczhlV3RZSlNWTW0vOWo3bS9CYUN4N3h3V2l6?=
 =?utf-8?B?TDYzbkkrWkRsVzljWnFRajMvZ0NhenFNcllyNm1uOVlNMG9HN05ibmxoR293?=
 =?utf-8?B?WUF3VS9ZVVN3dkxYdTg1R2JXN3JocFN4bUlvd0hKaWQyTVJ6VW1aM1N3TjIz?=
 =?utf-8?B?bVd3NWRPakp6SkVMUWU0NUR0OElLRE1FMThRZC95K2ZJMGhYTElQcTROQUlG?=
 =?utf-8?B?TkpoekRyUGN6b2YwWWIySXE0V29GaTNHNzhmU2xjemZpZTk1eHpGSTZXTDdq?=
 =?utf-8?B?SkZLaGJicGVHQSszNG5yZjJOcTdhUTh2Y0dKcnduckdvSHIzWlhqMDVVOUFr?=
 =?utf-8?B?MXdWUHBWMVNKOXRCRlM5blpvdTUxSDBUY1M1c0hsMlhUQU5NQnNDNjdqUFly?=
 =?utf-8?B?VE5xWTNlMkR2a0ltbHQ1dXliSTRUTDBDeFlpWllrZi91TGFwcXJtSyt2NnBk?=
 =?utf-8?B?UTFSTkZQclRSY0I3VnNIYi9lWHRhOUhXV3pwQmZRZm90V2NHSSt6YkJSeTRX?=
 =?utf-8?B?R1h0dXFIa3ZibEZSV1ZETEZiUkRrYVlrV2prdVpRNng4NEQyWTkyNERuWGxY?=
 =?utf-8?B?dUNvOTJzdTgwRDFjdTJIb094YmR3alg4SlRieVdhNktMbDlxaTFSQ1JWMVB5?=
 =?utf-8?B?ZHUxWlFEamhOOVZhVC9jcXNkY3UvZ2hMRm9NZjNVYmJyREhhM0FjbU9xd2dL?=
 =?utf-8?B?MWdQVkFjbjIzVzJES2tKQk4wc2dTNGJXclg1TEI5WHdXYXVUL0Zhd1RpNytu?=
 =?utf-8?B?M0VEcUVHTDkzM1B2eEcwZDB2ZVJseWJ1YXVibU1CaHV2M21qS3Nuck91bkNt?=
 =?utf-8?B?dVhudXU5c1dDVkdudFlKSXFRbWpsNGtjTHd0MHBDZFRXbXhGNGd1MzdQdldq?=
 =?utf-8?B?WUtCRHNYZmdGaWdmdlJuTUZnYWRxSTVxVHcyMzJoTXh1MDJPeTFIcDZqaVYr?=
 =?utf-8?B?Zk0ra2dYYm1jR3R3aU5vbGJiMGk4UE9DL2w5U3d0NkVuMHo4a3QrNGFzZldG?=
 =?utf-8?B?T2NFd3gwYTdsNW5qelRHNm9wZCtOeko4bW83VFJpbGhNVUxKdmJ0WFhNR1ln?=
 =?utf-8?B?emt0Q2N6NWZaZTlIWjVoRjFydDFnaW9PZkdKa01BQU1tV3oyVXhsR0xjYmNh?=
 =?utf-8?B?T2o4V3IzeTR3dXVNTGRjKy92SlcrZmJEREkwc1FKbkxEcFFwNTFBWi8zQlJv?=
 =?utf-8?B?M3BOcmRZMllYck1mTHZ0T2VQUHpLSDVncGp2M0IwMWw3ODRkYWNJek5temdY?=
 =?utf-8?B?MGk2ZHRYMXZHNGxwSkQxNHVnMjZ3bzI1MllpaUxRZ0ZSaHdLTUM5ZXU1Vmdu?=
 =?utf-8?B?NlcySkRPclhycEkxQ3dmL25RN0JwdXRtYzZuNmJOY0RpWXRaQVp3YlY3Z0RD?=
 =?utf-8?B?S3U1SDdqNzZsdTFUcUFDUzZqQkJNZ1p2UE5iNDZlMFJEak9TVWJRNUxQUHVX?=
 =?utf-8?B?NGwzSTRQNTdmRVRWaDMzenIrSTEzc25xeTFwNHJ5Z28rTFRoUUxGMVJEQW02?=
 =?utf-8?B?OUp3N1Z1ZzlJNGVHVVdqK2ZzdVR2NTF6cHpZQmt2em1nblpmcWZGY0o1TkRs?=
 =?utf-8?B?eTZKaFZqa25VeERoNmthMjJvY1QzSVVOeFAwRHBOS1ViSkdMelFFaVJHbjQv?=
 =?utf-8?B?UTZHc0FVVTJ5QXVRWmVOZ0J4YXcvRU84MzZzU3E0YlFIak5lR0ZhU2pTUEFi?=
 =?utf-8?B?dStvWVdrQkxpdEI5OTBCM0g0T3FGUFhYK3k1dmQzcDZOWjNINkY3QTB2ZHQ1?=
 =?utf-8?B?clBvOGVhTWh3YkpYaDFraG5TRGtMenJrSDF3VVBaNWFMTHFtRlp0cjZybW5R?=
 =?utf-8?B?eTNyNlorRDljYTU3U3crZVZaS3NRWXhHWmlNUnFVdXdjUkVDdGI4c0NoQVZP?=
 =?utf-8?B?aWZrUFYwUzV4bWxhM25CLy9obUZYWGF3dURpSVluRzR4R2FTSER3eGdnUVhO?=
 =?utf-8?B?cnAxRWNyYTMyMmJERUxXMHZEaG5UTUxpODMycjRzOTRHc1ZlWmdPUkpYa1Jm?=
 =?utf-8?B?aU9SV3VDS2QrcFIyUlVwbFZoOWVHT24rbG9weHh0aGVhUkdldlpSVGJCektr?=
 =?utf-8?B?ZzYrOUxHTENoeGJyVFR4eExmbEdCaWYrLzVGRDJlS1p4bTl5OWlJT3BPcld4?=
 =?utf-8?B?c21aU2l5dmo0SjlDQzFsalVycks4eVVwSG1kVmV2aUNWS29ZUzBmUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fe8bae-7ed6-4593-626d-08de5dda6ca0
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:29:44.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjCxWmR8rYPXUVK003amyNYPfUG+3e7nTQRhuHRVMDrs+cS/qZ3gDxXh6e2v4pAJZ3shQAmNEHSM4PyT3I9YtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF864563BFB


On 23/01/2026 09:53, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> Commit e062bdfdd6ad ("regmap: warn users about uninitialized flat cache")
> warns when REGCACHE_FLAT is used without full defaults. This causes
> false positives on hardware where many registers reset to zero but are
> not listed in reg_defaults, forcing drivers to maintain large tables
> just to silence the warning.
> 
> Add a reg_default_cb() hook so drivers can supply defaults for registers
> not present in reg_defaults when populating REGCACHE_FLAT. This keeps
> the warning quiet for known zero-reset registers without bloating
> tables. Provide a generic regmap_default_zero_cb() helper for drivers
> that need zero defaults.
> 
> The hook is only used for REGCACHE_FLAT; the core does not
> check readable/writeable access, so drivers must provide readable_reg/
> writeable_reg callbacks and handle holes in the register map.
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>   drivers/base/regmap/internal.h      |  3 +++
>   drivers/base/regmap/regcache-flat.c | 19 +++++++++++++++++++
>   drivers/base/regmap/regcache.c      |  3 ++-
>   drivers/base/regmap/regmap.c        |  2 ++
>   include/linux/regmap.h              | 14 ++++++++++++++
>   5 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
> index 1477329410ec..5bf993165438 100644
> --- a/drivers/base/regmap/internal.h
> +++ b/drivers/base/regmap/internal.h
> @@ -117,6 +117,9 @@ struct regmap {
>   		    void *val_buf, size_t val_size);
>   	int (*write)(void *context, const void *data, size_t count);
>   
> +	int (*reg_default_cb)(struct device *dev, unsigned int reg,
> +			      unsigned int *val);
> +
>   	unsigned long read_flag_mask;
>   	unsigned long write_flag_mask;
>   
> diff --git a/drivers/base/regmap/regcache-flat.c b/drivers/base/regmap/regcache-flat.c
> index 53cc59c84e2f..c924817e19b1 100644
> --- a/drivers/base/regmap/regcache-flat.c
> +++ b/drivers/base/regmap/regcache-flat.c
> @@ -79,6 +79,25 @@ static int regcache_flat_populate(struct regmap *map)
>   		__set_bit(index, cache->valid);
>   	}
>   
> +	if (map->reg_default_cb) {
> +		dev_dbg(map->dev,
> +			"Populating regcache_flat using reg_default_cb callback\n");
> +
> +		for (i = 0; i <= map->max_register; i += map->reg_stride) {
> +			unsigned int index = regcache_flat_get_index(map, i);
> +			unsigned int value;
> +
> +			if (test_bit(index, cache->valid))
> +				continue;
> +
> +			if (map->reg_default_cb(map->dev, i, &value))
> +				continue;
> +
> +			cache->data[index] = value;
> +			__set_bit(index, cache->valid);
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
> index 319c342bf5a0..31bdbf37dbed 100644
> --- a/drivers/base/regmap/regcache.c
> +++ b/drivers/base/regmap/regcache.c
> @@ -223,7 +223,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
>   			goto err_free;
>   	}
>   
> -	if (map->num_reg_defaults && map->cache_ops->populate) {
> +	if (map->cache_ops->populate &&
> +	    (map->num_reg_defaults || map->reg_default_cb)) {
>   		dev_dbg(map->dev, "Populating %s cache\n", map->cache_ops->name);
>   		map->lock(map->lock_arg);
>   		ret = map->cache_ops->populate(map);
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index ce9be3989a21..57c5551044ed 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -811,6 +811,7 @@ struct regmap *__regmap_init(struct device *dev,
>   	map->precious_reg = config->precious_reg;
>   	map->writeable_noinc_reg = config->writeable_noinc_reg;
>   	map->readable_noinc_reg = config->readable_noinc_reg;
> +	map->reg_default_cb = config->reg_default_cb;
>   	map->cache_type = config->cache_type;
>   
>   	spin_lock_init(&map->async_lock);
> @@ -1433,6 +1434,7 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
>   	map->precious_reg = config->precious_reg;
>   	map->writeable_noinc_reg = config->writeable_noinc_reg;
>   	map->readable_noinc_reg = config->readable_noinc_reg;
> +	map->reg_default_cb = config->reg_default_cb;
>   	map->cache_type = config->cache_type;
>   
>   	ret = regmap_set_name(map, config);
> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> index b0b9be750d93..51940eeff872 100644
> --- a/include/linux/regmap.h
> +++ b/include/linux/regmap.h
> @@ -359,6 +359,10 @@ typedef void (*regmap_unlock)(void *);
>    * @reg_defaults: Power on reset values for registers (for use with
>    *                register cache support).
>    * @num_reg_defaults: Number of elements in reg_defaults.
> + * @reg_default_cb: Optional callback to return default values for registers
> + *                  not listed in reg_defaults. This is only used for
> + *                  REGCACHE_FLAT population; drivers must ensure the readable_reg/
> + *                  writeable_reg callbacks are defined to handle holes.
>    *
>    * @read_flag_mask: Mask to be set in the top bytes of the register when doing
>    *                  a read.
> @@ -449,6 +453,8 @@ struct regmap_config {
>   	const struct regmap_access_table *rd_noinc_table;
>   	const struct reg_default *reg_defaults;
>   	unsigned int num_reg_defaults;
> +	int (*reg_default_cb)(struct device *dev, unsigned int reg,
> +			      unsigned int *def);
>   	enum regcache_type cache_type;
>   	const void *reg_defaults_raw;
>   	unsigned int num_reg_defaults_raw;
> @@ -1349,6 +1355,14 @@ static inline int regmap_write_bits(struct regmap *map, unsigned int reg,
>   	return regmap_update_bits_base(map, reg, mask, val, NULL, false, true);
>   }
>   
> +static inline int regmap_default_zero_cb(struct device *dev,
> +					 unsigned int reg,
> +					 unsigned int *def)
> +{
> +	*def = 0;
> +	return 0;

It might be worth ...

     if (!def)
         return -EINVAL;

     *def = 0;

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

