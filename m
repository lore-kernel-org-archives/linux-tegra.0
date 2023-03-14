Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E4EC6FD1F
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Mar 2023 18:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCNSM3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjCNSM0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Mar 2023 14:12:26 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B248C539;
        Tue, 14 Mar 2023 11:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKb2Foej0xmf+6yUM4ZMp1SNulAEaqro6v1WpqeLENUAc2LcerslODYpIUVlIQCjpXIyZ6Vo87dKSxYi/zvL+8YS46OrGODiXLqqwr80XA4s/VcwW3ue3w7tBG8kP6cj9Y4KkaffXesN4ox2NTOwUCq9uW3Tn6KCXWVgoUew/Kr+lkA2cvh7OvDPzwQlLeekW+2vnO6Fvmsagl97gCCAHX6PnY0tpC9TkXvspCTO5wRHmXVng235iXOceYPuzQ1b+0atowYDB1t6/WVhJa5KtvuVMtV7kJXrPn9Z/hKiLA4VDxpPEncKXAvHHmwXeFH1a2OKdLl93lSpQupaVXRuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ircwtIb7vB8Mq1O4gP+Chq+LloMhhN2BrHBd4heJr4=;
 b=W8wFkOSAZlCEwamXuNhw4p3v1H2TwoqlYvjzxIEy/9a5bt12SbnTbkePcsTpFjkI+6nYiev2Lx49sINVLDS8jE6imSO0vqapoPingOABlv+3zkyPvhCc9LYneYML3tb0Kh+nQzsOVNBfDGMSTGuwpehhQhalF0htdjr5+wmJevFZdSYF7vtG4/C5TlL9I6KD+f/mHtFCb0hlC1k5Rx7u9uiYcPJ6AwCC+0JPbXhbHVIw2wgihFAUMMQgEI/Ty0AEIVhKvlHSCzdNLBqrEqi/D1NAOwyOGHJZlrnvkHvEkqmT5gUlthN0rMCAUw66gHpCwHCX/2EpvPhakI3ejAb8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ircwtIb7vB8Mq1O4gP+Chq+LloMhhN2BrHBd4heJr4=;
 b=TZIKuzWnQfLfKdQHoUdmLsDVsL5yzJ+oDvO0ksvj0vrpaNESQuXVDg1uF3p/J7GDvEPVK7LJIBYxZDu+9ZYu/+zqV+AQUBEeCp8uESSDRLVIF6pAJTBhKHTfn0csdos1sKjyYZWY4n//mbY+7RFxvwcmZxO+vJqhvmIvIcTnESdc/EnYzPW9JL4G5n9z1SIWW0SO0/UElK/LrcSjhRz1AL3sU4F7oScL9SSWr45z/OqeKQHA3nPSlzJi5QsRpHodZYxhmW7AJrDEcYiTpGrCg1rFkzAjEx/MupxOmqnCj9Xhi50UPPz0f9hkvwvKJjvqA7LMisLIluM+i/q1rodHbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA1PR12MB6332.namprd12.prod.outlook.com (2603:10b6:208:3e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 18:12:17 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%9]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 18:12:17 +0000
