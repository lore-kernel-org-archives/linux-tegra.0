Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012055.outbound.protection.outlook.com [40.107.200.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE612629D;
	Thu, 18 Sep 2025 02:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758161140; cv=fail; b=W3GTrH7wmUQD8fyt01NfTAfChy296xdCdQy7oJ4abw/hNyawCT8TTU38Jz6tvnaGZfE7ZGT6YSXdDNsOVM8hW3rKEqbEnGcVyGYQFHKucXmZsQgKOutApbRYoJyInCLDmcOxekx8SPanu3KpEB+MSHJ/70XUf1K8yazBthHMUNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758161140; c=relaxed/simple;
	bh=MS2ZX9tnWVu+DO5qUmAoF7syBtv2tYyBvU7v50KpBhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rSBLEG798umUMZ+MoPmb0lBDya705ucO4Xh+zA49aQf6JJn9dx/giaIsJmvhptJP0KNKBBx/gv1SjwPYLg0RI/+UobhlS/IUEeWpj0pbTFu2P7kUV609zAAbbsXFfFdgl8aAWEnx1zkubarO5IV7HyxCntusJwz3F/Sj9abKSn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jZOpszCB; arc=fail smtp.client-ip=40.107.200.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jZOpszCB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPm9uhAaARC20YQ4Zo8CH2mevBDLXhom14rl5F+CyuTN1t5uWd1KbH3bG4fGhWA4x8DxSBZ0LTOAjgV9ze3EKgQsa9co1bF/Pmj9orb7GSQV8dvp03VxTzKq8A5DpYxFmL+XMLAmh7zT7idF5vx/r0Odwbde0tGDK207/xAfvXHLhE8W6cq8FGHCM9nd7aq79ovtsln+iLg8kEz9WCU+dv9IHSodWgGMkKOrM+J8o7J73QbxmiPkgAKl4epODwfg0XZao8nVKbtDGDvpTvoiybaB/PTeMIjIC2XcUAAMRhYW55nWByIwcr0aZiTnUdM8f3pEnKYgHM7qIhQfimy9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS2ZX9tnWVu+DO5qUmAoF7syBtv2tYyBvU7v50KpBhE=;
 b=ehaRhLXUOrdAFl8dw6yS+EuPV6hIa5L55wtU+M3sTB88W7G6u2im0zqynDJrzTPjl/sptP7MGQaMcLczdzj0BvY9eL0sGDpsI0tkPHMtVqCo4I+ocIjkB80Mlu6JXEmA/IPF1LVz9OXsHpn2LMP+El3hXinI+RrdEFyOq4EugzsyNWzOPgvrBre6ndlEsNaEicR8ha5BlpH00frVGe7PDphKbhiszWKu4foWkUOcNPlFan+5Nrp+qNmeQrm3+FLRPGPL1e2k4n/uShNoaeW2uogaPk6H6RhPls3WTAVXG6iWDnbfgKhDgF8HPJs881Ma6soMs0hbxMTnEdRT1anwtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS2ZX9tnWVu+DO5qUmAoF7syBtv2tYyBvU7v50KpBhE=;
 b=jZOpszCB1AE4VtaNMpAuheFiFwviaCTUMHJ6/k6Qn3e/4tkcbXoeSntsgiqaZxGd0/0shrjFeRshN1TdYDG2SzAjHZ6UZvtp3zkdmSUdQG3nZTPOuyM1Xkb7FLyfDdX4xBPC+OCKaprU7zvhI59oyVsJ0+GmTixjmHrkHevjjJI+myPjo1ew18iybB8cGJkoQDQPXMRPMvusrowLmdhfJ51Mc06l5i3n3tx2fjHva5ZrgfqB4xMIRK3Ej6NUGGqQ3ir0cycgGG6eq5u1S5OwDxpdRL49xiRhK/sjG8jNy/n7CXivdGeY7DQMMwvL6tL+o86KLy5cWwnOOrW4NGYumg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 02:05:35 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 02:05:34 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 0/6] clk: tegra: convert from clk round_rate() to
 determine_rate()
