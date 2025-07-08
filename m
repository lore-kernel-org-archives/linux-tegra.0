Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC552356D9;
	Tue,  8 Jul 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751974956; cv=fail; b=b7ItuLMIydSxxXRTn+0rbUaK1fBGGCnyQ1lXHYb0bclrr7jJGI7R+auQ0OXOQNaIah/pQIBXmWmz0OJ44Akt3WW7/4iIv2VvTrAwZ8g6OMpCKZth7a0ZWnTpMDqtbwol881HIo9MlkwV7tuxb86BT+r9cHnKz9kjvK64AXBlZN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751974956; c=relaxed/simple;
	bh=j5yWUideKxIbAdrs3cpZwKBPWLV/dF3Ypy8xN2R2UKo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hGDM0i0wm67tqZY6hiUGmTO8I6nW9n2IIBzlkibXHFuQ0y24Df15O2Nb9WUmlAmaL/CxHYrCGrK8lpJqAZboK15KaIkcu8Jjby8MjY1Y84KauGea21xqv83JA2+x3wWe72yOHrWP0aKhKThhnVtTxUNCt8PFLvMwHnb5svFuDKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oMAN7nHm; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oMAN7nHm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4SCRxeKuw/X2s3F8Da3o7tbEiMz9axkmLCOE213LweDV4PvNm+rh+6AWHB9ZTTzJ3fgYUJcAOQAYmAOto0uRt2Eb3RfocFOfjkB/u1eqoeqSAoZWwm1ryG8nlUdDBWdhA04ALOxEx5c7WqzJTtWnWMrSGnBvuhs1aeNKD2xmLF9ZGU1YZ6KnQEUYthfx48s1RXnlp6EEF/h+iqEgWWpyMrPXn4sRcprqaio/4VA3EZ+XgLg+npquDF7McbdNXzGIHZyvAIJiZuJCXntCv8+9ZGy1kqz9k6YftVzd9mjUjgrIUpPIXuZC3jJlA7qMgJFGTTdzTt+FNkrcUNNAuntFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqpvgVyw9eQf/Ynn3t4TuqKHU68dsKgpx2vYn7emX30=;
 b=uh9PiEP9iUqd+EvJ3euHi+UqMnJs+xX+/xKAOHEBNcbnd2DsGIln7KEfxoWG0W+lgcAx8hAPp7r9zsOP+9wpdvzCBnrO9BOPblS9CYyiUIF9FhYsHxPJkZ9DyqIkX3wSICwBF5CggqiNewx1YS60GvOtZD4sCVCu0lcwxOI7Vr7DR6E3NQsEw5DvWU/dQFQD1ztkhp/sZtURz2QF20ct0HYzH/EInQArWIxgKIW7reFMVE/yOR5E9vyHHN6vQN4JfnaAywjPKXAlwTmVhLkBHIOWgZzc4A23EABnsDLriAzX766d7C46mTAKxIakqWDO39JL1BMaCCf7IdriuCZTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqpvgVyw9eQf/Ynn3t4TuqKHU68dsKgpx2vYn7emX30=;
 b=oMAN7nHmTf4zsmfh9v5EUJRK+bM364ALF/qh2qM9ru6uS5NdGt4vEYYYDckG3bZNinE4NmjboEdwJRYKIWQpSj4+YeISZTfQwRRu3BTlFgt2515FI/LL40RDDRSpIphvXGRjQCJcNpcGxUVIqoAKXKB1j/m7cicX1gjWPyAaDQfUcMjXB6VFtXDIDsLBzuRqB4tWvqvhADsiJa6i/1/WtgIbshpD9tRKMTqwaYbYOQ7XOMxTpJEGffZPYBu+yifUUp26+9oQOWLxxjcgpU9AzhZ2SGX82y8G1/kEE6yUbNqwEJzE7by4MXlO2eoSgJtsT79bf9wL6Gu7jvGOGcJtTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 11:42:30 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 11:42:30 +0000
