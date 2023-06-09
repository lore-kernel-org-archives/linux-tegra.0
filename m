Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE924C7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 14:52:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241586AbjFIOwN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239837AbjFIOwN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 10:52:13 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6B72D48
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 07:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjnPmd0kH+qifHRGLggkQGF6UENNnW7y9xiD/B9GFw7owwHCqgCNPUNTNIttv6oLpfzOMKtWfvhMewN7TVY8j4sZdhTUhqG/M103+o7Pt47l7UpUkG4w5Rh8V5Q3iNDfOi6NJ7YACmFkA83TTIxkRk0MY3nIvagjeO55mL4RP7RG1di41N/q6QBkaiy9OhkZwE7ck/OZrRUrl97vD64agRhH4tNHUWUf+WyePPp2M6P46odwyNq9OikKIIlb+WhDMZJyR2nmLXA2P6kU9FJ41wU04yE1H4oA7W/xoCuAzvlyYWQDfJiuWqZO9rTAQVQ/cDduH/svdF6TL3LhKSwh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvRCuOZFQ+3BYWuPXC3V+/CYr2CWRbx7DtKSNSJvWJM=;
 b=NV0ctOC3G2+ThJba43cCUZLrQfw6OCwF1HG5D4Nzd6OsWxaucxKvGRBegg00PopelFuaMxAmXVmJ2YHHAbludPvMx3Ha1PKL9egwbFKJu+nrowsDKu5jVfC1YyzcFiqZ/I/tS789xPFNzkwXv7c8bAJ8x7G72aL8byqghJz4Jm6e0yq0AUv3gFh+wJMWJyHzzd0FwQBnOWG+KWdnrTkhOOpg0einSwWFBsDC61YME64Q00VJ6TDQbw0d+a8bJVnD08QboGamKUE4hzQwm1Ykfv0/+r/ttG4/G/XLwdZjJT65YbzWh92C9FO/DBsLmKHI8nXrQri6IpaXRpdWSv2WKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvRCuOZFQ+3BYWuPXC3V+/CYr2CWRbx7DtKSNSJvWJM=;
 b=exuZWg0N7TEy6TJK7apVL/i4PZ30x1jhEjz6QNoL+IcE6nb44s19uNCC/QfmrizF4li0F3GPiriJHOSHKvTu+dVam/yxYeeLDl7h5JxTRGlkXSIfqPY/4GYLSkGNZ+ShK3mvUaEKvZIW70RR6EoKIAXK1WaDPPdLsUvku2O9Rqdp1qTW3XaqWO3vJ5747j/8yz8ymEPcjHaT0mY627uIjtRuaDwbAz+9fDXke71k5QP9RdcN7gmoWwNp5qdm1f+UKcw9iMsMxvGW0h6Ny8GF7n6Oumm9YHF5cGNMZoArc2DdZGV/CReCSb/o61c9/rHfYxYq01PbU7uZrwm9AwRHbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 9 Jun
 2023 14:52:09 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 14:52:09 +0000
