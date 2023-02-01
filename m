Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AD0C63797
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 20:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjBAUVO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 15:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjBAUVO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 15:21:14 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436BE4609B;
        Wed,  1 Feb 2023 12:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABEnMw4U8i13AnT0cVlFByIXhMMt0Nj6PzkoCaIj830FF6an0j4bN2JdSpQh2sekYIVlEr1HYF1vnJXVF1RC0UgH0vUS3x2BR1OM1kuGM9ZXunJUTfWAE02/yjIaDiDfXY6pOX2E/8ACELB1BiCru9eAD/dRGm3fya3GnzLMn5vYSZVqdrB6RUZvnOo5h3ZTvzi0HZKQO8N/0NaO7JRl/dAYBGQYTzfEXBITC3eggW+hbyrePuubYczKNXD/zxD4TL+MQKJTOnlQgmsuv9kCC5QgymCoAWPhHuR3GG4ve3ObtEiVXWpLHP1QwbeRB20h2cpfX4Ppq1gUNUxg4jFlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BC56wKLORgMC98xJegsBORHaytkyTLdX7T02iA4Vd4=;
 b=d/5+pYS6018PQv2K7nrERfmlR4NxbE729S90lDqIdpDesl6Gq+ncPqjqdA3tMaLlb4GsR8KoIHVWK8PFW6+L8ecxkYRMym8gK6BWhzCAfGDRpgPCCb/LewdUM1EXEDpaPFZBTlblO8Lon1Ii+m7kQoHcqsmtN8OMvkcRXvBMSSLR14G3x99w+Ui+FJbabnqlmnBrf2Idnubf4OLraZ+vlqc/Z2RMoUjPrG8pQ/sUCqKrKjm3nx+vJomk38GO6wzUulott+fDf9CyjWha1d7yE1UeenDSkj18ulK8vxvBDS1Lhvu5qAVYtn7vwMMCl1FUWi2347Ehc1JghLKXMyxL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BC56wKLORgMC98xJegsBORHaytkyTLdX7T02iA4Vd4=;
 b=glBzd/+V5GEsLvQ9U17NIn5TzdGYj8Z61L7i/JpVWbTPCB0ltjDJxcgSzRY1lkQutpncPArfkgAdrAsibEn4PaMIkYJ5n4N08M3a/7xHStAXx0IRjQJX3B4CNBX98GCILtMIu7BQ533dNcDW89ro3peZ3GX1fjArTDq40s4c/cHh2YkbYsaIDq1D+1F7SP2cPJ6mpGvgpmlDRJdJjgfH/HyDuarYJAR4wOCs5vBki4b6vWAza2QrhdZKcj7rJzBT0tFjlP456wYzervBj8yd1Ha11JQ59H9GqrXF4xAc+geF23ol0FIUfq5z1aanlt4jsThEeZuU8r7QqODJMRWWCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 20:21:11 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 20:21:11 +0000
