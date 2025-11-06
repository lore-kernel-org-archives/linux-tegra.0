Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F35C2E0B68
	for <linux-tegra@vger.kernel.org>; Thu,  6 Nov 2025 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762455811; cv=fail; b=Wu5ubF3X5HuFCKQmtZ93zIYjbNWbvntxatt/eTQpCdAzSNGVSd/bSsWmoZk4cSJId8lGowaSI3gaYB02/jiRPCrb8dUKWfUMpkseY8ru+d3oqqudq0GopIxEAQf/qB14cxekQINwiIKQT6NDfj5ruMtE1a3YbYHYLf5QYcm5L3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762455811; c=relaxed/simple;
	bh=35yO7jmGVdFKGikI3sgyuH+gh0kvjlYSsE4TSKsx1dw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Myf0QkML/+9m2PV1tOKFL6tfFt2AZ3DfhGVAVutHwOb5KxIGKX/WWMT9CobvbojsN3DRcjB0eUcPAVDfnqI5vZNtLs1VSfazG9y7RQicCrZhIyXH9HIlKkb1kuJjUMlf0Sx5CITEJmomMKucKIzGJuzo8B/vJzFWEy7+FWcgWNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oslcrrfi; arc=fail smtp.client-ip=40.107.200.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oslcrrfi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hvd8t7BsxUsoGyTi2qRqo/PZaPOg+uBUg1by3GEw1e7zvKy0Hwlf7+8RpfY5+X0ObTTooR0uWx7+2PaUdJs5g4Lo3Mb2y0p5yM7oVRR7VUvoSDOy/QXibt5zVFzoyBZpVUrZJYfBsii1/OxSYjehALkimizN10kD9otF7ZEAaZJllf7zJJAzgOqPMwOntwkdvJ7897n0kKujsj8iS8HWoQD14mvUMM0OJMrObSSPqu+F0NB+PCyhYmBWkZchpjXhRR2HzHTUWl6xbjPue09jn7Dnre+pZ+gOXFz+rGt61XqeahzpcT95Pr/KgIoN2bY7Cp9tXERlSJImO0Lg8RAa1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zawqiGctiqgsqIuytYIQ+CcgWJeCl/TshSd9QxtEhoI=;
 b=zFZisSNkM07VOsRJNUhu9teUx5ERnuSFLcM+NG2thU/9e1OhDPKlKkrMoczNQoAFMvMtHHfMNXbvQ5Wm663pmCTrdpDrJ+cAHYkb5Q8hYDgr+Fvyk5pec+1p0MB7OL26AhE8EzPwHjxp7FnHDq66sRSzmVRzjlzmAvjhD22sI6iP4vTbCKc2w+xE/8K4qR0C1PZSt9dgHKHiIqEOLHRKsUtwRq4e+x4mvlLw/Ul6jfm2l3vX3zjTbIpO7vVnybEY64ad6gI6NiDZEeRqNfkSjN6ryzMZtoRkydrx3cdMKlVWlkwA8XJW9WqqLNEqbcYKjZJ0JKrKOk8UUd6EMp/neg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zawqiGctiqgsqIuytYIQ+CcgWJeCl/TshSd9QxtEhoI=;
 b=Oslcrrfiv+mN1GrgXpjSBan7ytPTk9CZ6iR1ly8WEMvqNS68VmFskcPKUz5CywjwgtA6Wb4hiIec0FbPfaeXsF2C7pO3MqZFWJxI/55ci8YoPDQYNLJ+TVMDBC+898jZ7ZUX+7y8QFRZpyg35sW86rXwlF4vn4pwwKT1wZdopgwPmR3RhfKDuMTHsqTSaOUUbCXgzeeowq5Fto/hWKeKQBeWiq/MrObpi4CQt7c8NF2hdWe3+LVPZXscZ8+pLzFepb573A/YBCChImnIDTAmnDLHaenKEB9OVdz1AdhLA72UO0auPLYbKVCDuEzf6QMHTKZQ5XMKbkvIpcMqcyFwkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 19:03:24 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 19:03:24 +0000
