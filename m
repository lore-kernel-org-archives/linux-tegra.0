Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AF3E8FDB0
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Oct 2023 20:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbjJCUCv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 Oct 2023 16:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjJCUCu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Oct 2023 16:02:50 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDDA9E
        for <linux-tegra@vger.kernel.org>; Tue,  3 Oct 2023 13:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdSW5TV/CVyT1BWusIeJiH8R7RTtgw319iZe/gIy5EREISp6Xzo6UXMC+vUmSZkZ5TWIpt/o9qpNk4vvuBiWYT+ghiyWL8CTQTq60gFdK7ezACCZhgYIqJVRwizt132BnnAseRb0rYsaq8YIgV3jEsTgw3+5yFE/hWNEq+sBbSnz0GhxQBa4ID9V3y4UeV2GRZ0DG+TLmM3rohiCzvBDEsurld44H9nwfhiFj2M0rmX6Pm3xAonGKe07U49koql1RgEpsBISE0/XhbLsfXBgvY8xur8tIfUvwherTWmGIrB0xdZmCILiwLjr34Hf9uZdZ4NuySRaOiBPexZwnelmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgIwJBsrLoNuUVMVBEHLvhnbCWsxAbM5EP37N983yAg=;
 b=cdAfvl3xTkKY5ysTMJv0VlxNys5ihYxmDn8iJSOZhmAGbLc5hSp1PrDvK6ZLuMXCiNWNAgkvz3vylXXmDMoexX5tmQkjDcvYz7lfpCPPkodAJNdQZKoNBxmRogJEG99ylRPKVu/78/bffpBDbmKKz1bvuV1HoX1w34AIv/hHV9uUupTl4j6dyo4xFCw7jV6eOAdEsAOrbWzYhgxfYTRjHZodGRC7p7tpEsak+BbD3HHOxCCSicC0eYY2uZCvM3JLYzcr0PpwDWvrDzci57h94cnxuE8vB38Qt2m6vsQATjsq6mbvLorVvMpWZdXXMgzDsP9rlkTfCs62ckwICqijog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgIwJBsrLoNuUVMVBEHLvhnbCWsxAbM5EP37N983yAg=;
 b=iThY7ZdyKx5jkU2RpN+KCAH8kUL2z8oVsfHiZH/48fMnbqAX1ysKL3jPAF43CoeMkJ4Cu9CepThoq5bQToHTGs2pQPYPOG1pyRggVPPoe6PCou2h804Z7uEK7E60hFZ/L3dlwqC3QJ/SseQLrQqaTjtBcrjzp0oJbrteX87h+KfVtf+UhfkkZxBhY4gH42PbDy3XNbMHp03ZHslKxdtTvoKpa6GrA/JL/DJfjOhejoWL2quX8gyyY1pbgpeQGZHeg++VJ4DvWXuZEJRQjsO/iS6WUV/JKyEO7sa4xVvrItk4p5+7euGhQ4oPqYpGGG6KiwhAWESlnL/TRzX1DVcJXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Tue, 3 Oct
 2023 20:02:43 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::8814:146:e28e:6eea]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::8814:146:e28e:6eea%4]) with mapi id 15.20.6838.016; Tue, 3 Oct 2023
 20:02:43 +0000
