Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC88D360EDD;
	Tue, 12 May 2026 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588109; cv=fail; b=G6/l41XwR6zjbUVBTBlul8PXn/JrU8VYIrLIe1xxheYHgsrZZtFkoq7tkN9c85+kd3gokQQ3xNKivhlrXMW+bgKz9471UxAHguWR1+ra4sk/MgJgAfw/b66ONKbLTtZYJG7GJItMVwDIt9vLtHMWuErqq+KgRIljkhe4RIl1KW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588109; c=relaxed/simple;
	bh=K9sebrBi9zrOCL/ToPcYZh9Ihz0HQb5QeYID7gJhNLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=daYVcCyIwd3kxkHd1ANpJRVMq401M6ydgDGeCm8KOHBW9IUNWm3NjgTG46EQ9aCjw75Nxf6LDIDbiPieXJYKHD8dYvW7GhREYgi8TYll6tY8yr03HZzXHc/AF2yxhwdGDK54IFQA71kQKAwmnWMLe1hur2Cj1MyopXp5v6v8wkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fp3dnrF5; arc=fail smtp.client-ip=52.101.85.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fp3dnrF5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTXPqjDNTW7QHcxcpt+l48cndxoaTwstlY4oCshmk2/5SjKGO2rG5JBe6dyaNmfo3rNBPwaVS8mfgofrwqj7p1A0C9cpHT3eJk/07bHFrKhmZHRajgIcrLmpg3y69IIfz3ypeonBSsNfHP/r38q8IW6ZaddVW9Cy0I5FixODJVNyUQ2Z0r3nzjWrFRh6GJa0MbtD6MFzlBeidWjtETSP5sUumIiOskDbefgI2t6knLPurGfWLotg8/Bt3MJWJOw6uNTg9asxDrnmjtylPUgR54R4u8WN9jWeiYkIE+5s8Gt7itr8XezEJtMIu/wa2uYbuARFDtIQq/ghjjJn9BE0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMTW3vvS9T4Zb/uExa1ks9EK1Km2b35FqvsMRFtFekE=;
 b=btUclQnrzfurY5MB3TQVncGXqxioUatgQKK+JFBNeA9Yz2eIdJ6UYLuj16/aKqYP1ZWDj4WfXlY7HHqa3qItytKbgsTaoaiCx0hk7UNlh5+SI1ZSRMVSjjt5NtTU+VTl67dX75Qfr1E7pDuphr4+NvakkPeX52HZtb++IuydZdduPPGNsxuQ6aLHTtKoDvF1O+31M2NojGhk2kA4R4R+so0lLPaA4WXoXpDcAtsORa5B4EOC/aSKoPQ8H7bxi9XzLGuUjKju+t5fujdeEuuczUd0z3MqCmsTyiCpLUXk7AgAjT7sOCleFqxGdT3bP1Beh+7s3HGkgTHxIn07O/rSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMTW3vvS9T4Zb/uExa1ks9EK1Km2b35FqvsMRFtFekE=;
 b=fp3dnrF56fPbx8ah6Ls6Ps5fNIFwV7DPOYb6S/Bbr0lQZzqUrMmvaGngJ2o2wFkcHz/9gNtedj9oBF7yI3PAcP7LRDOWZqtFixMLoqWAbZYipQerf9wZZxZNfMLR7oKAzZVdML99l5G/7hJ11X2X7nAVbSnC1mOWItGS2TGihYi8VdgcQoDiK1uyxF5x+lxRj5opKeioW/PLnYHLvGonxC9VUQ5kgbv4rb8tHYG8OAEdjic3j2r35B2u00bkZ78KgvlTa596bYKImZi77Ni0G03eI2J2T5gIk68w7BUv2+C1nYP77f3NOa+CCJ2+sI6XDXgvsGv9JZwGj8uGKogPvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by SJ2PR12MB7894.namprd12.prod.outlook.com (2603:10b6:a03:4c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:14:56 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:14:56 +0000
Message-ID: <0d9e5a78-948e-42da-9d37-78cc2a700cd6@nvidia.com>
Date: Tue, 12 May 2026 17:44:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] kernel: param: initialize module_kset before
 do_initcalls()
