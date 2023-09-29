Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02D6E732D0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbjI2Kiz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbjI2Kiy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:38:54 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EF011F;
        Fri, 29 Sep 2023 03:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhjb0MuGVIXihmQ1RO0OAC66ckzx5LuANe2pHeutHvUtpUppwcY8ZHlGLuKs7wur4+40KlY8KtcXXmXy/RnoQhSHMcvDzmI2iztPe2KW/waVpvruyaAlnfoKuaZA9fX5EZSUHMLbco4BK7tACWzCTUCstmahAa33/EWERO5YnSuQtFoJa2Zqou+CySNmZcckFLHItM+Uj8Fwt/FmBHE3ey4wJCm3JZL/bx95HEDqeBsn3Ur105lHdG7R/mZ0aH9hZsKf4P98x7l2I4XT3Qrp8pdL7svfivP7V8cX3qxaYR0ZfHrC0FG+K1L/53n4ho8VCAzfqEBG7Ey7P2jpjkmUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LfyeFRPyJv1zH/zwSJPA1tXhsshlDnjI75UmUF8aW8=;
 b=iiXbmEeK1wLUd9mgFi1EFaheNN+hxaeKHSQqkLBVCnFztF6nvsWVkLM8NxeTc2nk7yGJyeo5DbctFrvrCabXK2UgYWr/0GkvCPNoGG1VHFVT9lhaZkf/VgGTPh/BNn1XHPnqMYFZYd8byyfIrsbFPD1hep46uW8cT9FwsHgz5vcnUOHCuliMI8U76rtQ+rCSZGLGHdNdd7TmjsuueEtDo2Jh1lKCYYhoBtIaBehLX9DwOVFQqRNt8Ti0eW1UFoKyAfFQbOCyEdfVNUUjiKcMJT87e3FXCUmDwkTX7f4UIviqFxoplMJg8G3xXxxEPVw+60mdNJLn9z/yi+cjDAl74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LfyeFRPyJv1zH/zwSJPA1tXhsshlDnjI75UmUF8aW8=;
 b=DYFsUQWBK9DqmgyVq1zl83k8kcwd2BMBHOLpbsPr2kHd7x+y2bqr2bdOiD6I1H8aXH+cdTX10VlhQgmM9BsilzFTwW1l9TRNkT1ULhWwqs9WdOv83XXNG2tNSvp895sb8+D+rJtibyIOC1XRMZ2aKHulF3h/4ARlhvPyrn/iUqc2DZ+5rYv/n1KQ3fCdO6r1J2i7Vh8T+4PdtADvt9BpJyCPJQZpBE7cdE09RBrPIhTlOIRP9pEaBxZ0Tj/I4YhOXu2UNdD2kYy9TeC5810BCrtDdJ7QYiZJJ64VSP04EhTbOCZ2d41ToLtPEG3GfIvvLlejGolS9kiM6d32QC0tkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH8PR12MB7352.namprd12.prod.outlook.com (2603:10b6:510:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 29 Sep
 2023 10:38:50 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc%6]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 10:38:50 +0000
