Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6B1CE7A81
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Sep 2023 10:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjIYKvK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Sep 2023 06:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIYKvJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Sep 2023 06:51:09 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F1BC6;
        Mon, 25 Sep 2023 03:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQ40nBRmpysi+9BX94bRlrJEqbQuFUH0nlMvgSGd4D4pqS/bTB5qcuNOCIo5DmsonJfjaKv8F5RgBh7hrm2zHsHH89eK6jZsh8uwQm50c3Diryh2B17ryaDWtSSRe+j/jOSNFtjsuTZw3bZfmeUufxA+OJcmY2icnUxTc5OciI+/Y8yFjKU8wUAGzU0scKfe/L3HsYAWQ7ZMnAplc6C0pspg3Dbbw/CKOPH0digvNbEYyHEXu03agygsGyXMdu/S2+IOy4yTPWv1PEmXAwgcE6Za2ITkto/Lt//aCwn6RSgVsXCO3EVHAzldreI4940uH1nhAioMfs7LW0GySnDvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I5GAwja0hu6EaJ5Xy74aY+erc0dfJiqfJmm62V5vzE=;
 b=GQ0CslD3UD5XHVo3UWrZefbVtdGB9Xgzg/3jzURtPVyCdAxenFSFLCi0t0UyS4h8DGNum+G2mmLAnph3y4suHWW5FTabc3SKUIpRiVHYbv69UBEsAH1Itp+xKWVT21ZLcDH0XjBuy+oXaG+6uNqw62Aytz2Qnzosrgi9ee+5eiTz+O2tL3zcArHblxTOo4mUk02/iHKHA1Q3RPuV3zdNmBeMvnlmteGE2T2iERFoU670q96N4aHWIppXlr57LgemJpXbZuVSR3Te7EvjKr6tAqKtF8uMJIt0HjovRZZFegbw7pb5Dr24DrNkf5emB8/FDbNgckh8TGWn9hD+42kdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I5GAwja0hu6EaJ5Xy74aY+erc0dfJiqfJmm62V5vzE=;
 b=B3PAHfAU0sfTP4ZVANDfr+F4t8wB6VL676KF48D1sUbXhga/ABEEFwkK8ZYiQSNDvrpCgBiVhSxVG2GHHYAoBioN3L7shsZxJNO2yCrYkWGHatT7PuwGofXgCEQPYG8Ap3A5lTOEqn3y001ixvNxXvrh9ijnbINZiF3zow9Y04kKTipewIAbkVdzsHPAkGa3wKxb5pcRWhod41F6qqiuydOuOr/Clk6aP6Lqoy1Uy03mTrd8GocESqSism9wF5hJDbbG/NDFl+2qlJhp5zmAfCkW0dMpoKknVeLrUjR57R3rAmUkxozcFtOQ4HIQxXVLtIZp5WhaYEOCtWG5Ey/0nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 10:50:58 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865%4]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 10:50:58 +0000
