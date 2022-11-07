Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA74C433FE
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Nov 2022 21:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbiKGV2R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Nov 2022 16:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbiKGV2P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Nov 2022 16:28:15 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFDCDE5
        for <linux-tegra@vger.kernel.org>; Mon,  7 Nov 2022 13:28:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGKObLxYVF1IccHJUxoBEdJywaD0T+dOf+GgeFvAbI2cX9DK9X7WPVO33b0cNROAKS1yoWyYt2zT1gfwYHHTiEYpI/0+IyrRMOkpVTBgaB58ENonkpmak7789WX6wJmXbvCdGmnUWQNRdL9wt/5mz/YH6K5KWT6+1IODLx5IhLqTM8RTxPOM0OGx0ONL1Wo8+mMtl/iY4umhfE5obCbYXZ5jDtfhaV9ASlfpAQRN5OJawBbzL+I8hQTriANQVEmSvDA40Y1fq1lRB/fpSfQggz9432yEeu2Tqjygl0rzbQjS9Tp20ugM8WCJXMPTn7vRCpEFiazVix3u/MCG2QqcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QWPjwIjjyfEh0odeOwCqzpOUb+MaRLjYE0XC0us1mA=;
 b=mxBiHcx5cbs2WayzHxmxkd+tFmrjuDkqEL4H1K4bR6rh6+KHFsoZfAalPsYU5rGjbfppoxtHGJbm0Cje2ID+3y6syl1DMh6imVohZlcOSwcLRqu39m4zXrDzcVmIlvEGGPxxkH83P7DjljLa94uhyFKNweiDTBeXehWRxBXQnNr6UON9+KO8nGiW3gCFqUsx7gB5zu5CPYf9Gd7uUKqYGF0t+10SUkvzuu11Vf0CsqrMM8SWnGvwtl8iEVQK/7k4tCnrl5IZRCSMp08BKUuo2BI9lxW2ILbjq7z0cVnZOiVWSwuEO/YoBmVftAaa6S4jFYMrAELi/xrenE0qc5N3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QWPjwIjjyfEh0odeOwCqzpOUb+MaRLjYE0XC0us1mA=;
 b=JrJu+7yBksbJZV46+GyHzsMQNDgWJ3ho61SAYogw/U8+WZhBToJ0fSKp0jhKT2lHOIG7vu0wwKbdq3/6SYwQ4vpB8KFvzO7XIhu7FR0eBqM3zImUEvbH6iyq6xYH9tqYNeMfSi+dwHCn3IA+oMFRpftlymVH+buKnyZTe3uufWSp5Cv591Hk4eS6Xvl8wuMY3SBBvQi3DVYcdLIA1OGfyUZ1APJ1lcriVLnqdNJg6/Roc8GMhFZO68VA9HHOByrZVGiJn4vLaQ66s+ncoqE+iQ10awusdiQ8EJcf+jrC3IsqnhvdRD9AD4igStn7tOH+nJGXjbWwImRbVPcsL2J8hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 21:28:12 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960%5]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 21:28:12 +0000
