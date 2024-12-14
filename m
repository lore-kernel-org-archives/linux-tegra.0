Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0661FA4;
	Sat, 14 Dec 2024 00:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734136777; cv=fail; b=Z/vnFG6EMcrcIFpHgirNIgk2velgmdDJsE8EeYt12U5ZRew9UdqTQ0Li156igfAGo1tWGSS52e5vmlha6oANnqoDtlJsNU8y1uE2zolLDq/peCVT6VapuSj68RKCW6p75EJG28KVzE1tUKKpEElnIk3udJwTTeZqfgjOPNiHNV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734136777; c=relaxed/simple;
	bh=5B0JC40pF81qt3t56pLJeJAI35z3PMm4BK3OnL9Ls8c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dRMSyYzQBPEcJAuv6AcmZid2yaISCtafz1B44j3Naj0nCl1UAQM2bVVnUIK8XzvyZgctrcZQmJZoGX1Th8RQnTIDgUOejQk9Wyv0K8A5+mi9xTyPH2U3FDT9vBaVcU/QHJaZEFMQNFHHq7WSkyzATpwuGeDj6loYNmfOuE8pO2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=byltZDCA; arc=fail smtp.client-ip=40.107.244.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="byltZDCA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVH8ScXkjoClvEWSwrH+i1tq7I7tosDMPVdySGBQQHpw/y5ru9UrWoWV5R6wdtFYNHnimuNcDVfjuUyiMivdBTb9oV16CyqLGlPUYFG4ftQtRfA0eqAWPCCD8qD5rb4TyMo/VQtodqagcETN4mJyUr604e6LEhXMLz3ujBCQOpuM2YXu4+bvRfzaHHFRmjIP4m4DjFLXa9Mhpq2QrWxD2FK+AoN7NcfqOqJPx22ZiCUVgMFyo7w4xC6lgoVehD4cV4Fo372xLuqNCZSQV9sX0FgCmK6a0FOCtxtgZBJcXwkrl/N98xnkOhKkvHQbYUDmzXw8stV27Zz21AgPxgPSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfGD23/5hAj26aWh43DthiCUMdhOBySaZET+N+B0lDk=;
 b=BI6D4YbLkBIOZCPZAlZ9i6/fy75ZAfB5paADSTi8rGWMDmm7H6VxQl22OVcMiJUPDJ/ZymqdZOj/ssLSRnBOB6oHsGAl1zCcekTjd2604gOZH/BkJTgCbU1sakcTpvf29MY9rT3vIMG2zW1SLkEBFnLmrp1RNR0Xk0aHbQ3S1bl2cq9kY54JZF9gGapYZr3HW6w4uO6jrQpf3h1ULzimTH/qIWJBWBP7fqlwTikyJ9yKA2lK9TY2yu/PFjGviLjO+uZVmkYcfn2yaf8Io737fOWcajcifbTcZVt3hhgAzHCiEXWamiEipSCpRaKDZSlhAu0e8JnSttMApinmZrrbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfGD23/5hAj26aWh43DthiCUMdhOBySaZET+N+B0lDk=;
 b=byltZDCAiQyPQ4OdXIrnXN67REg+grpgk0Un99HKFN8QznJOZIzllQkk6UJQmNW/Y/vrGSqS6niBmLPuzsIITwwfVHzJTbrdR3elMWJ4c5oC9XpxlyfoShseIyN+j36ha5IGbs1p5coCGtTgoVXquXSk+TTn8Uk/ZjdzdJgdI1TQPzqIEafDbJBalvpJHjOuWOkwPs8bYLz6Y8A7jHgCzmDygOZJUaeizmpsnOMAXsc7PwtThW+8JKFRj4ExudJoaKSZZUNZrdKOm38S1uLqc0I0m9HUV66XZ+VjLSFaerbaP0Y7eIp0o9M9u0YVwYYuGNF1AcByC+Ts3EXhllGBQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.18; Sat, 14 Dec 2024 00:39:32 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.8251.008; Sat, 14 Dec 2024
 00:39:32 +0000