Message-ID: <bf2f1c7c-4957-89f0-db3d-dacfa447eddc@nvidia.com>
Date:   Fri, 9 Jun 2023 15:52:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Use devm_clk_notifier_register()
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230609144225.3898934-1-thierry.reding@gmail.com>
 <20230609144225.3898934-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230609144225.3898934-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::11) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fa8098-fc69-4269-2ce7-08db68f919f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xS3gam19eKTRmYLlVaKZYBope+DlKrU4iBsIlEkyENseiCxy0Mndf+ZFTaRq4d9coYBitOs7wbmqy5sFWWDmTV0KEQssMq0giELkQXdqcX54naTAijhQhhlEuexIbr2pJ5xbt0OipVhWBXL2/V9l/lcW6J5l0ReUdCU0bF3NYqORaGhPhzBHsNoo/vwq4FU0iS0Jej4T2ODm7yLbxMeM+dZ0ZFDZYnahWqp5m+0hMskjoeoAdKFn6vjWLhf2ivZ933QYo8jIope2fThJrDaFYx0e5LjQf+U2tEfkd05Yrepr6UyJZ9GTU0LI69s+TGFufRAprMwfwgPBAn2FpnGWd5xnG2i6z5C2bqteK3eZhaLs+UgrQ6ZcbDiAKRaE1NVhmoG+eZT2caq6sT5ujmg2pb31OGApFv5C4VYGcgaP/47R7zda4tpy+cEHvFRg2vYVVIOxyboIX4BDA5y40krG7Onc7GCn9iY6W7cltWhlBrF1rGpOEB4kUlrJZ03pmNYlFmCWE2ngRl/4Amil2wUplE5C9619DDULCSCsFTEJ4Jv9HH2QRCWqkexLZuPixTMNYctxJhPptKKW1v4OyPMX9A/46epLUtIhuTOJ3nJaVNaEhMK9GI95azN0I8bvscCyvtQJesXa1jEpiCwhAx/j/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(186003)(2616005)(6506007)(6512007)(31686004)(53546011)(83380400001)(6486002)(6666004)(36756003)(2906002)(8676002)(8936002)(478600001)(4326008)(38100700002)(6916009)(31696002)(5660300002)(41300700001)(86362001)(316002)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JOVWZYTUxIcERMaDB6dG52VFVUTGlsRVZSQjBHR0w5OVp4bHZSOXZmUFh2?=
 =?utf-8?B?aDhDdzlXYTc5dk85QWlGVkZZZkord3dENGZ6aGtmNlU4UjNjZExpTy9zRm1K?=
 =?utf-8?B?NEYrQTNpMmRiUFRTd2hQT1IvckNTeXZqZ2gwczIveCtuK1dSS2NDZ3JXbGMw?=
 =?utf-8?B?RGJqMFFXMTFnTVl5clFsV1YwZTR0WHJIRHdETVE5SHJLT2owenZ5U0FYQndk?=
 =?utf-8?B?ZWZqTzZMczRoci8vRnJ0VDFDM3RqU3p0MFpOS1JDak8ya0VLbHB4ZlB3elBJ?=
 =?utf-8?B?ZG5uWGFxSWh1Y21IOG1BTVROeFlrakZndVovUnZvVXMyNnVtUXNmMlpGL1Va?=
 =?utf-8?B?dmNnZ2Rpb281cG9BYVdQZ3FPQUlQUDNvNURJZVFBWU9qN0pobjFxaFFZQXRC?=
 =?utf-8?B?SWtHTlhTN1JmNTlkMVF0Q3FGVWw4bDJjZXRHSTFlakhia0wxb2tpai83cEhS?=
 =?utf-8?B?VUdDRUZDZ1lGazlFV0FtSExEUEVoaGdtV3lYbzRJOVJXQWhodmdRR3FiR0tC?=
 =?utf-8?B?MHRIT2VKWTdXSUpTWklSWkNZY1hnTlVITmQ4NlF5UmxTYXZTZExlTlJhYmJF?=
 =?utf-8?B?U1lGZ1k5VEw5dDUyallKZUVJSEJkNmdndjg5Tko4M0EvNUN3dnkzeXJYQ2Jv?=
 =?utf-8?B?VnNkMXdrU2RHWU5XdDVHMTF5Wk5QNndNb2pGbGN0SDNodW8vZ09RN0xmZFRt?=
 =?utf-8?B?ZTV2c1ozdEh2a256MUs5bVE1VkE3NWcvV2N3NU9iSW5ibmhNWkxnajkxV3Zh?=
 =?utf-8?B?N2loN3k1RmpaOG5TM1QyZ1l1WVNRc3EwMGcvcHFidzYwRlA0L3Zrb0tVd3Jw?=
 =?utf-8?B?VnJvNjIrY3hBSTRicnkwemozZ2xZSEhNTlpDalFmYm5rVnNOMXo3YWFqR2J2?=
 =?utf-8?B?dmlKNDlVMVhuaW5raG5VdXl4alNGMmtYTjR5V3NOYXh1ZUVnRHVYU1l6M0Jn?=
 =?utf-8?B?NU15MHRZQ0dvdDJxVW5VMGNJMkI3aXBLOG1Rdi9tYWd1aG9WcTV0NFBUSmJr?=
 =?utf-8?B?N21IZ1N1bnJZRzk0RnloQmwvUW8yZGhUY0pVcUFISWo5bEhqd3I2RjdNaGZl?=
 =?utf-8?B?UmhjZVJMdkJIbnNnY09UY29vK0FWK2pFZUQ2U0RIWTJCZkxBRUJlOEJXS0ZB?=
 =?utf-8?B?TGdWT3poRkZTcU9vejAwbjZRME4yWlVldUtOS1NRbVc5TEwrTEx2SmJPc25D?=
 =?utf-8?B?dWxod3JzYVh1YytJUHpJL2FpaTVIUkpYZEhlUko4bzBib3JxSWROWlJFc2hv?=
 =?utf-8?B?bWJRV1NDaUF1SnFNYVNjV1BNTlpCVk5DdHRoU2JWZm90cExaVW1HNE5yazlO?=
 =?utf-8?B?N0JOUDdSVHp4Y2VaQmtVTFZVMjNteGx5UEZ6dCttUW5md3BPQi94Qkt1U1JN?=
 =?utf-8?B?TExYVnFSbDRPNHpNQ1lEWGJDSUU4ajJEK0x5RjVLTTZ1T2ZleGlZUlBsbnRZ?=
 =?utf-8?B?bEJ4U0VpODR2dkhHNlg4YVBEQ3paL2dQcDdDa0hOdzdYRGppaHVyK3ExRkI1?=
 =?utf-8?B?SzJESUk0YU5CS1Vzd29GNFdzWXQzak5FWERzbFdVSFpnd08wZ0tZSG9WT0xE?=
 =?utf-8?B?eHR4bzE0Vzg5WkVEeEgxK0g0ek1LYXNKazVyM2NUSVNrNm5ITm5JZmJUTUdL?=
 =?utf-8?B?akIraFdvZnBVTnFsZEFNOWFVYjdNMDhKNGNUNUUwV1lUU1R1ODlBZks0Qkt3?=
 =?utf-8?B?NFkrMitoTUgwa0ZMdEFiRkFBN1VSa216dWsrRDQ5NHlqbWt5NnRvcm9DWEov?=
 =?utf-8?B?K0p0R2Z3aXZlU1J3c2tBeVlUMjZ1dHduUEpFNTBjby9hRGtJWU10emwwSTRu?=
 =?utf-8?B?Sno1TXFmR3M4ejQxV1IyNjMwZDBNK0F3WmNBVGQ4T1hFSnRlUitxWU0vRnpS?=
 =?utf-8?B?YUxyWHh3TkE4U1Q5OE5TVTk2NXVoQUZSSkVDZ2plTU1xblAvYnVsVUgxY3Ft?=
 =?utf-8?B?TmFDMUc0Yzh3dUQxM3RWM01sWXpNZUxtM3lObFh2TG5BZ2FacWI1M3ZVeUk1?=
 =?utf-8?B?OU5nRmJqR1hmbFhadDIyRVMzbFhLazZsVkQyck9ObExaWlRUaEk0YkpwcFNn?=
 =?utf-8?B?YWluTTVON3h1N05OVVl1RG96S0UxMVd4UklFbTBZQVZYd0ZqVStlSjRGS05O?=
 =?utf-8?B?d2tJTjd2SjNsNERuMUFibGR2QmZlK3Y0THQ2Z0xXOE9iTnpIcXBCVzJHeVBm?=
 =?utf-8?B?UzdUcktEeEVvSEJORjJXR2FBZkhwTVJpTGxDaUZkNFdJSllESFNYaTJ1M1FH?=
 =?utf-8?B?YlI3SnFvYW9kM3U2R0plV3RPR3RnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fa8098-fc69-4269-2ce7-08db68f919f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 14:52:09.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6f08ml4+08M6u+wPAXyQtKSC8lggUZbja5zXzQPdl2AcbdRYl9Cjhx1b8Y4p/xpFbVu/sEhEYxuudfl87fEj0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/06/2023 15:42, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Move to the device-managed version of clk_notifier_register() to remove
> the need for manual cleanup. This fixes a potential issue where the
> clock notifier would stick around after the driver fails to probe at a
> later point.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 438c30c5d473..162f52456f65 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2992,7 +2992,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>   	 */
>   	if (pmc->clk) {
>   		pmc->clk_nb.notifier_call = tegra_pmc_clk_notify_cb;
> -		err = clk_notifier_register(pmc->clk, &pmc->clk_nb);
> +		err = devm_clk_notifier_register(&pdev->dev, pmc->clk,
> +						 &pmc->clk_nb);
>   		if (err) {
>   			dev_err(&pdev->dev,
>   				"failed to register clk notifier\n");
> @@ -3052,7 +3053,6 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>   cleanup_sysfs:
>   	device_remove_file(&pdev->dev, &dev_attr_reset_reason);
>   	device_remove_file(&pdev->dev, &dev_attr_reset_level);
> -	clk_notifier_unregister(pmc->clk, &pmc->clk_nb);
>   
>   	return err;
>   }


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
