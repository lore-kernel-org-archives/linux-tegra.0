Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E3204C3B;
	Wed, 22 Jul 2026 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724267; cv=fail; b=WvROxa0ghQmzcHmGI4g12lknRPqnz7abj4U99dNPNL93S5Fiwqiv7KA8CfGmqbmXl1sv0qsdVuxzot4vKMcp4nnLOJhDHf3yJKMhjSiIqRlKAbOf6A+dX/cYyJh9nx8hpfcdvwU+GMjWGcXDxSZeJJHe1lfFpWZMlvtlpARE5lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724267; c=relaxed/simple;
	bh=M7pN+QERg+8y6CWmrT6x+BaYGwWSy68gbtknKpf3efQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d6GG5i7HfhJo/BPHLJG2AbJpCEzv/xu8/JAXKS6ELXX30IjLutAFM0XoJmk4OikgD48lJWRO3xW9vNYDMVXLGsXDgpd92Gy0GXabD49bVretZLvEzfXo1BltUUmh7CYBNEZv4TaaFFTDD8oB+OV3OnqEJkDegQ8v2zGtqE9LTjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W4R2nrNe; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4R2nrNe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V90BvEz5FDDjozTvZn5Qslh65Ic9jLbI+eE8P94Qu98mJmth/pP7rUGyHRnrLRiATuHAjYly96fKu2HZ8rdYRh4FjavjTdISMTOlsXDjy8Co0oRcujSmDrZQZXZCEH/ubsHKEZCwNIUJWCkRCqAKkVDfQhlr1s8SxmkzkJExwtNouIeHQjSkVolZA5SNU1YbTAWqFTal5Z9Fn9x2pVpRUywbHwgYIhPWL49GXt20fs3m04+WAttcn1gNXRMQWStZ0CZ7toB3rs1BX8T5E/m0Jj90zOzy4WTglo/zw5J3qghweV56hUt/lkH1VTNnrthEJDNVqOHk0as8CvFaHlhyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNpfawdTrWIWVQK4HS5GmdtWY1xQMF0sI26Zeq9K8Lo=;
 b=JfgtrIWzzWY6FkIEnHDnHYcxssmhBUGl55xMi+nZfXJcfPE66EmeO0S6gZJTl4VghXjLUnsT+/TZTjWvN6w1FeBpjQ4EP/mXi0eLZH2GrecJEhC47S/9HVT/IOcvBH7U+2q2IfaWRyuV8++7Y2W4+J6Rh1K1P/erkA9OzRDH/pE9Vp7jozG8Xxiv3hdR9ArfWUs3C7L86PRcueKMRslj4fkbSMf0+8qsEjA0cl5esND9YOXFBNq3/0pQMCHTd5HLEuUZV6MEga/eURi6BuNQAzTTOy8fYZXTACRy2iep+H8LKGs7kEBW6Xzg3BPDHnJoxtLPvJmcaD+RetEUuhno1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNpfawdTrWIWVQK4HS5GmdtWY1xQMF0sI26Zeq9K8Lo=;
 b=W4R2nrNem6bdYsPDdUEsck3vEpjEMS2lwtvvS0iF46kBwSOCG5FNpuhVqvI5Zk9+gONlj3IYIKoRonqnQJl1lPiLuKIZrGTeBDALJFYMdvdreblCO65UxMteSPU3vpx5ukRKziLpyJLe+Vl0HS+LNQOngPyS53shwANmcLm7QSKT02IYJAEb3ESMbO8UmxcgZY4LmmubhMtluN1JsjzX7yxu3qpCs67hryeZgMQWAx5o7WMuyBWueZy5xpci0AJW3dBaksqUGMLGR8J0qF3t5XXLYQ6OK1LIGLc+qwvqsbqG1GHHFGU0OBDx/Eyjo6auIlbJDS9n8mq91E8WQgXLAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:44:20 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 12:44:20 +0000
