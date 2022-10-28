Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D27FA3741
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 14:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiJ1Opx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 10:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJ1Opt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 10:45:49 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228A2C96EB;
        Fri, 28 Oct 2022 07:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsuvZz2gblIo5/avcB7R9nOBR50wDMJ2fARfJbIzGzsaXCDxYo5oIs+7Mr7evk9MN7zxoJlvhyP2p9b4EiY1Lo8fpkpENDt1h3t4z4qKLDaPNIu2OiUQWIeZb65iuI0FzVGaz2p7YGFu3b72n2lkBwTxDBqtaIHCgHX6swZCATjtvkD5R1UzG/7sRy5VmldGLRvZ0uLp3p2TrpGPNgk6b2//0wAsKICcu9+juY7xEvo4J9wJubW6bK2oZuicvZ67qm80vqgAqhinpP9p3yUFxqS3WIma0pEJxgbSQDxu77cwRN3V2KHAIajPJ1F3lCSYxx95qP4C+LHkDCGfnc/3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcvtCHqHlAs/Yq1GLNiCDy/Ts3ccfTWmZmTmhNa5Wio=;
 b=cjfFQpxIddci09dAuscqAKVDHMzR4H5nhvgEIOMy4938lq2UB1pAjDEDUXzA3ExlAZLGcuFHoWCPrZr4i62tDGDZzYuPSYMLtY5xeDVIDiLiuJu45hULWvzGnn6gNYeZtmZvsA00MnOD+bJf5ygyaM3NxKtm6b/cZpY9bOBSEyKeJfIBBQkL6OLfoUx7kBAShrar+gTOk46MsnXan7KuSaMUBvpwOj3sCrjfRbXBNOGPyhgfan0A9Sr4rEuVC948wneIg9HDqyn2HU9TsSTZKZAl4dGxX16SM06FX6RkBXkDrK0SZo7IQId6DFA5wf7FjKd4BZc9klGiVt4RlEYtiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcvtCHqHlAs/Yq1GLNiCDy/Ts3ccfTWmZmTmhNa5Wio=;
 b=bxdCsPlib55JFKVca5ap4//ZCa5IIZYJXGLWA2cx5qILRO0nlYqfZx8pfjU/OwnHhmA1N5wdq4PNWfnzuu4MQHBAPRnQX81fyl9eff/xRQLqcx9+ZXj1bnhhmFGfrmQUoBFDlYCL0i2k89a78rtZcxUY2Tl8P5LUwQy8vqIqfhE6+Rdpy+B5DgqUS5DikjKdO+NWlbU7ru1MX8sXq5dITTBmnVMa3O2dyPfKEzY+7WTTIeqLzQyLDZtrkOqQBFaStl48GqEOh3StmzLRchBx9r6XReXdu8wdpag0FearNrzBiRwxtprwKsEjJTMxtVfnK+emTpeEuZSZe0bUMStDLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Fri, 28 Oct 2022 14:45:42 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 14:45:42 +0000
Message-ID: <84263080-2957-8e1e-ab09-43483d9f9401@nvidia.com>
Date:   Fri, 28 Oct 2022 15:45:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] arm64: tegra: Update console for Jetson Xavier and Orin
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221028123556.134435-1-jonathanh@nvidia.com>
 <Y1vkYyuCPoLLCXDO@orome>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y1vkYyuCPoLLCXDO@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::24) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4074:EE_
