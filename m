Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7891C7EE2F
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 14:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239211AbjFIOuI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjFIOuH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 10:50:07 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85902715
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 07:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsGzQC6rqkNDK2FHDnLEKtu8fjGWo9m0xRJ1LeL0f6SsAh8oL4Ohk7MMCM7dCSM9EHEGLY22jL1prjScbw8wHmehqoKfaJeeIUtvjn+eX1ad759srT6tMKeiXmMAm5u1KV6wQJvYogtHLQrjakkaGrR+H6XigF1TZrCKfCBeF28v+vIqa/psffTZlMaPOfpBodeZncUdpBZw1JexVW04zIfSmhjnzo9h3P7QGWzBk+zVi91KP/9P5eVIBVZx14FiI1Eo47OrrGhUQMLSHtr75p63GIkX5AbLubfEosIopu+y1o0ZWfbO1LBYC5ba6haF7Itc1JrY2LySuGDCkgxV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gatl+L18J8wGHslgmgTiMMsEYgsTuMG7JedwxC9uxq0=;
 b=I03FY0XsGzaV2sP5F6osc2D3VAsiDMbLqGDZFK4dF5QtFDC0ytz40QyG4LjxBSkNXlXTRQqFSEhYSEl7ciJVISgi6vtYJPyZ5bWCNcKlQ0tttZEcXCfMwsVKdCQ7kpOv0LOpjJewJvOzMTV9DTvzilmytdmHHnPqGEybPqcHmkB1DamwanzOrJL+rqMf1/aYOn/17kdRL0GoiAmrEUbCGL5mUew249dY4866kvVpx8Cti9GyT/XSyijQY3/DBrh8KtSPHBaze7qZVDHL3lfnR2w5F29Z8qVgRfe+4DHMyTn5lsWycsNdwODZRAiFr1iiNhy29blPF0Xk5NPR5PWLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gatl+L18J8wGHslgmgTiMMsEYgsTuMG7JedwxC9uxq0=;
 b=PRptdrrAVVY8GGNikCPmxgiw7sC0IlfmMayIKEDB77v9LjuUq9e2Htoj9sQEWaDKRWXrP5C+MzU9fGMx6zr1gB0sI1z7zvFreZpnqhpOJfuYn8h4IVSqnPYXtZhWVcRBen8IkWHKWH3+zuppUuO4VKAhiPSRLF4oBBcHjjjSE+esOaruMkmjnnFJF4p7djmawWx9J4GaMSEwT1rnodc5gJ/lhsN9gj3FjaNZ6gSMzs8063Rwif7nBUIChz1ftQVrT3omzXixyo3X6eYgXFCEg0wh+TYvGVpP9ZIFpTO1pe9cZucP8FPHl4oD4PJLoyxLiPCbqICZXdETMv01f3R4IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 14:50:03 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 14:50:03 +0000
