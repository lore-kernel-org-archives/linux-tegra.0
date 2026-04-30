Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338B73A6406;
	Thu, 30 Apr 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541981; cv=fail; b=SSjCNcEQLRBAmpC6ZXgYFy/wAqZc+KZwUAbpXEVU74q+hzIXyiK/bQ4lqUiSTogFuxDxVkeCnKl70IJ0+SHm7UZJI3+kA+CKNxm4O58KTuWSmeF07cJmLIotarVG1Pz+EiNuH2fyLScYbKVLoxgikn1AOjFNKLHvipbwBhFusN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541981; c=relaxed/simple;
	bh=CAtZTp8uBN2+0QI5gy1Mie3TU1nJQOniOGJc675xMvw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wi150yoiSGgDBJ7mighHONfEuCgSMx4XLY81WDQYQ1cnDgXBJ3R5m2YTipfX0zRGL+02CYptO03DEPuCika+W3inRNUPPcxua1ZTJ6sKn2zEIoWTGyhNGG5tl/XswNaLYgxrcO6i5pOmFUp4ZfGInXAhyFLZEhA6Q+lCZWVL3aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HhhFAPnS; arc=fail smtp.client-ip=52.101.62.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HhhFAPnS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrQ7SVsgP/YUqR5qiV4xDquRsU4narGxn/AvWorSuPgWaPKeUnVaPSbwulZO6hlO8NV2M5vJX2xDOt6gVKFKDb/K6ZDJEEzhJUwr2UDo0E0W5hFK2JjvqCBhyb5sNMmzoND9a0dL8sJ9nHs5ntaXUOF5rxwA2WymRpOEdlCPp9VWgpPsfG35LQ07uxIDd5p3eNkztMJEaJ9dr8OaqnYiWYg99arX8hn/C4i0HFWPOeLs+7dEI41Mgo6AXnquzaduEPKmkVzXSe5eGlPaPSqf1rKuu2YG1CmWEYxFPLzlVuto5rmD959W2Okfp1MhG6Ji8I0d9OJlSGgbpF+ivqfVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGoeTSeTvEDkdv6FR15oEmUyxwLRjVgAC4gBFlaY1ZU=;
 b=Edf1dVe7y3lTBBfPTElijIgSuQWRbNbrHSi6bn4VPH3lSr6kXlhCtZIaaZmSFpwavL3084xHwmzdmbs4PdD7E0ov13JIWp0dn3OB2ygJlVRMx3IdS23RXbLDgLTCxQkllzNV5NplLGD9AO2dLI4sg0ysvmqNOqqLKwvgYxSkRsAgaJ8GnjnBZNC3yKDIiuq6FhpOr7lLJMxav0/K6Npgg5qMZJayDI1kj5HOZfvF5iLAlUyXPLPLAJwSnkPfcErDnF1IQyaaeLGTeXWGKwEBCqi2f+lCOW/2XVbAVyEukKbdcJjQciDN4qHw2HmS3ERBi1kVv7FztUwdvZ3twXFN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGoeTSeTvEDkdv6FR15oEmUyxwLRjVgAC4gBFlaY1ZU=;
 b=HhhFAPnSzhAGm9Fe3CZInBQK2dfEH3uynTM8yOzhJYGOrxF1OQgyX8MjkuBE5pTPVH/XbmMj71kvsQzZuxVnMHbXQ+0xeKxk1Yo3KL/1spr1wR+IoTbu3OccGGhH5FhHbLruLwDs7i3HFeahwQl1nkDYprBFK6hcj0aSb2oqD5Yw2+WEaPmV9HXlk58FMFxFWpYiW991yMrizsUWNnP50aATGfGFUPljSlNAxVMKDhJcIXePI5jTgbthnnIsR9OIogRL1un9sgB9WSDqjwi6E+Hq+Usd6EJON9CsmuaRYDzFU0bPX7/1UxGCrFhTjt8A+4bC9V75EDEjxfq1vonOlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 by CH2PR12MB4245.namprd12.prod.outlook.com (2603:10b6:610:af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 09:39:35 +0000
Received: from BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c]) by BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 09:39:35 +0000
Message-ID: <f60904dd-1337-42a5-9759-d3282c99f502@nvidia.com>
Date: Thu, 30 Apr 2026 15:09:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] memory: tegra: Wire up system sleep PM ops
To: Jon Hunter <jonathanh@nvidia.com>, krzk@kernel.org,
 thierry.reding@kernel.org
