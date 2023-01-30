Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC044C61DA4
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Jan 2023 09:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbjA3JJ0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 30 Jan 2023 04:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235594AbjA3JJ0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Jan 2023 04:09:26 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5769F9F;
        Mon, 30 Jan 2023 01:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjgCvvUrLH48mwuFEIiMheOQ7ydstfDjTsJzH8ZbeZG3NDLenFoO3OkZ4dN2EhgtF4UJuC53XwuiHz3CpS0tG8Db2Isld9MMTmqzsReb8DzyssvZfKPgy9q0g/QxYDmnCke+QZ/5lhxJkY2sZH4FcYcilf7slGVA2AixY7G+ViBbSi9KFR/UWEGuczVqM4MRFRwjGCER0D0kvnZy0WT0Cbk8uuVY02Snu3GIL9mxF2V7on1EDt/ruqQPtCP80lYMefGtQofJoSIqYF6mN6XuzG0h0Ymu2v+wNQQNKWDJ79V3NQO6rL0OEvPvLaKxQvNb29uULZS/KFcWZZKyg4+jKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EB8A2sQYIIYZyZmcS/oAlL4/ZEbirTBbBM+jWe+com8=;
 b=kG26zo1nbiyCde2mbHv8sO2VaYSlyEIYMqLayES5gab7zvXHgjdZoiJ+/rhRHOsn8DjguDpk82TTIOduG92jwcwzwQDF++dWIQwhEJMN4v7LoTMjm5qOVXWmOQgRWYlr9kxonRL+FYQMLM7TSrgeawG3PbL8ImUzqmBTHeanBZZpf7I0RUVOVqsBewN8G+VKFeD5rEEhm58NzVlel8kH6O8LdqIOWdFv6qGUstliSqnNarTH56Z2M6g2AmEMz5ZCACDkWK7xmiYrJEvlj1JMVzK4DuQEmbibGZrybiKMsErTFBjL8YaTy2reJtXs1usk2zRc9Z2yXY6MvDKoVldd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EB8A2sQYIIYZyZmcS/oAlL4/ZEbirTBbBM+jWe+com8=;
 b=AEn//wpbs41UYzJfceqlam/vYEDmND+RWrSpzac6fvdYjlQ88Fsy/XqxHNrnjg1qprN1roOT8SNuzlLroQ/O0e/EtCX+7/jj6VWIS+u3jgkX1a/b9NqcNgiyVC5djUU4X+B7isbuJf4hSEo8+FD03irsrs6E8zBo71sM2pEMZcHFd/Rim9/5RnE8hEZqDWCGHAq3+3LBqXBF9xHGGFi6dQyFuU5hX4zW4voQKjd73sR1jyJuAwXNTIL8HRXR37nr2bw6d1fJrDI8GaOJ6HDjetxFcg3tdiOK5yEvJFX/hMr1hutkWzBOPIfiDNMJlQP9KXeOvjwKuauenPQIgUxZFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 09:09:23 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:09:23 +0000
