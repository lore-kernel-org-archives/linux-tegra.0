Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5BE1F55F8;
	Fri,  7 Feb 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935905; cv=fail; b=TphbbSvI9EUbeYZlAKJwZAEjO8lWnws1c3jgD44gRdCjZbJJILQ/5puLgfAsFhavp8bKW2Wv9Pj2wPyt60oqS3BwhCJVgffwQki+8zqsDz8NFzK1u54zun33+Je2xkcHalrHKf950cJA0ViP4mI+bJCBIB1W4MuufcbupFJF8XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935905; c=relaxed/simple;
	bh=zpXYfY43MWE20JY55PYQ47I88UROYU5vBoOP/tE7wBM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q9bzJv7qsNdQuzOVA6/3UCc30S3Ro5l/xm74FdNC2F9vg2gG0SZ6nhFPtGFu3Djn+p7HuZ7O09xg00oYHZIRRi1XYUIr27aPQdNV/ge+5wR4GBw77M14XGLsOtCXO56e/hNTQRTWkPrJpFZ4j+PFp5z4wHRR8XKylPAkzl1NZP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BnEfvFZy; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BnEfvFZy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjIGKRfX59fWuVZierPtzaWCGSAPLzbJS0Qodcs4aeg3lm+oReDvY3Aeaie5gBhEu269YWBZN9pVhsmKOnZGZJGIt2BjJYDskBBGtDA5gtYnCH5Gjhs365guhUNeow62yByvXyelSDNPLbAHdiTg7vYvwvAC+A1em9xIsG/9l6K1Jj+PtXarWLMxvS8Njp4fqWCCEUL1qCq6FiahB/hdDDM8cecAOKGIP4iM8ujUdDdJcu8yvUJBm13HWtBqRXHOh5QeVhSpGiVx2M7Veq5iOLKjLuzwjq51ldUE+7gMBqLZXMNXsv+4MVfkBlYVwHydVPcKg2ucCeUKBQs9zbXTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkgPjiKRxzMv0h+3GYYPzKQxsPMG53NX50Ac6YnnC4c=;
 b=uPD9igIutWADCM6l6yuAchTj/7w9uuGsQ6oRAytVzx9BN8NRRymnuYaPvg/OnptjG1OHGf83YBUVGVPY+0GsT1+ggMquu5sxOVBr09sGFNbWDmJ3ebHy/SN2jTaZ9j8FX6lTLkrernFVfEXOhoOtZm24QSMdt2SpDO4FRCU9CIJyEJ7RIoxbVSRtWhyg1aVNhH9p8yaB5N58GhpYiDZN60MgIXMR08ke2neuLnlIbgyH99O8786vxmi+QoDC68MBaZeEBBPr4mRh4mn9NnPd4fwGjdSzUug9lFRmAoM9ZuyhPKH2Vpx3zwam1W7/0rhL+2YPdYy7HQ05E9/5l+sidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkgPjiKRxzMv0h+3GYYPzKQxsPMG53NX50Ac6YnnC4c=;
 b=BnEfvFZyMzK7I/iHMBN4PAd+jD4/hxiGdc/FkMxtpVACts7bzXyEPCMMTgzmzxHjj2LLUT4kJRCFJ+T++FSvyLgPiYlZbDi8+sXNgypMIskpXWFc4HhQqf8qJejzg1S7v1QMZbL7eAsBrJutv++Z7le0vLXWbFlyNDtyYMbKJs35u11YnJFgnUYGbvZHIC8WikwX6TlmMzSYn88OmIxO3x/B6gDoVsYxcMMxAh+rEhsElEggf58q3pFBAgHyH1oggjHalYjSv3brvVG/6nDwgG5+CuzN939GbuGc3SZMof4j6VgYOa2pCiiWE0ztFpwCrUftH0lhs3bwTLxtNG2SuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 13:45:00 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 13:45:00 +0000
