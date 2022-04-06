Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C79C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 16:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237799AbiDFQvq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 12:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238107AbiDFQvg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 12:51:36 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F6126A084
        for <linux-tegra@vger.kernel.org>; Wed,  6 Apr 2022 07:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9cKdtnm6WCQzoy1OhkIZ9AgsrxxMQHXLpHyg4mTPX8F44q7Rg+lQ9gWaSs85YhJ9kOdAcSILytD+411ZS8riPyClX9DZyzjlUKieTYxnffEqAzBF5D54KOgkgH711O2zhjCeTAI+C6ZkLqk5Og7y9A47duf+ohnbGtEusaJPRLAcikcEpfDqOaK/cCldmRuTu7I//lWy61s6kFy4kddo3Z/NkUz0tfB15R13LuJsX5ollUejpV4v2QcjhaPGjnfPVKQDzRSYcWMfB2Yaef0vtJyMeX4ogtH6c8yy2EmUEGHnBVPkcxm/vXSXYiN4fpWfqN5YChV4Oj57tZr3F5VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78Ebo6oiHtxXd6FVEJZRKmQaYzAYYuVZjxXuqniceXM=;
 b=dMb0sP1U1b4I0bFkp7AzHp0mv4lXuBamsKg1uh/zk3UF8dlNSXCY+wUFejobohfhLcM8td+tnkUhnUTWfXYTktrZxnicFZIEajoqu2YJcdn8cFTqh5zDL5CZYApEdiZ86oTCLY6JEV/Y0O6ZKA47lXjxw2RlZggrACG47542MydH651PthNAcPk7H48t4yIlLGnGUP7WqFGVcdG3Jt8ePvl/fJ4v7kgLak/w+axM911nbrMS2Rzb11QIvAMKL+UriUhZrUeIJCR3R+0v6vIT2aIaTqyBFEIW5ESMiBnMFJXzRQyyu62ZRkvVVojehwn15KGe0BBCHRze5dkKEF2n/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78Ebo6oiHtxXd6FVEJZRKmQaYzAYYuVZjxXuqniceXM=;
 b=WNugPJ2WvAxKoW/oZ22lCSV5UdBSi8HRUtCykoNkcev10XsvSyagTnrIoz9n/1xBMn1VnChH00cret3seClc/YvX957obQG1DP98ltNM+UAxe5Uabk4v+dUw5qOunsAAmpZzvIAbrdceeBPmFyhJY4thxzrHT9fTkkGx0cTcstS2d56V3nj01cG3mZXbI8rEFr+j9/rvXaUhYxDWQ2tJBqj7BvODdN9K1yftSOmx7yLxDdRIUjBr31JDIrM1Kc2rBiEgHhSVxTYu59LkiM7aNwQJgVR19Wqyd0/o56DSj20i7KqdcEKRXB3THLYv3kAinPDsO5G0+hlVAvrdDAtohA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM5PR1201MB0268.namprd12.prod.outlook.com (2603:10b6:4:54::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Wed, 6 Apr 2022 14:58:32 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::10ef:dc56:bb21:76f6]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::10ef:dc56:bb21:76f6%4]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:58:32 +0000
Message-ID: <586d894c-425f-d924-a178-d1ff2c724a40@nvidia.com>
Date:   Wed, 6 Apr 2022 15:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: tegra_defconfig: Fix enabling of the Tegra VDE
 driver
