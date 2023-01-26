Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAFAC05027
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Jan 2023 15:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjAZPFe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 Jan 2023 10:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjAZPFd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Jan 2023 10:05:33 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CD634303;
        Thu, 26 Jan 2023 07:05:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqUzPtfTqdwLq0Pe1pUd3XXz/ySG9OgFfVlUYnToxA0fz7rjRiK+AGfyA07NLr/mj4C3z4k7H6rAJyhXi/Lyg4T147iQaVBaYpVReKbB5RzfLW1EH0kzDhd05vxFzZoqZxWwtPq5iQ9X563cVBDzEdI0o7pGw+gUGrj11NNFgG9QiQAObVvflDzyRr2aqyAuluDs0lo9vVuBREqPDbmksL6qderfyNDy7JmxZKtlv+WEStmkjNJQUxgOQbl13dx4zwclyBXBnaPGfTUJozt0XaYAReiaNzURZazbk09oJJcLMK5CeCQd9mz81N568MoLuIyF4G/ju+xeD6fWbIAq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxRUlz8dzwPD6rHrB37+QuSbLbK5NOj0EQki/m1whBs=;
 b=gSzg61I6IGSRXTsrcbLisZ6okGSky2qZBiX5zuYNCKXH6zyAVK4FReBkRnDMzFCgOYPePMobNWk9Sq/3ZxCwRUIb12JTbXO6O0YIPQROn31UBneuUmnkxdXlEOObzVc7c50XIhz/WlQnWpvQY6+K4+wuk+LZ5UO6kxSRno6JWYmDvf8YHnyBqgxV/wjB6CyssWzS5fPrudMV3Lo6yXzxjPYob+xxmlp0RlLHAS2rhyBwXSngDFWZe5SAQQlA0IDNQXG5hB9Oado7mwf6floNLSJahyM6C93FlwfpDxlbAnYOvMQSgiayWhGoDoStL6j6y0y6BqClIOulJTP+37M84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxRUlz8dzwPD6rHrB37+QuSbLbK5NOj0EQki/m1whBs=;
 b=tSxuz3BWSW16YfmVjPQ4ntrNXW510fHH85nu+B9tf3yEtCF/EaxbBol1Cd6zesKqulfqxr4plNKRNdMePzLC2eVkAYhwIs+slN5WibWXoN7I1pFR0VpDUDilHK450CU3pnuzs2Dsou069xD1l6ptjcJiBC8UJ8xWzSnoPqBXfntvl3RxXpVJmo9e8Swp+D6gWaDA1bqqcFWZLg+eJGfiKpGOIq5Uhu2dxcFXOf6uga8xc1gsIKRTJQLq1lVbdRY/efZsAfVBq449qPgwIHQP+CfpEiKmSF4bwuzPrPuAcvL7X3XId9u+z+fMur3mO5Fo5OJQ5QoseawGGxmzzAQ8gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 15:05:30 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 15:05:30 +0000
