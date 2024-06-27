Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9A15E5C1
	for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491417; cv=fail; b=Wim3oh1h4EfCeVGnbEIBcadLjxWFeW+0d992dZ9Jeuh2eqTlXIPg3/nL3IfX4Xt3E2IMuOP70u/E6ssc+MRsLCj/nWxbr3qRxmAvOaWwht+IwsNG/KsTEP7b0eAp671ca4+8yOC+QDnIncX5MvmmIqXHb4+hC4y1r1YnnsUXBvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491417; c=relaxed/simple;
	bh=U+qUqK8McjPa2xmetvLxnkxl5aveAMckC9k0GuFDej0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FvUMEkr2y88xZAdX7IV4dcO9LJjSFGalUpGBWugEpHOsSOK0xvl2dEUo1Z/5uqaTt8OqVA6Gyr5Cm92116x/OTa156Mzs1MPmHJ2VKtkHcaif+3dcq9lIITa++mywwcfUFujKCm1vGJr4FsD2WDY6pvhAW/opGOAqRUbmHo4Zzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sAryMtfs; arc=fail smtp.client-ip=40.107.236.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sAryMtfs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hh7GA8llvRX3fP5X6f9mYU8JmeTax78aldhH+S5HuUZWb1DmguCG1MD+V4jT1jHZHMwAiXOSSmWOoGpLEUCSL0cq28Q/CKu38S0xFruv75GcpPB0kjkxuBiuJLSX4lft1G7crLiaK2L55k/zboUttZ3DtUx3qZizgQIZj5o08/XAHlsJb5LQImM2dMn0DDgkrdsYnz54lx5hCL+VQezbaKZT1Rs+CbNuA4xEf7tdFT9vYXpJ1djSVaBhEC+JWTVocsiCWD1J9VHjSu0EHOfzz8zVLecxHOtOcQlmoANCEdtr8G6EEOhxAQqXog2gcSuw1wFsGeU3Fe469Tah4zdq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh3J5xuli2g0DK892v/sSmDkC4EiV+QENolr+LWYFts=;
 b=d9r/KF3pj5EybIE0s6Da/31WhmmlIcT9xv05E8xCm/3HuDKslf+W9jcrJVTnyRPgLH3Ma8p8bmoE82MAJn7dmJUykxJ9H05qG+cP2pQ0rle8wTXi7tZS703Xftb3/tsF2EAyYynyt/YcFWQnKKNUW/HZzaH8qPsSjmXeDcGZKkcAA34oRMQdW5YQuFA+Jn9QXXAuML8M7eFkJArDhqfFPL6bumes1DkQ8Em9GMAVSHjcjpdxtc1HcVFd8wIQWR5d6v6MziakmgLZUuseAw1A27ZWC+ISuf9DOObvIbCGuKqCVa446nLnR2aeNHaFt0EcuS2yUSG+xhWtYGkGNFmeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bh3J5xuli2g0DK892v/sSmDkC4EiV+QENolr+LWYFts=;
 b=sAryMtfsRAT27JSxWgYn8VErRCsvLvM9zdLnhM3Ol0WT56/1DsQ8lscbptIJnXmSiy+0+KOP7lqPbpl79dgozEzltVEnVegRKEUXNW9p/HXDASrQFuAfWLByPc2JzamEKVeSbsPtgorrxdoKfWlZoA5/cYGdDMDsmB5in6uAWj6ao3cQjiL/5lsDBsUdAPlJ1uAo2R5IEGMzcY5paMv5dp2dhGF+wX8NzKa4IBvz2QW+fT/Fw3U5Ht6eK2g4dUvdVmY1J9yiKYfe+w/59BqQOtOfEIctZ3lSkApZpsO1GgPW8cd2zhUFkxRYzFQc39zKoR4iONSWiwWxj8sJhyLJJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 12:30:08 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 12:30:08 +0000
