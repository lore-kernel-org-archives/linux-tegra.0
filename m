Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03649C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 08:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiJGIqv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 04:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJGIqu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 04:46:50 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABA4BBE1D;
        Fri,  7 Oct 2022 01:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKPOQgg2PazUqSlxUrCBk4RvtmYNxXHqhJz7lfW1HeSVwZPmalCNChm/nGGbwVieizy/08daYlfiiYrkcYxMM5xQdIf97ovxc6FD2GeSdchBiXw5kk3LJ35WqkQxjd+PQTUmzjsbnuCWwEXhuYJgmr+B0cBhyzqFljxuNqgBr2cf3+MWaiTBijSwrf37frDk6HYXTozhWwhTHH3Em5e1Bikklcv5OzEjZK6jP7VRbRth0yzSoi/O3ku2IIJ1CIyzkXu+x5uUtaDoR2jPx8nffDBGY0V4JqS2ay+hdxsrx1sp4dukYDNFe/VSS9NuY24c7z6oObYcsl/0eGi1Or6jmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h1W8YyMaxms2iT9HFHU19+wBZf/TVErVYrdz1mZMRk=;
 b=FyWQ+VDOo2akspHZVrlwBqqzWts/Ct0bRXLTCfb22A5DjyoJk3/hs45Ze3h1PAFH4gd3lNB/RM4pvDal38VFglZC/mHVIJtiapTm0LvCYHz7babk5a+Dx9u1sXfWAV7WR1HMGKOAm2jMomga+UA2o/CElW2qbfZQjiVWpulqgMw2qasj7KeXfDhuLXNOIQZvMhbIFj7MS0QQphhjfgezQRLg4alYGiAfZRF0IX4j1oWld6mz+ct5sR9yoNOSuGlByJPDxZGdgsQKu+YiFOeyRSt8dxBfB3A3gqCUXwS2StznJfyEZYEDCBXH3wtqpHxNNLyi1w7JajEOVleNVnNzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h1W8YyMaxms2iT9HFHU19+wBZf/TVErVYrdz1mZMRk=;
 b=kIIO1+mJA9CigZ/w4HAqKhHWQ7hGilaz1Jr0U8wHUPqsVdDXFR675kSsveZIW3SSkfJUuSSEIi/Fkp4ZPaP6tS1Nxa5kJ1p+BLHkxvqS3PLSPKuDU0O2WIMC8lYhUI4QXyxx3hA5iwo/gf5L2LW7BhCbJUlRucE/YyaAkElsNp9ciC8uAWIN1vpGM/6DydWcgSsIsS9kg9897vUr6QawY4qYN9T4QdjzPkU3Ztkxp1kHWxnWnYEJH5Q+xC6QG85+fSkFjDUn83dsYbdJcOOBCjX/ReMHHu8i+Nsy8yVXsgUYcbFQ6VZBiqFVmzwMJQD8+zOa+t+q/7OfKLFsgU4YHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Fri, 7 Oct
 2022 08:46:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%5]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 08:46:44 +0000