Content-Language: en-US
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
References: <20220406135920.129589-1-jonathanh@nvidia.com>
 <89c70eab-da76-36f7-0576-0122a7861c9c@collabora.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <89c70eab-da76-36f7-0576-0122a7861c9c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50173c42-c43e-4eed-6b86-08da17ddea94
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0268:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02688FBB644F3AF6D1D8DCF3D9E79@DM5PR1201MB0268.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SadjWNXb3xD5Qxc9a9Wo+XmwFpHWegahU7JSFpyV5zt5tG1V4oGn3jYmu038iv9rrXaVXYRw6DWR2KxWNn32pJ6iirVvIdqUQJn1IaEiFpBCsdw1efCzy5/yrca8QccwkvNO60sBiVw6RxlmbBlj+iDH+hzuGqqv5wwJyYGetTvoPNPMbHDXml76+7joYE0rtDiYowZ3iDQbi/Uc+90O1AICJsWJ6JscY2kPQWj2w5FB/krDBPdFxaaGsunyo8fAPiRWdW9+Wfjh1+6WfFGISWumNnh6HFnL0tK+Pa5ovbPqQ+l/rJ7F2kCaVMoRCG3BwDBWprP777gtSDdHpzk4pRuWA9Vor6QCgQsNefy12rrONwq+Qj/+saQuaUY5XvXfwgXScJr1OOoTlFQAnu+sNEFgExR45txwzPA/ivU2RBBj+HkPUKq7Fk8siRMQwJQ0pyTl8hHmUYeSLjWXQWk0d7wWyUYV2FqPHfJoSN6OzZlIE1rKJP1LPWAf8yTwXxZ/hHozxb71KlqoTyncs2O4WfvsJ5PNz4a/y4mtMXzZ+5E3Ai9KfNeEUaikqtPiBQrcqgDd2JtIzGcZqUmLp5kvAIW7SCt4rfCsnQC8/Y4zQ9XyRuERZq9yRpMNFukc97fAAQ9Hc3ZaWZOal+oCyNrgDQ6sL8PUFa+qI5o5HXnMQEHeCi7HGgiNjUQXwzB3Y+YhHUnEB0b60EhV3ZJhPt/fyoJTQs4E9WdBBIn2BHvPU/SgwPaTBHhpOOezXujnbdUSX1qR08MkqkaQifZ93ztT5tK+jsRIP881UvCm+SEvOIZlafvMONQvjs+12g2MQAGntEKOjbTWrxLUSs31AATp9azksL8jywOCg4U8+NNO2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(31686004)(86362001)(316002)(6512007)(186003)(45080400002)(36756003)(26005)(966005)(31696002)(83380400001)(110136005)(6486002)(5660300002)(2616005)(8676002)(53546011)(4326008)(508600001)(66476007)(2906002)(66946007)(38100700002)(6506007)(66556008)(6666004)(55236004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TStEYkFuWjBHbEYzSm9waGczbXN6Z2FIL1l0N2IxSUhqUzRweEpwZU1qenph?=
 =?utf-8?B?MHd6U0hFR0FkbFFXU1JLaGVMdDB5MHZ3Q2pveURaalJUTzRHcEpwVGY1bG9v?=
 =?utf-8?B?U0dBWGhhQnRJWlp6YkVBR1R3VWo5eGJ4cFd4Wnc0QnBSOXVQSTM3bWJ4bDdE?=
 =?utf-8?B?bkpJQjk3LzRKV1N4ZmdqK2ZVYm43cUtjMkZnOVpZNGhTbXJnbWt0c1BuY3pY?=
 =?utf-8?B?ZWp3V004NUFQSTRtaFBBUm4vVHk3cGQ1MUx5ak4zVHVaK2ZxNkdBazdJSEw3?=
 =?utf-8?B?bFN2UXE4aVdtNFBLTW1hbmVaMlNOQndlSWZTd1Q2M3pRSng3ZEpiRTFKNWhQ?=
 =?utf-8?B?K3crLzk1eEhCYWxwWUxGOWFsbUV0K0JyL3RsbzJPRXdQaVV1WEJnclU0cmJX?=
 =?utf-8?B?dzZvTWJFNjBSYUczMUpoRTlSNDZGams5T2dvaVJRNm5ZU1I0RzhHYzBDT1NL?=
 =?utf-8?B?c1hlN3Q2b1A1NklGZ0VoZmlycitpRnpFR3lPTlNqYjJSSVJXNlE2aXFGZWgx?=
 =?utf-8?B?bklhY2lKNk1wY3BscWkvdlpwQ3M4WGhDeUJiWnJndWU5R0luNDltSW9UN2Js?=
 =?utf-8?B?eXdKa1J2bXdFWTViVzlLTVFHakpleDF4RVQ5ZEEzaEs4eUQ0R0lSVGlMdnVY?=
 =?utf-8?B?MlcwUkE4NlF1YXovbnFuYTBrV0prR1J6TWF6MVg1MW5ITERITjg3d1RtWFFI?=
 =?utf-8?B?VXQwY0psbHdGQ2l5K2FGbCtpaHQzSDBYNU1rbG9jMk54Y3FlL2wvTnRmS3U0?=
 =?utf-8?B?RWRJWkdCYWpzdHNuRXhPVG91VE1oY3NUNXRuN2o5dTk1WWpybWE3YURReXdw?=
 =?utf-8?B?K1NsQlJoZFp3ajJQVkQrOVZ6RDZDYjFZSnpVNWg2UTgrRktNbnZsdWdhMndE?=
 =?utf-8?B?Rm9Ub1FtV2lDejkyQ1E0WE5jQnZhNk56cUovNmgrdkd5b0h3YUh0Y3pXWUc1?=
 =?utf-8?B?OW5MTVlSekxhSVJPdm1mV2Y1MVA0bkwyUzNiakQzdGJNMTVLb2pjNnhvT2RK?=
 =?utf-8?B?MTFZTU9GV0VUMlBLV0NXcXBJWnhISHJucFlEb1U5TXVoQXNWR2lFbGZKc1Fx?=
 =?utf-8?B?OFFqT2UvUlZiVzNzREJmT2dGaFNQSElCWWRGSHZXYnRnWVJvd1JMbWFNQ2pp?=
 =?utf-8?B?OUh0S2RCUzRITHF3dFdUVzAxTTUrTjRCWmYyN3NpZ1B2alpHb0pXaDVEa091?=
 =?utf-8?B?b0s3cXhCYzA4SDkxZDZnTGl5bDdrdUcyU3U0cEREeG1vRFRTdGhjT05ib1RC?=
 =?utf-8?B?ck9HS1lENE9OSnFCbDlpSmxjRE9Oc250Y0xPRzRNYUQzcFhjQS9JbkQ5Wk45?=
 =?utf-8?B?WWJZbnhqbFd2VWlnb2MvMnNHSzcwNlkvKy9BUGZobXpycUNrWGNaMWo3RDF3?=
 =?utf-8?B?cmNsenFSbUQrS2p3S2FZR2wxRGVqdVZMemV4RUIzNlVJdUpYMzFnWDFkQWRy?=
 =?utf-8?B?MXFlNkZKUlBGVDZoVnc5cU1VbXJEK2Y3TlRrbU04UXg4WEZYazl6ZnRmdHZN?=
 =?utf-8?B?VnJ0Y3VTcEg0MFRDNGZncHJTSVZ4TjZSeHk0U2lPRjFJUzBwMjZJTGlCS1J6?=
 =?utf-8?B?aTVKcmhhcXJ6SjIxS2dMSWkxdE90ZHNpS01FUmg5U3B5RWtKdVR2NFZwSmJm?=
 =?utf-8?B?V3NuODE0aHgzMlZrY2tGTTRZSjExcUlUa2t0L3cxMkpVc3J0MTFiUnpIL0FN?=
 =?utf-8?B?M2Z3L24wdGFCTDFqSG85by9pMGVML0Y2WkFKUEhSWXl6a3BnMm1KMzRjMENk?=
 =?utf-8?B?YWdCbXpMRC8vTnBONXFuRXNiUlhQa0hQbGIxQnFqQ0N2d0tOWXpqT1ZUaTla?=
 =?utf-8?B?Mis0dmloUXplQ2NqMHgrTE5WZExCbU1GRiswWkZMSllBQmNGRlo3V3lObk11?=
 =?utf-8?B?QjB4RmFkT0Q2c2lBYjAxaVNBc1dwV0l5VjVvQy96WU9DcFQzZ1RzUmZsc3ZH?=
 =?utf-8?B?WFRpRlhpcFVDU01Rbk9oMFpGWitxL0FCT2hVQTh2VklaajQ3RnUzaCtwZXFw?=
 =?utf-8?B?b2R6MXV6QXFYdkUzOW90SkZ4L0dKNFd5bnZpWFFPQzR6L1NWN0h0YlQ0VExl?=
 =?utf-8?B?a0p4K0pEcXIzS2NSaUpPbisrRUJ1YXBqL29hR3RvSXpQZ3BhQjc3Z2FNRzNZ?=
 =?utf-8?B?cGNYMEkxM29pRytyS0JvMzYxOGZmdUtsYUJmU3pjdHY1SFdBYythUjl2WjhT?=
 =?utf-8?B?aTdqYi9YZU9SVFNUUzBUVWRCNkphancxNHZJMTJSd0VyT1d5QmV0SEozTUh5?=
 =?utf-8?B?VWpPVmFPUGJOZVM2b2xXTkVlZjNQL3ZtWllIbkhHK2ZvQXV0V1NwRWhtTUsr?=
 =?utf-8?B?emtmdE5CMGpkY3R0SlhKd2haRm5wT20vRjR2dVhRcnNqNVQvWWZFaUFSZEFw?=
 =?utf-8?Q?Uv0ZTzZNxCug+mTM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50173c42-c43e-4eed-6b86-08da17ddea94
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:58:32.0376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTry3pbX6cbtTipbUc5dZLRqV5ZDtHk4jSUJkXsqtVEiuT1foG+Urav7D29ReCCUF5JSrU+4HGkraTfohUbxmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0268
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 06/04/2022 15:37, Dmitry Osipenko wrote:
> On 4/6/22 16:59, Jon Hunter wrote:
>> Commit 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver") moved
>> the Tegra VDE driver out of staging and updated the Kconfig symbol for
>> enabling the driver from CONFIG_TEGRA_VDE to CONFIG_VIDEO_TEGRA_VDE.
>> However, the tegra_defconfig was not updated and so the driver is no
>> longer enabled by default. Furthermore, now that the Tegra VDE driver
>> has been moved under the Kconfig symbol CONFIG_V4L_MEM2MEM_DRIVERS, it
>> is now also necessary to enable CONFIG_V4L_MEM2MEM_DRIVERS in order to
>> enable CONFIG_VIDEO_TEGRA_VDE. Fix this by ensuring that
>> CONFIG_V4L_MEM2MEM_DRIVERS and CONFIG_VIDEO_TEGRA_VDE are both enabled
>> in the tegra_defconfig.
>>
>> Fixes: 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   arch/arm/configs/tegra_defconfig | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
>> index 289d022acc4b..c209722399d7 100644
>> --- a/arch/arm/configs/tegra_defconfig
>> +++ b/arch/arm/configs/tegra_defconfig
>> @@ -286,7 +286,8 @@ CONFIG_SERIO_NVEC_PS2=y
>>   CONFIG_NVEC_POWER=y
>>   CONFIG_NVEC_PAZ00=y
>>   CONFIG_STAGING_MEDIA=y
>> -CONFIG_TEGRA_VDE=y
>> +CONFIG_V4L_MEM2MEM_DRIVERS=y
>> +CONFIG_VIDEO_TEGRA_VDE=y
>>   CONFIG_CHROME_PLATFORMS=y
>>   CONFIG_CROS_EC=y
>>   CONFIG_CROS_EC_I2C=m
> 
> There are per-existing patches updating the defconfigs, unfortunately
> they were not applied together with the driver patches.
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinux-tegra%2Fpatch%2F20220220204623.30107-8-digetx%40gmail.com%2F&amp;data=04%7C01%7Cjonathanh%40nvidia.com%7C98f0277ce8b74700664508da17daf665%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637848526453449366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=BsHhvVKHeDSg%2BAyGIswF0CMay0vcgucnaDD8D%2FUwLRU%3D&amp;reserved=0
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinux-tegra%2Fpatch%2F20220220204623.30107-9-digetx%40gmail.com%2F&amp;data=04%7C01%7Cjonathanh%40nvidia.com%7C98f0277ce8b74700664508da17daf665%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637848526453449366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=mjA88k40mPaX6V2TCDKd4S8AQTUBC6rwq9VKwyIntPw%3D&amp;reserved=0

Thanks.

Thierry, can we get these applied for v5.18-rc? This is triggering some 
test failures.

Jon

-- 
nvpublic
