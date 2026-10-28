Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156919;
	b=C4gLv6BMNjw5IQJgZt/yipvBSxKLJZxYlahkxtEQdcdu5RELzdMLDdkhk1pXLhmlKomU
	 jDVWbgTdRZvHJj3Va+D5Dd3qH9AZAL1287FJF2SRjFv637BZzKROQ6xXi8X38RcegHrwH
	 UIYyV8RUplNSX4i3LMewLwVCMIna45COJ5T1hmNBtA9cfr3I/naKTwekzEnzj2Vt5aCvv
	 q4leFAiJcHsB8r2E8gf6NKJTuQjKDt9PUYF99CPOr1Jp5d9lXvvonxxLiSSgsrFb/9poi
	 wcj8pRJu1EjxhP6gYlqPDPmvQ9k5ICXglSnNb2y6eQPAB/8yOSq8yw70TgptDv+Qhvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156919;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=nxCeItTMiq4d2Z0z0SNvS5E2fkrzDAA8xlG0krsPT9k=;
	b=pmfTq2X5wGuXQXpO2i19VJ2hiOnuCxs1uxRp2OEWMA1jjM8tXixF/ypsj1GAd3jBtke1
	 XcLSABQRqD1EXOYoPzWJFBE7akeUNkShFelezNbWqgoUKWvTI3mIya/T6ohASsprFGto8
	 hE+Mc00N0yUQBn7Oag82veEZdokI8downCuwD2AXTjCbXZo2U130O6hS4Ls91TMm7c2ns
	 Nn56Gwt77VRt1EZ6zs1/9kSCFSAzWlZ8mcizKn4iahQT2fqoGcJdq9KmbUQ2j/6zd3ssk
	 uw1Wh9G+HYODnmdYd47Fvyvb0nGQhzkpQuYB42qmdBmOjTGfv69+D7ujXBj7b0MbYkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="WphuB1/P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.14
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B4606A320;
	Wed, 28 Oct 2026 03:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WphuB1/P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1a31q4QqHR9fLzckcLdtBOX+Rzb8cpKXvuzBPE+FqhnnCL9VNBb/4csXt+A5l5XpFY4jpYe2NO48BszF5Gxgn7NtjdEEvW89bkl+RDy+ht5JXaR0jYbTe4RsttOY0gnYsY0eECbZ/uifx9I/YTm5JDTnwTWFkjDfAaCwK0Heq4cO8BarLGj9I7wiawqrwe4+LYFxh1bIeSFs3PYqNKPkCoxHtbVw2qqCPFfFq5Mn6V6KKazLLjgPd0akfKeOaG3yxU2fIhK8kwsguw3XCyOyJSpwNQnj1AfCPrszkTXGO/oBJLdGdf8nA9nOMHRg2jwkECRQXEo/Y45CO3t0lNtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxCeItTMiq4d2Z0z0SNvS5E2fkrzDAA8xlG0krsPT9k=;
 b=ETk3/5McY2GF6UsXO6TJj6ZC+OPZxDCtCzwJZ3awPbnHaxQK2FCfTrN4cyhds5w0cr5AMrI1p4hVTDhwFLNzsUKeeKNw79lQkzBEue2riw9XHL3rzskwTFD7ftcA++BFHSlYnMitk2Hff4COCgogG6jMyQVtdrFoxv81w4Z8lvmQpQNxqkjoKTzNkWDP+R3b1HVb7t3oQuxoqvRNVB72Z3vsQ/IGxAdyAKTcUg3Z38vuoCjRGu7LmJVJd9jRurFZ3be9TyK4udaTxJbUGoc6NdC6xvZ3Zs4nNAednTv56tkvD9axGkRMOozxAO5IqRZcEVxC6/TRPa3CUK2ADO9+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxCeItTMiq4d2Z0z0SNvS5E2fkrzDAA8xlG0krsPT9k=;
 b=WphuB1/P6ToeT9vcFG8D1rUbEQA89h63/cjTtM0669ToVRE9fxqDf+6v0p2FPMq1a8/8DnHLsHqUevLmn3QaoScz7MXzy0CPvyEqoXkmCHL+oxeDBCLe6mX17UG2ziO5+KEpB7gwtpCj9iiA0La8dc+E1Q7PDcFqVfiSWmMmZEJPklOxpPchYCuW4FqGUqVXSkwzTiju2IT/4wAtHzJDrEQ7kNm5xCMXvNmGaqHF84vefM7tCWXIdsnHV3fOldp8ZM0xD2TVaqEMdH9hD8MOeS75QropONMiDuHUGPQO3+VntCyRphXZ1xzM1Gf5s/iRxskkARncVC9KXAg8+szqOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB7870.namprd12.prod.outlook.com (2603:10b6:510:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 03:08:35 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:08:34 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Cc: Austin Schuh <austin.linux@gmail.com>, Aniruddha Rao <anrao@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Austin Schuh <austin.linux@gmail.com>
Subject:
 Re: [PATCH v2] firmware: tegra: bpmp: populate debugfs in the background
Date: Wed, 28 Oct 2026 12:08:31 +0900
Message-ID: <2T-GACGvSDOWv7aIZ37w4g@nvidia.com>
In-Reply-To: <20261024055055.602558-1-austin.linux@gmail.com>
References:
 <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
 <20261024055055.602558-1-austin.linux@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:370::11) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba677d2-25b0-4c9b-27d1-08df34a0c0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|18002099003|22082099003|4143699003|5023799004|11063799006|56012099006|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261009223027099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	B8Kc+eU0kxTVfZEuzZfDY9+2+A6pzi+pNYpkyJ6U5H6hxG86szNz8MLR4EfnDmhS/PqnhTdnjd1grnNIhbC6IXPciOORUHo19EWAMW6S+KPGfcAFgczcW2lY2/rQIW2mYmUMYLtbI3RDYS9PZ1+cqjgp0lvnUuv5rjOrtG2qnNG/j3Dpl6Ojm52YpTog0VJkNPZ8xi3Pdy4Oy6S3Gs1Yytr1TL7ERS5Ne3P5bUeogblqEw/bcUuUY8GFn4r0g242nINyPalrpjEhITQ9whUzTP3qdmdsQw3hHezXpiBbzDjBaOOUXvUjiIGijsQGXcRfGXWQafGN3MzRQSD/hnsGLcUSTj9ftXjuHVjND4nhLk75v5Rqb2NgiWtwnOMPgrX7IL5UOXKfhbHTVp9W7Z9OMcOZ26zTapJKA5pIjPRLvj6NZC1eCNY+59gNXmhUVVJNpydUGGDvZ2bQoDlI30cFnem4CfQuVk0E95geicNDW35pUWEVwmDvfmOlmjpR8en6oqSAyA2ROxgo3kkLGXbI/YdaysUkZyozowywv0lHbz8sf6LIcKMeeGvlZ2rTdfXA+yi+Su3k6E6sYbwoV/lPQFVcAyDclD5GS8XIXWGX55X2FpHDiZ3lC49w5FFrCsqfNTIzNkqefXjTXdCxEsvBquEDHjc2JwTkgNj5E3HBnAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1QvUzFHNDlJbzU3cGI0QnJ3TDBkclVZRjd2a1J0ODYwREcxVjZtV0hOSzd4?=
 =?utf-8?B?ZmpEVDUwWlZ1NEdUSHJPK0plTEJzLy85RFdxQkFIUGZrZGcremdsMkVGaDVy?=
 =?utf-8?B?ZVdGM2o4OENtVGtzcDczTXNzd1Q3YzJyUFhpVVdhN1NMTEVETTMvV0hpeEE5?=
 =?utf-8?B?Sk1SRHZoNklVVmplOEdKRko2L2M4RlI3VktoamRHMVVCeFo3WnNIY28xbis2?=
 =?utf-8?B?WThlRFNKQU1DdzJIOFhDYmJ2NUtva2w2NnY5RnJOMDFwTmIxWEk1UjFDdEdz?=
 =?utf-8?B?aENVR2lXZjl4dWszYWRORDJxQkhxSnNkVDh5Q1Q5VGFGN2JHQWg4SjhjLzhs?=
 =?utf-8?B?V29JRW5ZTEdmTHVUM001ZXJORjlvZDExeGFXOCtLS0JOMDVFand1emdkRmwr?=
 =?utf-8?B?ZzRlQ0Y2bGNnR1RNaDdSMndnK3pFeHZYcDhITUlsV1c0NmM1dzI3YUg0SjZU?=
 =?utf-8?B?VWUyNjBieGdxZ1Z3UVpCZXdMa3JjR1dZdm5XaVNnSjhGMTNyejFPWHdzMzZi?=
 =?utf-8?B?NDYvcEhCQllUWUdPK1FmYnFOM01KaFV3YXVzRnFtMEV0TmZkYy9pYkRIR0tz?=
 =?utf-8?B?TTRnYWUzSW45QzZwUnFvUHErM3VaNEp6QzJ2R1dIWjZJT2ErRDRiRnRpTmJ4?=
 =?utf-8?B?dEhoVWhjMTdJczRpV1cwZlZoWmxrdmNheTBDSllIS0dGcnp6d3hMbjlBbGtt?=
 =?utf-8?B?NzBSOFBvYXk5T3M2SzB5VjlYWlh0VXBPRVU1VEtMZHMyRHFJcTBJWXB1a2or?=
 =?utf-8?B?T2VUaDQvRjZZRzlKbWxaZVpHVi9zZXArZHJZeE5nc3hDNnBWZFB2M2hnNGN5?=
 =?utf-8?B?UDNrTXBOczd4eWdQNkxrYUcwT1FGYXdxZVdZeVJ6Ymp2WGt4RUJPS0FKV3NW?=
 =?utf-8?B?dkxDTi81aUtVVm5mMHFHcnlKMm1xdFRjaUxoV2o4U1RqV3pXNWJoQ0pVcG5D?=
 =?utf-8?B?cXpWMFowYnJZZzMvWVFVaVVmVXBsWHp2R0RBYUVXR1pKemp5aWc2TUdhcms2?=
 =?utf-8?B?dkRja1g0UFk3WFRjek9wL0xJV0FxSlIxMTFPYU5FelltY3lmR0NFL1dQNWxk?=
 =?utf-8?B?ZkR3K3grSkVvYjlleENxdUNzRE5tV3pteWxFbDMzNk9FbkswSW1ERnB4U3Nl?=
 =?utf-8?B?TExXalZIem83d3lTUHRWcFhxcXFMZC9GMU1MSnNtZktjU1dlUFgxQk94THJI?=
 =?utf-8?B?dERUSmxyOHFXbWZETWpXSG1Pckh1TlBUUGxXTGFEell6NXRRQ1JrZkc3Y3VJ?=
 =?utf-8?B?Y1JZT3JJR2hlRlV6bVRCUVZ0ZkkrdnZXeElhRHFmeDRIczdPallEbFhEL0tv?=
 =?utf-8?B?TUZSQ0JVaDZyVGdUazVVcms5RWhrd3pWOFpyNHNKU2MrTXR3dWN6MW1vMHdp?=
 =?utf-8?B?QnBjcVU3NUJ2SmNyemZReHJkQ2UvaFBJQksvUXdwMlo0TXhBSW55VUxPeE5Q?=
 =?utf-8?B?ZlZvd0ZzaUxzL2FDamdoMGFJdnZMQVFXdkh0Q1IxTkdFekJreU5VWWJUVmpS?=
 =?utf-8?B?Zy9IeGt2dS9zMWliZWUyQ3BOM1BNaHRGN0QvaEhOODhEMlJJQmNrdWJKdGU5?=
 =?utf-8?B?RWkvaGVyMlM5cVZLRWFpT0dwN1ZnVEYzcTlnY3RwSVBYUWdYZGhRVGNyKzhU?=
 =?utf-8?B?K0tvRHBYS0RoRnBXNkxjc0dJaVZjejRLZ1FRUnF0L1F0WkxiM2FHb0VvMVpu?=
 =?utf-8?B?ZUQvNW1LckxScEJiRjF6azBNZEhHUGZBc2V5SUVhdTYrV3kydHhOcjFHMDcr?=
 =?utf-8?B?TjRUbDd0ckptVnpscUZhbS9BV0E4cjRZVWRTZ1lzaDF2VEU0aG5MdGJaLzVv?=
 =?utf-8?B?aFRuSGpwc1BFV09BcHhEM3Z1MWdESndDVmVyNzFSTGdGNzJNMjVIak8reEZN?=
 =?utf-8?B?SlZnMXhwWUhIUnZ5dlBHamFqL3ZmKzdhSVR2UXBWZU1xQ21vYy8yM2gwQStG?=
 =?utf-8?B?WGk4eUU5NTNMaUt6R3JwWWptZFJxT0hIcGxzV0RUblE0Zjc5L3Vta1V2dVFn?=
 =?utf-8?B?Q1MzajFFK2dWMUkxeGRPSHlOOFUyUTNCcGFMQ2lISVRzU1MvNHdzd3VkQlh3?=
 =?utf-8?B?UktRay9nQU5oRFdzYTBXT1JVaDZkbkxyQzFHWU5odFBXVzRCbDRWUVluRWh5?=
 =?utf-8?B?SFgxQTVjWG1yV1p4WnUyY09LNFBtalJsWkdsMXJyMHM2RDVXTFdrbWN5aEE3?=
 =?utf-8?B?Myttb1FEMFg3NFVSVzlnUklGeHI4dm1UVnExRHJjUE5RT2dSMUs2ekVBNjdo?=
 =?utf-8?B?eTI3UlVlR1NSVTFFMFMwTy9ZNHhKNm55T3JscEdWODY1MndwMzR2ZkUyeW9E?=
 =?utf-8?B?QmVLQUlLZy9BTXd6a2Y0RjE3aEsya0x1WnB1UDRqcVZUc0NReXBFZktma3M0?=
 =?utf-8?Q?XIrwhDTQCXQv53mD4LXWPrqLTSDN1HCnkfCdH0G0IjN1b?=
