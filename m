Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC71ACDB484
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Oct 2023 16:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379507AbjJLQdC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Oct 2023 12:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379171AbjJLQdB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 12:33:01 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9199C0
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 09:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtaThpIB8dMR7Un/B7T8atXSvrDojiv206FEEC7ISyKnJ7L4H2qJuGQRdtkH7YaNHE5nCC2a7+0/q9ZV6JkuNip0xFJEqKAKKo3gWJhSbLbzrWPI3F/gnkCr6Y+7Ds9lKkaXh1tpwfbKIwkfbSAqAsRFuAgDxua6x91gUu40tmOpuMhtsX8cmCEvxlbsaxlr8JLESixR6RGvVN76PxWZ3FdEGBUa6k8F+5JcJEt+eu+ic0Q3LyB7NzpEpHZ49rvRrljDv6UHT16xxqim213qCXYloQvbwb6mnF4laerDySImnP2lcsTDKecE9pM1lo5PSDBOa1F2AfZZBnZWw3QTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfAWojNiG0Cc5o2Ko4x61uMAaYADIc+rZOZxgJH7fKg=;
 b=AsivFxft22uWcmUxgqXBxtzbgIN84lMJJOn8+2fvY1v8QLgX3AhuKcDto+PZezCbEEPaHTxbP6eiunLBOcdXRvBsGNUBjVbHlcyVIwC14oOk6M043U18GPt4QjyOIje1NxFK2qX8jvf1blBsWevKUpE2NVHUCkI7gT1jJOFHiUYfm4PRVoT6qbga5kcbO2U3lYBqTurw8eJhoZO/9pcc4xCC84cLA30jvIPQ680lpycXcsJIFgP2CASpSG6nlNQF464YjkbAi6+4lguO2Qw5hBH50sjhloGHMN+SYQ9NiXzIIiZcVfnNQr5skQfW2Z3Q76qYPuVQxFp0canCDEiTBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfAWojNiG0Cc5o2Ko4x61uMAaYADIc+rZOZxgJH7fKg=;
 b=e0TwC2vTjc3yBCi+lok3AO7zdTokOlOAXb96pKFClUFa0SpFwHas0rSjqn+ER8A9E9ksDhfdx6cJ5BfNc3OzWYesL7RBBUD8jDjSkYWT/qph9/WfiwPjXukjdHNDm4nvear2PWRrClqhqt0JuY6PJkkj0WVQvyz4TPZZ9oBSbLVLVEC/9akedTzoURXTGCknQlDSDxJdior9tvcKbiPo1dkLAm1SS4+JNAzDiJct6R7uVHVLIAechCsPNYZ0uou+ZP7SA2ywE5RWiuvn9J8wzX1yzcwBcTvoJFAUanmQMETIu/oXcDHtrhQ3RepdW9YQwlhQXBxLlDwYKJo+wHPCcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Thu, 12 Oct 2023 16:32:55 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 16:32:55 +0000