Message-ID: <1a09d973-df0f-4e49-81dc-2c12c795d2c6@nvidia.com>
Date: Wed, 22 Jul 2026 13:44:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc/tegra: fuse: speedo-tegra210: Support revision
 B01
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
 <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com>
 <00e569b5-df74-4310-a33c-446005bbf11c@nvidia.com>
 <CALHNRZ_0++igjSQBRo-LVW_bvyu98x_4DXjxRSq0kCNxMaqYKw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ_0++igjSQBRo-LVW_bvyu98x_4DXjxRSq0kCNxMaqYKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::6) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea8891f-3b87-41e7-e13d-08dee7eef32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LFU7tGrIBKbdenalWwgeMNEgTQhvRQ683vC2g1ojB6YpwzVgJ0lMYNP9kgZnInUTLzu+VV/MWF5fRSprN8cQkDRbvPsvivviIv9lRkV05rRAo/bNMa1noDMLwJB/aF2wIxHiK7EXMBThVg6ztrUQ32qvCSEAVPZfwevauKFUHt7aeKwV8qzYZ8IbIM5qkOiHRydJNvrwb3DXxAJ9X73XfJ9KJsR0sNLZXk5ePyAgre5K5ZszwA5342JK6DL3Hb+HPg9CgRwu2e2S8uHUuGP75VeF0iQxq5dVyWXbZxz/QAOVliGQbyBO0SOSHKQRiwQU+ZNF6bgUiDfcNLzpK2j5fiIhFgENtcFqDIf1SghpKy8gRFDOXIBDM8XPdW6nCfkmjY1qQsKTpPtPh2PchdWUlFzeJrHCGgAbIkz6QJb+cKb5NN3oR+ehYOcl60NnMj3ndwb7qTOUKyXYRxKP6lShI5s5ROJQ6jlnkPtRlJMeU0cGxnt8gqW37n6Y8/DPJefq8JsNOBlFKA2rvDyq6o3BLW1+1TiwbHmzg5F/gVJpR9lpaTP7crSZMZJNoxqp0zGsPkULbCbqD1/2JkDswwN1DgdJpO9YyXlWIz6Y1fkG5O2BDGzbLxGyPZjrR9N4tG7fV1fKUuykuWCjIe/rozn2AcQQB3Yd1oc9ZjuW2HT5T30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUVwNWFwN3Z5Vkp3RGI0THZEdzlUR3ZraVlSY3ZudHlUTHQ1YW9rQ1RNeXhp?=
 =?utf-8?B?TFNBOGlUQ3lxTUNwZWs5L0ZOM1owdDhpMit6ajVrWWxwcDlKMlIrMExTbU5Q?=
 =?utf-8?B?RDYzN2hVeFJDVTd2d2hxUm5kaERVRFYxajBqeXE1dXdWa2xqSDg5L3JsL293?=
 =?utf-8?B?a29HemtkenpENGVGc04yUmhUcTNUcXhZcGRxOG95UC9CN0hvMysvL3UzTkZn?=
 =?utf-8?B?MlNGanFBU1haNTh3SU1lVzd4Ni8xdjhqZ0I4WHpJaDQ0VlZ0aHhCMXVZeG9Y?=
 =?utf-8?B?bkpNQWdLRklnVTlhbzUybkVDckJXUjY0dlBVeVdqeFRzeG4ySGxyWkVrTzJO?=
 =?utf-8?B?TFZPNURZU2ZITjZXREljclB2RTFMNjVDNy8zVld2KzlRS0NzUjFWQ2JVdGQ4?=
 =?utf-8?B?U3R6bGhTYXJsNFUwM3ExaGpvL1VoTksxbHVNa3E5QjE1cU5IQXQwTW5BK2NL?=
 =?utf-8?B?OFJ4SFZsVkUxTFFJa05odEF5cnFEbmN3Zi9wOURmT0VnTVVKYUY1UXlEaFA1?=
 =?utf-8?B?ODZ0NUxWUytkNWlGbWNRSG1ycXhJd09zbnZHTzEwNTJreFk0ZU5icWJ1Y28v?=
 =?utf-8?B?MFZjbGM3UUlLR0xVY09pWlNTQ2JFSWd1TC93aUYxcy9UeWV6eU1VdGp3RTVL?=
 =?utf-8?B?VnJDUEltSncyN2l6b016Q2J0M1RIeVRpQjhGOWhIam9hYmpQc3dqUzJXbjc4?=
 =?utf-8?B?bkd4YUhpYktiT3hYMkJaLzBscURWd2pKTTEyVFZpY0RUVWlhZDlHcnpRelA5?=
 =?utf-8?B?U0QvTnUrc0RickUraWI2aUd1U3FYN0ViN0RnclJhZngrQUh0SnhHNUljbWJa?=
 =?utf-8?B?b1RPbnorSGVCMkZxQnpHWjQvQUZVMWtFUEwrbjJJbGpxcU5OS2cvZUZDMU1m?=
 =?utf-8?B?UFlta0NUeU0rdmJ4NTVBWkU1ZTQ3aXQxa2xRSzBHSjc5TVBjSGQ0ejdicElD?=
 =?utf-8?B?OTR0S1d5TklOS21zRGhVZEtWT3o5U0xybmlzMkNZeWZRUkI3bmViY01tUXVO?=
 =?utf-8?B?QUY4RDFqM0hncUpGdG1CdE1jSnlzUVlaMWNMcWhGY1JoMHphS1hXWGlZdHNq?=
 =?utf-8?B?T1NQR3RzR1l1NXBXY09OZHFKZHljYk1LbkZwTGRkaEZyeUlXUXcwWSt5ZWVj?=
 =?utf-8?B?c293RGtmc1l3NkVHMXhiaEVCckY1b045dU1vV3ROVWdoTVdtYW4xQnpBRlM2?=
 =?utf-8?B?NTZQWk9BVlhBdUN4VnExOHBYZ2lUOElTSXZxVkRtY0w1TlFrMXR0cFhxbi84?=
 =?utf-8?B?M0FlNG5nK3ZsT2kxOEFZRkxYdXN2b3ZHQVBIVmZiYjhZRlNOYUVIT2gwVlpL?=
 =?utf-8?B?SytKWEI5YUhTWTBia0dnTUR2OFBmcVZIMUYzUVgrN0ZKb2swaTBKTFFWOTd3?=
 =?utf-8?B?UUQwcW5zQWFIN3Jod1BJUkZOSFh4YUxQaG8vcE9HQ3pRdDVidXJxQ3B5OEc0?=
 =?utf-8?B?cGNiUXkzbGJCbUsvdmZ4eHNJU0xyZktqTTAyVFNjV2xzR1ZkNUJXSjhHb0Zn?=
 =?utf-8?B?SDFyNlY3d0VnYW5YbVVjK1VxZnhGREwvYVE3cWtrRVFPc1dRRThLRERKS3Bn?=
 =?utf-8?B?eTRPV3JkWkhrZ1ltSnBrOXhTcnFVV1RGNkJZQU9GYVR6QUVOL2ZXbXFpUkhP?=
 =?utf-8?B?a3FnWEtVQ3pKZlNaeFpqZ3E2VyttdmhVaWo1ZnJObUt6QUp6ci9rV29oeWQ1?=
 =?utf-8?B?aXV5bGkwUnFFQXVWY3k0Y1NyT0c1ZDZxRU9sM2dETmFQUTZucWpVbmtoTklN?=
 =?utf-8?B?aUltK2JJRHN5akEvN0x1SlA5NUJmMWU2eTBJNkYzelJMRGZkeXU3VlJQN014?=
 =?utf-8?B?a29CbHpJT2hXVkgramh2eEVnRXVJQ0ZYSEMxTjcyVWErYlVudFZPVzY4ZGlM?=
 =?utf-8?B?bVpxVDhxMlVxU3R5b0VsSFJ3OWJoeGhTU3ZLVUlET3J1c283Q3pqblY2cE4x?=
 =?utf-8?B?bE90UjhlWngwd2Y0bnZxaUxrU1ZmOGJDYVk0V1NqVkFmYlRFOXk0WE1vRGRG?=
 =?utf-8?B?RnRVeHZmaEk2enNZY2JLellNVUgvaE92Zjkra0VLOGZNckJIVEJjVVpNbUVt?=
 =?utf-8?B?MUMzRWkzUEtkL3hXY05xUzFZM05NQXNiYzFQdnF6ajJJaWE5dzhtcHEwU1Rz?=
 =?utf-8?B?OENjRDNxd0xHdGxnanI3OHNhVVNrM08vUWR4V0FnSmJPS1EzM2wzV2lQQXIy?=
 =?utf-8?B?ejEzZlRnQkNwMDVvQWh4Q0xFK1N5a092eW9TcC84Vkx0VUJ1ZytTcVZCbEl3?=
 =?utf-8?B?N3FMbUtLVUFnQ21Pd2EvUVBjaEF6LzNRb05Hd3VOc2NmTys3a2QvcEd3QlFN?=
 =?utf-8?B?dlZnVHhDMzA3UHVxZE5DVEpHcjQwekd6TzVqbyszZlNlNkRrYXdKaGhLTzNM?=
 =?utf-8?Q?ELPyo7ZN1hvdL+Fk5E6LR7Y5nhbprbaQZn2bNNPvJmta+?=
