Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F400C63797
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 14:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjAQOFN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 09:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjAQOE4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 09:04:56 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C747C39CFA;
        Tue, 17 Jan 2023 06:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxGrxT5snoJQgvVhG6lzkS+4bJIayJpmKAjZ8pRzoWiK2e3sMxXIMYQdoQ+zEUXt14goUXu4d86gTzmMrrRECofAzM/VuaP3rxMNF1iuwq1BENXgvFGZMpz3YE/6DW7MlnZMR2qfWXC+hiOalo7jhMxz9309uSpm6FdpVUKiTwYxT8p2q7qC6fHLgeOHLGVE3NQe1a0Ih2MkDQhckNP6tdJ87GWSytPLC2U1txiIkK6LOvEM8655HAa1kkJKMUI+vzO/e2ntX5GTyEJecFIeM1VpXbKE8qBVTJya6quYbTbSBtwdDu2FNmOwMTPXj3aXs+lQsgWhd5S/gBHZyjJrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8J5xfZVqFAxjBVf84UJYFFNFsjQ3NnumF8LLuOURVs=;
 b=ZD416y8GZH7O9KL+BbJWQ/DPNr6trs3iEOcqvvAuGDdrILp8VMLgpoZcOAGFliyHBRcC8d7IorqnoDpF7mgy4xmPOa27brlwADR9x4BcJT1f8Pv8dwksAH7Ko40HJ1ipYxC6QqcHCVKGyWIdKELkG3B9mknCmdcnkAIAAUma4b0qzJmCmkxGNkrASbaEr+3vvK3T/BWVlVJTlHrGxQBKUrnp5NnkVEmQgfKZJs755DE45iWkkPIJnyTusMT4Oxc/mtIAfaaLSAIEoYPlw9+5YSoXMn5+tjfhOMqXPJ17xA/GuErozbHcFqcS5zxWzF0xm64nH2kzjoWpP3czjf9cNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8J5xfZVqFAxjBVf84UJYFFNFsjQ3NnumF8LLuOURVs=;
 b=XV+cVI3Kmk4yqpLmYoLihjMIepkFo3sW7glUf3sMudYTaC/mBUgr3+QzwhhgTR9lDyWa6+chxOzNMVSgRRd1NbsUEfq3gDwSnC7reEwiU28pZH7fGI17UWLpPPRlE2+OawgcRluOFHmkZARi9FyURygu4E+R5CpLLPQyB/dUrqn/B1aCRA4/Zb7IqvLPVea6o8FUKqS7hOWl2oYt8fklXtmvIRKH1CFeYxYUb2PYo6H86bdfkt2LijF3bCVPyJ3dRjPzy7A1JqHMoKOR7pfUupJJbL+i3g37j//yMBxx6mBbuxjD0K+4N5Pee+INMH+R26iTYro4m+Q5yQ2RQit1uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Tue, 17 Jan 2023 14:04:50 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 14:04:50 +0000