Message-ID: <6a0acb03-a55e-447c-a121-2992d500e055@nvidia.com>
Date:   Thu, 12 Oct 2023 17:32:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Use correct interrupts for Tegra234 TKE
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Shubhi Garg <shgarg@nvidia.com>
References: <20231012124311.3009393-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20231012124311.3009393-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e07a14-2ac0-4c4f-4558-08dbcb40e30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2aX1bdU32XPbWbPzG28ARTVnblkj/8fjWlchskNDos4xknJRiHn+G/f3HDkjz3LWr9QD3amdd8+WOAcZWRAZ3Tt9deSBBbXynIqNKs90QGLKLMP7SLDjb0BR5LEhfgwwWkViNx4OWVxPYC7WZdXufPN423B7L19fqVR0dvaknB9a4W0JWxQykkg3N3hXqtwocEzGgMCht8k0eom7A8r2ikyJjn0FScLRSxYgJERQUZdeSYR4st9P07rL0MkGVSqbSNRCU3yFYb5z7g28fflqcEimG1fXu8PdsGSTC9LteeFEdc/yb4tTjAY4MhRj+BDTvnokxsnsrzS5hJ5LsP6UT+x/LxdL0lFLZSW6uNRpeac4oXZ4JxXKkNY8K/eGde/u48kMdUB1Wv5ocPk2RL4IwVJemMIq/3kpE1vT4ZY1ESCKvDN+OIuhL5ebEeGjT5eaSiGu+l2th/PVALp4lY+kOx9QRQl/Z74/OQmjmW121YTjoWUHeJgmzUktP4dQMYP+kWJAtCT+SwFDa2jaBHiQmBl/GSMn53YkzYy1ocD+00AwxCMOmxREnNQdGY6vme4vqlCL0bYEAnbzZfT6s4aofJPduje+rdd8iHwQ+od5TtGxlmGpruV32WVyTYjSShU5vgfsFl9YrLBcOv5Mb0kvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(31696002)(86362001)(38100700002)(36756003)(31686004)(5660300002)(66476007)(66946007)(4326008)(6666004)(2906002)(41300700001)(8676002)(478600001)(6512007)(6486002)(8936002)(107886003)(55236004)(6506007)(83380400001)(2616005)(53546011)(66556008)(6916009)(316002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNiZ1ZXZUM4L1RzbTJXOUphcWNyaE9UN1huKzNkWnIwaUpZNW1ZRVRuanM0?=
 =?utf-8?B?SGZFM016ZDhsVlRFSm5tMXBESjMvNXlHM1RPR3dGdWxJbTM3YTVUOFpXQmdS?=
 =?utf-8?B?SFIyTjVQRnhma2czSnA4RHozWjJURlpYMk51Yy90ZFZlRVUxL3BQdlNXdXl6?=
 =?utf-8?B?bWtXeW5FbTRrZ3Q2ZzFXM0c2NVN6cWhyaXduM3plMmdVdHBYbmJZQkpUaVVl?=
 =?utf-8?B?bElTRnZTWGdKQzJoVFZ2eHErL2N1dkl1WE5wK3FZWnA0RStONVRKbDh6ZHVx?=
 =?utf-8?B?aFRDbHVwMVJhbVpnK3plbG56dS9ZVEFlcHVqdlZacklwTm4xR3I3N0tlMHI2?=
 =?utf-8?B?Zml3eFZOVHVFaUIvdFpGQmNSMlVyNUhOeXpDckxtYWtxcmt4WEJsa0RVRkdp?=
 =?utf-8?B?eTI1TVlMMTBTVjZMOG9xc1E0c0lybWpsUzVLN3dqOVhXZDFyT1pZVEM3M3do?=
 =?utf-8?B?OHp4THVYSTMvSHoxTkh1VEdsL0VqV1l0dFFyWkNiNGUxdkU2eXFPZVltVE5G?=
 =?utf-8?B?NnlRdldnT2h0bkxkbHlQWi9SbkdKeVBqa0FLeWNPcVZjRXUyUlBVZ2NPNVRW?=
 =?utf-8?B?TmkzTGJ6Uyt1ZSs4ZHpEcFNWaTB5ZHFWOXhpVFcrZWlEQmF2TVY4bm1OY3dF?=
 =?utf-8?B?bE5hNnh6NGVMZE1jeFpabHNvWHlhcG5qaFB2RlpLZHFrK2xCQTdJN25pcWxT?=
 =?utf-8?B?cEd3S1Z1LzRsZUpjb2JoR1BhdkJuVWhGNTJYSk04S1VFZmpVOEVRQy8wL1Jw?=
 =?utf-8?B?L3QzOW16STM3bTFkS1BrbU0ySDVXazFTSWhSMFNzMVdPNHNoeHRkYzR3Mkdq?=
 =?utf-8?B?ZGlEOTR2L3hhRFZOSm5nZWpLV2Fqc3Y4Yk84Y3ZpVmg2bmk0UVova1pna1dx?=
 =?utf-8?B?TExucktUNldMMWJTQzA2QUdSeVMrazcxamhOOVptRXFaTVZjYzVRL3I0VWVT?=
 =?utf-8?B?TGRsbHBYRHpXREhOQkJzdW5sRFVrU0xldmJLL1NjMnVSaGk0b003MEduM0pp?=
 =?utf-8?B?dVp1T1VWQTJpaGpmUi9LSHYrOUMrUHUwYWQ0aXZSU3B1S1JkTW1YT0RMMS85?=
 =?utf-8?B?N2Z5ekNMOHo4WWU5V1lqdlE1Tm5zc3FhaVBjc29MNzIzQ1owUDlBaWhPa2tK?=
 =?utf-8?B?cU5HcjFvZW1DU0JCL0tpdmgyQ1QxZXJtVVd4YVZHR2xJL3FUcXdnZVVrRkpK?=
 =?utf-8?B?R3Z2S2NZdFFOK0FtRndTbGtmMmVBN3NiR3EvMVd5MS9HWXIyOU1CdThCUU5H?=
 =?utf-8?B?L1ZGNG1GeXdiUDBxalUxUTBMNWZXVU1GeXozRHJieDFBTWFqMWNTTXlHdW1P?=
 =?utf-8?B?VDFsblcvMW01TTRYUGpvdXRpemRjUVlnd0RwZWJ4d2l6TzlzaitLWGdQT0N0?=
 =?utf-8?B?Y0FyWTBUcUsxdkw5NVlld0QyN3JUL3RMeldOblJDQXJWOUJsVjZNOERxWGFR?=
 =?utf-8?B?eHEwRzBIQ3NIVzdVVndlTDRPNi9vY1NDQ0k3OVZOR09SV2NOVFJtdHZwNHp3?=
 =?utf-8?B?clJWUVFTVytmTTFxNmFBcHlJR2pnWVhiNEZ6N1puK01WblpiYVFGbVM2L25s?=
 =?utf-8?B?WFB3VTcvK2paSVlXbTZadmVQQjRCMzR6S2RXTUo4aC9OMG5hS2VUMzlEbzZJ?=
 =?utf-8?B?TS9YVG9hWkFub2hhS0c4WWtuNkx2YkpITklOUHNacWdSWTRaMW9ndm1KWW0z?=
 =?utf-8?B?UnRwM3VpQjBZeEZqZmlNMWZ0Q3c1UDE2WVNYYWhrdVRTbVYzOWhCSDRFSFJs?=
 =?utf-8?B?MThuL0ZrNXZtOUpBNWlJSkFoMEdwa3hCVU1hTUhRU2wxMERBV1p0emRJOFN6?=
 =?utf-8?B?TVc5M2lLUlVFVkNsdGZmTkVWclFtSDhFMVpUSksrZU5BQVFHS3hvR1VqakpP?=
 =?utf-8?B?enU3TzNLOVd1RXBSVHcycFVUVTYybjc3c0xuM2lOVXhkZHNtYXNnRFpwY29h?=
 =?utf-8?B?em10aHZLd0RrKzAyWStVektSckNqZHM5UnZwOCtSOWEzSkxsMDdNNUJibHRR?=
 =?utf-8?B?NEMrMDNoOFhjK2ZKLzhMNmNBQ2lOcndRUmNqZUdMR3J6YnlScUE3Wk81NVRy?=
 =?utf-8?B?ekxzZ1FTWXlHb2VUQ0xmMmVWWlhzWUlpZlFwZzErRGFvTHVicWNXeCtKQXBZ?=
 =?utf-8?Q?7klqyV3uWVYJiz/tNZvovxteA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e07a14-2ac0-4c4f-4558-08dbcb40e30e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 16:32:55.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w75A2TZrE7kU1ZSinCrpeWCQxx3dplqvrko5xxTQna0xdcqEKdWia1kfGplMo43Avuy7ivTUgJqa0FjllgwQBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/10/2023 13:43, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The shared interrupts 0-9 of the TKE are mapped to interrupts 0-9, but
> shared interrupts 10-15 are mapped to 256-261. Correct the mapping for
> the final 6 interrupts. This prevents the TKE from requesting the RTC
> interrupt (along with several GTE and watchdog interrupts).
> 
> Reported-by: Shubhi Garg <shgarg@nvidia.com>
> Fixes: 28d860ed02c2 ("arm64: tegra: Enable native timers on Tegra234")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 7cf31862d68b..cc11cfe34edb 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -43,12 +43,12 @@ timer@2080000 {
>   				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
>   			status = "okay";
>   		};
>   

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
