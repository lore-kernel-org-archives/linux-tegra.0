Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D0EC38A02
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 12:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJ1Mv6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiJ1Mv5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 08:51:57 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98DC1D20ED;
        Fri, 28 Oct 2022 05:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDZXjpirtK827nPlA0xnYeo5WAPcGX8EqFhj0z+TGsI24IabqhZ5DTxAlg2mkc2ss5UxZbhI/nfu/nlg3V6+7A0tci8rXdW0mF6dksSPHOf2jWTnrcylOVhzDHv0kwQG4f4AEH0hAxQUPnl2nm9IGcoizT+vo/rrEHVtneBpzc+txe2qTx8hfxpx0oGi9fWsAX+LljF88MdNVMpgjs2EkRvYIdt7obtXUxAycyRwc+vCbWyT6buoELLTY37bwPLpIyR3GSyKWzcfn1rMldueX/u5D9ydKmFmQzgH5vxhKwptN2DFBDNxZLf4oRcR4JXu7W6MnBfKSAOqwiZAGRFssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4W0YorHqCCYisIEP32QdMsVfny7CN7bWIAJNA2UfuM=;
 b=EcDp0PFNxEOrVflB4t68lSs+25UNwKKwFHyQpJ5PPENpQKiPVzsYdTs8bZF49BrO0Pf8RSWTF+9QDBflDhjrMsk2yokLKc+03HMMTsPcK95Gi9FFN2c8itEZvgzDVdTi8K8FqkOho1CgUHHBv4G4M0JGpbj5xOTL4NpLlbmCb4z/aU28fwtOjI8ouhp1RpIR6x+1rf2/49L09m7WeoXLjLKh5Hci2oC72EQmJk/pzgMpSP3f0EUQrSrmbTf7XpdoiTlhBCCpwGMvGdWDe2yqmspvnzAdZOVhpfAJoXhWe2V6LF27/AycPnEeGw6Y9FRNvRfAn0YW+EyX7bfxa2nwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4W0YorHqCCYisIEP32QdMsVfny7CN7bWIAJNA2UfuM=;
 b=RRhjASN5TtafX2z1gcmKAwXLPnnPwAFPZj0UmEOVtCnvLCWr/zuWGRdRdA1weLoDgb5eRYdMpVdm3KxPwdQI5vC0hUqEa5zgtaF6cZEtiMv/T/8gHHLq7wEShr4fjr/pREQQVU7u83mP14/TVnUUPSkjHAFV2/KntFcYtdK8Mvz/sJ01LSO3LEwDKqyj3l4I0oN9s+fF0V/JEG3v69ODyCuQ9ck2DBong7ACpdic0RAt8gzuvweTxEifqTqZ01Vodn5xsPzTJ53KNjvksFSgCQtMifBImvzt4TgXRIKusBglTpSFT9r2DqyC8jp8QUP/RD7m7y4YG96hl8MY0KWFSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Fri, 28 Oct
 2022 12:51:55 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 12:51:55 +0000
