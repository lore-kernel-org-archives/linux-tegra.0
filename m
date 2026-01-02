Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC6327BF7C;
	Fri,  2 Jan 2026 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767370133; cv=fail; b=pBha/EUYThmdDw4MB5FO8ootieg0y9qXiarVXi51Iew/QTOkyUD0ODDsM3oFN3n406B3ehfJjWqDzmuMVgLp1zcCG39dneCIZynrd3AdWFJhxNDt8NW9WD7fY/rnNdZ/Bs4OjshkPxuNGFERzkKTErMOMOHVVkahGqZ3NmeV5qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767370133; c=relaxed/simple;
	bh=adGUNHYItk72K6lDb03yrESUWqW5wqj3kYoUyAjKV9E=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oPbT3giwPfc3tqpvrJVQeIiOnywjzvQpyu/mnaFGEYb7MDr7k7Up1rCuPQxyewXP5ZE8Rs+fcNkKoS77NoFds/38f66BqFvS/5uGwt/awXTho3NkPA1/r1a5gzf0VWQ+1qYacuInbU7kJjM5OA+7vE7HCLIqnlrEsVffLWGJmxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O4U+SmyK; arc=fail smtp.client-ip=52.101.61.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O4U+SmyK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lksf8V114OCww6P+7ogdINM1lm1d68+UjYnru6Zd/wZZsY16tpL9TwUdxgQbZ4ptAErXp1PIUg7aijnWqnU0aaHAGnGC5KYbOQOzgW+728F4OPZqN3pY8dZkx0dqeAkk6zOq2xd8Upc66g8II2/XzjLOVHnAV+E9Va1pYbn92R+8opDjDAem/hTIO0oC0a+SG6nitgHVfJHvwFQoy1VwjF6Sj7wKRZVOmy1NyfCbS/9VZyKiWrv+O7lJtiV6XSCbtDA/nTrrZdXIL2Tqa4w2BR9kTWZrMIjqAm27XG/ZbPMQd3sx0WbWZ/Xft4DFchOrir74jWU6tlk9R/T79O9jOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxQVKnQCAAXWKXBH2J4kkxDLdhyp4q6n+2Vq1fBey8k=;
 b=IEBPQSDq9MXUoihXfREWA0nk2ywcLrn1tboE7XcBvDVZ8DYOsRREAmW8zss2SiGizJ1VB94nQhOrbzMeR9OvbjiL/mujsvnKpcWTJ7cxFnT5A/Crjhxsx+1k4u3jQGzeGhJK+Fx+tCW5U3d1YBnjr+Y1OexeI67WCfcilCFL1JRlSWrmEDfPpgEtTlqXP5R5Pqtm98EWj/w7UUjfNJysfSIuvS3hD+K/cDOoL3NIEQv+o0Pi2yfR/iCwWS85ULA+GIvLu9kXFgTFsdFnJY3WEIXI5O+GsyiNRih5sq7ozJVySaOHiDayHqIWitfYpLOZjOUelTB+IQqc4nBJitRzzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxQVKnQCAAXWKXBH2J4kkxDLdhyp4q6n+2Vq1fBey8k=;
 b=O4U+SmyKMfzUXv6Qsc13Y5IlJKim5/aVVUoc0H+LGpskNN8nxMsmnmphVwpGGIB0C5OVnVrPjcIXBnoT+TFooiNAOoCeyPjYSwzhkSZeKxvUXblXXqJsArikbcJqUlcy50pPQJ8yQJC6mYGee4RHPS1SYQCsDZSfnnHnGKn+NvNZ534yLhS5Tp44S9A5QK+1yReZq2BusWf/PlEK4gnGiLewFr2XsBq/0TIAPkg07rtZbeefR1hZacDRTRlBnYKKI7gnriK73r2LcinS16sHcUl0FwLmGgK+welJo6KgREpXBP6yCgev82VrWVUtkqhZ1GsQUf3aUOPEdb6DSw9/rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 16:08:49 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 16:08:48 +0000
