Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1176C54EBE
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjAPPbH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbjAPPar (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:30:47 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C768F29E29;
        Mon, 16 Jan 2023 07:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhq9HkDZzyUN1s6gQkjmE/ttM7P2oFr8BZ9SEQ7zh6k2jjPQRxR1wzdBJNXoPUrkEob5Bj/KZnWSDA/cmtX5QNGp2uBBQNkmCL48qLaoDCAoWS8lphY90YnPxsVxOrOKpr8tD+UN6Sz07wtVrF/ucmWyzQ8LP+2G+c9AZV+f5ErojO7RhQS3CJjsJZDinQABQWLwU72vAHm2Y2CIrZxBIy0jeBgG4bx5PAnTBfxORC8c6IX6o5ectFXFQZv3YWk3+HIrqm5yxtsSf2EjZDWZsnWk/UkR5Wk50N4BEPdgPFa69X44z2DoOyRLV+DxQNfIQ5iTtWt9DYY04MSdaRl/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y7qGQwXMBxCj+dzo+WmMtizJ5VYqwGQLmDHAgPQKGI=;
 b=Pk3tcb/tCbozBwtqh6mfUBIEJVVCdA+AYQsIEuoHhy/Gr1Z6zCRB2IUITQ+jXyNy/xibQELrz6KkZ1WsHVvXdCUErj6pe/NuFmWCziW/Q9z/CIOr4AsgFn+BkC3LFhT5PX9Ru6QPCGY30enCbbk61WdmNvOvhbixZ0l0Ns+eBraxMc/cmT9jGvKm49l4EC8P/XnWZdh53fXFsUfvsEUznKMICZ9KTUkjjnpfueHS20d1Brwu7rquRlX82LGh1IfLtG+eJxp6N09eJvtc4cmODMTvkaegBapk/845qutRFS3EerGA3YUqTp1RAW1sUvFM2BpT7PnlVR1QhoTlk+ibVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y7qGQwXMBxCj+dzo+WmMtizJ5VYqwGQLmDHAgPQKGI=;
 b=QhXnpby6qoJwjFXAS0NlUAkLPdgeM3HnK4jwhciwngMbjycBU8jm8zSyqZKzwUQgDlei+qYc/FPRhNQxdhMpLMn5E2mMIRgophcYVVZYJI1tpofmwtgMCZq286WYxFAaUvABLcEGiOyvBKof6+0sJ2TCcLyvahScCsFwlcxv2f5Xg0awFZ5foHy11D/PEo0Tn5AtSJGsLXCTxmdkpU26CiLje9KxP/EgG7fKSrPhmDx13AC6p76UDv4kMEwej7T6pvmhkViKtEDqee9zynzthpbSUnoF/W5w9pNJmpbUdJ+teok5aY615Xxn/9nn/06Ut9y4FDWtAHQ/w90DiUj/tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Mon, 16 Jan 2023 15:24:58 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 15:24:57 +0000
Message-ID: <eff7b862-dfa6-b97e-607f-7235d250f1e5@nvidia.com>
Date:   Mon, 16 Jan 2023 15:20:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 0/5] Tegra USB device support updates
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230116145452.91442-1-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230116145452.91442-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: b1360776-e8db-4c56-194f-08daf7d5d394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9z814Klp7ggHIMGo7kD5N+lvecgFlA9IiwlQ0OEJAQja0VxFhn1i04Pz9ipFABX6yyYLRkAYVeDJVwyjbIZARGq2UZL5eqqxqMamhdOviEkDMxB2bBLvrcSkc29iP/XuuYTuCaxkDm0bmX4YaFJw3idcrg6u5oacLOR3Z+x6gPDGRwGJKgDTikjozYLhrAL4HbPmGXPAtXsEDl0f1XLOYfq7qtuPEmEOOTWucY+CFjQUZjpamBsz69xzlJrfKUR0WrubR5UucCuDDjc3xWLJGZSbW2c+rzMny2IehIAUQp6M8BUEFRjR30imhuh7AaUS1+EkVPl/XRvxFMO2KFMyAm1rBJhou+HtZpc28Rl0NDV68Hx8+h3EkXA63GhPb/px7YZujzsfz5fs2oB0QOACwxZ2CsGCPlvPFOpPn13C5yRCoSqgy8tr3BnyTiJ/dQsvXSh42r8MZwmEgZXnguXQjfdCuFb2lG5WpO2shnmCbz37Tw/uzJyVrfVMjeA2nmBCxjS2e33mGT5dMFEJw2UbjncovaBEMHTyI0sEV6ORS/z8STs4Awg1Fdd9nWGckB+VMEzD+Xkpn1xC6KI1ijlTJo6huPQhMCxhzFjevNTB3+noVtDvm593iMJf/tsOVPeyv3fb7yQIhQOhvED5LV7byED47IxqokKd7NkWjD8B2Nqg9/boub4j4nlNvCFn0c/WALuX5wp3DVpUG2j+k+IWx+hXfD3F1xjxKeD2Kv1VTta3Xnedi0kHokLFCM7/kIAkaDyBDUFgJQSotjym9vXAf1mBqy1HUtL5WB3NPC8UUX5h5HdsjzEuwR7a6wnzOooC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(2616005)(186003)(26005)(8676002)(4326008)(66476007)(66556008)(6512007)(110136005)(31686004)(66946007)(478600001)(6506007)(41300700001)(8936002)(5660300002)(4744005)(2906002)(6666004)(55236004)(53546011)(316002)(38100700002)(6486002)(31696002)(966005)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHR3MnVIRkRUb2VJNHZBS1NCeFltM1lzL2VteGl6SjdvdHZrRnNDOXBZUjFv?=
 =?utf-8?B?bk5ENDRtRXpOTUFvOHFsRW5FeDZiQlJmajN3aFJ2clBibEZZOGhHRWkrV0FF?=
 =?utf-8?B?MFRSZHh6TWQvMTk4eENRaFIweGlGYTJpanduN0lQODF5dGlCb2QvTk91cFFj?=
 =?utf-8?B?NFk5R0ZqNXN6Rm1oT3M3WVdoK3VtWHBUZ0RtV3c4VlhYbTdhNWZOUisyYlZh?=
 =?utf-8?B?WjF6cWdWZ3ZMWk45MkV5TlVqWTFPZmVUaUJsK1lqUStaUFpuMzdFMlhVUXFh?=
 =?utf-8?B?Rlg4N29DSXhlakpSOGtkWXBWWVZnVWdoc3Z6ajJCQzdNVWdpNHdBdXNrbE9j?=
 =?utf-8?B?UzVDYzF5QUNGRUxFbjA1WnFiVmZFRlBQM1lwTmdBS0NVYXVYU0J3aC9RWmhG?=
 =?utf-8?B?U3lrRHhDN3krb040QWVTVkpXZXlCYXZJRjV5RENCZ3pRdjNTazNvQVNuQXFY?=
 =?utf-8?B?K1ltUWdnUnN3YW5QVkd4Ly8yMjlsdzNGYlUwaEZOalEzTkJNbGsxKzMvY0NC?=
 =?utf-8?B?RjBUa3ovN0twMmhhUG9ZMlhiMXIycXZaNkI0WUF3RDA3THdMSjBPWEJvcHY0?=
 =?utf-8?B?MWxZMkdFNkRNbjVtSHBiWnYzUnhWT0NIYkJWOVIyUVlRMEdXR0toRHIyNXUz?=
 =?utf-8?B?T1NSUmlMQUxqa05GWi81SXF2QlNuVTZ6OGFoUFlvSThNSkp5ZldnQUUvbis0?=
 =?utf-8?B?NS9XVEE2MHBxYmNZUEZGMVBYN2plNkk0dVY0VG5TOGtqaG1OOGFwZ3BJKytH?=
 =?utf-8?B?aTE2UldVaHFjUVJwZitocGFpMDZBUEhJUWpib1lxb2dGa0JkRXZLa1Y0aTVn?=
 =?utf-8?B?NytNSUdhL05oNklZWW5telNTL0tBd2tmQkdmaWF4WEcyUTNUb3daZDBhclFZ?=
 =?utf-8?B?QlFwTGpiWHE2M2c4b3g2eU0zbm40OEIvM01ydXNReXdqRzFrclZtZDkwRCti?=
 =?utf-8?B?dUN0Y1c0bDZGbHBvRlp4K1FjVGJjUUZDTUtyM2RtVEFRSmJ6WXhoRG1ZYUs1?=
 =?utf-8?B?WWhnOHREaGRoMWFMUWVyczBUOEZGeCtqYi9VaDl2MTRJVlIvVUk4NWdSVS84?=
 =?utf-8?B?dlZTKzM4NklaN0IwVXJkREZOMWdmTy8vZGw3MGNEdFRYTGJWR3YyaEcyRVNm?=
 =?utf-8?B?T0dVZDNKVXhQUzhEb3hXZFpWSUQ1SUxwUXNxbm9ob3hHR3pCMUhzamRYaU1W?=
 =?utf-8?B?L24waTZQRHBrNXRYOEJtUzI3OFdrcW5MVXFLTVpZUXJrV3c0c3RFand5U1RR?=
 =?utf-8?B?aVVsMTN2Tk9DNnh1cGM4d3JHYm1ZamMyWTN2RU1nUlhhbjFvbHJ3cGlsZGd5?=
 =?utf-8?B?T0RGVlVnakhzZVIyR1ZKNmhkQ2NJWGY1VW1ybGczU0tWQmo0aXlWWGx1Ymta?=
 =?utf-8?B?QlBXWS9tbVR4a2x6WXZmcEp0ejJMUGpLcTBEZTJ1RS94bHVtelBGRVVTSHFy?=
 =?utf-8?B?eUJRTlgyYlhvVGpEa0VVTEpjeHNBOGo1cTc4VGRTeXFNbm5BRW01ejNncGJo?=
 =?utf-8?B?cjNMZmtMT2hFNFZZd0NKY3JjRkpMTzZFcjdEQ2FOYWk2MWxrZzdBRnhjdG5o?=
 =?utf-8?B?aGwrVzlQZGRkZGRhVEREWmcrR2daVUtFT2tPSEdOc3kwbU1qME1LU21tYkhK?=
 =?utf-8?B?WU5iMUJSRjRVbmN5eE5qWk83YVloalFOSG9yNVJvVVhMRG1yT2IrS2I2S2s0?=
 =?utf-8?B?N09qdUJHazJiZ3dER21USnFFRzdFVnBqa1c4OHpVem1tSWNMOXVTMVJlcEdx?=
 =?utf-8?B?MS9WUWFIN1JRZWwrdnRET2YzaFdTL0w2Vlo4dmZtK1U5VnlyY2w5Ky84alUx?=
 =?utf-8?B?MmxNNWNpVktzODc4QVZHd0xsMW9UcGYvQXJLbFlUSVhzZlpBa3Awb21HY0Yy?=
 =?utf-8?B?THZHeFBVUEtEL2hFVGFERU9RUThCNzkyVkRKVzU2LzUrK0IyZzRhcndZb1Z4?=
 =?utf-8?B?UlN5bjF1WnVuMTBQaS83Z3pyS3pZR0MvNWVrSUFKYW9XeHBIeDdsbndzSFlp?=
 =?utf-8?B?M0RzczNKeGVsQmZDUUx6Mm1sODNRNVhiazZCL3FNQjFsOGVYVGR2MUprdXVL?=
 =?utf-8?B?UHA5OHJDL3FLbzFYUHhEaFhhSDlsblV6cFIycFVIVUZzNmNuWHFCWDBKcTBx?=
 =?utf-8?B?MnZoeHZZcnYvWDZGcEE4ZGl0TXc2bFRON0dYOFkvVTZ3dFNVTE4zNkJNZ1JI?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1360776-e8db-4c56-194f-08daf7d5d394
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:24:57.8638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RepnBPDEdvxNjwQ3SkCtlePBCUODJ2AAXwAcin0zZoquq2StD6a+0WdzWvaoYaQ3wMC5AXQTB3FtaqCG4JLffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/01/2023 14:54, Jon Hunter wrote:
> This series adds USB device support for Tegra234. 3/5 patches were
> originally part of the series to add both USB host and device support
> for Tegra234 [0]. However, the series was getting quite large and so I
> have split this into a separate series but calling it 'V4' to indicate
> that this is not completely new either.
> 
> I have added two more patches in this version to fix DMA coherency for
> Tegra194.
> 
> [0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/


I am re-sending this because ...

1. I am missing my sign-off in a couple patches
2. I forgot to add the version history for some changes.

Jon

-- 
nvpublic