To: Jon Hunter <jonathanh@nvidia.com>,
 Shashank Balaji <shashank.mahadasyam@sony.com>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Rahul Bukte <rahul.bukte@sony.com>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>,
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
 <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net> <afABOMT_s9DvF6NY@JPC00244420>
 <DI4QQA6EGIA1.N8WRFWVKG91S@garyguo.net> <afCxHUrjr3Z22U6V@JPC00244420>
 <agKMcA7a_UqMua5V@JPC00244420>
 <40c3aab2-b5cf-4297-9b14-3ccfea377c83@nvidia.com>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <40c3aab2-b5cf-4297-9b14-3ccfea377c83@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::11) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|SJ2PR12MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e78614-39ea-40d5-76e5-08deb0201446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Onob4x0jHc4Y47UDeqEyysluVd/xLj5NvPL3tYv9RiZAqJTcyrY08n8H+NhV91EBCy97+JNInLiFY581a0bG1vej+AcB2zuCinf0pLAh8P6ndbRfResxHEHwNFLCiZRy0MUvOqnz1Zjurwea9FtzVozgIZz2Qr2YBYsXrcIGCqqenhWQMWNP1d1o8Cu4E6cq4SqfUBhtpNg7ZBkLrU4pOeSwEDMh6ffh66HTQW/+OuXRkDQ3/o+cgLj/QAJQmRJ/aOMoOa1859WW8820bKKSMb6CY/tE2T3vPGkaylo/Di9stEi6zzmNdtkEJIxMNVdAanz5uR1dLkyMxJtXl6PlhdAqkzcyy07TFY5HY+lYHKKRzhfU75rkjQD7QiL7Ign4sd12meKonrDfib0KwO5MLpl0ihJwo3FkJ9k4E/ExoYUwnW6xPiOLJT09zLpcpybwqhdcTOUz7HXvpOASSnTbPcIQVaN3MeXoFtPWKU99ctevH0976bye/TVkLe2RGU8p3k43Z/y4WY6GPqxA3Ed3WmVVH0uJ+Hedu9NwJrjda8ZP0rGakDnMvs9yx3kax0+AKyFrSZ7nQBtHcOSHt0Y5IMQH1lE26IEVBAb10AamnrVmwaiWrRStlo9U8WL0iwc4rzqyBRpy2AMsZiVt61/ORCnbXaiqfQ6weEW2TZKQF34mu3u9J8VKvkPLWRBvio1U7tjpNsGbKWmijxb8iQZqoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0R0TUl0bzNDdkJ2KzRKai9iNVFhVmNtYkdIWlV1dVpFcWNOdnJTUEJFTWdy?=
 =?utf-8?B?cUNKZldSR2QrYitqQjRXdzhyTXMrSFNicTVVZk5xYjIybEVoOTZ0c2o5dWJL?=
 =?utf-8?B?TzZIQ0E0N0tCWFF0Q08wYVpwT3BiSFFIUWxTR0lpUzBiU0NFMkkzTTkwbkpE?=
 =?utf-8?B?bC8xaGUzdUlpOThMemlPMHZKbEkvYy9rMS9PRjZFQURPTVljWno5MWs0ck5n?=
 =?utf-8?B?Mld6V2tYbEwrb1djZUV6eXBNNGlmUjhFMVpTSHJKZFRpeDZhaTh3UXUzOVFQ?=
 =?utf-8?B?b01jckxYZk5haVJTQThvaEh0VHdlMEsxclRjU3h3VVdtakNXcndubXZKSjla?=
 =?utf-8?B?T1Fxb0dxTXFJemMzd2xsTmdLSk1iZitiMitESC8zdThJQ0doTHVuOVh1bEJI?=
 =?utf-8?B?bExtU0NqbmhqdHVhK3ZDQVFhYml0VEtpVWhUbWtwaGR5YlB1Zk1YdUtFNUF1?=
 =?utf-8?B?OWFWZSs5VU1aWThRcUV2enVydkhLVzJDNFF1cmtMT0Vtd0twa0paeUtoeGFO?=
 =?utf-8?B?dHNpR3VzQkZFeHBZbWlFVVhJWXNCUmQwa2sxNHFnZ2dCZ2daOEZ6L2RLWG1q?=
 =?utf-8?B?ZHg0ZFFZQ0tyZVExQVlRVWVwTHJFOFdHM3dkMCt4cUVsQlNtd0Iva2NLVXZi?=
 =?utf-8?B?ZUY1YXB0K3FGRHNCeDIyWE9IV2ZNZk93QnhKanROREVrOHJVR0VZSGREclV1?=
 =?utf-8?B?b3hTdkNBZE4yaXp3TGg1Q2pUNjZWV3ZYS1M0eVdwY3A0bHVEamZKMmxvaHkx?=
 =?utf-8?B?eHRJSHdPRFpwQkJ2dEJPUUJSZ3hxUFVNMUNTMUdPK0dEd1ZNakdrcERIMXR5?=
 =?utf-8?B?TUlKRFAxQTNZN09JbWQ5UnQ0dW1HVldUbjg0NkZhaUYydFlVUzVJMXpZSisv?=
 =?utf-8?B?Q1JRTlVEenhnQlZDVTdJdEFxNm1IYmdmMGkyeWFYOHhXSERZMEhYd05XSEdz?=
 =?utf-8?B?bmdDcjRaR095dEtOSUVBbkp1R3ljbE5qTmtPclQ0ZUZqTnMrVS9vLysyMkcz?=
 =?utf-8?B?SEliNmhMUFRLSTd4VDQwdmtGcTBCWUpNM2JaT2hvbmhxRFdJbVpaUGlTRnNv?=
 =?utf-8?B?bW9Cem9pM3ZBcFc1eHVQeUpaSmt2M0ZqOXBLZVFyNmxXTitGRWdhMjl0ZjZl?=
 =?utf-8?B?aDN0MHZ5bUJXR2c4MmFMNy81blRqZlJVaUZwZUYyN3BVWTB1U3E3TitmS1Fk?=
 =?utf-8?B?Q0FtNTVXYlFha2VMTFN0VFBEekFoUmRwbm5tWFNNTG40enpyckpaeTNyL1hN?=
 =?utf-8?B?ZytCTDJoOHo0bFBrWUo5UGg4RHVRWWlzY05ja25sRk9mUlRUU00wTHZsQyt4?=
 =?utf-8?B?VktQNXBQL0l6L1kwdklWRTRNd3JvU21qaENwZUl5ZXdxdE1zMGpYUU1iUyth?=
 =?utf-8?B?ZzVWNnIrcVl4Z3FsR043R3g4QWJPM3pwRklZSUZrWUlwWkp0RlJQaTc5d1Zk?=
 =?utf-8?B?YzRiS0k4RitMSExxeTY0aVFHRVFyUDUwa2U0aHZGdjl5ZDB4ZWxhYmIrVVJq?=
 =?utf-8?B?YWVGVG9KVzdQNnBHSlFHZitYemlORU4vc3kvdFFEZ2RWYm1VTDVVWnd0RjJK?=
 =?utf-8?B?NW80R1VyTG1OYU1ZQ0F4c0xPZmY3YnRXeUJaNmM2RXJFNkJIUFVERVkyVUM5?=
 =?utf-8?B?OWpVV0ZlMURPQmRGLzF0bEhwajZ5M1JidW9kS1ZIVnpLZEtoZWpxbTRRd2Ux?=
 =?utf-8?B?dUQ2b2JWQnpKaTFUdmhDY2FBU1ZhUU5xeXM0YkhpVFpuYlB0djJHNEo3S2Q2?=
 =?utf-8?B?R2dJK29rMmh2cm1UdnVEaWtOdTUxc2d1citLbXYzTFFmQm5SaldOVDBPY0dp?=
 =?utf-8?B?cjRBM3hnUXRhdEhEek1ZWEtSRUt6WXdFK1VsU3ZHd2srYUZCV1c1aTE5VlRs?=
 =?utf-8?B?cEQyQ3ltdnI3NmRrL00rYmxYc0MwNHoyS1IzSGJ4VkNnNzc5Wkt5RkxMV1Zx?=
 =?utf-8?B?RkNPQUo3UjNzME8yTWNlMFpaUmlTT2I5Sk53ZGFuZFgyY1RMejB2bVpwWExG?=
 =?utf-8?B?VGNCcDQvR2xEVXl3d1VBWmdhRVZ5MXJqZEticERLNTZhUVA4b3M3Yk5DQUtY?=
 =?utf-8?B?c0wvOFZYYTFweEVRYWM1RjJkb1JkTkFLS0ltUjRRenUweStFNjVhbkQ3OGdT?=
 =?utf-8?B?Z0FBKzM4MUIySHBnb1lmTTd4cVBlOEtkRTh5OXc3R0pCWDNVTU92N21UNE1m?=
 =?utf-8?B?bUlnY0NrdnJFekh4UUtkbFQyaFN1VDZucWVwdG45RytDYkF0QW0yTGt5Ykha?=
 =?utf-8?B?YnNEKytMMHBmMTI2RXdvTEF3T0diRTFCVXRBRlQ0Q2R0a0luU2NJMUV1dHls?=
 =?utf-8?B?eFU5T3lreDBYcDUzYXR4UmRNVVFwRkFKRDNkdk5iU2JXOGZ2eGJ5UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e78614-39ea-40d5-76e5-08deb0201446
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:14:56.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9joHYoIYZ7H2muRcThJHh9sDN9mpCH6xqtYJ+RuaBD1G/FjBjK2DrgAJ45mxe85NFRzQMJmPY+EBLqIbrDQLAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7894


