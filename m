Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47D946C;
	Mon, 12 Jan 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222431; cv=fail; b=BWI2q6vYGDLONPN7LaxRHM8yMd2hfD9TIcuNjKhkKwIGUDcNW03u47WyoiGm3Ka5HQ0mzAGx7vxoyfxJtBJ2nRhS2wEv4OVSvY4UECiwfGt2/mNRvJEjqCfdbM6yGS8h5kOSLf2HCKh6BlmgRbzM3uunD8oTlwLSU6GLk9aueeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222431; c=relaxed/simple;
	bh=eZPTciihqio9dtoUnyIhWL9nOcBRuT+bHUgKZLKUK3c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZgYbwxasfxun6MZ2mTsUchXUX5i1RyMiIYnx5u/5Xt/5cBlTsXvnY95wpJKFaTJnpzs7YHQMLTRQYJZdEZ+QqNvOSR5EBw1aWQWKu9KWLwPtZdkTWauaGSH5hfQCItr6a+Ob7s5+ZWu/4PnY+/WkaeuyfhXzFd0e8Ily/Mn8m1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FB/1jAX5; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FB/1jAX5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YikK/GE3KIdJmqUZOS8Jtn3Ps3NMPqNLJWIW/sDWvb8Sh2Nv7KIJq4QdLGK8dD6wKOnSz4MiNNtXWuMh/Rm5OIxGC8VoM4utJTIhAKnCKCTgrJXFap+zZT37PSAa8PyqOnPji0ToBZMDaEJ694vrNutAsMbzggeK/JfjVjvbbVsfeMfXO+dwPiUVeLJ5YrOE47Xookr4IM9Gp/PPESLSDfQIzQBR4Xc8gefwy1sgD69n+nIf4iNpZckarFAs5C2PnE8RTyuFMi6vn4nVOCkdX4AmFhp77JkdeXzhqAgE9SnylaVgq9OdmJ0lsQnfE0o6pZ7BKMlpIU3GEEQMmSm2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D82QvcFg/PZ0BozFCJOZ8+UOaefag6JmqigUYPk0MJM=;
 b=CvPLWJHpCIOzxFCz6ckeCjwLvP+f07iC8udLzFh9K9MtY8+xr/twmBeFnODclzKliBsNF/8kQPVd1rr7X9O3Lrsrtjl0LOAY9YPdx3YyM1QSa3ya032F4dE/M8wWratLkkehyBDwMl5AmaSnrKdRgeoc1yq05anvx7giW/vgLWKBBfjgUG8kUPx1bbX73DO7cLL5JRwUfADu3yeJbpmg6qztKFBivk/2a6jmYQBjiz6AEtHPD9i2kKlQ3Yw54TMnnAAR5UiavexPwo/QxpmcJwJTp5pfuuXnV7tAe0QQzQAqM3nfou8Au+1XiN2UKtXF33vjpOuhfy7PiAttSYzHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D82QvcFg/PZ0BozFCJOZ8+UOaefag6JmqigUYPk0MJM=;
 b=FB/1jAX5gr/SJpxQ7Z7lZH9R+af/lk8KkGOv74Yy3coYk8AAJScGlykdLziK59Q/sBLDw0in4epeXMW2W/A1myns+oTsM1ZSOQ5CfdkvDkFcR5wyQ5u6RWNlK3xP01mhfFPfyllrfVrlkOK0wzpdMjMTbEAnU63TS2xmCefYIpezC/0U4yqBXeeMxDuhGLwZi7+ySOzjYVV8gtCOiOykK1NTzFjq6Maz+yW+sFyw1pr/XTi1Wpo3d/gxyvkQefK3CAjRRtCC8p/dDBQF1ClcjEgx7bU+tLUtMzbFy/3v9hs59gZQzPkb+7YvRLxBlXfJJ+NzyoubGpib3U1BQpoACg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19)
 by CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:53:47 +0000
Received: from IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932]) by IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:53:47 +0000
Message-ID: <cfa7045d-bec6-4b3c-8413-fbcf1f1543e5@nvidia.com>
Date: Mon, 12 Jan 2026 18:23:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/3] ASoC: tegra: Enable flat_cache_default_is_zero
 for audio drivers
