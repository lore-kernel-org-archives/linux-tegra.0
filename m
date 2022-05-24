Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E52C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 24 May 2022 14:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238381AbiEXOu2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 May 2022 10:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234827AbiEXOu0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 May 2022 10:50:26 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5FB9C2F4
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 07:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAIcr20QmUHoDiMFAcqY9uJMS+Wwy+TeK9r7GqNzZ5oOglKlawqgjpj2b9XF3x4Z4QnZCp6qe0+F0ZNbO+hbgIhYVGiof/GlEzYWiYVMf49nZsn9vqbFlRroQ5YW3L51Lr7Mtorf471u51wiyTROfkRdOSR2pYXcc6haHnqtMpLZxNKcfs4t0yx3p8J/jM9RdIuX+BEL3qLoIwGPh3zBRpKewhNbGbSzg3gWtsAHbBOoOBMyR6siyMsw7pB9y5685lEOl6DkBhT0WNCgJD4ZxTFHTP0JnssXRPy/phj/uREQ88JrwRby5Igx2fCINKR2OUzqgWGOc+ggO77Gu6vJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHxJm7Y4YzmTKX/TQREV/gYGWDKMLrRZphF9K7bk9/o=;
 b=aQ+55Udk1wT3DgReZVDz4aM/crAK8dVxGPg4cQLQnDobnQY8HnZFxCoMQMGnZjQ111lCGkrI6QYmjStFiaxnpl0FYmlkbgz/xszCmTKojRyvWq2s2i8ClUKPf4Y+2QYbnSkR3mlUwinkVzdbKCslwUo95z8g/g4zJSDMwoGqWek4VnB1wdLDTAp6xUY5MsXe3P2jTJRPbUM+YMqFW670DpxLLYjMOnhDc2TqF1CBVXzcI/U+EZ38yrIdOmj1WSKgH5kFlxWhObin00+fTRIw4+EV3Su8wW+/T7JyL/kOwY2U+HM1Ola3wYEu5GfTZOkbxa8JK95xJ5tSQAbSthVwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHxJm7Y4YzmTKX/TQREV/gYGWDKMLrRZphF9K7bk9/o=;
 b=X6rNHhoctRYo7HrT5leQPycnBHL/v7oAQEtZuZ3wiiaYjlqtLVC8mrZZa5QLXnOa9ECTPiLW2eFmFBE1MctGd4ziXO85IkoLYFunnxZ6UP4jBtNRZHlonmAI0AlJDFwwk/bjxyawR9xF+HU0iLwzrJZgJLaA5wjbFFoA7VxzVaw7DZNAFjsyjnfyo8W05h/ffxwlO5V14T/k4IfHBLD9AOMPa/4mxXYRMw3nVjSQhH2nitYsg3FN27D/uZ0Ir9gCTqy3SmOvVo5Ak6g9NB3APiS0DkRd8nt+ozxM1UlPBW/DfDfaEh9DwUP63keeZEN2+qXHRq0OldP1f8KDZWsXyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN6PR1201MB0068.namprd12.prod.outlook.com (2603:10b6:405:53::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 14:50:24 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f%4]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 14:50:23 +0000