Message-ID: <c9fb8b45-566d-c82d-7d13-cc0ad85c285b@nvidia.com>
Date:   Tue, 14 Mar 2023 18:12:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] arm64: tegra: Add support for P3768+P3767
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230302093353.3873247-1-thierry.reding@gmail.com>
 <20230302093353.3873247-4-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230302093353.3873247-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA1PR12MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: bb32e9af-06df-4698-3790-08db24b7a556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iwk+YuMY5Au6GPsJQcuzUurROkMMb1FcpFikUmgTxXB9mNMgykpdEpnvGS24GdcT+4E0jWeffrZEMIw+ndhbp1BXTzj1IfjAGDkwTskwAgh/rOWfzm63uQMTIzX/VutWy0oArK9Xi6Vgn0q8uXsMPzuWO2E4EtkZ+kbWoL+PBAOP+YA1jXNWjaQT8bzJOc7HMgagdHnUNv+dvwz30wJGmKXnvvlOn57bZxys4JIkQg9cp5eGlsLQQ3Bhin8kHI452hphgjsIn90rmqkzGNar5ZmOeE6isLBJg8pJmxfgkA92vZ5E8gWD0BYJm7h+wvEDMN+d4lx3M/707qNhuu4aSLyHC5d+lDT3oyy/VmUAQMdHFj3GvLCe6LKt5QxPnOLLPJghs9rMAxIG4iP79t0+2j5CepASADnZSsaA3Yzaj6jfGAxzaJZTBdwh6MyucloxWkhcXsPGCpxD/Hfc6c0s6tc7b+6oupIbOh61++bqCn2g5D6kVpEc8M4W4kAiJk/c1uWQQ3KywbQ4SOpp8I3vtu3jUg+oA26Wy83nFdxmLcPxy4Lx5qUJaZK9Sz8pBBhbYfuG3KA7MibqqYrexO1o5WxyEUWv+CvmksBKAlYsOp3pRA+ojasWbQmsw5Y6oNSs5PZmttBOus81kgaonxnjwHtrgxVbg4PeO+Ld6VtckUhRdj+d8hJct73CRAkX8gc0dA2HEWojr23HbjgGt79Vr2R7UE28l63TodLyMPELmYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199018)(31696002)(36756003)(86362001)(38100700002)(2906002)(41300700001)(4744005)(8936002)(5660300002)(4326008)(53546011)(6506007)(2616005)(186003)(6512007)(55236004)(26005)(83380400001)(316002)(66946007)(66476007)(6486002)(66556008)(8676002)(6666004)(6916009)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFJTcHZ1cHdoakRsem42NFdpYTViYjlkdWVZeDdYdDQ3c09HSzVPdGhXOUZs?=
 =?utf-8?B?TWpCOXlLb2t3d1FVTGoydC9iQ2RXejJrU2R0NENRRHMrOENIWTRSN2dIVjU3?=
 =?utf-8?B?UHhYc2hraVlmYlEza29DMkYrUmFzc3BYYTRuYys4OGhCK3hqcHZkV3pMWkFP?=
 =?utf-8?B?Ky9ua1RNRisrS0RxOXlwVnJ6TzZGanRseDY4bU9kWHd6T0JyQkJQdWxZeDlz?=
 =?utf-8?B?NFFsQUxZSFhnTjBsUTNidTVJaWNtR2x5K05OWGw3a1N6WDM0a1NnbkUycWdC?=
 =?utf-8?B?WHNKUE5LSm9wOHBnS0ZaMGdaWXNBY1A0dy9zaGJ1TWlreW5tZ3hSVjhWRHNO?=
 =?utf-8?B?VU9tTmwzMXByejNnS0NyUWI2eXYzaWFRcVBJRmRRMWhmUVhHdm9JMXFaQ2hX?=
 =?utf-8?B?ei9PR1Ezd29NVUNlTnM3QzQzZWxLTmtnTE5TaGhuOWhqVUdRZHFFR2VseVI4?=
 =?utf-8?B?Qkl1UWtCai84d2NwLzdwMjIwazM1T2x3Q3d0QzI0WnBacE5oTHhjRUdVd2pl?=
 =?utf-8?B?c013V0w5KzF6U3ZaQnkyb0N4THltTCtDdC90ZzVmVW1qb3QxdStGNFJIVE9U?=
 =?utf-8?B?S21UT25NZ3N2aEFYTWFBeUEybmViQWYyczVJQ3p6MmZTbzlVMXVKaEtnTFhy?=
 =?utf-8?B?bXdacmpUWmZVN3hiZW9ZcXJBVkdNL0UxYWFhTENRb0lhTStWMWs3R0o5ZGY5?=
 =?utf-8?B?ZzRzdVVRZEhsOE5LNGJvWHlwWlc0M3lXZEwxS3NJelhDdDZ4V2w1dVBHZTZq?=
 =?utf-8?B?STJXWkdwU2t2NkVVL0R5ak96K2ZYWGJpM3NOODgvT29LTmRHNzU4QmVLSTk5?=
 =?utf-8?B?SHNrQysyaXErc3dOVXR4dGo1N3BHM1c5MXQwS0lMNGMrdEt0S0VWRENvMlVp?=
 =?utf-8?B?WjkrOEtaemN1Q1grSjVoZGhCWjZqaE13RlNyZnF1Nmh6VWl4SkZFeWkzSi9N?=
 =?utf-8?B?VzdodTdNVUhlQzhYdGplZ2JGTkRkdnVsWmRMYlVCdlhIR0VkZE1LRklHeUR3?=
 =?utf-8?B?TXVxMWh2d2ZDNzljZ1d2Q3BJVUdCbTUwWGxpQVBZUG91L1Y4cXEyNnJYeVhD?=
 =?utf-8?B?Kzc2TGZRZFdhRUNUWHVXcTBWc2wzM0lrUmNwRFUvUDBLYlFnUmJSVmwxeWdu?=
 =?utf-8?B?QklzMndnSktyZ3RyQUs3N25YSXVSdXRIYzJQL3hCNTRuV1Y4VUZuZlhDa0dl?=
 =?utf-8?B?TTJJWURaSy9VVzVEZlRoUlhlTnR5ZjU1VmdOakNaRFBwVkkzMkdqbXB4K0hv?=
 =?utf-8?B?MnFTSU9IeElGU056SnZxSWpFSEoyNXIzZ1g1SnNNQjVweXd5YlJTQVpyb2tU?=
 =?utf-8?B?aXpIRmgvbnE3ck1OMFozZ0tUdXRLUFE2UHdKWTlwZUpPRWxQYS9vbjVnUHNZ?=
 =?utf-8?B?OERTQ3RNSEpFMEFTbmltbHRGN3NINW1ac2tmb3FCaHpZWGNnZGpBY0w4aUll?=
 =?utf-8?B?c3RtcnN3SEFMcWZ6ODNUMWFVWDZpekNyMnlXZWs4YWNGMm54UHpOMjlnVjBy?=
 =?utf-8?B?NGVyYUJCZ29LeU1aTFJMQTBWcklJYjBHWmlRaGIrNUJoSFpZd2tlaFFBMG5C?=
 =?utf-8?B?QjlvcWFFK3pxTGoyaTAybHUrZzl2K3dKNk53bXhmQlNrOWd0ZzdJOGs4Sk1H?=
 =?utf-8?B?Y3I0Mk1KcTdJVWZtSHJta3pOeEpkVmg3MzVWS1V6MktoYVM2U1dsYVpHckRp?=
 =?utf-8?B?cVlhMDFseHJCRUpOcVFOaFZETVZJWm8vdnRzR1dpUjlXS0pCbFJHY1YvcUdm?=
 =?utf-8?B?eFhqRGJCelc4MzhJQUVwa1R6dXZueW8wU01TVW1EbmJyb2xaWW0wUDFRN3hV?=
 =?utf-8?B?TDVGNTBNUXhmRHQ4bGtkTW9CVHFqdG5ZQVNBYXl5dDk4QWxRWmhSMEh0aXJE?=
 =?utf-8?B?Q213bzJGdnZyREUrTU1LaEo3YmdwbnQxQ1FmUlEzZ091Mk5KcVdycXdHaWZ4?=
 =?utf-8?B?VUlkOVdsUXQ5MEc5UVNyblZTMGRyQ2Y1dFNuVzY3UWZrcDZqQ205NkI5dUpN?=
 =?utf-8?B?UDQxYzNxMDg2R0I2djhHMm5EUW1FbS9Sc2QxWWRWblVHUUdtY0NDeGd5YzZ6?=
 =?utf-8?B?OEFHZDVCLzQ4bXI5Vyt2NWduVGV5L3dlcWtCRmEzcTV6dW1HeUE5VG44cUlu?=
 =?utf-8?B?OEpOUXlsaThKWFZ0TDNzWnlxZHZFUUtodUF5VDJCd0ViK1Z6RFhPSDN3aVgv?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb32e9af-06df-4698-3790-08db24b7a556
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 18:12:17.7375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqP6G/dtCq+eDvg/x7f5Spi6rJDxxUio0PEU3Pi5fp67OMg/CoGIvBdSu/wfNh3i36z9nty8ZvYrNXhoVeb9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6332
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 02/03/2023 09:33, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add support for the combination of the NVIDIA Jetson Orin NX (P3767)
> module and the P3768 carrier board.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 218 ++++++++++++++++++
>   .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  | 133 +++++++++++
>   2 files changed, 351 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi


Looks like we are missing a Makefile update in this patch.

Cheers
Jon

-- 
nvpublic