To: Mark Brown <broonie@kernel.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan kumar <mkumard@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260112042841.51799-1-sheetal@nvidia.com>
 <20260112042841.51799-4-sheetal@nvidia.com>
 <bea00d79-35df-43f8-8a3c-62d6db7952ef@sirena.org.uk>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <bea00d79-35df-43f8-8a3c-62d6db7952ef@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::31) To IA0PR12MB7697.namprd12.prod.outlook.com
 (2603:10b6:208:433::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB7697:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: b2263a25-ef5d-42ee-0e5f-08de51d9a03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1hoQTloTUNYQ2JXVTg3SGNDYk9DbW9DYzBpcmdnVzhyWnhpWEd6cy96dE92?=
 =?utf-8?B?ZUFLaUFDSVBwcTZNbHg2VVpldjdKcStsNFNjb2FCaUJoaU5Za29uUEVxM1lh?=
 =?utf-8?B?OFdFbWpJV0JLVjUyTmRUSEFNNndmQ1pFaW9QVWhiOGNGd1BVUFNxNmtWcmdD?=
 =?utf-8?B?UmovNDVlekxlcm0rRkt3RGpzaEswVjRQTW4vU1FFRmwzSm9jSXlhaDF2cWE5?=
 =?utf-8?B?ak1tdktWa3BpMTBUdUIzSnh0Q0toRzl3aDBMVVVtK2dSTktHeE9xcnZLSTBT?=
 =?utf-8?B?Ky9DY25NWG9mcit0MDhkSUs3WHhmQlFKTTBXKzFIRjNxV0lGN2JFYzdsTWRL?=
 =?utf-8?B?d0NDcWtITmxlNzA0MDhCamZ1aFZWbDNRM2VVTGhyVXlQL1dGZHNPSHdXRDNw?=
 =?utf-8?B?c0E3T1ZINFJPS2lHWVN4dzNHaWRxN3RNR2N0eitFK1diVXFoK0o3U2RCOUNT?=
 =?utf-8?B?YkxQN0VqSVpzWXVkUlZ4UnVDbUV0VUN2cUduZllDcEhLQjdPWmpGZmRua1Jm?=
 =?utf-8?B?ajJoR3JZaVdBcms1YUx1cmc1c2JmN2hTYWpLdnB3Q2RKM3A1Yk52SzBmMkNz?=
 =?utf-8?B?cUgzWG1qWnpRZzlwalRGaTM1OWhkYmhxOXQxQUdkQks0cE9rY2o3RkVGbzh3?=
 =?utf-8?B?MGMrOTAwdHdKbWMrVVJ3MExVNTArUWNXOFFyZ2lKV0tUTHhTT3E4a2Z5Y3d2?=
 =?utf-8?B?cmM5V0F6TDdHcUJOcVJ5eDNqMndGZWNRNDFoWFU5WEYxVHoxT3RJK2IrZVU0?=
 =?utf-8?B?aGR6TUJhWkxLM05LVU5qVlVONmxlZWNzWWtkaS9jSlp1a3dtRi93RWhkV2Fw?=
 =?utf-8?B?MmNqTDNuZzZVTnNsVHg1dXFSeEdjcHAyS2pMNVNuN3ZoM3ZiR1FMN0xyTVNp?=
 =?utf-8?B?KzFITC9IQmZ0Rk15cENoeTVOUlBOV1pnL0lZQWh3WmZXNWpjeFpRaTlWaG1o?=
 =?utf-8?B?dlUybzlvendCVXJlZHpmUnZQeXoxZFphblhCQ0gzMmxMZEtFSUdGS1FLcytM?=
 =?utf-8?B?RVFwVG93Ym9McVFOSmZ6K2ZjOXlpa0hDanh1SVNjSGprczJkOXBrUnlaWTdD?=
 =?utf-8?B?SjkyaWorUU50MlBYYUpoeDJjMFloWEJpSU1mbzAwcFFZRXM4YjZ6dlhoR0Vl?=
 =?utf-8?B?VGVRM0dNdFRDUDdib0lXU1ZjdjQ5c1RVMlRLV2NBdE9pTmJvLzFOb1VzMlBX?=
 =?utf-8?B?K20zRXhvblkwZTVsdy91ZXlvZmJQeUtGVytLVC9iSkJFUWI0aWlGMGpxdU9a?=
 =?utf-8?B?L1UwbHhMaEN5MFlSbEVaSVZsVzg0R0dKcm9EK09zVWFvTVE0RG5FV3JTdFNw?=
 =?utf-8?B?Y1k5NE9hMEhIQnJLcXQ2NExMaTZXbW5OVENFVVFVQ3NiYzFFSHR3Q05wOEYr?=
 =?utf-8?B?UzRPTTkxZnNYUzBjRHc1MHQ2VnB6WnJDYVpFeHRkYjN3R3pnank5NHVBSXpq?=
 =?utf-8?B?YUVSVG84aXJOL3ZZWExadjkwMEpYZysrTk82NEdCYTM2QlloeXpGVWlkRWw2?=
 =?utf-8?B?cnZzMHRkRXFQTjQveWJRZnB3ZkFxL0lURWxZVWpMb1JvdkkwWkNCcmR1aWp0?=
 =?utf-8?B?MlluczlKYXhMTGc3aEVpcnFEYS9wbWlsRUhVTzZBVVJMZEhOaE5Wd2VrVGN3?=
 =?utf-8?B?Rnkxclgwbm5WZVJxWmhwcFE3aXErRkJ6WWRLbDFxVHYxcFMxaEo3L09ZMGxh?=
 =?utf-8?B?UnN6U0lIZUFqaDVtRnZtK0FWK2lDNjdjZ1NiYUV0MW0vNTVyUUJTeDFtQ0l6?=
 =?utf-8?B?dlU3OGErL0RSQ1RWMGJkNy8yT1A2aWczWEhXbWRQZlJIeGpkODh5Zm41L29Q?=
 =?utf-8?B?ZFAxUytnQXR6TVBKejhma2U4UUo3YmhreHZFQ0ZIWkUxN1J4VWQzVk9pZGhF?=
 =?utf-8?B?d25SMjdGQ21lR1hnQ0VWd2t2SmsxQjdYK3JXbzBNYmJBYm5JQ251K3hNczYy?=
 =?utf-8?Q?lKlSjetNjGusI1870bFjWDQMTVkfAKjC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjRaMEl0eG5DK2pUY0JEWGtXUlpsTS9TdGlhVjl6NHlOZjNSem1kYmVnTWNB?=
 =?utf-8?B?N01vaVlLNFJrS1ZCUWZFTFNRWGdWclpXWDNzRGVSWFAweTlFU1RoVUU0T2RP?=
 =?utf-8?B?akNCVTdVS1ZEendCNzNkOVQ2V2hLZ3RIQjl3bUtCQWEza0hEK3VmQ3pSVmlP?=
 =?utf-8?B?dEdSeEFaNUxIVWlSdG9lM1FMZ3NJSk1EVmE3eGs0cFpFQUlxWmVabnovM08v?=
 =?utf-8?B?YkwvREZoRWJlK2FaVmU2a2U2L2l2ZERjekpnZHJta25xVjNiY3l1OG5EcmR5?=
 =?utf-8?B?V3NBeVhhNDUyK1k1T0JMb1lRZ212bmMyTHordHhjbFVVWWZvT2RreDlHZUhD?=
 =?utf-8?B?T09UWUduZ3YwcUsvaDdON3BhNWxxa3h6bE1jWmdLK0VyUzNmb0d0TWUzem10?=
 =?utf-8?B?Vjh4bDBUMkd5TmJSNWNVWWFXVzlwYXZnMURaYnR1ZU9PMkhOdkE3amZrbC9r?=
 =?utf-8?B?aStCSHhjNHROZ3Iva1FDSVE0L21vYmxxSHFPMEZNZ0Z4VHBSZG1GV0RPNnFu?=
 =?utf-8?B?UXhycnMzWkRqUU8vZEw0V3ZydkJuNmZsZkUrQ3Q5WHRMYmRzbW81SnE3dEFN?=
 =?utf-8?B?ZWIyZGZmNVFMLy9vUGJna3VHRDBSZGR5TE9mZGNkUWc0NDd3ZjVUNDVGOVJo?=
 =?utf-8?B?SzcrQlB0cVN6WnEvWkpkclM2ZFFsVS9saVZySkpxOGppdWUzUW1CMWYwdHcx?=
 =?utf-8?B?TUt0TkhnOU0vOE0reUVYaDRodW02UjRCcDlldnNObDhMUTFQVGMxMVIvNzk1?=
 =?utf-8?B?ZW1XWWl3MjZ1T3d3M2VHbFIwNkJUVm9DaHB4NDZtYlppdTAwbjVHVlVtajEz?=
 =?utf-8?B?T1dCK0swSXI5Z1g5QzRIcjZPR29mei9mWVBtSHRUazJjS21RRFVPZmlTaUtn?=
 =?utf-8?B?a2JGc1ZqNGc5SVdxb09ubFdmZS8wd1FLVDIrOExFbUVtdjZnV2VKckxMM0NT?=
 =?utf-8?B?QURWTng2bmxtV3BFN21oWnBRaXE1OEc3cHFxbWwwaGpEalArbmUzdXFRNkph?=
 =?utf-8?B?dWJhblh5czBzcTVkUGdyUTIxeExrdlJLWGptUVNuaEQwSGhEdWQweFYyT2Za?=
 =?utf-8?B?bFI1VUZQeURFVjNIOEliMFlUcTd3MlFPcXljWFkxSiszeExhejRRVm42ekp6?=
 =?utf-8?B?bEwrWUtaNkI5NThzRWYrckZxTzR4QVY3aFp2b3lmVUZ3Ly8yWnhFRC8vY3M0?=
 =?utf-8?B?elBhbDVhZEFzZGxSbmkrY2RWMWxUQkhZTFBDNkh3TVFCWlVhY1RHNzlhZUt5?=
 =?utf-8?B?NzBydnhIRTdseHk3UlM2Mk01THhab0htdW1zM1VIRlgrTmdzYWJyb29WaENq?=
 =?utf-8?B?S041cHpvTHJBQmVBLzlFSXE5VHYvVmYzWnJuRUEvZ0p2elZNbldGbjFvMENi?=
 =?utf-8?B?aENVdXZiQVlhU1hzNmNpUEFLRVF3R1RzUlBaaktkRURXUGVhTTFNc0dyR3Zq?=
 =?utf-8?B?Q2RNanlOaXdscWhWdmo5ZVRMUUE5cFFONnhlL0ZBWUErcDY3SXR3N1NMeUNW?=
 =?utf-8?B?NnBxdXpMemhWdytiM3N3YXRLTDluSUovYk1lVHlHRTZZQmx0YlFnOGcyMHMv?=
 =?utf-8?B?TnpjYURoL1RSV0FXSkNnVTlqSG9RLzVIUEhybnREVGFwSDRDV21wZlB1T2JO?=
 =?utf-8?B?RWdWOWlqM0RLaFQ5NTZxcFhnZ25CUjlwWU01Mk1DclZwMzhyVXJxck9kc0wr?=
 =?utf-8?B?TGEwR21peVo5c0FsQk1wSVJCZ3BaYmhicDAvTUdJWVJwaXZELzkvUVBkcFZv?=
 =?utf-8?B?MGtZOFZQdXFUZVdOb2ZXM04zL0tWUm42K0FuVTNWUXNvemp2a2M1RzdXaTV6?=
 =?utf-8?B?V0d0VkVHaGU4Znl0YUdFTkNRQVc5blRUbEtzQ1EvcVJyRTFUUmYwU0dmSFJ4?=
 =?utf-8?B?bHg5VGxUaUJFMGdFU0FrQUgyanJnazJOcGw5aUp1emNaQUVTaVoyMzd4TnEy?=
 =?utf-8?B?bU5PcThVdFBia1prc0NqL2pabUJGMUE3RGJxcTVZZU5uWExqY3k4bTVqdnRM?=
 =?utf-8?B?RGFXQ0hOOEo4L2J5YVJuK3AvSUxwSm02RXBTK3pWbk52MWV1ZE9veVFLWTRS?=
 =?utf-8?B?NktoRmFWNUxIZm9SM0NlRS9ydWIwd1oyOC91akZWM3VJcW0zZ0JsNHRldUhh?=
 =?utf-8?B?MFh3Vi9qb0NSTmd4a3JZVVAvb2JqWHdYaGNvS04vNXY3ZXN6eStUOUdYYldo?=
 =?utf-8?B?dXZjbzFlckhHQzN6MXZlMlVzM1g4ZTZEOWYzU1hvaVlucEdrdGQvaWQ5Uk1x?=
 =?utf-8?B?QTlNcmpMNHhNakM1TmVvNnltS29iaWpPemlJKzgzZWpXZEduR1dLU1FHamhC?=
 =?utf-8?B?ZmhnRkU1QVdidHFUbkh6TnEwb2hsamxZekd1RDIxM2RZSWZKYUc3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2263a25-ef5d-42ee-0e5f-08de51d9a03e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:53:47.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7U/DvnxTQv4xaNabCHXBEz5F/aVPxUeWq5555Y/XjNBWladZE0BnyYmK1MixfEqj3Us3pRWIecvabXPVOdYqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243



On 12-01-2026 17:56, Mark Brown wrote:
> On Mon, Jan 12, 2026 at 09:58:41AM +0530, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
>>
>> Set flat_cache_default_is_zero flag in Tegra audio driver regmap
>> configurations.
> 
> This doesn't apply against current code, please check and resend.

As mentioned in the commit message,

This patch depends on:
https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217132524.2844499-1-sheetal@nvidia.com/.

Kindly let me know if any additional action is required on my part.

Regards,
Sheetal