Message-ID: <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
Date:   Tue, 24 May 2022 15:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk
Cc:     arnd@arndb.de, linus.walleij@linaro.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220328134714.205342-1-ardb@kernel.org>
 <20220328134714.205342-2-ardb@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220328134714.205342-2-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58d0887f-0dcc-40d2-6ed6-08da3d94bb3a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0068:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0068760089E89FC8835C2E95D9D79@BN6PR1201MB0068.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfvpYNh1t/cH/eVdOLNtirQydRAwSAsebW7pWAXF2KCrZUa39gWwGl3fwkM4LEu5aAn0Vu3UEo5uvPfB4YvYBMC42J4XfpMyhLy5WaMGycuRrCnaR+E3ytIaSdmnTiVqIoA6V1NNwGfrIIUVlKuZu2Q5YXTX7cEDtTirMMz3NTtwTJHpQzOLhnK7oUizAQzNSN1brGZ3leBEzgAjQCKzYxL5sGOeTupgo86nLS3Q5EPEI/2h57r/w2fdGN4xUvnPPgtjZHeR11gqogTij5UiAkqrqVNYoHY/KwYbUVrSiOeybBFF7xay2WK3RDEBN44d6PtRXseur4zopljZ0F4KiHVQ0wQWOiCGWXIx2C6GKUUyBc/niTF8o8RKo78c+vepFJ8Bor5kmz1ky01oExaEeakGPNPUkNSkXCgsltD0Wj0yIFCVqxIzpTNiqs5UfnQzYkuI9b1sKjoS+MT1pBIz2E1nKu2jxLsyvIXV33Cgids2qVO6Bs7eMcYRP+HJsjS1Fqv0uyfkoXkTT/9BIg6U254LB493ujtWzXs2Or84o/JyBGmQdhKW8UmMnESuFvaoxTbBWcUzt9Oc9hAe5fheXQWcu8tMg+PdZAtKvA6E2FBERtuXdiYtD8sG84TJZsVBd6oIELXII3qEHtHADQII5H3ZtLbYpYUaGYE+embyR2QkhIGKun4VPqNnPYMUfVpHDOmQFF76llKH1rYWDBvmtv64ZB/VC7JZxzLo+vsLQ+0bUYiGfc/DJSOC16a3hBww7Hj1OAZmQL+b0D40Y0Ty+ejMB5Z2jaQ+nYlYISljU18Ti0pi6kEHbfM8DfK1QAJU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(2616005)(36756003)(31686004)(66946007)(86362001)(66476007)(31696002)(4326008)(6666004)(8676002)(316002)(53546011)(83380400001)(55236004)(66556008)(6512007)(26005)(6506007)(508600001)(6486002)(38100700002)(966005)(2906002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWV1TFA0T25FSGtWOTJ6OUsxNmp3aEhScVh0ZmNUL1hzSnp4WlBNWUJ6dzJu?=
 =?utf-8?B?M3Q3ajlVVkxtTXZsd1NDQlpaMXdqcHNVUmMxUUZVbUNkZS9JMkNYdjVFdmI0?=
 =?utf-8?B?dTlPVmY4Ykw1Zml5QnFWNVVZeW01TzRVRThPeDFlUXkxaFBNeFlFUFh4OG5r?=
 =?utf-8?B?VFRXek82NFpnSUNybXNPNHE4OHg2VzNSNUdqckFNOHVQMzBrYk1XUG9QaGoy?=
 =?utf-8?B?a3EzL1Y4T1pCMEpXK2VDTU5MMk9iQlMwTWRTcEMyN2VzWkc1aEZ2Vmo1RE1H?=
 =?utf-8?B?OW1GS3ZZSmIwbVFDcEhPcWdRZlFVRXN0cXAweFVJUUp5blNmdTBoUHdWZlIr?=
 =?utf-8?B?RUhoMUdpM25qWU4ycmpqZ21XZjNpT0haVHNQdmFPT29QUksrdmtkcDlVRjla?=
 =?utf-8?B?Rll3ejl2TWVRK3Nia2lTbndLbEtkZ0hhaE5VMmg3aDZ1OEp2OFVOaHVJaEln?=
 =?utf-8?B?ZUJ3K2lKL1c4NW1kQ0FQMDVjU05neEg4eWZOMTRiVVAvOGV3amtkQ1BPNFdG?=
 =?utf-8?B?cXNDRUtIR2ZwKzJac3Y2cnU4aGttQVI5aWM1YzkvZCswL2k5cy91UmFOTzM0?=
 =?utf-8?B?Wk43UTZlc3hDSW5ROGxUdGxYS253OStiRklTelJRL01iRCtSQkFaSzd2ejdU?=
 =?utf-8?B?a1VKRkhtQVZKVUhJZWtPSHZEZmpGNFFOY2lpN0tPdEVnL1ZRejlTN2I0R21Y?=
 =?utf-8?B?aW1vcmlVcU9VbFREYlVyUTkrcXBoSlMxbkpSeEY0UWI4ZnBVRnhiZmhhU3pP?=
 =?utf-8?B?L3AyeTgzQUFEYkVqMEJ6TVZwSnBUTW5qOHVrZEdUeW52QUNhU0RDZFdrM3ZG?=
 =?utf-8?B?SmJwdVNFS2JSYU1FVVVXaFpyc3ErQXBNdk1uVjdtZzJOaGd2ejhQdCtJSnVT?=
 =?utf-8?B?MGFTOVp1QUlrWDVqc0UvOXJOcW5vYmJwUG45UkRLaGtrWWY4UWdweTl0SjB4?=
 =?utf-8?B?R2lzZUZLKzhQemVPdDE4aysvS1VnZ3kvL2NBNkNaamFvY2hnTjZScVlGNFpP?=
 =?utf-8?B?UkJSaGtCb0U5Nm1RQlBpdXdrbEZabkViSWR4T0Q3OWhkRTNWTExURVI5d213?=
 =?utf-8?B?TWU3aWtMMkMzd2N1dC9qRHlVNGJ4aVkzeDZqQy9Fc0JueUYzYTZUdDNVZEx6?=
 =?utf-8?B?ZDZkdytWNlNubkpTSlZOQk1abVRGMEZvdFh4UVBNakRvbUI5SXFKcEVIYUl2?=
 =?utf-8?B?QkhLS3NFZmFkNS8reldmWldJa3dVdk02cC9iVUFGNjhOOUZLdEJMNlNXc3dp?=
 =?utf-8?B?cU51UjlYcGhPN214M042alNyVWpFMmRZa3A0eGNzNDRHVS8vRFJINVhVNzhp?=
 =?utf-8?B?eDd2U2hXWkY3TXhLNXpiU3ZIamcrTUdwQjAzRUxjeWIzbXdrdHYzWTBIeHhS?=
 =?utf-8?B?d2Z6Qnd1K3hzVytvTTM4bmh0SzBnOWEwak80QzcrZVc2RGxhSU5OYk92ZlhS?=
 =?utf-8?B?RjkzL0NuK1NPdndFUlZxY1JFVnVUT014MjZaN3liTUZBK25ySXBkTW4xZTRu?=
 =?utf-8?B?TXdMZnpTbDhkc2o0Nnlid0JuN09vc0JJRXFFNlFlVFh2elh5UjVUOFMra2Fa?=
 =?utf-8?B?dHpXSGhPKytSNzdwVFpSalYrZmNzRk1WeGh6NmlxYUFiVGJudldveElsQVFT?=
 =?utf-8?B?VWgxbUY3ZlBuelJZdkxoQWxnZHV2SkJIY3Jkc1J1UUx4NDQ2aTlEdEVZR2R0?=
 =?utf-8?B?N2tIcTR1cjMzRHlrZmUzZmhVTlN4ZncxS0F2cVNYSkNnMktzZ1dUVkRvY1Bx?=
 =?utf-8?B?T2R5V1NLeGhWWDRRaUQ1M1dEMXpNZDNjYVgwalJEUkxWRkFkS2ZKT1dZMFhT?=
 =?utf-8?B?MTBsN1RzREgra0hobmlDN1c3QmNMUzVGS0lNeVROZEU3Y2hDeGlUeENsM2tJ?=
 =?utf-8?B?d3A2SVdBM29GeXlnR09aRFVZTFhueW41RGg1UHlHRytaRGthV0FqTU5ZWThx?=
 =?utf-8?B?YWZRWG12eEdBVExGRHJnc09nZVNwdDZ6SS9iYkVTZmRMSFMvd0Q2VXhoQU0z?=
 =?utf-8?B?WGdGa0l1NlBxblFwNHcyOWtGQzMva1BmcS9XaFBBMnc0aWw4OWZSRG9oY2Zz?=
 =?utf-8?B?bEVXT29hdHJLcW5DTUdRaFo1R3dHQi9iUloxMzc2VzBUdGFLREV4S2QwemVs?=
 =?utf-8?B?T3VJZXZ4L0pBZHMrT2VXL0ZYZE9IQlN5NGMrS1UzWlpBTW9XQjVtaVFoZTVl?=
 =?utf-8?B?dlBaUDhqa3RYNWlHSi9aOVlaS3I4U284VGh6ZXBsL3ZUajJNVG51YnZxcnJS?=
 =?utf-8?B?Szd3NDVhbHRGR096NU0vR1dUemFTSjlSR0EyNHF6ckRlN1EwcFVZWTFONzRZ?=
 =?utf-8?B?ZnVCTFA5TXRRVGdpSjdUQWRrbVZrNkdxZDBRRmdRVDFxelp3ZHF1QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d0887f-0dcc-40d2-6ed6-08da3d94bb3a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 14:50:23.6500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjG7jo+tAlhlHvU2RBXfjFgzLlORoE3Bq3wNSirFpWq2fl7eeEmSQseoxut8xJVjZEJzCAFkqHU0Y64ktbWbnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0068
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Ard,

On 28/03/2022 14:47, Ard Biesheuvel wrote:
> The Spectre-BHB mitigations were inadvertently left disabled for
> Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
> that case. So fix that.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>   arch/arm/mm/proc-v7-bugs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
> index 06dbfb968182..fb9f3eb6bf48 100644
> --- a/arch/arm/mm/proc-v7-bugs.c
> +++ b/arch/arm/mm/proc-v7-bugs.c
> @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
>   {
>   	if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
>   		cpu_v7_spectre_v2_init();
> +	cpu_v7_spectre_bhb_init();
>   }
>   
>   void cpu_v7_bugs_init(void)


Since this patch has been merged, I am seeing a ton of messages when 
booting Linux on tegra124-jetson-tk1 ...

[ 1233.327547] CPU0: Spectre BHB: using loop workaround
[ 1233.327795] CPU1: Spectre BHB: using loop workaround
[ 1233.328270] CPU1: Spectre BHB: using loop workaround
[ 1233.328700] CPU1: Spectre BHB: using loop workaround
[ 1233.355477] CPU2: Spectre BHB: using loop workaround
** 7 printk messages dropped **
[ 1233.366271] CPU0: Spectre BHB: using loop workaround
[ 1233.366580] CPU0: Spectre BHB: using loop workaround
[ 1233.366815] CPU1: Spectre BHB: using loop workaround
[ 1233.405475] CPU1: Spectre BHB: using loop workaround
[ 1233.405874] CPU0: Spectre BHB: using loop workaround
[ 1233.406041] CPU1: Spectre BHB: using loop workaround
** 1 printk messages dropped **

This is significantly increasing the boot time and causing failures if 
the boot takes too long.

I see that Dmitry has posted a fix for one of these cases [0], but the 
above also needs to be fixed.

Thanks
Jon


[0] 
https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/
-- 
nvpublic