Message-ID: <031fd310-f484-488e-a6e3-88802f42d821@nvidia.com>
Date: Tue, 8 Jul 2025 12:42:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
To: Thierry Reding <thierry.reding@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kartik Rajput <kkartik@nvidia.com>, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250703110415.232741-1-kkartik@nvidia.com>
 <aGuYuHx5qlKCur8P@mai.linaro.org>
 <58d948d3-bbc9-4fca-9393-ce995a4e2567@nvidia.com>
 <5e8714a9-cd2c-4dfb-a624-8a1adba91da1@linaro.org>
 <rq2mdqmg5hnyg6tqluw6vsk4iecgvcm7muhwzr2bhwoi4y7bvi@3cvxzduzw5og>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <rq2mdqmg5hnyg6tqluw6vsk4iecgvcm7muhwzr2bhwoi4y7bvi@3cvxzduzw5og>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV8PR12MB9620:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed1be01-2073-4f0a-8882-08ddbe14857f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVRFdk1jTXlZTk1PdGYvWVJLQnJsTzhtK2NjVDVTcDZrdzZKSjlIc1M5bDhR?=
 =?utf-8?B?ai91UHc3TWEvRXZuYzJIZzhIUTV6OTF2cFZhNnpqeFpqWnJaTjNGV1kvT0Jm?=
 =?utf-8?B?amJYSjdJV1VYdUhUVmp4WG5WemdrWDI1YS83a3VUclFSNDJLNEpQRzNBVHhq?=
 =?utf-8?B?R3NLLzlLaklYSy9BY054N1JiVlpZemhvcXhnckxORC92aW52ai85WDFXLzM5?=
 =?utf-8?B?SjFpaGFpblNUVXhzWS9VYm9iU1pGVHVxT1B5a3hXS1NPU2NJMEJJQVBFUnRY?=
 =?utf-8?B?SnVkaWkwVXpnK2hXWmhHV2k0ZXNJOHNraVl4NVh5REt5UEZZa2lkUWd0WVRn?=
 =?utf-8?B?RlBFVk9lcDlLTDZSaE54RFpJRnZ3dDRpdEEyNE5qNGtqMTJCSE9xTjBpY01L?=
 =?utf-8?B?OUxGeVk1Rm13blUxTlJOS2d5bDRHN282eGtCb1FDamkxelhDSDBSZTJ5VG02?=
 =?utf-8?B?MC9zUERoMU0wWmNsSzBiOS9RWHJxcEt4Qldzb3pvWDgrRjdqTVBZSUc2dDZF?=
 =?utf-8?B?OGpsNWVHaURyWkJBOTZGS01WaHkvT3J2MFByWXJBaVA2WjArUHV1NUllUjZT?=
 =?utf-8?B?Y0NBdktqWW9HenZaUkZBWEZaZGZtT0VQZTVUSEwyYnNpb1BlQm5QU0VRLzVE?=
 =?utf-8?B?REhYL1lnSlg4OTEwUmNPdnVjQXJySmdXR3dQMnZ6dW1kbmhURXlWM3pQOG1v?=
 =?utf-8?B?TVk5V2x3L3pQQWJ5QWpxL21NOE0va2hsdXF1U3VxeUMrK3JGWHVpcW0zdzk4?=
 =?utf-8?B?MXFYeUNmeUpJQ1pOc2VEWG91Z2ViUytIRk5jWmpqL0RnYVFFb1pXZUhtQWVx?=
 =?utf-8?B?ZEdGbENUVmY4ZE02RTMrZ2I1MVUrRVBKc2FUM3RaL1hGQTEzYlhRRThhcVdC?=
 =?utf-8?B?TnZYem1uUnVFOTRiMFZKZUd4TnkrMXpzeW50ckVlalh2QTJxWXhCMVBYQkNL?=
 =?utf-8?B?b1BlSEpBK1BKQXdaaGYwdTQ2YXRsZy9tcVY4WWZLMVpERS9XMVBGS2VDUFRT?=
 =?utf-8?B?aXRtQy9QQ0tOOGRIR20vOEtxZEJaWjdUQUI2UzhLdG5pOTFHTmV2cVNWK0pr?=
 =?utf-8?B?UzhaWUtUdnk3YnNTZjhiYk5hWERMQzFVOEdHTXp2V21iQ2wyMFptSUYzbXRK?=
 =?utf-8?B?M2E4L1VTYTNiWnAyc0luM3lDK1JQVmgwN2YyMHhSYUtnSXA5Q3RvbU5zcTVn?=
 =?utf-8?B?WFA2Nkt2VE5DeUNlSGNGOXZqR25STlEwWk1yOU9tVjJycjhtUmNCQ00zazB0?=
 =?utf-8?B?UjROdFpMTEI1MitCZWNsR1QvU3FXdFhGLzJ3WVdNRlBQcnYvT0ZEYjMrVnFG?=
 =?utf-8?B?L2pLRlJua0xTV2grbnZoMTJYdDQvVWhuSXR6ZlJ2WWZPai9JQk1tZXB0dWJ3?=
 =?utf-8?B?cGJVTmpTdHNGb3cwcHByMlJMQmluVXFOdC9xWTB6Z3RYbTVyMFFNajBweHNs?=
 =?utf-8?B?YitOQVBwN0cxblNKd21Zb3Z4ekUrWmRGZFgzcFZReDA4T01wTE04NUtteW5S?=
 =?utf-8?B?cGRQa2RKbEV4SDBBZTI1NXU3SndjTXVqNkNIaWlVMTB3UjQxN2c0SkUwTnh4?=
 =?utf-8?B?US9pQm0wYUJPVG1QZ25ReEtXTnlPKyt5czhYakJZWEJZVEs5K1ByMHhORHBZ?=
 =?utf-8?B?Q2tscFY2ZzZnTEtYcDlWTWdOdDZlOGFNSVpQcmJJNzFiaGxGanVZamhwZWVD?=
 =?utf-8?B?d0Z2T1NPeXZqLzBxanQxVHZ2WlArN3hhYjVSOGRaMkJ6eUE5UWFBMGtNWHJu?=
 =?utf-8?B?TUVzdXZHSjc2TUUybm5FZDVodWttS0pUUnhGVzFNWGlZbHc5L0ZCZTZMUHJy?=
 =?utf-8?B?eUxxeExMWlZwMVpYWFBXRWk1U2s2WVlwNTZBSVVHU1AwQjVJUEpJQnpmNi9l?=
 =?utf-8?B?bzc5cjlWa0hFSVFYbjBJNWNOYWR1NjRLdmU3U0Vpa3RFa004WU82RlZ0eEh0?=
 =?utf-8?Q?NM2aGWj6YVc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzFCQVVXWWFqTHNnN2NPUzY1UW9Gb0dMMUdRdHF0U2xBRis0RTZLdWZaYmJJ?=
 =?utf-8?B?MTdUczVpZFFmeGp3QUo1Y29DNUNzdS9KWVpQMGduUUttbFAyeXlTaHE2NllL?=
 =?utf-8?B?NzlOeG0vNlNLNEZRTmowVFUxYlJHVmFUUTBWa1d1UmZZUHN5Y1gyZ3duNXNR?=
 =?utf-8?B?OG9tTnNZMS81U2p4ODA3d2NveDFuY0gvVUplZS9wZXowbjU5N3dveHhrUVNK?=
 =?utf-8?B?TmQwSTBWSXRJYWM0VUVLcG5wN0NCVzJySWkxMDFjV2F5b1NZcDhGQUZMVFBF?=
 =?utf-8?B?VGpKMVkwelRZQkZxM1hod2RUK0taKys2a09PZ3hZY2Zya3pvQVU1NzVSVVYw?=
 =?utf-8?B?TGRyT0xsbTk3NG5GWUovb1JvZCtjSjRDOUN1cU9WbHplWjZxWWE0STJwNjZx?=
 =?utf-8?B?Ti94SmE3Vll1eXVKWm43VGYyS2ZQMm9ZS1lRR0s4YllsclNucnNXZ1BhVlgv?=
 =?utf-8?B?OWVFOXY5K2lGVnZwYVI1dHRBa0JpRkF5RlBVRit6d3JhdTVVdXg0OTQ1MkNF?=
 =?utf-8?B?dGxXZjYyZ01wZTR6MVZHc3huZHJBUStFWWpnaVJxa09CUm1PaEo5MWdGdlNN?=
 =?utf-8?B?N2Q4RUlnK3ArQ2hYTllvTTNoOFNHRnlQU1JUWk9odTBjQXh1eEtRMk9nTmZE?=
 =?utf-8?B?cHJId1pNZFozQzhSenFjSzgrcmJoc21GVHlZUFg2N3JOZW1DMWRURm5OY3pG?=
 =?utf-8?B?WnNNeHE4cDlzOWVzU1NkYmNiSTJxdDdZaGdkZGNhZG42bzkyaVo0MDJZakJq?=
 =?utf-8?B?cEZ4aFdPd0VkVDRhM1AxOWd4VktHa3BNaFRaWWJxMGZLSUtZS2ZmeFJzeUZi?=
 =?utf-8?B?UHJkcjRocUdLWkNOaTNNcUlTYk9sWW1zL0tCTXJ4cnBOd3Jpb0xacFppM3pM?=
 =?utf-8?B?NkU5ajYxdVZkc3pkeUd0bjNzQitlcEVxcmdrMHBwM1lyVDVzbHhtcm5neWJK?=
 =?utf-8?B?N0IxTjdTaFlCZ0ZKSUNEVkEwY0EvUXRBT1lCVUdlZVhhbkJEY3NvQmk1MWFk?=
 =?utf-8?B?WnJCMTBWY2tNM3FISFU2SW1WeFZhcUtCaEFFdzI5MzlnSmViUjlxV0JjQ2Y2?=
 =?utf-8?B?Z2t4YkZsYk9NOS9lVm5ISTRJR0k5aVVvR3JCcGM3U0VPdnkrVFZNTXF4TE1j?=
 =?utf-8?B?L1UxSFpORU0wb0xmRDJPa0Z1cjNLaDBaRDVpbU1rWlhVTkJ6Z1NmdTREcnhu?=
 =?utf-8?B?OFZiT21VUHVPbFZiSWNOOFhEU1hQRGorQ0pja3lXTUNOVmxYS1FHeW13T2tI?=
 =?utf-8?B?T1p3dUxCeG1qU1dzM0I4dXpwOHEvTS9pZHdZVEppYmpMVzRHaE9FNC8vNjM5?=
 =?utf-8?B?eW5LS1Juem02bGkxUDJLM0NpV0ZwVUtQOHN6ZGdnNEtlbkt3WTNubHpWR3hy?=
 =?utf-8?B?K2czRDc4dEpUS2JvbjZCL3NlSXZEdk5ZZHBwd2YyQU02WTFMQXBEUTNEUm9x?=
 =?utf-8?B?VUhBSm45ZTRXWS9GV2s5bHV1WmUzaElZVjhJNGxaeDBrSGhLYjZoeUVQOFR4?=
 =?utf-8?B?QjdvMWNFaTg4anJJcjBjRkF0MGJwMTl4SmFBT0tUN3N2L2l0RVpiOVhyVFJM?=
 =?utf-8?B?bGhhUWFFNUVTZjMzZXBmelovUElMeElkWm5kUWxXbmNRUzZiSEpOa3BHY003?=
 =?utf-8?B?OThhVHllRUdzVEtqYm9qb2FiY2ZCVHV1dVE4UkdQUHlhYSs2RTZWWjB2V1VD?=
 =?utf-8?B?bitWYTVBb0FZSitrRjNkUFpzUkNaK0sxQW9HZTFvYVdtZ2hEY3I1aHRLRmV6?=
 =?utf-8?B?ZFpvamNzK1JQMGhOWUVjbUZpcWlqQzByckZwclVQUUU4R3NsOGJDcWZXUXVa?=
 =?utf-8?B?MXNPcWg4SVJRTWFYbkxqZzAvc09qTjBUd0lmbExJZ3g2VjJoS0c2a0NyaTRx?=
 =?utf-8?B?TGMrMzI1K0Yvb0xKV0Z1Skl3dGM0U0M5a0ZLNW81WE02czJ6V0s3WHhSeHZP?=
 =?utf-8?B?eXN0VVpvenZnaVRoVGw1ZVJVVEhKZ2hLejdhNFF4T0JEMzRNSVl6NmtIUUdX?=
 =?utf-8?B?c3kxZjhhSldFbHJCcEhHUVJUNXg4NGtwTC9Da3BrMHZhSFA1TjRweXZ3WVMv?=
 =?utf-8?B?d09MYmUxdkRwd2ZHbjFuWXVIRWJJU0I5VzYycVl0SG5WblVTSm9LTVJScW9y?=
 =?utf-8?B?SnloRkFuZ05XRXN0OTZkdVJRU3pyMGxSTlZhcG0vOHhzK2pmWkVkSS9rYXJx?=
 =?utf-8?Q?oWSPc5sCFx3wGQqmvhPFEAmsbJJBk5Ns45WINGRjm/jL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed1be01-2073-4f0a-8882-08ddbe14857f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 11:42:30.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6e26Q7GMT4zhmY9FefSvxy+0WTuNxsaKWfpXXhKOu0ZMIxUnBqLQp8Co2mypv51ckuRK7v5YzolxubZ+zcY6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9620


