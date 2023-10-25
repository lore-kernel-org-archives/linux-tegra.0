Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B21C25B47
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Oct 2023 10:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbjJYKye (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Oct 2023 06:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbjJYKy2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Oct 2023 06:54:28 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451341B6;
        Wed, 25 Oct 2023 03:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxsRgZupDPQX4O/8QMKWOMLZ6biyHrwZQ+29FaWHBWxqc7/y6LVyfjAx1Zk5d+yJLTosfZn+KdJM5IV1dTwd7fLWWklAhWAnkVYtTzqpMozuDS8m/2PFArkkQL4BYSysp/nw9+S4FyX87ieoqo/oSQDdaOtlwWfMhpZPy98chAjvupONpc0hfPWccBycdxvkHolIwlFKPDVNH9VDBl8O1l8ftI1tRtBV/TjPzFCO86WXSbgmzaGodCyykEq8Is6CQP55xO1N0y9korPbClNfQyDPANS4nVY2CJ5umHT4szvEMfcgH03C37pRtYh+npzZtmUIjOtKPThYcNPcmKL6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB1hKCqGNhi1BYeE2pd5E49mLAJsrtPPxOP6hgLSZ4c=;
 b=b3MRJCebx2Rc+DUaa/qQwJ8snGKwzaQMeQtuEnQ3GIBXszvUdR13qfDYtaN3m8CMHCbikWCFhIZ4pLvm+BdSHkRRZLYjfADoD2bdmeRKgy2kWIyh1mFSAsLJ089agO2+vLTaB7P9zuSsfKbWfl0Qm2DRlHzPxYuM3KhYkU7loebIPkRkp/3AAxW/znUCS5kcLvCDQ2lGWduvTDgQzNp7nSmXBNveQvWh64GUCT7weLOWz2EYIPAxOO1k+zXqoiVk09UUWUocQErZhZVB7O0yLgs9a8uUjUBVyxv2YS/TPwyzBRh0EGzuhAdfZpO3MU194bmTuBw0TMy3yYgRWTUoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB1hKCqGNhi1BYeE2pd5E49mLAJsrtPPxOP6hgLSZ4c=;
 b=lDMoTqWGBRcJgP5rEUhKUEGC5hxY/nhyKNsTt9bIREdefXRlG1l344BmmRsFal3n36V2VKcIoCLbvYIrdhh2O1GXwJ8XiZpJaCUGiezqhpAOVJB68G4kEtEwdc4IZH237D9DTp4hQbFIB5B2HhKIS7XpvKHUSdZJ/Bfgvbhm/oMYLhFtyYNA3I/VrXj7j/7kl6O+GkN9d7QJL5p0/pj57lGDxIh1rrCAFJNHFe0rnnnWkeqxhhUMWpbWaz9hJz3x5coTHlXKowADVcS5b78OXFjNAaa17iRHjMHEO4nOfA/feSIH4VCZCWKagGWEtSAGVfirMfCmwP6SYbx+7BTqfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.31; Wed, 25 Oct 2023 10:54:18 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::2639:e33c:fff1:68db]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::2639:e33c:fff1:68db%4]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 10:54:17 +0000