Message-ID: <cdcfe2ee-0982-cdaa-78ad-24d0549ae51e@nvidia.com>
Date:   Fri, 9 Jun 2023 15:49:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] soc/tegra: pmc: Simplify debugfs initialization
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230609144225.3898934-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230609144225.3898934-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0398.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN2PR12MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ac5d44-9f3c-4984-00fa-08db68f8ce9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHrOkA1fSPjzzQUP3cIHnJv1GKlGR6QSCn8miQ9A2eR3oIlgQOmOAreKQZxYjgjNqKe8Gncfe6l2FTmBPTkTj1iJYOig+T72Kbe3XZgiIoPy0UWQyCY9pBNl1EKdLUqsiiMIto8u32BqgRe7rqOCxiBLugIdD2R6TcnLnIFEoBvxgVs8kAJevmWC1AGS3+plNOL9YCiBFhgUIiyGcTNQ5ATwzUoZOlZxE4lg09UxDmwy4DHAC2TALCBGdrscW/3S8tpOF6lc5WZ53uSfipINF6j4ddRv+R0POvc8YBit6GROanEe2S/qAcCLQXO3eNWeXMDFJ8HdjX0IoLlIFfwhFTwJUOoatpicrV5N8EDAUXTiIo5Fub5Vfr32P+VR+jdH3A2rD8sn1wzuYGwuLH56OxberU8oKJAGzGJ/pRq/s7Og7A4KzOD7k2HGbapRTrKuKJ2MMMiJDqIfT4d3g9l8PcVrj1LlaSiIifywrSqVaCNcZ3FY/SHLxKmkG7cJmj/uIdGtTDKqv+hkOgssb8xUeT8YUui7LLbY9Ctl4vbyGG9oyJffJEMjwL3mvLJUEPArr/YY8oE6LIY5jbG2MCCVnbTy10sUETMKjyLw7B/ihXP6eooanC8jzXM7P/vW/iCTsLqFT0xVYl0F/sty5Sh9BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(31696002)(66476007)(66556008)(6486002)(478600001)(6916009)(4326008)(316002)(66946007)(41300700001)(8936002)(8676002)(5660300002)(2906002)(38100700002)(2616005)(6512007)(53546011)(186003)(6506007)(83380400001)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3dWeEQvdUVOVk51MWdvbFZRY3lkUlhkc2FOd0JramJucGx1M1VDWG5WSGpM?=
 =?utf-8?B?c2h4MDlKZXpneUNmU29ISnROeHpqamJac05INDVxaDRRU2pzaDV4Z2FhWkNr?=
 =?utf-8?B?aERnY3lRZkd3OFFBaTQ4bDQvV3BpTDJCQzFCNFZUMnpOWFVHZE9WejBEZ3Qz?=
 =?utf-8?B?VmRUZ2F3L3l0NzJneTllMnRBWnBMclV5MW5EQ1IweHRyeXJ3QmozTjhmejZQ?=
 =?utf-8?B?UTIrbFd0eTFRelk2TGJ0aXRwYkV2QWJNbWNrdHNRZEpvYlNyRkc0azFLRm1Z?=
 =?utf-8?B?a1J6ZllkbnNMKytmYlBENEVhdnpyNHlheFRTRlJqc0Jsd2JrMDFKVEVPWVNJ?=
 =?utf-8?B?T3RPdFFTYkQ5am44bG5DNFl2Q2pQR1VjS3hEOU93RzkwcmxWcFhhL0IyWVZx?=
 =?utf-8?B?cVRiaERJOVZ5d3RVKy9seVZGSmNwRUt5Z3JncDY4MjUzd2VYMlpNZllUdzFV?=
 =?utf-8?B?cmZva1JtbnBaTFlmamhvOE5hYkRNeUgwYjA5bTR6dUxQMDlUNUJ0M3hrOVhs?=
 =?utf-8?B?RjhuYWFOc3RGNnhqV1NpUjUvaHI1WHVHbThSVDVFNGJQUWVXdnlIRlJiRnk0?=
 =?utf-8?B?U3JmU3E2UnVSQVU3NXJDdHBRWlJudWNuYkdVOW5MTU5kTUp2NnNGTFRiSFlI?=
 =?utf-8?B?cVUvWWxnZEZpRzZ4eEdwc3ZqWnczRGhHQWFWZ0xMdlc1bUIwd3lrTkZzMDZR?=
 =?utf-8?B?SjNLUlcvNi80SXpvaDBNcjVncWhpMnhtdzNWTDc1YnJDS1pkZ2l1bTNCRXVK?=
 =?utf-8?B?MU84THdlZjk2dzdFOUxPN0pEdCt6S3JLM2pDakNQZ1V0U3Mzby84Wk1Sd3Vq?=
 =?utf-8?B?a3BwQjZIdnBMdjFPSkM4UE1zNXRkN2tXZkxRUmxPM052dUpzQXJhNWowTVNo?=
 =?utf-8?B?anoxV3lrT3RsZzFndUc0TTJ0UDJhN051RlNNK0t0b3lJZTZVakxtOWdUYnM0?=
 =?utf-8?B?YWE5bE85YmtzUzVTM2hBdjF6ZjlKd1pRNzAxTEQ3eDNaVFBRaDBBaFN6bkpy?=
 =?utf-8?B?aXdBa1ljcndHejFyQXVQU2pMMHF4aVllQ3J3bGNPRFhRTGZJUm1uTmdZbnJM?=
 =?utf-8?B?TTEwWjgybzZ0aE8zakM2U3lUWGlheVpNYUV3d0JrUDZiakNSZWZSdlM2ZExN?=
 =?utf-8?B?RndwcjVocG9EL284eklMZm9SNzJQSlpYbXBJNTI2emcyVFg0MStJUTFXcHZR?=
 =?utf-8?B?OVB4RkFoYUJjSWozSTBVOVlVWEZWN1BZY1FtUGtiYWJrcWJxUFhKNGgxdUhp?=
 =?utf-8?B?TEpTQlc1VTlrdm5hVFhYR2dQblhPYmNjbHp3QnZjUXhaVmtxWDNiNFVDc2Yv?=
 =?utf-8?B?YVdvalQxeE1jTjdHWFF1WGE2RytjWktINGR2bG9aQk04MEExUDZaQ0UxVnlq?=
 =?utf-8?B?MytDSWRLWCt1eG16S1o1VFoxS2NrSWpSQ1V5ayswRW9jcXl6TWZoaWd0akhY?=
 =?utf-8?B?aThvMjBWVEg1QmI5NUppYjE1Rm4zU05wakZQRWxseTNzNXhFZW82Wmh0NGdQ?=
 =?utf-8?B?Ty9CbzRYTVhpV1JqUHJtcmhqejlIejZucUt4bEJuZ2YxNU10Zks5andtWmcr?=
 =?utf-8?B?aWhWc2g3TlMxL1Y3QnMrTS9FV1liV1NpM1Q2K0JzL1M2Z25TVnRDdkJhSWwx?=
 =?utf-8?B?ZmxuM05iZHNEZUJ3SHhoL0hWRnNEVmxud1ArMFp5R3V0V2wzM1NnTkpUSUM3?=
 =?utf-8?B?RmpId2M2amZFYjBTT0o2UmJtWEpXK3ZGSmhENUowb2NjN1MxTnZJcUpld1ds?=
 =?utf-8?B?VUplREJqWlBjcndQZ0VHWEplbkZSQzZWamEwUXN4TmxaVWttYkd4S2ZQeUda?=
 =?utf-8?B?c0duQTE5dlNBTEVTMW9YczZRUnltTEpXdjJjMUkxRlRDNmE5YXVJVmhscWU4?=
 =?utf-8?B?cGt2bVV5UUh2UWNSaWFkYVlNZWFwV0NNU081NWhDSWw2VHVBdnJvelNaMFJG?=
 =?utf-8?B?NkdUalpKQ0Q1bTNLbmN0L295S1JEUGREa1pTdTc4NXUrNVJoRzZvS3Q4OXV0?=
 =?utf-8?B?SVVDTmkrbU5pc3BzYy9QSUVwOVpUTlFKdUg4UThZRWRaME1JTkU5YVJ2NHJw?=
 =?utf-8?B?WnVvNGp2akJHZGdyckZyNTgwTlRaV085bTZTcjkweW03VzVmMzdLOGxHQncx?=
 =?utf-8?B?Z1JhMUw3RDVYUXlWMUhudVRaL3BKWXh0aThKeE0zdythV1RFQks5SXVPODVz?=
 =?utf-8?B?ZlIxdGxKZHNQMllWakh5OXg0Nm5oY2NpNjB0TXhxR0h2THhOa0hHNTNWblRv?=
 =?utf-8?B?Z3Bubnd4SWxxWW90Y3RZR3k5R21nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ac5d44-9f3c-4984-00fa-08db68f8ce9b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 14:50:03.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGKjSvqmpEIP1K+YHHyR1Z62PjsuV1tivzPtm+lIUAdBK4kS4F6RTXkq2iBbFWWj94doc6CyPfM4qY6/fpq1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/06/2023 15:42, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> debugfs calls should generally not be error-checked to simplify the case