Message-ID: <903c1ca9-f1fb-845b-86c4-86f7225901ae@nvidia.com>
Date:   Fri, 29 Sep 2023 11:38:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4 0/4] hwmon: ina3221: Add selective summation support
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230929102744.84989-1-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230929102744.84989-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH8PR12MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 768e1a65-aeba-4a21-864a-08dbc0d844ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zikoY2cchbS/5QwZenKQfxLCFdatqHQRqGl9gKVBCV6GdA3Y/6DL46Mqe7/d7dLnAHnJl1p+GimzxNabSf31ctjwmJWIugoKlam1+lYLYf2spar1++Kcma1kaaU8xjpc5aekepQVQOdnecVD/7uOhEp1iStSABDfBSHbT3tobdfAqOgla9k5SpLMgfbxNxbhYWZFYxhP8nN8nWq3fXZ/Ad9ZpuUdJ964hmsAwc1q7K2827RCJHa2Wsio6e4SRhQm2CQFd5E//9F76zp079xczZuXNhRkgty5Cyj/+8wYEfN5chAjLJBLparpP425af/+kNqVRbg8x2tB/1/L0BW0FtzgArOTMCFTD8iiHvmUXYWpH/32A/4KXOZAFHhCcJzFyI8DTmBaZ/evpH9KscT1jD3FndkoG5HpnP2Fwj6uTMqK6HuHyJHJPS+U5aZF9rsMveBGed8cEa5a67QDWwySHq/qRrQZoZtTa1Vmlw/ynCviXiHjJ5e3upa8we1B5XGSMs3IqgOibBIMxD3jr++ZJUe9bI1IMPPVNbNd+tYWlPwjVYCL3dVTB1P2rkC9k0/r/PwkB3z100FUEH40Gz1E6UB3iHx3GsioUh2O4MSuKfO1a5f9cyNNzGXnjTADJz2ng6AesLJ2bhL0vlGR4ZM2Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6666004)(6486002)(478600001)(53546011)(6506007)(6512007)(4744005)(2906002)(41300700001)(316002)(4326008)(5660300002)(66556008)(8676002)(66476007)(8936002)(110136005)(36756003)(66946007)(38100700002)(86362001)(31696002)(83380400001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejVzV0lYNEdNckNFR0ZadWJ5RVFObVlOTCtlWDN4SXJ3aUVDS2Q0b1I4RnVC?=
 =?utf-8?B?eDRsK2E2M1lPRVg0UGgzOWJaWjR1dExJUFNlOFJxY3R3SE5Yb0FBWkhTZXhz?=
 =?utf-8?B?ODZhK3FWSTM5OXRZbm4yZ2Z1aFdVZzBvaTIxQVpGbjJQNXdnRDJkdTBkaG1o?=
 =?utf-8?B?RCswSXpmWEtpT3VzWmRDZFBibjFIdVlibW1LRDhENkYrTjJPRjVsdXdRaCsv?=
 =?utf-8?B?T2RlVzBvMzEwdVlucmhNTEwxM2ZnTXJmVWJVejl1eFRieSt1U24zRFpXODRr?=
 =?utf-8?B?TnVNOGJLd3hlTVVxcVkwNWUwa0QxNHZpTjd0K0k1QW9sSXNxUVFPNlBDTlpn?=
 =?utf-8?B?L1lzU2NDYkhPMFFsVGtTRS9Hd1hOV0kxZVVVRGY4RkVnd0kwaG5RWjBjYm1V?=
 =?utf-8?B?azBIRFk1cGNrL0JvTG5uUHVQNGxkS29IVzUwNXJ4N2MvcFBET0ZoenlER2ty?=
 =?utf-8?B?dTREeG1HdndRNmpUeHg4cG41cUpVU0R3aVFHUTRxTnV0bGxGR2NIMHdsbElU?=
 =?utf-8?B?QWRmakRFbENiUmxSNG5EQnJHMVBUZ0JCbisxSW1SejI1SEgzeGJ1QXh1YUtq?=
 =?utf-8?B?dm96TS81bEhvYWxGK1JkaEc2c0ZYaTVUUGRwdXZDU0dnTk9KN2FWWmFSY294?=
 =?utf-8?B?WXNpb3l2YXk2ZnZQb3ZsWm5HUzhEOVdJQzhHaURaZCtDYlFEa0RPUjhlQi9H?=
 =?utf-8?B?cEhjOEg4bzJucm9LbitPRjA2U3o3b2ZUTFVFblFldGcvS24zSEhQZURKOVJy?=
 =?utf-8?B?U09rSzBqZnJFMkxHZFR2QUxmLzY2M3hibUUzL0wyVGJ0T0QxY0NRenJMaDVD?=
 =?utf-8?B?Wmc0bktGa1c4RVJvN2dqc2RlY0dOT0w4SThZOW84Q0dkK2JOWDB1aTQ3V1Nn?=
 =?utf-8?B?akZDekpma3JtNGVPSTBzR0VleHNOMTAyQU5wVmUybFg5ZFhWY1VVR1oyWWlX?=
 =?utf-8?B?U1c1MWc5cFltOThlT21aR3JCdHA4YUYzd0tBd0NYemlvNHlxblF1K2xYa3Ri?=
 =?utf-8?B?N3BiSkNUYW11QkxCODlrcUY1U3VLMGdGdHM0MDJCQ3NTWEg1Y3MvUGExOUQ4?=
 =?utf-8?B?SDNDM3BxSm9tZHltRE9SYisrWGxzVm5Pd05uVnhndVJSNklRci9ZMGxJbzBU?=
 =?utf-8?B?WkYweHY4SDF2azgwUWU2NmFqSlBUVzhxUi9SZUh2aFkzbm43VUF4R25YdUV1?=
 =?utf-8?B?UzBpVGt2bG94K0MzZk03WXcwWE1pMWlkYTlkTHlnaTJ3V05GTUxYTlNTL1F1?=
 =?utf-8?B?STJzSVZKMXR3RnpyK2RGalhndUpqeDVWcSt4c2lDNUllUmdUSlo1MFdvL0w2?=
 =?utf-8?B?bDBUOEhCdW1ZMnNtNzBvS0MvVE5hSTJWZ3ZCMEgrVWZ6dVl3N21wL2U5Slc2?=
 =?utf-8?B?aU1zZVc3U3FOTEZqeXhPZWZJcE1WUEVFcDBsS3lBWmR6R05rMFBaWURKOTFM?=
 =?utf-8?B?L0s1TUxtcUtnLzkrU2xNTXk1VU1LdHhrWlZCU0RNbVBIaW1NS002bncyZnZ6?=
 =?utf-8?B?T05oV3FzYmZFb21yM0xjTXUrSkZMOVJ1bWpqbTloaFVUeUNOZjBBSzJSVHdF?=
 =?utf-8?B?R3dOMlJRRWN6MlcyamRza0IrQVZya2dPZGRXem9DanVJMGMrRWRTaSt1aEhJ?=
 =?utf-8?B?RnFXL0wxcGZqbVh5Smx5OUEzVno2WFR1L0Fab04wZnJnZ1lwSWlsdG1DTGRh?=
 =?utf-8?B?N1gzUTUyOXQ3RXo2WURkZ1krQlFpUi8zSExjUjlBb0JtQ3NPT3N3SkptY29B?=
 =?utf-8?B?NFJrRGd5UjU3ZkdBbmRBTHRaa285MnRNTFlWOWxkbjdoWlVTNzN1cUx5TEQr?=
 =?utf-8?B?YkZEMmsxbFQ3TVhkbjNUSGNsSXlBSlJKZk5INGxyd1Vza1RmdjJaQTY4cGtX?=
 =?utf-8?B?NHk1eWZqOEJXd1Q0WmtwUlpTZXZUUmwxWmNabXNkK3owQTA4ekpvNHRXSXZV?=
 =?utf-8?B?OHRlL1lDUVZ6c2ljaTJhTTNkdU1nMWlHbHRTL0YzcHZYeDhKdXFEamxDanlS?=
 =?utf-8?B?dmE2Y3RQZUVZbVp2V2J0TXE2RSt5ajhKVmt2djJ4bmlQVkhKOHVleWkwa281?=
 =?utf-8?B?WUdUdGRyalExbmxNZkhoeWpYcVNJdEJwWFpJL1V3aG1mM2o0ZlI4dkRpVXY3?=
 =?utf-8?B?bmd0dkw2Z3JpVGpKWGVIMlA3Y0RoZjVWVnRmRCtCYlZSUFhBRzIvWUJ2Sjdo?=
 =?utf-8?Q?0JtqvNbruzPjIRWxPr2HQxwnlFrdyTKtYKs5+hYeL/fO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768e1a65-aeba-4a21-864a-08dbc0d844ae
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:38:50.3195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1AbOICBRHqnsgehkSoCN3zMg2//Ix/yxGWvinm5vx3NohRzxseMixF+qFuCpM/ld7TIgDLN4MCs2lcct2sSUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7352
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 29/09/2023 11:27, Jon Hunter wrote:
> The current INA3221 driver always sums the shunt voltage for all enabled
> channels regardless of the shunt-resistor used for each channel. Summing
> the shunt-voltage for channels is only meaningful if the shunt resistor
> is the same for each channel. This series adds device-tree support to
> allow which channels are summed in device-tree.
> 
> Changes since V3:
> - Added missing descriptions for new structure members that was reported
>    by the kernel-test-bot.
> - Added comment in the ina3221 dt-binding doc example to explain why we
>    need to explicitly disable channels.
> - Added more commentary in the commit message for the new DT property
>    to explain that this property does not change the behaviour of the
>    driver unless it is populated.


Ignore this version. I messed up which patch where I added the new 
comment for the dt-binding doc.

Jon

-- 
nvpublic
