Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1039C4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Oct 2022 10:03:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbiJJKDk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Oct 2022 06:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbiJJKDj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Oct 2022 06:03:39 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89241D0F2;
        Mon, 10 Oct 2022 03:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZcMQfBLNflE2aQyKG4M8XtfiXTCOSgWT7k58s35lq62n5wT5yZYsWhaKTFzRLwHJXatT4AmiPDzxshq5WtDO+YR+VT7CRfIID3gXro3jCMWUxxUwa+YMc83qXIrcH6iAq+MKU+rEXazNmz5t/IKrZY/NgWDAehQszR1TkODPRoIAQghFuEbIP56r4pm9l7mOMNruNt4K97mY5oz+pIEK835TEDjEYa8gLRyHcJjls82z+zw3bZHYJHwTTXWE8SifvBupYuPhn/lwM8gzL3Z2jRst2OgD9r6PQhxHo0lPvlSPqGU0nGh7FAs44gpppnQWf7DEU9KE+bWtYJJqYqnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaEPmG8bVTRjafNbJfDOFgW8GvUlqA+Fz6dQKYlone0=;
 b=JiCkgfRsDN58rANin6ThcpNqJzRt7bATRaZW3WYFTo8P7dGtGGmblv7kp2hVfLMypdmtocA9NCu9It2fc3FgLMJTT4+gLQXouope++V+fypcRSuT0yPfteZtj15f9VaJ39jjktwOG24Z7vQxpXbB+nYGjlQQ6fWzrWytxwPhu0HQ7UYLM91iW75hONlMkIFixSfp1aEiY3LEcKETkdUQLk0YjDdyJV1YuhM7kNQRLCWx4vXKlAegpReQ8aoMZfMx5WDO6rtIILZqB00ipFItL8v9yUGYqg/gk28REpW0QIjy3wX2qIzjQO1HDnybzgCsbbZCleCSd47EnSZvMMTa/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaEPmG8bVTRjafNbJfDOFgW8GvUlqA+Fz6dQKYlone0=;
 b=GRMA0Lv7D5QIWiKipaKnJb2fO4ECWg8yqE/Wk+rvnZvlLLELBvJXN+59r0r8aWdWeMW5CZf3vqxr0rz76gXUqIcoCkmuQPu7VqF3nP9klSTtSakh9HQ/4mQ1eR1G3ae6DAiB8BgB9DuyPRma8w5I4GHuN7kuBMRXtcgzg4Gru7z7U8fUoFfD82EXlCVKlJzXvmrsWIGuoicbIqw1v6Ka4T84+x4yN+WUdVO24Y5dPMVVSOsgkRvUm2nlsiKg4G61VeUbzGre3fPVgyh/wqh1vjXBY+5ClhQ6xGHOQwbkIcxVff85zcXBLJGDPiU69tcq0LqV7GJRNWeQDdDMYFuVtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.34; Mon, 10 Oct 2022 10:03:34 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 10:03:34 +0000
