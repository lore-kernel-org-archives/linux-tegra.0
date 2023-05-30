Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664B4C77B7A
	for <linux-tegra@archiver.kernel.org>; Tue, 30 May 2023 11:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjE3LTW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 May 2023 07:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjE3LTV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 May 2023 07:19:21 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776D0FE;
        Tue, 30 May 2023 04:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1gfH+QkNF5O9Ngwkq9f2Rf4kSgxqYD/hvySQnCdx4btcbAZWd4xtsAo976uaoX8M56NEMznooBl2T3nVzp41j2oSRIzSeOxLyeekPdP9IfvGg/TDfO3zVQEtgDOTnfgi1jwds6fErSxmdgUoIUMEfWyEo4BO5NNtwletSeBeOVJQVRSGpx4cEAKYhEyPWJ0oRGOyF2zqtDInQtaZ3N/nERPYb59hjNaZswVQ3cAeM+SpF6mKFdyoebn99HCpuQe6u7IA1sDxNvHAA2JG8lRz4qzG3e7bxPUhQgyLqhVOzgaVsiSEmeXIW+SaHLz7xtR66HigRaFGuv6Iqzcl8MLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vae/t9mqjqAf/4aM1Pn6xmEjUhJvNByP8n7VJg24qz0=;
 b=gdIwW97rqwsOCLcE/2fuwSSqOwooZ9HJ35WO5aYiwJq0pGiv5s0dpZ1mDZzxMHA1Zio3iTac3hriHI/1VYupVS8IYA5mWtzkvGvsYmkEKTlCEwZ6pZzFvddS2zXNHSDxWQMfy/Hn+bf65UMDoJAp/I90dW7TUsLSSONsvaGm4qxA5hUmGrQWCeL8zeLzyTg74LxpIKp65AkbANi1DcGhnDcSum9sri78OXLnw1NTK2G1JKgBk0GJLmZ+stDeFB9R4uvTBKqlj3OCyzXCs3GSc/KXP/vsbRM9hTp3D74JHWD7ZRIkFd10MzlfPKwrTdwjCmz5vYs8fezMBcrt/qjMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vae/t9mqjqAf/4aM1Pn6xmEjUhJvNByP8n7VJg24qz0=;
 b=fcOLQYOegcr43PTGGMZXkiw4dnhj9zJDZEe+chKP1LkRbH8MhMR4ofdEZXOxZI3Z/0ZwQXGRoIPt4YJUuABQhaLR2MGB6BokxU4+2y18WNYRohdMh/XN/VkV3527L9YWduTtbopFAeHWQpcyOT/gs3Uz6D97yMU6fxfT0mkw1zKPKVxRVtIIAod45xWOZYpNM7YUmbyN6vhsCKduxqSkGFGRhM/hth3vuTQwnSmW3xgMSleFBUtmiSAf/EzS9mq1WIkplUNYWQOP10h/jOlFciAdMNx2FywhtrFgjKTSOJhQFfHR1QS3nnrN1UTmYqfJWypnkXiYoDdvDvG64KtSWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 11:19:17 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 11:19:17 +0000