Message-ID: <5238af65-e207-c23d-c1e1-93e09d8268d9@nvidia.com>
Date:   Fri, 7 Oct 2022 09:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: tegra: Fix Tegra210 PWM parent clock
Content-Language: en-US
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221003101555.25458-1-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221003101555.25458-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BL1PR12MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4ab974-b2cf-49ca-4268-08daa8407636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HczvK7BZN0NbvPGbfNeLYguEeHY1knqwRwHANqOy64nDdPJodZbw+nbKDvrqLXVDJldI6MKEa4WpCGUKf/UL2hxgbFnzFIpg3xc2JsxefrD6C7HYioh08jCg4j3w8X/dP7ihaOAzR9UKqxG79vkKER1Ct59bMt3kvIHmZUIO5tlI9UHUCFFTbFMqli67cRxLw2kdfnD5ct2Y1hBk/MlHb0WnPFZFHO2YYqdSmq+MvzH36croU1QLkQx0jAsWFCFBlFGNeWCrqVxVJLf5DRxx9RcPeF7dZ9oo31pP+ObOGefTDG/tx8SOQywsXBxns2wF/0pvsQY5LprIy2L090dSOQsdtT2jA1QqoO9jHYG7m2SE9Z8t2KWi+YFY5qATIlz8f111f/IJch6OSaxXASa5t7ecCK3mgCANipWyEKmE2lZnjPXs6BprqcuJzdoEpONssixEJMKbBA9qIuxA+1l8A9+bTutfv1HK524Fl9fcUCOf9U6pSilcO3dJiFJHN7m705hNaLnKgHCDwdXgT7VWaickL88lwFRhA446ZA1LSWiasEYpybCVasmrAceEJev0SDBFR2NSjAWNwI8JF+6ZJ/Pmvz8pZYmqDmmzxEG7xWtzEVNEEW4K2VVhs1VZGe2LlQLOJeORpeCzGTrSLS0Nn19oK+QOt4P0ZjRHmYsfT5SmubM/XqTx/zueqDTJLA4cEM9TANw5jgx0BAbgkQlVbAl2NemKsVSFwNLKXA7QxO9Yx/Vqfp5WT9jA2dRahzSM/FTP4Wgzv48NpRr0qBdzfcgSoGwmGe8iVxqzXWFJ+/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(31686004)(2906002)(31696002)(8676002)(6512007)(66556008)(41300700001)(6486002)(6666004)(6506007)(66476007)(4326008)(53546011)(86362001)(4744005)(110136005)(36756003)(38100700002)(2616005)(186003)(83380400001)(8936002)(5660300002)(478600001)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZtUkF6SVYveEJ0eHBDRUF6K3NicTJmVUJBVGhqZzdabHNEZGkwQS9BQTh0?=
 =?utf-8?B?OGpSa29iOHRUdkdnZFB5a3RnUVNoNVRrb2hXdzNma2ZqeUphcXprS2ozMmE2?=
 =?utf-8?B?TnJlZTVSeEFpcVd3eEhrTUlmaHpzSC8raW5SZE93bkZrZFJ0QmswUU1xd1BV?=
 =?utf-8?B?K2ZKczE3WjNwRXNOWjVJWkM3RTNEMko0M21SWFpiOGpJenAwbzJPU0V1azNr?=
 =?utf-8?B?TXR6U0tKdDR3UnFkRUpTSVlVSkhrN2QzMEttWGluWnRsRkdtdUpuSmNoVFNo?=
 =?utf-8?B?d2RJa29icmFyRFh1NlBvNUhwR1VXdWZrUFBkekVINE1hR3JtWktxUTlTVnpO?=
 =?utf-8?B?R0NTWXJRODVCSzVLQkkvNFlRNzE2dmQrL3YzSkFmdU42a0RoTC9JME1GOVhU?=
 =?utf-8?B?Ri8vVFhVckJxcWZXK2RUYm5Jck1Ubk1qWjgyNWUrVUlJV2hENkRHOURyMk5P?=
 =?utf-8?B?QWdiMDYvc0ZTVDhNTER6RUl1ZXYzcXVpbkpEUUhFTTNwM01lelY0RVIvK3FB?=
 =?utf-8?B?RDFhYVBsbXpYMjFNS3JxWEVTeStvMk1wUVJKbXRxd3lvNER3bmFCdzYycG1W?=
 =?utf-8?B?N0lKK2trK05YTHFhbTFFczV6TGhSa2x3K2R1SHBBeVFNT2NVclJrQWNiMkpB?=
 =?utf-8?B?QTRlR0ZQVjM2QU1Beks0S3lCaHpVU21panZnSm4xeTAzQ213REFoZ0Ewelhj?=
 =?utf-8?B?Wk1uL01talU3T1NzNFlyb1pBQXdLdm5VdVdjVTdjaHN4a0M4eVplQVd6UGxW?=
 =?utf-8?B?aEVKVU9KSzJkTW1BRkxaYUR3aEdYWTB5ZjZqcnViVWlvWU96Yk5UZDF2Tm1Y?=
 =?utf-8?B?S0pjUHk5NVRtdCtjZkh6bkM3QlVJaFpSNWVpb241RFVZZVpENU94bDFYTnBr?=
 =?utf-8?B?Umltc2dpazEycHdrRFpKVlNhdFlncVZFamVpMUxmVjAzajlOWFhXcjBpTUlQ?=
 =?utf-8?B?THUxakw4QUZyemR5L3NGSGprZzNrOEN5eFZUNC81dkYyRGdMSmNEWHI4Mzk3?=
 =?utf-8?B?NVpaZmkycS93TGJKRWVvaGxVTktQeEVYRTNYVTk4QVpFeHFHd3k2NDlpQlNV?=
 =?utf-8?B?MlhqVElwM3EzTlF5VHRwanQwdVc5ekdGZDdXcllkTFZmZFQrb2IxNGRQWFM2?=
 =?utf-8?B?UW15bGtlb1VCelUxYUpsYkhYTUZUS09JTER5OEhZSjIxTW1nRUkzNVdkanZF?=
 =?utf-8?B?Si9GTEpCa3Yrd0dOK2xqOFQzTDNTMDN3TzhOMTZuaUJHOGRQY0V5dS9lWFo3?=
 =?utf-8?B?VFB5Zk03WmFPUlRwYmoxYkRHUVVYazFZcmhpZjMzUjc5dmtpV05JUVN3aCtF?=
 =?utf-8?B?Y2k0cEtuZjhySmdPTXlCbTM0a0hKWXdkcnZjM0dJQWdtbG55S203SVI2ME0r?=
 =?utf-8?B?TEMzd0ttUldtdzJHcjRKTmpPYjJWYVhJOFpEdFpxWERtemhJYjJmOW0rTHdr?=
 =?utf-8?B?NXNUVE4rTTMrcUdXUWM5dC9BQTZ0YmNHVEl6SjJ1N05SVjUvc2RnNzBxK2th?=
 =?utf-8?B?UjAwTGtwQTh0K1J6em1JS05CZVZkY25mNnpLWUFGck0rQVNPYXp5Z0Y5Nzd4?=
 =?utf-8?B?cy9CcFFDMm1tT05xaTZvZGl5OUw5S1NGNlppbCsvSnV2UG1pd3QzRG42VWFm?=
 =?utf-8?B?OUlKTmtJRG1SN2xGSVVrOTRKLzl4VnpCeVRPSnp1NnhMOTZvdHQ0aS9XQW5H?=
 =?utf-8?B?TlN6YWt5TDJrbnFWZzlKeTVGQm9ucWpkM3lmM1BzSm5yTjViRzJiMW5PbnZ6?=
 =?utf-8?B?SnkzcDAxMzlKd0JOT2FESWg0ZzBEaW5FcjJFY0x1NGxpY0JTOFdmeXZCdUta?=
 =?utf-8?B?dVl4aGtGZmpGRmM1dFJWL1VSQytoMHh3RVpkb0RqYk5VM2ZJUWQ5YitvMDNJ?=
 =?utf-8?B?d3c1RXBBQWd4emRNRjJJTWRTQjcvdEFTWmdrRUJoZ2hva2ZjNkRUbHRLZXRR?=
 =?utf-8?B?SjJLb2ducmtlWTl2VW50QmVjUy9QVHZUa2tyVnV5eFpnMmprcnZMSzVFR2ZZ?=
 =?utf-8?B?REM0ZDhtd2xTOGhGTGRqK0gzek1YeFovYkxiRTlwUVdOamhNUDZCeHBSWHMz?=
 =?utf-8?B?ZUFlcHg1Q2doNEozY1BDUS9GY3pnR2M3SUFPRmZPZzJVRGg4VEdtZnBKanhH?=
 =?utf-8?B?S0JSMFFaT2dvS0JENnNHVjN1VFpCeDFJNlE3ZHJ5a0luUlZjUUdERlh5V2dW?=
 =?utf-8?Q?bxibj9A0QCmjKrZO7nkl3rBmjudswVbAobJ6NLb25CFS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4ab974-b2cf-49ca-4268-08daa8407636
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 08:46:44.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fq60XnSy8la0FP9cUfCZWC0rMQTRHD9UKvWRxWJqiY6//6vlevcrVDNTynPjkUVnTZj9AXsEIv1Twck6fWBp6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5174
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03/10/2022 11:15, Jon Hunter wrote:
> Commit 8c193f4714df ("pwm: tegra: Optimize period calculation") updated
> the period calculation in the Tegra PWM driver and now returns an error
> if the period requested is less than minimum period supported. This is
> breaking PWM fan support on the Tegra210 Jetson Nano platform and
> probing the PWM fan driver now fails ...
> 
>   pwm-fan pwm-fan: Failed to configure PWM: -22
>   pwm-fan: probe of pwm-fan failed with error -22
> 
> The problem is that the default parent clock for the PWM on Tegra210 is
> a 32kHz clock and is unable to support the requested PWM period. Fix
> this by updating the parent clock for the PWM to be the PLL_P which
> operates at 48MHz.
> 
> Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>


I have sent a V2 on this to fix the PWM support for some other Tegra 
devices.

Jon

-- 
nvpublic