Message-ID: <c9abd035-b8fe-39bc-2b23-d2cdf6c46023@nvidia.com>
Date:   Mon, 30 Jan 2023 09:09:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V9 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
 <20230127151041.65751-2-jonathanh@nvidia.com>
 <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 662f628e-d089-49f4-4831-08db02a1ad99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YNpnm4svvrpy1m14LPCBDFrOuxyQExYbkDVKAceXKn/ZTJukMGG2lv6i+205VyfQLrWwGqRqv/Pp7Djd4YFXPLtlBpqS3OAqoId1mOmoLXNDw2On7MA5NBizADynDOoNaGifd0mvzOxqG9s+2+wzOjZxOtKBozR4yGXnXdBjTdF8h071f6zSDBhD4wGyGa9rm9Q3WjewA3R18/qeFyC+HG2J4yAJtfql5Vs6rwxPpY9b5A0NuAofuE4kTqW/5TDi3lUvl3drZaax9CWUQX+V1QFrDNqkX34fcJ59fFPg8L2QBzuayz+MoUGCESUXZmo9T1RBYIAUTJfVuAbCMbhA5NZi56vRT1yrHFkg9WXVr5mKD9Bc8/dwpu3U9G/VaLcjAvzA3IT29Mjg1iKSf+IN6LJ2m74QjJXMoggdIfuy9B8p6SvgrcW3bF0fYCMIUc1PY+XmiIUjCVX1Gig7odWP81NQ1xIA04AYdPjcWYa9AnlDcKsAembM8vncqssF2uuJ6jVFfiUWDiTOSYK5AEF+WZdfVgYE+jX8sekNNEBwmqhmD94fy2h5Dl6kz8puRXYtYKC3Dyfbe3Et0HdjIb0jitYIokF80kJuesb09JvwnS8q72rJZZeMUJdqynZyuLNQwkR8ExKRsZaeY/1N2yWeUHCmYJrigkxMdiVdYjN12t8yR8X/dniEcubdnUoPiAYa+VWr4cqbKJXVaE2xA//gtgrMV2E10MRZNgD7iVxQ/kM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199018)(2616005)(6506007)(53546011)(36756003)(186003)(6512007)(31696002)(6486002)(6666004)(107886003)(478600001)(2906002)(38100700002)(86362001)(316002)(110136005)(5660300002)(66946007)(66556008)(66476007)(41300700001)(4326008)(31686004)(8676002)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFdMSUlnUUJSdmEyVmxQUFNDVnZoc05YaHVGVWVTTUV1eFdONkpMNVpXSXhi?=
 =?utf-8?B?VURZaGZ4Slp0WEJ2Tjlxa1U4VFF1alhJcGw5aG85cTdsd1Q1UEl1aHpkbm5G?=
 =?utf-8?B?OFpPQVJQWnFsc2pUN0xQb3FJL1FycURLQVZJM1FNWk02eTZpYXZLalRyaVF6?=
 =?utf-8?B?djNlZkNiS2Z6N0xWUjNod1diQ1ZFZ1RrN3NDTUdDZzh0NndydHdGek5wWktC?=
 =?utf-8?B?cXc0d2twY1NzVzdDdEJSUFJLVmc3NE43SmhMOWdrZWNpWGhWMnA5RWlQNHRw?=
 =?utf-8?B?eDgrTTkvaWRoN2RRY3paWnEvN0cvbjFEa1JFMmNMWkxac1luc1NUUkNHT1ZU?=
 =?utf-8?B?bzlMOHJRMDN6SzgwZWpjOVkzUytCTU9NN2R5ZHlYOWgrM0wwN2xtakxSNlVs?=
 =?utf-8?B?aVJPRG1JMXdYeGRkbHp6M2ZjSDkrSTVRMEFoQjB2L0RpNmNnSlNuU01VVFY2?=
 =?utf-8?B?S1dSM25HMk9wYW42eEhDYzFhVmN6ZHNCdGRaL1dmRzhrcmFRaldpYlROMFps?=
 =?utf-8?B?YkhyRkVkbkdRc0M4SWlxRVVpK3gzdnEzcU53Vm9oc3Q2SWJDeE1yZ2gxd3Z3?=
 =?utf-8?B?KzhvcUtPTnEzb2FWR0JBYXNrUHpScmlHaHAyZDRDQVpvS29iY2pkdmJ0SmR1?=
 =?utf-8?B?c2NLd1BwSXRjMHd3amdtc2MyWnphZVd5ZEJZTU9FM1k4V2hvcStqVm9GVVZN?=
 =?utf-8?B?dERQQ0Z3cXd3aUhuQlB6eUt4OTlvbHNWZ2pCK0hYVzF4R0IyNkY5ZGdBYXVw?=
 =?utf-8?B?ckJvenNtWTJtV1BtSVU3Nk5xQStsUkh4T1FXZ25aQng2YnlCS25KWXUwazZO?=
 =?utf-8?B?NEp1VVBndnlSSHd2UHdiNTQ0MnF2cEFrdk1OS0ZaQnZMVmQvVWRCbUIyUnpq?=
 =?utf-8?B?ZXptZUZFM3VUNThpQnUrbTl2c1FoUGRyNGFFWEpKcXd4RU1CajZaV2dkelBx?=
 =?utf-8?B?bzlwWHJWUmt6aWx3V0FTMjY4eWdDeklIQlZzbXdBQ1AzWG91WjFQU2VBYkwz?=
 =?utf-8?B?UHZ3a0RiY1JHNEZ0enRuTk1wa1I0bWNCMHcweWplTFZtOWZVMnZCWFFkRWds?=
 =?utf-8?B?UDR0c0hndHNpbjE3VmVpUmpTSitXNmd5dTVmVUdWTlNWNUZJUThUeERkYnNH?=
 =?utf-8?B?VEI5TFErVGtsdU8yYjJ2eSsyYTFCQWZuNXlKaDVJdUJjUHZyZjVvNHpJOTdP?=
 =?utf-8?B?RGVDUnk1cmJ0bzZ5cW1Cc2pTUkxrZDMxRFA1VldYWEVMdStWV1BndjNPTnhZ?=
 =?utf-8?B?S0ZTUmF5UXFHSzNSNlNXaUtaNG9uOVVJWGhkRHJ6M0RzNGxjTkxtMENOMzVr?=
 =?utf-8?B?QmtNaElpaGd0dWtGMmV2VWlWdWFidXIzZHFMY2NDbVlMb1RWSXdXaU8wbzg0?=
 =?utf-8?B?dC9hVE5BQ1pKbUZjRGJPbHV0S095dHllSUZGOHYxd09LMElxWmZaWDVBa05v?=
 =?utf-8?B?amhNMUw3Y1dkSmVXK2VZb0ozRVAyN1pBaER5eGE4ZWR3Zm1WaTFRcjNMdm5a?=
 =?utf-8?B?TXpYelBPOHhlb1RHcE5nUDR3SlJZaDhvZUh5YmNHdzNjenNtazZGL0VEOE5V?=
 =?utf-8?B?aThtb0J5UEtYRlgzTU00ekRFOVZoTWhQRUJ2TzBRZUE3Z1FCY2kyOXQ0MUNH?=
 =?utf-8?B?Y0d2OFJGSGZpYU4wL1I3TmRLalMwRWNmNk9EMkVVQitrSjFQSUwxWnpZR0hq?=
 =?utf-8?B?Syt4bUh2U1F5eC9MOWZja2h5Zzk5eUlYeFFvMVF4TVB1WThUOWZFZGV6T0Yv?=
 =?utf-8?B?WXhmaFp3OURDSE02NGN2Y2taMGNlWGhWQkZ4MmYxcUh5SkZkQTR1TmIyWnBH?=
 =?utf-8?B?NGM2cWZOTjdaZWJ1R1Q1bEU3SVVyNlNnNWs0cUtBc3ZQWHBzVzF0SVVQYXdS?=
 =?utf-8?B?aWhqUk5RZ1VtK3hqdy9YNXdLSndDRFIwSHdBME5nNUJkQk0rRkZYakxmVm9M?=
 =?utf-8?B?bnBOd3NnckZ3RTBqUS9FTmpMV3FyeTBkNkREYUIwQmEreHlidWt5d2VZa0hD?=
 =?utf-8?B?OXNWRU5zWXpOSkdVYWJqTVhGZUVvSTV5VVRRVk9rWnNadVd1SjkzaDdONzZK?=
 =?utf-8?B?VmxLQWVjcGYvclJVdE5FSFl0clFNZkc1aFNPSDErOGlJb1hvY2tZeEFWWWRT?=
 =?utf-8?B?NHhzanFMQXpCYm83LzRZSnFFZjFyMUJwRTdzdWlRODdLUUJwVjEzeXVQOWdN?=
 =?utf-8?B?djdjMExxYUI3VEkrOGZLT0g5anBuamU3MmhTTzA1WXZ1UGZVUEZYVlFtUDBn?=
 =?utf-8?B?M1RURllUSUdGNENSTTloWWNvR0VRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662f628e-d089-49f4-4831-08db02a1ad99
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:09:23.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0efm0+9w7E1hJp0s+lllOOHlYJ5exGDac5rdG8BgWWYbitDsmKUtnwUsTa30sEEEQ3//FBfsVFgCDtis7dzgRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/01/2023 10:29, Krzysztof Kozlowski wrote:
> On 27/01/2023 16:10, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> Add the device-tree binding documentation for Cypress cypd4226 dual
>> Type-C controller.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> V9: added 'unevaluatedProperties' and 'additionalProperties'
>> V8: removed 'additionalProperties'
>> V7: updated example to use 'typec' for the node name
>> V6: no changes
>> V5: updated subject and updated binding to use 'firmware-name'.
>> V4: no changes
>> V3: fix additionalProperties warning on new schema
>> V2: based on the review comments. Fix some addressed issues on
> 
> Thanks, this is looking good, although few more questions popped up
> while comparing it with other bindings.
> 
> (...)
> 
>> +  firmware-name:
>> +    enum:
>> +      - nvidia,gpu
>> +      - nvidia,jetson-agx-xavier
>> +    description: |
>> +      The name of the CCGx firmware built for product series.
>> +      should be set one of following:
>> +      - "nvidia,gpu" for the NVIDIA RTX product series
>> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
>> +
>> +patternProperties:
>> +  '^connector@[0-1]+$':
> 
> How many connectors do you expect/support? 1111 is valid? I guess you
> wanted only [01]?


Yes only two are supported. So yes this should be just [01].

>> +    $ref: /schemas/connector/usb-connector.yaml#
>> +    unevaluatedProperties: false
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
> 
> I would assume that at least one connector is required (oneOf: required:).


Yes there should be at least one. OK, thanks, I will add this.

Jon

-- 
nvpublic
