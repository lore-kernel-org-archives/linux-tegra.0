Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340354652;
	Thu, 30 Apr 2026 05:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527225; cv=fail; b=uGbV5YDkEhlCK2S1xaiIedomAMvdp/WBqoxuOhnh2aUccsywAlU8i/ZoAbdvATssKG1wbyb+f+G5JCNqfE9nYZ9yJHwvV6BgOnshoO919CNtOqq3AAXFLPof/llUrcMcu3WUUYNsNkSvVAvxuY6YdUv9kxRN0npe1RmnOczQqV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527225; c=relaxed/simple;
	bh=RS2yngAyl/Fhnuz7nPKvVfPDf/I+beD/KbI8C/Ya1EY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MWPXZCjm4bIjwBli9tzOjU/ivX+JN2b3Y/HTjJPlZ9LLmhq+wFtVkN5EolZj3Dz4DFQm8sVU8VxKim4N6EhrrQzCy+syAPPRpCzZXIEOH14tfo/4xL+hoNpashNJA2DTu6keAV4lxuCBdXrN/HgYbT7TGBA2o3Z8WUrFO18YoXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i+Qi69a5; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i+Qi69a5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1vsm3O0Vg41PBjKZOFXpRuHuRVr2LGeQVElmhYNtZ1TbY14+bbhIqFoQVs07o5be3boQ1ymoaNs0rYatQEv70NoGCr4ELg/OP9FQIfE9aDF8nUIx7kWyslD3BFninMaHsLh4Kh8cUyttBwRyzi8LC/c0MQJkpFqWtyk2FL2GDIqFUKCXy+TM28plQzDzb7xdaH9H4BXppKYlEaqmMuzaZo5LcmrG9Hj2GW1BZyRtvFeWjCxO7jqWPZnkQ9aILyCKDXK+7gj7IQYFG0XJ9QBIrAUTZtgaxgDd0tLfB1mDY57CXVeNQStYrAeUiyMYydQjeM+wSGSy6VobdwwNrft8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzad1Q3mSNLitYy5IWPW1LNfr20jfG7AkzDYkShNCbE=;
 b=Cqk6E4Q1gmtXbIWCS005di/R4kbIFr5VJ4wcy1p7pU06OeOqQfEyMn7HLG8KgBY7RwQE2WQcWRha+RZswEti45d3kMc9qj21gmddTxY1tfceK6Ldwa/sxjmeJkBA5FfprfdmD1vM4RXs+0M2kiYDXqFKFTjM1lUfb/ZfKbShhfx0r91KDx1mqD//Mdwv5GNFEHZsPsFdUea7YWSvJCUTJaUDeh5Dv3o+lxBEkcw5qq+kzf+0U8KyDV5QpIhZaLATMD7IYxKK+EGVBx2ptRjRfxteFBHuzzeGPrbKbrP4FoiEfVBfNvVI4NlMMKButSRnn/k5a0s9UMgh57Q6erM1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzad1Q3mSNLitYy5IWPW1LNfr20jfG7AkzDYkShNCbE=;
 b=i+Qi69a5SrZz6x7VCaTHubugU4PW6H2dQdy/5edKksZk0uZq5fow9aP4osNr6jEJ+A+qrm0qoQCwq/LbNTOkcUZZmpTJLYia1Tr2H2i+hIKJ6vLNUL12dwTD0AKy2jLjeCuR+HAr4bU2FEInABfgfEO+kKYvFIGIA3XpSPqFmwUem71uz1VQrwAHB32aJ6rBOeXD7bUD4ctzLORVEscmADkmHe7ReKr9L4m0ww4sSPfcIDmnwS6DdJ26l7xFal+MWuDGYNq4ZXBQpyDhFbganZHF4lei4oVq7V2+OWXbSXuNtqTB1fckYuz7g7rw0dzhqtDsZVAolZfImvu/dAWDeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 05:33:36 +0000
Received: from BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c]) by BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 05:33:36 +0000
Message-ID: <145f4318-b8aa-4333-be8d-dd0fd9203fac@nvidia.com>
Date: Thu, 30 Apr 2026 11:03:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: Wire up system sleep PM ops
To: Jon Hunter <jonathanh@nvidia.com>, krzk@kernel.org,
 thierry.reding@kernel.org
