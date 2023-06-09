Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C078BC83005
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 11:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjFILFV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 07:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbjFILEt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 07:04:49 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBEC210D
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 04:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DShJnQ/CAV+xGQka1riQLmQIXvArn61i/QLmN1VO61oqOg241Q6d0Vw3UwP3p6B5kmYAOiqsAbz92NEzsOcoJKu//XlCLQaNdH8nxhPpIotMs0GWoy2nYQcYeTmGCTksNeDsCl8dpGfelWczIDQ8tVJm7k+wbyGxSncPIC9lYyWLKcaLZSAO+vOIPt1gca+pQ5BCYCRdZHuDVt0o3BSKgM9VfDE03GUOWqMTZRG0QCVnY7FOvOImw5pOhS/caFWyaZZHrNQ+yyz65WlAawen6j2jNOfzIfldhfpFWCHMSKZafEVgRAzHMSHYaDF7tWLbDiKITGVTXtoLTqS2C6zdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL8mDG6lqf80st+Xh5to6t7FsCAPMYn07g+Zfxr5+Sw=;
 b=UR+xbMYdRr+SXIdCySHhAx1i1cVgoEYv5jfYHS5h4wPC9tXebivMcbRbtqc/4bCs0U+8J202I69Fo0Da/QGGVVscg2Fqpb05v8ayFL1sbCJ7ZKXCqwMRQbqFWejZv8b3dWbfqnHsaFMjybIThueL4I5JGcAT9BC18Dr7JPCAxgNeRlSXGAG1sZHN1bJFQfJt6F+s58EZeJasa5yJ1zTJU6KJHMzHRQXi2BLJC0j9c+6VplRbzlmcM9wiGaqUf0QMxbarmsllBA86mctoASd9pNkf8QowwQo1o30PPdO20e1jOF0Naxvl5TVXKM/cv9i4oNGhvgcNhtuNqvZUPNyhNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL8mDG6lqf80st+Xh5to6t7FsCAPMYn07g+Zfxr5+Sw=;
 b=YqEale8mTHWSM5AU19uEfCxiGO22xsY8FUeKdSild5k/xEm3DtjgfFEpHEIABkhMyFmOdnV9JCWD6XLit/kd9G/z0mrnvEnC2yUCZxW/UZ5vfSsYIV9TjzGEtAjuFTqTUQ0vjvrsgiklcwVeqQ9bpQqmAiYh5fToXctHFgAmROXivc1/Z1XU5Cb5MQfolkvJKS+86Rsml30KwyFyvtpA7n1Y0JKDWfCfa6vNCtvK8vFEhq8ITb+rG7imY2dFvBWLBw6cy5HI2rlCaubFvbZUtg2XtF2142aaNUR8Gk/MJO/Uw/nsFzCTSFQadWWJvNecDE5JUJxcXt67KBPTOfU7KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 11:04:44 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 11:04:44 +0000