Message-ID: <eaf26959-401c-1c82-e95b-9f8a07f189a0@nvidia.com>
Date:   Mon, 7 Nov 2022 21:27:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] phy: tegra: xusb: Fix crash during pad power on/down
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        Jim Lin <jilin@nvidia.com>
References: <20221010135132.30809-1-jonathanh@nvidia.com>
 <Y0zqKh7B9BaOoREo@matsya>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y0zqKh7B9BaOoREo@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0526.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW4PR12MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1de1ac-f348-4b1a-437a-08dac106f94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: krwUT/im049XurRWIdOoki7FFHU6IQtWd6XdjX6c53VPDTmS6hukMBqkmMXmSDQtWI3r3LWykPkAAnF/zke2P4cDMKJ2MSucbz4BXu/N9PWNmDFEbIAul1Its+ZfOC4QfVVlwWd/cvcwmeavOpeqivV/GwJjK7uOZYKCjSwUlLGcF3ZSJlpeJ2Fy9b/PtvLzggNOsABTibJGFkx2I7ufeb81e7jeQU0iYV2Gk+U86TqNHUhcqPmL6mjTjE5ksHNiWVQNwDEeCUnTnrEHHoM6V8lWJ+UbkG73mqPK0OWCpct2B14b1tLzID18CRabDuRRXDpOfPkEIf9paKqV0UD0R8Z5h8XYTQg+nBMS0wF+2z5V7aMc7cCi1NBa8e+DUVuyC9R4VPtx7zXGnIJ7+sax/VrzXZgviMFDbSAdrN8+r/gOTCCzO7n615PnrN6n1IbwBQ1A+10VbXJrhH1IsCEQwdG0qX7aUX8kQk05PrSYw/r83hr2n43BULM5Z8r1ldm9y36Sqa4YHH8nu5mOuR2fMFHeO+88msq6ok6gD5lqEapNXCHebL9eHus2jee6MDs/xYMESq3bMn6ghlxZG1V6aqPTJp+JH5FKi3uYE45ObgvBrSU+zyw8MDScPWAUWtRhF2Zo7dzQXiIvQ5gTmeSSsg0tV8UZ+BljnIDvgym93a+9yaItCIIpWt7DwN9MBHIiR1/+8tb0j3m0kDSmjjd7ooYfEpKaUebIBDVpfrQywiscwBWGHoiFFcWT5tvlisXIKplDUPSVyouWSKn9SehhkoMDdfutlxzuvs2YE+6MLiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199015)(6512007)(41300700001)(83380400001)(38100700002)(2906002)(36756003)(5660300002)(2616005)(4744005)(8936002)(186003)(31686004)(53546011)(6506007)(478600001)(4326008)(8676002)(86362001)(66476007)(66946007)(66556008)(31696002)(6486002)(107886003)(54906003)(316002)(6666004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNaQ054dDh1c1E0cy9YVjV6NWxha1ZYLzhNVFlIblI4VVdHZ0ZtWTM5RGRL?=
 =?utf-8?B?Q3RoOHcwZWx0MytWV01wdkhsenl1SWRWbGdIR3N5ZGVlYWN1TlZFYWxVNHdm?=
 =?utf-8?B?TmFGcmdIaVZ0eUtkclgzU09ZR3hDcE5TdFVpNFVkZHFHbHJXak9lQmNDd1k2?=
 =?utf-8?B?OHRDMnVPUzVNM2xSTjgwMzZidW5UVUlualNHdUs0ZHlIcExMeSt1YmhYSGtp?=
 =?utf-8?B?Wk1kbzkwbVo4c1VWdnM1R0xwU0ZzcFdZcVNFc2dTVTJkaURRQnd2ZThiaEtV?=
 =?utf-8?B?Q1QwMTN4QVdOeWQrK1UwQmxyWm84cHFoR25CbXo3VkErd2pPZit3OFBJWkVF?=
 =?utf-8?B?ZFlSZnM0dTlNeUd5UkFzVUVBNkM2UDdwNzdOSTB1ME0xK2NyYnVRQjFwUy90?=
 =?utf-8?B?UksxaTJITG56Rmpuc3pCV3g4WFpLL2hlYjFDdFdQR1VCdUJ1L2Q2Rzg4UU5N?=
 =?utf-8?B?eDBNNkRhNWN3MG5aS1VLcTNKQjdGVDIxWCt4eGRnU25TM1dydjZJMzl2THY4?=
 =?utf-8?B?ZjVyUzRuSkNmYngxZXlaYmtOc1lLa1lVclVCYnUwSElxMzdvSEJMZ0dUbThV?=
 =?utf-8?B?L1RoRzFGa1AyZHdrenRxOEVvKzVMTkVQeFppMnFOZjk5M2d3MTJxL29Ka1VT?=
 =?utf-8?B?MjdaY1owOUgwTTBCWW5BZGFlYWJNV0VDNCtqM2M3QzVNSzVER0hUN1BHVHUr?=
 =?utf-8?B?OFlWV1pPWGdUbWsydlhtd21JL2JXY3QvMjYvdVBvT05SUnFrTjc3YU1ZRzJN?=
 =?utf-8?B?cjB4TDdnRm9FRHlCeEh0d0VFZWdaYzFQTU96M0VobCs2VUdjblZYTlVIMFow?=
 =?utf-8?B?dXFjdDJRQUVUWU5HU2kza2I1RUc1c2RVT0FDTmRDdXhySGFVdnl5eEsxbkRr?=
 =?utf-8?B?MUJjK0s0MjVleXdnRVZVNzVPUDZqNVJFY1pHV0NrcS91UHpNV0tzOTVWUDIv?=
 =?utf-8?B?dDIxYUZUR1ZOa2VxcUw3OVQvTS8xN0NmdzBUV2M0V2o1dFpGVys3TkRWNndH?=
 =?utf-8?B?UHduMVV4WXRDNnNQUUVYQU12eTQwWUozS2psV2lieFZXRDR1NkVvZDQ0RUdH?=
 =?utf-8?B?MXFxV2dscmhacUNydTMrTFhnZzlwWVdWK0w4RnRjTHhxdHQvVk1pWE41N0hY?=
 =?utf-8?B?YXFnWEVDUkh5OFJJYnE4MThxQzIyZ2ZndytqRUNHYnZwTDhZL3g1ek01bjNr?=
 =?utf-8?B?REs0YVBVR2EyMDJ1UEk5OVRFTS83UVRoU05qY2ovTitWK29ZWExLT3BxanF0?=
 =?utf-8?B?aVFTT2oxTnVBTWhNK25XNmpWaFI3VWlDQzgzdzJSOVd2cHIrVHEwam8ySm9j?=
 =?utf-8?B?TFdhR1JJVXNxRDYwd3JML1grVlVoWVV1MkN2R2ZBaUNGNmg2ZVpWaWNTUnZI?=
 =?utf-8?B?d3Q5bURRdTFia0VXSzhXeFVGT2l3b3pERTZKTDNTSWdpSGVJVG9IWTY3QmQ4?=
 =?utf-8?B?alNTK1dvQWhUVElPc2hPbXpVSFJua3lCSDZCeEdXUzMrNFNYcFg5enl1QlBJ?=
 =?utf-8?B?SmhDL09pZytFODJheVlIblhWVnJyS1lqKzJsV3pzUkpvdGJpckdzSzFkK0k3?=
 =?utf-8?B?c2UvNlNJUXZvaXd2dSttNi82ZVZBbEc5a2Noa2h5Y2Jxb1hPRFptRENZSE9K?=
 =?utf-8?B?bGVPR2ViQ29LTHk3azNZQURQS3NKYytxWVVsaHh5d1FQN1prTzF2dFV6YVZQ?=
 =?utf-8?B?YVdZdWRrTnc0di9nMTk2bGRiaTh4dG5HS3pvbFhVbDZEcGFtYmxzcVFKUWd4?=
 =?utf-8?B?U3ZlSnpxMVVFK3F0dHd2ZGNEbGtUdU8rd1pYM0VOOEJodUU5dGJJbXdLd3dP?=
 =?utf-8?B?SU5Ja3kvbmlvRXA2OTR5SFZJQkJBd2dySVFxOCtUcWpaYmJoZHZNWjlSSTZ6?=
 =?utf-8?B?UVMzQkxobG04RGtHUVpXRFhrMENteTVXR29sRDNjYzFtd3FNUWFJem1ieUdV?=
 =?utf-8?B?clZSTzQyUzNYNGIvY1VjSDMzVkJ4VVgyTGVKZGh1dE9wTGREL3AxNWtOSGRl?=
 =?utf-8?B?b0VHTzZoRzI3d3UvOVhCazJCZGk0UGxBcXp5T3lMUlArbXVTb09CWnYvOE5Y?=
 =?utf-8?B?TnhUV2YvSG9ZOFZ1R3JSWjRybmxYUU93UkNmLzFZa0JQbnpQTU9FVlZFVzcx?=
 =?utf-8?B?UEdIVzd3dnlUcDlyV0I0aDRqWG4rMk8zb3VhM0FaT29CUkxnVjVDOXBZOXEy?=
 =?utf-8?B?MTRMVUdFWUk4ZjF1UldMSkljTDBvSVpBaGZodmVjcXhNNFIwMmtGdnpZNjVs?=
 =?utf-8?B?RWZmTG05bDVLWmZ3SHhJeTdkL21RPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1de1ac-f348-4b1a-437a-08dac106f94b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 21:28:12.6363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOMVkhlHjRXre1dzkaW5sKVQz9cNt4E/jrDKLr3767NAbgEs9GB2qxzcKQlLoLSg7fFodchCjfR+TPSul45wjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6802
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Vinod,

On 17/10/2022 06:37, Vinod Koul wrote:
> On 10-10-22, 14:51, Jon Hunter wrote:
>> Commit a88520bfc0ec ("usb: gadget: tegra: Reduce pad power") added calls
>> to tegra_phy_xusb_utmi_pad_power_on/down in the Tegra XUDC driver to
>> control the pad power. This change is causing a kernel panic when
>> powering down the pads on entering suspend with the Jetson TX2 platform.
>> The panic occurs because the 'xudc->curr_utmi_phy' is not configured on
>> this platform and we do not check to see if the pointer is valid before
>> attempting to deference the pointer. Fix this by checking to see if the
>> 'phy' pointer passed to tegra_phy_xusb_utmi_pad_power_on/down is valid.
> 
> Applied, thanks
> 

We need this fix for Linux v6.1. The crash is still seen as of v6.1-rc3.

Thanks
Jon

-- 
nvpublic