Message-ID: <9d23b022-5929-4237-a20f-7ffb90df6ab0@nvidia.com>
Date: Thu, 6 Nov 2025 19:03:20 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] memory: tegra186-emc: Fix missing put_bpmp
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20251106173240.1724099-1-jonathanh@nvidia.com>
 <aa8c480a-05c1-4dd0-8597-afa423539cce@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aa8c480a-05c1-4dd0-8597-afa423539cce@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0368.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6e4fc2-5cc0-4461-b435-08de1d672950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1hxUW51bExtUDNjMVRDWElWR0dMNzJ3N2h2eHpnZmVOSUpmYlZZRmZIODln?=
 =?utf-8?B?VGVkQXRaR3dra2JZOHpuSjE5Sk1Fb1FGMkhMSmR4RjREQWcrS2pUTTQranFN?=
 =?utf-8?B?emtpVlByTndIalBGSUFvSnlDMktlVmZ0SHcycGN3eERsemtuRG9heWlveWJY?=
 =?utf-8?B?a0l5b1JqRlF4SXBCWU1mTWdtVnJtVDFRNmszelluS1lBalZ5Y2x1NW5yYkdY?=
 =?utf-8?B?am95VDVWU0tpYWxzNEkxeHFpOGllUXJUbFlsUWJjWnFtOTZsREFKK1A4Y1U2?=
 =?utf-8?B?YU05OHRJamR4OEJ6WGtjV2x1dUUrMHloU0k5NHE1Q0IvZlY5MnBmNCtxK0VB?=
 =?utf-8?B?WTNmQkM3b3BaQlZNZzc2ZWhFcmFoWmViUmt5cHdNYlpXSyt0YWsvQVZNMHlh?=
 =?utf-8?B?S3k0TGwyMWtVbE5qNnNVMGdWV3BSVzB2ZmxiMEM1Ulc4QzJzbjZ6TU04c1VV?=
 =?utf-8?B?Tk1SdW9tdlVESXlHUDBCL255R2tCTXpVRWtLL1NoTENQN3VoaGNVOHBsVUJw?=
 =?utf-8?B?Ny9PV1ZLNm5ieWs3RGJ2TWcyWEdCK1U0N2o1VzFzR1o5MWpqN0hXTHdrNFJw?=
 =?utf-8?B?UE9WUThpN3B0MWJFSkFuejZXSFJOOWdWWi9xK0xsVnIzbEpRMmpCbm1VZEVv?=
 =?utf-8?B?c3ZZSVJucis4dTZIWEdSMmRwTWVCOXBSRWNYYmNKc1VxLzlKOXo2YzJ6cUpL?=
 =?utf-8?B?SDhFOFh6ZEp1ZnphbEo4UEtXZmVxYytOS3FkSHgyUUI3N0lmSEswRU15M0xL?=
 =?utf-8?B?N003TVNVU3lxR1FNa2kzVnFEWXJnVU9QeDczWnNjRWNpdklBeXVBRTRzQUJk?=
 =?utf-8?B?NS9wbnZCSEFwWFB6QWcvaDBMOFpCelZIUTRINTA4M0xyWWx3dDhtdnB3dkFr?=
 =?utf-8?B?QzFpekFVNUpPUmNmOHhKZXN3RkdremFaOUpib3VNTGxlUHpQenZmMmVCQzQw?=
 =?utf-8?B?WUxwM3FCUHZNL05RSWlCVXpyM0c0MTh2dGIrcjBsV1VUeElGbjFLQkdQcjl3?=
 =?utf-8?B?OE1XdnBvZkZnc3dYNGd5M3FueFNBWWlmR2hSd2RkaU1kVEFRS3p3OXl1OUx6?=
 =?utf-8?B?Y2k2OHE0ekhPdUtOeCtneGZjUzhhdGhuOWNxNkMrMU1zaG5xMWpMOWY3ckYv?=
 =?utf-8?B?VFN4MzhGRThrYVlKOUxzWk96emZjRVdCSWZVanlJRm5NRmtEQWQwVjV6cDRn?=
 =?utf-8?B?eXVXUEJyNXVheC9MY3Y0UHpTeEhPZitiRTJGQ1VOMlZwUCtOZVVpWVFkb0li?=
 =?utf-8?B?dkZIMjY3LzcrZVV1MkFZV1Z2b3F3cmcwdWJYZnlMYkRhblRLaVBJK20zUnUw?=
 =?utf-8?B?cWVqM1N4M3RCaHpDQXp4RTFyWloyS0RJSWR3WVZjbUYyaXAyMzRjaXVEN3d6?=
 =?utf-8?B?NEdwd21yNFBoY3AyWGFnejZtNkRwNWRjU3RlNktvUHJXS2xlNkwwV0s0SklJ?=
 =?utf-8?B?Wk5PZGhlV2tqSXlKcUZOdUpqL05OQklieFo4TjJlUzFDSVBlR0xBNlU2UXoy?=
 =?utf-8?B?d1dmbGFBeUtDTFA2SzZYVjNZQ1JjTlN1Yjl4Zk5WTEdoeEtsZVJWbnpsMG15?=
 =?utf-8?B?Tk9TbDJpaFJCdVBMcTBkbVUzM282RUxZU1lGTGJyZVRvNUs5SmNjRXNxazJQ?=
 =?utf-8?B?bDJrQ21YYjFsSGdRZXdrVjJyZ3UzRk5pZUpYRnl0a1hPT2EreXVLQlNsbVBh?=
 =?utf-8?B?ei9zZmVYREtLVEZ0MHFnbDNhc2FySnFWNFphaHZYT0RnaVhuOTdZRXk1M0di?=
 =?utf-8?B?NHJBbHpQQzlEY0FhSzBlS3ZIWnhUcXhzejF6NGt1TXZwTkZXSG9BL3FyRWlW?=
 =?utf-8?B?UnUvZkgzVVRHcVg2Ti9jS1VncEJuR2dQam9ReEVmOWVSQldLbWdLVnl1Um0z?=
 =?utf-8?B?aW9hOVIzZTlJczhGN1UxM1FvSWFZRjFSSisyeWROWVFseDFSWTBkWkZwMVZS?=
 =?utf-8?Q?WpdMgyMdX4weAKfhKq2k/ojCZ5M5zuBJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXZpNFhnWEp5cVRVV2lOcGxad01oam51ZDVDS1F4TXpnS3pHYmN0ZzlldkJy?=
 =?utf-8?B?NSt0d0diU0lpNFByMFNEQndIeDRlOFlSbjRTQ3o1anZrV0VFcWZZN29QN1Nq?=
 =?utf-8?B?ME01SWtYbDRGVi8zV0JmdzFTbGE0MlU5RWpZUUtObmpxRitwTXY5T21ickg5?=
 =?utf-8?B?MHprcHJscnQ0RWYvNmsrdnkxMzF2R3YrZHlrK1orUS9jUlhJbFkyOWs5bVh4?=
 =?utf-8?B?TVBWNzFYdk5aOHFZNHdDd1NpeTllSDFBbWlERWk3ZHMzZGlsKzBNdVoveGc1?=
 =?utf-8?B?UG9qbmpvV0tEUVV6NHNxNzVFRE1sMTBpUlBGOGRTUTdFOGloQlQ4TzV2cmxw?=
 =?utf-8?B?cG43NXlKQzA2bVpVUmJwVERZdzlLYmtHRmplbkpNVEo5WEhtZFJhcGJrN0Fk?=
 =?utf-8?B?UEtHZHFkbFVzME4xSGFMdWRJbzJmZjdjZTVuL0VXeUxjanJJb29kQnBvNmIv?=
 =?utf-8?B?UmZKYmk1OHAzZTJtTktPN0JaTityclcyWnVwOC9MYUQxYmwzMHhNZnFqaHRv?=
 =?utf-8?B?emQrTVlUQkgyQTJ3RS8rdW0xNmNHdWYwVDBJM3JHdytVWGhsRzc3MTdTaVp0?=
 =?utf-8?B?d253eXBvV3VhWHgybG1idnpuSFBOWUZWY0g4TlNRMlM5UjJKNVFSMWp4SWk1?=
 =?utf-8?B?Zlh5aS9xN1VpTzlFaGdocnlIcitQbEt1T1FKZTBLenVjMXVJOGZ0ZU1MODky?=
 =?utf-8?B?dnlHTDZyZVF6VGxlNm5ObUE5ZmNyQWk1NzRoOEpBWEUydWY3T0djaS9BQ1Vj?=
 =?utf-8?B?RmE0akUxMWpybG1xdU5aemc3dXBUMHR0eWZWOTBYUnh1MElYSVIxNlRwdXlx?=
 =?utf-8?B?NUVvL1J5TUt3RVdGR0huaXdvSVJHWnZnRG5QNkNZdWRMOG9Ib2w3UDNxVkwy?=
 =?utf-8?B?YTRLYnZCUWMrRGtFWXVLZG54TXQ1dEZTckV3VUVGWitpSEdaWjg2MTdlU0ty?=
 =?utf-8?B?VVNucEYzbUIvUEIvditPY3VJNXoxZ0hid21WbmJOMzFQV29YRk44ZmRJekZG?=
 =?utf-8?B?cU54RVRqVzdRL1BWa1B2TXdocVNQM1lqNSszM0p4Q0RpZjJZNzhJcmtlZUdC?=
 =?utf-8?B?NkdOT2VkbW9RTTl6b3UvbFczWktPTTNUZkRNTm5DVmtMSTJqNzlZTVZkVDhv?=
 =?utf-8?B?dC84dDd6Ym1xVC90Nnl4dlpTN3ErUER0RjdpL3p0MEd1VFhoalc4SHB5cHhX?=
 =?utf-8?B?VXBqUU1XV2tFWUphSUNsdURuTkZsK2dxRGhoYVZzSTZtUDA1S2VsQ0VlSmM5?=
 =?utf-8?B?WE1XbThiRElYOXJsL1owZFNSZ2RnK1hGUVFreHorcWszN0VuMTFObGNFVjZS?=
 =?utf-8?B?b2cyOFpDU3JKaVlCQkd5UGtRYVdUdWlyRGI5VUZkckIxNlJUS2Uxa3RLYlJK?=
 =?utf-8?B?YTl0cEZFajVHMlZmMHhPajJqQ3h5R0I3clRBOHcvdTRPS2RVRy8zTkpvbWtR?=
 =?utf-8?B?RnFDOG93akhhTTFSUTlaYVRMZTNUUW9FZ3VISHBYRkIvY1NBQm0xU08zU0Er?=
 =?utf-8?B?UGhydGVUQjM1VWZ2Qkw1c1ZhRDhESEt5Z3pFZ1czK1M5WXo4WEJqTFVQYWt2?=
 =?utf-8?B?MzhWODY3bWpWVlp1MTRuWDdFQ0N2QlI2bUdrbCtDaXhyeWpBZnZZbWJWOXcr?=
 =?utf-8?B?Yk9hZ2pzSDdhTEF5WVdnVzQxOUFRS2svOWpsMEdBZkE1UjR1S05qbnlmdU94?=
 =?utf-8?B?bkJlQXhDVTJHUjdnNnNiRVBHWTVtVVVQYkVxdlBicUh3blp6SEZDS0JJbTZi?=
 =?utf-8?B?bEdwNXdDUHJuTDN3KzlNblp6bnFLbnJFVWc5WDNtTEFTQTg1UmdNRDlqU1lt?=
 =?utf-8?B?cE9DQ1FEOUdsSGNBaGFUc1BJOWFsa0NpQmxuMkswM3ZrWnR3VllDTDg0Qncy?=
 =?utf-8?B?WldxeW40eEhlaUMySmMwMVRwUEx6UG5ZQU9kdEgwMTdEZDVQWTduaitra1Q4?=
 =?utf-8?B?R2tvck5hTXNWSHBKN1hPWHVDREZ6bzhqakFIQzRoQXZZUGplNjgvYzRSQ0NL?=
 =?utf-8?B?aVZTZ1o0NGtwakV4c3Fxd0p6SmhQbXd0RVB3eVRlRU5Rd2VhUERoNHZFZmNE?=
 =?utf-8?B?ckF2WGxiaGlPdkRQOTdBc2dqb2RyVTN3aktYbFV4M3hXaTZYdUlCMzlueDk4?=
 =?utf-8?B?Z2Z6YkpGQXhHU2duUEtjRG9Ga0lmUG9QZ3R2dWhkaTEwcXRuYWpQdFd2YlAy?=
 =?utf-8?B?eWlYYjB1Qi9lVkgyUkhCMlVkSGlrSUs4ZDNuT0I3UXFGelh5amtRcDNBS2Mr?=
 =?utf-8?B?aGpsSmdUdW8rQkgzMHVEYW14aUNRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6e4fc2-5cc0-4461-b435-08de1d672950
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 19:03:24.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TN800v99JDjny4ti853PSKGDXzAvUZ+hox9brFov9zHjqxS3w3A4/zpXJdk96X20WMMVCiAtxLbisFZtwKqLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148


