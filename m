Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD08C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Jun 2022 14:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbiFGOag (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Jun 2022 10:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241271AbiFGOae (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jun 2022 10:30:34 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C47D106
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 07:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy2jqkS/LSl53GDgfcjGaqAJzPVfWQIQs3AoSbLLgJmNQzpKJGdrO0NSC7dWj2j46c1s7yNuedATo7ObZtH3rIad2pX40nsP3QjKDkCX9qPiFtHz+JyiVTkyv2T7ZdTbOzPExGMUPUmdU7/iOnHBXnJDgPFNJwO6qUjLgc9RYzLtLnVnG9rtR3Z8vqGwfrQIcdyNjbXm4ObrVwUbz/c0WGro4orNtmMH6kMsf8hqEtSh5BJZS8sgkGWm9oFSotmLSKBulnJ9aEiv9D/UqzTBjl/qY/UFPsNb3clsEnlFWbYQw/toFuHTV4EUf3PRFhEf107BCJhmEigevdQkrKMYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMYtwvxeciMVsW5reBUb6POPDAF4Ze29yNRWPR0/yEE=;
 b=C1KPBSNYUwbx/lLjVOYWfdDKem2wBjDkLeIQ5MHhiPeyyQOsbBzfm3nutwu7/7D2p63s5zmNJt0M1Ymx6wfWhuwJQY3wMgTsD1sEkQyE+JdXgkb2WQiDAXss0NNRXAgbqkuxKF6So1PifW18OgU61iBfoloELBafNYtfG/nR26yYinidRa8lVW3eqR8NwzWWosQpXABEkYBgYfGg1B8nTT4+mmiOL8JMSWzDilMMD+mSSh8lek/JyOWgy1d6RdP3UFLUNQAoe1F47xN2d4T9FVKtWpyIF/6B5ALR6KbB0LZDnDrq+rKhk8xkfA/m+5Gg6bE0uNkF6hzzMjb5dmpyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMYtwvxeciMVsW5reBUb6POPDAF4Ze29yNRWPR0/yEE=;
 b=Xh9Aui86DrYmqLPYNciGueetL3NGzije46Zv+nNg1GFHAUhsTaC9flH13nLWLUj4IJb735yHrjl1l5Td4XOcNBYfrbg4LKKhrqkILhtt0IQ5qhDlPZyR2G4qW8qK5xgiFGzHFO5KkPw+eMdr0tp3STD6kWA9Gsg+4uKtE7jnRZxIAuO54VmWsf4qFJRwV5qCSRAd16ozycMYsWUV3Iq6yVk6SUSJ9RzNJ8I8vmWkh0Os6myHK7lP323H2Q3voIfoglMqqGbbB7g/NLGdjyrjOWOXj4qfvPX5Kv4GBakbTMoSRJ4EqUWX4wLVW869S6mcVHCEouW5bgv+x78+oQ5icg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN8PR12MB3090.namprd12.prod.outlook.com (2603:10b6:408:67::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Tue, 7 Jun 2022 14:30:25 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f%4]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 14:30:25 +0000
Message-ID: <061d892d-7a16-774a-4b50-b09055040ae2@nvidia.com>
Date:   Tue, 7 Jun 2022 15:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        linus.walleij@linaro.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220328134714.205342-1-ardb@kernel.org>
 <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
 <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0341.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f59f7fb3-5dfb-4f9d-d12d-08da489242ee
X-MS-TrafficTypeDiagnostic: BN8PR12MB3090:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB30909DED58B2A7D388D1BAAAD9A59@BN8PR12MB3090.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8lLJvSV54q+oHsr8+mc08DVFWg5ev/k5FQzlGvxvs8RGBAm+mRS5N9pzT6AtQ5mfsF4UGVMN6YRUtXH/OhUZuRB+Za8EiQd32ABLRoEwtOf/vruTMR/0e82LUgFD8hkEkAw/8oPiL1afyfzNAeyJ5PqEhs8+GwndkE++UT9i5uVqrv9bvT4BcEd9L5n1cSq8LbAEyFGfWeU8n6cOExk1NBQkEGwXIm2R0fzDVQ8j+7KeUc7nutiPsfWvqAcO7y76NYjR3EX5Aa0Iy72LE5AJZ94t1EEh8mDihneConYisbmoeBUPxw0EZYL7mspw82Dyu1qlTcNJjLcoSQYeziSlRppNgrm2ADXoXW0vW4Q98EjNhv78MhN4CPLqEXyQP2iA+uBIq6p+7IDhHfqEOxDMYVG33VKIpZL7e9YKNQdkIe+W8Cag3NOQiDmYKpwOYrDyO6QbxrJjzOkFQJMFJap/txGEe4oMdPPm4Sv72m7gPctMsnDMteYWXbIL+9JNhDH5nlpaxIy4iWG3sm8rhRZygFnJ9Sfu7AecQ5friMWQP6A3LSjgbLP/hcw2GPJpd/mQky1QnpZmDb6o1g5DnVsB1SMyc2h2a/0jzqAyAFemo+DldGhhcfOjilOLqwOhAPtu08UfOKE4NNL47kt6aeo7IafsxgUTdnp0DA7PhbUSRIcpUG4ms8y4Zx3hwqANIWl6tdcwSi+ScGbYDHTGsXbPQzya4D63C+71PGlSLNUm4r4RRbr3tPZ0yFG7nBs9IBpzHtsgP0oJDXomXsn6i7JgAAzzuXb1adRYzP99KPsRWzkALS6eC8wzOh1sllotI3qU0QPlx7llLAihib6HhgrhFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(54906003)(316002)(8936002)(66556008)(8676002)(4326008)(2906002)(31696002)(66476007)(86362001)(6916009)(55236004)(6486002)(53546011)(36756003)(66946007)(6506007)(83380400001)(6512007)(26005)(31686004)(2616005)(5660300002)(186003)(38100700002)(508600001)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdsYVNwZG1OdVVSZFQvVkdFaGRQa3FQUldmTVpHR29aM3RYNHRJV2NYelRU?=
 =?utf-8?B?Wm5YQTBBUTIvSjV2eWJ6QlVFUGpXYnpOdmtzU3ladkxkSTBnUUFmTFUxd1Vz?=
 =?utf-8?B?Z24rMUdUeWZEOVhobFVRUjlQaktPZkE4Nlk3V0dkQWNJa2hDc1lDMDdqQUlS?=
 =?utf-8?B?ZnhsN2FtbUttTmpCRFVOZEViUTA3NjA3UVVPSlA3cGdiV0cvdU9wMXQ0bk5S?=
 =?utf-8?B?SzFKaHM3MStCNkdRR3pYaXlpdTJra3YzVUVzc1EyRWcwUjNDQ05HNVJzeXZs?=
 =?utf-8?B?N1k1aElvTHJEdHdFYjF6UWlYMXN3NGFtK3ZjUTc5WlVkamdZYlR5RFhBaU1a?=
 =?utf-8?B?Nmw4ajVnd0NoL0RwcWd3VTBDaTYvVDFPc0UwTjBCV1VPdlpZcXhMbTl6RDdY?=
 =?utf-8?B?VitlWG9vUW9EY2ZTQnlQM1hDb0MrSmZORG9Qdm9CL0NhUnpUb3BrcitFRDZ4?=
 =?utf-8?B?VkZDYUxwM3ZIK0pjdFdjZzRqUkpoS0FnMkFkMWVHcGR3Zm91bEZoRVhhYUNT?=
 =?utf-8?B?cTJZaXR6N1AzbEZraDZldHRuVmNYM2ZpVGttcTZLNkh5cTVtTmQ5MmpqOUhI?=
 =?utf-8?B?V0xUa2xpdncra1diby9YTmFNREVEVkdSOHFzOVFxbm8zMFdzajJKenM0NU5j?=
 =?utf-8?B?UlFQTGdXTnZTSUhDMmhLMFlFOTlES0lic2NoS0tjT21vUk0zOXBQZUJ1Ky9S?=
 =?utf-8?B?aXFBVkE3bVlDZy9kRmVPVmQ1NTVxLzB5K1l2eTI2NUZVbzF0c1g3TDB4WVdp?=
 =?utf-8?B?bmdYMmlMaEtLd0VHbGFtOVdsVDhuOGNlU0tyRHZOcXJaakZyV0hWMWlLVnBn?=
 =?utf-8?B?RlJhdmlxcEtCVGpkd21DdzB2cWVLVTRFRGd3QzJiYklYMFdYWXpVOHVZdXVx?=
 =?utf-8?B?c1pWTXFkNXZxUjcxMU0xSmQrN3RYZmZycUhTQnpEVDJGeS8zU1lYbEdHa2Jx?=
 =?utf-8?B?Vkp0bVhxZHZERjI2aS9xb1E0cGZBQUllbGMzZFdLSnd4bkhWblFnRDkvVW5E?=
 =?utf-8?B?bWVJb1Jsc09hSDg5YXJyOW54VDUvd0lLY2tlTmpJN0VoUUdzMEs4YU5LUDY0?=
 =?utf-8?B?dEdrZVRKdHdoZng3bUl3MHZGbGNnNlR6ZlVIVWFpRUFvVXVHc1JQMldoNXJD?=
 =?utf-8?B?cjZVdHVaaFphcU1iaTR3NC9XS0FWTW55LzBWTE40VTNDOFExdnZsOVZmeW4z?=
 =?utf-8?B?NmtWMlZxNlNPMHhKcnQ1SVV5Mmk0YXpycEJlTll1OTJRSjNibDNoUWJ2RjVv?=
 =?utf-8?B?Tm1xaHZyNEZHVFpya1JpRXB2NnlZRkh5ajNTbEhVS0syLzVIUDlkY3pDd2FF?=
 =?utf-8?B?TTNEeFlxQzNhVnkyVkdyZGQrQ0NEV1FJSHZZclJGVXowbmVwbXRGM0JMTFp4?=
 =?utf-8?B?V3Bxc25CZjB4Z3p3TFhUcGNhZG9UeWxCSlErT2lvOUMrZnNrTlFnQ1JLVjNz?=
 =?utf-8?B?MkdBNEVTd0JERHZsemg2VnZ4WTlPeE43LzRVYmRtenB0cm10dk9wWkhaVzFr?=
 =?utf-8?B?UXRTQmlLakdiTEFtTkhEV2JWZGtJaERIRWdDOU5USzEzZmt6NHc1TlRaVjZr?=
 =?utf-8?B?QkxOSjZVTW5KeksrUnQvZHdkWnBpYTVJRFpST1RxQ2VCczkwdXY5VWFWTXQ1?=
 =?utf-8?B?Wk5PUUFOcTJ3Mk5QbDFKTUYvWnVFcGJUQjFvR1Q2dEhTOTEvd1J2QS9LejRn?=
 =?utf-8?B?a1ZoenNKcHFzZ285STVYcEc0SmhUdGpaaDMrUVd4cnRlZWJHdXQ2YWdJUU50?=
 =?utf-8?B?YklyZnRWQVZscW5WRm1tQzZiN0lWeER3VnRBVUVxdGlEZ2NjVGJnRjhEbDRJ?=
 =?utf-8?B?dEw2Vk9wNHd4RHRsY3BjTlIzeEVwd3p3WWNiQ1FXMDUxK0tkUG1icXBUdDhX?=
 =?utf-8?B?U3R1V01hYXd0QVdobWRZdmdZa0hTWG9zSFR0a0U2TWFPb3hrZTB2VEpXZ3FG?=
 =?utf-8?B?RlVLc1pMZVNKTmlnYnQ2aGFPVmJoUi9ZTHByS01hWEtTckVLdktDTnIza0kr?=
 =?utf-8?B?U0s1L0lid09OZm92RlV1WXdlYmdyaGN4MVhGK0xKdVp2djMxRnRnVFAxbG5O?=
 =?utf-8?B?TnprNitudlN4OGcwZ2FBbHVmWmlKekgwUWp5Q1hNdU1SNVJFblZxUHdlOEZk?=
 =?utf-8?B?bzdSaW8wVmtWVTMxTFF2RXBZR0oyYTFiaFJHcWZkRHBKQWlGcEE4LzhmdjAr?=
 =?utf-8?B?Q0VxUWdUcGJLQmxLWGV5L0tmRHc2RWVsV2lsL3hMTzFZNldGdTlQVUZGWUpa?=
 =?utf-8?B?R0hBK1FuSy9xSE1oWmVvQjVoVXBsRFVTVEYwbThIcUZCdE8xdFl5L0hqdFUx?=
 =?utf-8?B?N29nL0hIUEczZUJIRmYzMElsKzJlRlZmcUpmS1pXb3M4a29jR0FVUjF5TU1P?=
 =?utf-8?Q?ajHb1ejUWzKinDBo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59f7fb3-5dfb-4f9d-d12d-08da489242ee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 14:30:25.6104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhJXu49j2/VpnzM4Ek0XjCIP6+7b4kKo/Af7xs5aLe/sitP8kIU38q7IqAwDz09V7j9AHz4PpF/wNH+KaLMDEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3090
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/05/2022 18:03, Russell King (Oracle) wrote:
> On Tue, May 24, 2022 at 03:50:17PM +0100, Jon Hunter wrote:
>> Hi Ard,
>>
>> On 28/03/2022 14:47, Ard Biesheuvel wrote:
>>> The Spectre-BHB mitigations were inadvertently left disabled for
>>> Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
>>> that case. So fix that.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>    arch/arm/mm/proc-v7-bugs.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
>>> index 06dbfb968182..fb9f3eb6bf48 100644
>>> --- a/arch/arm/mm/proc-v7-bugs.c
>>> +++ b/arch/arm/mm/proc-v7-bugs.c
>>> @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
>>>    {
>>>    	if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
>>>    		cpu_v7_spectre_v2_init();
>>> +	cpu_v7_spectre_bhb_init();
>>>    }
>>>    void cpu_v7_bugs_init(void)
>>
>>
>> Since this patch has been merged, I am seeing a ton of messages when booting
>> Linux on tegra124-jetson-tk1 ...
>>
>> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
>> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
>> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
> 
> Now that you mention this, I vaguely remember some email on the list a
> while ago about this being caused by something like cpuidle - but I'm
> unable to find it now.
> 
>> [0] https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/
> 
> That was probably it.
> 
> We can't really do this for the other print, because the system status
> can change as a result of CPUs being brought online. :(
> 

Does it make sense to only print the message if/when the method changes 
as opposed to every time the CPUs are brought online? That way, there 
would still be at least one print showing the current method. I believe 
that is what Ard had proposed.

Jon

-- 
nvpublic