Message-ID: <f09cafe8-6e63-4279-8215-be473ab37f6b@nvidia.com>
Date: Fri, 7 Feb 2025 13:44:55 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Fix a use of uninitialized mutex
To: rusingh@redhat.com, thierry.reding@gmail.com, airlied@gmail.com,
 simona@ffwll.ch, mperttunen@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206155803.201942-1-rusingh@redhat.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250206155803.201942-1-rusingh@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: eada8811-fccf-4871-ec22-08dd477d9dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGVPTVhoV1NqZkh3ZVhGQms2SkFlcU5NL2dicm8yNWVkc3JieWZvTkRzRUZV?=
 =?utf-8?B?dDQwOG0zRWY1NFZ0WmtDWGV1MTdPK1h2UDdQUVRBZlBWSENOMkk0aGtSMXhP?=
 =?utf-8?B?aTFtS2ViaUJlMHh2Tit0YmRHQjM1RUp1YW5WcjIxSXJRZmxNQWlxU3NJcFFy?=
 =?utf-8?B?SlZqWHRXRjNxZDNtSVVienM0VXAwbHZQV2ZpZ2V5TW9KQ1I0Ym8rbzd2Nno0?=
 =?utf-8?B?ZGZIMFlPZjkzVEhVdzdldjFjbytudkZOelpFbG1MZmRDRWg3SmkwNjhZVGNE?=
 =?utf-8?B?TjR1UlhWUno0YVV0a1RFWlppZ1RvVDRGcFpCMVNKOG5QeDdEbVZucU1jUW9n?=
 =?utf-8?B?aGJOL1JjNTRqdjNOWDAwTlh4aHVQYVk0TllzZ0xvSXVmTjFSSU1OcHNlSWtF?=
 =?utf-8?B?SExqWDJ0SGd2c0MxY1F4ZXFybHV0dnBNYmFxd3FiR01RRXZtbFdCRUVSMVpP?=
 =?utf-8?B?cWJVd2FINDJOaGRUZ2NidXdSeS9sVlRMelBFVlRIemNuM0VtTy84SzBWbTda?=
 =?utf-8?B?ejFOcXFPM2dIZGhDWW51RVdNTFdrVG1RbEVaS2VqQTdiZHBHT3FWZmVTY1kz?=
 =?utf-8?B?eXVWNW9nT1NaT2FhS2lkakJyVlN2ejdXa3gva1hldzE0MlFzQ2FNRWhoS0tI?=
 =?utf-8?B?Q29DL2dvQVQ0cWNMbWJ1eDcyQTFVWGNvK0tFVzJLTThkT3VKZVZvTnd5aGhP?=
 =?utf-8?B?VFAvNWh4Wk8vZ2VaLzdoRWljcjkwTFhNcVhqdGcrVC9RZjJJNGV0VGpWRTNO?=
 =?utf-8?B?U2VRTmliM0ZrQnVJYzJDOUFCYXc3eVYxbHlTL3JPQ1FrNVl5dS92ZC9Bc1FJ?=
 =?utf-8?B?aWtpSzBCZjNXRVJERFBYN2hxTm5JVURqZmE3M25sTmozZnRwakFFVlhkcytN?=
 =?utf-8?B?QklqL1lDK20xV2dvTEtaRlpiVmFnYjRBSVQzSnRwcGVTbXgzZXg4d0NSQ0FW?=
 =?utf-8?B?OTVjeG1WcGIvc3JQYUFucGFzVjFkVVpMRzNjamQ2MzhISWY2dG11WUdaSVU5?=
 =?utf-8?B?WlRFN0FhUzZuVDc2VlVPbGVzcFgrajQ3YkFMME8yeXJHaDh6NzcydkRKOXJy?=
 =?utf-8?B?R3NsOXdNMk84V2txdkVYWEM4anY1QjVOSERaaUJLWXdCTko0RUFnMlN4SUdr?=
 =?utf-8?B?NVNiRkI1TndqQjVqckVVS2h3OGltZ3dEbUN6RUFCVGJsR2NZUWVYcnozR1Vu?=
 =?utf-8?B?ZXA0NEJiV0RsOGFrMXkwUnB6by9ZSU5hNFNHdWRIcEdhTGRkTFd4RDRrZWJI?=
 =?utf-8?B?RGFYMlFBSTFkSnAyOHdoUkxvSlpZbFgwVnpablIwS0hnNHJKMytkZnRQSzFM?=
 =?utf-8?B?YThRZDB4MmI0SkcrVTYxZEE2cTlPamRNU2NMK0t6RHpOUHBVMkNnb0RKODRE?=
 =?utf-8?B?N0pjK3h1NG1YWnZFVlZSU2dJd2FGUWxtZGZvYVNJeUJzM0lzVER6QlRIcG13?=
 =?utf-8?B?S3FjbFVPYW5rQmFiajB5QVZsQkVyMXVXV2lQNEhnTkVZaGRnZmtGTjV5cHNz?=
 =?utf-8?B?b3FiZGh0S05sc040V0RNUFAyVnUwaVNlb05BTVdBSFEyY1RTbVlKZTBjNHZj?=
 =?utf-8?B?bHcyWmFxSTl1R3loeTNiaEkvVFI5TGtySXJiRjdiWXVCUlNkTkYvVkl5RVZ0?=
 =?utf-8?B?MGNDZTlkVWhuOC9HQkJ1c1kxN0hNbWxEY0NJdXpaYmFkWU5wN2tKVVdxOHdM?=
 =?utf-8?B?dUg3MFdhQWFDWklrTDd2TEEzOXNseDhsb2M0aTN4VHVsdUVUSmc1dGZBbzEv?=
 =?utf-8?B?ako5TXhyM003aVBBYzl1Mm42ajVVbXBPVVppc3duMHZBZzNzKzhrdlhqenNh?=
 =?utf-8?B?TzJUbVU2Q1p3TEpISHBQVWFVZ3pVa294dVJYbzNqNHJQVGZZQU5MMEEwMGdu?=
 =?utf-8?Q?ZpBW0U6RJCkxU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGlZd1NOR0Vlb29VL0xYb3NoZkVHY0VOYWxnL2dNbnhUc0lSemttcldBMDhq?=
 =?utf-8?B?eU1lbFExV2FJalRzNlpKWHlobmlzdXZOSWdlMWtINk83NmYyNkhwSCtURUJC?=
 =?utf-8?B?TEtCelRnSlZFTVl0Z2hSREp6cmJ2Z0s3M29jSytNMnUyN1MrTEVKTnRWVnVp?=
 =?utf-8?B?V3pmR1lrcFVHMElTdlBEait0TCtVeUhoWW5iS2RWZEtiV3JOWGJPdmhjNG5T?=
 =?utf-8?B?RGc4V2dsOXUvNVNEZ1BmZExGSmhUR2ZlVk1hYjBPY3RpUXNoYm9RTy9CUmcw?=
 =?utf-8?B?OFZmZ1FZY1FjWlhoYXpVMXdpTzhUZVRTUGtUNHZKak11azE1NDZRS0hJVGVt?=
 =?utf-8?B?N3d5c2JQbVZGdkVaOXpaMFNCNm9FMUcyTEtJRmluaiswaHlUbnZBdkdrS2lT?=
 =?utf-8?B?d1NQa3FJall6Y1pvbEhkTG11VVVBSFk1Uklnckc3dFV5b0p5ZEF6TE1Rc0Nx?=
 =?utf-8?B?UmRITzFrelRtMG8vblJESk0wNW9tMk5DQWNua3N3dWwwZm5mUWV4OHVrQ0JG?=
 =?utf-8?B?RS8xOGpsRUpUMkF0c3NjcWYwdUVEWEYvT3ZZWlI3YzFVLzE3K1ltaEZqV2RX?=
 =?utf-8?B?aWxaL0NMWHZpcFRSNTJyZDZzSUVaWTIxdHJTakM5bTFnNWpTV0hUZjJGWmJ0?=
 =?utf-8?B?MUs0anZlRlUwNGNBelk4SUgvQXBtWmx6NkY5bFpPUlIyR1hQT0J0M3ZIdHVK?=
 =?utf-8?B?Smhya0Q5cXE5VzdUZDVCVkJvYzhQbklxTFAydk9KYWlDOVpuWS83elJNRXll?=
 =?utf-8?B?VXlnODhMRm1TMUIvWWhtRWFuQVVMMjRpNTJwM01LL1ljNERtWGZ5YnBBVStQ?=
 =?utf-8?B?UmZpZ01XdmdrcVN4eTR6STYwL0N0aFZIaWhhSlYxVFVsS0pXbC82bitvVGFp?=
 =?utf-8?B?clYwWXViUzA3SVlZanFaaURiL2NNRnpHYStNZlZncnU1WE1wVzJnMlZmMTFR?=
 =?utf-8?B?VExVdHZWaGZDR3hsMGNvcXRHTksvOE54M21EcS9hRXFCRUNPTExFd2RXc2w1?=
 =?utf-8?B?U3NoSXNTdG5hSTkyQmVqNEVJWGh3MlZGTmFoeXdFRWo3T2dpQ0hPRjdydmlH?=
 =?utf-8?B?ZmhhbmxSS2MvdjNzSUtrVllwcFRzdFBqQUM2d0hXaSszRjdKQkdnVnZET3FE?=
 =?utf-8?B?NEtxWGFXcUsxSS9DTUl3WWl1TXZ0WnZyQjBIV3BxYTJUbnZNdHJjdVVLQlV0?=
 =?utf-8?B?WjEzK0t2a1NDTmJndDJaS2IwQS9HN29uUzBOLzNRTFZJYlpBNDQwMHV0ek1K?=
 =?utf-8?B?SFZiKzhRUERJWWVLMUl2enpMbnNpSlhrb1RNZVd4ZmxkOU94RTl4ajRkaVp3?=
 =?utf-8?B?TzdOVFhLMjJTYlNCTGRIV2tPUm82UXZLc2ZZYkgyZTh1cE5DYlBCQWM2WURw?=
 =?utf-8?B?bWdiSkNBbG5hWXRheVYxTW1rZWYvcVdhMnRQRFpmWFh6WTByN1B0YWJxb2xr?=
 =?utf-8?B?YXNram05Ky9ONldrY04wZEcvT1BNQzJUb084a1hCL1ZqRGRySXppaE9qc2N1?=
 =?utf-8?B?Rlh0Mm9jVCswd1FXa2xkb2U2WHd0NnloanZPMDFIRHJHMWlPdzg3VTk5V1Y5?=
 =?utf-8?B?QWFpZ1JKNXF4TVd0MVFjZkE1YkxFdTJYbXF6WERWazkzZ3JpUjcyM2NIbEY4?=
 =?utf-8?B?ZVNTU0UzS3dtd1JzNU1UYi9OZDF6ZWdUVmJPYVpPa1RCTExrUE14RitrUGlM?=
 =?utf-8?B?aTJ1emQ4Q2wzTENuM0VzN2dsN0U4TEphb3FoU0grcGRabVQ1eEJlalppcFl0?=
 =?utf-8?B?NE13aERGay8vaXFNcTd3b0RWWjBCK0t1emdoYzJNaVlBYjdJTW4xTlFzNkdY?=
 =?utf-8?B?T3VMZjZoZnYwNjVZbkRuSEhGUlZCWnA2TU1EekNCQlVZN2hTUkFpVG40RXhu?=
 =?utf-8?B?K1F6UFYyNVVaNWRDTFhYMzB6OGVGdDhiNjJheEVKd1NzMnZPdjhIUG1GSXJr?=
 =?utf-8?B?VWVuMFdZbUIraHdBYXZyNUFZU2tYNXBPSzlXaFQveFF0dkNoOUJtS1lVRytl?=
 =?utf-8?B?N3ZRWGdwNlJiSzRwNlJ6SjlOTHlUcUwrTzcycGhKT3BnN2R1aUpRSWtXR0lh?=
 =?utf-8?B?Q0VCelRwWm05ODdqR1JNWS80TlhaUG8yejFSaVFxTVIxdlRkdGNHeURYOCtl?=
 =?utf-8?B?Wm9UaEtScFVEdTVjclJ4MVJVRFRQMk1qc0JEcXlmQytRUE5yaFE3ditNWnpq?=
 =?utf-8?Q?QWNcUaW4Zc41BcjS5P38UOvsWHJJjvNoSoQvc7EearBt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eada8811-fccf-4871-ec22-08dd477d9dfe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 13:45:00.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEUjdRW7ZHx1CgFSYkJb/lY5loWXjsdsoDslGJjQEQR41OP2Fgif9n3UUnCG35UqN8TrH8QiW5Qmr3laxvXE+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962


