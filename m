Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CE4C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 09:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239971AbhK3JMV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:12:21 -0500
Received: from mail-dm6nam11on2054.outbound.protection.outlook.com ([40.107.223.54]:40896
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239972AbhK3JMU (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Nov 2021 04:12:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcjsZRww59BhB+Fu3bDEEGqFo2cAps0uBNcYqwIuh1o0tkGTGdOGeX/SVeNcXSWtH4VHXqSzR3oQaNLvOtroaG+g+fNyTiEtg7JTmG4VTQ7cdLOsp0Aj2G+GWeLA20aFgrhTpzPMX86B5nPhO34viFgeIKQmT/A7BIjXTmOkj7hvcmAQ9GXlZAH0Cu9Op2qX3oOhni3btBi1oGm1E3M+e9bc5N9ja6Ubgk41izOrUUc2BzbyViqTq5Qr0vpgBbu7nZrQmyf4tnac54o2d13wgl9Q+MgbvQql819L9jHutNQ8CRlft0SLtoR2zSv4efASrdS8Slm3EPgxNkFAz7Z4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzJOV125htFWpDOMrmXKhBaE/9JYGXlMIAfm47nPflQ=;
 b=UVYip2FNs8yQwrOXaYlfJEWIRwLINlK1+e5OjEu9d6fWf5qGP2PUzbPrerC3HAMhupqoyYJG4lg7CgMnVsYHf/8TQuMejWCnPqQP0kjjk2LOCDeA+v1ShYh9r5P8SFImCzPzrDWi8nUC3Olcpnp0V+Bl0GjNn6Mj+ZQVqKXsCsM7htPlVfkFTDPyEb+iEHRvnQq6zUaT3cbk9tyN8Z4mLQDpJhuJfI7uUOU4jsKA3dEtWhonbwJcc1IqbGxcSbGoP3xAahf3NVMZs5dUgvRKfx4KQc9BIKmFm7BTCF4zE1PEtfaivrPtGm56YQkisZqGYBMgYOc3gJnWJQ9ZSccmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzJOV125htFWpDOMrmXKhBaE/9JYGXlMIAfm47nPflQ=;
 b=sBoSPQ2e8A3M8CF2mpLIppXOsQufbbLJkV4tPyl4xHNpdVJv9LACVsbKCeWnmxkX8AZmyyJSgDg1/Uz+98V82p4A0ve7eZ7kWy5PQLyqcn+AUAnvJs3/WXkktBHgD5YygRTCFgCY93SwTOx2Yv2xboyWjIN0OzShXUxdtH0Pzeuu8QVOzbWiAahph5RCBrnFQcMwUCZSrRkOzQ6uZPUae76llv6qTMvz/PYh0kD/xLjNbuU3BjpCxIv+PutQehT72+/oMnpbIToJdHAZpO16LIISZ3ViZT6pnJkQnz4jtFkBZbXXSkB0EBMltjBAklik1MG22Kg1SucUda3R2ijcGQ==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB5587.namprd12.prod.outlook.com (2603:10b6:806:232::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 30 Nov
 2021 09:09:00 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%4]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 09:09:00 +0000
Subject: Re: [PATCH V2] soc/tegra: pmc: Add reboot notifier
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20211123111134.26409-1-jonathanh@nvidia.com>
 <eeb4200f-7608-56d5-76e3-508660669812@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b2f11233-819c-a33e-aa92-fea7e818dfbb@nvidia.com>
Date:   Tue, 30 Nov 2021 09:08:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <eeb4200f-7608-56d5-76e3-508660669812@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0141.eurprd05.prod.outlook.com
 (2603:10a6:207:3::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
Received: from [10.26.49.14] (195.110.77.193) by AM3PR05CA0141.eurprd05.prod.outlook.com (2603:10a6:207:3::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend Transport; Tue, 30 Nov 2021 09:08:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15b27510-2c6d-4fc9-8f18-08d9b3e10c50
X-MS-TrafficTypeDiagnostic: SA1PR12MB5587:
X-Microsoft-Antispam-PRVS: <SA1PR12MB558704A8913AB40EFCB48230D9679@SA1PR12MB5587.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJ1f6EcDZqez4lcRm4okhsPAyJCOoTID8t/1ezcaq9ppfiQKMHhFshxeWE1D7ljEdcXtNaGOnFSc3x7P6aWHxsdG3pmSlXqBquecVcfExP70KBcPb60kMU16ifZJW+SEn5pLZECknzgPVPPC43X7ukoY6mOLDfWuUOyHf6HjOhmTTjw08ZDM2XOaGujbPH+v1LJol8gwzuXU8gR3cOoj0HoRwwPCF5qJ/ASBZC3+Zdc7bXWOC7AZxGwhp0rQPv84gWBM6/sUTlXDMU+7KZF9e87JPyVKPaJsyFwz6ZX68Z/HQZXbe4g3W3hcOg5A8+KXvWa2DJu2WRRkW/iaoNh9VwxzmqTd2JOmAv57dCjxK6z5B2LamOD7cKX8SM+XirPdOAMaguFCdeL0QB5MsofNn6q8ftpRCU0dMycJECNtsNpuALRgzOdccGfTUVX6rTk575m7XBDR/0g4eoTz5ywLEpgdsxnr6+y+Xo7qXRTrmUbfoya1yxLq+dLMHSZm74xeFAO4Nb99o0A8MdkaRSDMzZsT6VQT8SdauA5eAEwAkWqO51ZA+Mmnc2291lpYWP1CxqD/2OtxKHedn5tPPLBOz4acrfR29Pa/OTbtWE45D6ne0hQtjIopTaBPmW78rJTJ12bzr0fSaJwbVYIq4yC9aOaE0RpRV7ShOz24sx12QLF2aYB1EDAz2XY+jQ2dAUgb0OLGvnHZq9FLO2TgTjVg9QM/gsB+tSq3TPqjUEZcz6Glel3MBoNkOBp/WgqF0HeQ7SreUC03VYDQNt5Ol1/PFbJ8yBk2k09cxUw6ZKi1Gexw5hABEGAR55RD42a8qURUwkc8mUliLIzl35QT3MCmAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(8676002)(4326008)(36756003)(38100700002)(83380400001)(66556008)(31686004)(55236004)(110136005)(16576012)(6666004)(316002)(2906002)(31696002)(6486002)(966005)(8936002)(53546011)(66946007)(2616005)(86362001)(5660300002)(956004)(186003)(26005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFVCTlN0L1R1S3hrYW80cXhJTHNreUNTWmVaY2xMREwyaXd6b2RObFVsdjVE?=
 =?utf-8?B?OHRhWGl0REhuL0g0WitkaHZTcVVkdTRXVThHdHZtaHJyVVpET01kb1lTeW4w?=
 =?utf-8?B?NGxJNVhveENvbW13Y0YrTkx0Unp1bGxWODhlNWxsNmNJbWRRY3hLbTVmSnMr?=
 =?utf-8?B?OVV3Y21XWmZtcitWS2diTG8rZjJRNEZNTVhFdjdTbUc4VkxudlBCT1ZXR3lT?=
 =?utf-8?B?UWdjdGVSaGZ4WTJrSDcrNk9VT082eTA2Y3p5MjdMaDNaeEJ0dExUK1VIMjFp?=
 =?utf-8?B?NW1DZDIydS8wNVNQdUJ5b1FJZGN5Ly81aTBKQTdETUVjSjhmNjNnT25Qb3pY?=
 =?utf-8?B?cko4RzlGdGFHSlZFZmtzY3M2c1N5S0NhQ2NuSzE4akNBMXRGdXp3SlZ5WFpS?=
 =?utf-8?B?Y0V4bVJzNXNLVFp2bXRTVXhqNjI5Z3o3T2puTmhsMlhDMXo2bGZ6bjQ5MkFn?=
 =?utf-8?B?SnhveFQyM0RJWDNlUUVxVTFpcThkWk1DMzc2d3luc2xnREhtUU5GQWx5dGYw?=
 =?utf-8?B?RmtncXVZTnlVaXBjaXJGQ1VCS2Nwci94d1h1RVhTNndRd0EwVzB4TDVGNlFX?=
 =?utf-8?B?VDJETzJsb0ZEOXdVWjdWdy9UNVlhQ1dzSE5BRnBYalVzcUdxRVpoVUxyeCtV?=
 =?utf-8?B?Q0FGL3RJZllmU3I1TGxtNjhEWER3dWRYY1JiSnltcDBXcUZZamtmdXR6SHBy?=
 =?utf-8?B?a3FkZnFmVUlTai8rbS9BNm1Jd3BaYm9lM0RiZS9lMmNFVElnbVhDS05xMnUz?=
 =?utf-8?B?U1JmVTU3Ym1xMDVoVi9UbVlVWXVLZC8wTklidmNRRFlVUHpENWMwcWdWL2xT?=
 =?utf-8?B?QUg1RmNuRFpUUHNRbTk3bUdJK1VReE8yZnJsRGVCOVZIbWExbURYazB4ck02?=
 =?utf-8?B?MUhuS0JETzNjWmlXWE1IOUE1MENralpVRExDOEc4clJZYW1TenBFZFgza0pI?=
 =?utf-8?B?MGVpdGdEaitmOXNudWRJb1NBNy9NUU5vdWY5UER6VUJTTW9KZzdlaGpmMmdM?=
 =?utf-8?B?MFlibm1hZXl3WWNENmdKRjNIOXQwcnJDL2xyNi9qT0MwcVVZZG8rVXJmdWJQ?=
 =?utf-8?B?Tlc0UDhmSGNvOVprTTQrN210TmVpMC9rMy9iazkwRG0zcDhodkkwNUU4ejRY?=
 =?utf-8?B?bWlsMTZLWHNpaDNhLzZjcEEzVmJneUNPR3VtSEFPK3dOQ1B5VTlkckhKSFAx?=
 =?utf-8?B?SEtOYTFqZU8vWmhWMzJqQmNDRTBaMWdSK3dwd3lrQjQ0V3FvaG9vVGxVVnJV?=
 =?utf-8?B?ZjRFM1BIWEhhZHE0N2F2d2xXSVpGVWR6RVZkZm5iSDhHWGVGWWRXZkNmSVRC?=
 =?utf-8?B?aktxeEc5ejNBWDRjWFFaTjZtR2xnWTZiSk1oL05DaGx4aHoxOWhUa2grOFVk?=
 =?utf-8?B?RzJpcDBwSFcyaGtMemVJRVowcXlBWFIrelhKVGJ5cmdTcU9wWWJ5dlZacC9z?=
 =?utf-8?B?QnB2Mkk5SnpCbVVGR21aL29BM0dCTTdjQlBKUDFKR1krVkM4NTlCQVdTV2VI?=
 =?utf-8?B?LzVkOE9ML1RMUzV2VnpmcXNzeVJRN3RlOG9GeUZUaWY4TkRIN0UxcTBBU3ZW?=
 =?utf-8?B?T0tjbFVLWFZZNWduTkNncFRiS1BqeVZPN3prc1RUaUs0eFBadEV0b3RwSTBz?=
 =?utf-8?B?VzQyQ1dnVFpZeXk0YmljaU9yT1dDYjBPZllkaTQvbURiYXhuL0s4ZTRhbklP?=
 =?utf-8?B?L3pYYjNIb20xbStqcmJqUkpuVGxabEgzN0kxSUljbUs2YUFIZVM4Z0RWazBL?=
 =?utf-8?Q?VzIx0euzoCE7fAge3UAE4wzT7i+J8S9w44Qlcye?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b27510-2c6d-4fc9-8f18-08d9b3e10c50
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 09:09:00.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aQKV/Dc5RJ0VKe0/VmkOB4MCrjO7v2xpRh7VMw/y5l1AFipS0ibCmGH1OGLTiKm9VW9E66tet4CCBzk51HkLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5587
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 25/11/2021 04:33, Dmitry Osipenko wrote:
> 23.11.2021 14:11, Jon Hunter пишет:
>> The Tegra PMC driver implements a restart handler that supports Tegra
>> specific reboot commands such as placing the device into 'recovery' mode
>> in order to reprogram the platform. This is accomplished by setting the
>> appropriate bit in the PMC scratch0 register prior to rebooting the
>> platform.
>>
>> For Tegra platforms that support PSCI or EFI, the default Tegra restart
>> handler is not called and the PSCI or EFI restart handler is called
>> instead. Hence, for Tegra platforms that support PSCI or EFI, the Tegra
>> specific reboot commands do not currently work. Fix this by moving the
>> code that programs the PMC scratch0 register into a separate reboot
>> notifier that will always be called on reboot.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> Changes since V1:
>> - Don't change the behaviour for writing scratch0 register when the
>>    notifier is called.
>>
>>   drivers/soc/tegra/pmc.c | 33 ++++++++++++++++++++++++++++++---
>>   1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 575d6d5b4294..bb2f39597823 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -1064,10 +1064,8 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
>>   	return tegra_powergate_remove_clamping(id);
>>   }
>>   
>> -static int tegra_pmc_restart_notify(struct notifier_block *this,
>> -				    unsigned long action, void *data)
>> +static void tegra_pmc_program_reboot_reason(const char *cmd)
>>   {
>> -	const char *cmd = data;
>>   	u32 value;
>>   
>>   	value = tegra_pmc_scratch_readl(pmc, pmc->soc->regs->scratch0);
>> @@ -1085,6 +1083,27 @@ static int tegra_pmc_restart_notify(struct notifier_block *this,
>>   	}
>>   
>>   	tegra_pmc_scratch_writel(pmc, value, pmc->soc->regs->scratch0);
>> +}
>> +
>> +static int tegra_pmc_reboot_notify(struct notifier_block *this,
>> +				   unsigned long action, void *data)
>> +{
>> +	if (action == SYS_RESTART)
>> +		tegra_pmc_program_reboot_reason(data);
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block tegra_pmc_reboot_notifier = {
>> +	.notifier_call = tegra_pmc_reboot_notify,
>> +};
>> +
>> +static int tegra_pmc_restart_notify(struct notifier_block *this,
>> +				    unsigned long action, void *data)
>> +{
>> +	u32 value;
>> +
>> +	tegra_pmc_program_reboot_reason(data);
> 
> So the PMC reason is programmed twice now? First time by the reboot
> handler and second by the restart? Why?

That's an oversight. OK, thanks I will fix that in a V3.

> BTW, could you please always CC LKML or request to include linux-tegra
> ML onto lore? Tegra ML uses Gmane and it's unusable for development
> since all email addresses are mangled, the Gmane support told me that
> only Tegra ML admin can disable mangling, but I'm not sure who is it,
> maybe Stephen Warren?

I see linux-tegra here: https://lore.kernel.org/linux-tegra/

Jon

-- 
nvpublic