On 06/11/2025 18:35, Krzysztof Kozlowski wrote:
> On 06/11/2025 18:32, Jon Hunter wrote:
>> Commit a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred
>> probe with dev_err_probe()") accidently dropped a call to 'put_bpmp' to
>> release a handle to the BPMP when getting the EMC clock fails. Fix this
>> by restoring the 'goto put_bpmp' if devm_clk_get() fails.
>>
>> Fixes: a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> Changes since V1:
>> - Fixed dev_err_probe message format
>>
>> Please note that the commit hash reference is based upon the hash in
>> the -next tree.
>>
>>   drivers/memory/tegra/tegra186-emc.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
>> index 74be09968baa..43595fd9c256 100644
>> --- a/drivers/memory/tegra/tegra186-emc.c
>> +++ b/drivers/memory/tegra/tegra186-emc.c
>> @@ -448,9 +448,11 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>>   				     "failed to get BPMP\n");
>>   
>>   	emc->clk = devm_clk_get(&pdev->dev, "emc");
>> -	if (IS_ERR(emc->clk))
>> -		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
>> -				     "failed to get EMC clock\n");
>> +	if (IS_ERR(emc->clk)) {
>> +		err = PTR_ERR(emc->clk);
>> +		dev_err_probe(&pdev->dev, err, "failed to get EMC clock\n");
> 
> This still should use standard dev_err_probe syntax, so:
> 
> err = dev_err_probe(..., PTR_ERR(), "....");
> 
> which saves you one line with earlier assignment.

Yes that is indeed better!

Jon

-- 
nvpublic