Message-ID: <56c364ed-9ffa-4194-843e-afd93180700c@nvidia.com>
Date:   Wed, 25 Oct 2023 11:54:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 0/4] hwmon: ina3221: Add selective summation support
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230929103650.86074-1-jonathanh@nvidia.com>
 <ZScFZDZlTcqwjEJP@orome.fritz.box>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ZScFZDZlTcqwjEJP@orome.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0325.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::25) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: 13088dbb-46b6-4bbb-c00c-08dbd548bc67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUI7vx2mVdGbbFOwc3g1NfSZax0Jh+KH0gBxTMioSj27IT1Kkox1qnLXxUAmwzWKPY9GfSnilev7YGg+zMgTXmtTIS9DfBISjsyIg/RCTGFuHywp0eNaWKs3UU/Xl3QRqpRKKcG/cjqVlb3fG06XQkJsa1rM6TCBqH8FBPNX2b+ZConT6LhCysx/gIt5bI7mFIMRgmdJuHKN611QeAJGVk3kehpUqLZJZ+pw09m+dFuJ6jm9BvA8IdZ+dZ4xhCLx0BHqgoSdcd9rmu7QZimsSBwfzCT3tipb21bwikYUvsRQ+LSErXmcZ6vEgpIT6lH3E1MVvCLtn8b1ESIvVXNnd2KVo/22SsjqRs6BjBgk+J0Tokd1b/xl5XdHn2aVQMq7qJv1mhZVRKvoLiOBidKoG+H5tWNqp7AhHyfoV2qXXpA+mPLcwCn3GDSHlLQrP+uYgwyG5y9gs+e5wTyTtrmSiYY1zZTCWimX1XqGHhND5pJSQ8bgl+Xa7PWjzUevJDU2zxj7LCUsRB6HdvKjInvvjXXoC6cmoewDish19+YP0okwZj3xgz1qEvI54j9HW2Pi6wvqTdMS/szEcTNrZL+7fetEisfMK+4YPQLLbTr/5tDKjptDdGis9+rQjv5IqXdiC/UleBf6jdHChu76y7+Cmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(83380400001)(5660300002)(6486002)(86362001)(66476007)(41300700001)(110136005)(66556008)(66946007)(478600001)(31696002)(6506007)(54906003)(6512007)(316002)(6666004)(8676002)(36756003)(38100700002)(8936002)(4326008)(2906002)(2616005)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndQVHBiUnJYV2lpZnFOdDNtc2hEWU5KM1h2MGhJZVR5N0ZoTkw1VjNIdm9K?=
 =?utf-8?B?amRvb1VGU1lRQVY5cTB4L3FRZFZSTWc3czBHMnZaRmhpYUpRckoxbHFnOSs5?=
 =?utf-8?B?TXR4dmZicUk0MlNTOS9DVWV0bk9UbVZIYndyQTdNbnlJMERxSE0yWE9JRTVF?=
 =?utf-8?B?QUNmRDJXVzRBWjhaNHRQTzVHNlNLbXBPMjNkTnBDdmVpbHhYMnRZYjJzWFdY?=
 =?utf-8?B?Rkhyc0RSb2dqNS82ZElhWXltdlhCUXZpK0pTbkU2RjJFTnRjSjdTdEk2cWU1?=
 =?utf-8?B?OTh3bUsrZzFwN2gwMW5LcFFvN1A4N0VnS1pyVHVIVjUvU3FaTS9uUmNjK3g5?=
 =?utf-8?B?aWVjTnp4UXRndFpLSWk3akF0RndxMXZ2SWx4Z0tVQmJNR2hDY3NiaXoyNnpp?=
 =?utf-8?B?SGgzc1RWdm5ZanFURWs3clJiclVhK0hIYys2bUpzdXVOcDAwSld2TUJxTjJD?=
 =?utf-8?B?aFEwaFBqMnRlVVZUMTJQcCtHMi9oeGx5YkhGTW1xZ3NsT1cvckhtUUxNdFc1?=
 =?utf-8?B?TUlxelM1Q1p5K1YyTEh2SXRQVVE0SEZxaG5UNTJPUFNZbGJ6YTlrU1VMa2V3?=
 =?utf-8?B?amtwOWUwcFRBWHVZaGpyT20rTUIyU1hnVFMvendPQXJLMlB5RENSeVMyZnJD?=
 =?utf-8?B?UlN2SWZIa1drTm1udGtVaVNQVXgvaWIzalJBUldyTDVKSXhuVEhYcWhKaHdB?=
 =?utf-8?B?Q1MrNnZBcld3VXYreVNsT1NOdUZSMHU1M0Qyc3hlT3J5MTVObDRwU0RsVURF?=
 =?utf-8?B?RXRVTkVJWnZJSW1RbWQ3QjIzUGc1OVFXYjM4UWFLd3pZdWxEelRHNHQ0RXVU?=
 =?utf-8?B?SDcvTFAraVpTdjkrU1lrK3g0YXdaRmU0SWhGQUZ6ZGF2OVRjT3NLZlhMZDdU?=
 =?utf-8?B?cHBQaDhtNWNLVTBiZTd5VmxYeGVUcitnYVJaN2ZORDNvZC9BQ1pvUS9kd0J1?=
 =?utf-8?B?emUyZkdoSE1BenJMUjdxZkZhUmV2Z3ZINk5WeVZYRDBHLzN6b2E2VGVsUmxT?=
 =?utf-8?B?ZGVvL2JhKzJsU1VqK3JPMnZFcG5FUmQ4SzhGRWY0MDhhUnJxSTRMS1poYXdT?=
 =?utf-8?B?Wno2UWdBb0svNGZsb3IxYkwxV2lPelcxZng4SGx4dXZhOGFCSzIvL3c3K1Ar?=
 =?utf-8?B?YUJyeUtVcktaQUg5UElBdEhGOEVNSzRZMVBpZWJRVHJvT2FER0hWaUQ1aHdx?=
 =?utf-8?B?NE5EV2dKdGlzbnlaTjRtTDB2eUFocmtUcFYzQ1E3M2lVWktDcUFlbjh5U2hm?=
 =?utf-8?B?WGU1UE9Tek5xb29hbm0zMVEwekVmYks0Y25LY2Q2MitVVmwxR1hzMGg1TjBh?=
 =?utf-8?B?VVJpUU45U1lqQWsxalBnenZTRVRCdmNZY2J2ZkE4UUxsMEV5a09vOVVzWEQ3?=
 =?utf-8?B?TFpWNUxsQi9GdnY0THJTME9nTkl5czBuMFNrZlo4TzUzcGEzallQbTEwUm5W?=
 =?utf-8?B?RDBRMHNwanJpRGt1eHRJdFJLalo4UlhRZkFGSk5jdU9JVHdtOFNiQzFVZXJr?=
 =?utf-8?B?UlUvMmovVXU5SVpLMEVTbU11U1ZKRHhia0tIOU9JeVpxdUUrTnFLWXNDREtS?=
 =?utf-8?B?VGRqb2FqN3VLaTcwZGNId2ZWVDhsQkRXR2dXOXFVem5ieGgvRHB6ZHV3WlUx?=
 =?utf-8?B?Mjc5RXlzZkhNZXRiWkM4T2lmS01jaVVXc0FsejJWVHBSb01tVE80YlQvNGpV?=
 =?utf-8?B?cVJQK0lOd2tDQ3QwbW5GL2JBY1NkakNabWtDeGtMZDZkWXg0TkFGYkxvUjc2?=
 =?utf-8?B?ODNOYU5sTklMSUR1RUhlSUFIaVlpWkNpdTk3bDM1Q1ZOU2xQOHlaUTBJU3Fs?=
 =?utf-8?B?N1h5U0h5WmJGTlNBREQ0bDFjNTZvWUJWT0ZZT05ycjFnQzNpekNjS05xdGJT?=
 =?utf-8?B?cm1KKy9Pcktza0crc3hkWWNuMzJtNlR2eEcwZzFLRXNsa01FZEpvUnNjaGdT?=
 =?utf-8?B?bEJhUjBrNWRLRlJGb2lFVHV1V2RwdTVWemhrendhYUs3d0RxR0Z0UHh6Tm9m?=
 =?utf-8?B?UnRRQWt6bEZnUTZQLzF1UzNpeis0cmpjL2IrZU9zT0JaaUdGYWZPYkFrLzVi?=
 =?utf-8?B?bzh1K3dmNTNwbFV3QkxLdmUxUTdMYTFHaTJ1M0o5Y3BDU2R2cE8xTGdUaEhG?=
 =?utf-8?B?aFBubGdsM01ROTZVRHcvOXpmNjN6dHJ3R0dEUFV1QkQ4TCtxVWhVTmNvTTJS?=
 =?utf-8?B?V2hOLy9RMHhsS1VQRjlrM2dEWmVsY0FPWUdTVnFMbVAyR1orZHQzUEVOUjF5?=
 =?utf-8?B?Y0VLa1ZuSXV2cmJld3I0cFZlYjZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13088dbb-46b6-4bbb-c00c-08dbd548bc67
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 10:54:17.9424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6ghBQ++GuvXdGeT/fowsBGnaoVyb02MOUNkaGXgj3Z+qmA7oPhnKew/3v2VXeeEBA6HAsdtrGZBshNDvLIzVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jean, Guenter,