X-MS-Office365-Filtering-Correlation-Id: 25175d2f-4d3c-4604-849d-08dab8f3169a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPWwdNXCqPeOQ2B82i2vuSmDX4LUd0KV8FlxfsFmuiKFsFQU+auYw9bfjlWojyC+jhLziZIdfbbYzi3tOwI6bUpFxozdXTGQbPM3TgDqCzq7emwdVNd5Jq/jBSe27pbEPRtd3YUnYvo46RMSKuqCmfncRFo0jNh2tCccRhy6pv2R1EjrA5E8yTEes0uVR6MhdeIyc1is8DRCL7H+tnsmU3GbVSSUVEdr4K6aKpB9PMGyopTb0AEyl7nkEbHNEWY8jgVfkyW3j8xi/BaYwFFhDku04bLfJOESpPFm78yrYb/behnu4Iv9eLgmPuQ/YBuLKQQlzpgBYUeXHKXAOr70cqzc+0NjSPyIJhm6HMU4Tf4gXWd3R6V+q1VpmYL1hiqVCeu67YBHKb95mVK1pB68rp+CwFtgugo1pyPEQzUy3/O3cOIC3oxNaMINpF4sE7pjDdNZmybFVXsxV2msla+RmxXhxLNb1GiwZ0gSQTSQx86NJB6+cNXjmLSOvsAIuCPKeJqOfRTcwIfrl7Qd3xGLro2ag+0H95MJmaDTTwUr9nVz0GXVdDBqAad5Y6qdXNLoApi7MNOraTSWeJ+mfyJi8O2pDNt+CStdRM9dCNevZnYiWfWL95SGn8HoGtH01TnkMnWzMS85iAWAdXAQ16kko+gy96WRE1fBUhVCf/ZVgjeUVBDA0b8TmyErImYgm5Vf9kC9UgxAgFdXPL2woi5Wd9114r6vpYM2q3Q3OH46XBEjAtG4uV+ZJ7Enu5jrboeNrJ9SucWG9iKvyHgwekIYi5MSytjml/P6cvWphM+OT2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(83380400001)(86362001)(38100700002)(2906002)(5660300002)(31696002)(15650500001)(66946007)(4326008)(66556008)(66476007)(8676002)(41300700001)(6916009)(8936002)(6506007)(6666004)(2616005)(186003)(6512007)(316002)(54906003)(53546011)(6486002)(478600001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em5FemlISUhDRnNEUWUxQVJwMWluM1VVbkVjL25zTW8xdThDSk1JNkk4R0VV?=
 =?utf-8?B?bUtFajlEZ3QzWE9QTDJXSVVWY1dJWVREckR0eEVRc1d4d002K1NQVzUzYmor?=
 =?utf-8?B?OHc1bVM4MVBWLzc0cXVtN3RUTmRXWXc4aGxjdU5LTWhFZmdQSjZmNXZsenBo?=
 =?utf-8?B?SEZnUWJEcUMwWlBhZ0w3OTAyOXU5OHZiS1JOaUY3bnUzWVI3Zm9URHFuSFMx?=
 =?utf-8?B?OGhmLzNsZXkvZjk4aE1FQktRajJwUHFQb1RzQm1qWHgzZHMxTVhwNkRUbWU5?=
 =?utf-8?B?cFVXNUdBa2NrVlNBVEpsYytxL21XMjJzUzFBVFl3Y08xMXVFc3d2U09KQmk0?=
 =?utf-8?B?ZWhleVQwQmRHcTE4YzlnbzAzUVZ4NHFybEZvY3lTbVlsdHFtZkpFZEJDNXlz?=
 =?utf-8?B?WktLNW5CUGtwSnNyYVUwUnFwaEhWVXZwV1lSV3EwcVE5NU1YbTRJSUFmNnpx?=
 =?utf-8?B?ZVhRRUNKMUFqaWtSbEJFMzZnOW56dEtWK0ROblU4QXcyS3NLN05kQUh0REJr?=
 =?utf-8?B?TGpOUjcwSElDb1lTdE9WRVJ3N3U0dHlSaVNrczBDbjk5TTZpTG01NDcxNHNi?=
 =?utf-8?B?WTRHN1NaWVU0QzN6dEZFQ3dSZVBweDZ1K0JyRUVVZ2doZ3hEQ2NZcHBETWNQ?=
 =?utf-8?B?enJ5UlVhWEM4bERiSmtJaHlsVTJQOEJhUEU2VVBuM0llM3pSanFrZGxZV2du?=
 =?utf-8?B?bFY0eTlBaEl0aHFGd3Z2QTBtWkFLVTZUNWdxNEY3cnpTdTVoWkU4SE9Ub2VF?=
 =?utf-8?B?SXVNVHMzYUl4UjUvUWZqbEh1S0t4bGlKSFhRVFRwcEtqR0srK2dQNkpyTThi?=
 =?utf-8?B?eE03WlQvQ3JHTU5Na0hSWFI3Ry9haWtJUXJ2MVI3VU9YOUZnWVB3NUNuaGM2?=
 =?utf-8?B?d2lyYkxCZTJIclJrUEpFTzB3TmhXblMyNmc4RWdQNHJJWitMUWtYVkwrZFh5?=
 =?utf-8?B?K1hDQm1pcnFydnZWU296eWlWS3BPMGFjQ2UyY0VDV29md0p4RkR6R1ZkZGJ5?=
 =?utf-8?B?Q1JLVXRDSHlwMCsyenlBSFM0WXN0blF2U2tjdTRiUW05ZTYvc1JLZUM1WDBV?=
 =?utf-8?B?SUsvTnYwblJiUVNsdkEvVFhucG1NZStZOUpOYjZjOURPREVLV29lZnZ0Mkdn?=
 =?utf-8?B?VTdZa3hSNXNxbmc5V2s2RWZiRFVuVkFTRnF4cHI2R29KbUpVZnlxUUsyREdW?=
 =?utf-8?B?ZldYUVN5Q1AzRHlpaHY2YnliOTB2S283M0I3SWVxQkRqNXBjUHZUdDJTcUVk?=
 =?utf-8?B?bTBGcWhqY3EzZHZMNHg1OVZPdXJUeWRGSWQxcnI0WjNHUFZiempVWVY2dHpU?=
 =?utf-8?B?Z0RReE15VGM5Y2JvazZtNVoxSkZJQ2M3b2tsYXo3eXBncXZuaUkvbmpDR1BP?=
 =?utf-8?B?UkpTZ1gzY3d0cFUyU1ZFVTJjeEFEbTZKczlwTFU1NTZxdkR1NktOdHN5Q2lT?=
 =?utf-8?B?KzNUVkh3YlVKTDNwMXNRRU92ekg3emNEN0lZNXJaUU1NaFpCRk9MZWE3Q1NR?=
 =?utf-8?B?b2JhRTRCWm14K1psOFNOenlKcVBmOU5KVkJUejdOMTJ6QXNiZ0pQNVBVWm9I?=
 =?utf-8?B?Q0pnczNrcUtZUWsyaEZGS2xkejJYWnhvSzdRWHk3a2xWdHRiaE0wcXVTYTBO?=
 =?utf-8?B?SEYzUlo4Y25hTk5WeUhQK1RrUURHbnlLaGhlWXgyZklrQ1pqcnRtYXh6dWRM?=
 =?utf-8?B?ckREWHcrc1BqL3VzL2JZZEw1aVRNT3pjaHdJM0FxQ2luaWZsN2sxZGYwWTVS?=
 =?utf-8?B?NlQ1V0U4SjdIQS93SGM2dHMrQWM3M082ZVdIRHRUbmJSR3lLVnNSbzdhT3lp?=
 =?utf-8?B?M1V2UHhqUytidkE5NlI4SnRkWWtUV1hmN3l0ZWNRMmZnRGJlM29YRkhUUHdn?=
 =?utf-8?B?TXoxSnJpaWlMZ0pWSlh4QVRhUWhRRTMzNThrT0lVZWx0R1c2emo4akdLZzRH?=
 =?utf-8?B?RDZhT054SEFKTVNqMDd2cHFQa2hqSUlRMnIvWnFFTHpGczhkVUpQMnZCZURx?=
 =?utf-8?B?aktyMEFFWDVvN3BmRDVWYU9xMWYzd3NnbUs3Vng3VGs3UFZFTTJDaU9uN3p6?=
 =?utf-8?B?TjZyQ3FMcGVzWWxxSk54cUpDdnhZM0pHdnFvUUVib0lGU3Bsa1NoVXRGcUJD?=
 =?utf-8?B?eVpFMEpWYTNIR0NKNDVoQlpwZ2YvMmp6cmdXK2krMWlUeGtudHRaK2E1SXZx?=
 =?utf-8?B?czlEc3hLQW9Yc1UrVFhBWVBFeE4xWmd2NnhQdnY0ZjloS1hvTWdpOG5tNFpk?=
 =?utf-8?B?ajJzNzlJOFY3bEpNSHNQOEk5YzJBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25175d2f-4d3c-4604-849d-08dab8f3169a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 14:45:42.5103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8seen4kAx7gOmONZlvwnRCuxCgIu5W2DHzkFHzlYd5Bs67MCY0BeJiMIdI/G6VVwGOvoOFDtKUQyeq7ER5LwvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/10/2022 15:17, Thierry Reding wrote:
> On Fri, Oct 28, 2022 at 01:35:56PM +0100, Jon Hunter wrote:
>> The Tegra Combined UART (TCU) is the default serial interface for Jetson
>> Xavier and Orin platforms and so update the bootargs for these platforms
>> to use the TCU.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi                | 2 +-
>>   arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi                | 2 +-
>>   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> I'm a little confused now. You're certainly right that the TCU is the
> serial interface, but then why haven't we seen any fallout from this?
> That is, why does console=ttyS0,115200n8 still work just fine?

For Jetson Xavier platforms, ttyS0 is the UART on the 40-pin header and 
yes could be used, but probably not obvious. I thought about keeping 
both and we could if we wanted. I certainly have not used ttyS0 on Orin.

> Looking a little more into stdout-path (which we already point to the
> TCU), that ends up adding TCU as the preferred console already. So I
> wonder if we really need to set the console here at all.
 >
> Do you see any difference in behavior after this patch? Does it fix
> anything? Could you perhaps try to remove this option altogether and see
> if that makes a difference?

I wondered about that, but I was not seeing any console until the rootfs 
was mounted. However, looking at of_console_check() it appears that the 
cmdline takes precedence over stdout-path. OK, let me try removing the 
bootargs all together.


Jon
-- 
nvpublic
