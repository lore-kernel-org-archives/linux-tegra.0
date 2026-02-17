Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C4C54739;
	Tue, 17 Feb 2026 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771302183; cv=fail; b=mtx7t7twNK5NCVfKsgvYjbBOplXCYOeLavUjV/SBJOfau4aVYR7ychfvBcRZMS8QihjJaP1YL21OnHAWw8B9xrZQgtpjQTd2vRjq7PQS5VuV1SIkLRVZggUSp3Mdq6ERLPPhI6sEPbnmhyFqhsE1pZF+tRtT+3yEbnn+NMiwWcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771302183; c=relaxed/simple;
	bh=4b7l5dp4tvr/CZ6C0xuM/hL5CLp5rlhMj60smTZmTEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQ148ibfQdU2tBc7xNYItotTs7poRkPKJjxyLHbrzASQQAUKJ9NLJCKTdCjYxmtGzvVvNs+cLqL1idMhgIFV+JhEYA/CNyeF595p+adzkeLHQoQWD9t7UeVM30xkR9qBnkrmpxjzH8CZkpJaxpSwqRzQ2km70s7F8IQMCBd5ghc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oiVj5fka; arc=fail smtp.client-ip=52.101.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oiVj5fka"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5ZrPq+2+JMBwVm6eBpfVCXzcOScpvZ7gZbEinOGO6TcYp3FRQN915I8xAVljiT48s79HFPZNJAwFWIaKdb9YkTNZ/3/g7gQHbKOpv49OctzzQz/BDlIZUAdzOetANydgGkDxfpbk9cTG3DoP/yA8rdykyzuRCAxhuLyBmlhAthvF6lD3bCxihWkGo5GWjUy0w33GJss5921tbq4lcvJdlgj2M1LxeCTp8bUonBHJxmhYYRdgteEbbB+mq0VmXunrteWOedRRpcOIZwBH8+XKSxykrWtJb8sOBBD4QPB9a/WUFuR90VCaMUDIfwMvVWeMB8riy5a8R4IOVRg1M5fPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3CIEww9EabLQRUa5LN2lC/Vk64cKMZG2vuSfpYawYs=;
 b=x91vly5bJTibxVh2hAl1LIFGzH/oNJNW+BoqIlj7UvFTWWYU0k3rrkgy8Rwr474XCMfPiJ97wxMGtEkenCWYm8iWbAHAh7kuFMsjlKvqeSS/PAQ2z/dUxxR0gWKIZQofeYKQ6GQiOMRGGlUazTo8kH+zQ0NIVANd8XedHEx14wcEk/zhpRE7u98QgbuSagH4N2eqLYGtmdXmkZl6lYTnlMszgpSHuKgqYcMNHLNBV3RvaWpNBqMAYXnjycz1DzeveEM4Cmv9medk60wMS081JdKWrNSxcZwLimfyBNm1yN+Zd6Ja4Lqq0Mh0fiua+66RxY7iBy1DbgcighJICOVPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3CIEww9EabLQRUa5LN2lC/Vk64cKMZG2vuSfpYawYs=;
 b=oiVj5fkabzUW4yAyYDBXGJSuErr+CXpHivkhzqEA5RgiY5bWEoWK7/mDISZSmYjPYpAYOb1AceNdXT4UAO1dEhbbqs5a9ncmhZrybvNmg536035NZRZ9qGhYPBaJQ4/A6vMv7VcVzizEscUDHdlgCU2ylsYxQiCi1aIwVD8lE+WrdI9Rjez6uO7mG810mfXEhbcpCOY2nKQWH6qMVcEjAcEyxM+TOLTo1sm5qTjVYC4YMZozkPn0ronp2K/ExQYHuIKej5XqMq+oWtlshUwztVWy3ImU97dd4Kw29JVekrcYf5J9f3KF+SZXU9lzlRGtHJlvyJy9h37D/4B/9dOqbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 04:22:57 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 04:22:57 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Deduplicate rate request management code