Message-ID: <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
Date: Thu, 27 Jun 2024 13:30:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20240215070300.2200308-1-hch@lst.de>
 <20240215070300.2200308-18-hch@lst.de>
 <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
 <20240627094950.GA30655@lst.de>
 <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240627111941.GA4523@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0320.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: a148ac90-09a7-4b50-de2a-08dc96a4e153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clk5NnhJRHVOUExra1plbEVMQ2M2YWZmNWxlcUJqUlRqUWV6WEI1R1NaK1kw?=
 =?utf-8?B?Z0FCblJZYlZsTXVKMVU5ZndHUjU4KzlXbkpRUHZ5QUFyNDN3blE2aExGNjVz?=
 =?utf-8?B?RVB0QzJjREsydjVnVzhsTUlNM0hnc1ptQWw1TFVydUlMdklVSlBaeG93OEF5?=
 =?utf-8?B?RHRXdExVSCtydGpFaHhOaXgxdEpDMFNxdnpSOUdTMDkwOTNNejlWTEhVM0Yz?=
 =?utf-8?B?c2UvUmRtNGl4S2NWcWJLTDQ5MEdDSmQ2clBtSHE4RzlIcENWZlBBRHlqN1JV?=
 =?utf-8?B?QmNWUjViLzY1YTJ4aDRKbXR6WVlMWnlKUHRrUTVPQyt2Q3QzQ3ZaQ1EwNzJT?=
 =?utf-8?B?c25hV0M3R21HVERqK20ySHJmcXpqNHN2bzhQaXNqWUlJdkJ5cHdIZ2d3dzFR?=
 =?utf-8?B?NTZCTjhTSTk0a1RtRzVQNFM0Z1BXWjBjVm95dEsvalhtemwwSmFROURtbEEz?=
 =?utf-8?B?QUZCS3Fja2JneDAyNUgzd2NkMXhad2pwWnhrRXNvRGpuT2FjczJRYitFeVVM?=
 =?utf-8?B?OXlzMWw4MlVQRjFzUEZiUUF1SkwwTzNWVTlrTmJwQStlNG9xMmFCOXBMYjVT?=
 =?utf-8?B?R2FSQU5sbnBBT3FKRVM5dkxJZHRWallYZVhBWGNzZFRHS3FLR0gxbmQvR2xD?=
 =?utf-8?B?RWIrRERSejVQTDl2Z3BORURMUm51MWI0UG1pOFRPejlaSGtkbjNtOHFYM0la?=
 =?utf-8?B?ZE5YRmkrM2tpYTVsWW13a2hFK3JQd1VQWEE5a3Z2RDdPaGNIY3R4aFlKcmZQ?=
 =?utf-8?B?UHNObERBM0JndW95UGVVL3dkdzlHYUpYc0Z6OWFsbkwwaFNHN2pobFdsNi9m?=
 =?utf-8?B?Yk84T2tVeFYramZlazlqbDkwSDF3ZjRoMzVOWlVPbFRudHNnSEEvd0RkYmdU?=
 =?utf-8?B?S2M0VFZwN3cwV3RoOUZrc2xIS1dsSG5ta2lQWGxicWJka3l4bDdkV3hZbThX?=
 =?utf-8?B?YThvU21xb215STlGTHBrK3JYUXZVZHdaTTZCRmJiZGphZVh4NDQ2anBpV0kr?=
 =?utf-8?B?U09mUUhNUmliQWg0WnRrc0x2ZGpsMDVTNFRVRzRwdi96RjQzTGJGZ1IvSWN1?=
 =?utf-8?B?WlJlMnZGVklkQmtuTEpXR1VqanlBa1BkdHJLeSs4T2dnNkprQ1VhZmFxdmJZ?=
 =?utf-8?B?R0tDODJrVm12Z2srejVmTTA2U044UzFlQVhJMlJ3OXVvenlraDhBc25XUXNR?=
 =?utf-8?B?N2RBYkQrek5Rd0dvRWJFYTNxaWU5Nzh1UmUzUU1WNHBnQUhMZk11UnJJZ2M2?=
 =?utf-8?B?dVJLWDhaYXBqUTg3byszTXFLR3BsaGlxWWRObW9YSVVNMWJlaWptVU9JTjl6?=
 =?utf-8?B?ajJrbmJadCs1bTI5eXhBczdpcUhMZFdNejFyWmQ1NEUzV2FVRU9Cd01vTnVB?=
 =?utf-8?B?VENabSthY1A3OSt3eHZrQWhoMldJbzAwS0lvV21oZ0p1KytDS3p6MVNjY0dL?=
 =?utf-8?B?aU1zVmZZb0w1SmFPVDMra2duTnJwQlUzbWpLMWJYS2s0YjVJd3RFNFBrdU5E?=
 =?utf-8?B?UXJ1VzZzUWtCT1Z3RGl2SmxSaWRPZ3l0VHd6enZtK21SSU5GS2dkWUpBUnNm?=
 =?utf-8?B?VWlEbzQxc0x6RlZEK2xoRU80alFiOFM2czMwVnVvYmMzS2RTY1lSUGVWMlBF?=
 =?utf-8?B?MENKZERwK2c3eDBoK3dOWjlILzlNNjgzM2Z4MWd5YmladGNCQk5lUXdJUG5i?=
 =?utf-8?B?d3lWd0c1cHo1dDAzc01iZ2NaWDh6dXYxK2hIU2RTeWtQVEI1NFJ2VVdRa0Rm?=
 =?utf-8?B?NVZVR2V1RzlGZ0NVVFhtUzR2MGxka0RLQytkcG90NWtFL0p1WlJ1Mmdwd0hh?=
 =?utf-8?B?TEprZzY5bTdqQ2lZRGloZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?US9SQW1hUE90anYwak9oTVlkakI2OUhwbE1IWE1zbi9SSGNVckdxY0JYS0hs?=
 =?utf-8?B?WERWMFZUb3U5UDdtV0ZUOWVIRFdwSzlkV2xHTEVqWXFPbXpZL0pqcWFiRFpI?=
 =?utf-8?B?OXhkK3RXUmJpeXBJK2xMSmRnTXVoRjYyaU0xM25jS0NmQ1IwZm5lTnVkbG5u?=
 =?utf-8?B?eGVhdGttVWlUVTJlVXR1OU1MemFjODdRWnhBSklNKzZQbkkrbVI2VklMTWNr?=
 =?utf-8?B?KzMxNDdtNGNFR2FwWjYrTERXNmZQZzZNM1hsdTgydVdYektQcDNUR2RkTzRZ?=
 =?utf-8?B?SFo5Qk10ZDlGK3dhQ3hoeUZkbENrUkh5U0l3aWVVY1dTeWcwaDR0a3RXSkNp?=
 =?utf-8?B?VlFYclZFK3YvUm5FRFQ5enMyY0kvNzJ2OHZoMmJYUXg2RG84YVFHMTRKTFdr?=
 =?utf-8?B?YzlBNktSZjQwVXdUQ1R4eHl4VCt6SC9ZbStvUVI0anZFbVFORi9lY3JOYldL?=
 =?utf-8?B?ZmJPUzhsVHVxRTNyd3doV3RaYmtLdE5WT1pBVWgyejlabVpQK2RkOHFqRVh5?=
 =?utf-8?B?K091Z1YwV1pIbG41dTRDbDJZdm1TSVhOYW93anpta1JJcVJDaTNtWXh3c1dY?=
 =?utf-8?B?V050cXZOU24vQ1J1Ri9LOWtBSTlGMmZLSFFxb0kxZEpSczRYc2crQjlqOXZG?=
 =?utf-8?B?TThFd1dwWUFqZVhNNWg3NHpDakNXRVp5bGIzODV6U1g3WHdOdEN5Q3Jwbk9D?=
 =?utf-8?B?bDFZZlNVRGF2S2h2U1J2L0NPUXFCdzVDQ0xCcThEREFPMDNRSi9HbElORGpB?=
 =?utf-8?B?SGVIbWJWWkQ2OVNqZ3pHZ2VnY1dPMXFPVjZKNWFGOUYyL2ZoZ3BGQlJ6V3Rw?=
 =?utf-8?B?RC9yWmZVSldnVG9HSnJOZTIxUzNYS1BJVnYxczZ0TG1lUyt6ZmYrQjZEaGZw?=
 =?utf-8?B?ME1hMFJvaUZ1VzhvdXdxVGZCNDNXdUVWQVRCMCtma1dWeVFXTXR2RzVZN1Nv?=
 =?utf-8?B?RHpWc1hDWTNkd2xrS2xqaFkrYWwxOHRlZlFvWXFMNUJ4UEZ0YTdSSXBBRnZC?=
 =?utf-8?B?WThtNTRRV3JjZ0doUitaeEdGcEo0ZDcrczIrNGJEcFo0OXVpeFRDaTl6d0FC?=
 =?utf-8?B?Q21ocmUvbkxkOHE2ZjROam1JbmdlWUNqSG45Z2VoNDhkMTNLaiswcjhhcnRS?=
 =?utf-8?B?WjBrMU5FSmJvdXB2ZVhBQklkYnBhRGphL1dCQ1FxUTZ1eTJYUGszWDJWTmVn?=
 =?utf-8?B?QVROOEg5K3Z2VGdjcDc5WExoOWZnUnI5L3pGSlpLZktDeHZLOEdIdmNRcU5v?=
 =?utf-8?B?cFVCWkM5ZU16eUFtQlljcHpqWTFSamh0dDVweHUyNkkyY2IrekpxZ2xJYXB6?=
 =?utf-8?B?TDRmRTFENzFiRUxiSEJSanVXck9YT0tKTlQ2NFZPRVBMcFlac3Z6T1pxckhZ?=
 =?utf-8?B?bW0vdEFzOWNZemd3amV1UVVveXFCejdFNnk4SjZCUEx2Z1VQZllEY2RoOWJJ?=
 =?utf-8?B?bmdBczNyWEZycUwxUW9RSVFyOU1uMFR5OGZJTWEyNFFUSys3TXQ5R0o2RUQ1?=
 =?utf-8?B?dFBvZUhnQWNKL2I0Q0g3QUlFSy9PU1EzYmhtWE9HMnpMb092SEEvWFFQVGQy?=
 =?utf-8?B?eWphV3VaUHRLM1JvVnlFcEgrcHJrRGluNkxacThrSFJ4Yit1cWNDWGhIU3BJ?=
 =?utf-8?B?Ykh2cnBmcW5kZ0ZLTnNjZytXcE5kd1g5M1pvL00rTE4wc2JxTEdMWCtZUUZx?=
 =?utf-8?B?NHBUMG9icWJuVHZrdlhBRUMwTDVzSDg5Q0pQM1h6WGxlTk9CYlF6UVIzY2RY?=
 =?utf-8?B?NTcrY1NDbTFRVGl5MUFVeXFUeEFkY1N3RVEvdGdlQmpvMWpxcUx4aWtnS1R0?=
 =?utf-8?B?VGY2RXZPa3l0U25TKzdBWmhqTkptVUJoWElvak1ORnZZVEdNdEN6QUpGSTlF?=
 =?utf-8?B?WXJrZXN0Nk04OUpuNk45dlZsUkRYLy9YQmZqTGtlTkFMQ2lGalNNMXpJazE3?=
 =?utf-8?B?Z0gzSnV2cmxnWFNZOVlFS2ZwQ09YM1ZndlZQV0NVN01vQXBhandhTGozaHNm?=
 =?utf-8?B?Yys4b2txZldXa0YwL3pKOTE3UDBXY2ttM0FLcWdnWHNEck9tLzhoNE4wZU1x?=
 =?utf-8?B?cDF5cnc4amZtUTYzNVc0Rys0RFNxc2Z2NzEzeVdxRHZObldTTUlpVWNmdzR0?=
 =?utf-8?Q?NIVWUjVx1GTtqGm4CT3GYsc0Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a148ac90-09a7-4b50-de2a-08dc96a4e153
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 12:30:08.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUVIFFhlPPc08gOHzhbmMPkSbU9ZZdccrDcbs92ZmOLd2RrR5DVTlgkSBJ52BDdqJoA/HPfX6jSJCCsgOxVlXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956