Message-ID: <b7576f93-45e5-7d5c-29e1-e95a2e58f118@nvidia.com>
Date:   Wed, 1 Feb 2023 20:21:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V10 2/6] i2c: nvidia-gpu: Add ACPI property to align with
 device-tree
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>,
        Ajay Gupta <ajayg@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-3-jonathanh@nvidia.com>
 <db53d28c-119b-90c5-de47-bf7a3561552b@nvidia.com> <Y9qZsTQK8G8gW6+h@ninjato>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y9qZsTQK8G8gW6+h@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0334.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::34) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW4PR12MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e598cb2-b7d8-402c-fdc0-08db0491dc0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWEOH3slr/4ijVGEputdb36lIjJihyrVNW0w/WY2F4nnU3Y6TxJODtRpc0lM5+iV/bE8FPsaxVusO4DMko5mqOUOldSaZeP1ZvG0o5oIwkV8uauBMxF1yxx760DamNUXF2+L+xj9p5vJ/7xSl/dcllI8B8AdL+M680tNID4FIv8pdLFBaV8jcufT5z+7Dxa3a/TI7u1lIvEyba7iekGt3qv7X+hby3zLYvac+Qehl0yEkzoxJpbhB6KP/4Kv9jIlGqzU/U8oLMcIyii/e3ISB0L+XgH/Vcnibmn+wr3FniugnsEqJ0WJGrBdPNxMeJzbol/qTVJmMCRUWDJrkV9BL2ub/3HugWa9nqCdqXrrs1DB50qubjXWAfwzdWGSfn1VyCoDwWYANrzMYMeZHWW7r+Uuv0L57rf3uY9vLv1EO3x7//ef5Wh6XD96lVWfdn+2eD5+8vmwwXjWYjNUjdXdiQOuTJJwbk1CRdtmv00jGW/ez4r8fk/pygDCSRA29dn1IzqMB7r7fNLhJbMyi5uqtIvA3mPamFEfJbv6g7wj6D8Lrf3AURa5O4lHM8QP5gTzD3huuKdp4P1Q6B3Vw2/kSl2gm/x6mNP2Gqqh2TD9zcL++ihU36nnNpy4osVRky7sbmKeFW9DWfp1jbT0Tx2SioOVlm77hPDDskN3Qxbeq7lj+ufmPjlAHlbzOEIXrnWgYfx1euW0bltvXosPzsDh4vc9GPowFUzyxMviZYuUljKCyKmnt8RQVx5vMCamvRjg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199018)(8676002)(66476007)(66556008)(66946007)(2616005)(6636002)(110136005)(316002)(6666004)(186003)(53546011)(36756003)(6512007)(6486002)(478600001)(6506007)(38100700002)(86362001)(4744005)(31686004)(921005)(2906002)(31696002)(5660300002)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0R6VTNEeEhwZnhIU1lhdEdpbnhqMkk2K3FVK0dTdi9ldDNMSjF4aXVhZGh6?=
 =?utf-8?B?c0IzaE85N2lzYWx4aGZFem5qdmdCVmVqdXFHeXZYaUtUa2F0Q3orTVFRcDJ5?=
 =?utf-8?B?bmlzSG9XNkhSMlNNaDlYbGkxWDlNdTluZzVjZWFScnh2Q1FQa1BtODV5OWcw?=
 =?utf-8?B?TlU2ZURJYml4dkk4d1RqdVhUN1BhRjRBWWNDUzNhZG5DMHpKSERsWElsczlT?=
 =?utf-8?B?ZGFqdUJVSjJrTXN0cm1EcmV2UEhkVDZZZE15bDFINVNvRFB1eVZnaFhhUkdy?=
 =?utf-8?B?YlUwclJDSGE3aVFDSnd4cEVFbzhCWUpWSWtpbEZKNXVuSEtTWVdNSDZGOHpE?=
 =?utf-8?B?UGMvaWVlaFJHOXNCby9SaE1uSEdkQXZmeUZUdjkwUHVxUTd5aVlaQXpqcU96?=
 =?utf-8?B?L0F1cDRxQ21CR1BRWXZqMUpBSkNVV0ExNUlGUEdGQkowYnVickVwOHBWb2x0?=
 =?utf-8?B?TDFnY09CeEc1WUYrb3NvMUE0dURwS0ZMK0YwS0gyVFRndWtrRnhxeEtTZ3Az?=
 =?utf-8?B?ZDRPYWwyZ1Zld2dxUGlWTnMySENzMU8zZFZ3S2hBc0o0YzVNYTlGZ2paRmpy?=
 =?utf-8?B?RWhRZGdWRTJVRVpaRFZJRFlrUU5NTlFTU2dndlVrRkpXdUVWQkozb3U3WGhB?=
 =?utf-8?B?NFRmbW16cTFMMEkybGh0RjY5eFI2bVdpTFpZaDh2Yjc0VW94c3hYSjJMSmpn?=
 =?utf-8?B?a3pKdWtWMXlwUmE2U3AyOWRUVkNlMFpHcUJRSys0NVBUNjFJaGljdmcvbEdZ?=
 =?utf-8?B?MzgyQ2RRNE9oNm1hdkV6Lzh4ODA1KzRLSjdtRmFwellic2FldzZuUVFtbzRO?=
 =?utf-8?B?Y0VaVC9UMVJOUkw2WjBWK2MvalVoclBXOXlqVWVYMHg2SXd0WFpwaWNZbSt0?=
 =?utf-8?B?aHdWWldZWmtpOFVSU2R0THl4dWVMaTM4b0ZXbE9PRGtZejU3L1ovUUVYLzNn?=
 =?utf-8?B?bW1jSFpyTkkzVU45SFAwY1B4NHF4eXhnMHFEZm5kcnNMYTB6bVd2S24zd1Zj?=
 =?utf-8?B?ckpubWJwTTM0TUptK1Q1OEZHUFBrYlNIMXlxY3NOaFROZFdzbU5pZFhpT094?=
 =?utf-8?B?L2RaQkF0M2FGSmgzaVh5dGkvOVBCaktqbUtpUGV3WmJzSEVHTURJL2xuVnlP?=
 =?utf-8?B?dzgwZTdIZnd2Qk1WSkpHUjYxVVBjYzBwbnh3aTFIdS92M0VRUWx3NTdERFM1?=
 =?utf-8?B?cEU5dkxKUWZoUUtmYkhHdTFIT2ZMWGZvU2hxMXlvNHdHdkhEV1NxWlE5OW4x?=
 =?utf-8?B?VldlTUZnam9KWmk4YzdsRDNHai9YTElDZm1jWDB0SStsVkFvTmpuZEp0eU02?=
 =?utf-8?B?SEY4REkzMHlsVnQrNW0zN1M3akR3WWhOU2docUdwRXhtakZHdkhDY0RXK0NX?=
 =?utf-8?B?M3BDNFRnYTFIWDhDaThtMWRrWFNpeXhpQStRQUtSczFTUE1kWlMxSEtnVWVm?=
 =?utf-8?B?WEdlaDUybG5CU2ltb3ZyYWwxL29Ubk56ZDMrODdKM0o0YjdjdXA2cVYwbWpj?=
 =?utf-8?B?VWZwTW9Lell3eVd1UitZaU5VRlJ0WjNxYUlMSnVubHJpazlFUkF5aDR2eU9w?=
 =?utf-8?B?NC9MYXhaYkdybjVaSEc4WERmeHZScW0wMWFSbVFKTTZPQVQ0WFdRMEJxQ2R5?=
 =?utf-8?B?dTlIdys0U0JWL3Zvb2JFYVdhQk5iUlNtOEo0UWJWTXU4bHN0VWRmN3dRRnE2?=
 =?utf-8?B?MXhObjM4REVzUmR2T0JRRE5QNjZoN1Vnb1VFWUxDcTRXU3R1cUVOcXBORVcw?=
 =?utf-8?B?MGNkamxvajBXVzhMZE91RmdabVFSVW0zL1NOYk5ERzZlNHozamZTejNYL1M1?=
 =?utf-8?B?NFpmWWs2dnNTNEw4WVlhRzJoN2krckRpd3pJdldqOXpPZmVHeFFJam5aVXY1?=
 =?utf-8?B?SVpjVG1mMmlHZWN6VEk3WEgzeklSQ0s4WDRmbWtodVhjSTh2M0VjNUxtZHB0?=
 =?utf-8?B?WjZ0UHFNbnhUS0FOckdlbnlCNEVCNy92QllUOUZsbFM2QjAyMlZwOHdjZjRN?=
 =?utf-8?B?ZmpxMG9odkN6NDl3Tm5vZ01iam5zS3BsOENnMFkzNm5tcERJclRjQ2RHR1Z6?=
 =?utf-8?B?ZS9LaWpJcmJ5Y3VHWVhOYXh6dTFmcGJVejFDclVGSEx6K1J3Nm1PZU1PalFK?=
 =?utf-8?B?YmNjWFdtdzUvcU1rampMNldlVjJlN3E2U0h4WU9pVjFEQmRGTzhhYytTYTgx?=
 =?utf-8?B?TjlkQ3ZqWXpobEorUWFWUW9RNTh4MHpSWmI2dkZEdHZnVWI5dTdyY0xaS0U0?=
 =?utf-8?B?cTF3bzdIOG82bC9Ya3RWeWJTMStnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e598cb2-b7d8-402c-fdc0-08db0491dc0b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 20:21:11.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsEn3Husq3o0IvQ7KlFLyYuSI7MgKZpdU7RyVKZbbQaHNt7SZ3gZoiZfsXShVHPiAl9GBNVCot++I8pN2UMFgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 01/02/2023 16:56, Wolfram Sang wrote:
> 
>> Apologies, but we appear to be missing you on this series [0].
> 
> Yup, me, the i2c-list and the dedicated maintainer for this driver:
> 
> $ scripts/get_maintainer.pl -f drivers/i2c/busses/i2c-nvidia-gpu.c
> Ajay Gupta <ajayg@nvidia.com>
> linux-i2c@vger.kernel.org
> linux-kernel@vger.kernel.org
> 
> If Ajay Gupta is happy, you'll get my ack for free.


Adding Ajay.

Jon

-- 
nvpublic