X-MS-Exchange-AntiSpam-MessageData-1: uG45xKdV+cbpwA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba677d2-25b0-4c9b-27d1-08df34a0c0f5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:08:34.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNMG5Yk6qvSyRDEcJiq0PPOsXfPuYSCM2AzPA81hVHHALa7vKTOvJB16yeFnxzY0cLBord+w8AqKGkjHqJRvaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7870

On Saturday, October 24, 2026 2:50=E2=80=AFPM Austin Schuh wrote:
> Populating the BPMP debugfs mirror takes a series of synchronous BPMP
> requests, several per directory.  On an Orin Nano (Tegra234) the tree has
> about 10,800 entries, and the BPMP probe doesn't return for between two
> and six seconds, depending on the L4T release.  Every device that gets it=
s
> clocks, resets or power domains from the BPMP waits for it, which on
> Tegra234 is nearly all of them, so PCIe, NVMe and the root filesystem all
> come up that much later.
>=20
> Commit c7fc690da6f1 ("firmware: tegra: bpmp: Allow BPMP debugfs populatio=
n
> to be skipped") lets a system that doesn't need the mirror turn it off wi=
th
> tegra_bpmp.debugfs=3D0.  A system that does use it, for instance to set
> clocks from userspace at boot, still pays the full cost.
>=20
> Nothing in the kernel uses the mirror, and the probe already only logs an
> error from it, so populate it from a workqueue instead.  It isn't an
> async_schedule() job, since kernel_init() waits for all of those before i=
t
> starts init.  The workqueue is freezable, so a system suspend waits for t=
he
> mirror instead of failing its requests, and the mirrors of a system with
> several BPMPs are populated one at a time, as their probes did, so that o=
ne
> failing can't remove the shared root while another is filling it in.
>=20
> The mirror is filled in as .debug-populating and renamed to debug once it
> is complete, so userspace never sees part of it.  Userspace that needs it
> right after boot can wait for debug to appear: the rename sends inotify a=
n
> IN_MOVED_TO event on the directory above it.  With systemd, a path unit c=
an
> start the service that uses the mirror once it is there:
>=20
> 	# bpmp-debugfs.path
> 	[Path]
> 	PathExists=3D/sys/kernel/debug/bpmp/debug
> 	Unit=3Dbpmp-clocks.service
>=20
> 	[Install]
> 	WantedBy=3Dpaths.target
>=20
> A Type=3Doneshot bpmp-clocks.service needs RemainAfterExit=3Dyes, or the =
path
> unit starts it again each time it exits.

No need to explain what the userspace can do. Generally please compact=20
and unslopify the above. No need to explain every possible resource a=20
driver might need from BPMP, or details about the patch that lets you=20
disable the mirror.

>=20
> Measured with initcall_debug on an Orin Nano running 6.18.39 with
> NVIDIA's patches: with an earlier L4T release, the probe returns after
> 1.2 seconds instead of 6.36.  With the BPMP firmware from L4T 39.2.1 it
> returns after 0.51 seconds, and the mirror is complete and renamed 2.2
> seconds later, about 1.3 seconds after init has started.

This paragraph is kind of difficult to parse. Please just say which=20
device and kernel you tested with, and what the change in time is.=20
A recent upstream kernel would be preferred.

>=20
> Assisted-by: LLM
> Signed-off-by: Austin Schuh <austin.linux@gmail.com>
> ---
>=20
> Notes:
>     Changes in v2 (thanks, Mikko):
>      - Embed the work_struct in struct tegra_bpmp instead of allocating i=
t,
>        and cancel it with cancel_work_sync() from a devm action.
>      - Fill the mirror in as .debug-populating and rename it to debug onc=
e
>        it is complete, so userspace never sees part of it, and can wait f=
or
>        it by waiting for debug to appear.
>      - Queue the work on system_freezable_wq, so a system suspend waits f=
or
>        it instead of failing its BPMP requests with -EAGAIN and tearing t=
he
>        mirror down.
>      - Hold bpmp_debugfs_root_lock across the whole population, so two BP=
MPs
>        are populated one at a time, as their probes did, and one failing
>        can't remove the shared root while the other is creating its
>        directory in it.
>      - Move the work into bpmp-debugfs.c; tegra_bpmp_probe() is unchanged=
.
>    =20
>     Based on tegra/for-7.4/firmware (1bbcf4a19f14).  Built for arm64, W=
=3D1,
>     no new warnings.  Booted on an Orin Nano with the same change on 6.18=
.39
>     with NVIDIA's patches: the mirror appears complete, with all 10,831
>     entries, and reads correctly.  With a 20 second delay added before th=
e
>     rename, the path unit from the commit message started its service 3 m=
s
>     after the rename, and the service saw all 10,831 entries.
>    =20
>     v1: https://lore.kernel.org/r/20261017065012.3063980-1-austin.linux@g=
mail.com
>=20
>  drivers/firmware/tegra/bpmp-debugfs.c | 67 ++++++++++++++++++++++++---
>  include/soc/tegra/bpmp.h              |  2 +
>  2 files changed, 62 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/teg=
ra/bpmp-debugfs.c
> index 2efc48b522ac..bfc13e990eb2 100644
> --- a/drivers/firmware/tegra/bpmp-debugfs.c
> +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> @@ -782,27 +782,30 @@ MODULE_PARM_DESC(debugfs,
> =20
>  static struct dentry *bpmp_debugfs_get_root(void)
>  {
> -	guard(mutex)(&bpmp_debugfs_root_lock);
> +	lockdep_assert_held(&bpmp_debugfs_root_lock);
>  	if (!bpmp_debugfs_root)
>  		bpmp_debugfs_root =3D debugfs_create_dir("bpmp", NULL);
>  	return bpmp_debugfs_root;
>  }
> =20
> -int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> +static int tegra_bpmp_populate_debugfs(struct tegra_bpmp *bpmp)
>  {
>  	struct dentry *root, *d;
>  	char name[32];
>  	bool inband;
>  	int err;
> =20
> -	if (!bpmp_debugfs_enabled)
> -		return 0;
> -
>  	inband =3D tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUG);
> =20
>  	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
>  		return 0;
> =20
> +	/*
> +	 * Populate one BPMP at a time, so that one failing can't remove the
> +	 * shared root while another is creating its directory in it.
> +	 */
> +	guard(mutex)(&bpmp_debugfs_root_lock);

This seems a bit overkill. We should be able to populate multiple=20
instances in parallel, just avoid removing the root unless there are no=20
users left during failure cleanup.

> +
>  	root =3D bpmp_debugfs_get_root();
>  	if (IS_ERR(root))
>  		return PTR_ERR(root);
> @@ -818,7 +821,11 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
>  		}
>  	}
> =20
> -	bpmp->debugfs_mirror =3D debugfs_create_dir("debug", d);
> +	/*
> +	 * Fill the mirror in under another name and rename it to "debug"
> +	 * once it is complete, so that userspace never sees part of it.
> +	 */