Message-ID: <a268d4bc-74d1-c98c-51f1-8a183a405620@nvidia.com>
Date:   Fri, 9 Jun 2023 12:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] arm64: tegra: Sort properties more logically
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Shubhi Garg <shgarg@nvidia.com>, linux-tegra@vger.kernel.org
References: <20230609105543.3730161-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230609105543.3730161-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c82745-242e-4e0c-4d76-08db68d954a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42s5utz8qRVs0VQfhA9u+0E8I8uvbMvdJl2BkyB6t9ivaO+LuS29Evw2R488fE5LN8r87N4dTD3FVE2dMY1HN4KPQ3IrTnbOQWsWtS034OtGTAzrzNhfz55FEhUU2Hx6AxUpFalfgXJxpDLV383zdxuLz0COM9tjA++Fw+Zhp4ZX1vY13FoHc4wrnmuSGTw+nMGByLlUY/gGDVi7D5/jCmoJQFCDP1QOORrzG7q1C06EYzmbpVBauRfWjJlQXICtbMI8Hd56BR22M+iBRdpHjfR7biMuSHLC6PwHGQWxzUCWPXit9jNqO0drVSnS0SwycjgQKwQ29oP13fOttulEbIzS2XsNQxX3IYLQXAgSmbKcRVD0XnzQbsouYOOAdwMCvp6TbXxIyqETYRj3fEPmxU3MbdhlmzzIMMXS5GR94nBStH/SKHGy8vv/ZAmy9Uc2muhsiZRbE6lw8NUlg0dcGQAKZ87yRYeQGLJdLxVAUsr/JqY/TWqumppG3mny89kx/3Aus+ORf2b1rvwqHiIINXSris1Qy746QjlFEoYObwqXTFMm/jVThywgtVoqdU9/rKNs0wRRsB1MEQin1kmpuHZ/UgWJEz7Z0EYgPiU2M7MtQgk/PQwYZj+BjlBwuLorKTvFCOmz1HGERAI3hb8zYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(31686004)(6512007)(5660300002)(186003)(41300700001)(6506007)(53546011)(36756003)(2616005)(4326008)(66476007)(66556008)(6666004)(8936002)(83380400001)(66946007)(478600001)(31696002)(6916009)(86362001)(316002)(6486002)(2906002)(8676002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTM1dTRnYjAzTGJQalk0U1RtK2NrSGZIaFo4cDlYMEN5K0N6WUV1VW1Oc3M5?=
 =?utf-8?B?cTk0MHJhRTJHajRpTFVuY2JBQkpDV2NmRXAyb0h5aUkwdWFSQmxwNDE4ZWxl?=
 =?utf-8?B?Zmo2YU1zRXdvYW0za0tpSVF6cUM1emJHd2FmSXZ0ZWNVeHhpZHBoMEMrbjJ6?=
 =?utf-8?B?T05KdGROQ0NGcUpMdG5wUDM2RXNhTlp5M2JHM1VRaWFPRlloeCtWc2tkZHZs?=
 =?utf-8?B?Snp2cCtjdDJuaDlkdmU3ZnByNHJQM2t2NElhZ2ZPNnAvV2R3cnJyNlNtOGxL?=
 =?utf-8?B?c1lxYWVBWXdHd2p2cTVGU2kyZEZsYTJ0Wmp4OUwwekV0b3J4WlJReWdnbndX?=
 =?utf-8?B?WDRJVyt1anV2RUtzT2ZpdFJpZ3JuOE9MTEh6a0hUR2ordVJOV2hYYXV2Vjdr?=
 =?utf-8?B?a24wakhPMzk3NEZnRHFuWWRXRzdrK3pXSWt6eWlPOEk2VmNHN2RDL3Q0VWxm?=
 =?utf-8?B?T1AwYWQvVUVoOFBwUWVwaElKcTU2QXFpcUlUNHEySVo0MlgrRTVhWTUvUXow?=
 =?utf-8?B?TDdOSGVhdHZQUHF2ZVNXdVF1OTFDbldpNjZhZDFHNC92bWprcTI3OHF3UXZ3?=
 =?utf-8?B?V1ZJaEZtMWNiOTFPM2FoV0o0eDhwdFgvNWNyVG00Umg2ZjdMdit2NU5iZTh5?=
 =?utf-8?B?dDdsQ2tNY1ZSeGRiQUd4elBCNkhaY05Db1hmeGpVcFgwdWNiL3N1MFdtMDlZ?=
 =?utf-8?B?c3BseEU4SjNHbUR2bVBpR0hHWGZ2WDgxMW5RZm1lY1E3cm1jRWJnd0ZOYTRj?=
 =?utf-8?B?TUxqR0JYYWZhdDJyckQ3bnFFcHc3b2VGbGpUaEQzOTVDT3llZzh5Q3dyTkp0?=
 =?utf-8?B?RENYTi8zL0RwTUF5VEhPRDFNZ0RpSXJLR1BDaVJ6aEI2ekh1bHpYbkdZL2Zq?=
 =?utf-8?B?MXhQbmtTK2VkUmpVbS9pMUNGMld6WXpFSHNzRmtIa3BxVElxV25YUjZDb0RU?=
 =?utf-8?B?MzlDNDN5MWJJNmZxNGg1OHBlQ3VWKzV4cHZjSnNJcVVvZzNkd2VEQU5EK0JT?=
 =?utf-8?B?QXREZHl0UzJQODZma2tDYzJBUUcvanlZN0FGcG5mck5HcFd3bE1BdEZpaWcv?=
 =?utf-8?B?OERkL0Z2WHI0MG5iOUxuTG1KdFFVSDZKQ2FIc0k2WGJoRDV2dFY5aXN5WDVN?=
 =?utf-8?B?MUJ4aXFGbW96MjNmUUlmS0dqN1pUWmxzM0tFTHlNcTM2QVV3N2xBa3RDVmRS?=
 =?utf-8?B?Z0IwVUhtYXhGWmZZWVN6S2lneDg4WW0zTE9vb0RsamQwb1NFNkl1emlpQkRq?=
 =?utf-8?B?VUsxSmc4L085RlNid2RUQnpmYmNSMlBDOEhMbTNGNzdrQW05NklyQ0lGNFVi?=
 =?utf-8?B?MC9ScjJwU0lGRFpmZk5BK2FsbCtsSjU5YjBuVDlwQWFmZVlWYzdwei9kQTd4?=
 =?utf-8?B?Z2NCYzgydU1BMXNWN2JIM0lvZVRJZDRJS0pKL2NoMmlGTXlxQk44cXhyR2U1?=
 =?utf-8?B?RXZNaUFTYWJVQWxEZW5xdi9lMUovZWhaZG1CSmk3cVVoR1RuV09HYTVNOXVQ?=
 =?utf-8?B?aG5LVjhIZTZLV1piSEUxODBpQUV4NThJYmZVRE1qSnhFSnR3cmZuNHVGd2d3?=
 =?utf-8?B?UXFQbHZGdU5Ob2FIVmdwTUJ2aEFSczZEMU1Ma1BTc1BQWXA2djRYQzJwUnNm?=
 =?utf-8?B?K1NYSDk3YnRIVXNvS0I4ZkY4bUc4SzVLenRmZmorY25YQzJacllBY29sUjVV?=
 =?utf-8?B?Y1JPNnhDSktKSzlNM2pQRFovRGg4Tk9MQzhoNEZBQ2ZwQ2F3aTBTc2hoRmJO?=
 =?utf-8?B?ZzlTMjgzRkVENFVCa0NiUUpTVldXc0FVRStHRkV6TW51b0MwOVNYZlM3eEll?=
 =?utf-8?B?QVJ1QXV1RW9ZanhvQ0Q4dWdiN0xST3daL1hGS0RrVlIrcXFkZTB3NVhzVXBZ?=
 =?utf-8?B?QXNkTUoyZVJYQ05EdWtDUkxoU1JNdnM3dXJ2RkR1QlBRTk9tVTZhQTZmWTdV?=
 =?utf-8?B?SW9iS2ZHdTdoLzA4U1BpTHpTdzAzM2Q1UkZkaHRUcDQxV29kOWQxN1hEd1Vh?=
 =?utf-8?B?YVhVQ1hPVW9pd0tGZjhOQWVCM1pXaWNiNVY5UHRDci9XWGpwNkF1UHFYc1hK?=
 =?utf-8?B?YVdiSUJRdVFZSG5tamgxTU9aMnNQVjlBUDExb1pLY1ZHRlZzUmwrbVp4bm54?=
 =?utf-8?B?Q2pyczlpMFVvU0trSVZQMGhOdGRNMGt2NHQrcFV4cGxJNGtKeTFiK0kxejhP?=
 =?utf-8?B?YU1ZRFZJc1dIbktDS1BYbDhnY2h6VE5hdDBGejFRQkVVOFR5bTZRdmZZY09x?=
 =?utf-8?B?cVdpRlB0TjBZT0t3K0hYOGdxU2x3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c82745-242e-4e0c-4d76-08db68d954a9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 11:04:44.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDMc57gv6ERVIoiwjzbYmDtkG0MTbqVf1aNhr1zLNnT76Tg+VV57xWNAus6cxQfA0Ws5eC0Wk5GZjHItew7eEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/06/2023 11:55, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> We typically sort the "compatible" property first because it defines
> what the remainder of the properties can be. For the sound node on the
> Jetson AGX Orin this wasn't done, so fix that up.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index ac64dac287de..e499010fc673 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -2345,9 +2345,8 @@ serial {
>   	};
>   
>   	sound {
> -		status = "okay";
> -
>   		compatible = "nvidia,tegra186-audio-graph-card";
> +		status = "okay";
>   
>   		dais = /* ADMAIF (FE) Ports */
>   		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Jon
-- 
nvpublic
