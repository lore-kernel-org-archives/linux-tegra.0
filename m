Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F831ECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 13:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiJ1NGh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 09:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbiJ1NGO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 09:06:14 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE1E1C20AB;
        Fri, 28 Oct 2022 06:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNw8DZaI7Kqp+mCB2PgynjbAjlrXinJJmZtlx3J4KcZCUSarz4NSFG/AVI0CiHC82GXU5eaqqYiuT386dNJsTc92H4cfG0pMDOo25JZT6LgOaGrxF/FcPIetNY9UvmZvp4muUIhrg1n+scc3SRdWtjZ1FkZlkdzXnavstlB8HwYh61pO9z/BdEoEezUmZBPWSOhFR4or3+3hpZObiIhIlqttcb6UKO9vgwRWzp7+/+uzGlBLjlSFy0f+9treuMS9S7ZvI1Dsr5AZiE69T7DxwmLYJlHBN4f2tN5xmxfLXAHO/q8AVPR1KOQDB/FVUBD6KCjbY3SlWuJM18dh8RmG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tVIk72sF1lGrXDDp0ZJzEPXT/4gMRdhreoK/Dk1HLM=;
 b=h60xHUex3mDRXGjvhPmZKeXkMkMg0EwsbiDn9YAI+D9Y+XwDQffOCr/JmhKKofz3W2b8tlSZwKKG+8XQqE0ZssFcaO+2u5XFgyId2F97taaAid0tRTIv4OHAwBroAf6bD9NAEB1N5Z+GaEo9XDjPLxuywO7ajswhDdsO6fhqoS3rgyZ5Y90Og/wBr4vXsPmPo6rifeXPqj5+CVhDy4R5iIIUTyl2sT2YBEirOFVK4ZAdt80tGMZ8/astK4zhwnz7dwksWjef8lmi0fmkTT7pGijs0qyqYJVRvf3kCeloOsIG2/X4c1KIK6ZYEiTqpjCbn/bDLFHxykMV4wrjRP86GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tVIk72sF1lGrXDDp0ZJzEPXT/4gMRdhreoK/Dk1HLM=;
 b=nW6NMZt2C+wT3s+fRV9JqJ7z6HKA8ySbXzj/DouLogJkWy8A6z5gzdDI4imuSyIh6p4SuX7kWMGgyKZ6kQGAcvudZNhDofG1f7iwpMmFIahdtJ99167YiptowNX0SYs7y4XH2JpW00Kg2vwmo/N07C79jMhxreBmrfdveEsFJx58Vxl4Yv0jO4sJQBBxxm0HvA6tkFUCStKTUmqr1hjwqhzx0hfjcycLjWYgnlBWI8StcWM3JKKBCjc6FlCNdavp8CQ3Ha3hVwcaI0NO/cfPlcHeSf8MS+V6vqEg3gD3njaxyIF0DP9r7095OdN/IkE9n3n+Q3Ij6MEZgPR1WUidjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB5326.namprd12.prod.outlook.com (2603:10b6:5:39a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Fri, 28 Oct 2022 13:05:42 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 13:05:42 +0000
Message-ID: <1c22af7f-fa73-6f79-ad12-d460b7c534c8@nvidia.com>
Date:   Fri, 28 Oct 2022 14:05:36 +0100
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
 <073073ae-d921-e11f-8ff4-67f1a61760d0@nvidia.com>
 <c1465ec3-a903-f1d1-621f-2cbe95ae53e7@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <c1465ec3-a903-f1d1-621f-2cbe95ae53e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: b10612dd-bb38-4e1a-ff1a-08dab8e51e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +oHFcNPHtSE2MZPhI060Oqcw3pgiH0nrRjaqgrOFW1Sz6s30LZJaBF5KhBaKWOFWCU3pzT6ZhcqczATdd+PBt621a9DmqgsWPA5FxdwlMr4PRyK9TuexiN7ZwndAGt/JWuHJPwaf60AlHeVWf/DEBPY6WCiXtYTjB9/ozqpnxyzCTUtAmiBN5DHYvmK70zvHUVf8XFYay4ZAx0P2N/Hz8lw+bf0xCM77mgV2N0WFguPtWGv9rvcxLeseIS4SA7Vn6OGb2yjd9vwSMzTHrLnTTvHgnGaNaSOzXktR24LmBYRtGPlpE/QSLNcx3IymvIYLiO1Ivv3I5gW8uIGL8QTz3Oz8GVFb6aFOEt0MVkNYy47hEodcR6VsljjfTKqkzswEaiqlF2R9s903+1EIFytZXtEy0O0mqPFppofla8L50LuQdFuLqJj5y3ceh+b4KYZu6lz2pAY8dzTDwNGTbMUDhxRq0vamwWv1bftQqx4GLtjeFzxvrnNW+5bcaeSBI4rynhpxV/lCTOoeGSWHXyfKjg7AqR9u9TwjJ6YKgyUfsMoZTQZA5hiAS9oD8TbHMTfiiVaY/1kngeFAuKpmHCJ8EYGmeiamhzqB5KlOEqpuaUEFaRXXRyJbo30NZcyfAotuSsUna3fMKbmADY+gWQqnwk2Sz6uJQruFKwhDCcfh9fTrmmIdLGtoO0Vh9yPZHDuNtnp2gAIE5vigOXSX7Sd+uVUwG0NgBrPI7WrM78j4IlKa5zyaHYIExgyj8DaxjlMA86v2Zy7TUISzvldlJ7Y67TndoJ1BViOg6hZuh4mV7Dkk5tmkQ6DA10R+Vcitdk334r+dkE7XcGUT5TPHP6xKWMJ65w27p5phS8HO+Vghtttj8rVQLi5GmQBDvmGIPwMq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(83380400001)(31696002)(86362001)(5660300002)(38100700002)(2906002)(66556008)(66476007)(8676002)(4326008)(41300700001)(8936002)(66946007)(6506007)(53546011)(6512007)(6666004)(2616005)(186003)(110136005)(316002)(6486002)(966005)(478600001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmNsNGJZcHZnamMxMlB4R2FwMGszYmxDZ21ZOXRMZGtVTDR2R0xEbS9sM0No?=
 =?utf-8?B?RGsyQURRcjRIcGpsSVcyakNqVm9hcXFSMzVlUHNYazFUYS94aXROTjNFM0pq?=
 =?utf-8?B?ajZtV0xKZDNKSUFpeC83UnZIVXRFOFNWZWFESUdSbGkvejBoYWtFdDRKTC9U?=
 =?utf-8?B?TVhibkhKR0o3aWZGWDhJMGN6ampTdU9EMEloSUg3bytqZXErUGFUVHlwcUxJ?=
 =?utf-8?B?S1d1dXFlc1lGdUFjd3RuZ2Mxcm1TM3JiaXpLYVc3WVdJdWUrb29raThtaC9z?=
 =?utf-8?B?cjgxVTRqWFJxQVNJMWdmWUVPSVBGWEMxUWhkR2NQekQzNnBFbzZXUjUvOU5P?=
 =?utf-8?B?bFlHRGZyZ0xHTmxXemdzaU1RN3Q0YjludDM0RnhDVGFQNG5NYjNpamxXaGdN?=
 =?utf-8?B?OFo5dHh1QnduUW9tNDlKVjArNGFZeHB6Z1o5dmpaYkV4cnVESnZxTDk3MWxv?=
 =?utf-8?B?WnNLWW0wRG80Vm9IM3pLZmx5UGUzVHRPOW5SWS9pYjBFbzl6OURENkluMWhY?=
 =?utf-8?B?ZGt1Uk5DSnRhSFBPTEVzT1dKdWpZVXdadkFkR2JjYVZqRlhsRURNaTBxVmpZ?=
 =?utf-8?B?OS9xODY5OWlHMS9XcDA4cnk0OEg5clJ2cmdYU2NHZVdaU25oeEl2S0FUWERJ?=
 =?utf-8?B?RUloTDlCTUxXTFl5VnhrRkpPZHNkbFRNQUVPenR4Wldoc0dDbklnekhMcGRC?=
 =?utf-8?B?NUk4MVlhTGcwRElaYWVpbGg0amh1QXBhNDRQU0diNnlHbGtrRit0U2VpYVlm?=
 =?utf-8?B?aTk1REZnMGkxeFZVSnNhU2pGZmtuaUFTRmxFZXg2UHp5Wnd1SzJNL1pkRVNo?=
 =?utf-8?B?Z3AxOENmMGZZUFRHb2NXR00rOU5KMVRiSFFFTllMdlZEM0prSFVzaGV1V0tv?=
 =?utf-8?B?T21xeXdqTTUxTmk1TjVLc0NwTVBsQTJOZVRnWnlNK2x4MWFyaDJwZzlRNnVs?=
 =?utf-8?B?Z1QxKzZLQlE2YW5RSkdrZmJ0Kys5aDhyaXF6Ykcxd2lTcFlWNkg3MWozdlIv?=
 =?utf-8?B?R3crb2s5ZlVmVGVacytqM3diNTg0YXRKelRuVkZ3TFl4K2p3T2RWTW5jb3lS?=
 =?utf-8?B?Z0dpUlBuY1FsQUJCUTgvaGVrb2MzbXk4NHArT3BrdklQNUI1aCs1YkFaMEdH?=
 =?utf-8?B?UUh3amZJenhGZEdVSWJvU1Z1WDV3TXBnNit5Q0RmN2lTdzJnYVNlTnptM3Vt?=
 =?utf-8?B?cTgrUWdyaHI2OHkrMzhIdkIvQit6SnBVNnBFczFUL1R2MzRWUUJUdmd2NVlW?=
 =?utf-8?B?WXJJZFdFRkdkYlNQWFgxYm9ocjJkSE1MYjQ2T1IzeUlyRTMvQUtlMzh6eTVj?=
 =?utf-8?B?UmtBOUp1UXVINWhhSEVDMStmNitSUGIvbDFnYmxCQUdlMEdOa2FQSjlMTkNM?=
 =?utf-8?B?SUQwcGdVdGs2VXpTZnBZR1hUQ0FzZng2RHFWa1ZrWldWVUJCc3hoZ2kwTXdQ?=
 =?utf-8?B?ZWlCZjFUb3hwVnVBaytUTHNwcjJsdlRKRUtuS1d2VHdkYTlKTytFMXVkemRG?=
 =?utf-8?B?ZFhOOHlzSHlvOFIvYmg2SGp0MHdZbThOU01XMTY3UTlyMzQzV0RwRlJsTDBD?=
 =?utf-8?B?YzRpZ3dRNXlXbDVoWjJBOENsUnpLeXVRT2kwaEZlenNVOUdxNlRkSnA5TGlm?=
 =?utf-8?B?VmwyRERzWXhYaE1wUUxrdHJabWpPZ0EzZ1VnNytjQTRWRWVoVXZCYnN5Mldu?=
 =?utf-8?B?ekp5S0dVdVVhZ2xDaEZJZ0JxdzRlWUNOY0duRVNKb0dCaWRGNzFEMkxVZG1D?=
 =?utf-8?B?RXNCQzlYU3BVU0Q4bXRwMEVhS1hiVjBmV2pQSjlHd3QxdVBMaDdpc3dYMEFJ?=
 =?utf-8?B?M0xTd0xEVkYxZE4yUDlybGNJU2Y2N01peXhZc2k1b1lwNVhhY2tIYm5pc0Vk?=
 =?utf-8?B?L01haCtCS0R4YTZTT1MyaExLOEtHOC9zL3BHUGx4bnRiV0s2aGdiZkwrZlJM?=
 =?utf-8?B?enA2Nm9LeVlBbXlFQjVjSnppYXg2REkxOCtLUXE5SE5TTmI1YmlLWnRYZVNy?=
 =?utf-8?B?MmtTUUxaVUJWUVhCK3FrOHNrTnZMZjFCUjdDVDFXZzk1dmZUemw5ZEREMUxU?=
 =?utf-8?B?WW54WEttOWZZK2pmSW9kbDBic3kweGc4VjREalpSNTNmbFJsbi9Mc0ZZeFJT?=
 =?utf-8?B?SW1MQWhTRkNvZ20veXZ1Y3NYNThVVGJBcjQzYWlxMEtTTnlRNEpGT0lZUnly?=
 =?utf-8?B?ZjZXLzViMW5aeUJ4SVhMOE5RUm54Z2RtbEF5OWxqZ05WMmdiclF0OExCcEIv?=
 =?utf-8?B?RWVVOSt5TXJvR2daTGlJUnNpbjZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10612dd-bb38-4e1a-ff1a-08dab8e51e4c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 13:05:42.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVhnlWPhFQETemFh+JA90vBIilelfTjcuSxVLsTduM40IFb/NtSkl5h9YP1BAjTNH5za44SRBzx8MZZSTjaAOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5326
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/10/2022 13:52, Krzysztof Kozlowski wrote:
> On 28/10/2022 08:51, Jon Hunter wrote:
>>
>> On 28/10/2022 13:46, Krzysztof Kozlowski wrote:
>>> On 28/10/2022 08:37, Jon Hunter wrote:
>>>> Add the memory clients on Tegra234 which are needed for initialising the
>>>> SMMU for the Deep Learning Accelerator (DLA).
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>    drivers/memory/tegra/tegra234.c | 160 ++++++++++++++++++++++++++++++++
>>>>    1 file changed, 160 insertions(+)
>>>>
>>>> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
>>>> index a9e8fd99730f..9bdaf8af8c97 100644
>>>> --- a/drivers/memory/tegra/tegra234.c
>>>> +++ b/drivers/memory/tegra/tegra234.c
>>>> @@ -170,6 +170,166 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
>>>>    				.security = 0x504,
>>>>    			},
>>>>    		},
>>>> +	}, {
>>>> +		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA,
>>>> +		.name = "dla0rda",
>>>> +		.sid = TEGRA234_SID_NVDLA0,
>>>
>>> This is now not applicable because you sent dependencies separate, mixed
>>> with other subsystems... Split pieces based on subsystems.
>>
>> Sorry I don't understand. This patch is dependent upon the first. I have
>> not sent anything separate.
> 
> You sent mixed between subsystems patches adding TEGRA234_SID_NVDLA0.
> That one should have been sent separate so maintainers can pick it up.

The original patch [0] I sent had no dependencies and so Thierry picked 
this up. However, when adding patch 2/2 here, I noticed a typo in the 
definition for TEGRA234_MEMORY_CLIENT_DLA0WRB so thought I would fix 
this up while I am at it.

> Now, it's not possible for me to pick this patch.

Yes now you cannot simply pick this up. We have had similar problems 
before. I am not sure if it is easiest for Thierry to pick these up.

Jon

[0] 
https://lore.kernel.org/linux-tegra/20221003125141.123759-1-jonathanh@nvidia.com/
-- 
nvpublic
