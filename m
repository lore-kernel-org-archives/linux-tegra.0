Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793609454;
	b=Nzw7OINec6t3uDiaFZ9z/U1VW75u5WIfCnFbO8ryLO+oo6shsrHkQH7iZnhbl/9r6mwc
	 +Q3O8AU713Rik3oFRBqKZhKavgLZbvZBrymFl1/wMUL+0ZDvRziQJZoXOg06yZNnKQSFh
	 jfHhPzGdUIpyhMI7Rk5BPYTncxz0uXo7XkMq7BVybZaj2TeEvificm819BZvcMssVWBBb
	 5Psx/y++b7li8NHDFSo405r/2aY/tXcs7ZlikKpCg8YeZP5ctfA7jzQnK7URcY255HT39
	 sNM773ig1R7BK7gMDEXRpGR21HhbonZbsTKFpV/8iRMU8FDCkMjB5w/KwRVcniLCtOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609454;
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
	bh=/nEDzpRaqJfZ9Xf7kF2+MjwDDPlNct7ZXftigWlLNPY=;
	b=C9Wa9n4Pwgv9l248vtPm1HBK/1F+v8pNq2QZ5vk3JiIbjcMMma555qFqEAtnNB4DOngr
	 PliP+9NmEUpx63c3Klhq27un5fYELrDDuFhaWM/YNIQBTu7Ga3aC5bzX+ZVnImxH8ZZz5
	 Rvu9unW0phhJQhuxnyZSnCpapCGSfjbHYKxIQIoRGTylURXL35vDcNwJMerAe3WENDrp0
	 mycwosebmRaiAcYvXGRnuTc4BHXlgSj0Cv73sjMGggMAJywaYnQ68OcmoxnS6IDABFIBQ
	 vlr7wE0RWJHzWgNpswBqYnLxZ8h+FlacpFgalGurOOCbC33VvOyzNJgyI77/WWmC9aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O2w2JMMB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.38
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A458C606A324;
	Mon,  2 Nov 2026 08:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A458C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O2w2JMMB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4aYooFL7ASbcllYq6KGmX82VAhGfdhFL07Yk8l2dqdO1XAmbeLtEbtzM/qofo0/MTCt/jRJsCx/iak2BsDpL0iXmvqk2jDaaV8w+wMYX+O5J0Zh4iK5fRzg3w0GLZEes17p0xVbylCuamD3BD7J3BdgRKmEe0Uf9qWZsfX+lbMER3G5Lkah5h1OsK52f1Liy2QmKrEANK3pKb95AgH0T3W4+qX4Ye4imyanDdn6Ha18bzm9QGuKEi/478eexLvKhrGwJxkWHeMMsVH4ULhXdhu5XDj3NPfYNm6GjYz69dF3WyFZkqSeOH5Rr50np83+33d7l76ATnlmY3zSqkDZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nEDzpRaqJfZ9Xf7kF2+MjwDDPlNct7ZXftigWlLNPY=;
 b=xXRI4GDBVaCsUwqvZUGakqX9V0UQnYMYEs81reamBOwSz/2tbBgOfqMhDhI5gBUCa/OxobrznLtikFU1PtNZnV8+/uXSFoA4FK+aTAlOexvbfqD8q3vuKmE0h2Wk6CgJhDWMVktQBaE1a5PoLKY7qMRcnmiNk3Oa8gMH2dM6FH09TbGesyRP30yWIMUO4/wLsZ4aJtyNB9lZaKoLGRl2sdNWJqAPlK3Is+U7USob2ZlgPPD2Qfv1njtstiYfxrKwOTyKIgJcCewMvBD3Z/13crGvVQZ4E3Nbe3DfIfXivT32hv+at21szPtPHWyAqaVuq1BGqHeHKWPNmM3SHNLk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nEDzpRaqJfZ9Xf7kF2+MjwDDPlNct7ZXftigWlLNPY=;
 b=O2w2JMMB5Jj2Pah2PdTT9Q0hC7Fs2MkrpK6O3N4iBZ0kszm7WZGMnIxdvslLYDohnlFheKPKLqr9c7NA+mp5mzk3yv8LVQE+vOn+OFXvADVDtI9C2LiGlRxlET+dORS2JYI3knZgjD71giQW2FQPeM3EPidZlTHgfkPzEKRKMC1YLr856LkbAx11fjTm5tSh/FB5aAYO0guJvwlSptTAhnIErCo/rWYUmxM0KILsUkZP5FVtuMMxMDFnmLUdGdmGUasvlcxY9LMvsUT4yjTIF/DF2UOOIQ6011ZSfnkcxk1Omi9kfS0arlSuzKjVSqSAtOW//pL9Flyi4e2vfNkhiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Mon, 2 Nov
 2026 08:48:48 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 08:48:47 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Aniruddha Rao <anrao@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Johnny Liu <johnliu@nvidia.com>, Johnny Liu <johnliu@nvidia.com>