On 06/02/2025 15:58, rusingh@redhat.com wrote:
> From: Rupinderjit Singh <rusingh@redhat.com>
> 
> commit c8347f915e67 ("gpu: host1x: Fix boot regression for Tegra")
> caused a use of uninitialized mutex leading to below warning when
> CONFIG_DEBUG_MUTEXES and CONFIG_DEBUG_LOCK_ALLOC are enabled.
> 
> [   41.662843] ------------[ cut here ]------------
> [   41.663012] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> [   41.663035] WARNING: CPU: 4 PID: 794 at kernel/locking/mutex.c:587 __mutex_lock+0x670/0x878
> [   41.663458] Modules linked in: rtw88_8822c(+) bluetooth(+) rtw88_pci rtw88_core mac80211 aquantia libarc4 crc_itu_t cfg80211 tegra194_cpufreq dwmac_tegra(+) arm_dsu_pmu stmmac_platform stmmac pcs_xpcs rfkill at24 host1x(+) tegra_bpmp_thermal ramoops reed_solomon fuse loop nfnetlink xfs mmc_block rpmb_core ucsi_ccg ina3221 crct10dif_ce xhci_tegra ghash_ce lm90 sha2_ce sha256_arm64 sha1_ce sdhci_tegra pwm_fan sdhci_pltfm sdhci gpio_keys rtc_tegra cqhci mmc_core phy_tegra_xusb i2c_tegra tegra186_gpc_dma i2c_tegra_bpmp spi_tegra114 dm_mirror dm_region_hash dm_log dm_mod
> [   41.665078] CPU: 4 UID: 0 PID: 794 Comm: (udev-worker) Not tainted 6.11.0-29.31_1538613708.el10.aarch64+debug #1
> [   41.665838] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS 36.3.0-gcid-35594366 02/26/2024
> [   41.672555] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   41.679636] pc : __mutex_lock+0x670/0x878
> [   41.683834] lr : __mutex_lock+0x670/0x878
> [   41.688035] sp : ffff800084b77090
> [   41.691446] x29: ffff800084b77160 x28: ffffdd4bebf7b000 x27: ffffdd4be96b1000
> [   41.698799] x26: 1fffe0002308361c x25: 1ffff0001096ee18 x24: 0000000000000000
> [   41.706149] x23: 0000000000000000 x22: 0000000000000002 x21: ffffdd4be6e3c7a0
> [   41.713500] x20: ffff800084b770f0 x19: ffff00011841b1e8 x18: 0000000000000000
> [   41.720675] x17: 0000000000000000 x16: 0000000000000000 x15: 0720072007200720
> [   41.728023] x14: 0000000000000000 x13: 0000000000000001 x12: ffff6001a96eaab3
> [   41.735375] x11: 1fffe001a96eaab2 x10: ffff6001a96eaab2 x9 : ffffdd4be4838bbc
> [   41.742723] x8 : 00009ffe5691554e x7 : ffff000d4b755593 x6 : 0000000000000001
> [   41.749985] x5 : ffff000d4b755590 x4 : 1fffe0001d88f001 x3 : dfff800000000000
> [   41.756988] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000ec478000
> [   41.764251] Call trace:
> [   41.766695]  __mutex_lock+0x670/0x878
> [   41.770373]  mutex_lock_nested+0x2c/0x40
> [   41.774134]  host1x_intr_start+0x54/0xf8 [host1x]
> [   41.778863]  host1x_runtime_resume+0x150/0x228 [host1x]
> [   41.783935]  pm_generic_runtime_resume+0x84/0xc8
> [   41.788485]  __rpm_callback+0xa0/0x478
> [   41.792422]  rpm_callback+0x15c/0x1a8
> [   41.795922]  rpm_resume+0x698/0xc08
> [   41.799597]  __pm_runtime_resume+0xa8/0x140
> [   41.803621]  host1x_probe+0x810/0xbc0 [host1x]
> [   41.807909]  platform_probe+0xcc/0x1a8
> [   41.811845]  really_probe+0x188/0x800
> [   41.815347]  __driver_probe_device+0x164/0x360
> [   41.819810]  driver_probe_device+0x64/0x1a8
> [   41.823834]  __driver_attach+0x180/0x490
> [   41.827773]  bus_for_each_dev+0x104/0x1a0
> [   41.831797]  driver_attach+0x44/0x68
> [   41.835296]  bus_add_driver+0x23c/0x4e8
> [   41.839235]  driver_register+0x15c/0x3a8
> [   41.843170]  __platform_register_drivers+0xa4/0x208
> [   41.848159]  tegra_host1x_init+0x4c/0xff8 [host1x]
> [   41.853147]  do_one_initcall+0xd4/0x380
> [   41.856997]  do_init_module+0x1dc/0x698
> [   41.860758]  load_module+0xc70/0x1300
> [   41.864435]  __do_sys_init_module+0x1a8/0x1d0
> [   41.868721]  __arm64_sys_init_module+0x74/0xb0
> [   41.873183]  invoke_syscall.constprop.0+0xdc/0x1e8
> [   41.877997]  do_el0_svc+0x154/0x1d0
> [   41.881671]  el0_svc+0x54/0x140
> [   41.884820]  el0t_64_sync_handler+0x120/0x130
> [   41.889285]  el0t_64_sync+0x1a4/0x1a8
> [   41.892960] irq event stamp: 69737
> [   41.896370] hardirqs last  enabled at (69737): [<ffffdd4be6d7768c>] _raw_spin_unlock_irqrestore+0x44/0xe8
> [   41.905739] hardirqs last disabled at (69736): [<ffffdd4be59dcd40>] clk_enable_lock+0x98/0x198
> [   41.914314] softirqs last  enabled at (68082): [<ffffdd4be466b1d0>] handle_softirqs+0x4c8/0x890
> [   41.922977] softirqs last disabled at (67945): [<ffffdd4be44f02a4>] __do_softirq+0x1c/0x28
> [   41.931289] ---[ end trace 0000000000000000 ]---
> 
> Inside the probe function when pm_runtime_enable() is called,
> the PM core invokes a resume callback if the device Host1x is
> in a suspended state. As it can be seen in the logs above,
> this leads to host1x_intr_start() function call which is
> trying to acquire a mutex lock. But, the function
> host_intr_init() only gets called after the pm_runtime_enable()
> where mutex is initialised leading to the use of mutex
> prior to its initialisation.
> 
> Fix this by moving the mutex initialisation prior to the runtime
> PM enablement function pm_runtime_enable() in probe.
> 
> Fixes: c8347f915e67 ("gpu: host1x: Fix boot regression for Tegra")
> Signed-off-by: Rupinderjit Singh <rusingh@redhat.com>
> ---
>   drivers/gpu/host1x/dev.c  | 2 ++
>   drivers/gpu/host1x/intr.c | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 7b1d091f3c09..46cae925b095 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -619,6 +619,8 @@ static int host1x_probe(struct platform_device *pdev)
>   		goto free_contexts;
>   	}
>   
> +	mutex_init(&host->intr_mutex);
> +
>   	pm_runtime_enable(&pdev->dev);
>   
>   	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
> index b3285dd10180..f77a678949e9 100644
> --- a/drivers/gpu/host1x/intr.c
> +++ b/drivers/gpu/host1x/intr.c
> @@ -104,8 +104,6 @@ int host1x_intr_init(struct host1x *host)
>   	unsigned int id;
>   	int i, err;
>   
> -	mutex_init(&host->intr_mutex);
> -
>   	for (id = 0; id < host1x_syncpt_nb_pts(host); ++id) {
>   		struct host1x_syncpt *syncpt = &host->syncpt[id];
>   

Thanks for catching and fixing this!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