Date: Tue, 17 Feb 2026 13:22:55 +0900
Message-ID: <12216338.nUPlyArG6x@senjougahara>
In-Reply-To: <2891e25d-33d0-42eb-8da0-b57d50651c2b@kernel.org>
References:
 <20260206-memory-refactor-v1-1-4385d439558a@nvidia.com>
 <2891e25d-33d0-42eb-8da0-b57d50651c2b@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::17) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6e5eae-1807-4284-0a7e-08de6ddc3a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEt2QWphbmpwYTlLbHZ4emhtdnlJaVFHV2Z2TjY2UHJDNGVMTkYvMnRNWDh3?=
 =?utf-8?B?NTYvdjBROVNaNjhkZFJUV0F2NTBaQzhzVjJ1ZnUvS3ZtWHFMZktCMzVXZW80?=
 =?utf-8?B?aE9BRUhHaUI4R3pZb2Z2NDRuRjQ5aXNTL3EvK1hRSStFbHhaMmw5RHdrNURS?=
 =?utf-8?B?ZjVZRGpWS3BKRW1mcGU4aUFBM2x2Umc3bUxwZmJ2YzBvbForMlVaTk5rcElZ?=
 =?utf-8?B?R1RvOVM2dHpraWx4NlNQdTJST0NrOHczMFA0Y253WXdOU3U5eWw4OVZ5bER1?=
 =?utf-8?B?cEpTUVN6QWV4V1BqbnNmalQwM25BeXJsdVF6MHR2T2ZTdjdYUkZ4REhJQTgy?=
 =?utf-8?B?WHRSUEF0Qk1nWFdmUDVFaWJQM2kzODNwcUd2RnVoTGNKTXlaOEEwOEh0ZUha?=
 =?utf-8?B?U1EvS3gyZWgwZDlzMWJXV1U0VmlLWmxmTkdnekluajY1eVhKekQ3OXV5WVZz?=
 =?utf-8?B?alYvL0J2cW40SFZua1c1VHdqUHk5d3ptY2taMWI5NmhPNnVINVRQcTRzOUFa?=
 =?utf-8?B?ckRpUXJtRzdVWGsyNWVyUEV2OGUwcnBkcUpvSDlKekZvU2U3Nm5BM0FjUTh1?=
 =?utf-8?B?czZQeVRIdDhkbjhMczduNEl2YlBRMlMxTGJwNmFyWnFkQ2lQeWtkMnFxeDg5?=
 =?utf-8?B?NldNNmFva0wwMTV6S1FORC9mZlJ6M2F3RXJoczAyOHVLNWJFcFZGelVYRWht?=
 =?utf-8?B?OWhOaVUwU1BXdGowL0tBSWNwYzByQmRxcktsVkdSVzFxc1VudWdjNUZpMEc4?=
 =?utf-8?B?OExWSi8yOEcwZlpPSTduclYxc3l6VnBSQ2wrSnhxSlFQZktMQkNURnB6ay8r?=
 =?utf-8?B?UkhjRE5qbUp3TGR6QXRNTXgrWUE1eWNFR2JyU0RyS1BlRkxjc2RnS2hXU1JU?=
 =?utf-8?B?Q3NLdzNXbldDdytYbG01b2N4ZHNWS2VEcGVSVEtvVW9wWHJvYXNvdUFVcEgw?=
 =?utf-8?B?RXJPRitKOC9vbldpYVdaNVR4STZoTldMcC9LMDB2amJHakhWUGVlTnFrRXo1?=
 =?utf-8?B?NEM1YjVTMnEzcmcwaG9aR3E2MDhVV1RsVHd0OEkrditUS001Slc1elVIWEhP?=
 =?utf-8?B?WUppdU96QTUzSG9JdW5ha0txdTlZUW1mc3FWSzNKaEVVTGFNMldwSzVIUUo3?=
 =?utf-8?B?eTcwem0rVlMyK01yNjlGUTg0MENlbk5DQ091ZG5SSGxHbUJzOWE1K2hSUzNq?=
 =?utf-8?B?K1Zkc2JCZWcyQWtKRjRpdWpnanFORFZNcVg2aFhvR0cvQmxnVFNOcm9kdGNq?=
 =?utf-8?B?bCtXSEV5TkhpcnRtSzU4Q1Z6VVdmRFQzZVoyczZOM2FDWi84WEVLYW1hVEpH?=
 =?utf-8?B?QkRlT3lEUFAwZ09obVFuZ2ZXM21kTlpuditJZktydXV5czhxSGR5MVkzVGdv?=
 =?utf-8?B?bWFVVUNudTlmajg1RnpTQkc5NHhtSHUxbkhrMHpHODd2YldrL2xUek9uelhV?=
 =?utf-8?B?RXBQREVmR1lVa1h1eXpJR0pKbU1uc3NrSE10SUVncEMxRmhKeUVuVmZNMzhP?=
 =?utf-8?B?QTFyUVVqSGNueDBiSmwvYVN2QUErSklIemxIWnV4MThTTVREeWxCSlF5aVpF?=
 =?utf-8?B?SGN3OFFJWmo0dC9KM2h0MTBHanUrMURPL1lFcXNyaVhJVzZHME8vb2R5UU9C?=
 =?utf-8?B?V0tjbWVIc0pMMHFmVUExSjg5cjJaL0g0RC9IM1lwR2ZQZFZBbnFDZE1rOE5q?=
 =?utf-8?B?dVRmNGl5Zm9uRlRpV28wV1g5TVg5dDVKL1owcUFRb3R3V1NBN2dKQzI5RExY?=
 =?utf-8?B?cHpsUHpOejF6R2lBaGsreDRKenN5U2JiOWxycnZlS0xBbmZpdHNmTk00d05L?=
 =?utf-8?B?RXFxSDk5K210Z2laeVlPQ3A2bVZqMGs2dWhNRThBWXBqSEpYVHpjWWEwZGRX?=
 =?utf-8?B?ZStCVkE4NG1tWi9ocTZJeDNnNTMxenhHY3V6Z0Q0dHd5LzUyZ2hIaldjSkFl?=
 =?utf-8?B?dHFuY1U2ZTV6ekxMU1dTYUs1ZlJWblBTVzNIaXFqRlpHbjhZR2hZUEthQ1FX?=
 =?utf-8?B?OGtnZGpjR1A1ZnRtNzMxR2o0K0hUMmJDNkZPVTZSRXd2WDl3NldtVEQra0hj?=
 =?utf-8?B?RlliS0M5MmpuaWRPaVZWSFNDU1dUT0gvYm90ekQwODByYUFYSUR0WTVkT0M5?=
 =?utf-8?Q?jxHQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDIrOThCd1p3MS8xNTFUQmRuYmhjSEVvbDlDbm5ydXhhUlJPaGIxZHhFd2pK?=
 =?utf-8?B?NEVVQnc5VXJIUUV0UVFaQ3FTQS9TY2k3Z3FETWFSNUNzazdKWHVSS2RYWisy?=
 =?utf-8?B?QU9EZ2FnNFgzVEdoVmNXM3dNRlRxdGY2OGVyemdPRUNDT3FuRXpjMllxR256?=
 =?utf-8?B?dFdpRzN3c2NFb1ZTb3RQRHFKS0lhUVREMGNtYVhORlY1U1cvalo3Tmo3TEl3?=
 =?utf-8?B?RkF3NGdJY0RpZ1Rldi9UTCtORmhmSzF0SUpDc0tyaTFoQU84Qjl3d0gzZ3Js?=
 =?utf-8?B?amU4dDhCMHN0dE5sNjFvV1NjMEY1YWR4T29rZ1VvYlQxNExoVWpQaVdBUG1w?=
 =?utf-8?B?dkhucHNhQlZhcEwxSnd4NHdiQmhrNkwvNDF3YVVDUzA5ZWN4K3M2WS9hTjcw?=
 =?utf-8?B?LzJrdHV4N0tzcTJrazgxTmdLTU9XSU5TWHBFTStJblQ5OUZodXRNWUI1aElk?=
 =?utf-8?B?bmdBdGlwdCsxMHYvMy9iNGExR2VTN0prNXMzQWVlWStDalppR0xTVFUzM01D?=
 =?utf-8?B?QUJ0dXJ3VG1jVDkvZ1ZGWnM3SmZKS1N1M1ArRWtQendzb0hmOU1vMFZTVUhW?=
 =?utf-8?B?MTFVdkIzL2NZcXFJYjlDY0p1RlNobjBnRW9EVUJYdnpLdTNVOG9rMHpTUldE?=
 =?utf-8?B?bXZKMnEybUp5MmxHQXVZN2N4dHVkNXFYdDluRjdxcHhCa2srdEhYMUxWcDRO?=
 =?utf-8?B?VGJ1TVAwOFlXclJtQ1hEU0QrdFBaVFVILy9melJOSGFlcU9oWU9aSUFCclhr?=
 =?utf-8?B?WklBM1pDaHc0YmdtaHB3QTk2TzAzMk5LM09kd2RyOXJJMndXbi9TTkRzMjF0?=
 =?utf-8?B?RTZMNzc4ZEhxK0xNWXRQWmEzUTFqQzFlRnpUN2lrQnVMdHpZUnkwSGhKbWlH?=
 =?utf-8?B?S3VLZlBFVW4zOEl4K2U4RGhDVXNTQXdqcHlBUVg0RGNsajk4aGdDSFpGY1F2?=
 =?utf-8?B?dnNMNW1hTU02Wk0xbmszVFN5WWduNmhKM212YnIvRTRnNzNzanZJQUpyMjRX?=
 =?utf-8?B?OTY2NEVTb2VHcHM1RC85K3AzM3lsTi9GR0tJak5HRjdqRDJYdDNRdk5mVkxu?=
 =?utf-8?B?blVEOEZCV2t3RWVjTlBhcWV1VFVwMHlheCs2SmhuR3hVYStQU0l4aEFkWWEz?=
 =?utf-8?B?eTNFalVMTXZsS2JScnQ1NFB6TTM0SksxMDNBZmJBWEpQQXcvYndyNk9qZWc4?=
 =?utf-8?B?UGF6MzJLc2c2VTF1dG5iRzRubHlJOTRzUlg5alZ4Nlp4Wnd5ZndNNlNNL0Ew?=
 =?utf-8?B?N1JHQU9ZUk1mdXlSWFRDcXZpSElVK2ozcnhML05FY3dMRUdJSEdQZ0NWeDN5?=
 =?utf-8?B?OFZSQisxemdaU2lLQUQvaVZvYTlIdkQ2NW13VklRcGxIQWZGVHZXUGovdElR?=
 =?utf-8?B?N05vZ1MyT29qbFlncng0Y2VqYWVaaldjb1NKTG5MV0hJSkt0V3VyZ1U4aXVv?=
 =?utf-8?B?S1FTSVhjbzdEbnREcEFmVGpsU0Z5c1UxdW9udzcwOVJGdG5LWVZINkRVRVpr?=
 =?utf-8?B?SG54RjhCMitLQjFiYkp0WElHcU1SaXRzNjRaVzQ0QUVNOUFDclE2bWFjaGNt?=
 =?utf-8?B?WXhaVjlYelQxbDlQdEZmbE1Ec0J0dWNSUWp0c1lxMDROR2s4UitwZlI2SGVh?=
 =?utf-8?B?bnpJdis2QlhwSDgvU1BEQ2lPaFhnaUt3N3E2bEtnME12OHRVVkNobVJiemZ6?=
 =?utf-8?B?Wjk3UkZhRG56RU1nOUxWSTYrQXMrdnE0S0ZpOG50dFlMZm8rY0xIa3JRWUVp?=
 =?utf-8?B?VUliUDV4NGErOEM0ZGZpK0NJL3NqWU1pRWJHeDFIdjU1UnlObjliV2pzQXQy?=
 =?utf-8?B?d0hueGxERGNqR0twTm40dStEaG1CSy9LMVYxZUxoemV6QWJzTWZkai9tTjBW?=
 =?utf-8?B?M0dKZFlWa1dqZHRaMmQvL09OUUMvSExoM0Yvc2V1RVVud2RuZE0rWkFNSlUx?=
 =?utf-8?B?L2szSk5qa1dwL3hsYzFyZkxTaTZkbWJFV2FKMzE3d3pnQ21pNE5aQXYyalY2?=
 =?utf-8?B?d0RseVJTZElRQmZxRGFYMitzN1BBRzAwcFhhcTJ5bUI0OTVRUVVtbDFOc2o3?=
 =?utf-8?B?SWU2SS9uVWJOaXR3RTQwbXZPUzBtSnFlMVJ3STk3bXhiblpXTHdSeFlYdnkw?=
 =?utf-8?B?NmpVNUZxRDJvSDliYllidEVGTW1rdUJtR0VybnFsUVFZN1V4czVOVXZmWlI3?=
 =?utf-8?B?VlI4cXhFWXFVUElrRmtDNGNlMk9oNDcyZTdXT1hqeUhpT3RnT0pBQUxWcGd0?=
 =?utf-8?B?RW50RmlaWGpYaDdSQ3ZSV00xVC8xMDlJQ3luUFZIUHFZTEozclBWQ2g3Sll2?=
 =?utf-8?B?UUNGZU8zR3NBS1J6dmJRWVNLcm1wU0UxMkRxN0lsazRUalBRdGR1TGQ3MjUy?=
 =?utf-8?Q?qZR8poIl9nWDHGhPCOLLGUoye6iMzART4zCDFTC3DXipF?=