> where debugfs is disabled. Since this driver is built-in and has the
> sysfs bind/unbind attributes disabled, it cannot be unloaded, so there
> is no need to hold onto a reference to the debugfs files that are
> created.
> 
> We can further simplify this by moving the debugfs file creation to a
> later stage to avoid any cleanup we might have to do during error unwind
> operations. This is also a little cleaner because the debugfs file
> relies on data structures that are created at a later point than when
> the file was previously created.
> 
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 26 ++++----------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index b562b005744d..438c30c5d473 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -396,7 +396,6 @@ struct tegra_pmc_soc {
>    * @clk: pointer to pclk clock
>    * @soc: pointer to SoC data structure
>    * @tz_only: flag specifying if the PMC can only be accessed via TrustZone
> - * @debugfs: pointer to debugfs entry
>    * @rate: currently configured rate of pclk
>    * @suspend_mode: lowest suspend mode available
>    * @cpu_good_time: CPU power good time (in microseconds)
> @@ -431,7 +430,6 @@ struct tegra_pmc {
>   	void __iomem *aotag;
>   	void __iomem *scratch;
>   	struct clk *clk;
> -	struct dentry *debugfs;
>   
>   	const struct tegra_pmc_soc *soc;
>   	bool tz_only;
> @@ -1190,16 +1188,6 @@ static int powergate_show(struct seq_file *s, void *data)
>   
>   DEFINE_SHOW_ATTRIBUTE(powergate);
>   
> -static int tegra_powergate_debugfs_init(void)
> -{
> -	pmc->debugfs = debugfs_create_file("powergate", S_IRUGO, NULL, NULL,
> -					   &powergate_fops);
> -	if (!pmc->debugfs)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
>   static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
>   				       struct device_node *np)
>   {
> @@ -3026,19 +3014,13 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>   
>   	tegra_pmc_reset_sysfs_init(pmc);
>   
> -	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> -		err = tegra_powergate_debugfs_init();
> -		if (err < 0)
> -			goto cleanup_sysfs;
> -	}
> -
>   	err = tegra_pmc_pinctrl_init(pmc);
>   	if (err)
> -		goto cleanup_debugfs;
> +		goto cleanup_sysfs;
>   
>   	err = tegra_pmc_regmap_init(pmc);
>   	if (err < 0)
> -		goto cleanup_debugfs;
> +		goto cleanup_sysfs;
>   
>   	err = tegra_powergate_init(pmc, pdev->dev.of_node);
>   	if (err < 0)
> @@ -3061,12 +3043,12 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>   	if (pmc->soc->set_wake_filters)
>   		pmc->soc->set_wake_filters(pmc);
>   
> +	debugfs_create_file("powergate", 0444, NULL, NULL, &powergate_fops);
> +
>   	return 0;
>   
>   cleanup_powergates:
>   	tegra_powergate_remove_all(pdev->dev.of_node);
> -cleanup_debugfs:
> -	debugfs_remove(pmc->debugfs);
>   cleanup_sysfs:
>   	device_remove_file(&pdev->dev, &dev_attr_reset_reason);
>   	device_remove_file(&pdev->dev, &dev_attr_reset_level);

Great!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