Message-ID: <cfcc047c-85bf-f012-30b1-5c07bd2c31c7@nvidia.com>
Date:   Tue, 17 Jan 2023 14:00:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 1/5] dt-bindings: usb: tegra-xudc: Add dma-coherent for
 Tegra194
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230116145452.91442-1-jonathanh@nvidia.com>
 <20230116145452.91442-2-jonathanh@nvidia.com>
 <232ed345-aea1-5e68-5fca-9a93c3896acb@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <232ed345-aea1-5e68-5fca-9a93c3896acb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b572fc-b312-459f-fea6-08daf893cc99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xf52jX0A0nwadVfsrsnfJAArTbcftVPtcvtZxVL2MrXGSp65tX95GnhmvZRqW1gTpHV3iieDVHmECYiW+sRP+KTIeGU/d1rDhb2Rm4MLopVMz9bN2IblEc9Cmp4AWYu+On6iZWQ1GoXv0ERAvQ8Al3DNjYtU8BBYxRPtbJSzzB0QluHa38Cx5rMaCJVCc2rssTSCum/pd9+18U9WtsnXimPCD5jYTEcETjt19Z74Mpf5L7E550XnpmVqWSg09reSn2VQRULOMs7CBhmS+hBNcx6wmMR8RzH2b1WYLKj84FXELhkRGVT2Mek8FC9LTorV1TizeiHjQGofAm1n24ck26kZIArMgxNV/FU9Y5oghPDQHTB8QVBqUhZpu4OVYAFBLtCvaExeSllwzIvl21pXgT26jqdsvtnKJKMLH0/7sUo6glxA8XWXl/fhhuLMyEk2jKVCdimzmLoOireKcInDGSkXeKLOIsK6Ml8bpVHoWQUTNqhl39KWBRiYU2CxpJxaXUUvNlV2TyCLVC4sj3skKLk+j8y0eTGGyJqqlJrxj/eLCHZZRoPteJQT9gWOzJnYNJalwcy6s0bH6NiKmOoeB9/akNEvcHoX8tFly7soKPxXOQf7nUifvIw4nA3ol27VF5qDotc+djhpgddeu2iM8aIXb0Iy/Usp7D6W/poHePWgSeFqKutenqnkrJJuRXXerlA7xzWgnOiGA2HygGkoTPmbAdPOJVqOwjdqUxm4zWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36756003)(31696002)(478600001)(6486002)(6512007)(110136005)(55236004)(6506007)(26005)(6666004)(41300700001)(2906002)(53546011)(4744005)(316002)(5660300002)(66556008)(66476007)(4326008)(66946007)(8936002)(8676002)(2616005)(186003)(38100700002)(86362001)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHowaTdwWG9BVktFTktHYlNqcmQydDkyUHRxUXAxYWQ4ZHY4cTFJZHdwdW1X?=
 =?utf-8?B?T1gwK0xndnVpS2JMVUYwQmMxUURicFBwT3ZPbU1zd0hWSVhsSlV6REdFVHVY?=
 =?utf-8?B?MlRwNU9EYnZYZFFLUGtrOEdyUTVQeHpweEVLRzQwNHN5QjVvR2lCUUt5SGZu?=
 =?utf-8?B?RmhsUWV1MmErSWZVZEI2RHNEYWpCaFo1M29FYkZDVkJMYmRCVHJJdUxZQ0Yx?=
 =?utf-8?B?Q053RnhvNmVXeVY0ZUZtNHlIS2lySUdkdnlOL3pzTXp2ZTBvVWhWallaQWhw?=
 =?utf-8?B?TjhvNWhFelUvbVh3YmM0Sjc1Wi9KVWJsdGRjbjFNMWR6UGFRdXhXeUJ4U3ZM?=
 =?utf-8?B?SHU1cDFRWUpsZitWZHhlMUFrOEh5a054NmJqR1VyZlZQV3ZnbkhOR21oeHBa?=
 =?utf-8?B?WERFV3ErWG53S21nQUVoTFZSbTlpRkdTN2pOYVIzNWFpeGlvc1RSQXpvT2Yr?=
 =?utf-8?B?eE81WXZVS0k0eTc4VFFIOUJxYWM0QTdETktaNmxxeFBzSmNuZzZxTUpRcmFt?=
 =?utf-8?B?WGRibVZTYjFveEUvMXFIZXZoVWYrL1ZDNTJOM3FqSW40NTZ4RkxlVWRqRkMx?=
 =?utf-8?B?SHZhSnYxUUlpcjNLc01GVzUyNjNRakVWTFYvODM2NHBVcURqb01TTkM5NllQ?=
 =?utf-8?B?Sk41S3NTRlRWV2J0dThoNUNZRHBuVDJDTUJEOXVvUzBpaTIvTHZTaWFuYk11?=
 =?utf-8?B?dkkwcSszQ1ZiTExNS0N6SW4rcnR1Znh0YmtLR3VtVUVzdVd3SkhQRlpUYllO?=
 =?utf-8?B?SDFWNEZ1WlZNYUNCRHpscXN5dlBVYjZ6RmllR093cktBSDl0UzRvRUZXdHdV?=
 =?utf-8?B?SmxUeVJRbXViNmFOUE94SnBNSDhjUENiNS9zMFB4aEFhRG9oK3Y2QkJ3bGdB?=
 =?utf-8?B?NWcwTDVMdTVnUUt2U0pUR0hmdDZUd2RNRi9Ua2pmenNReUFlcVp0Q1AxdlB1?=
 =?utf-8?B?bTF1WXNBaGkvUm1mOVRZRXEvV0hxdXNGdEpDbm1VTFl2MGhCREpHcUhicVZO?=
 =?utf-8?B?K1dMR0F4MlNlMXhYZ1hTVnd1cXNRWFAwL2ZxSlJYVFZpTWhIbWFnbEZacVNU?=
 =?utf-8?B?TlFacWMzUkNiMXJQbTVuRDh6UGUvMWZVd3FrV2NTQnBvbTIrbXBtaXRyUnNU?=
 =?utf-8?B?Z2I0QTZjVWZFOWFleHlBLzNVT05CSHAyNUd0VWc5OGFLbURheDNQSzVLdWEw?=
 =?utf-8?B?d1BTTk5ncFd6alBjVEQ4MU9EdHpIWTh4S3A3NWtFRXB5RE5iSmFOOUIxU2xz?=
 =?utf-8?B?ZkZCMHVtMFkwRWRzY3dmN2RidlFLM3F1aVZMYWt4UHBJN1E3akhzb2MxTlBQ?=
 =?utf-8?B?bnZYdmlKT1B5R1oxOTJrRmwwbmRDS0xQMWpObHRpK05yWUJJM2JmY2c3bmxm?=
 =?utf-8?B?VWw4UzFsWTJXTFBrNjR2bXZoT2xxVXNSNHgvT1I1eUQzTktHaXkyZWV4U1oy?=
 =?utf-8?B?Nlp2TmQvZlN5RzVVRU9EMjN5WDRNZExKbkt5d2xzaGRFMXNrYjRKNGNnYnZw?=
 =?utf-8?B?cEJDSWc3SWVGQ2hhODJEUHlJa0FheTB4NDdpZnhQVWxMc29GeW54K2Z2RVVI?=
 =?utf-8?B?RVB2RzlPOE1jZS9TeVI5NlB2dUowYTZ4djFWclpxczdtUHBMRFA0THQ0MzVx?=
 =?utf-8?B?THBOajB5RDNHbWs2cE1EV0ZiS25WYUxrQkxsY2RyZzVMaXdFYmdtWGhKcDV3?=
 =?utf-8?B?aG1hRFhBdGNHOGVaNWpJNGh5NVBzQlJ4cHpPaFZxZWNDb3hXU2FVTUtwQ3dU?=
 =?utf-8?B?WEYwTlN1NzBLdTZDUDhXR0lYRXdHbUlWcHBRakw1Nzk0QTE0VUlCQk5mNVZj?=
 =?utf-8?B?WnlWKzVxcGJMKzRQbkl5TVZmaG1Cd0hyK295Z3VoN3pLL3BMZk9CdERqUnZn?=
 =?utf-8?B?TGVpU1k1MWFEMW5LaWorRUJoenA3R3M1QXF4YkpVZHdhZE9yd1p4aXR3Y0ht?=
 =?utf-8?B?SWMvajJtdVBmNS9mMnFTVlpTbklZbHQyc0prbGU0WUFaRlkyS1ZpV1BSNHlB?=
 =?utf-8?B?Z2ZZSkZ3Y2pjOWZRYllGamJlb3p4R3F3SkMzcHBVMGEvY3hLak03WEVVNjVr?=
 =?utf-8?B?cG9yVmcxV2M4NnlMOVdRcTd0dFNkNytmR0FGTXdPSnFjVHRxTVhoTGQ3OW00?=
 =?utf-8?B?N1dVZmJSTytPTkE1RGJOeU5qRUhSK3owdnNVSkxqSC9uZTRCaThVdlZZSzZh?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b572fc-b312-459f-fea6-08daf893cc99
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 14:04:50.6152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOjt6qAs8VY32KJ82kzbdzeE8ykHyCbW2i4W0ZqTOL0FzDbBeZhySxsCdlUJGQFRMPh34RPQDdMS775l79pUtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/01/2023 11:12, Krzysztof Kozlowski wrote:
> On 16/01/2023 15:54, Jon Hunter wrote:
>> DMA operations for XUSB device controller are coherent for Tegra194 and
>> so update the device-tree binding to add this property.
>>
>> Fixes: 394b012a422d ("dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support")
>>
> 
> No blank lines between the tags.
> 
> If this is a fix, you need to describe the observed issue or bug. Commit
> suggests this is just adding some missing piece, so not a fix for a bug.

OK. I will drop this fixes tag. I have not observed problems without it, 
but it should have been present.

Jon

-- 
nvpublic
