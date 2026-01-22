Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012067.outbound.protection.outlook.com [52.101.48.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546973101DE;
	Thu, 22 Jan 2026 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102937; cv=fail; b=u1hrE2YsEnB518kfE4xTPWxIfGApmdJWHDTVIr18AX7axYgyPWipS+pOMgUo3SU5nkZvrYWnAc9mszocsnzRLa3rGwpfaa3OPTwYed2M21AdfL+0oINxDc69J/iYVgGWkPN6iAOxaFOYaCZ1UtMUVErRQr/VUklsTLomVrMh5Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102937; c=relaxed/simple;
	bh=Sh6rKsII20Kj1PFjDmzekfiSHInt3JWbyXO1+LmWsW8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jb02tAVbAX0DqlCiPmrZ1ZPjPOJhO8T/YCkL8apgVOLqBsQMHHPJiWs5x/iMY+nMK97gcmqD82xzjgoZaJk4nlivoUOHgdq6ZUDUpumcqu0PnMjn95pDHLslO7q3AHjbiL+1T7cSo3SEdhlXwRrm3a6ZC+7kbqfCuWE0RtIlkaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=THT1R2Dx; arc=fail smtp.client-ip=52.101.48.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="THT1R2Dx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8u2xjouDHhwy9CNVV8FtDc4Lb+NLHKbixXzQR1sPOyvfKWpWMzlTDfpK8gIgSjchqoorkevvp+J1OUAuOauILNtwpBWM8SRJux4FnWYxSRhgyNi2RaD1PKW72uoya4ksoDkSNBKBD4rJJDV7RuAyjACsvVz5gqGoZOsWJtV53fdPpFFEGZpDcwYf5IFK2P3iMq7pwHJYGJQ5zWlQAPwL1dgfbQLRnpwVmyVKCQYkBjGJuUOSqe3XFUyaua12b4+BLoBba6kJzuS5ss0xk6xzvfzAV+9YUWShOHAJV2U9H4Mijs1LyLeV9+40o1gzd8WAIw9IsJbfn/JYUWuKEIfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnYkUfPxQxgK56G+xxjlel7MTlkwyrE0x1i9E06IAOY=;
 b=NMe33CHn/5o0KCNhAuGgsZ41FFguY4aa9Ds62wuvfC4eqCOZ/047Me/J0Go9cvWzrZGVr0WCtpscQV+otfAFp/IupgwRAqj9w3/E2UZx9xLrDhavr1ojH0ipSTWLEllP5eyLyEppjqKtI7+fi1VHh74J3NpV4AyYe1MaQbpLwPqrDZdUeQYGUGsedJiNKnvqU5p8L4YhWalUDNKI6qUx3UV1l4janC183QtcrriiJCxxANYLrj/7Hj3HwDe6d7IDqCgkuDx1ZUy6lSPgDrsmHb8W98rdC2fyvO262Hd2TUWE5VYEk2pRSlT/Bpyxo6oC9TnaKwh2Yh7X7kOwyBDOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnYkUfPxQxgK56G+xxjlel7MTlkwyrE0x1i9E06IAOY=;
 b=THT1R2DxlVTqPxqrxoWe5/cjW5pwXKYPd5jRjMxMhqk6drBlxRZALAdCN80g6tsbOHERQdSsu/4KO+EUdJeHBG89cCQRrmKvLZ0J8sRtcdNVM9FsXrBksiHRn6wAwF4uuK13hqOUNEkl6iGJ22YUxcYc2xvcF69/0BjInO+RY89k7XSiUf7khfydNPjMPna2kDo7NlkfjAbIBxH7ayhD6bLUJ3ft0KRlbCUNObJDDJ0k3mFF4BdTAQxqhnBQ17vspYOs0sOeferzWyE715T71nMKC5b1zcQXx6/cJB4peUhd1UzyOf+oEZ7Sv7zxhlElCU8F9E+SDiLUkundXUCKSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH3PR12MB8904.namprd12.prod.outlook.com (2603:10b6:610:167::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 22 Jan
 2026 17:28:17 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:28:16 +0000
Message-ID: <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
Date: Thu, 22 Jan 2026 17:28:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, Gui-Dong Han <hanguidong02@gmail.com>,
 gregkh@linuxfoundation.org, rafael@kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, Qiu-ji Chen <chenqiuji666@gmail.com>,
 Aishwarya.TCV@arm.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
 <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <DFULF717AOGG.GY8B9ET26KND@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH3PR12MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: f6077fe6-166d-496b-aec7-08de59dba0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2pQeWdBdGdDZmp3TTZUM3N1bVN6MngxWmRRdWQzTjdDQXMrbGNWOFFpNTJm?=
 =?utf-8?B?UXhvaU5hOEc4R21HR2NpalhpQ3JwL0p1RnF0dllWcCs0ekx5Z0NVbE1ZR1Vy?=
 =?utf-8?B?VHc5dDdVTUJCMGtZWm5kbEViNjREVDdLdEticWhReW9IdFN5MHdpMzZGN0FN?=
 =?utf-8?B?S0grWVdTNFcwZEF1T2h0QUJ2YXlLQXB2UzhYdTJmL256T3RoNG9Oa0FMTXNn?=
 =?utf-8?B?dmlmZnlXVUxrem1ha1ArUjI4WjJnRi96UVdGUFdNZXRVcTdFSytmTkZiSldS?=
 =?utf-8?B?MDRyMU1Pajd4cTByeVJFQ3poTXVBaEFnSlFGY2JwdGZycTVYSGdkNlZCbTN6?=
 =?utf-8?B?VHZEMUE1MlZaanhsdWxacTdHSVdkcGdzVXlKSTdmeExEY1lwYklNRFZUK3No?=
 =?utf-8?B?M24wVURJaFIrMXhNVzdGRUdDZFRlN3kvQlhXTTJKWTdTc2ErMVJONkprT0tS?=
 =?utf-8?B?SEZBNkJYc0VjTUNtRVhzSUJ2bUZ6RVYreWhWNkx3M0pJQ0t4RWdrQ2diZzdi?=
 =?utf-8?B?ZHVHdXd1Tk5MWkp3M0hZNWU2ZE5UTGIzTnZ6bEF6TjhGV2h0dVpkVW5FZXBO?=
 =?utf-8?B?L2drM2M0bTRmTjFIS3o2YmlTV3lKaTEybXpZSlJKam5xMlVpaEl2YzFHK254?=
 =?utf-8?B?VlU0cE5XMUx3N0doREZVaTd1UXpickk3dWYxR3RXbmFqcGN4dVFZVHoyL2d0?=
 =?utf-8?B?dlowVFIveXNCR3hkUXBTVVY3SEtFSmdqSEtwcnlINnlQK05ZTmJEZW9COXl2?=
 =?utf-8?B?d3BJR3VDSUkrdzRQVnNPd0ZLblF1ajZxWEszMUdMQkxFWmI4YjFSZTNoUEha?=
 =?utf-8?B?RERPVDU3M0J6QXQxSzNtdW92NnF3L3FwZWE5UXNlWFdwUmNVZ3U2U3JSOEkv?=
 =?utf-8?B?TTlxSlkxZEkwTXRNU1lNSEJjdjB2Y2dhTDEwWHdGbklZVDBEVVBocHErL1pp?=
 =?utf-8?B?bU4rVHhISFViNlNLV0FIWElTYmJQSU5DUFhhT0hnSGIyVyszZDkxeVhiNUdt?=
 =?utf-8?B?dDAyeFNESXpyeFU4TzRTRi9rRDZVTEoxZGVucGU4YkhGd3ZINVVyT2VLRXV5?=
 =?utf-8?B?SkdiWkxNYmhyZllJekRvYmc0M3FrY0lpdkNFbktEdlFkOFNqNkcwWms0QlhR?=
 =?utf-8?B?TWUrSkNEWEVkR1gybGk4Vks4dkxKT3lYRnNjdERXSmplNDNoYWpiU2hSU2t6?=
 =?utf-8?B?ZFNBVnRkSXlMM0JhOUh4TTBzdXllTDFPS2diSVk0WDhTV3VHVXNNMU5JTW0r?=
 =?utf-8?B?bERaeHdjeE5DWU9wd2tLKzk2THJudnNIQjlyTWZ0Ly9oOG5FNHlkcXJtUWxm?=
 =?utf-8?B?d1pYbXNsZjVqRVJvQkhnNmtxTE5ZcGFoc3lSZmIzamVrMytDY3FYUENidTBL?=
 =?utf-8?B?cTFqV1pQWXV1OWkrZm11T2F0eG4vaGtxWENET0E4by9vZEw2S0thc3kyLzd5?=
 =?utf-8?B?dTNMdFJodXYzRXIxaWttZmlhM3NNU2UxNzlEK1d3ZFFrbVNRSnRsNTFqL2hV?=
 =?utf-8?B?SHdYS2x4enZkQ3ozUEtqbklJbGhPSTZ1Rm05QkM0VDlwaHJESml0dmtTSFNl?=
 =?utf-8?B?NVlKUG9GU1MrbWNWcGxQcXlWbXo2YVdOaHl3TU1aWlZidGNXck5BTVp5MEgv?=
 =?utf-8?B?ci9kWDA5b0wvR05weS9QWmdEM2N0Rk12Qm9VSm04cGRralZXR2c2Q09CVmxr?=
 =?utf-8?B?WjREOUhmMUxEeUNBUGQzQkN4UWlFRHlxSGRxOUJNNk1BU2V6Ui9qdEQyNlVz?=
 =?utf-8?B?ZHc0L2krcnlxR2xURHBYMmFkcmdmeGFlaXFLUnoyUDB3anNPM2szUk52Y2s0?=
 =?utf-8?B?SWIxMnFLaUgvNmppTmlSR1VRcnVzenNSdXpnQXNSUTdRSDIwb2NnSHZ1eDJU?=
 =?utf-8?B?eDVqMG02WnRiRDJ2ZFBhSS8yQmQyRTh4MDM3cGpkNlJROVZFT2UrVVJXN0JP?=
 =?utf-8?B?NFIxY3dPUFByTXpSdmR4QlFyczEwZTVHdCtYVUYrVjN5MldyUi9UdHhNRkJw?=
 =?utf-8?B?TEpIK1FRU1FvR1E2MDBVbU9WNHNtVmxsSXlRNlRremU5aCtLZExhKy81eDlm?=
 =?utf-8?B?UE8yOXpldTlpaDRrWWJTbTFTUjJuU1h2Q3lzNFRPdnVibmpFajErWFQ4OXVS?=
 =?utf-8?Q?7cRY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UStYUXRUSllCWGoyMTJyczIvY0lXV0dNb0pQZ25WVldxK0hTdlBIeGhVNTFB?=
 =?utf-8?B?cWdJUkVWMzAxK2FTQmZtZkIydmxqV3lZMkQ2L0hiS2RkclNxZzBHWXNPN3Ra?=
 =?utf-8?B?ZzV5b2xVRU1uSzBWNmF4VmNWTlJyUjFSOTFuTW1VNUZ5S0s4dWFxZkpQa29U?=
 =?utf-8?B?TnNDYTBZbmRoWVM0NHlHMTYvYi9wUks2UTVUdTgyUWNMbWU3dTcwYXNNMWtI?=
 =?utf-8?B?U01SL0xsRlNFYTFiMjFoTkRrM1B1YkU5dFRSYUViRGJUUFZqYndya3hQdlFY?=
 =?utf-8?B?R3ppdGw3bjlpR2Y2WDdMQWM3cVUrN0JvWTVBaDJ1OTAxT1Z0RnRCc3VTamFI?=
 =?utf-8?B?QmtTNjFadWlGelJpNDRwdGFubmhqL3pMckNoVFNja3o4R2dtMmkvWEVrWU1O?=
 =?utf-8?B?S0N0dlRRSzdGdVdIZGFsQWsvL0tSOWI5LzY5Y2xCWmpOQSsyZy9pMlhDOW9o?=
 =?utf-8?B?RmlFQzFCM2U1UzNqckw4ZVREdUEyMTMyeEJCUFZXQVJaTkJ4bmVjclg2bENv?=
 =?utf-8?B?b1FUbEUzRm4rYnpwaFRaOGZHR2I5ZE81QkdEVjV0V2RRdlNwaVczcTIyRTRT?=
 =?utf-8?B?SFovUlk2Wm1EZlNFTkYweG5RZHF2U2h1QjhsK3lpbTdCb21IdEZQbjRLS0dy?=
 =?utf-8?B?VnBSU0tOUUwvTlRROVFXb3oxSjZnOHVhc21aZDNVYkVIdXhMZjBybEJBcEx2?=
 =?utf-8?B?dG83Zy9mWTh2TzkxeHFPc25EVzJUTSs1enhkMXVBRVhqWUROOHdwQUlKcXVK?=
 =?utf-8?B?WGI0V0N3MzlFMkJHbDN3bENiU2NLdC9qSW5rR2xQalFiZzlFSHBocSsyTW1M?=
 =?utf-8?B?c21nb2pGak8ra0FjQTcrOWVhUEViUnQzUURFRkVXMzFFeTJhS0UxK0cwOUly?=
 =?utf-8?B?ME5sREJjbW05dVFCcXFoNTlZZVRCZkVmZEVZdmFOdWdzbzNmZzNUZzBrQndz?=
 =?utf-8?B?MUVROFcySGJ2dXN3Z0NwdStCRCtpS3lCSTg4RklmWHhLR0pWMFUvcWY5bzRr?=
 =?utf-8?B?a1M2RW5vYndWV0RmMm4xTXNEYng0aWZCVm5yTkg4b0RPRlJzYytrNVBSSExE?=
 =?utf-8?B?WEZrRm1vQm54WFlKK0Rja1pBUTFSQndJajhWeUVXQmFEWXlaY0JHa25Sb01T?=
 =?utf-8?B?S0tFTkdQVTZoZjVPa1JVZVNFNHZOeFlhdGYzcnBMcjdPRXRSSjRiaHhmYkNK?=
 =?utf-8?B?ckdyODJUcTh0R04wZEVCUmM0d0IrUjA1eDE0Y1UwdzlzZ2hEeHIxdEk0bklR?=
 =?utf-8?B?M1RCY253emJLR0lQUHQ0R0oxZDhRTHdxMkVrL3UwRkZmL3BocWY3RUYwTDJW?=
 =?utf-8?B?a0hNc3dGdTFHYU5yM0gvNHR6MTVIU0hDVlVQbDBiT1lVT2xEOEpRdHBNdlJk?=
 =?utf-8?B?bEZmRnV0TnYwL3NkOGFRUDhPdHFYc0ZvU1AzNkNRRk1qMlBRVHJXblRvNU5L?=
 =?utf-8?B?b1Q5Z1ZKV1A3RVBEaDl0TWxORTMwWVRiQkNhWXoxSEJpN295Q0xjTUhLaVUw?=
 =?utf-8?B?L1ZYUW9BQ3JpeW96OThEZ1hERytuRmJmeWl3V1BocS82cm9FWXZCNXFZNk9C?=
 =?utf-8?B?L1hNQyswcXVmZ1FYc2tzR2NSdzdRM1Jkb0QvUFNodG80Rm41dVk5RVpMb2tQ?=
 =?utf-8?B?ZlFXdVBEUFVtQmlrYnBSOUh0OXBTd1M3N040U25jeHdkTHIyQ3JpUVFuSXJU?=
 =?utf-8?B?b2swdEVYRXMwSWxZbW5FSUx5OHRUWmh3N3ZPWVUxMGtNU21DMFhvSGhJTnRk?=
 =?utf-8?B?R1hUL1cxSEVxMk11STlHT2RkQzNiUTY2U1BpUCtRWGV4Q1ZSbUtOQ3Nkd1Nq?=
 =?utf-8?B?bW9GakNRamlDM3FEVEw0dGYyQ2hHNlFEVlhHVXNIMGM4Zkp1MGlxYTFabXZT?=
 =?utf-8?B?SU5CNlloSFU4eUFxYSsyQTJvQTBseHFMdjV1WHVXK25MeHFEOEh1b1RUZUFP?=
 =?utf-8?B?ZHQyOGg5VHNYV2tPeWEzMm1jVERkeGk0OHlieHJYMk45R0FGVDJiVWY2Yzkv?=
 =?utf-8?B?djFoRW1rSXh3TTl1bWsvUlliS3hWNUYwM1JRNDdYaHlnVzE2RStqODExRkQ0?=
 =?utf-8?B?eVE5Z0o3Zi9RRE90QWJleE8zeWJOU2l0SDcwNGlYaWtoTVVMdWpCdjVTKzdV?=
 =?utf-8?B?c1U3SmE4MDRzWkRGY0crQXh5eVBCT0VXM0Y3RzhYVzUrK2l0RWNRMVloYlRK?=
 =?utf-8?B?SVlFd0pVMlVzVllDNXRoZnUwSU5YTXpWVFQrQjBLMUg5YVZHNm9rZ083OUgy?=
 =?utf-8?B?UjFYbC9JVi9kamVVazdURUlMUW5OQXpyRkxyUktKdklCMHBnRUdrRlp2SlIx?=
 =?utf-8?B?MThHQk0rQW94M3BWV3BxSjgxa3VJV2NkcWJhejRscWFNN0RUWTVyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6077fe6-166d-496b-aec7-08de59dba0f7
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:28:16.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yo1lYr8ClyBdFA8uy2lkgJC20PMjYqlbCntK/5dcuaYu8iDuPgKBw8fzd39C9hXasuzGwRy2KR9JrdjZ4IlGPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8904

Hi Danilo,

On 21/01/2026 21:42, Danilo Krummrich wrote:
> On Wed Jan 21, 2026 at 9:00 PM CET, Jon Hunter wrote:
>> It is odd because it only appears to impact the Tegra194 Jetson Xavier
>> NX board (tegra194-p3509-0000+p3668-0000.dts).
>>
>> It appears to boot enough so the test can SSH into the device, but the
>> kernel log does not show the us getting to the console prompt. It also
>> appears that a lot of drivers are not bound as expected. I would need to
>> check if those are all modules or not.
> 
> The other reports were fixed by [1], but the issue in arm-smmu-qcom shouldn't be
> related in this case.
> 
> I quickyl checked all drivers with "tegra194" in their compatible string, but
> didn't see anything odd.
> 
> Can you please try to enable CONFIG_LOCKDEP, CONFIG_PROVE_LOCKING,
> CONFIG_DEBUG_MUTEXES and see if you get a lockdep splat using the following
> diff?
> 
> (You will see a lockdep warning in faux_bus_init(), it's harmless and can be
> ignored.)

Thanks. I do the lockdep warning in faux_bus_init() but that's the only 
one. I have verified that all these CONFIGs are correctly enabled in the 
build. The device boots fine with the below diff, but I am guessing that 
that is expected?

Any other thoughts?

Thanks
Jon
  > [1] 
https://lore.kernel.org/driver-core/20260121141215.29658-1-dakr@kernel.org/
> 
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 677320881af1..4741412d7e46 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -190,8 +190,13 @@ static inline int driver_match_device(const struct device_driver *drv,
>   static inline int driver_match_device_locked(const struct device_driver *drv,
>                                               struct device *dev)
>   {
> -       guard(device)(dev);
> -       return driver_match_device(drv, dev);
> +       int ret;
> +
> +       mutex_acquire(&dev->mutex.dep_map, 0, 0, _THIS_IP_);
> +       ret = driver_match_device(drv, dev);
> +       mutex_release(&dev->mutex.dep_map, _THIS_IP_);
> +
> +       return ret;
>   }
> 
>   static inline void dev_sync_state(struct device *dev)
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 40de2f51a1b1..56c62b3016aa 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2557,6 +2557,8 @@ static void device_release(struct kobject *kobj)
> 
>          kfree(dev->dma_range_map);
> 
> +       lockdep_unregister_key(&dev->lock_key);
> +
>          if (dev->release)
>                  dev->release(dev);
>          else if (dev->type && dev->type->release)
> @@ -3159,7 +3161,9 @@ void device_initialize(struct device *dev)
>          kobject_init(&dev->kobj, &device_ktype);
>          INIT_LIST_HEAD(&dev->dma_pools);
>          mutex_init(&dev->mutex);
> -       lockdep_set_novalidate_class(&dev->mutex);
> +       //lockdep_set_novalidate_class(&dev->mutex);
> +       lockdep_register_key(&dev->lock_key);
> +       lockdep_set_class(&dev->mutex, &dev->lock_key);
>          spin_lock_init(&dev->devres_lock);
>          INIT_LIST_HEAD(&dev->devres_head);
>          device_pm_init(dev);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0be95294b6e6..dc898a420bc2 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -579,6 +579,7 @@ struct device {
>          struct mutex            mutex;  /* mutex to synchronize calls to
>                                           * its driver.
>                                           */
> +       struct lock_class_key lock_key;
> 
>          struct dev_links_info   links;
>          struct dev_pm_info      power;
> 

-- 
nvpublic