Message-ID: <213afca0-43e8-4027-3da5-3f35f130148b@nvidia.com>
Date:   Thu, 26 Jan 2023 15:05:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V8 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230125204211.63680-1-jonathanh@nvidia.com>
 <20230125204211.63680-2-jonathanh@nvidia.com>
 <db7646a3-330f-b9cb-161a-ddf31dc679d5@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <db7646a3-330f-b9cb-161a-ddf31dc679d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::31) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a8b6f1-985e-4b10-830e-08daffaec3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ROXZtk6cg9Qai303a77vCUhFBbEeCJTsvWzd1kvfYv7uvggGFGuPyEZ+Vl1VZv20enN3SSoFYQ03v5w2YBmi5u7w32tYK50O8PcmeuXrtLqnuRY+/UmJpZD76XP4m+xIvW9QXY33DaJb1gJmUzboPwS/Sy8t/7z0Yg7y3WBlubEpuDiiRCuJZ6zIQpJ8vkLh7DGUuAyoYZFOBs8sRR377OCiylEV1k/O1Cds9dBUA+fbIYgRt96MQrTndesTzxLjzcwfgIcfzYNkkLaX5ALLlHyLGjrMLikvGn07+qqMsfdKgEO9L60DN2p5wlZjd3S+FopwFjZeEQjOkUsI3MdvxdQ97gehJVAgfq15Gk2geHxf+nrKa5Ml8Q2Wa3nMq2t9RAqYDWiXJIbulSHIVtxCuuJNJ10NCi7j8oUm17PiD63HHZY9DSn0Wb7YD+9AHKkOFne0fOeRuqelMJj3c6ajKbwbrZfe4jAFsXv0YUQM0EnMUMUTN7kET+dwGuG6LL7jdu5M6n9PKv+pAoEl8GrysqxKNHdZqH4cYLmIjAPP4C8guOmGg+ZAKvT11tlbSwKzFw7ipRQopxGLO+DB7wzJT2ZL65HOX5RLZLUPX7U0G7doaQMn7y/q/oGl+5rZv/FixEHvSg4QdocMKXFsqoUcU2BqjJsQgKOD6demNduzDevB/SEC8Z/dzoHH4ul/KVkggSdBCFXkIIL6+gxMBvGk4NexReQUi9+vpwJ648RnWlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199018)(41300700001)(8936002)(36756003)(5660300002)(66556008)(2906002)(66476007)(31686004)(66946007)(478600001)(110136005)(8676002)(4326008)(6486002)(38100700002)(31696002)(86362001)(6506007)(316002)(83380400001)(53546011)(2616005)(186003)(107886003)(6512007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmYyY2Y3cEdoamZ2cmtCL1VQdHMyUi9KMncyNVVJTWovRmpMUExxV29Rd1Ju?=
 =?utf-8?B?eFMxWFY1WDlrdkwxeStmVUFsbkYzNDJDTTJ5c0pSOUc4ZzZpSlJwcXQvcHFm?=
 =?utf-8?B?QnFpaVZ1M2ttU3BxZXVaL0JFaHppQWtyNDJkdHlSaEhqZVJ3Ly9lMkpZWHg1?=
 =?utf-8?B?bmkwZUlSN3BRWCs5T2grRVQvMzR6RmdVWHRsUkhNR0w2akovdEdDZG5GekhP?=
 =?utf-8?B?dXZIRHJKOFFIMXArZjlFNHR6a1F0bC9tNDAweGtmSnd4Z0REMFpZaVdyN1hv?=
 =?utf-8?B?RjhOYW43dVMrUElDWkladzhhMDZBcDlDZk9vSWM1WkNDMGdaUWVia0tiYWpk?=
 =?utf-8?B?SFhCZ0NxdjgxbHNQNmdkdEpIY1lFR29LQ3B6aDZOR3Q2SFEyWEVvOWhLdXlV?=
 =?utf-8?B?czFMZHQ2Wmp3M3JBZE04U0F2L0o2Y2lZU01tRjVIUVJCYmF3bmZyaHNXalBF?=
 =?utf-8?B?K1dzMVUrUU1RTFFLa3podlUvWWV1Zy92anhXY21qbTRwZ0lKeVNocURTUU1I?=
 =?utf-8?B?SCtxdHFNSWVIWW5KdVNZcjRidWVXd0NqNjVORllXQzRJdWlUQzVvaXQ1N3JN?=
 =?utf-8?B?ZjBrMmRDeVRRcHhKYi9VQ294ekRPcmV2OUYxRnIzS21Hc1hMaVkrVnZkeEFT?=
 =?utf-8?B?YXBkdHNpSU9XZTUxL0xoMGtTUFF5VGpTSGN1VWRleVdQbk9VZUJqMWZTK3pi?=
 =?utf-8?B?T0pPVDJZRlRXWXY2MXhtRmlEVmdsSGRkV0MyVm53ZXp4YXh1Q01RU0xYL3Qx?=
 =?utf-8?B?dnI3S3hyRlBrS2lhVkpGeU5VL1hVWWM2NFdyK3lCUFk2TDNZSjUzNUpGWWlH?=
 =?utf-8?B?NUEreDF1TmJPb1VWblREcnN4RUN6M29Oc2o3ZWxtaGlnM0VMKzZEc3lEU0VM?=
 =?utf-8?B?OXNtUDkraG9sZ21GT1VYbXpKdi9PdjkwN0RlK1AwSm9MaEJLaFlyRVR1Y2VE?=
 =?utf-8?B?WHIwRk5kbytrR3E5TWR4T3lsV1VPTlRQRHphaHJRRjVQUXpyS01ZeTJsUFRX?=
 =?utf-8?B?M21vUWN3b2FUbXFyR2VWd2hNQzRUbTlvZ2dycGVVYzhkZjh2dXhXMnlXYmNY?=
 =?utf-8?B?VE1zTUxiSUIweFpTMXlqQ0tuVy91SkJpd2Rha0pOd29lQjhhdGxDSnVKbGJo?=
 =?utf-8?B?UDZuWER2K2dPVWcvU2EyYTgxVFRMZmhIdWZrZjVjZVEwOTNNdVNWb1UzWGhS?=
 =?utf-8?B?T0w0OVJFU2JkWlJHMURIQ0NmbnM4ZnZBNThQN0VhakROUGt1b3VteTY3WVBG?=
 =?utf-8?B?dWFlZDR1YWJKdEpkTTJGa3ZIU1ZSOGdFVzNKYTdDZUQ5M1pqVlFWVElVaEE4?=
 =?utf-8?B?RU83bEJTZU9UUVp3OXB2aEkxRDZQVG1IZE5GNWhYSm5VVHk2dkJOanZ4akQv?=
 =?utf-8?B?QUxjYmxuaE5mOE9vZStPdjJYVHNTQVFFRW43UzU3eVZVVi8wZVYwcG5iNS8r?=
 =?utf-8?B?NG1oRi93SHRKME5qTnoxTEJNMVNMNDVSOWVmMERmNFUrQ2gwVWZlUnFIYWNs?=
 =?utf-8?B?cDBJRkFFZkZ5dURnZmxZMVRxeVdZRm9PbjBxb2dkTXdSOEdoVzRyY2RUMytu?=
 =?utf-8?B?N0pLekFBUWFmMGFNSHZHbkIzQU9sSGN1VGZiTW1hRDE3aVdlODhELzVUMTNT?=
 =?utf-8?B?UWxaZ1VWc0RUVWQvbW1kL05xUlQ4NlNGQ2RWMThLbFIwQUw5Y0p5WFJ0ZkQ2?=
 =?utf-8?B?b0J4SWN1YW0yWTZqS0h0Z1hLZFJQV0tETTRmOFFnY1N3UnM1Y2RyYTJmaGJE?=
 =?utf-8?B?MTJZSnJENEZmTlNvZlZiQ2UrajZ3Z2FaUjJaNXNRVDF1TmNGOUk1aDRXVEJ0?=
 =?utf-8?B?d2xqM1Y0UzFJaFF5blZQSnkyM0RtR3NONVRwTEJIVThOb3Y1cU5MTEFnNWRV?=
 =?utf-8?B?UFAzcTdrN1pCRXhhUUVlc2ZWdlRQdVdnUTBpVjJHYWI5MzgyZzBBRlFvQ0dT?=
 =?utf-8?B?VjFkRlBBSmI2WFBwdytIVHp6T0JxUzA0aGVab2VXeTlFNDJSWkRMUVljWXl1?=
 =?utf-8?B?VVBkSkpFcWRFZDdUSTlGelJlbE5jT3lCakUrbVNsak9JOFFCUjV1WWdLM3Rp?=
 =?utf-8?B?NkVUWVFIcGpXdkE4WDhrU3F0MUpOa0VMelZNMzZLUk1uc0RZelZQRXIreTc0?=
 =?utf-8?B?V1hJakhiSE1EcDBGY2svUk5ISDlQdmZ4WmVQZk1EcFIvSmVLOTZkamRYM2FV?=
 =?utf-8?B?UU5BQmRRNlM3UWhQdFpSU1RpNFlXRUY0MnNlb1VvcFRnbHBMM3d4Y0V5TEJI?=
 =?utf-8?B?cmJKa2JrV1FOM2pBOVBuSjRhZFRnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a8b6f1-985e-4b10-830e-08daffaec3cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 15:05:30.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdpycwKfsW8WhAh3rvXcMtkaaZbLtP+qquZ8cPq0P6yEI5QkRxaS9i3fzu5AVfeAcZzksZNzy6uQbVdOLZz8/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/01/2023 11:36, Krzysztof Kozlowski wrote:
> On 25/01/2023 21:42, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> Add the device-tree binding documentation for Cypress cypd4226 dual
>> Type-C controller.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
>> +
>> +  firmware-name:
>> +    enum:
>> +      - nvidia,gpu
>> +      - nvidia,jetson-agx-xavier
>> +    description: |
>> +      The name of the CCGx firmware built for product series.
>> +      should be set one of following:
>> +      - "nvidia,gpu" for the NVIDIA RTX product series
>> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
>> +
>> +patternProperties:
>> +  '^connector@[0-1]+$':
>> +    $ref: /schemas/connector/usb-connector.yaml#
> 
> No improvements here
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
> 
> Thank you.


Hmmm ... I think I misinterpreted what you were asking/suggesting. OK, 
let me fix this up.

Jon

-- 
nvpublic