Message-ID: <6a3037a1-d047-434c-a927-d21629743bf4@nvidia.com>
Date: Fri, 13 Dec 2024 16:39:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: tegra: disable Tegra234 sce-fabric node
To: Thierry Reding <thierry.reding@gmail.com>, Ivy Huang <yijuh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-3-yijuh@nvidia.com>
 <l23rd5dt2it4tvh26225a5ortsl7wwhwl64tyncn33mpamdkxa@5mo7hiasunki>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <l23rd5dt2it4tvh26225a5ortsl7wwhwl64tyncn33mpamdkxa@5mo7hiasunki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::11) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: cb62fbc2-5f97-47d9-95aa-08dd1bd7c6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGJ0Q2g2azFDalNickZIaS9hR0RRKzdWNWgrVjRGTE9HbnRES1N1dnhtcnlB?=
 =?utf-8?B?OGNORXpNVWZ1WXlxb2M0MDk4TWs2RThqeTdTTEZNd0R4VE9mN0FYZG9vNzE5?=
 =?utf-8?B?TmE3OVpRQWt2YXFWZUdSdnNUQitSMmhmTFhibVBBZ1JSOGNEdk5sUWZKYmw2?=
 =?utf-8?B?Sm8zTmhNRGhVS0k3Vlg4UEIrS21vWjN0WElxSzNXb1N1YW43QkdQNUV0VUFv?=
 =?utf-8?B?ckxCK2g1WFVoYnF1cmhwSDZ1R05XZ2JNMkhiVTVYTzIzUUNMd0tDdGlCdWlF?=
 =?utf-8?B?ODBBZkFPcjNyZzdYNTFIOHNFU29MOCtaR1A3Ni9WT05TekJQWThmMFVRRTNL?=
 =?utf-8?B?aEVPYmtmTGdqeThPdHdSR2hRbUdsTGt1eTA3UWZNeUozNEJpVWFLd0RHSWwz?=
 =?utf-8?B?c29VQzloMm5xNzhyOFc5QUt0clVHZi9ZcUZwc2xsZ0g5cDNTY1Zwc3VRQThv?=
 =?utf-8?B?U05UZmpoOFNnWGJUK0FJaUQzVDNQU2hjMUtRa2V4bnMzTVU4VjFheHMxVkNo?=
 =?utf-8?B?aDFBRnRWcFA5aVRQcndmblVLS2NsZmJzMFhZUnRTY1J3U1hTN1BCZmV5bDBI?=
 =?utf-8?B?THlIYjIrVGF2UDA2ZzFzaHMvVkg2aCs3dXM2SXpOUUdJeWpUQ01PQ1FaZnN5?=
 =?utf-8?B?bUo5UW1NUVlVNnNsUTFtWGZDdWxNSHZGdDhoUW56ck9WbVM5RzFnZndRLzBy?=
 =?utf-8?B?NzQ4YWlKVWUzUy81eW41UEFSQlZsSGZRYnBkS1pQN0JpclE1N1JlRWo4dXFz?=
 =?utf-8?B?TEVLZi9KSzI3b2FZT1psVi84OVR2R3dkQ20weUFLZzFtMWF5SkpGc3plREdF?=
 =?utf-8?B?ei80MjdPbmd4bXVBRVgybk1Ja1Z3YS9od1NEUUY0bk8rNDBndEE1Q3E0R3FK?=
 =?utf-8?B?MGduMElUbWhxN1lDbHJoU2VYcXE3T3lVR3VNQVhIL1o4MVNzcFMveEVFZ2sr?=
 =?utf-8?B?bnpmRWwxUlZ2M2ZMbXJGZTZMVUNjOXErOEV0OEZmMURnSW1ubVBoY0ZRODl0?=
 =?utf-8?B?MTQ2Y0hqUXhHcWtoelF6b2VIU2Z4RitMU1lzcm01Q1E4Z0tNOVJ5eVk4OHJP?=
 =?utf-8?B?ODZjb1p0RTRhTHgvMDNUVVJwOGRkN0lldFB5V2lvbWZ6cllJQ1ZHU3Q4eWZJ?=
 =?utf-8?B?YkZuZXhTY05CM1hramJFRnF3RUxRd1d2d08wY09oeFRmb3VTenhVZUZRaUdT?=
 =?utf-8?B?WllwcHdGL2QveGtTL1RZMzBhdG5IaGx5YUhyMzZhNUwyQVBuaWljUTNvV0pL?=
 =?utf-8?B?d1pYaXBGSGJqK25QMXZZR0NKQ3dWbFBFSGZLZWYvOURSMmF3Qmc2aCtMaXVQ?=
 =?utf-8?B?SUFOdzMybDhRWlhlT0pjRVVzWTExN0hRQ1c2a2wwZG1rT0ZLQ1c3QUc2QTF1?=
 =?utf-8?B?NEJ4Wis5R24rWVFydzB4bFUvUDN0OTA5MDh1T1ZHN3M2MTRlNVFiVlg0eHNG?=
 =?utf-8?B?d0tsVVl6aVcwK0Y0aFd3Q0l2aHUrK3VZUUFOb3k5bTRpMDFFdDJiVVZXWFNR?=
 =?utf-8?B?NHF1eGI4WmQxR1lUOVNvNFlLbStxUW1rMEdiaXBTZzFyZTlRY2pUaitPaEZL?=
 =?utf-8?B?d2I2K3d5Z2pvN2pnZ3ZMcExnRHhnbEp6eHQ5OUY1VTBiZjlKa1NSYi9LMjB3?=
 =?utf-8?B?NTI1amFGaXZGTzJDVHppNGdDM2ZSQnNlUjJBVHJJTWN5emNZejhaa0Q0Q0ZF?=
 =?utf-8?B?ZHRxK3AwdUNFck1mVHJ6cmMxQlU2ZGFHc210dVZ4R3dBaEwwamtOV050N2Zt?=
 =?utf-8?B?YzlDOVpTZzV6RTNoUHJXV1RWU3pNZDNIV0U3NFp0UXJlQ3paUW1scnZuME9a?=
 =?utf-8?B?MVF6T1NyejdMOXZNL0VPdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODJEZWtkSG1Qazg0TkZNN1BRaGJOemtua2Ribk9qTStlOGg5aUE1S3NwSlB3?=
 =?utf-8?B?QnFmelg1ZDNVV1E0RE9LMU1iZkx6VVlPK3VlWjhkbm5Ca2t1N3BGK2dCWnZ4?=
 =?utf-8?B?YVNVK1owc251SmdXbjJZQmJPOWw1RDFITnM4NlBGL05McWhYaVdTVVZ6cGFi?=
 =?utf-8?B?V1Yvekp4b1luaG9QSjZncEFsTXJHbjFiT3hSTVdid0tMY3crb0ZVUHdYSENR?=
 =?utf-8?B?TWVIcmJKZXI1WW5PQW84eVFyMVVkV0hGSngvNGFHWHZTWUhuMU1nckx2T3JO?=
 =?utf-8?B?SWU0WHZ1dFZqT0lTUEJjSzBYeUc3VDBJNGNkMXNPL0tYSlEyTWpubHVUdEgy?=
 =?utf-8?B?VDN4dkxMbDg5QlVtcmQ3TE92UFdkdVJJbzV0MDUrK2xxYjdOMDA3a2lRTlpV?=
 =?utf-8?B?WEgrQlBOZlc5Tnh1ZDRkRWFmdHFEVUFSWHFlOVZjZHd3c1ZYc2N1ZnRFalZT?=
 =?utf-8?B?MW9CMlVkaENaUDJCODFBaWRIcnN6TmVFeHVyRVU2WW1ZM2lCeGdubHgxbTBu?=
 =?utf-8?B?azJCM21obmZYbEJZYWkrNFhnWXNKcm5EZDl1Z1grdmZUVU5RSjZFVzRUSXFv?=
 =?utf-8?B?azhkQlFHcEVXalBvVDJNRm4yMGR0bUVkNWpvMHNzU2tXU2lCTFMyTUJUZ2NR?=
 =?utf-8?B?YkpPWHdoVUhHYjdLaFpwWHFLUW5jQ2liY3lZa01VQ1lHbUp6eit1cmFHajY5?=
 =?utf-8?B?dmU4aXdKV1pLQUE1a0dBY1diMnpRZ1N4MjIyd2p1eEZoS2hrMXprakNOOWox?=
 =?utf-8?B?RFNTR2hBSWQrdDZQSVdMKzF2TWU0VXU3QUhtU1NYMnlvT1JNUlZjVEdnWlkw?=
 =?utf-8?B?VFdnTzI1WDJBWTdXYWtrWFFCSzlCTnF3NTVoL0JhSGNWR3JhZzNHMUloV0pl?=
 =?utf-8?B?U1M5eEFjYkZoVWJ6MmJIdXl0cE1halE4K29vMm1ndGhaYnFZd2FPOW9WMzJo?=
 =?utf-8?B?emV3ZjVuWjFQZjNMS1Y5UzFMdFF5ZEtHdk11aHl1TXNGeHpXbTFGVE4yZjhk?=
 =?utf-8?B?WVlSOGI2cENJN1VRWFM2aHN3aTNHL0JoRHdIME1zVmdjY09XS2F5SEtzeVFy?=
 =?utf-8?B?QmxmTTA4OWVraHdQN1F3ZW4yRUNjT0RoMGNjTE5pZlF1R3RlZ05tNGh6T2w1?=
 =?utf-8?B?Ymc2bVZqZnpjR0hsa2dqelFUMDRZYWhFYVJQNWs4RWVFbUloZ2VpNDZBVTE3?=
 =?utf-8?B?THlOL3U4UlhWc25TRlZJV0tUdk9lMkIyci9DVS8xaDU0elJoYUM2K3RyNzVT?=
 =?utf-8?B?clZNRVJUazBHOFhWRXhYOWJXL1dSSllIRSs0cU9oaC9tNGtQbXFKWEN4UGNE?=
 =?utf-8?B?TkVJQVFMRlRIaTg0QkdERHUwUUp0ZUQ2dnBwWEdqMlNManJnd3A4KzZaK21h?=
 =?utf-8?B?Rjg0ZTNhUnMzM09WRHZSekpOdm5RTDl4YUV3dXpnbEFyVFpUYkFNdE5JcHVr?=
 =?utf-8?B?Uy9VbUl2NTVHYkFGYzhiMkNhc0I4ZXN2d0FwYUJudDErRzBmZy9qeU83YVU1?=
 =?utf-8?B?b1Nrd1BCcXlvS2pGVzZuVFRiRkZGQzNocVk0TG9oa3FEYVBYRURmL2VhQ1Iy?=
 =?utf-8?B?aXFabGIvbE5mcklNVG1XR0VIemdybkVsUU9QRjNOTUdqUlZYU2Z3bzE1aVhx?=
 =?utf-8?B?VWJFTExiWFh1dzZEc1FCQ2Rzd3k3VWRGdC9ZRFhtV09LS04rdW9CelFVZ21r?=
 =?utf-8?B?UlJwZzIwNlNqekRncVV1dHRObk8zV1krNFJSVHNNRWlnNExOOWVscHJPVnBp?=
 =?utf-8?B?WE5LSXZhbzFrMVlveW16OWpCVjFFeFEzWXNEeEhLazFtN1BqNWZaZHJ5aWU0?=
 =?utf-8?B?T0xDNENYUjIrR3RWOC9Fbk8xb2MvYUZwVWNNeDRha3kwZ2NDZlg0Wm5NYWQ2?=
 =?utf-8?B?RGFZcHB4MmpTVDZ0Nkd4MDh0SUY4MjBQV1Y5MUdtV0ZYTm1XdmJEeEJKRDVo?=
 =?utf-8?B?cUs1R3hSa1RBeWxXdGlCL2dJbk9mWm0vT2tQQkkzakgwQ2tRWjJMQWIrM1Z2?=
 =?utf-8?B?OGc4TVZLL1BDS29saUE0eU9LZHdwQWpWYWIyS012akZoMVk1ZEVCQ1RaT1Nk?=
 =?utf-8?B?bGQvRWpQaEV0bGwyR2R6K1V1SHJMSlQzSWczV2N6Vmx2WTcvUG85NGZ6b1Vn?=
 =?utf-8?Q?SJsnl8N2MHrGCKd1G6nt2cOq2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb62fbc2-5f97-47d9-95aa-08dd1bd7c6d1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 00:39:32.6908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Txyo9vIhuN2iH7c9QjvhuvXMoKCL+Zl93pr1YBlsNzKGZ+gePli7tpNIs5xzaLIEcdZqT/n7V8PAydIU2ta3sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820

On 12/13/24 02:28, Thierry Reding wrote:
> Hm... so what's the purpose of having this here if we can't use it? Are
> there cases where we might want to access this? For example, could some
> firmware *not* firewall this in some use-case, and would we want to use
> this for error reporting in such cases?

Given that this has changed once, it has hard to say definitively 
whether it might ever change again. I think keeping it around in a 
disabled state is reasonable.

I also find it typical that most things in the soc.dtsi are disabled by 
default such that they are enabled as needed by upper layers.