Cc: ketanp@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260429061122.807346-1-amhetre@nvidia.com>
 <7b8dde16-83e4-4a66-9ea7-6427b37ced78@nvidia.com>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <7b8dde16-83e4-4a66-9ea7-6427b37ced78@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To BN5PR12MB9511.namprd12.prod.outlook.com
 (2603:10b6:408:2a9::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9511:EE_|DM4PR12MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 100e9205-46e8-4617-621e-08dea67a06a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RvmXK1XtWIRVXCRkT/0wIooFTV3zgMAJjXnAO1lmzKktwWaAbCAGgeQ5AnNZJXSeKzq/4oqOit6a0GIJy5uMaBwJWwTfPdi/930ntmbECAGSuVNdQE8lJk8T3lk0hQ2/sNIQ5WFR5TGamAtQoMjA60buTvuNCIXKyb8v1mMdoFg2Mgk4GVlwiMjo1x9hnAS2hL45XXbqYonLYGn2BubasqCLIZx0Npj+E6BJYgMD82nXiz1H8Ce1/J1salakSCrYHG57mWR3pbW0YX+QiD4gOdybtlOQwpEkoWhhGw8IFAT8O+IqNLhUeZas7aiFu1jgI769ZxSbvyje2tY1QSGNq7JebSFJMJMKMto4qvVNxmqYi/We2Q3LI65PvOgrIwDzGDKvy4UlvCRNQ1ShG2XC29yKHhdhAe4aMSPby1vosEiMsrhMXixm6DxL1jFLvKcL/XfrY/cnQrl8ciCTAA3fhlMxCPtNo3TEITMkU8zAQ+3J5uC47QiAomEGTXyCp2fUW0Zdl0XxAt2Negqmsvi1cxyZw2vjzsgJjiDQSdCxuYj5WR2h4FYh2RsMbEDYT4ZYQv/f1bcZJceAnoX+uXUiZaVMVr4ri3NOSbnRbPSO6mn0Mi1bgCvZvx2Zq4D6W1k0FtQzxavuXAETkk02ErfdLDtERRz/UjSLgii0wjIyd5Nu0HfVnHexTdwaRQks2zGMpjhgalZpJNukOI/0HCXDD3MiTdhgscC004aWa9AB3EE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN5PR12MB9511.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JVM24vVlNOeXRZRE1YWVQ3b01QdUp4ZUU3WWNMTWJmaG9NbGtQL0NzUFJO?=
 =?utf-8?B?YW9xNjRxSkdQT0JrSnoxTnpsOEJRQWdGKzNxVCtJaHlqYXM5QVVwelM3MGRY?=
 =?utf-8?B?MzgvZXN6YUVDMURianluK01mRVFZMGZJamxiZklWakhLMTdKcE10YnhlM0p0?=
 =?utf-8?B?d3duQ2c1Yis4VWVxS0o3L21yQ2FHVldCQ3NsNjlsbE92anJuY3lDejlzbk1S?=
 =?utf-8?B?bG00ZzVnRmZodFM2WXB3VStNVWVXbEFzWnhBRUtWY1YzNTlORjBxN0tLTTBh?=
 =?utf-8?B?UGMvQTJIUjExM1ExSjNDekFxOVRMenlEN1dWQlZFbFVGSnIxc3NYVHJuelhZ?=
 =?utf-8?B?UzVpWHlWM0xOengvRVlPdWZvakFsaE9LVW1DQ0JiVHk1aWN4Y3NPYU5ReXFj?=
 =?utf-8?B?c0ZvTFMyLzRlcC9TdFUvemZMUkVVYWlKVkMxcHNMam9hZkFYZnNkMTB3bXlV?=
 =?utf-8?B?SjM5VEl3eTVDRnV6ekNRR2Z5RGJ3cUpLWHAxM2dLTkNpZmxHak5IOVRKK0s4?=
 =?utf-8?B?Wmp1N3hwTDZNV2gvbmZHWjM4WGZyazhYTVVjMG5paWNwbTRBdWZ5c3ZtVE5S?=
 =?utf-8?B?blkzeENuckJCWXFIZFk5OVZkSURkM3ZLb1VKSWxnaVJYVGsyVVA3TXpSOFBB?=
 =?utf-8?B?dllTZVN4dkEzTjQ0bXptdC9OdFVtZFVVK3UzY0pkMk9TU1Bpc05iWG0zaEhn?=
 =?utf-8?B?WXc4YUpHMVN4eFVteUFsYU9ON1RVS0ExUG9TVkgwdnBhUjU4VXpaZXlBSngw?=
 =?utf-8?B?bytDVHNqaElYN0xiOUhKMERNcFg0d0dwVFhqQm1uK1g2eENUYWo0ZkNDU1h3?=
 =?utf-8?B?YTg5aC9aUGlITFJyZTVtektobGFjWHFLMkl6aWhnbzU2YWx5Tm9yV1F4U3R1?=
 =?utf-8?B?ajBJakEyOHpsZDdZdnowUWxZam4xWE9YN0hKZzl6MnByaWoxZFhjMVJVVGZ3?=
 =?utf-8?B?a0lHa3J0L2NMa2cxWEZKZGdNbEtkcU9YU0J3V05xY2YwL1pkYzNrcnJXTEpV?=
 =?utf-8?B?bWdCUkpDbmJvV1RkdWtKV2Q2a1FqenR2K3c4bVVGYzN0SzdvdnBkV3dGVS9Y?=
 =?utf-8?B?cG9scHdmazlWcEo4WG43V3k4V0ZxSEFuaVBnZHM4aW1mTVN3ank4THpNUzRz?=
 =?utf-8?B?QW1oekdHYlR1SWVLZDBvWjBjZ0g5WlVZb01iTlY3ZEJ5OVk0RFpLa1BjMjJN?=
 =?utf-8?B?ZjZ2R2hPQWxMTU1rSkZtS1FmK1FLR3hFTXlzSjBHQUNVajJQN2c4Zm1aU0h3?=
 =?utf-8?B?bzR5M1F1c2tMWndpVE14M0kzL0MwdXZha0JyenEzRU5xWDFMVHJpMlZOY1R6?=
 =?utf-8?B?VnJzbW82cVZtODl4MjRwUmpkdU5RN1oxN2lSUWxjblR6Rk9BaXZTVnFBK0xO?=
 =?utf-8?B?MGJnU1ZLOThPR1psNFViUmtUZ1VsQWhKWGx2ZHJzT1I0NjZMQ2RFRUhTelRE?=
 =?utf-8?B?bEEzMXBLMU5qVExCak9INzVObkJrRVBOR3BvNXhMb0RFYTNHdVVrNDJhQ0tE?=
 =?utf-8?B?V3ZpOHk4SGdaSHp3VUdnOFNrYmZVY1NaOUkwRVEra3FqRWNzSEZnY21wYXhx?=
 =?utf-8?B?UXJLdnNUY0Vua2FOd1VGanBVaGpsdTJLTE5IVzRpR0k1Zlh3Sm1ZM2sxblI2?=
 =?utf-8?B?SHlTOFRRMkwwTjlSKzlueXlnd0d4MkhvbFZwNmlmcDB3UmpNUnRqYWlhdDdO?=
 =?utf-8?B?T2ExMVhHeGp5cUhBTC9qVjNOUUsrTGtrNEVZVG1qdCtjUmp1WVNwM255VStn?=
 =?utf-8?B?T0RqOFlrT0pveDZabGhkL3RFRkMxVGlrUkFPV3BDSkNwd0UxbTV1RmlzRFJi?=
 =?utf-8?B?OHVSVDlWUjVISDJIUUlSOURkYk1rU0RpV3pVQkh0bGRpU2ZvUzV5SWkzYXBj?=
 =?utf-8?B?YlRiOTZCS291T0NTUGgyOEtzN2xST2ZuRWVPT09KWFMxbzBndWUwdTV6dkc5?=
 =?utf-8?B?TUpWNW5EejcvTEtrVkZwa0JlZ0RBeHdHRFhDdHpURVprUlMxejEwQnlkeFFr?=
 =?utf-8?B?eDRVc3NvbzlGVzlPSjZvNEx6Snl4Yk1OWHFRejZEVjg1UkVWYmZUZXJBMnZU?=
 =?utf-8?B?MVFPQU02VTRzd2o4bkxLa1ZQSWVtNjJIazlmMjUrWFh6MzRiY0l0K1g4d09Q?=
 =?utf-8?B?WkxyNFM3OWU3czc1aElUek9DR3dpMWVIVG9wSzBsYVZvV1FiNWk1VVhrQ2lN?=
 =?utf-8?B?N2d6eVRjcGY5Z0pwK0VGSjNLWDJJTnhFYWltT0dwUWYrdTVGWnE4L2pRaU44?=
 =?utf-8?B?MnlWSGVxZS80c3FydzlGVUJmRUZJNGFpODA1TzBVSE5ZMHI0ek9SRjhjRXZI?=
 =?utf-8?B?Wk9XUlFFSm5kRDlhR0lxZU0wbnNQK0pyVmRmV3lnQk9BeEw5KzIxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100e9205-46e8-4617-621e-08dea67a06a6
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9511.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 05:33:36.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbcDT7T3Ra20rbPXe3QC103kjFOgbgyvZeTjx2He3uj/t83xhdNMg/8VvKMBFuKOsRFHcXVwcvAx9wbzAdvagg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350



On 4/29/2026 3:23 PM, Jon Hunter wrote:
>
> On 29/04/2026 07:11, Ashish Mhetre wrote:
>> The tegra-mc platform driver does not register any dev_pm_ops, so the
>> the SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume)
>> on system wake. On Tegra186 and later this means MC client Stream-ID
>> override registers are not reprogrammed.
>>
>> Register a dev_pm_ops on the tegra-mc driver and route the system
>> resume callback into mc->soc->ops->resume() so the existing SID
>> restore path runs again on wake.
>>
>> The MC interrupt mask registers also lose state across SC7, so
>> re-apply them on resume. Factor the existing intmask programming
>> out of tegra_mc_probe() into tegra_mc_setup_intmask() and reuse it
>> from both probe and resume to avoid duplicating the loop.
>>
>> No suspend callback is needed as the resume path reprograms all MC
>> state from the static SoC tables, so there is nothing to save.
>
> Technically, this appears to be two fixes ...
>
> 1. Register the PM ops so that the existing SoC specific resume is
>    called.
> 2. Reprogram the MC interrupt masks for all SoCs on resume.
>
> So ideally this should be split. The first part appears to be a fix 
> for fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC 
> clients"). Although the 2nd part is a fix too, it is only applicable 
> after 9f2614510960 ("memory: tegra: Prepare for supporting multiple 
> intmask registers") so may be a fixes tag is not appropriate here.
>
>

Sure Jon, I'll split the patch in two and resend.

>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>> ---
>>   drivers/memory/tegra/mc.c | 46 +++++++++++++++++++++++++++++++++------
>>   1 file changed, 39 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
>> index d620660da331..cddcefdd16c5 100644
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
>> @@ -910,6 +911,19 @@ static void tegra_mc_num_channel_enabled(struct 
>> tegra_mc *mc)
>>       }
>>   }
>>   +static void tegra_mc_setup_intmask(struct tegra_mc *mc)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < mc->soc->num_intmasks; i++) {
>> +        if (mc->soc->num_channels)
>> +            mc_ch_writel(mc, MC_BROADCAST_CHANNEL, 
>> mc->soc->intmasks[i].mask,
>> +                     mc->soc->intmasks[i].reg);
>> +        else
>> +            mc_writel(mc, mc->soc->intmasks[i].mask, 
>> mc->soc->intmasks[i].reg);
>> +    }
>> +}
>> +
>>   static int tegra_mc_probe(struct platform_device *pdev)
>>   {
>>       struct tegra_mc *mc;
>> @@ -970,13 +984,7 @@ static int tegra_mc_probe(struct platform_device 
>> *pdev)
>>               }
>>           }
>>   -        for (i = 0; i < mc->soc->num_intmasks; i++) {
>> -            if (mc->soc->num_channels)
>> -                mc_ch_writel(mc, MC_BROADCAST_CHANNEL, 
>> mc->soc->intmasks[i].mask,
>> -                         mc->soc->intmasks[i].reg);
>> -            else
>> -                mc_writel(mc, mc->soc->intmasks[i].mask, 
>> mc->soc->intmasks[i].reg);
>> -        }
>> +        tegra_mc_setup_intmask(mc);
>>       }
>>         if (mc->soc->reset_ops) {
>> @@ -1010,10 +1018,34 @@ static void tegra_mc_sync_state(struct device 
>> *dev)
>>           icc_sync_state(dev);
>>   }
>>   +static int tegra_mc_resume(struct device *dev)
>> +{
>> +    struct tegra_mc *mc = dev_get_drvdata(dev);
>> +    int err;
>> +
>> +    if (mc->soc->ops && mc->soc->ops->resume) {
>> +        err = mc->soc->ops->resume(mc);
>> +        if (err)
>> +            return err;
>> +    }
>> +
>> +    tegra_mc_setup_intmask(mc);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * No suspend callback is needed because the resume path 
>> reinitializes all
>> + * necessary MC register state (SID overrides, interrupt masks) from 
>> static
>> + * SoC data tables rather than from saved runtime state.
>> + */
>> +static DEFINE_SIMPLE_DEV_PM_OPS(tegra_mc_pm_ops, NULL, 
>> tegra_mc_resume);
>> +
>>   static struct platform_driver tegra_mc_driver = {
>>       .driver = {
>>           .name = "tegra-mc",
>>           .of_match_table = tegra_mc_of_match,
>> +        .pm = pm_sleep_ptr(&tegra_mc_pm_ops),
>>           .suppress_bind_attrs = true,
>>           .sync_state = tegra_mc_sync_state,
>>       },
>
> Otherwise, the change looks fine.
>
> Jon