Message-ID: <073073ae-d921-e11f-8ff4-67f1a61760d0@nvidia.com>
Date:   Fri, 28 Oct 2022 13:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] memory: tegra: Add DLA clients for Tegra234
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221028123741.134880-1-jonathanh@nvidia.com>
 <20221028123741.134880-2-jonathanh@nvidia.com>
 <ce3fdd20-248f-4fdd-fe83-2aa79fd297c5@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ce3fdd20-248f-4fdd-fe83-2aa79fd297c5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0628.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 613db1c8-f36d-49bc-7056-08dab8e33123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wsQ7aq/9VtFCWMaHqJkwp/d6AKv71KzkjJrgUelE1wfhQZJnZr335V5jveWnvwLFsc5JRuRzjeZ1aiWyu2Xdw65Mz0iEiSDViYr3Qb6DOPpcX3NWmByJqmiMgz8sDdhoRm97yKXIlqfySZrrWRpgUDjv36pDgVOzJkjfjtjjUHWgVET+XN3Ee8v9RVpxTlOHf2HH6LW9uwJ+8npcHiKZE/0vEuPgiS7p5Kvyqd5xVeJoIqpVcp+GfWysbK2UoawrJcv+YU7rb3L2hzjuTYMlfLqmtk/DHMpZU8CeUxLW0aY/NeuQjq5T5zTOYC8OhfQM4zMllLdSaWu5XFwjlgS8Zj7+pGkZfKFP87HHO66rpF2opR3zVy08itZn/euGvZdoZ1j9Id6kxyHvlHvXZzgqEqaA42rf+fv+18oUB/DVk3QfH+H4aD0KSkPxgtAM99rtZSd5oR6J2MEq8INcR3N51Y4ywANIfXEHDy0dE5/Cx9mS1r42cUzUtCRvLCMxj66IuxXMji+96HKdRZoOW1rGfZUJlaGa2ODUQUcIg0rkd2NZC3tUHtot4rXBPQiysIwSNbznRPTJkacueYtLSifYeMbj4OY2HMrJtaxeTA04UAsMC/a+bmXyQdm5mGOhUREmKP4CJ+wQ1F91SNvktHtJxy26qaDdlg2WR2VShikI13nowgv6PHITBnkWF/s+UO5QKtPueZqdjeRw6/LxqTa2E7nELIwsvoQvfCceBqVs27tDYlHbgxgBDPV4oJ0LMIMjCeAM7ezqgAh0mkRe8cPhG/LupoNglVTAH+mPN/9izE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(31686004)(36756003)(6486002)(110136005)(8936002)(66946007)(5660300002)(66476007)(66556008)(6512007)(83380400001)(31696002)(38100700002)(4326008)(86362001)(478600001)(186003)(2616005)(316002)(2906002)(6666004)(6506007)(53546011)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1k1djd0QStQa2txdXBPemdjV1RHMW1DS2NzcmNvUGhYYVpIeXRldStBV3pq?=
 =?utf-8?B?YkcvNEo1TklwQ0oyMXgxRTY0SmNRVlRMMVZtRUxxQU0vNTN1dVRQNlUxMHlQ?=
 =?utf-8?B?UXpjcnIxSWZoNHhYUEtnTUZRRjBsODJ4MGk0bm5OY2t4d0R3M3JZVXJWOFMv?=
 =?utf-8?B?bU5CcXpFbmNWdktLMm1jQi9pY01MUk4yRmIxSFVnTTM1bFFEWjVHUjhrMml2?=
 =?utf-8?B?VThqWWxzTWM5eVZ6Q21ZZ0krSlJnSGwrS3pYTTEwdjlQU2tQdllHdVVwYXpO?=
 =?utf-8?B?eDRTSXdaRXpJeXhRK3VkYXVwS0xQam44VnpCT2NHcDlGbmlxVmhqK1JGN0lB?=
 =?utf-8?B?T3QrcXB6MStPeThmT3NnL0JBSjltZm9odWplNVp4NDZHME8vRkJNc2NmTFBN?=
 =?utf-8?B?TE1xR0xKYTJCWEY5b0FrWWNYR1FIQnI0eC9hM1hpVGdLVm9BQml0TzdpOXdp?=
 =?utf-8?B?WGNhaW5pc2daSnUvRVcxNDlqWHdHOGQ5Uy9NUWM0bG9nK1pYMzN0UjJUT3M2?=
 =?utf-8?B?OWs3b3lGdEE3R2FwSkRXeVIrR3gyc1lrYWV2MnhaL0lGbGs2czNUemU3WjA1?=
 =?utf-8?B?dll2bjBaZmNqeTl4SmtYMVprS0FhdW9FaE9PcnplNE1CaHMwck5tSENYQ3NT?=
 =?utf-8?B?QlovWDJPY3JoZFpuVmpsR1BSK2UvWGJQRWpHTmd3THFCeGlkL01lcHEreUE5?=
 =?utf-8?B?NjFNOFRFUXdKY245Kzg4K0dzWFgyVGFmQWlTd2lCMlZIVzdSYVdvTjBtSDRR?=
 =?utf-8?B?alpUeURTWHZDbDQyNE5FeEpuS2hKN2RpQi9GVkdjRXJkR0JlUENFUG9WZVJ4?=
 =?utf-8?B?QXVSVTdXbTRzLzloRFZmZW8rRzlQVTBCNkdLNkJHVDQxakJ1blFud2tkRjZ1?=
 =?utf-8?B?b2JvbkRNSW9zY3hzcWR2emFIQWY1M3BWUi81Q0dONmRFZHNNMEZ0cjdFU3hu?=
 =?utf-8?B?TWM2OFdyU0ErQkRTSXBqeE1oV05CTUYzVjNIZXNmdWRpeVNKdU9KdFNUNVVh?=
 =?utf-8?B?ek5USHgyRTFnWDd1MXBBQVJybkprcHZZbERPMVR4R1FzOG1DSEVlbk4xV2JQ?=
 =?utf-8?B?TS9yL3ZOSHh5Tm9jNVYxMXVVL1pzRWZ6RnRobjJOTGljd2lPWE52UFREajhi?=
 =?utf-8?B?TG5GaDhMREo4cms5aGUwMERHMWdZdXREd2RTbCtvc2pDdTJBSm5SZDVIK0M2?=
 =?utf-8?B?U0lka2ozblRPcVNEK3FTbHB1WDIvWHNxb25vMGhucVBpcmJGQWNsSkJWbXIz?=
 =?utf-8?B?QXhuVlpMdW9aREV2NzlvM1EzQ01scVEzRjB6UnVwQmpDMWNFZ1BMRGNvRVBU?=
 =?utf-8?B?Qm5sTWt3TVZ5amxTeGd4N0lLQjZHWWxwNU92Y3krNmtZYjFEMW44K2JkYmtM?=
 =?utf-8?B?MUNUVHYxVGlMeFBlWGZmSWVlNk9CaCtHdHdONDA3VmRmYm1mOHVFeDNkUGlk?=
 =?utf-8?B?ZlprSlY4ekp5L09xRElWU2UraDh4M0VtSTBySkMycDc3YkRQdlRUTENGdW9a?=
 =?utf-8?B?S0tpQ1RrRFRROURBalZyckRZM2wxRGNQSDF4RkRZTHdJVmRrVE1xTE9lRlRn?=
 =?utf-8?B?NmtjR1R0ZVA2LzhGRDNSSTRGUGU1cWFkM3gzVzdYUW5mSG94K2RJdWpZUnJa?=
 =?utf-8?B?SG5yZ25DNkZjVjJmNThheHJjT2sycXNoY3ZDbHVmdW5jM1lKUk9rRG5pMmtM?=
 =?utf-8?B?UlBpNmhiTjAyMVh2bGRhcWFzRkhJTGpTSldQaHhBVHpGUGhWSkpiOUI3UmpH?=
 =?utf-8?B?czZLcU5LWkJRYXV3b1N5b2NvaVRFOVpkTUtvN2xiemc2VElIV0V4aHE5WDV3?=
 =?utf-8?B?ZVdDWGliWkdCcjJiSDdzYU02UEVXNFp5K2xCak5VQUo2c29lYU1LcTY2ZURU?=
 =?utf-8?B?ekhaV2pZeEtHb3lxVGptWkxlZDRRQk5YU2ZpVGVpNkZ4UW8yNElBcW1aV3cz?=
 =?utf-8?B?MmZpU1VwSWlEbERCOHlITXE2YUhOdTkrRjJLTmtyVHdUZXBWeVZnNVF6SEFS?=
 =?utf-8?B?SGtjMnJFQU1hNkdPRWpyNzBnTGg3aGY5SDV2S0V0dGpFZ1Q5NVVqUWFVMUo3?=
 =?utf-8?B?cDltTTN6NHpta0VRa1Z6aUw4WndpYmZMRTJtRHpUb2xqWVVSN2Z6aUtGYnVV?=
 =?utf-8?B?TFhqOWoxQW5JazF2Q0dzYVdTWjBJL1FRQ1BsOXBCT0IyVDAvWVJ6ajYzakNh?=
 =?utf-8?B?emY0Kzl3WW9YWDlLL0g2Vmk3eVdaVC9vTDVQbEdDRFN1cDVFL2ZBbmZ4VmI5?=
 =?utf-8?B?Z3hpVTMrajBqUFJIYVF0eTFFeGVnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613db1c8-f36d-49bc-7056-08dab8e33123
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 12:51:55.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqWLXFnsyHhBTviONy0zRcG9gDYkDjwoFnGk9aNQx44RP887BDZee0XhOOJnjPyrEpNj0HaA+Mvy/qIs5eDk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/10/2022 13:46, Krzysztof Kozlowski wrote:
> On 28/10/2022 08:37, Jon Hunter wrote:
>> Add the memory clients on Tegra234 which are needed for initialising the
>> SMMU for the Deep Learning Accelerator (DLA).
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/memory/tegra/tegra234.c | 160 ++++++++++++++++++++++++++++++++
>>   1 file changed, 160 insertions(+)
>>
>> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
>> index a9e8fd99730f..9bdaf8af8c97 100644
>> --- a/drivers/memory/tegra/tegra234.c
>> +++ b/drivers/memory/tegra/tegra234.c
>> @@ -170,6 +170,166 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
>>   				.security = 0x504,
>>   			},
>>   		},
>> +	}, {
>> +		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA,
>> +		.name = "dla0rda",
>> +		.sid = TEGRA234_SID_NVDLA0,
> 
> This is now not applicable because you sent dependencies separate, mixed
> with other subsystems... Split pieces based on subsystems.

Sorry I don't understand. This patch is dependent upon the first. I have 
not sent anything separate.

Jon

-- 
nvpublic