Message-ID: <b2ae2d3d-4628-d4b6-04bc-7fd842914c3b@nvidia.com>
Date:   Mon, 25 Sep 2023 11:50:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 2/4] dt-bindings: hwmon: ina3221: Add
 ti,summation-disable
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ninad Malwade <nmalwade@nvidia.com>
References: <20230921130818.21247-1-jonathanh@nvidia.com>
 <20230921130818.21247-3-jonathanh@nvidia.com>
 <20230922210631.GA3569506-robh@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230922210631.GA3569506-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e67ee1-7933-4dc4-4b7c-08dbbdb54d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PXtO/ChrDWI5WclNqc8LsqthAD236a3f1+/E6/Cm1n4I2sZNYFz/ez5occlKuSAeUF9p+M1fQM2us3xAUMk9Wy4GOOfvsyWWsPXHdpB7YXdCvbpdmugkw8iSsJAyy3wfGKP36EKZSxaEO/dT4lauYQ823jHWf60zS3e9P/qwsqvN4zq1s+4KqXqa3Dvw9/5wotW0Z6aO49xBAB9VhtB7L9DIF962Xl3mTIIdj7ou64VNKDh/K8Yh7/j041d8v3BnKfq1XEUdZFaM9pAGmFUbBWkzKpXj6OD0saGICv2qnSotNi4rdTYP5H2uKuinJ2PIuhfxYMBvWuW/owrtwo9I4GM9jqUoc/Cx25S9cfgq44KFKZrQE4f74AwMcSipFSwNkAiJpsEBYo2LU/kqsGhngp7mOHFONnTBdiRlX07TELMM7GEIzBAbNemiUU08rpDaQ9Rgc9r73FnSquQVWMI5tIV3x3eePCJ7JChs8e7NWYm71QA7zHkkNra9D3CNRjeKB5WagGB4RAdRPsEr/E6I5u0VepisJw4jLL8hHmbmXpJcooBzTqSr42o776ZxPLMXqGiip7uqzrDwRMKV7NVgk7XCkS36L+nTT5j5FR0eBvc8efg78yfVasN61LMKqHyQ0hQYb/fdkpTKVE/6J20mdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799009)(478600001)(86362001)(53546011)(6486002)(6506007)(6666004)(55236004)(83380400001)(66476007)(54906003)(5660300002)(2906002)(6916009)(107886003)(316002)(66946007)(66556008)(8936002)(4326008)(8676002)(41300700001)(6512007)(2616005)(38100700002)(36756003)(26005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5jdEhoTFVhOCtXT2d3Q1V4bzlSbFlCcDNBSG1JZDd4WCtsZFYwUmlMUWkz?=
 =?utf-8?B?S1JyMnY4ZGhPanM3c01NdXBFWnRwNVBHdDh5RmxicHVQOGtsRUptUUNWdDN1?=
 =?utf-8?B?eFZsbHFLeWpqejRWS3p3QkFjaFk0REk0TzVtSWExWVo3UXRSdmRNSGxlN3pD?=
 =?utf-8?B?c2xzZlVHM0RMZ3ExMnB5MzkzT1J2ZFJzaTRON1g5amN0SEc3WDVHaU54RWJV?=
 =?utf-8?B?VWdGYWtLZnN0MVpNZUpxRjR2endQbGp1bTZTOGx2bnQzZmJzTDZPZUFNZjlF?=
 =?utf-8?B?VzRXUmJlSUdGMzZkMzRmTmZmTFNQNnZpN0FWRE9LUUhISDZrTDJPKzg5dXJY?=
 =?utf-8?B?TlduSHdXK0ZOK1FucW05T2NZL01vTnVidWJueTNMVzZpcTJJZTlrWGozcHk0?=
 =?utf-8?B?bWdKN09sZUp6MkJSeEFlTVZpTWJqM2lKdHFTR1RpMFExOTV3QjZic0s3UGRE?=
 =?utf-8?B?bzExSVFIemU4QU1MQ1dMQ0x2VExUMERXaDdYZERhQ2NzOFRpdVRwM2ljMXZ5?=
 =?utf-8?B?T0llOGtZSXJhcnRSaHJtc212bElzVVNwZTlNcVBiVVBxcGxYdnFWc0R6WmV0?=
 =?utf-8?B?amRLeU9xZlcwa090L2ZzUDBhWU12VVQ0bEVaMWZQSzRON0pWdTBTeWNMVk1y?=
 =?utf-8?B?VUU1bmZsUWY2Mlh3QnBrbHFjMThnY3d0YlpOSGdzNVduZTdhOXFQMVZHdlBX?=
 =?utf-8?B?aDJ2TGR6TXNxekxVbUZCOFBRdVlJNEJUMG94cGRYZmZuWE9ValZCMTlRWmNr?=
 =?utf-8?B?K1BjSktRcEkwUmVrRmNyV3RHK2NiZVdrTXY3M3hjdWZ0ZXZaaVhTdW5xMDUz?=
 =?utf-8?B?ZXFCek1QUnVFdXJnMDBtbm8zWGpuMVprZ0g3aVg0VVRKK3FLNkpSSWxjRUx3?=
 =?utf-8?B?bDBsczZDdkxTVVdWTE1TMGVJTXUzc1FFd1lZMXFxM2NvRk5KYUpOM05MQjZj?=
 =?utf-8?B?eDBSMXVqMDBMNGZrZGtUbFRZbFlPZ3lvQkMzMHllVFIyalBXM1pITnNISTl6?=
 =?utf-8?B?Nmp3TkNCOFFQZWFIbEZYY1RPYjdHVTVyN3BQQ1pOOXZydUdyM2l4S01vWUdv?=
 =?utf-8?B?eU95a093NFlJWEdOSVV0dHY1UlE4NGpLQXJuTU1wbkVaUnBmR1VxdkJ6R0xi?=
 =?utf-8?B?YVpscHkvVTRuYzVyWHNLOWs0WkJ2MGRSWUJ2dCtHMFh1d0VPUE9VSCtiajBG?=
 =?utf-8?B?cVBsUmEwSGd0K0I0YkZqU0lZMThsR3hDQ2Q2RkMxVzdUR0szdGk3TkQwN1FI?=
 =?utf-8?B?N0RTMXFXWDFEVlpnRXpuOGxQc3R2UytUYmhxWmNSZFU1WWo0SlFTVnJKakVY?=
 =?utf-8?B?QTBQdlJRVmRTWGVOdC9sNlpWcDY2dU1UWEczMWhKT1pwUjVUb2JBTXN4bjBO?=
 =?utf-8?B?a21JZlk3NWdWb1pHWU42YTNZUmd0OUFpOUJNZyttTElRbVVZNmQ1ZU5vQlgy?=
 =?utf-8?B?c2pTV1JKSmpHQkZSbmkrM3B0LzdjOGc0TnVtWm5GMkF2eWRxcEpKT2pycHpU?=
 =?utf-8?B?eDV1ZG10d2dZREtqWFU0TXhFTkFMQllPRTFwRVpOcVdDK3ByZGI2VE1ERGc0?=
 =?utf-8?B?dUViY2pLYTFrYnpJTDJOQ0JrUmFhVWNHN2pwdk5lR0xRbGtDRjIybHF0QjV6?=
 =?utf-8?B?Y09IWVJNNjhmdjM3MlY4dW1RZ29HVVdaRzVrRzZ6R0JQZ0pSZnFaV1ZBZ3RG?=
 =?utf-8?B?eWowakRmODd2Z2phOEI1Rmpoc1o4MlhzQlpzT1pnUTY0bytCMXhsdmwxN0Ez?=
 =?utf-8?B?UUxoU2tKZlBLbUwya01pd0NVNmNVd21SOWQ3MlRhK3VLeUM4RTNPeTJabmtp?=
 =?utf-8?B?WUtHUmtjb1czcXdmZytoaHZ6YjFRZDJ0OTVwMEt1eDhaM0c4b05EckNRMkJm?=
 =?utf-8?B?UkhGUDlRSk1YWVcwc3RydUFOUXQ2NDRncEtGOWUwcGZrYitHenJVYWY0R3lV?=
 =?utf-8?B?dXFoaXB6a1J6QmxiWEw4QkwzVU03cTRaUU03bmZpVnpmZWdWa3B6R0IrVTZ6?=
 =?utf-8?B?S1J1SENuV2JVc1pMWXM1QnIreEF0WjJyYWNySTZoODZoZXY5MDZpenVpL0g3?=
 =?utf-8?B?eUFHdzVhb203UXdUdVhVZGp6RFJUZEpLUFMrNzNIVWhabkxGWVpKQnJSQmRS?=
 =?utf-8?Q?n4oi8n6lucjEfME2ENQpJbLdR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e67ee1-7933-4dc4-4b7c-08dbbdb54d0d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 10:50:58.5406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLO/lwsROjtZTyw2t8dHQcAod+sVxposFXsk5tTiTJXcbPwOVy3tpdUrOMMPR066wxnu4h/qI2ikrOQIjxQg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 22/09/2023 22:06, Rob Herring wrote:
> On Thu, Sep 21, 2023 at 02:08:16PM +0100, Jon Hunter wrote:
>> The INA3221 has a critical alert pin that can be controlled by the
>> summation control function. This function adds the single
>> shunt-voltage conversions for the desired channels in order to
>> compare the combined sum to the programmed limit. The Shunt-Voltage
>> Sum Limit register contains the programmed value that is compared
>> to the value in the Shunt-Voltage Sum register in order to
>> determine if the total summed limit is exceeded. If the
>> shunt-voltage sum limit value is exceeded, the critical alert pin
>> pulls low.
>>
>> For the summation limit to have a meaningful value, it is necessary
>> to use the same shunt-resistor value on all included channels. Add a new
>> vendor specific property, 'ti,summation-disable', to allow specific
>> channels to be excluded from the summation control function if the shunt
>> resistor is different to other channels or the channel should not be
>> considered for triggering the critical alert pin.
> 
> You are adding this feature to the driver, but requiring a new property
> to disable it. So what happens with an existing user (old DT) and a
> kernel with the new feature?


Not exactly. The summation support has always been supported in the 
driver and is enabled (if the shunt resistors for all channels are the 
same). What we want to do is support summation but only for a subset of 
channels which is not supported today. So this new property allows us to 
explicitly tell the driver not to include a specific channel in the 
summation.

Jon

-- 
nvpublic
