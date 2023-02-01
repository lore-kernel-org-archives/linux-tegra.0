Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DFFC636CD
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 16:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbjBAQCN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 11:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjBAQCL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 11:02:11 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F0D172A;
        Wed,  1 Feb 2023 08:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpBS0bgYL03pja0Ib51vWplUsWxliKq0kGF7bIa7eB9D7waS8TO3dN+l4xyp/C9uS/qESo32QFU3jO5ZiYBhfm2NGNE5Juc7yqlyBtS1/1f1FBoDjoWaulBHkZ4riaEPKZ1zxIZmPdl69j8seVrSU68kqPXuEXz6t72g8njh53kV13wYVQJVEXnH0sMzX9zGTPrzypRUvDVeOI3j5EvmXYV+z4Ko4tvMB+ywgmcTIi/c4RRjepeB0UQyRuQy7TJM+HCl7ZXTye9J+7qAQRqtXiFsJzOFaWocRM2O65NdTHzy65bH8rINdJPdhnIFgwXm/OyPgY2sG0VpcWxIld47HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ2u/HTwqKNmm/SMZYwvVOYG+qczj/imK79IxdBYypI=;
 b=Vqmdh+hDP72rFtei4iVOFiFijVUHgSUYv1M9Kc6PdvZnwbqglttZZnbAODDZthfwRs8bRfV8x0TRf0l9hwrNH+L3NPzhwFJjxCRrvT0NOrkDYCLFSbQi4G25Rztdz3niGCTHe4nYEtivIkCvFYK0OFWBRE7Ru8/F/GLmPfptgyTNoadepGpZK5CARc+atLzJz+1u87vaF5506QPGexPk4vbHZn/r0avqfAOV+VH+tn/rm94/2e503GOAGEzf8/AdksrXcXGPUWpq7Iq6UgwpfSpcVNtyd8veBxjFh7hKohGfSljck7HC79ga7UUTmqG9qIAnRRjSpi3lPepAyEsvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ2u/HTwqKNmm/SMZYwvVOYG+qczj/imK79IxdBYypI=;
 b=oxKf48MyHcD9KcIOXrtNT2MaUUSaZZ+JhZT9V8kteVOpvkAkhXxPw88k2TWEO2lfrf6XhLSf0gxTqBIkPfTP6PTRE1SH1VFgsnfSkzFnaseMjXRhsqPYV4hKoWTGJ49n2CTpTKVt4JXHlfuJHNf8w1nRNwdtzinvlSsYRHIOAwF1nIRBsC+nnZl1GllhQcyHHpy+1dvMOSxiP2ETj3zkC0kx01YSdvf2HWYpGAQtMLHlIcXCELCNa0ptlueVa8IN1NhemQBbQyCFamtYPKHEdLv0bF893Dwg69DPsJ1RwD5aLU1YNf9XkxbyDLrBVykRy6DTxOlJFTxjPcdFdtfYCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BY5PR12MB4870.namprd12.prod.outlook.com (2603:10b6:a03:1de::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.23; Wed, 1 Feb 2023 16:02:07 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 16:02:07 +0000
Message-ID: <936488c6-f86d-3552-1a35-1039eca55c00@nvidia.com>
Date:   Wed, 1 Feb 2023 16:01:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V10 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-5-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230131175748.256423-5-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BY5PR12MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: beab92a9-be30-450a-9f36-08db046dab2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KwiruOJ+4nBT2EpTdBS/MuZzQyeelIYN6pn4x9nDuipbVlBte6R9s4wjiViGiz2IulrM5sFlatU8BfHHRJ5C30ddq0KkLZQsxrod0C5rqbWseyMU7r46go9zWTmctSxSUYxHMpgtJONU5Va7UCXN019i/s4fQmHGlbxmB4JuWdd9LPq9JwrpDuPeYkCjLx15wIhBiu3j20Vl/kSRH1LSPcSH1Q5J0zNpa3SKuKpzq4hZtV09yCWy7HTUpccdJvvoSuXIl96ZwjC7+EszI5DQwOFUCipSHwyg2wN1mSXtXlsEogPEs8mCCGCmCpbNAf/FNOB+E3miAIUyl2OmoHhxrDGilE3xzI/uxWGuhrnk6GKhQBcLl0S6RFbCZb/dIPRymqsxKPPULh0uFXt5RK30IvQIWN17GERsd4EJvnKJztRJDRzBnM9/1aplKZKQVDd+IoQ1wcV7YmshRuCASYBodfHu75xdAOz4R18tSKtmZReFHMR4L4MqFfB/nUHntOFtMmrKPzR6VFB7CEseWr2w7fbflDvJK83NxixvMykvn+MCgpuqrJXX4HUzI5i89rnO1AjtMmWasTjRbMwM6TuIDKVqBgmLBuMbdL0BcKc1XhnMZ8Fppxva/cAbaSdXfUGS3o/q3P2w1lydpRqqrRNn9lCHfsnOijT8KxUE2c0klkmWEu/8P002bqVwuVCV7eUlScjT/CPEboSxFmPcXcrKh7v664UOPbdk1xwNOUVieXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199018)(6512007)(53546011)(186003)(107886003)(478600001)(6506007)(6486002)(2906002)(83380400001)(31696002)(86362001)(36756003)(316002)(5660300002)(8676002)(110136005)(41300700001)(8936002)(31686004)(2616005)(6666004)(4326008)(66946007)(38100700002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGp0S1c5YXN3QysvQWdHQWtWRGMxVGl5QjR1bTQwSHBPdmI0ZDZwODNQcENF?=
 =?utf-8?B?WXc1dThzVjl3ajNuSVN4YlQyc2Y1cHVkQWxNSnNNb2FRaTNLWVdNcmxDSHJR?=
 =?utf-8?B?VWdZdnIxaVpITTR4RytTaCtHWmswekhnS1NBamVZdW8zUy9JUFBHdzRRaENv?=
 =?utf-8?B?S09FYlFtUnd4SUZTdmZSU3l5bVkxdis0Slg0NjljTXlvMTVaOGtwTlgzaC91?=
 =?utf-8?B?VVBpRjRZM2FYeDJpZmZLNUZVaXh1VmhKaE1kd0ViTWJPT21tQkd4MVFJZ0Fj?=
 =?utf-8?B?Q1Q4WXBFYWY3cFJaNjhvdFRBcXAxYVhvVjBnY0VaYzdxZWpBQmJ6SDVzbXU2?=
 =?utf-8?B?ZHpuWG4xdTErVjRZblFNVXhBNlNrQTVCdnVRalZxU2d3MlhJZkI5ZGFIU2NM?=
 =?utf-8?B?S2QvZGpINlYwdkM5aEl0S0ZaRDdZNWJFWFBVSUdBNm83WnFNbmNJSUYrT1BB?=
 =?utf-8?B?WkdkV00zUllhSVFEdzFtYndPRi9tSGdHQVdoOXpxaUR2aVlNbUtTWlg1VlBk?=
 =?utf-8?B?a2syaGJLeWFwQVVnU0kyTS9ERUY0TDFGZ0MxNUJ1Z3BtRkQ3Tm5xYnF2OWdH?=
 =?utf-8?B?QmJ2ZzBFbm9BaHpMeTV6K0lUVjVUQUZhUkxkUWpESi8wcHc4QnI0RTdxd3Zk?=
 =?utf-8?B?aXdSazJjU1pBMUdUTElhSlh1L3ZVTmM2dERBSFU4c1BmTFRWbGlPR3c5d0c4?=
 =?utf-8?B?UTJzQU5JWjhiVW1XTE5jYmZ3Z04xeWVDSkY1NTIwMEx4dXF5d2V0Q0VNMHpp?=
 =?utf-8?B?WHZnYlZNd3BPQ1IrRUdTUW8ySWFnalBnVTdOaFFBQ0JzVkNQekNIM2xrNjlH?=
 =?utf-8?B?ajhHQkNiQks1ZmFiY0tDODRIRXE0d0p3VTM0OXFtcFR0ZENkRjBFb2YybFFS?=
 =?utf-8?B?WWNCeVpMMW9HaDJFTFFWNThScCsvbm9LWk9ic29Sd256eVBEOVkxNU4rVysy?=
 =?utf-8?B?REplRlRqNExKMDg1UnhLdDZRQnZWbGRkQmMxSUxlU2xmbGdWQ1RsSDVyaERS?=
 =?utf-8?B?ei9waFBtN1laMDV3N0w2eTgyNTNEVkRINm1YMitBeGd4RlJkajZLTVNoRUE5?=
 =?utf-8?B?a0ZTd0hUTzdZb1NJTWlMTTVZQlpVZG44VHN0cTVSbVFmUlhIQUUwTTYwTDZL?=
 =?utf-8?B?UU43Q2lVYm4zNTdYT21HWVJLNmkyRmZPaWprVDRLU3ZlS0RCMlVxUGdUSUt5?=
 =?utf-8?B?QjNjL3hsUGo0ekRsWHJ0a0dnRkxPbndUTWNYaitSQUFKL1ZMemt1c1BrejVU?=
 =?utf-8?B?Q1VxYU5RVjdibnhQTFJKSk5XWk1heW1xaENIdnJaT3BZOEtWWnEwTXhtMWN4?=
 =?utf-8?B?ZkF2R21RK3VSTEthNWplNThFOFFmalFJTzBjV0FxU3RXNkhPQXBxNnBaMzc1?=
 =?utf-8?B?SHZHbW1JTmhSUWlFc3p0QjhEVjdKbWptTUEzekVleEtGNjR4bDYxdVJ0Q2hV?=
 =?utf-8?B?L1d5Yk9VZ0NoclVDUnBleG9DTzhsSm1mb0ZwOWZyUSs1RE9KTmpmVWUwZWpV?=
 =?utf-8?B?Yy9KRUNOWEJhWm05c0JHem0wT1psN0VKLytWY3VmSkt3bENXNzZXbWtEWlFE?=
 =?utf-8?B?UjNkZW9SVEJIZERLZTJMSGNYc2ZGRHVEVC95Z2hMMXhMcVg1MUZkaFp5ZGRo?=
 =?utf-8?B?Zm00Qm45UmZNSGZKQ3ViaGdwZHBzN2YzM1hCR0FrSHhzZDd4MFg5U0xoRS9w?=
 =?utf-8?B?bVBJMklmYnlIZTRRWWVUN2MrclNFa2xlaGRzRm5jVW1tZk41SVBlZHBWQ3hX?=
 =?utf-8?B?ZFpqUmRmazJlS2hFWmdDTVV2Nk9EZTJPaEkzM2Z1citZYlJYUSt2STIzUFN2?=
 =?utf-8?B?VkJTR3FRR3REQ3o1eWVld0pJOTlpNFc0clVMSnFNZUc2WmpxMjRpN0dsdDRM?=
 =?utf-8?B?NXYvUEU0d21sLzNIK01xcHpJZS9OdjliV0FBcVpuWDdTWWlvclZ2WDRXZ0JX?=
 =?utf-8?B?eEt3QS9GUkwxeUk4cE5mdWR3b0FRSGdkejk5bEQ1QTJVM0crVmtSRFFtRFBT?=
 =?utf-8?B?NUtTa1oyZ3JaQ0k5UFZqUnhlQ2xpd05SNlVCeDFmLzI4YXBUZ0Y5c1B2RlFq?=
 =?utf-8?B?M1NxaVhxdkNsb1RrYkJBK0ZlUzA2WDA1VXNTSk5tbm92ck9udk50QUh2RWJJ?=
 =?utf-8?B?ZVpzVWpTVVdTTWRXWnZDOEQydS9rczk0Z2c5WnY4MENNNm9FcEdVZ0JkNTJX?=
 =?utf-8?B?K3JDQklsc292SDZJOWliVU1UcDJRb0JmWEpJRHhHQVY4NjJYZTlSeVVZN1FH?=
 =?utf-8?B?M25aZ2FYa2lmcVZibUR4blQ5MlNBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beab92a9-be30-450a-9f36-08db046dab2d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 16:02:07.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6Zs/tspciYNRuT2WPqz3Ajf8VBinQ1wQI5ikvzIlJWuGky+zfZSQcA/K70j6mnLBE3yULbTvIqEl2JUB21daA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4870
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Adding Wolfram.

On 31/01/2023 17:57, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Now the Cypress CCG driver has been updated to support the
> 'firmware-name' property to align with device-tree, remove the
> 'ccgx,firmware-build' property as this is no longer needed.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V6 -> V10: no changes
> V5: Added this patch from V3
> 
>   drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 6d81ea530a83..a8b99e7f6262 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -259,8 +259,7 @@ static const struct pci_device_id gpu_i2c_ids[] = {
>   MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>   
>   static const struct property_entry ccgx_props[] = {
> -	/* Use FW built for NVIDIA (nv) only */
> -	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	/* Use FW built for NVIDIA GPU only */
>   	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
>   	{ }
>   };

-- 
nvpublic