X-MS-Exchange-AntiSpam-MessageData-1: 3pwP1oATBJTP3w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6e5eae-1807-4284-0a7e-08de6ddc3a62
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 04:22:57.4879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+s1b/ASpr+cyu+NL4wwD3SImgkuELBGGKoK0bNbKxcFMqzcwonQDpis0Qi0zPI+e1HYPSNTLP+C/Q2gabc01Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546

On Friday, February 13, 2026 7:24=E2=80=AFPM Krzysztof Kozlowski wrote:
> On 06/02/2026 03:54, Mikko Perttunen wrote:
> > As is, the EMC drivers for each 32-bit platform contain almost
> > identical duplicated code for aggregating rate requests. Move this
> > code out to a shared tegra-emc-common file to reduce duplication.
> >=20
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> > This patch is on top of 'memory: tegra: Add Tegra114 EMC driver'
>=20
> If that patch is not merged, then this should be reversed. First you
> remove duplication then you add smaller new patch. Not vice versa, where
> you add duplicated code just to remove it.

The code is already duplicated multiple times before. The Tegra114 driver d=
oesn't change the situation in any significant way. Sequencing in this way =
is just easier rather than disrupting that - more important - series.

>=20
> > ---
> >  drivers/memory/tegra/Kconfig            |   7 ++
> >  drivers/memory/tegra/Makefile           |   1 +
> >  drivers/memory/tegra/tegra-emc-common.c |  96 ++++++++++++++++++++++++=
++++
> >  drivers/memory/tegra/tegra-emc-common.h |  38 +++++++++++
> >  drivers/memory/tegra/tegra114-emc.c     | 107 ++----------------------=
-------
> >  drivers/memory/tegra/tegra124-emc.c     | 107 ++----------------------=
-------
> >  drivers/memory/tegra/tegra20-emc.c      | 110 ++----------------------=
--------
> >  drivers/memory/tegra/tegra30-emc.c      | 107 ++----------------------=
-------
> >  8 files changed, 167 insertions(+), 406 deletions(-)
> >=20
> > diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfi=
g
> > index 11e7cc357d39..aeda7f104d34 100644
> > --- a/drivers/memory/tegra/Kconfig
> > +++ b/drivers/memory/tegra/Kconfig
> > @@ -17,6 +17,7 @@ config TEGRA20_EMC
> >  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> >  	select PM_DEVFREQ
> >  	select DDR
> > +	select TEGRA_EMC_COMMON
> >  	help
> >  	  This driver is for the External Memory Controller (EMC) found on
> >  	  Tegra20 chips. The EMC controls the external DRAM on the board.
> > @@ -29,6 +30,7 @@ config TEGRA30_EMC
> >  	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
> >  	select PM_OPP
> >  	select DDR
> > +	select TEGRA_EMC_COMMON
> >  	help
> >  	  This driver is for the External Memory Controller (EMC) found on
> >  	  Tegra30 chips. The EMC controls the external DRAM on the board.
> > @@ -41,6 +43,7 @@ config TEGRA114_EMC
> >  	depends on ARCH_TEGRA_114_SOC || COMPILE_TEST
> >  	select TEGRA124_CLK_EMC if ARCH_TEGRA
> >  	select PM_OPP
> > +	select TEGRA_EMC_COMMON
> >  	help
> >  	  This driver is for the External Memory Controller (EMC) found on
> >  	  Tegra114 chips. The EMC controls the external DRAM on the board.
> > @@ -53,6 +56,7 @@ config TEGRA124_EMC
> >  	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
> >  	select TEGRA124_CLK_EMC if ARCH_TEGRA
> >  	select PM_OPP
> > +	select TEGRA_EMC_COMMON
> >  	help
> >  	  This driver is for the External Memory Controller (EMC) found on
> >  	  Tegra124 chips. The EMC controls the external DRAM on the board.
> > @@ -73,4 +77,7 @@ config TEGRA210_EMC
> >  	  This driver is required to change memory timings / clock rate for
> >  	  external memory.
> > =20
> > +config TEGRA_EMC_COMMON
> > +	tristate
> > +
> >  endif
> > diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makef=
ile
> > index 6b9156de4b66..28f22c957a34 100644
> > --- a/drivers/memory/tegra/Makefile
> > +++ b/drivers/memory/tegra/Makefile
> > @@ -14,6 +14,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) +=3D tegra186.o=
 tegra264.o