Message-ID: <00382245-5bb4-6fd7-0654-da3e39b7e9a3@nvidia.com>
Date:   Tue, 30 May 2023 12:19:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] dt-bindings: gpio: Remove FSI domain ports on Tegra234
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Prathamesh Shete <pshete@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230530105108.1292681-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230530105108.1292681-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::25) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN2PR12MB4062:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e60b45-a086-4dcb-96d2-08db60ffb4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XuzRjO1H9fuKzp/TXAyUtGUXBojeTdThgmAnWyWM7ky6ieiUHKTPa2An3BA76yeb/x/TNh3PhvgY4CXz9qsSYY0Gq6U3FiTawI9gcLcvTiJN7iMgQo1PHcBU646dkh3QOsDoBGhOyuCgOK0Eq3zGEhIAkUObAEHfbB9jv8ZO7jXbcNB52W9QbJjnuJfmqMCbweXh4uF+fBUXcUZW25Vf2Jrv/UkUiYVy4WRi/Q2wqEEdFCbsB9Ik66U3gIyKQZKkOgNncz7Vf12LZ5qLLW7jAQ2hXytBLsXbaOdgKi8YI0eLc9z4TK28OAS+UHdUe9HaH96aXV14gxFVxwzUKdU3dkE3/Y0ZBWNrRJrjgEQXW7Nl3sRF+BW2TB67YNBHoq0MmO8xpENURctDvVZsfqVRXIS7eCsgZ+iGFuusJp0Tf5u0cn4X8KLVZ4MUIU3dtsarJvykDDR3w1qdrQoQ3VJbz9K5XaeG49n2/mb3BnMbco3aGq9Q8pyWApyJXAi+Ff8hJ6rOU0OwyA8M42NvYEuT8oXyp7k6ipAmIBB5TfjNvilwumKq83f/WzGqRxcHeMdPCfQ/ALpBsxX1yTZ++Iybc8R+sp4/4JghgGi5V89TGOdnLyLeIfukjhWieZAyN7v7ppVH6oi9sNhfbenHKiKfKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(31696002)(86362001)(36756003)(478600001)(66556008)(6916009)(4326008)(66476007)(66946007)(316002)(6486002)(6666004)(8936002)(8676002)(41300700001)(5660300002)(2906002)(38100700002)(2616005)(55236004)(53546011)(6512007)(26005)(6506007)(186003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWQ0bFQ2TzNraytHc1d5bEJHS0tjaExIRUZ1VEQ0Y29QczNHc24wL3lnVk1E?=
 =?utf-8?B?ay9QZlBnWnNNREM4MzVVWW1CdnRBZjI0a01ZeDF6V0pWa2w0dE5makNLeFh4?=
 =?utf-8?B?M0tySys0VmZVZEFmeW43aFZqTFVHTEliNTV1Yi9idEVGV3ZpK3N6TE1DK3pZ?=
 =?utf-8?B?Q2JDS21WMkpBTC9QU2cvUFZBb01YV2krdzV6TUE1YllCWHpmQjNoS0o1Z1VP?=
 =?utf-8?B?cUJlWFRFemMwUVJhajhLc0szMDU0Z0doUTdwdmVzT1JvRFF1bytWTC9SME1r?=
 =?utf-8?B?bUx1UGdGdUIwck4zNndHUFB3em5iK0FBdm11eU1BUUk1ZkVxTEpNUFhGNXAz?=
 =?utf-8?B?ODJ4YXllcERuaXdMcWw3ek1SUldOZm9IRkZrbEhHMExjV0Z0a3c4KzlQdXpO?=
 =?utf-8?B?VXdaQWpKRHhZQ2FKNEFqRy9hemVneU1YWVdqaTFESTNLSFRQTFhxNUREL2Fy?=
 =?utf-8?B?dzUyVzNBTUl5S3VwRllieG8rcU9XSXhzTW80akhhSDB4eUdMa1ZzaVIxeTE4?=
 =?utf-8?B?c1M2YVU1bVNUTjJHNStrQzM3eUxibUpoZDVnZjBuME96NGUrQ0FIa212UkIx?=
 =?utf-8?B?R3BKYVdMc3lNV3hvWXFjZmcrUmtZMkMvL2NiV0tUTEhpMzhaT0RJa3d2Z2lP?=
 =?utf-8?B?S3NMR0Y5RmlOTVFxc0ZpUGpyaVRMWDdyNlNGall4VTFKRVNRZGt1S1MzQVpp?=
 =?utf-8?B?RWpEcVVQLzNNZTE0SlZUeC84Q2hTUmhnSEI4VmVTUTJJdGdsZko1UjExRGkx?=
 =?utf-8?B?aG9hNnZVNHg3bFliNGFxaWVScVlMK0kraElkc1E0TE5xb2syMGxJdGVrK1F2?=
 =?utf-8?B?Sjc5eGc2aGJDdzkvVHBtN2RJN1FyNjZkWnkrWG4vS09MYkMvbWphUUc2dmFr?=
 =?utf-8?B?ZU43cGsrREhzRytxSXA5UDQ4RjN6NnM3WUY2VWhOeUdUT202KzRnbXh2bzQ0?=
 =?utf-8?B?bUVLMkR4NThCSTIyMUFacVJGY2J5YXpkNVRxVjhSYnNOZHo0cUpSVjNCenlK?=
 =?utf-8?B?Yk1xeEQ2OXdsS0s0NEI4eXNCdUY3TnVreEkxQ3pteGswUWVjRE16L1l6Um5D?=
 =?utf-8?B?OVF1WGI3N3FlcEx0OHgzT1Q5VDU3YlBJQU5Za3A0ak80T1RRZjVpam9QWUpK?=
 =?utf-8?B?akwzNGZ2Slo1bnM5REg2VENZRTY1Kzkyd1VRL2xlcHZCVWNSOVVNcng1bE5p?=
 =?utf-8?B?dkxYeElhVm4wMUJGRjF3MkVBTVNZMGswaGxxN052M2xadmU1WXV6N3hobG51?=
 =?utf-8?B?YTE0U2oxOGk1eDVFbjJJY0gyVkdZUG8xRjJzcVhDWDZyZVRPczZEeVRVeThS?=
 =?utf-8?B?UzNMdDFPY1dGRkw3bnNONFozNzg1ZHVZNnFGRWFTa1F4UVhIYzA0bzB6a2dn?=
 =?utf-8?B?alNQRDdUR2lTWDJJbExDZjdmTGNaektjUjJzN1R5bDUzWU5ZdWx1cTVzVDNh?=
 =?utf-8?B?QXFrK2pDU3FjZUVtTWR3eXpRdXJ3cDNHWFhWREpQMmd0bndoYklscEphZklR?=
 =?utf-8?B?WEZJajhuOXlxdlZRTnM1TjlsZXJHeEx4SXVjMDRDWXY4bXdPR3NucEVwWTh2?=
 =?utf-8?B?NjNVYXNhcld1S0NmdWlIeUhDbkxFeXBkZmxuc2pTRHVtNjhncmlKWnNPWmdr?=
 =?utf-8?B?R1d2VHAwR1dMNmxjUlhaUU1rRzJzS0xuVkY3bTBoTGpGQ1lkRldORHgxTElJ?=
 =?utf-8?B?YTlXS2loUjN5cjlUU1dqekJ6NjN5Y213NkU4WU9oWE5GNHJxeUdHWmN6bGJX?=
 =?utf-8?B?a1kzMk5xa3FKOFVnQlNTL3hiSWZDeHF0Z09FRys4RFVnUXpQSEtsYnRQSHFx?=
 =?utf-8?B?OUM3dlhtRld5WEFzSHEvYWJRQUZpeTV4V0UvRXc4YmJRVVk2NWxhSHRFRHdr?=
 =?utf-8?B?ZEl0NFYwL3YrNEM4eXF3STN3Mk1jMkk2V2RsYVl6Rm5TbUZDcDJiNU9hNjVt?=
 =?utf-8?B?aTZzbk9pSlRpemRTYXJId1N3b2VpZERVV2RxcG1nWEhMQzFNZjYxUVZ6YThm?=
 =?utf-8?B?QUpkaFZOcGYxWUNDVVpaOHlVYzRCdElmT3ZCc2ZBQ09hMU5mZWF6NnBLalJE?=
 =?utf-8?B?ZHpzOUpKWVVWOWFwNkVKdmZhdlZFRlhGUm9sMEZ2WXlMOEFVZmFLcVV5Yysv?=
 =?utf-8?Q?iXWnnC/znvDB+BGgz2S95k8Kv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e60b45-a086-4dcb-96d2-08db60ffb4ba
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 11:19:17.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1f28UXilv56HEsi3VNLps/qEXfmixvrKvN5yLqxNWn6gy7nEpPnOYqX+jwQF5hKO/M1wL+txl2reELv4IVv1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/05/2023 11:51, Thierry Reding wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Ports S, T, U and V are in a separate controller that is part of the FSI
> domain. Remove their definitions from the MAIN controller definitions to
> get rid of the confusion.
> 
> This technically breaks ABI compatibility with old device trees. However
> it doesn't cause issues in practice. The GPIO pins impacted by this are
> used for non-critical functionality.
> 
> Fixes: a8b10f3d12cfc ("dt-bindings: gpio: Add Tegra234 support")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> [treding@nvidia.com: rewrite commit message]
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - rewrite commit message to provide a bit more background

I believe that this is actually V1 in case anyone is confused. I know 
that we had kicked this around off-list before sending out and this is 
why is appears as V3, but should be V1.

> 
>   include/dt-bindings/gpio/tegra234-gpio.h | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/include/dt-bindings/gpio/tegra234-gpio.h b/include/dt-bindings/gpio/tegra234-gpio.h
> index d7a1f2e298e8..784673c2c752 100644
> --- a/include/dt-bindings/gpio/tegra234-gpio.h
> +++ b/include/dt-bindings/gpio/tegra234-gpio.h
> @@ -33,18 +33,14 @@
>   #define TEGRA234_MAIN_GPIO_PORT_P  14
>   #define TEGRA234_MAIN_GPIO_PORT_Q  15
>   #define TEGRA234_MAIN_GPIO_PORT_R  16
> -#define TEGRA234_MAIN_GPIO_PORT_S  17
> -#define TEGRA234_MAIN_GPIO_PORT_T  18
> -#define TEGRA234_MAIN_GPIO_PORT_U  19
> -#define TEGRA234_MAIN_GPIO_PORT_V  20
> -#define TEGRA234_MAIN_GPIO_PORT_X  21
> -#define TEGRA234_MAIN_GPIO_PORT_Y  22
> -#define TEGRA234_MAIN_GPIO_PORT_Z  23
> -#define TEGRA234_MAIN_GPIO_PORT_AC 24
> -#define TEGRA234_MAIN_GPIO_PORT_AD 25
> -#define TEGRA234_MAIN_GPIO_PORT_AE 26
> -#define TEGRA234_MAIN_GPIO_PORT_AF 27
> -#define TEGRA234_MAIN_GPIO_PORT_AG 28
> +#define TEGRA234_MAIN_GPIO_PORT_X  17
> +#define TEGRA234_MAIN_GPIO_PORT_Y  18
> +#define TEGRA234_MAIN_GPIO_PORT_Z  19
> +#define TEGRA234_MAIN_GPIO_PORT_AC 20
> +#define TEGRA234_MAIN_GPIO_PORT_AD 21
> +#define TEGRA234_MAIN_GPIO_PORT_AE 22
> +#define TEGRA234_MAIN_GPIO_PORT_AF 23
> +#define TEGRA234_MAIN_GPIO_PORT_AG 24
>   
>   #define TEGRA234_MAIN_GPIO(port, offset) \
>   	((TEGRA234_MAIN_GPIO_PORT_##port * 8) + offset)


Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