Date: Thu, 18 Sep 2025 11:05:31 +0900
Message-ID: <23306194.EfDdHjke4D@senjougahara>
In-Reply-To: <aL8O4HeQWm9b8FUn@x1>
References:
 <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
 <aL8O4HeQWm9b8FUn@x1>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::17) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 160d4140-ef2c-4c70-8d07-08ddf657daae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDNYSmUvOGJtd0ZLVDB1bUlNeWxzYUkxeWFPRFptK3BFRDVBQUNENXViYzRr?=
 =?utf-8?B?QkE2bm9KVm9mVys3bUo1Y2IrYkNWYmpkOFZRdkdtM01sSW5xbU5id1QwS3BE?=
 =?utf-8?B?T0RHRHZZaDd5UWRnUDdsbUlEa2V5Ry94b21FNjI0V3k3c3FJWjZSd0dnUzc2?=
 =?utf-8?B?YkJpbHdabUlNWHoyT2M5Rk9LZWl6V2lFWVhlQ2VJU1BkRzJ6aGJpZUNyeWtX?=
 =?utf-8?B?M001V2h1TGxGbTJNNmFhd21scytNcWhWVERKR1I1V3JJVm9VRGgvZk83M1h2?=
 =?utf-8?B?amlYMWtLU09yOVB3RHIzamc0R09aL2l1ZUthK1NIL1o3YWV0ajBYNTluN25i?=
 =?utf-8?B?dzdwL2FrdlBZMFM0aE9IVDNMZmtPN3hBdVp5TW90cEJ6Uk1hc1poZzJzM3BK?=
 =?utf-8?B?TjRpWGV2K05sdmdnK2xNbll6RWo4UDAyRmlJMEx1RERrMmdrMkNhQVVTS0Mx?=
 =?utf-8?B?Sm5ZSkh5QUZJV0hoU2JXcnZjeEdRbU14NVBTNzVPeDB6WHpLVG5TZHZOczR3?=
 =?utf-8?B?UkhON0tFV3U2M2cweDRlaEJsOURUTzRORTlMSit3NEg0UnpNb0xTbjFMN3lX?=
 =?utf-8?B?Z24xV1RMZ21iZXhvcXBnUmx5TjFlbmtaaFpBcGUwckxKVXlmN0tEMVZkUGw1?=
 =?utf-8?B?V3J5VmtZY0FKajVHSmxmN1NrYWttcHFKLzYzNmd6aUxPNnVQUmZKTnVoSHRC?=
 =?utf-8?B?RE84bUhFQ0RmRXVKb0Ywcjlta0VSTHhPRUd5Q01EQXhOTmFkYWdMR1FHZXBF?=
 =?utf-8?B?eUhnZ2ZWcVdzRm53bTRrekg2L3JMQVN3Y0VCc3h5MUdpeFFjU2VYMjhHbHRs?=
 =?utf-8?B?aXh2eHNMNDY0b096aCtXcW9BNDVQdGJvV0tOZmhUdEMrL1JoN0F3V3d3Zlhk?=
 =?utf-8?B?S3c3N1B3N21vL3RzSFdDbGlzcVJEa0JPVzBJaEY3S0Y3OHEzODIwbzlmV2hK?=
 =?utf-8?B?aVVxb3BEVzdPbCtxdGJESzdINXRoTDRManZVOGFIMytIYVArZWsxSUpZRzB3?=
 =?utf-8?B?M3RCSTJrSnFoNUZPdERHb05IUWFlcW4wa3haazU1R0NSL2NuT2V4RWwzakFn?=
 =?utf-8?B?ekRLSnBqbzUwUVVBdXFSWXZJQVMzcnZKNkxWbHFyTU1WRDJFeXRRMnY4TlZz?=
 =?utf-8?B?VEJQUHgyRUlWdXc1eHdyenRyMnZzRWRDV2VqUXVEUExnRW5sNkYveko4SnpG?=
 =?utf-8?B?NWt4RmNkRWUvVjliakc1bS8vdWZUV2VoeGR3TmdueDRMQWNPaWY0SVVqcGFV?=
 =?utf-8?B?Qm4yQ09wRXc2cGNQMjlKbm1mWGFDbDFrTFBqVzVXbVhZb3dYQk84Vk1VL05S?=
 =?utf-8?B?SHdOYVlhNkg4MG03UlF5U29IWHZIMzRoWWZIMndvNHRhaHQrU2M3NU9CMEFI?=
 =?utf-8?B?UTJjK3J1NVlnNVBzWUxWMW9PdzlhOXFHanNyTDRzTWhzTTZyeUh1c2kxblVy?=
 =?utf-8?B?K2hLVXllQU8rcVdPWjg1dU9McHVNRE5XR0w4Q1h6NGwzWjdEWmN4c3dUZjEv?=
 =?utf-8?B?V2sxVXdDcWYwK09vMWdmcDI0dkw3WjRQMHN6VEYxQy8xcUhpb2hVU2l2NFdt?=
 =?utf-8?B?TEN6TndqVHpWQ0k3cXMra2g4OGFoMGJVMTdEcFprRHZCcVhBcUtTRWRZSmty?=
 =?utf-8?B?VnYxVHFSWVNZZG41V1RMUzZKckY1bUI4SlFkcjY0SkV4aFJXc1Vodm1mNDhT?=
 =?utf-8?B?aHEwMW1UNnJlYXBxWWhhR3o4cjFnNCsxcmtTNElGUndxMzNWald2UHVJcGVl?=
 =?utf-8?B?VEVHZStTdU1iWEFFTEpTMGJ1TDRrcTMyZEhxVi94ZFRJMWpTUG9pMWVEbjUx?=
 =?utf-8?B?MFplK29xMzdaZEFEQTRLcUx3SXdqdGZmN3J5clcyNGF3MjlyTVdBTWUzWW5p?=
 =?utf-8?B?WXNkMGU4KzgzWXhUWFRvUjBQL3hhaHN0SlNsZDJzMjZpelFEZk9WVTRKRWR5?=
 =?utf-8?Q?MNoUHKp52Gs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1tWkIwY2hIZGRmU1JHNWZQK3Y0MGo1ZjQ3clZjQXkvV01LRjRYT3V4TXhE?=
 =?utf-8?B?THZ3UHpPdGRwYmhocWg2RmJDUjhjMFFwekszUHlUL2NLZTZJdU5sK3R6ZDV3?=
 =?utf-8?B?bTRHRkVFL3hKZ2s4Ukg3K3ZTOWdlVG85VWZOK2FFK1QwZ2hDVHo4ekJTczRQ?=
 =?utf-8?B?NVFpbFJWTXRMQ0owTlByMERVQXFKVXJMa1hlSjU5eFNzc2tQZU5sQUVHYWdT?=
 =?utf-8?B?NHBseVhXakZPbTBVbHVEeTVacWFrc0Q1ejJMY09EQTNTMW1kYlkyQk1OSkNX?=
 =?utf-8?B?dUFmUDB4SXJBc1RISG91eFBSUUF4cHhzTHo4cVErZWVZam84VlNkWGRzb2VH?=
 =?utf-8?B?REdBR1FLWnMxY09iMkhqUGt1OUlFNEJMZC8rQXkwRWp3anZPbzl4dUlyM0JL?=
 =?utf-8?B?eDdXT01naVpKRXd4eExHVE9PTWh4T2s0akxuTDVWN0pkN3RXT1BycmFWbTcy?=
 =?utf-8?B?L0cyV3JOek1wdXhic0JvUG92aDFnSDVpY21EZ0tGK3ZheHBZeC9kTDJpTDlL?=
 =?utf-8?B?KzdQbjFkQlhVY2F0SFAwUmN4OXljeTNoY1pZSUFYZ1dZc040NUUycEU0Um13?=
 =?utf-8?B?Z044SmxPeHB3MGd6Q1ZDcG8yVHZjS29xam90bzJZenFMRHJLOGRHN0NtQWww?=
 =?utf-8?B?NTR1SER5QU9HTk5CRGkrNzIzZXRJZjVjQkppdmtGSFBKRUNnTVdodThBSTcv?=
 =?utf-8?B?cUpkRUJXTEcvU25aOFJuWFFLNHlGTEJQQzJ3UFR3bkxVM3p0ZG9uSEs0WFBH?=
 =?utf-8?B?UndsSiszRUptU2pYL21mbTltQWJZVEM0UmhQZjcrNHQ4MllxSms2K0dVcFYy?=
 =?utf-8?B?citPNEZKUTBpd2VsRG56b052RG03VjIzQ2VhZU5VSkdiblVNN0JQM3RrdjZk?=
 =?utf-8?B?Tkc1am5rbHVmU3ZFS0UwYW9DZlNDaWdGK2tXUnU0akhlTUErekVZdTg0RW5M?=
 =?utf-8?B?TGZDaTFhZTFkd2pYV0xxcTFHSjJLa0FTQXliSTlidCtGSnJJZkYvQTBTQXcx?=
 =?utf-8?B?TmlSVXV6TEs3MTAwTUd0dXRvSGszb0wvbFZ5RHhscmpmbFdoSTNVUEFZYTA5?=
 =?utf-8?B?UnVxNTE1SjdVbGN0RWNxSjhnWHN6bEE3TlRJY0hUdWU0eDdlWDNZb0lndmRY?=
 =?utf-8?B?MXZ0dWhSU1VicHFIaHJKclhjZ0lBYThQV2NzdHFmNE1qVTViNEpNbVo1eTFw?=
 =?utf-8?B?Slc3cXZIZVdUMi9mOE5PZXdwRmVPRktMaXJyRGRZYkRvc3IwM21PajN0OVRm?=
 =?utf-8?B?T29JMGN1SWJsV2xTekd2UjZrMitndEJkMGQwSzlMV0NzeDFsVll5OE5sRVFF?=
 =?utf-8?B?UEtEVmZzSGlkdVFRZndoeFNqNFpObkhlZXVQYVZVa0xXL3BnaklwRlViSFRz?=
 =?utf-8?B?Q2RBRmY3TVFHckFLWGJRQzA1cHBUS1pJNURYSjVnTlRpSkxOdlJIV09EdDRi?=
 =?utf-8?B?VEFVdU1aOUJNS0h6VXhHR29mQVRvZTJNcUZKa3dPWXBzTVZLMjNwb3BiNkRT?=
 =?utf-8?B?VDVZRVpLMEwveFdUTkN1ZDkyNVo2VmxhT2JhY1hKY09vd1ZTYW10ZHVmMm9P?=
 =?utf-8?B?N3NqVk81aXhzdVZUbER3QXEySTE2S3BrNXBGZW9ISlcrNTZoV0JYVnN0b0FZ?=
 =?utf-8?B?a2swRHIySGNKbHE1UGlHQkdhcXZ1cEYxYkxIcVNWdG9Xdy8wcWpUVlgrWmN4?=
 =?utf-8?B?OWxxd25pclArT2ViTHZsUVBuN3Z5RU1WUUtXdjl0U05oQUFqSHNRZlpkZng0?=
 =?utf-8?B?cFU3TGJWMTd0VVlYN3ZUWHlwZnVjd3RUbjg0bnpraEVUMWtkYTJ2WEJOOTgx?=
 =?utf-8?B?enZrSFNuWjA0eGY4dnhUQWJrMTNYaXJXQjdwTTFNb3hkRWpQRyttNUc3TEM1?=
 =?utf-8?B?Z1dpN2dMM29VUmFlUVNNaWRsN3gxenlNbHRQdU00alFyZFkrUWpsOWYzbWlI?=
 =?utf-8?B?TGpWU3gwbG03aVh6aHpJKzVHaFBvZmphYzRMd1AvSFZITWpuUGVYLzdqcElm?=
 =?utf-8?B?S25EVmhxRGZqRXJrdUl2RzhmS0JIWjlVbENOdXl4QzdUamJVbzNodlRkbURS?=
 =?utf-8?B?NHNJTWZ2aWd1cVcrS3ZXSmZoWkNSWXdaQ0J4SndQSUFDd3ROT0tLOTEvdjlF?=
 =?utf-8?B?K0FRbGFqY2Y0d0EyTkRkdE1PSi9mbFd3L3F5Zk1JdHVZRUZSdkRlK3dHU2Nl?=
 =?utf-8?B?aFExUXF5V1pMZUlZMStpcnFUM3BRaGg0ZURGZjl0TW1DYUdOUWg5RFpseGk3?=
 =?utf-8?B?R1NrbTkwQ28wbGdlNnVsK1NZRVl3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160d4140-ef2c-4c70-8d07-08ddf657daae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 02:05:34.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XWv9lG7tpFs5cfyvps8WmH1yt52Dh5PBCzVkPSNAdwmED+frVek2PXgk974METm74xrVM4uI6qwvGyHviPmTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313

On Tuesday, September 9, 2025 2:14=E2=80=AFAM Brian Masney wrote:
> On Wed, Sep 03, 2025 at 11:15:01AM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the clk/tegra subsystem using the Coccinelle semantic patch
> > posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
>=20
> I included this series in this pull request to Stephen:
> https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u
>=20
> Brian
>=20
>=20
>=20

Thank you!

Mikko