Subject: Re: [PATCH v2 2/4] firmware: tegra: bpmp: Add Tegra238 support
Date: Mon, 02 Nov 2026 17:48:43 +0900
Message-ID: <2Hw2_7rkSLKRLbLEfioCFA@nvidia.com>
In-Reply-To: <20261028155000.1205739-3-johnliu@nvidia.com>
References:
 <20261028155000.1205739-1-johnliu@nvidia.com>
 <20261028155000.1205739-3-johnliu@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OS7PR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:604:250::13) To SJ2PR12MB9161.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 8edd3bf3-144d-49e1-80d4-08df38be1bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|23010399003|22082099003|18002099003|921020|4143699003|56012099006|10067099003|261009223027099003|261021123027099003|261022075727099003|11063799006|261021121427099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uEPyOtsLEVUjOuyaGxek238ZZyv2+XmgBueRRAhp3AjRQPquJJU8+S6UXYR5lLMF79zHW1K796i6mPcrcMh78twLzJQOXFIl7WwCMUP0QJrMfRf/r4C+otcAjjRIcD4TtKeVJyRdB4x+CGI2drSfaVrkFgh++++TVqGRIsN8IGXpiaktDc8UTA/Uv1I7e71VNh30We26ByNVWF1j87rBiuxHOWql8e64VJHDZ5lfUFHySpWCiqg3C9bSpKPN/KoVKJh9iURv9qOrGZ8SiutF3ylR1VqvXgmKXIsV7DpJPuUwGMtVgTXgVObCjpxOf6zvJuFHqW8xQEc6caIexoT0rzfFLNnDhi3dlfVRGIWmohQ+O1NQVothyBuPv4eSSOxKVhVH4b+bGseAU+LRnXx6S2yeWU30H6f9v3Q7/W9F5tvwOltEh9S3GIpZLy4vIattCIa1b/md6YyKoJzKen8+xeR38+099LaDhe0cv6GbqDlcVxMeynst0M9FCrN+7aR2BppJ1wdVqoM5Z4nb6HazU/gC2X0Rhy7lCrEXkvs1r6j5LqhLNbxKhoqVRM/AIj2mB4TCBtbJM9hGpKwkSbWsBMMipkO1OM3D1qzjMZrDOepbDq/j4Jd+wGyaXW3cJAL7vymW+5wE2qxDr795+IAvZAbAT7dgifDbznHCD41t5cIgAcOPJGxANYZ8T2N/Kd4wirXtypdgNFM0TMrXeV+w0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(23010399003)(22082099003)(18002099003)(921020)(4143699003)(56012099006)(10067099003)(261009223027099003)(261021123027099003)(261022075727099003)(11063799006)(261021121427099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ti95dHZ1bzdwaC9VQXZybWZHOHlhdmJXc3J1MEhNUll6cjVxOWVzZzJnRnJ5?=
 =?utf-8?B?K2ZWZmxkWWpzR3hoc1c5U2RVN2gzTERIOGUxUHVLWVE5WmpmMWJKbVVCRndI?=
 =?utf-8?B?cjVyWkVWWGxMS2pIVE5GL3doendyWElWelVvb2dZMXNzUjN2Nno5bk8yUHZS?=
 =?utf-8?B?dFVlcTRsd3VjQk8wbkxZOHhjK2xvNjVWNGlqYkE1bUxpZG1xcW1UYnB2N0ho?=
 =?utf-8?B?aXFRY0tpcWZ0aWk2SVhYVHFxZnRvWkQxTWh0U3oyY1pQRWplQVJBZyt6OFNp?=
 =?utf-8?B?d1hEaCtBOXM1dGdMZ3pBcEVlaDJ6cFkyOHZWV2R6Zmc2SjdJU2VDUjA5Mk1W?=
 =?utf-8?B?NjNvVUpob2s3cUlRL2JGcUJQTGU1WnZ1YnFuQzJGcG9vSzRRTXlFeVNQaGxs?=
 =?utf-8?B?NnN2ck1rUzNhUWlBZ3VNMzU4SHcrcThpMU9aakFWUzU0UzI2QzVNMnVDZ1Fj?=
 =?utf-8?B?SHY2bHk4M1lKNElsNEM1ZWZwT1UzTkxWVGZUNmx0bjZzSmpyc3E2eUh0RHVJ?=
 =?utf-8?B?aDdnVUx6b2JXa2NGOUtoVTV3R1NNWjZ3eVMvdUtZWVBRZjVvZHlBVC9UL1RI?=
 =?utf-8?B?eHYyNG1MSk5lWDVQRkVkRmVxcUJPS1RUZnlFdlNsQmUzQ1JtR2l4T2ZNZlp0?=
 =?utf-8?B?OVlldHR2Nm9MV3h3dnQycGR1SUlua2ZuUHJFeEhXWVNBM2hXMDIzaUYrMXda?=
 =?utf-8?B?VDVPVXlCcDRZdTFSOXpMOTZBcUQ2THYvek8wMlF3TWRxYmlHalIzNVlPK3Zl?=
 =?utf-8?B?bFZ4bUtVUnRhN0NBN0NUTlBYcnlDT29kV2tqdFFEVWZCWGJHYkdiZDllVXJ0?=
 =?utf-8?B?aHBpRFFKTjhHVWNUVm1INGFORm01ajJ3amRkNEF2MU1IcENEbFo1dFV0ZGJp?=
 =?utf-8?B?NklwYktmekhPQldOREh2MkdPMUU4azR3T0d0V1VzZVVlRHc0UEpDUklVSUVZ?=
 =?utf-8?B?VDZ2emw1OTByeWpVSVB3WkN6V3N0ZzBVS0E0Yk5YSnZ3ejhORkd2SWpkMGRV?=
 =?utf-8?B?OTJMQkpNSEprcVZ5ZzVhSkJoSzdKQlJzTXVRd3VuS3pqYTIvQkpneEQ2dGRD?=
 =?utf-8?B?dmZzNWtxUndRTkVBODdNNCtwL1ErWk04K0NNWFFMeVJYNjM2bnZsdCtzdkEy?=
 =?utf-8?B?R1RnaCtYSE9JU0V4R2VoMkt4b3pxL2RjRkpEMWdSdmxSbjg1SC93RktLWWUz?=
 =?utf-8?B?U0piMWlzY0pBbzdCb2cvck9xVG1tYUhXN3JBT2ZRcUJDcUNPQlVHWFZpZHdB?=
 =?utf-8?B?cHN0dEFzU1B1TXlXcHFaZXZ2em5GbHlubTkvSTFsaE5VSXVjNVdhZUg1SnBW?=
 =?utf-8?B?S0VIVTVlc1VxSmNYclVLZjRsc0QvSkJlcVFnZkxBeXZjVlhyYUIzd2I4SjBr?=
 =?utf-8?B?cHVyNERuL0IwTERsVFcyYVhEV0FSdWlQU0wxakdhUVBnRGUvL09uYWNpZlNQ?=
 =?utf-8?B?UU8zQ3dWSElEZkVXSEE4SUFxd3pKOFpLb1gxQ2dKcUpiVUlBczEzc3d5OVJ6?=
 =?utf-8?B?ZjUwSll3K3Y4ZXY2eGFNUko4ZXhDYXFBdGh2cGh0UEgvTmY0RGc0N0Z0L3dB?=
 =?utf-8?B?ZnloOUNYSWF2Mmhaa203ZjRwdloyZUJXaTlpUVZuK09ITmZXRmJpYVBrZndD?=
 =?utf-8?B?dFFxM3hXbmR6WnBGZGxZYzFuVzNOaEpEUEt3NE1FQVZQVmFweHF2dWhqc29w?=
 =?utf-8?B?T0NqY3dvTGxab0ZMcHZiZmlZekp3OTN5cXdPdERkVjBTUEhBZ0pMOWFvZ2dV?=
 =?utf-8?B?TElnRjBwWXBJZ01Zc3paaUlEVkdyOUtadFdva3lCTFk5cG9rV1pIL0hRcktJ?=
 =?utf-8?B?UHdKbmZraFpyOHR3dmxVWGdNc05sMksvRWVNMmNzOE5FaE0xTVVsS0lWa09i?=
 =?utf-8?B?LzYrNTJ2TWxTd25vSW1uNXZ5VVVqK3hRRkx3eXZBU04rZXVaRUxRVW5wUGtu?=
 =?utf-8?B?c212N2FCcFdaOCtyYWw3VDFFZ1IrOWtXSXp3bEJsRFU4cC9EZndaaW5iTnhy?=
 =?utf-8?B?YkU3MW5jejV1a1J2bFl4cUxGNUVQY3RMT29TWGRRNEtrMEtLRUd3NTh1T3FM?=
 =?utf-8?B?OXdNS0RRTjBQOWt5M3E4dXBZdGQ4Y3c4U1dwQThmYUdxSWVmc0JqcDJFR3NJ?=
 =?utf-8?B?Y3JBdXlCQ3YzWS9WWVZBM3BtTVdYeVZCR3cvckQ4K3RSQ3lqYnlYbWR2QnE1?=
 =?utf-8?B?Y2RPUlVNc29UL3dOc0VCL2p5ZlkvMlVrb2RnMW5EZUJtQmhTZ1FvcTFlMnJ5?=
 =?utf-8?B?bzlRVXlIS2N2SC9NN3RTd0h6dVRmbmdUTzZOSGJDMVNUaVcvZHJ1MEU2UEx3?=
 =?utf-8?B?OWFRVVBralRxQWlCa2JWREtvYW1Yd0hnS2tLZ3B3MEI3WlAwWHlNSGVyekRh?=
 =?utf-8?Q?+2LvD3KUzDEnqfa81aDbdBbsSzHM71/NMTqxezezBTWu+?=
X-MS-Exchange-AntiSpam-MessageData-1: 8wPMmCGKlKRJFA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edd3bf3-144d-49e1-80d4-08df38be1bf8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:48:47.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi1YPP3E6/zHp1I81YQVN+pxVWke00BE2jLnkiEsSyKubenboCLPc92ct3T0ESoxS/I5smWaQOE1jPJdpDgFkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298

On Thursday, October 29, 2026 12:49=E2=80=AFAM Johnny Liu wrote:
> The "nvidia,tegra186-bpmp" compatible and tegra186_soc data are shared by
> Tegra186, Tegra194, Tegra234 and Tegra264. Tegra238 has its own BPMP
> compatible, so give Tegra234, Tegra238 and Tegra264 dedicated SoC data
> selected through their specific compatibles, built on top of a common
> TEGRA186_BPMP_SOC_COMMON initializer. This allows chip specific
> properties to be described in the SoC data. Tegra186 and Tegra194 keep
> using tegra186_soc.
>=20
> Also build bpmp-tegra186.o and the shared match table for
> CONFIG_ARCH_TEGRA_238_SOC, so that a Tegra238-only configuration binds
> the driver.
>=20
> Signed-off-by: Johnny Liu <johnliu@nvidia.com>
> ---
>  drivers/firmware/tegra/Makefile |  1 +
>  drivers/firmware/tegra/bpmp.c   | 54 ++++++++++++++++++++++-----------
>  2 files changed, 38 insertions(+), 17 deletions(-)

This refactoring in this patch makes no sense unless you first read the=20
next patch, plus it has the unrelated factor of adding Tegra238 support,=20
which makes it quite confusing.

Can you move the TEGRA186_BPMP_SOC_COMMON refactoring into the 'per-SoC=20
EMC clock ID' patch, and have the Tegra238 addition as a separate patch=20
before or after it?

Thanks!
Mikko

>=20
> diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Mak=
efile
> index 97f7a5db9d0a..21e87f3afffe 100644
> --- a/drivers/firmware/tegra/Makefile
> +++ b/drivers/firmware/tegra/Makefile
> @@ -4,6 +4,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D bpmp-tegra21=
0.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+=3D bpmp-tegra186.o
> +tegra-bpmp-$(CONFIG_ARCH_TEGRA_238_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_DEBUG_FS)	+=3D bpmp-debugfs.o
>  tegra-bpmp-$(CONFIG_SYSFS)	+=3D bpmp-sysfs.o
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.=
c
> index d3508e98e338..beeb385870f5 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -1131,25 +1131,41 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops =
=3D {
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
>      IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
>      IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
>      IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
> +#define TEGRA186_BPMP_SOC_COMMON					\
> +	.channels =3D {							\
> +		.cpu_tx =3D {						\
> +			.offset =3D 3,					\
> +			.timeout =3D 60 * USEC_PER_SEC,			\
> +		},							\
> +		.thread =3D {						\
> +			.offset =3D 0,					\
> +			.count =3D 3,					\
> +			.timeout =3D 600 * USEC_PER_SEC,			\
> +		},							\
> +		.cpu_rx =3D {						\
> +			.offset =3D 13,					\
> +			.timeout =3D 0,					\
> +		},							\
> +	},								\
> +	.ops =3D &tegra186_bpmp_ops,					\
> +	.num_resets =3D 193
> +
>  static const struct tegra_bpmp_soc tegra186_soc =3D {
> -	.channels =3D {
> -		.cpu_tx =3D {
> -			.offset =3D 3,
> -			.timeout =3D 60 * USEC_PER_SEC,
> -		},
> -		.thread =3D {
> -			.offset =3D 0,
> -			.count =3D 3,
> -			.timeout =3D 600 * USEC_PER_SEC,
> -		},
> -		.cpu_rx =3D {
> -			.offset =3D 13,
> -			.timeout =3D 0,
> -		},
> -	},
> -	.ops =3D &tegra186_bpmp_ops,
> -	.num_resets =3D 193,
> +	TEGRA186_BPMP_SOC_COMMON,
> +};
> +
> +static const struct tegra_bpmp_soc tegra234_soc =3D {
> +	TEGRA186_BPMP_SOC_COMMON,
> +};
> +
> +static const struct tegra_bpmp_soc tegra238_soc =3D {
> +	TEGRA186_BPMP_SOC_COMMON,
> +};
> +
> +static const struct tegra_bpmp_soc tegra264_soc =3D {
> +	TEGRA186_BPMP_SOC_COMMON,
>  };
>  #endif
> =20
> @@ -1180,8 +1196,12 @@ static const struct of_device_id tegra_bpmp_match[=
] =3D {
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
>      IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
>      IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
>      IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
>  	{ .compatible =3D "nvidia,tegra186-bpmp", .data =3D &tegra186_soc },
> +	{ .compatible =3D "nvidia,tegra234-bpmp", .data =3D &tegra234_soc },
> +	{ .compatible =3D "nvidia,tegra238-bpmp", .data =3D &tegra238_soc },
> +	{ .compatible =3D "nvidia,tegra264-bpmp", .data =3D &tegra264_soc },
>  #endif
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-bpmp", .data =3D &tegra210_soc },
> --=20
> 2.43.0
>=20
>=20