On 11/10/2023 21:28, Thierry Reding wrote:
> On Fri, Sep 29, 2023 at 11:36:46AM +0100, Jon Hunter wrote:
>> The current INA3221 driver always sums the shunt voltage for all enabled
>> channels regardless of the shunt-resistor used for each channel. Summing
>> the shunt-voltage for channels is only meaningful if the shunt resistor
>> is the same for each channel. This series adds device-tree support to
>> allow which channels are summed in device-tree.
>>
>> Changes since V4:
>> - Moved dt-binding comment added in V4 from patch #2 to patch #1.
>>
>> Changes since V3:
>> - Added missing descriptions for new structure members that was reported
>>    by the kernel-test-bot.
>> - Added comment in the ina3221 dt-binding doc example to explain why we
>>    need to explicitly disable channels.
>> - Added more commentary in the commit message for the new DT property
>>    to explain that this property does not change the behaviour of the
>>    driver unless it is populated.
>>
>> Changes since V2:
>> - Added note to binding-doc to indicate that input channels must be
>>    explicitly disabled.
>> - Corrected ordering of properties in the binding-doc
>> - Updated license for the binding-doc to be dual licensed.
>> - Changed newly added property from 'summation-bypass' to
>>    summation-disable'.
>> - Documented type for the new 'summation-disable' property.
>> - Corrected spelling and comments as per the feedback received.
>> - Used debugfs instead of sysfs for exposing the 'summation-disable'
>>    status for each input channel.
>> - Populated missing instances for the ina3221 device for Tegra234
>>    boards.
>> - Populated ina219 device for the NVIDIA IGX board (not strictly
>>    related to this series but related to populating all
>>    power-sensors for Tegra234 boards)
>>
>> Changes since V1:
>> - Added yaml conversion patch for binding-doc
>> - Added binding-doc documentation patch for new property
>> - Added patch to populate ina3221 devices for Tegra234.
>>
>> Jon Hunter (2):
>>    dt-bindings: hwmon: ina3221: Add ti,summation-disable
>>    arm64: tegra: Add power-sensors for Tegra234 boards
>>
>> Ninad Malwade (2):
>>    dt-bindings: hwmon: ina3221: Convert to json-schema
>>    hwmon: ina3221: Add support for channel summation disable
> 
> Jean, Guenter,
> 
> do you mind if I pick up patches 1, 2 and 4 into the Tegra tree? It's
> usually convenient to keep the DT bindings and DT additions in the same
> tree for validation.


I have not seen any feedback on this from you? Please let me know if 
this version is now OK with you?

Thanks
Jon

-- 
nvpublic