Cc: ketanp@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260430070954.1005564-1-amhetre@nvidia.com>
 <20260430070954.1005564-2-amhetre@nvidia.com>
 <536e3912-9351-4825-b25b-776e4cd4c748@nvidia.com>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <536e3912-9351-4825-b25b-776e4cd4c748@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To BN5PR12MB9511.namprd12.prod.outlook.com
 (2603:10b6:408:2a9::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9511:EE_|CH2PR12MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: ac55da48-9a98-4c59-0704-08dea69c63b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AAzCtCIiQloSyKk/VYurfu2xeAlvbh2OSe4FFD1c5TcgI4PNbi8AUCb+Ad+wfF70xggeUmwMdJSe+jOTEBgdP14xtrzZfyIYL/6h4s1pN1aLU8XiEaq42niQSjJBSoXxHW0ZE93u1qDr2JC8HPL9ExRqFq/l0T8iF54ChTLeXC86ADvQydHkQ5QKwJl5VM3yMdBmb8At1krf3Vhy0nFRQmcQTVIY0vefxKWR3esXALJ+iE+5KhjwCM/SDHhVKF1OAPjP65LjZdLn6xjybsuIP1LNJJRerJevxmb10ZfAYS4MaK2qjkOvLU48wZQEdd7TqHe3SPWFugIgbYKJOwpiYrTpxbyqzMaJMXQehZ2b0Q7EurJF8gS2hV2zIYHC+/aBeQd4z9wBqJD+Mp162W90y7pUA2VdAMhWTUwB4UoObR+UnHHArcw2WYnOCiQs65uI3DC1YsmCHfEdruPisk6B+vCG9WdvpKtxo9tDxWGj+AVk5ESNJdpzhTlkmh+YeFgGubsU+oxeDD1cz0qhHp1s9gtCug3GEIlTk8hJe2yU550ouwxZov/wZ3Q3nVYCt9CoiVQAZRadP5xuEMSpGp9UhwaKxKZVKzdA3OJUFUhfs/P7IulyAkkN8gU+E1/8y+5zfeRaG9HEmQ4TDdiYYaWUtVYFhCNx1mk5sU5yz2jiE+5kmmwHiMFddtU0PvslrIiJtL0OQvtVnKbUu0ETT7/PhLorkvf6hCIS6yzPl4DYo/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN5PR12MB9511.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGorZUJxaEJEcnFhY2pubnMyRDZEMGJzeU5XOXlCNElDMEtGV0tPbnRjT21W?=
 =?utf-8?B?V2Z5U0pJYzh1S1FTZCtFZFpqbXNKbVBvc3lnRFV6b3UzUG9La1hUUXlHQlpw?=
 =?utf-8?B?bURrR0JpKzFzcUNTL1UyRkdrTG9PUWpmRHJTeVZPMy8rRmMzKzA1Sy9WUnZw?=
 =?utf-8?B?eWRGY0dqdkFrNGk2M09NZFB6eTd1OXlRRzFJTHZ3NEVGRi8wSGx6cm16d3Ba?=
 =?utf-8?B?SGhjQm9vVzB1c2l1MUZyT2YxL282NkFuMllRNGZkcTk1UFMvQ3hwVndmNDBh?=
 =?utf-8?B?ZjVBbTdoU2RHN2xwWXBOdnN5UjBoNDQ5cm1uUVNaSEhxVldUZXFDOFRram10?=
 =?utf-8?B?QU05ZS9XRjVoRkg4TDUzYkF6d0o1OFF6T09wak00eW9FVndzNVFMbEhvbXZ3?=
 =?utf-8?B?a2EzdnhOVmU1ak5pSEdJQituaGlUZ1lzUjRDUTZOYXBycWxpUENTVVQzMm5C?=
 =?utf-8?B?bm9TdmQ3WTN2UDFhc0QxRXBqYVlSaEdZODBleXQ4M09IdXVqL1doUEI1LzBq?=
 =?utf-8?B?WVBTTjdZV01rTk95K0p3SFZCalRGYWdZdnd5Q1lzNWFmd3RMcTYzMkkzT0o5?=
 =?utf-8?B?WSszRWo2OG5qV0didHlUT05rQ2l6V1FRVkNKNjJBNGdPdklnTXdJb1BFK1RJ?=
 =?utf-8?B?TjFqdE5IdWdpem1vQVdZcnV6eFpQVTdvTG9Fdml2VGdrY1JlRTlQUkk3NVZL?=
 =?utf-8?B?c1RBYXNCNE11bW1KNHI5V0k1TkcxVXlPbHlVUjlMdTNDOCtwQlYxODdCbFhQ?=
 =?utf-8?B?aWlydGU1ck1sa3dLaGNqcFRmV0ZlYUJRemNWaWw1a2FaMGNTWDJZN2tnVzNW?=
 =?utf-8?B?ZHpJYk40cmVnVDZkYml0ZVAxYk1hcUE5eVpqMjM2Zk5hOUF2NmQyV2xDQ1ha?=
 =?utf-8?B?WkFWTDNSdGhRVHlIZDRkTTN0NHFDSVJVdzV3T0pBVmk0S1BJZmZHZTNweFhy?=
 =?utf-8?B?VjRTVzlMWDdzUnh0OGVyUG54T2txRWlQakZtYzMzb2JzNWpFendMT3cwNnZa?=
 =?utf-8?B?Mi9Fei9pVnBVZG1IZmRzZVJ2R2RBc0xiMlR6bUJTdk91OE5wcTRaekNyOHJW?=
 =?utf-8?B?QVplZi9mRFR0ODlNZFNqZUU5NWdIMjBxZ0VYUXJxazlhY1daUjNaL0ZHTXNp?=
 =?utf-8?B?aHJOalRXaHNQbnJaWnFNWDV4MmtPenpTVDRBdTdOWGxuM3BBK3l5YjNZbWNo?=
 =?utf-8?B?dXZsb1hDR2VyeGFiVkVvV3dVZXEyS2gxNnptSHVyeC82K00xNUw4R2hmT09I?=
 =?utf-8?B?bHVrM1o5S3M2SjFXbkJ0M3R2OSs5OEM3aUlwSjh5T1BKTGpEQjR5N1JGVkpG?=
 =?utf-8?B?TVJKaFBhY2ZIc3JMY2ZFMXRCeHA2V1JEMVBWTHVXeTMyMjRmRHQxTElYN1hk?=
 =?utf-8?B?WUt3WDA3OTNFNXNiUEN6K0JrUk92eGFEUDR0Z2VwTTg5MTJCZVprbnR5S3No?=
 =?utf-8?B?MTB1WlRIdUNqallyZ1ZwaTE2NTJ0ajQvd1Bja3NjS3NtVDF2ckRnaGlOYkxC?=
 =?utf-8?B?RmxmWmkva283UEF3YkhPM29YZ1MwdTdLUVJZbHJQNytpOTdSVGYzWW4rTmRo?=
 =?utf-8?B?T2NmeHZxRmVreEZ0d1EzT3BCcXJCbFpUU3lUbUlDRlFZaFBqM1RVR2I3WFJw?=
 =?utf-8?B?cHJlRTNhNklxeGxCTDRJR1N4WUZ3UGRiZEpqeHJyNHFZTGplOGJvZDBUSDZu?=
 =?utf-8?B?RVoyQlZPUERRUGxtME84RXhwTUNxQlFnWlRrT2JzYXBKcUdUeUdPUEV6UXJq?=
 =?utf-8?B?OTFzRThVdmtaWXJIN0sycG9pTUlOY1YwNWN2NUgxSnFhRy9NMS9qQUgrYW1Z?=
 =?utf-8?B?c3NtRUkrZ3lOZG1rcU9nNnpwWDBoWEZJT1BkSDVoWXM1S1N0YVJkYndkbWRx?=
 =?utf-8?B?LzNNbXpQNFdDMWI5aW13ZEl4Mmtxa0pDMU9LSjUzaEFXVkd2OGlOZTU3N0FZ?=
 =?utf-8?B?bTUvOStCWlhmNGZXeDhWNlVUN2FmOVB4b2V2WVk1SVU4TGdidGxmYkI0b2Zk?=
 =?utf-8?B?WnJveDI1NVFhaThMaG1LMUNmeXY4QVVESVVnRDQrcHNodG9yVW1aREg0Zyto?=
 =?utf-8?B?cjlCRklxYWNpRVZ1R2pGYlA5a2lYaFd2Z1JockIvWXo4RHpTQjU3WmYwZm0w?=
 =?utf-8?B?YWNYR1MwMkF5elRoOU1GMktzMjRCbTFTUm1WL0Q3UEd3aTVtcXhFN3U5SVVS?=
 =?utf-8?B?a09CSlZDaUNlamp2di8xRVhIR29LbldNdGptM3JiV2xXNCtmT0krUUxwV241?=
 =?utf-8?B?ays4ai82NDdYM1VRSHhHdnREUlQ3ZHcvRHQ1QVV5aGxmQTJ6THVoQkd0OCtW?=
 =?utf-8?B?R21ta1BZSlRtRDlTbllMT1AwTnVmWU1KK2NaQkUvV2IrY2d4c2lMdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac55da48-9a98-4c59-0704-08dea69c63b3
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9511.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:39:35.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W07NwXSB5fwzcC+Ar9CkmIRP3G3KdmUmofsk9gMmcYeafaRQQVxZ2JwQz3sip+BpDAi5xZ49qfrbMS63axfrag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4245



On 4/30/2026 2:09 PM, Jon Hunter wrote:
>
>
> On 30/04/2026 08:09, Ashish Mhetre wrote:
>> The tegra-mc platform driver does not register any dev_pm_ops, so the
>> the SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume)
>> on system wake. On Tegra186 and later this means MC client Stream-ID
>> override registers are not reprogrammed.
>>
>> Register a dev_pm_ops on the tegra-mc driver and route the system
>> resume callback into mc->soc->ops->resume() so the existing SID
>> restore path runs again on wake.
>>
>> No suspend callback is needed as the resume path reprograms all MC
>> state from the static SoC tables, so there is nothing to save.
>>
>> Fixes: fe3b082a6eb8 ("memory: tegra: Add SID override programming for 
>> MC clients")
>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>> ---
>>   drivers/memory/tegra/mc.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
>> index d620660da331..343ac0018eba 100644
>> --- a/drivers/memory/tegra/mc.c
>> +++ b/drivers/memory/tegra/mc.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm.h>
>>   #include <linux/slab.h>
>>   #include <linux/sort.h>
>>   #include <linux/tegra-icc.h>
>> @@ -1010,10 +1011,23 @@ static void tegra_mc_sync_state(struct device 
>> *dev)
>>           icc_sync_state(dev);
>>   }
>>   +static int tegra_mc_resume(struct device *dev)
>> +{
>> +    struct tegra_mc *mc = dev_get_drvdata(dev);
>> +
>> +    if (mc->soc->ops && mc->soc->ops->resume)
>> +        return mc->soc->ops->resume(mc);
>
> I noticed that the tegra186_mc_resume never fails and always returns 
> 0. Given that this is the only resume handler, it seem that we should 
> change this to a void return type and then we can avoid the extra 
> return here. This also simplifies the next patch. So may be we should 
> add one more patch to change the return type for this resume callback.
>
> If we ever need to return a error code in the future we can add back, 
> but if we don't need it now, then I don't see why we should keep this.
>
> Jon
>

Okay, I'll update the return-type in new patch and send V3.

Thanks,
Ashish Mhetre
