Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2107.outbound.protection.outlook.com [40.107.237.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715D77F3E
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712647281; cv=fail; b=FhOCOI2irglqupYXwRRw1FB5btaMCzkFBKfo00NdtRtOr6C/iK8vg8IOqa7x+RLGhiWUPNd9udG9apKrEMYfuQMDNUpOpb/PtRI1H71O/74WB+/sQv/5rAu4bwSIV46EdaphNzhOpCHqp4SJ4GPTfIRDF3DyCgCV8H/kKxil6CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712647281; c=relaxed/simple;
	bh=8SzrhR1OgCjprDufgjx2UqVJ5igUeuaLwqjBlJLCL/8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hfOJXadCIFUZ+Br8C2vwj7pO44v8jcsmn7RgWR0m8gFSaqscaPHAdS8oDhyQbeJZlws8qC0XphUf3YD9qOLgeJXp3j+++wIZTQJe0SvqARBYcjsuS9JxytGp7sjFffKU0YPSJ6U2lQPwtDdA9uO3reiXL0uFZEUBkurHkbUSf38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=URnfNxeG; arc=fail smtp.client-ip=40.107.237.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="URnfNxeG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3BxL5zAPaw0OBOxvUpZZGeznEOIYcP2BfXTZL5iUDtJ1lY3Et4zcAGhDwaNdpBPhve2WhVHSI7BCeV6+LqkrFzfD++Gv0n9J/8iQ8C7tlgogGFE8KwTROY8T3houPCnW8mXjXOWBaqJNXnTmRIKCcvVkPdNhoSTM6NMex6x4GXeMn4O0atifFcZCHz81LbbM56aJbzq9lNTEUHHSDxznoyFelLE1ZvQU/QMsIJEdJGDwNd6xBzM6n5iUj8+GQNnVWI0NtpQOSd5KOKIQtWAE6hO+q2cu8GWHF1M7ucZ2gN+bfCSgyXZvQMUdUDPYepJNIykz35ON7Yz7ETDk5H/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6lm6zveRXD9VFQsHBi40ujP9drATf2+/WuW1OGFGqQ=;
 b=RDNm/DeTSdfdCEzu/b/m1xBDEmiv+urWExVmBivdvZ9/A/VQ9hcQvN5uxpcHRoSaSEUvApdovcof73wSCZcc9IR8Y7+Dw49zdoLQN+iXT9jZpzY5M+A7fhHXHYsusx6jS+kbrZho0wrEy6aMzfRLkG8vTJGB93ksg2fn9H8SGVAuav/rBVt60E0ODpJg4Dsqdljb6yEwtauZNamyuBXOOk9U/LMvnVSwRrqEcHhg09Gp/v+ZOoZfMvF9ivKKPkYnNStTxYp7gXOUOc9MHRWdrev+QyUA9ZobmU91ZuZzIr2ukcqZeJ8eevzAlZIEUDHVvFXIzuwTMY4N3awzFz/e+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6lm6zveRXD9VFQsHBi40ujP9drATf2+/WuW1OGFGqQ=;
 b=URnfNxeG1mHNPJzOz6xzBxKypwlHPXU2blmFddjwoHnab/0agXT1ZZE9W0icXlqvRIJz/n7aMzoklXGFrYhZU9Sptsur7DDBSSu9opnhp56L+SuQO/yyNjiv46B3rM4FiaqOl9OjXVHfLQxP4EHtkIknyWv0fE0Tn9FKtNMPkfAtg8STIX1fzbEEprX4gkYjf7mK/VlfpuxgT2ez0TJ9UDt4O0KFMRe6bbP2KaV+eK5iM2vUyOGQoQeeFg6+5U3cL/Pblor2cQ8bmPUCPrw6wl6OvjIw0iKah33+/QrqEefcjwu5SVriiRmlsISbsdh/iuNZpMLSJgLxSYVbFv6gXw==
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS7PR12MB8273.namprd12.prod.outlook.com (2603:10b6:8:ed::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.55; Tue, 9 Apr 2024 07:21:16 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%4]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 07:21:16 +0000
Message-ID: <6c32386e-324e-4351-a22b-43c801a88239@nvidia.com>
Date: Tue, 9 Apr 2024 08:20:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: pmc: Add EQOS wake event for Tegra194 and
 Tegra234
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20240403114208.35147-1-jonathanh@nvidia.com>
 <D0EV7AKFJ1G4.1EED57H68IKH@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <D0EV7AKFJ1G4.1EED57H68IKH@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS7PR12MB8273:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rhpvdCqpFACyZLbtfwuhTTX3Po23WWthMiKPb6nC8RVzYYFaaGWRwo3kqNWGizwCZi4emEOMZbGWnrWjU8c90olRxmbRAQB4okuH1pcE23H/MZFtiWFKq9d+qfVonipYgrIeUqsdcWAohETEl6DF1miLVsO9RwGW1f2t3nW+AKdvo57t+8gnel+XGjmlxxanjYQyKR8IJc7gx8jxQLU56OHUfUmQH1vb5Deuz/W/xDhTWiv5bO/gdNb4FiGyiRG3S83WbnSneQujjNgzEAdVNKSWsuitPCTIuhX9r4EsI7MLrjsYtF8inB7cnkfen5mCezwq3I1o/JhtVoWrfDA31ksIwjezdJkYzukhtB+rSpVKWRRLm+p+suKFZOsfAK3OQTuI/sjt3K82Kvz3SzXZq5bGKByeO5HEO5hZNT7osndJFJrGWmC1TLCwU3axW6Z2Y4hBOeF3AE3sn0yZZoUY54H7SWSiv+oAbjZZXaph8Z0WQWLGYgstuLoSanEuyUGvGsDtjHJL+8F7lMXfpSpunFbuDwL5rrYicJ5d6Ep0/nuBYSxZlIYjY4GiVoQQUYykFZJWemdaT8wihCt5cP1ODb2BcXVNSuemtYryCdgcOhpWkScVWwHMBbjIeUDTQF5ClYvZpoOaHsFXj1mYbp6wNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTNPamtTeDdPYkRJa0ZQSVZZK20yK2lWQm9CZGRHTWpDMjRXVHdicGdJZHhk?=
 =?utf-8?B?a1NrM1NFLy9kMEFCZG8yZWhORnBDdkt4c004a292ZDhsdldEcjZObHJLZlZq?=
 =?utf-8?B?WlZ2aTAxUkVnUnJ2Q1dDcWMxMSt0UEJOaXNKTzBWdEFGeVhmVTR5UHRTZm1T?=
 =?utf-8?B?UFY5UW53bEJkUkIxTXNSekZFSHZlRjdLS1oyTVcrV1ZyWmNnUXdMZVFmNkpv?=
 =?utf-8?B?Mlo0SDF2VHU2TmJRSVVJdEFBeitLV0cwOW5palZVa2tsR3VpT2xoU1NkVEhT?=
 =?utf-8?B?bzlVMGtOeldXZU5NWCt0a3hRUVJvZGRJRzQ3Nm9WTHJpTDltVk02WXlxWlkv?=
 =?utf-8?B?SlViNzlMQldSYm5FWVlCYXRPeC9lUlE4aloxeC90TDhVNHpMR1psWElUQWpD?=
 =?utf-8?B?VjNnekJkRm5YNDR5NmlJRC8zdmFDUERzc0liVzRLVy9tLzRJOFpPN3lVSUpT?=
 =?utf-8?B?ajJMN0p0d3pycjhVRUl5enpwb0ppK1JZV3VvUGE5VlQyTVJrOXpMeEFzcFNq?=
 =?utf-8?B?M3ZvWUJZMUx2WVlJb1B2TXpqK3Q4YTlIWU5hcUJnNW9SaXkyZ0xwaHgrWFFM?=
 =?utf-8?B?R05yZWFyZ1BOY3dQZXlPV1ZHQlEyVC9wa0dxeWxPVlBDeklwUllPTzRxRGlq?=
 =?utf-8?B?Sjd1TThNV1BidjNIbytDTy96Slg0R2p5MkZXYUtucDBaMWhNcERGTEVmWC9P?=
 =?utf-8?B?dFpqeFVRWGJ0VlJXU2ZubGl4bDNSYnBINVN2UjJTbUZ4TVhWMTg4Rlpkb2Zw?=
 =?utf-8?B?Mnh2M0xzQlNja0JuTlZFUWxxMTRsSXJpZmxWS1JEaTNJR0RpN2hiMzRNS1Q5?=
 =?utf-8?B?cjI5UU9aUVBZZ2ptWklxYmRNV09yOXBGcXBLeGJXeXVueXptME85aTBaQUhz?=
 =?utf-8?B?ZVEwanJEZEpWQkRRMEdpeDVBUHE1TkdvZnJvMDhPeVVUSnAwSnVmems0Y0cw?=
 =?utf-8?B?L3NvY1UvcGxuMFRjQWFKV3d1cFU3S0lqREpwNUExWkk2RmxERmozVFZDRlBC?=
 =?utf-8?B?MmQzWU04RXNFS0t0RS8vNU9GaVM3Y1N0aVZheFFOY3MvSHRNcUJVdWRRckxK?=
 =?utf-8?B?NGczSTZKc3dNRW1CZTQ0bFg0U2lreHNwam5IZUwvZi9UWGQzM1Nrc0RhU1JL?=
 =?utf-8?B?V3VlVlQ5NXhmN0lxN0pXcUtKVWpOdEZ3b0lWVktYUk0xNitXNWNYOHU0Z2Jl?=
 =?utf-8?B?NitoRDZRRnNVM2dXeHp3UU1JZXV0MlBEbzJhT0YzT2p3akRlczR4MTZTbnRy?=
 =?utf-8?B?ME5IT2U3aGhWNm5JcDFlWEkyeEpSKytUenZaSjVTZ2Z0cEFOREZGSzUwSENW?=
 =?utf-8?B?aWRLMUhIenVOdVNwNWNQYy82UDNnbHpoeXJZUW52UmltSk9LeUE5cTJMRzVv?=
 =?utf-8?B?MTNIajFWYXQrTi9VVExSckdOdmhZU25hYmg2UVhxM0FKQUl1ZWVsR25HcEpj?=
 =?utf-8?B?L0FkYnNxQVNyS3FNaEdZSWc1QUVaT3dwemppWGNlN1NQZ3lpTlB6RHQ4Q0xv?=
 =?utf-8?B?ZzJMWDBIRWFIajdGaGoycW94MExjOXNSbkVlRlk2eWRnMGorSjRwVnhzOE9W?=
 =?utf-8?B?UFpwbHZaN0xDSS9iS1BvRDZuTS9Ndm5QL2c1enYrWmlDS0RzNm0yVkZrend3?=
 =?utf-8?B?Vmx0ZFlpNFpRMjNtTndUcG5FSnhvdnEzcEFoUUdvMkJsUGRhZk9BMUZNQ1Ex?=
 =?utf-8?B?RVZMbjdsaDZHdDVrZXBkOStlMHdtQVJWR29oL0xWNWF2TmR2ZzkrRkd3VUxP?=
 =?utf-8?B?d1ZiZGZEZlVRS3V5bXVGWFJtcXh5OXVCVjcrSmlqR1pwT1ZGWDd2TjBjRmQ5?=
 =?utf-8?B?QjU3ZEpTM3JRUnJ4T040a3ZJb2dEcTZQL0Zkd3N2SWZwRDVyT1dVMUNaWGV3?=
 =?utf-8?B?cmNqYlZQc1k0UWd6Z2xPME4wS0gvS3hFVDJrQi9mSHZMNUIwdGc2YzlDU2RZ?=
 =?utf-8?B?c1RuVVhwaEo0bE4vaDhyTFBNeklmUUhadFdLcTliZ0xoOTZFMzlEd0lUbVBk?=
 =?utf-8?B?UUhKenpJSkRpdU53R3RtaVZjQUcxdkYrVzl3R0FjKythTFl4SVhSTUR1NWNX?=
 =?utf-8?B?cERKNjAvUzdiNVlCM2hTa1Rid2pvSnBXelpXdDl6UTJwa0JHTjRJaUgyUi9t?=
 =?utf-8?B?QytESTN1cUJTZ3N2Q2lXWndHS1ZEQnVuVC9WMHBOSG9IUnEzZzdnSFphejIz?=
 =?utf-8?B?SFpKNFZGRlgvS0p0MCtBQ3NOdDFxNk1TYm1EMG5FT0FNQUs0Y2NrZFMvRkdX?=
 =?utf-8?B?SUxZandrKzJGanN2MS9ESTB3WSt3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431ef438-c16e-4330-248e-08dc5865a4ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 07:21:16.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpR6Kc8ooJDsKTzzkpJPEF+SP2CgXNIr2j/H5WWJNJZX9o27YfYu1xCxhj5ZNwRLHTsnf5midI73fgBsbOkGHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8273


On 08/04/2024 17:00, Thierry Reding wrote:
> On Wed Apr 3, 2024 at 1:42 PM CEST, Jon Hunter wrote:
>> Add the wake event for the EQOS ethernet controller on Tegra194 and
>> Tegra234 devices, so that system can be woken up by an event from this
>> ethernet controller.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> I don't think we've ever tested the EQOS on Tegra234 because all of the
> upstream-supported platforms only make use of the MGBE. Do we have any
> platforms where we need this on Tegra234? Also, do we perhaps want to
> add an wake event for MGBE?

Yes, the Drive platforms [0] support EQOS for Tegra234. Although there 
is no device-tree upstream for Drive, I think that it is good to include 
this. Obviously we should have it for the Tegra194 platforms that are 
upstream and so we may as well included Tegra234.

BTW, we already have the MGBE wake-up event upstream for Tegra234 [1] 
and from what I can tell this is the only wake-up event that is 
currently missing.

Jon

[0] https://developer.nvidia.com/drive/agx
[1] cc026ccdd502 ("soc/tegra: pmc: Add wake source interrupt for MGBE")

-- 
nvpublic