'never sees an incomplete state.'

> +	bpmp->debugfs_mirror =3D debugfs_create_dir(".debug-populating", d);
>  	if (IS_ERR(bpmp->debugfs_mirror)) {
>  		err =3D PTR_ERR(bpmp->debugfs_mirror);
>  		goto out;
> @@ -830,12 +837,14 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp=
)
>  	else
>  		err =3D bpmp_populate_debugfs_shmem(bpmp);
> =20
> +	if (!err)
> +		err =3D debugfs_change_name(bpmp->debugfs_mirror, "debug");
> +
>  out:
>  	if (err < 0) {
>  		if (!IS_ERR(d))
>  			debugfs_remove_recursive(d);
> =20
> -		guard(mutex)(&bpmp_debugfs_root_lock);
>  		if (root =3D=3D d) {
>  			bpmp_debugfs_root =3D NULL;
>  		} else if (simple_empty(root)) {
> @@ -846,3 +855,47 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> =20
>  	return err;
>  }
> +
> +static void tegra_bpmp_debugfs_work(struct work_struct *work)
> +{
> +	struct tegra_bpmp *bpmp =3D
> +		container_of(work, struct tegra_bpmp, debugfs_work);
> +	int err;
> +
> +	err =3D tegra_bpmp_populate_debugfs(bpmp);
> +	if (err < 0)
> +		dev_err(bpmp->dev, "debugfs initialization failed: %d\n", err);
> +}
> +
> +static void tegra_bpmp_cancel_debugfs(void *data)
> +{
> +	struct tegra_bpmp *bpmp =3D data;
> +
> +	cancel_work_sync(&bpmp->debugfs_work);
> +}
> +
> +int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> +{
> +	int err;
> +
> +	if (!bpmp_debugfs_enabled)
> +		return 0;
> +
> +	INIT_WORK(&bpmp->debugfs_work, tegra_bpmp_debugfs_work);
> +
> +	err =3D devm_add_action_or_reset(bpmp->dev, tegra_bpmp_cancel_debugfs,
> +				       bpmp);
> +	if (err < 0)
> +		return err;
> +
> +	/*
> +	 * Mirroring the BPMP's debugfs tree takes several requests per
> +	 * directory, which on Tegra234 adds up to seconds.  Nothing else
> +	 * waits for it, so do it in the background rather than hold up every
> +	 * device that depends on the BPMP.  The workqueue is freezable so
> +	 * that system suspend waits for it instead of failing its requests.
> +	 */

Something shorter suffices, I think --

  /*
   * Mirroring the BPMP's debugfs tree can take several seconds,
   * so do it asynchronously, on the freezable wq to ensure requests
   * don't fail due to system suspend.
   */

Or such.

Thanks!
Mikko

> +	queue_work(system_freezable_wq, &bpmp->debugfs_work);
> +
> +	return 0;
> +}
> diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
> index f55db918ccb1..f961c265326c 100644
> --- a/include/soc/tegra/bpmp.h
> +++ b/include/soc/tegra/bpmp.h
> @@ -12,6 +12,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/semaphore.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
> =20
>  #include <soc/tegra/bpmp-abi.h>
> =20
> @@ -103,6 +104,7 @@ struct tegra_bpmp {
> =20
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs_mirror;
> +	struct work_struct debugfs_work;
>  #endif
> =20
>  	bool suspended;
>=20
> base-commit: 1bbcf4a19f1495f769b69e9569d8c1e81df074f5
> --=20
> 2.47.3
>=20
>=20