On 27/06/2024 12:19, Christoph Hellwig wrote:
> On Thu, Jun 27, 2024 at 10:58:58AM +0100, Jon Hunter wrote:
>>
>> On 27/06/2024 10:49, Christoph Hellwig wrote:
>>> On Thu, Jun 27, 2024 at 10:43:24AM +0100, Jon Hunter wrote:
>>>> We have just noticed that since Linux v6.9 was released, that if we
>>>> build the kernel with 64kB MMU pages, then we see the following WARNING
>>>> and probe failure ...
>>>
>>> The old code upgraded the limits to the PAGE_SIZE for this case after
>>> issunig a warning.  Your driver probably incorrectly advertised the
>>> lower max_segment_size.  Try setting it to 64k.  I would have sent you
>>> a patch for that, but I can't see what mmc host driver you are using.
>>
>>
>> We are using the sdhci-tegra.c driver. I don't see it set in there, but I
>> see references to max_seg_size in the main sdhci.c driver.
> 
> sdhci-tegra.c sets SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC for various
> devices, I guess you have one od those?  This sounds like the device
> might not actually need it, but I'll need help from the SDHCI and
> tegra maintainers here.


I have been testing on both Tegra194 and Tegra234. Both of these set the 
above quirk. This would explain why the max_segment_size is rounded down 
to 65024 in the mmc_alloc_disk() function.

We can check if this is needed but if it is needed then it is not clear 
if/how this can be fixed?

Thanks
Jon

-- 
nvpublic
