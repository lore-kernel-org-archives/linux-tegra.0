Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2D1D88D7;
	Thu, 18 Dec 2025 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766076879; cv=fail; b=ILSs0vMWy31oh3Nw2GJ+PnisPvxrN/tqWuJUSZ5YiLCk/BGg8U0ZTlWqwtGAgOrMcXs/0vw3pX1J4IinLDRg5RQb9t1JAtTH+WdlX/El+iONghV3tZXJXr5ppkb6IiQarpJTxFQ5XblHlIEZSZsZyaAO3fEPbuog37cBgtI9Rjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766076879; c=relaxed/simple;
	bh=iLUb2s8u4WgtrD0aAeG0Ub3pWdk4LiKlCmNu55r1lnI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VJt8MCq/gtursceZJ6Y2iAks/8VmlH0XbujaP72gpmNdK0DmZua5nNuMV51dAr8F7cr7XRETUDHaorbXbmBpiyiNdMJgnh3nB2Vwq21adkMZWFfbQQTbFOU1lJLZQIPKcLls6OfCrhKH32oUX2Ty3jeaTrZHyph+a+t3g+nmviU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z5NPzA8p; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z5NPzA8p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcV8C4ZF5iJJF9TfNBwERTvD4ZqPvB5HBwgsU0PHBuPDhDpk0oFconYCyRd02Y4O1TCSOJoit5UXR/ALR21ZXzpKnuvY7W7kYHNT9T20Pa3akvp/hk82IunzjOBOt5E21pduw0FY4UUUJ3W7aGBOSPV3o95Twl4c/19I13/oTtwz6UE8RJsLjyUuCoT1Gvl68IPJb6SeFoekkbNtFnw/tGPkyorYHGnXM5Sr+NTG2wp9kHcRQLkAvDolVsnUwB2acFMrTbo1NA/XGs1HX4BRJ8xxrl2wbEFcHiFfbkIPc3+WdUKz98j697C6K3TFzMUYl29iDn60uwJL4j3SXk9kgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIj4AV3rD1I4pyOLolTsU34CcqRguP96YzZGAowWSxQ=;
 b=Ceg4u237FjdAvNynOQuaQGeS5+foZrwr3OfYExPsVDN6b57gTNJdBj+MS7iXFVO+ymVr4MBm/x03drxMufnIgHwzoPen8xybJQ9OoBQL97b19lsMB4LgglnxCfPkT3d5kUOVnslKh8uXd9BGyhLle249GuROCkZ+p3irwL9FHkSb49eHZo6eyO4CeXmRhJ5FOoPJg/GSs9Ov+HCjGRzLFt0651wGyFYQGDf+Vn81NixD4NgSgNihDarl3yFkzlS39AepAO6zCxq5WcHPFkDQ5zQdk7zXvpaVvuIx4gnjTrIqcCIQVlpR5OEzBc4E32yO0a1S/r2bMDLBQXN4nzxRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIj4AV3rD1I4pyOLolTsU34CcqRguP96YzZGAowWSxQ=;
 b=Z5NPzA8pB0lNigiJj2ULQUpMRX1U0KvpbUlJWVkTX1taXJ5nfG1AUahas5lSJPgoK/L4xYQPpogYPM7tRehn3f35KGPN5isdxxGYD9JPRRAArS/AYPjncxXnzfe5Ae5/tKiJkpi4ks21vAx1VELfZq3iFJGn2072FGXOeSgSCqITwKcks1kuUuH9cz6onrg6Tle23juOvQzSb88atkExZxiVQHDc4T9h0LgIXfgiuozmYvAFDXwT5ZvrZqBmsE1cPz5VEo74aeGLWYBpDjTQ3nQD4PFKdvdpi365IagmzRkUVTY9S1It4oU+m3CG3vfHQkF01shMYpvbEIuy7owccA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH0PR12MB8462.namprd12.prod.outlook.com (2603:10b6:610:190::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 16:54:35 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 16:54:35 +0000
Message-ID: <162cb2d5-6e1b-44dc-8c4a-facdf2f0de5e@nvidia.com>
Date: Thu, 18 Dec 2025 16:54:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] memory: tegra: Add support for multiple irqs
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251124173510.2602663-1-ketanp@nvidia.com>
 <20251124173510.2602663-4-ketanp@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251124173510.2602663-4-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH0PR12MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bf1bb0-76bd-46aa-d755-08de3e561f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0VhQXN2Sm9yR3lPc24zRXVCeHJmRm1lWFdjRVpWcWw5SXViV0Ryb2ViU3ll?=
 =?utf-8?B?NW96TTh0V2VnbzZIaVFsOEgyaDIwQ2drNEVab1NxUVJoRS9XaXBZaHk1aHBN?=
 =?utf-8?B?SXE5d2tjNUhiL0NzR05nOUppUHFneEJOKzBEMlZKZU9ycTNZbjFQMjd2Uk9X?=
 =?utf-8?B?YksxVG4yc28wK0h2TWpWWEdScytNdHV5U2k3dFc5dkh4WDd2Q3pDaEZ3KzMz?=
 =?utf-8?B?Wmt6SmJxTGhkNEMwRndZNzd3TkltTkUrbmFuVFUzcFJQMHRvbHIrcmlvN3RP?=
 =?utf-8?B?V2xrSis0V3Z3YVo2VnI5TDlRbkRrL1ZMeU1iYWZ2NjZqek5IZlRPR1BkTjdn?=
 =?utf-8?B?a0N6S0VtTzYvSWtmOXJZdzIwU2hJUUwxM2JIcGwrNy9IVXAxeUI2YUsydHlO?=
 =?utf-8?B?R21XRkxtQ0oxNFRPaUxkczlPcDMvaUllUFZmREIrOVVUb09hYU80RzNMa0NB?=
 =?utf-8?B?SG9mK2VsNmo2UURBMlBSRkMwZWM3akVqUzliaVZlSjJuWDcvVkhXQzc4NkN2?=
 =?utf-8?B?dkN6eklPV1NIZE9RejNhcUVmL1NFNC9nejA5U2dnQ3p1VVpSVmhra2YxdlRM?=
 =?utf-8?B?YmZ6Rm15OWdzOWFoTWtpa0NIalB6VndPWmkvQUxGa0ZoRmxxa0RFYW5aTURC?=
 =?utf-8?B?Rzc4ejZXOXo3ZVZDODdVclcvdlZDMkVabE5NS0J0T2s3SlRXVmxRS2FOeCtp?=
 =?utf-8?B?TEc5bk5hYTllb3ZxT0JkNlA0a3pWZDJlQUN0VkxaaU95eTZvQ0Zjb1h2Tmkw?=
 =?utf-8?B?ZmwrQmxGUmwrQ3Z5UldKRm5rck40SldSQWhRSGhYT1BjOHpPd2haSU1ySE9D?=
 =?utf-8?B?UWRnR3locDFQTGRvRVJMMEJVY2lvNk5UUGFrVGR1SVA0eGNldWRJclRPdHFw?=
 =?utf-8?B?S0c1OElNdHJtR2ppMEJFenZkVENtWllVRkRtQXFWNzlaR2Z5dW1IQXhjcjls?=
 =?utf-8?B?NkNxMlgvU3hFSW1nU0x3TzgzUGhQQjQxSXJrQm9CRndBZ1MyeldTVUd2VlU2?=
 =?utf-8?B?WDJ6OWZQN1VEU1EwZGFyanlFR1UvWlpsWmNOT2JpTmtmcGU1VzNlWkpreGgr?=
 =?utf-8?B?TVdJZXVtbElMRWFrK042L3JnMFJsb2plc2cyYVV3RDI2cmoxSTVZWWJiMFM5?=
 =?utf-8?B?djQ4NmtKRjZIckxpMkdDa2x6cTBUWkY5Tk41aTRjQThLcFZtMFM4MG4rUzlZ?=
 =?utf-8?B?ajM3dWJrU25GVjExNzVOMDE0YzRZMjZ2Mk5IYlZFbEZFQTE1QUxXcFB4TzZS?=
 =?utf-8?B?ZWVoZzJCTTR5YXJpWEorcWFZb1JHcS9GQzZmdnByN1FYc3NLVU1BRXVUaGlP?=
 =?utf-8?B?bFFoWDhCV0tEaEVhdmhUQWQ2dlpROEhkNFN1T2RVSFBqQVc2Q3l0bFl0Yzhu?=
 =?utf-8?B?SW9Pa0NzbVB2UDdaQmlkSHpxNXR2OUwzTVROd1dKbXNMZXlXc0NwNmZxQk9X?=
 =?utf-8?B?bEV3YWpKbEJZZE56bTJpdHcrNGh5VzlWOFg0RWNZdE9QNXRCNVhvSE4zSXdF?=
 =?utf-8?B?UllkeXZhUXkva0FWaEdxOVU4ZDFQMTJpaHBoMmwrM09lYVYyYUhuSnRDd3lM?=
 =?utf-8?B?RkNzOUZsVVRwT1BJeVF4R2d5UzBSa2tEM2xNaHp2WUZrSWZqZWplWEtoUjZF?=
 =?utf-8?B?cGhkRXVtT0h1dWN6RnF4MXNoeU1PeitmNDZaRnFWRG9CdTZ4Zk43MUZNQzZx?=
 =?utf-8?B?WmxYMFFaZDJlNnE3NHJ2ZEpPQ0VMT2ZQNXFsZVExcm5nbVJQVzAreCt1RTU0?=
 =?utf-8?B?RUJjTVVJUHR1TTJ6NkhxTHdyRFdubFhJbXdpTEhIUFh1VXpZcUw4MFFEK3VE?=
 =?utf-8?B?ejEycEZVVDhaSzBaUXgwbUNjK3NEOUFvWjhoeitFeW83VjdRM0dMS3YrVHRL?=
 =?utf-8?B?VE5JMk9vVVdBV0xuVHFkUXkzbzllTjdseXlJaVc4SzA4MzdTUzFkeVBiYVZ3?=
 =?utf-8?Q?HgQovj7oDgWTByiqBf2SL7GJyBOOHtwU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFFFSXR6STBqMU1ZN3BETFpxUmNUclZsMTd2Q0F6NFVlSWplaEdrZDFUeFZl?=
 =?utf-8?B?cDRrUGJlcHhwNENwSjNsamFITlIrV0EyZWpKY3EzYUFHVUlOUmY2bTBFUVNX?=
 =?utf-8?B?Zyt0RCtJRldoT3g4bHZrWG9wN2RRQkFCVjdPcERzNGY1T1A1MUhsZVVhK01p?=
 =?utf-8?B?bXRrZXlNay9kUTVUMjN6bUg4VWN2QjY3VlVoZzdtQ0ZraktJMGxobnFhWGdo?=
 =?utf-8?B?Qldna1A2UERTc2IrZGVqQzlpUnpHTVBiUHJFMFd2TW1lYWRST1VDWGRka2Rl?=
 =?utf-8?B?em5tWHI2YzMyQUx3ZHNJVDFQWUdpei9yeC9hL0tVUXN0YTdXcTFwNzJheFNy?=
 =?utf-8?B?M1NFUVl2MnppL0hxMGluVnRlSkJYTytVZ3VpUXpKNUNxbDE1eGZMekFITElN?=
 =?utf-8?B?ZzZJMzRZeWZhZDJQOVlibm5yT2g5SklrUkpYWmI0dmZYUHZxaXJvUnZDR2Jx?=
 =?utf-8?B?WjNHc0V5MXo0Ukw1M2d3bUk5ZlpPYTRPcWdFSW9WdzNub2ZiSkVkdEFiVSt6?=
 =?utf-8?B?OVF0OWVOY2lBU3Vpb1psZjN0dmFqWEJXbW02d3EvaEFqWVFCcmdOa1BTVWJD?=
 =?utf-8?B?VCtUSmVNOTVnWVFXMUs5REpqaWtBTkVCbjRCSzZIb1lsbm45bThpTFRSbzg2?=
 =?utf-8?B?QjkvdlBSdGZIOVB5WDFNdWFUUmNTbzFJYVpXcHI3eWlxM05jeUNXR3RHa1A1?=
 =?utf-8?B?ZDAvL0FrUVpNSFp2TmVOazE5Y2lRL3ZJRzRQSTFUdW93bFRBNllocWVVOEVQ?=
 =?utf-8?B?bTRKaTAvWENhNWdOUXp0TEk4dEFQRmU2SThVTDdGZkVVQkRzR29QeUhUaDBm?=
 =?utf-8?B?REFzdDY0dE01NDVGTTNvSXBjWVRRS0ZXUXpTKy8wb0hRVEhwV1FnSERYelc2?=
 =?utf-8?B?L2szai9QcC9QTmFxT1UvQlhQZVFzRDZZS0RnSUo2Ymo5SUtoak1HVlA2UkxU?=
 =?utf-8?B?ajV5VEIyaWJGbmRDUVZxM3FHUjlwNlVsbjg3SG9GSHA5aGVNVGdoeENseGJ1?=
 =?utf-8?B?Ym85RGlkeXV5MkpHSGxldTlVUUtOOEhDS1lqK0U0WG9VcWVwREZTM2VFemNh?=
 =?utf-8?B?NEcxdnNTWW52L0tVdW9RdS9FbU5oemYwa0tuUGt1OUhwVGJydVFINWRTVExa?=
 =?utf-8?B?MlRxeU1oK3A5M0dCYUhYeVpLdXRCZ0dvNTZTWW90c2JGa3drelVZazZqZUx4?=
 =?utf-8?B?N3Q5bCsweElLMVM1djlld09YOVM1RFN0STlqemNaSk81aGQvcWdEendEakpL?=
 =?utf-8?B?R2xhSkluZWhrVUlqeGpaSk9yeC9oaDdYYVFnYnE5MTNDY1dCdXFJc1IrOVBs?=
 =?utf-8?B?RVR3Nzc1SWUzQmJ0MmVlSDlPWW1ZeTBNanh5c2hlWkhxYlJ5b1VEYVlRbFh1?=
 =?utf-8?B?eEFDcVdSVWo3NkJ4NjY2c0ZwN2cvK3ptR2l4Kzg2RERFN2p0SGl1dUVUZEd3?=
 =?utf-8?B?YlNBQlUrbkN5M3Q5UVk3TmFzL2dQa204M25SZHBmcDNNNE9UaHlCQkUxalVU?=
 =?utf-8?B?R3U3QjdEcVF1ekFrbHVlMklOa0FhZjJ3RzhyRWR5WGdaVmFoMUZ5dVFhSWJ0?=
 =?utf-8?B?bkZGWHdYa25SMlJSSCswcFdpelovRGg5RDFMWHA3bHYyQnRyR0xpU0ZCQzNZ?=
 =?utf-8?B?UWs0Y2M2T1ZpajZZakJBZ1dvUTRPQVE1MjJzU3V6ZzJHdm0rdE0rdnFRdFp0?=
 =?utf-8?B?Zmp1NEEvSXJ3MW5lRnoxNm1GRzdPSmpBTVdDaEFxemJIZGw1dGdkU0d1RUlP?=
 =?utf-8?B?SUg4WHZIb1lyaVI1emVseTdRZ2ZpR1dISnZISXllL2JYaHVGbUZXbG1PalJm?=
 =?utf-8?B?V09UUWUyV0F1WmZWVlozUy81SnNhVFRlRnh6VWpnVGE3U21JRVJpRjFiUjJC?=
 =?utf-8?B?elVWOUNVRXk0Z3N5UFJMaTMvaWVNV1RMZ3hHQlNLTDQ1M3c2UzI3MFFtVjFk?=
 =?utf-8?B?NmZzN0FqU3NiVnd3UTQ1SUVqNk9YMWlMUGRSejhYbkNDZm9LczJ5MUg2RlpH?=
 =?utf-8?B?djlQQTVmci9zcFhyTXU3SnV4T0FIaldsRmw1eGtjeHY3OEtuMTdySlVCY29r?=
 =?utf-8?B?aDlYeXBPaWZNY0pqbklVTXZnNjdPeW5QTkl5MENEeW5LM2c0UXNvbjB6cE54?=
 =?utf-8?Q?PBdmac3BoLyk2FTJXhhpTyBdC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bf1bb0-76bd-46aa-d755-08de3e561f53
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 16:54:35.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGoxEzBY9QZkQYk0DMmg/wPXfm2+HWNZgR7VQd+Xp+LKgB+cm46L2v2vxY1HJVh+WJTVkHqirpHV7XXB7tigkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8462


On 24/11/2025 17:35, Ketan Patil wrote:
> Add support to handle multiple MC interrupts lines as the number of
> interrupt lines could vary based upon SoC. Add field to specify the
> number of interrupts and iterate over the number of interrupts to
> register handler for each interrupt. SoC with multiple interrupts
> will be added in subsequent patches.

Same here. We need to be explicit. The 'could vary' sounds like it is 
theoretically possible. However, what we need to say is that Tegra264 
supports multiple MC interrupt lines and so make the necessary changes 
to the Tegra MC driver to support devices with more than one interrupt 
line.

Jon

-- 
nvpublic