Message-ID: <942e4d27-a68f-9ce2-0523-75f8e57acdd3@nvidia.com>
Date:   Mon, 10 Oct 2022 11:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH V2] clk: tegra: Fix Tegra PWM parent clock
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        Svyatoslav Ryhel <clamor95@gmail.com>
References: <20221007084524.10712-1-jonathanh@nvidia.com>
 <20221009081853.6ipyu7u3ghcp6dfo@pengutronix.de>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221009081853.6ipyu7u3ghcp6dfo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0636.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: a472e449-b023-4f45-e84d-08daaaa6b126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5pgis7EsYgwlx3WJtnNuL01zpt+mG3Ws5ygQQcwNjg2xvYXtysFb720u5v6MIuVfLhszli/UcNuwwI0Wghu5taijwvrhOGgwpFRicQMgh96MiS3I3Ki4bh1riCGuKY5Y/FQR1oWhkOOQ6/yCCONnBlqmTyxVSvDuO+FMi7NkI0BQQDf8HU0WY2n7JqdQctCFKiDZL8K49IvKPT82ox1Dyh3pGkwIkU3cMj8D8RIcxOsF7vRZr45FGTmcrINlVUcYuIuWTrzsjJzV9KGCcppG9Xl0szxyCC4RCXVgPxntoUH45vWtnALpjzgTcfvCgAqIs7I1tDG+7ds5dC8bvQxJYpK9MaDLlAnvA8WMAKAMQAKQM0ORQwX9rU2+Ri6GuMrNTVffZ4wHabAc80dmNZle6b1WR0aNPIbJCfPUPWW6tNsFGg+lRTfF+7vABOTgy0aFP7LKlcayhyf2yopr9kjDFYQcWk3krYPQ9N3j8xPKOvu78BvkqDiMJN/FPu0AYapOTY07rrgfBscefeawKPXhoDqc122NBdejqbR24FhN0udt0j7GQwaUBPEzteVei9NcLkFP5fgeq9FjxuV1dbIjL3kU15kBriXhhMrl0fuujmkaEWVCIm7zx0JCuVY1ZzmDbhnc6Xe0acOAOL6jKZv5zGsVXgilZhYgLicJ5lFZvrol4DFYlgC5q6zVsOtsooRy3Pvk1GCiBcHz3zfYAyN2Ca4IxCN1jC70YK5eMwtUPg6ISGqTJiEJVzhFYQHsUpqMv5YlXRrAX11sbYb8yEFIzAbYhLCVX2nZAmIDNFUIq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(8676002)(4326008)(66946007)(8936002)(36756003)(41300700001)(66476007)(31696002)(2906002)(54906003)(110136005)(2616005)(6512007)(316002)(66574015)(186003)(478600001)(66556008)(6486002)(6506007)(86362001)(6666004)(38100700002)(83380400001)(53546011)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVJRbkdWNmwzVVNFaU9yTEZ2U2gwUTd2dXp2UDh6ejdHazNYMjRpaFdCdGNm?=
 =?utf-8?B?Wk1ET3JJZDUycWtKUTNvb2cxQ1cwbEY5eWRNYlNqU3kvcDZHMjYyMEM1NE1q?=
 =?utf-8?B?ZUxmUTFMaEExRVZ5ZzBRcDVtVkZlZ2pDc0ZYbjcrZWVwR2dTMnVCNnlic2Uy?=
 =?utf-8?B?S1VHS1lnUFFDdHMzb0hoWlpwcFBDWWIxSjlpeW0vMm5xWFZ3bmt3Nm1hVXMx?=
 =?utf-8?B?UTFxc0dTcFdUeHJoN3pkSVJpRUJxT01TS1hKY1J2Sm5SOWtSZ3hSZGNWakxG?=
 =?utf-8?B?SzlqQVpDS2RDcEZrbm53TVpTTjY3eFl6a3JMS1dGOTMxS2ZrTTRwUEowV25n?=
 =?utf-8?B?cXR0NnlUTGw2cUxaSmRHNGh5MWVMbTRnVXltSkZ1N0NZSGdtWGM1VzdINnhC?=
 =?utf-8?B?VjMxRnZNVmU1Sko2Z2pIdkkweDhRNDlGcndUc0V3MGVOakh5b2UrREI5M1M3?=
 =?utf-8?B?blpjYTI2cUd1MHdGSXV2UWhGbzBtb0lmc0ZmUlNmZXl0U3VRNXdZOFkxLzZO?=
 =?utf-8?B?UEVQWFNmQ2J2bFdGaXNzMnpESk5TcEplaEQ3eGJFQXVPNGR2KzBma1lad0Ry?=
 =?utf-8?B?cENRb0dHRC9YWVVwaWlUQ2hUZW1uZmRVTTczSzR6Nk4xeEp0d3hZY3QyMEVS?=
 =?utf-8?B?b013ODZCeW5zdFRjQ1BQY1lDbFlheFV2SFk4U1F1S0dDR1psaEpuNUJKKy9w?=
 =?utf-8?B?UzZlbXd6bWFjZzc3VW9qRnBBdUpaZmdWbmZSSGNLditCNWdRYnFubEFpMC9S?=
 =?utf-8?B?S3Vyc01ScnpmaVVSckdxd3JaTGc1N0FDUEpmd1l1QzZaa0Nka25wL1VydXNT?=
 =?utf-8?B?a3AyRDgyeVZramxLdnkraXFEVzJlYXV6eEZhRnBiWjRIa0VDenZJeDNzU3RR?=
 =?utf-8?B?NFliM0hJMU1tTUlXeWtKZ1hJcWNXL09iTDdHUmw4ZlJiWFNueGsyNlovOWl3?=
 =?utf-8?B?YmNNSVVUc2dVOVZsOEs1NFU2Q01menl4RXoxbVo4TytTaXFqQkg3NWhOUG5X?=
 =?utf-8?B?RVFIMlZmVHVrN2ZXcU5FUnZjTWRPOXhrL2FqVytVUW1vaUdEczB2OWo4QTMz?=
 =?utf-8?B?ZW50ZTJtR2VwRmxKcWl4Z2pTMTJpeXJEUUt4d0xRcmRuTUljanVhWDRVbWRQ?=
 =?utf-8?B?VEJHeVM3bS9tU0ZxTUhYckQvNXdUbzdTMTFIMEo4Y2l1VVZuZ2NzQk1KVVRH?=
 =?utf-8?B?YmV5VWI5VUhDTHB5ZGNDNjJzMVhieGVldnhyVUkrVWkvNzJDajlBcXRXVExh?=
 =?utf-8?B?bVdqaHk5Zjl2ZmI4WGJ3RFFkeUtrOGZiREZPVkNzdHk4c3dVc2NrbnErNmRj?=
 =?utf-8?B?Z1dJeml1STZxbXQvS25yYXIyemw5a0VmNUtRVTdQcDlNWmRCb3pYRmVEVXJ2?=
 =?utf-8?B?dDk2V3JGdkUvbE5SMUhLNlBMdHVpL2syLzh6YnhwSXdzMEhONE8yZDJORHhY?=
 =?utf-8?B?dlBhRjBEOWJRRXRkTWYvUy9hK1B2VW1MM1dmdTdXQUdXNHJ4N2pBbkY1SVQz?=
 =?utf-8?B?NkhzTVNhSjBQdTR5WWk0dk9kaFIvOUQyV3lvbUJFSlVoQ243bmpmODFnMU1i?=
 =?utf-8?B?VHlNN0lWQVNYSHl1Tm41eStTQWc1dlZZV0xGU3psaWN5TnF1Z1BLNUFaZ0JO?=
 =?utf-8?B?VWFoaFMva0tNVnRJV2hPN1p5ZitsSytvczQwc0ZVQWt5U1B3TFYvcHlLNkFy?=
 =?utf-8?B?R0ttU2RGbmZvZGVOV1F1T3ZjOXpHZ0lBRFNWYzB0WjcvYUpxbGRNc0JpUFhU?=
 =?utf-8?B?K0x5MFNGOTJPVnhJQVpWeG9wQmRGRlVJODFPZzdTUVdLT1BVWnpQbmtYa1Vx?=
 =?utf-8?B?bXhNeFVXYmxFbDZ5a0kyT1V4MWp3cjUydnlVY3Z5ZWRsb0lpQmk4bHh0clps?=
 =?utf-8?B?QSsvc0djS0JRMUovUEl4QXQzUHVyQWJ4c0xNSUlNR0Y2WWdHSVUzNUlQb2Q0?=
 =?utf-8?B?cG5PM3NkcTdGZlE2bzNyb09PYk50a0trNFdaRzRINGRmd2FVN1hJaVJYZHpW?=
 =?utf-8?B?VHBLeHdlN0RPaGxsS2JkNWhuS3l4MzhBdFdZa0Q3Rm9ZSS8vRkFUbHY3WVo4?=
 =?utf-8?B?a3hKNk5qK2U2TmNyMG10RHZ5TW5xWXc2TWVST1NtMjF1SlRtNk9BbmxiRkxY?=
 =?utf-8?B?dUc3RzlGTStLcHVqYzFSVXpuV1d1Kzh1OVdJZnRMTzhsbUJXcmx4T3RoRFlH?=
 =?utf-8?Q?KYt7N/dxPKA1HmV+s0sU5Ddcdsj4yR0dnF/Cac/VxObR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a472e449-b023-4f45-e84d-08daaaa6b126
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 10:03:34.2412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCSMRpT7gV39VLGYth9GslXbyYhewv78+4v1fFhZPd1NGW0dmeqoa4NWEgn9nmaj+FwIZ4lae+4QE5pIDHjeRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/10/2022 09:18, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 07, 2022 at 09:45:24AM +0100, Jon Hunter wrote:
>> Commit 8c193f4714df ("pwm: tegra: Optimize period calculation") updated
>> the period calculation in the Tegra PWM driver and now returns an error
>> if the period requested is less than minimum period supported. This is
>> breaking PWM support on various Tegra platforms. For example, on the
>> Tegra210 Jetson Nano platform this is breaking the PWM fan support and
>> probing the PWM fan driver now fails ...
>>
>>   pwm-fan pwm-fan: Failed to configure PWM: -22
>>   pwm-fan: probe of pwm-fan failed with error -22
>>
>> The problem is that the default parent clock for the PWM on Tegra210 is
>> a 32kHz clock and is unable to support the requested PWM period.
>>
>> Fix PWM support on Tegra20, Tegra30, Tegra124 and Tegra210 by updating
>> the parent clock for the PWM to be the PLL_P.
>>
>> Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> First of all, thanks for your fix. Very appreciated.

No problem.

> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks. I have just sent a V3 because I was missing a fix for Tegra114. 
Can you ACK that one as well?

> Who will take care for this patch? I assume it will be Stephen and
> Michael (i.e. the clk maintainers)? Do you consider this patch fine for
> application before the next merge window, or do you expect that it might
> break other use cases and so should cook in next for some time?

We should pick this up as a fix for v6.1. I also plan to request this is 
pulled into stable as well (all going well).

Cheers
Jon

-- 
nvpublic