Message-ID: <bf03ca52-41fb-405f-8455-5fb128289f5f@nvidia.com>
Date: Fri, 2 Jan 2026 16:08:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260102125019.65129-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260102125019.65129-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: e785e978-b871-472d-141a-08de4a1936c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXZoS0k4ZE9pY0poZVlwVVNRMHk1ZXQ4MTJYOVVPdVl1K012Zjdkci9kVVBX?=
 =?utf-8?B?bENHc0FQb0N2VWVzTytBQUx5N2JCZVE2VmtpdTNWeXJsMzFybDZzdHUwTlZJ?=
 =?utf-8?B?WG9xS1Y2UUJja0pKdWZVWStJdHM5NHo1Z0ZEOXhqUnNYcm5YYkZwbVBvMFZP?=
 =?utf-8?B?NTRWbC9yNHh1MEE1VFNjQzF6U0Y5QmNLeUkzM1dneDNkZUJqa3J0aWFmSnZi?=
 =?utf-8?B?VlNpSUxoUkRvWC9Da0JHN0xneDROenBYOHFQdHUwMXFVRDY1Nm1pb215ZUFJ?=
 =?utf-8?B?Q0I1aDBLbjlFSXpUanN6UTdWcGdpeGFWNFhTL3A3aDRzdFdrWktaODQ0ZlNm?=
 =?utf-8?B?bDA4Q3owY2E5NEovRmg4UEVoYytiM29ORnpvRnA4Y3ZwT2ozZ3ZXV3haMjBC?=
 =?utf-8?B?dEEvZkRDSzk3YlRZWHpDWGlqOXdWRXptZE5NTk82czB2M0V5b1oyZncwb0l6?=
 =?utf-8?B?WVYwT1hnTW9oUUNKNjVQY1I4TFhldDliWStpNVpSRUJYODQ1M3A5Y3V1Qmdq?=
 =?utf-8?B?SllaMDFKaWVrdUk4TE9XVGhkSVpmUFh5bGtWVEk4ZWlranpKdTdiNENNeGZE?=
 =?utf-8?B?SzNhekpvOURPMi9BMEJ1T09KRE92R2VLYlF0V0IzWE03ZXdvUVhpdjFFTFNw?=
 =?utf-8?B?OTJYNldxRk9Qdkk1RVU2TThWQnhQcURpMzN1dU5NWXpCUHpkdE1SWG9pV1Ax?=
 =?utf-8?B?WWtRc3FMMWRyNnpKTjJHeitodHlKaGFyZW9yVDg4Q2xRYnQyaFJkRFY2RFZR?=
 =?utf-8?B?c3pONGtXS2lybmtETnlIS3lxMnJzdUNzZ1BPYkJkSll6NUtNeWJ0SlN1d3o5?=
 =?utf-8?B?eGUrNjJjZEJSeVFIY3RFRUY5OFJ6K2F3ellmd0tpYUNFa0wzRFNlUWdKRUR4?=
 =?utf-8?B?MDlUS3hodGpiWjFpdUZOU0dkWUxkRlA4MHYzUXU0TGo0SmFCYTZuN0hXMmEv?=
 =?utf-8?B?RXVmS1lUN0lITlNtZ0I0dFA0ZGc4T29ER0t3OVl5UDlnY0JUL0hoUElWOHp2?=
 =?utf-8?B?R3ZLSGVWMjNVZGZKVUg2aVlNK0M0YlUyYzQxZi9lU0RhWXZrYTE2ejNRSkFk?=
 =?utf-8?B?TnJhZnlxeUUzam9TUDdEN1p5S0QzT00ybllUT1IyUkt2NXhiNnZGdEp1SFAz?=
 =?utf-8?B?b2FucFhzY2s3RGtyOHEzeXBsZm5oRGVGZHFEOEx2Y2psY2xuRkRBb2NKSlBF?=
 =?utf-8?B?RWpEbVQrSUk3SXh6eGJxSTVqSnN4UUJSNUM2ZkhZNkpQKzdGWjZ1WllCWTZO?=
 =?utf-8?B?STR4Y0EvSU5meXlabGNxUFRnKzV5RTJ0MFVKUVFjaGZhTGFmSHRnd0tlcVRw?=
 =?utf-8?B?UEthTUtSVkpGYk1WTFRIcCszbWN3d3RMalBvM1I2N3ZUdXdVS2dUcjFFQmhM?=
 =?utf-8?B?eVFzTDAvMUd0d1U0ejl6VytyWnVTUEFIQk13K1lkeGV2NENoZmZBeFVuQmFy?=
 =?utf-8?B?eW5DNXRBZ3hhcVlDZndrcGQxTzRyNHNYTlc5cHFEQ0ZKM0Y3Uk94ZUNXd2RP?=
 =?utf-8?B?WVh2elI3VVdmaThiMmRLV3lnU25tWk4xY0JtRGVtdktxUTJWUU9pNE9pNGVl?=
 =?utf-8?B?eE5RQitKTUlrY01OanVhS2dXYkdPdTA0YjE1eHp4L1hCenJ4LzB6My9nMkZJ?=
 =?utf-8?B?VUxTd0l6NlYvcm9ka3I4NE42ZDM2RDZ6QVVadDZDYmRva0ZHOHhyNGdGdjcx?=
 =?utf-8?B?VzNyVFhiTVphcXdWVG9RWVNjRnFvZ0FUWmhmNDZzRnJqaGVkRFQ5S0V4U3JX?=
 =?utf-8?B?czZGYjd3bnNGb2pIamt6U05CVUlmaDZhSFh4blpXZEtrd1V3RGdqbENtYXdy?=
 =?utf-8?B?bHI5eUpJY0QxSzhHUkQzUUtRNXgyMFdvV29lcVpxNnZJNWNJKzI1VHc3blRq?=
 =?utf-8?B?TjFKNjZmWDV0U3J0NU4rdVZxcHdURG9HYUtIWmdQckRjSGgzaThJVi94c3ph?=
 =?utf-8?Q?48EeitwDbqN0h0e97Rlx60nxVnkvIZhn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0U2WExjRTdFQll4bTZYcjdmODdVZ3NHVGF2cjluQUt4aGNwcWlNbXpOT05P?=
 =?utf-8?B?dy84eXY2OEMyUXM4STdRQUI2bmdKL0ZjcEErdSs3RDNFREJQQzZJMHVVdkMx?=
 =?utf-8?B?MEhBN1ZRRUkvUWxiNUlyYjJxSjlHMDl2bm9jRE1hOEUxa0lwM1R2Mnp5Q0lu?=
 =?utf-8?B?VjZqS2dXYXEvamExdFhhK0V0MTFpZHVmMUx0cUpYd3Y0N3FBYktzMGRMRTB2?=
 =?utf-8?B?QWhHYUZrM0pwTUVjSkJwWDU4U0NVZmFLY21UWlp0cm40TE9IaUk1aXRpK0Nt?=
 =?utf-8?B?MEcwdjJxWllpYktYUDRIVWd3Tmo5UW9XQ1paaENiLzh6NS9SQ3Z5ZkVyTVBl?=
 =?utf-8?B?TXVNUFdYdGdWZkNlVWZadllXdUduNWYwcmE2dlJZTU5talhXUE4xUUZFMUx2?=
 =?utf-8?B?c01TSmErMFNoc2tvQncvb2EyeVY3am1pZzgvaGtTZ240UFpLMjFlVmxOaDhU?=
 =?utf-8?B?T2MzNE9EV1N2Vi8wNDVXck1VTzhZM3d0OTVUbVZtZkhsUTl0RmZRVUxEVFhn?=
 =?utf-8?B?VVdJMGliR0tFVVB4aEZRamloZWtoTmo0akF1NEJ4ZGFGTEZnVDVEQjRCYTZa?=
 =?utf-8?B?R0pEZ1pKRlJzeWdvNk1ObFJRek1ERmFQYisxZjg3WmRvSnRBSnpDRlp4bFFH?=
 =?utf-8?B?aGtBQ21QUFZRMFZMdzhxV3AySXQwa0d2a1U5K25rQWFZc1ZTMzk1WFZlNC8z?=
 =?utf-8?B?dTJRMWU5clFaR3lxZW9oUkR0YUtTSVhOdVZTM1dmdkhVQzQrNG5pbmVkRE55?=
 =?utf-8?B?elhkQnR5RkhUYVRGb3Q3KzFrMjlCbFBiNWM2M0VoK0dQckp4MGhvQUdBVFdZ?=
 =?utf-8?B?TkpFUVRaUGNtcDkzRVJBamtWczlMMzFIaVg1S3Fwc0E4SjdBNlJ4QVZ0N25z?=
 =?utf-8?B?cmtiYnpYTm1DZzJHRTJqTVVZMnI1Rm16ZjVPWkJJWGRJVkpFckZXZGllLzdY?=
 =?utf-8?B?S3l6MDNYU05oWnF6cnA4aWlwTWtocmErdmxVS0JzUHBUWVRFWWRGRXhQcEFp?=
 =?utf-8?B?ZXdYYUhWc0Y0VU9WcWJiTmdtRERwQTZmbGJGNmN5RUYyYk5GVXBOZmYxUWpS?=
 =?utf-8?B?cEpaSWM3Y2ZmSnNQeTgvTHNxMURkc2hhVlJnUjhLZmhFNWxhY2hpaCtTNjYw?=
 =?utf-8?B?QWJnRWpSVW9XdEo3emJLVjlML0hJdlVRbFZrSTVBZ3J4K0JneE1naWlmbTlI?=
 =?utf-8?B?UnNTeFRja2dwcitqbXBmV0hUN2ZzR1VWanFBL2s0a2J2bnp0WFQ2c3BxTnMx?=
 =?utf-8?B?TGltdlZSUmxhditVVE01MzZHMXU5eWc3NXkwcXVtZEtkSThwUTlCRGk5RTBS?=
 =?utf-8?B?U2ZEdE5najR3OWs0Y3BwOGp1OVpXM01nMW4vOWl0Mk0yY0pnTWlISDg5SFJB?=
 =?utf-8?B?YnNlbGM5UnUzcndGSGlNUi83aFFUOXp5Z2VZM0NHd3RuS0JDODFuME9jQlEz?=
 =?utf-8?B?M1Bqc3lyZ0sxazhleTFQMVIwL2hTN1VTWFRmNUE5Vzc0MUVpdDJxbjVpMVV0?=
 =?utf-8?B?QmFpNUF5d0pTKzkrZ2MyYnVjOFNVWWk1VFFDMUYzNkpQZmVJRU5PeVl3TXNS?=
 =?utf-8?B?V2dyNFNPU2hiY1VhVzdzUkkyZTJQNldoaXNJZWQ1aFBNNUJKZHVsazkvcUV4?=
 =?utf-8?B?OU1jS2ZndllFMDFZS2hhVGJaZXE3Q2xmWnFHK0ZPV1NyVXFLajl3WDBtTDZr?=
 =?utf-8?B?b1lFS3hVZTNnMXozM1RBUUNBbk42dW9pMENiSUljZzBrQUNQT2FHeXBPb05E?=
 =?utf-8?B?RlU4cDdmYzRCdnVOaUM0VVY1LzFZeXl4Y1JBb0ljMXZncXlvQkJDK1RHSU1F?=
 =?utf-8?B?RmhXQ3ZRbFFGZVVkenpqK1oyajNKdzBvNEdxVk1tR1N3VkZXMVBoSGNHTDRs?=
 =?utf-8?B?RE1Sd1hjWnFZYjFFeHhFMVNCY0tUL2w3b3dRZVMxdTRYc2w0VXlLQXVkMko2?=
 =?utf-8?B?RlordTI4MmJqNm00WWkxSkZzSWh4aDRsdDNENWhOcG1lM0kybzFKUWpweis0?=
 =?utf-8?B?ZUJkeDBlTjFsQ1BzdVo3c2RCUnNZRjAxeU5zMVNEK0lVNFNCUnNnRzJ4VDlZ?=
 =?utf-8?B?ejlOS2tjWjNFR3pZRmxTRy8vaTJqRTM2N2lxbVlmR0wvU2FMaFhralBuUS9n?=
 =?utf-8?B?MGJyeVNiYU5GSTUvbUp5aE5DYWhuYzBGaXo3UElsTzFmZGsyVjdzYjZ2MGdw?=
 =?utf-8?B?VDZ0SDlUa3RtcGt6NTZ3TWVJdnhoT2EveGtQbE9lakhUVVZ1Z0lqSVoxWFFP?=
 =?utf-8?B?QmpKcDl6MUZvQ1VGL29TaGora3RVQVl4NjR2TWttMCtjalMzbHNqa3h1b3li?=
 =?utf-8?B?aEJrQzZwd0NzK2JmTlh5MHQyLytWU3BqejYyWjFEZGJDR09aQkJuQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e785e978-b871-472d-141a-08de4a1936c2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 16:08:48.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /g41SSehIhoZp6cYSJSm+jrDTiBHqhf9SmpFkRMqrj0TFsH1Qm3Uy0swX4HzPub2muNntlxvy/ysvyZRbfuPRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287


On 02/01/2026 12:50, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/clk/tegra/clk-tegra124-emc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
> index 2a6db0434281..2953b62cb619 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -444,7 +444,6 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
>   				u32 ram_code)
>   {
>   	struct emc_timing *timings_ptr;
> -	struct device_node *child;
>   	int child_count = of_get_child_count(node);
>   	int i = 0, err;
>   	size_t size;
> @@ -458,12 +457,11 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
>   	timings_ptr = tegra->timings + tegra->num_timings;
>   	tegra->num_timings += child_count;
>   
> -	for_each_child_of_node(node, child) {
> +	for_each_child_of_node_scoped(node, child) {
>   		struct emc_timing *timing = timings_ptr + (i++);
>   
>   		err = load_one_timing_from_dt(tegra, timing, child);
>   		if (err) {
> -			of_node_put(child);
>   			kfree(tegra->timings);
>   			return err;
>   		}


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