X-MS-Exchange-AntiSpam-MessageData-1: IjpG3OIfpLqPNg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea8891f-3b87-41e7-e13d-08dee7eef32c
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 12:44:20.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vn5PLRgL2rlK1gFIQm2M9s5VxYMm/TUjT8bTOThWdazxXSWg2lCYlcxia9ql/C96dK1b7LEqBeftZMjo0+mdRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911


On 21/07/2026 18:31, Aaron Kling wrote:
> On Tue, Jul 21, 2026 at 4:46 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 18/07/2026 00:19, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> Tegra210B01 has a separate set of skus and speedo tables
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>>    drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++++++++++--
>>>    1 file changed, 20 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
>>> index 06c2bcbee5734..699751f4bd0c0 100644
>>> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
>>> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
>>> @@ -65,7 +65,25 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
>>>        sku_info->gpu_speedo_id = 0;
>>>        *threshold = THRESHOLD_INDEX_0;
>>>
>>> -     if (sku_info->revision >= TEGRA_REVISION_A02) {
>>> +     if (sku_info->revision >= TEGRA_REVISION_B01) {
>>> +             sku_info->gpu_speedo_id = 1;
>>> +
>>> +             switch (sku) {
>>> +             case 0x00: /* Engineering SKU */
>>> +             case 0x01: /* Engineering SKU */
>>> +             case 0x83:
>>> +                     break;
>>> +
>>> +             case 0x87:
>>> +                     sku_info->cpu_speedo_id = 3;
>>> +                     break;
>>> +
>>> +             default:
>>> +                     pr_err("Tegra210B01: unknown SKU %#04x\n", sku);
>>> +                     /* Using the default for the error case */
>>> +                     break;
>>> +             }
>>> +     } else if (sku_info->revision >= TEGRA_REVISION_A02) {
>>>                switch (sku) {
>>>                case 0x00: /* Engineering SKU */
>>>                case 0x01: /* Engineering SKU */
>>> @@ -154,7 +172,7 @@ void __init tegra210_init_speedo_data(struct tegra_sku_info *sku_info)
>>>        speedo_revision = get_speedo_revision();
>>>        pr_info("Speedo Revision %u\n", speedo_revision);
>>>
>>> -     if (speedo_revision >= 3) {
>>> +     if (sku_info->revision == TEGRA_REVISION_B01 || speedo_revision >= 3) {
>>>                sku_info->cpu_speedo_value = cpu_speedo[0];
>>>                sku_info->gpu_speedo_value = cpu_speedo[2];
>>>                sku_info->soc_speedo_value = soc_speedo[0];
>>>
>>
>> I am guessing that this is derived/ported from some kernel that NVIDIA
>> has released in the past. It would be nice to include a reference to
>> whatever change was used to create this.
> 
> It is loosely based on [0], but restructured to not change nearly as
> many lines. How would you want this referenced? Something like a
> 'based on downstream 5.10' blurb in the commit message or a direct
> reference to the commit somehow?

Commit d93f8399053dcf117ff56a3029ff08c0e36f4b75 uses ...

Based-on: 
https://lore.kernel.org/r/7703024f-8882-9eec-a122-599871728a89@gmail.com
Based-on-patch-by: Heiner Kallweit <hkallweit1@gmail.com>

So this would be fine.

Jon

-- 
nvpublic