On 08/07/2025 12:22, Thierry Reding wrote:
> On Tue, Jul 08, 2025 at 12:03:52AM +0200, Daniel Lezcano wrote:
>> On 07/07/2025 23:19, Jon Hunter wrote:
>>>
>>> On 07/07/2025 10:51, Daniel Lezcano wrote:
>>>> On Thu, Jul 03, 2025 at 04:34:15PM +0530, Kartik Rajput wrote:
>>>>> Currently, if the system crashes or hangs during kernel boot before
>>>>> userspace initializes and configures the watchdog timer, then the
>>>>> watchdog won’t be able to recover the system as it’s not running. This
>>>>> becomes crucial during an over-the-air update, where if the newly
>>>>> updated kernel crashes on boot, the watchdog is needed to reset the
>>>>> device and boot into an alternative system partition. If the watchdog
>>>>> is disabled in such scenarios, it can lead to the system getting
>>>>> bricked.
>>>>>
>>>>> Enable the WDT during driver probe to allow recovery from any crash/hang
>>>>> seen during early kernel boot. Also, disable interrupts once userspace
>>>>> starts pinging the watchdog.
>>>>
>>>> Please resend with proper recipients (linux-watchdog@, Wim Van
>>>> Sebroeck, Guenter Roeck) and the changelog.
>>>
>>> ACK.
>>>
>>>> Can someone take the opportunity to split this watchdog code and move
>>>> it in the proper watchdog drivers directory ?
>>>
>>> I understand that this was mentioned before, but Thierry previously
>>> objected to this for this particular driver [0].
>>
>> Yes but meanwhile we found that the auxiliary device is designed for this
>> situation.
> 
> Honestly, adding auxiliary bus into the mix is total overkill here. I
> always thought with all the tools we have today it'd be easy enough to
> have drivers spread across subsystems if that's what's best.
> 
> But if y'all think this is the way, then sure, we'll do that.


Yes we are happy to conform to whatever is preferred. However, this is 
really a fix and IMO outside the scope of any refactoring work. I have 
been pushing the necessary people at NVIDIA to get fixes upstream so 
that any known issues are fixed. Hence, I would prefer to handle the 
refactoring separately.

Thanks!
Jon

-- 
nvpublic