On 12/05/26 14:25, Jon Hunter wrote:
> Hi Shashank,
>
> On 12/05/2026 03:12, Shashank Balaji wrote:
>
> ...
>
>>> Hi Thierry and Jonathan,
>>>
>>> You can find the context for this email in this patch:
>>> https://lore.kernel.org/all/20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com/ 
>>>
>>>
>>> TL;DR: tegra194_cbb_driver and tegra234_cbb_driver are the only drivers
>>> registering themselves as early as in a pure_initcall. This is a 
>>> problem
>>> on two fronts:
>>> 1. Philosophical: As Gary pointed out, pure_initcalls are intended 
>>> to purely
>>> initialize variables that couldn't be statically initialized. But these
>>> are doing driver registrations.
>>> 2. module_kset not initialized at pure_initcall stage: This is 
>>> needed to
>>> set the module sysfs symlink. Since module_kset is not alive yet during
>>> pure_initcalls, registering these drivers panics the kernel.
>
> Where exactly is this panic seen? Ie. why are we not seeing this?
>
>>> We would like to do the tegra cbb driver registration in a 
>>> core_initcall
>>> (or some later initcall works too), and move module_kset initialization
>>> to a pure_initcall. Like this:
>>>
>>> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c 
>>> b/drivers/soc/tegra/cbb/tegra194-cbb.c
>>> index ab75d50cc85c..2f69e104c838 100644
>>> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
>>> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
>>> @@ -2342,7 +2342,7 @@ static int __init tegra194_cbb_init(void)
>>>   {
>>>          return platform_driver_register(&tegra194_cbb_driver);
>>>   }
>>> -pure_initcall(tegra194_cbb_init);
>>> +core_initcall(tegra194_cbb_init);
>>>
>>>   static void __exit tegra194_cbb_exit(void)
>>>   {
>>> diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c 
>>> b/drivers/soc/tegra/cbb/tegra234-cbb.c
>>> index fb26f085f691..785072fa4e85 100644
>>> --- a/drivers/soc/tegra/cbb/tegra234-cbb.c
>>> +++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
>>> @@ -1774,7 +1774,7 @@ static int __init tegra234_cbb_init(void)
>>>   {
>>>          return platform_driver_register(&tegra234_cbb_driver);
>>>   }
>>> -pure_initcall(tegra234_cbb_init);
>>> +core_initcall(tegra234_cbb_init);
>>>
>>>   static void __exit tegra234_cbb_exit(void)
>>>   {
>>>
>>> Would this work?
>
>
> I am adding Sumit who has been doing a lot of the Tegra CBB driver work.
>
> Sumit, any concerns here? We could run this change through our 
> internal testing to confirm.
>
> Jon
>

CBB driver can be switched to core_initcall.
pure_initcall was originally added so its IRQ handler is registered
before other Tegra drivers to catch and print any bad MMIO error
during their probe.
Looked at the current state of Tegra drivers:
  - The other early Tegra drivers (PMC, fuse, flowctrl, ARI) all run at
    early_initcall, before either pure_ or core_initcall.
  - The only other Tegra core_initcall is tegra-hsp, and link order keeps
    CBB ahead of it (drivers/soc/ links before drivers/mailbox/).

Acked-by: Sumit Gupta <sumitg@nvidia.com>

Thank you,
Sumit Gupta