Message-ID: <4ed3ea73-f6b7-d3f6-517d-752814ee3116@nvidia.com>
Date:   Tue, 3 Oct 2023 13:02:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH -next] hte: tegra-194: remove redundant dev_err_probe()
To:     Zhu Wang <wangzhu9@huawei.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org
References: <20230801140114.257740-1-wangzhu9@huawei.com>
Content-Language: en-US
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20230801140114.257740-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|SA0PR12MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e3b038-e774-4230-67a9-08dbc44bb469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8lYmEgm6Y/yfczEepmJ5l7Lc61VmDrwYBaCrFl4EjpvGDUdAwDSWLgbNxuhxFwV54gDM+rvzNot/sqv1m4Qu48EtFDHPjq2XQCUS4BBUuPxiMcRAUd1rAb86YgK3IjV6NW+b7r92TK9xcmPWq5yZL0wMwVGcdAKK2tTUJNn+xFDlagmrAMgS+7zG0yB6WTqjVfndgRFAhjaLsPmkEza+OmK+9OW+/86LrdLT7pJyv9/evuendXGin92X5dAaU7RkjtsUPX+oaZsZJs8oc+4JvlpmbQs5Ta+10DZ9BmzCNOWZIa0t/DvG5N4u4Zuy1jCnqxI/8G+curc1wrfkZfj5wyKIYdyOSwmWcPcFwZR0XFXVl7PmAl6MlyvjBYxxaNpMOW/dvA6l+MvuoiZ5d/OhCMwiCASmG9SZQ14cK7DrHNor1UgJ+1RJFXMZOWXRoW6oPcnOEzzcuT83qofAQWv8nSv90vEH1CjSCMfW1MbpEsv7d/qi4mn5jmtC6K6PTXdoae4CVp/OJxSiASxr84MbBrflBF2cwSdWAbeuifHsdaele3cgmCYYov80+n3NLNtXZvR/jbauvyLJW8tUs7Qa8BEk1sNKqWxAi4Qz/vLoyZTy7APJku90HH4MjVP/5AMFVcBtJ7J5bB/ueKDIppt38A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(86362001)(31696002)(36756003)(8676002)(8936002)(53546011)(6666004)(6506007)(5660300002)(6486002)(26005)(2906002)(66946007)(83380400001)(66556008)(66476007)(38100700002)(316002)(31686004)(2616005)(4744005)(478600001)(41300700001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VExpQklSS3hVQnYrN0RLVkFjNENjMS9ZTmMzZGNSd0VPWWMvZTh6QjRIYUdK?=
 =?utf-8?B?S01Oc1NKWWg3ZWlRa1RVUHRzb1o4TUZoUXVwcCtVOFE1SXE4N1dGYTV0M0xE?=
 =?utf-8?B?L1ViMkl2SEdjQ25pQ0h0TDNTMHZpNnIwbXBzaTVXcUtPNXY2OHNPQU9NbjFi?=
 =?utf-8?B?T1NJVGlBN2pQRmE3MzhEVHg5bHY2bEM1dWRjZW9mUlVkdFBJVkZqVUZGSHpJ?=
 =?utf-8?B?NEQ4YktOa3FNVm1rOTYwa2d5RlhReE1CMjIyQUpmYWpHN0lTbS9wTWIyNFkx?=
 =?utf-8?B?cVVURm95Z2Vab1FnM3ZOMjlPaG03eHQ4bHpDVUFpVVZMSStoQWZOY3BXUDlF?=
 =?utf-8?B?RlU2VVJma2FQVUlPeVloMUt3c0MrM1picERjWGZtaVRmY1NtRE9WaUgyQjcr?=
 =?utf-8?B?MEhNSFA1SmdKRWwzTXZIa1JjYVZNL1FCZWVBTXp2UE5va1c2SWxvUjVVUFRT?=
 =?utf-8?B?VmpDbm5pNVBVelNsWHNSQlFJNzNnejNsc0ErTmtmcGJLOStsdWorc0N5Q1Qv?=
 =?utf-8?B?UlZoMm53dTBPYVlrZVN0aFZ2U1B3MkpYVEVibXUrM1AzbkljdHpWS2Q5Tmxs?=
 =?utf-8?B?TjhrQjhGNzJLOG41MXhPb0FpMkloWXVkcWIveUp5VDJxbHliTUx6SVczR3Rs?=
 =?utf-8?B?U1JSUkRGNnZYeUpOWi8zUGVaQUtncDdKQ3N6SnByZDhibTlqSWR3WXpGM001?=
 =?utf-8?B?a1htUXVFakxNeXdJKzQvTzVmbG9rdjZ3SFV6MFkweUhmNEk4RTFTSEJIT0h0?=
 =?utf-8?B?QXpGY0U5NEZHZ1RIWnJZQ2lNRWpkeDM5ZjJva0FpeUN0d1plcmhlMGRsMmRu?=
 =?utf-8?B?U1BGTWE0OEVrckRGeTQyZWQxZE0xQUFicXFGVWNhamsrdHN4OS9XeTZhdWU1?=
 =?utf-8?B?NmlqMEg0dDZMdHNTekNnTFBiY1lsblVleXJSNldIZk9SYWZKbnJZS2hOWlZE?=
 =?utf-8?B?V1VXK3JkWURiOGRyeVVmL1g4UnJZLzlab21pVkd3YVRrczY2OU9WbkJicUd3?=
 =?utf-8?B?YVArMzJmdW9GZklwYUNER0NCR0kwaHBqdkw4WlNERTVFZHcwY2FianEyRk92?=
 =?utf-8?B?UVZ3WkdzZkZOeTRueG1mU2tlZzlEL1crV1ZHUGkydHR3a0pjeStObDBWSGov?=
 =?utf-8?B?QSs2ZjRqdEJ0L2hmSi9SQlZETmZSZGZFT2NqUCs5Tk0vaGJXN3JyS0xzY29r?=
 =?utf-8?B?dEYyNUJ0dC9hMVBITGt2TzdZNGlXVnhtaUZ2dmlYanptbDViZDlMSXl2b3VY?=
 =?utf-8?B?UjM1V1VGNkNtMUMzaklpV3MvemNzeHM3cjdBUkFvWEc0MTc5bUswZzhzN3VU?=
 =?utf-8?B?ZHJ2eDkrMUk3RTFTZmU5dHpQMVY0MG5lcmM1cUxkdkljc1VSdDFxcEJybUd5?=
 =?utf-8?B?SUZjQStaR1dwNnoyTDZ5cFVlbTlINFk5ckp5ajgvUmp2S1RSRG5EUHRuZG81?=
 =?utf-8?B?bVpZb2ZpdGJhV1o5aVNERXZDVVZMcUpxbjdDd21QYkMxOGpIZXM3WlY1WDNv?=
 =?utf-8?B?UFdhR3NwR1RVS1NnSEJ6V3g1SEIwYW1XSmtVOTNYQUFFd0tVOXlpQUo3UlpX?=
 =?utf-8?B?NlRPYjZkRzY0UlRIWDN6aHVvb1VRZzhHdjE2Wk94ODF2cTRGMjFJTlRpUG8w?=
 =?utf-8?B?eWpNTjQwSUVuRFpHSWdBTjQvRGdObWtBaFBmYk9ndDQ1YVNPak10MXYzaDJT?=
 =?utf-8?B?VFBTQTdYTnlVRTlYNlF6YXJWenR4UWh6YVRBa1k1YllObEFZbzV0eFY4Nmd2?=
 =?utf-8?B?bXJVbWFoSTgrZE5ySS82SEIzWGJ6ejdIQjRIRjlYQXhCS0YyWjN4eEdReVJv?=
 =?utf-8?B?Tm9XdXZWdVZmZmR3ejNwaStOcS80ZDVtZkczQnJtQ1d3eXh6aitHZkVWQzQv?=
 =?utf-8?B?bThiZWN2dDFmc0JZa1ZYdXBPWHVrM3kwRmdyMzF1bG91ZVdLbEd6NGNZZlhi?=
 =?utf-8?B?OHhmb24vQklsbzdSZkk1SjZ6UkVzUEtPMzBNeDRCem4yRGMrNkNYNWEvcTZ6?=
 =?utf-8?B?cTlmVkNTR1N1SDlhc2xvZitIVHJvenQ1MW5makxsM1pITjdpRkNDc0htTVlo?=
 =?utf-8?B?amx5OWR0YnI0eDBVc2tzT0xkbngzTFJWM0JmUmg2d3ljNFBlUWJtMlpnQ2x3?=
 =?utf-8?Q?8smBs/i75pfYcEpj0wHUd9mdQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e3b038-e774-4230-67a9-08dbc44bb469
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 20:02:43.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5bLz8LJ/AwJMQ1W6I95VqDWbD5ymCG80J4HsBxR3AvUPdZntu3bDBOG2XpxNFi4+q27SIbCtSZXNRcB0/pRxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7091
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/1/23 7:01 AM, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to print error, we remove the
> redundant platform_get_irq().
The commit message needs to be improved. It is ok to remove the "we remove the
redundant plaform_get_irq line". Otherwise it looks ok to me.

> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/hte/hte-tegra194.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
> index 06ef349a2265..01f416c881e6 100644
> --- a/drivers/hte/hte-tegra194.c
> +++ b/drivers/hte/hte-tegra194.c
> @@ -730,7 +730,6 @@ static int tegra_hte_probe(struct platform_device *pdev)
>  
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0) {
> -		dev_err_probe(dev, ret, "failed to get irq\n");
>  		return ret;
>  	}
>  	hte_dev->hte_irq = ret;