> > =20
> >  obj-$(CONFIG_TEGRA_MC) +=3D tegra-mc.o
> > =20
> > +obj-$(CONFIG_TEGRA_EMC_COMMON) +=3D tegra-emc-common.o
> >  obj-$(CONFIG_TEGRA20_EMC)  +=3D tegra20-emc.o
> >  obj-$(CONFIG_TEGRA30_EMC)  +=3D tegra30-emc.o
> >  obj-$(CONFIG_TEGRA114_EMC) +=3D tegra114-emc.o
> > diff --git a/drivers/memory/tegra/tegra-emc-common.c b/drivers/memory/t=
egra/tegra-emc-common.c
> > new file mode 100644
> > index 000000000000..9292472a5890
> > --- /dev/null
> > +++ b/drivers/memory/tegra/tegra-emc-common.c
> > @@ -0,0 +1,96 @@
> > +// SPDX-License-Identifier: GPL-2.0
>=20
>=20
> ... and that's why we ask for consistent license. Code in tegra30-emc
> has difference license, so I assume here you copied the one matching
> license above. Explain in the commit msg which code you copied or on
> which existing code you based this.

Ok.

>=20
> > +
> > +#include <linux/device.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pm_opp.h>
> > +
> > +#include "tegra-emc-common.h"
> > +
>=20
> All exported functions need kerneldoc.

Ok.

>=20
> > +void tegra_emc_rate_requests_init(struct tegra_emc_rate_requests *reqs=
,
> > +				  struct device *dev)
> > +{
> > +	unsigned int i;
> > +
> > +	mutex_init(&reqs->rate_lock);
> > +	reqs->dev =3D dev;
> > +
> > +	for (i =3D 0; i < TEGRA_EMC_RATE_TYPE_MAX; i++) {
> > +		reqs->requested_rate[i].min_rate =3D 0;
> > +		reqs->requested_rate[i].max_rate =3D ULONG_MAX;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(tegra_emc_rate_requests_init);
> > +
>=20
> Best regards,
> Krzysztof
>=20




