Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6A8C54E76
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 17:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbjAQRWo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 12:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235187AbjAQRWJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 12:22:09 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998274C6DA;
        Tue, 17 Jan 2023 09:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvUdlEr0aoN3xLuOi2eq6evF/ZHL7jk59Ke5jCswCLjvdmBjLd5CLW8AW1KsIrNNpODfh68RXAr7moIuILsxgqlSiHNOfQ64h2xn7ura5OGj7117LaiTN9l55fhM0n8s2tfivxkiylkcKv3t5MMcWv8u+6m40hm57+gFJYO7cWp5dBR2DGvVUrDmPJDH7FwP8lKjkqP9i+eN44og8IHMf87Dkcpl4Z86EVuHLC89402cumbk8jdyiXHsOqgVZWOPv2w22gCbMwUTPjvpqU38LDUyzpkrmUZeQ21tvVOCwobhbEbnRJ0p68l6Po3abjmG/sWwnmSeu5RdLjp8yxH0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TobQ5UxxusZp8DezIOb+tq4n9x70GJF9fUSnlhgBoJs=;
 b=IM7V01UVXYB+jcU7cAIYVjiEn0XIFQPa7/FhGVdALOgIeB1D8P+QKtWMlQzPoy70cqSuQP5y/wCFLY9J4E90vudXzlsqv/vt1gP+3PNe7b0GBc7hStpyvkPuJVVhT8KuOortzyfhyieR62DLdwm1a43u9i+eXG0U6QCqIy4NMO0v/c41JjZW4QEnRfczRrVYZsBGKlxftD1wrkbz/y1xjmAOP6SzJuxmAP4cPKJ8Cm2LNO6eFeB+3V6y5tdXledbBmIO8s3wlGwehVa4WQHnO+z209VOtYTKGcJcqaKmqXKlV/XaYPpQM1o7xPuDHH3FhoWj9gD6eaIVpSSb/K7iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TobQ5UxxusZp8DezIOb+tq4n9x70GJF9fUSnlhgBoJs=;
 b=NgslEmRLOBNtLgeqjxcgD2RS54MslHqn9A/gkS7GUkk02OrtkXMMUMHlbMTGcq/fd2FV9WMUlyOTpInaT9si6TIGyT2JNCo1KBqSQBMuW3zrv/gfhLJHer3v6ibK8Oz+l9JUQjybMeUQqhWJ2yLPDWwHzRhi2oWLym7dGnn20OVA7y7RnTyCZ6ELJfof1GxKgFB+M60EsvjH6Qh7tJ0xVtDv+hb8I6oiRsKpgKf9Ls2bkAcxodF1sfMxQaeKMcmI7f1+K90TWK3ib1761eRc2mV7275rGovCaGGGacV48+GoAYyMCGp7RVU3ZdGDjyduYRWLoW/wDFgQ0jf7+A53+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Tue, 17 Jan 2023 17:21:09 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 17:21:09 +0000
Message-ID: <dbb0cc82-4b15-b99c-bfbe-0f6af8f2e8dc@nvidia.com>
Date:   Tue, 17 Jan 2023 17:16:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 1/5] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-2-jonathanh@nvidia.com>
 <de5cb562-e45e-aed4-508f-2d23f114a01e@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <de5cb562-e45e-aed4-508f-2d23f114a01e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0592.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 541adc2c-3a53-4e31-694c-08daf8af38e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3SdN5yvfl0rbwtvEsXpAAU47fPoHZJp/3xKSmpO5VEcB65pRm2BVpSAaMnA/5NRNr921ctWFiTVcyhNuwO7m8eeut69zWlkNGa7ySgUBJL3XXv+OvavYMG5t2+bYodjZbxroOnOwkIEwzGlip+7D8SJhud6Qrc67YjK26DkL8xzMHffpKSIRux0zqQdfwcLLJ7bHIJQmib7wE1zokJVYxiB2TB6Bo7g+Un3PGXupRc/geNennmzVPVPxfk9ULUsfMQb4RDsutM7aAnFEVm6UhUBnqB8VSr7KD+jk/k7ufEwdvGUWWX4pPJ6PrvVuzvF8K4qIRpN6FwQeQ6OWmGwx1EAuM6xFnR0tOwN+8Wxlv31ggopZ1FO4cFwFU01g5LJDcyMwwsgyImZrpW6FwPOdb+mFPHSn4rA03fYueC9pGpIXvN56aAfba/EgrSboCGA9ThL6DXf+DFk9cVebc9azOomOevIRw6NASqR5fyzFLcUgz80a85oL1gaG5RmOZr3hnrNp1HtkKL7Fxo75TIOw0KnG5w5YxcvLYxJSLKKQBCh2LIo5WZkUN1uwuh1vRnjTNAXjQv9hDw1+8p0qqm6v6hbCD2uMo4uTd38QTuRbcIryN4Opw4sLzXwX5BvBs/Kk0kneHclVcmttI3etp2V9GHx4Ge4pW00kOyNMAuQZyUgQq7vOOT88FEVPv3klchjjTKmwHAo6yZbQ/0SGJCockD85iSzxRi3JHTXC2cD7ppXT5uRJ5B3zHpu5kGSz23VWv2X8ouGEkB5bWMk4XttlVTA/SeJU4YJq4eVI02Fszg5RIVmQEZCSb7SfZCP8rXGJTrCo5S0RSYzfT27lvR5cd7n/dnbGkGFVHAOyI3VaH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(31686004)(66946007)(26005)(41300700001)(66476007)(66556008)(53546011)(186003)(6512007)(8676002)(55236004)(4326008)(2616005)(86362001)(31696002)(36756003)(5660300002)(8936002)(110136005)(6666004)(478600001)(6506007)(316002)(83380400001)(38100700002)(966005)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEhjdTR2R3ZlTzJKeXB1LzJyL3ZzTU5LeXBKVnhWaUxSZlNraVEvOFFBd21S?=
 =?utf-8?B?VTRXZXFKWWZKNTBxRDRCRWY3RFFueDQwSG9IMTQzUTJzcGsyYXZIbjJacmk2?=
 =?utf-8?B?OXVMQ2JBc0thU25ZanZJWWRjWU1pL2RUdk8wb0tydEV1VEpxdzlIRTlMZ3pY?=
 =?utf-8?B?dnpiT2lYcko4UThDNTN0UytaNkk0UHdjT0xWeDlUcURobnIxQlNKYlBOeTF5?=
 =?utf-8?B?NTBydkRYeHZyLzJmWXpldXUzd3VybUhFUFIrQ0FqOUtLUlpxY2JBSFBhcnRx?=
 =?utf-8?B?TGpOb3FCNFZJY0w1ckloSHl5Nzh4Snk3RmtPVHR6MmxjNFpCZGQvajZ4RzYr?=
 =?utf-8?B?RlNXbUwva28zUnVGb0J2OUozdUtNL3NHb3hkN2FTT0NoSktteU1CdjN0Zk16?=
 =?utf-8?B?enc5VTZWVkxQdzlSVEhnOWozSWdsaTRKaTZ0Z3g2N2JiWWFnNmZxeDN6ODFR?=
 =?utf-8?B?ZmNRTzE2NUM0QXN1YWE1cTZTQnRtcWFQZ0p0RlJzaTZTYyt1V1BYM21HZXNm?=
 =?utf-8?B?cWxrYUR6d2VwYXN2blpPQTdqeWRkdWtLRFdmZ3E4blR3ZS9vbC9HdExPU3Y1?=
 =?utf-8?B?S1pJSGI4SUwrZTcrRWUwN2lrbnJ1NUdyTTB6bmxvMUdjQ2g4MkE4RXFDOG9L?=
 =?utf-8?B?RWhlUlRBQndyRDdmNCtKWU4xZEJnbnBib2ZMOHRiSlEyanoweDBEUTV4WDhR?=
 =?utf-8?B?QUFhVVF5UTc4UEZvL01nL1Btb2RrbmhNUG9LRHhZMjhRR29zSnRFMmRYVSti?=
 =?utf-8?B?WnRsdlhSajhyTjgyTXYrMnljTHEyVUE1MUJoMGFaZUwvcXg3WWJNNis3b29o?=
 =?utf-8?B?aDFNazhGcFFwVDVnWnpTMUx4aFZVclQxamRDSGYzNHVVbHQxbHpaZ3lQRis4?=
 =?utf-8?B?dXhQYXlIcjliRERqUVE0ejh2VFkvejEyVFlnVElIcW1EY2FwaFV2SnJkZjFP?=
 =?utf-8?B?NFNBTXZqUGNMclFEa05vdkZtL2RTaHdWbURCMTVHUFZnR1ZpRUcxWlE3R3Zs?=
 =?utf-8?B?bVM0bkMzRzlrK3h1MDAvOW5hbnFrRjJVamxlSFJGOHBuUkk4a0xSalQ0Wnpx?=
 =?utf-8?B?aXpZM0hpRW4zMUpjV0JFeGQrOTRNM3ZaZHBWWWkraUVtdEY0ajBtZmU0cjhn?=
 =?utf-8?B?OXFYNFRMYjh2R2N5MUl6SWRkOVhvc0dIRlFxMG5tajRDcUdod2xkNXNsL2pt?=
 =?utf-8?B?S2E3ejd3WlN1V0Z5RVdkaEZUUlVIbFBjY0EzU0tLSDhzTmF0cmNPekNVSTNN?=
 =?utf-8?B?NWhUeXBQei9kR055dEk2eWpVSUhkVG5nNXJ1RHZ0Q0JsZ2N1cXVGcmxobFdX?=
 =?utf-8?B?YXNpdXAzTVUrakEwVnhpOGhUSlNma1YzUG52UitUOHJTYmk5bEJKdHdzSGx4?=
 =?utf-8?B?VDI4YUxCZkxjT2x0MW9leklNZFNFejcwRGpIY1pLcXlZNlc0UEpheE56OFdD?=
 =?utf-8?B?RFRhTzl5bWR6d3R5OURiWnFBeFJtTUhUU29oYUdPT3VETGFvcFZlTDZBU3hU?=
 =?utf-8?B?RExWQzR3dE9zQ1Yzd3NEckpXVFBseUdVUytJNGpESVJVVTdsWnczMnl0R1h0?=
 =?utf-8?B?TzI2dFFwTmwrenpENTFPMmllTUQ3Z09hVjhaangybE1zTUpuU2VyY2w5SVlo?=
 =?utf-8?B?QTlFSE8rb3hvbVBEODZReW9Ic3hjSy81b1lRNDlBamNGS2pkejRoOTN6NHlB?=
 =?utf-8?B?TjluNkxBcVNXWS9XZVRBZmFrNFd4VEsvcjZrRk04ZHQrc2RHbTYySllEUGsy?=
 =?utf-8?B?MWZ0YWp5L2l0eUFIbHZIOGNtZnQvbzY1R1lHckpURUMzS2FpTkk2YVZ0V0k2?=
 =?utf-8?B?TUVRWTNjS2ltWTl6bmFpQXpvcDNieDhQdXNaa01ldUZFTVArUWsrRkE5Y25T?=
 =?utf-8?B?K0pyS1c0Tm13ZlNrZmVEV05wd0pJaWFEV0dFbjJQdUtnM2ZPVS9rVFdtblpV?=
 =?utf-8?B?SkMzdHEzVEtBY1ZFdmcyeks0dkZiMjczUmZKRzJJam91bWVRZHpFcldaeXZk?=
 =?utf-8?B?VUE0c2hHRnpKbUQzWWJlY1k1WUZ0ZEFPYlZxUmM5TVlEZnFOazNnWHYwR3Ba?=
 =?utf-8?B?U1Z6Ui9JaHlIcXNjYUMwQnp2V1BRenVBYVpMZy9UU0E5UVV1cnZZeVd2Y2h0?=
 =?utf-8?B?aklPZXlXOHZmK0dlS243VWpjODRveDFvRnJJUXNnbitGK0FqMWdKRVE3N1pZ?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541adc2c-3a53-4e31-694c-08daf8af38e1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:21:08.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cohh4L40rtB8ZzQJoGawNHRVEiNQZVll3Wq1vCXlphhwKP0KVfJ8QOpXLAuaaimcnZZa2uIyyYX/isVoP+ba1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/01/2023 19:03, Krzysztof Kozlowski wrote:
> On 16/01/2023 16:50, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> add device-tree binding documentation for Cypress cypd4226 type-C
>> controller's I2C interface. It is a standard i2c slave with GPIO
>> input as IRQ interface.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> V3 -> V4: no changes
>> V2 -> V3: fix additionalProperties warning on new schema
>> V1 -> V2: based on the review comments. Fix some addressed issues on
>>
>>   .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>> new file mode 100644
>> index 000000000000..5ac28ab4e7a1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>> @@ -0,0 +1,86 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Cypress cypd4226 UCSI I2C Type-C Controller
>> +
>> +maintainers:
>> +  - Wayne Chang <waynec@nvidia.com>
>> +
>> +description: |
>> +  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
>> +  controller.
>> +
>> +properties:
>> +  compatible:
>> +    const: cypress,cypd4226
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  reg:
>> +    const: 0x08
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  cypress,firmware-build:
>> +    enum:
>> +      - nv
>> +      - gn
>> +    description: |
>> +      the name of the CCGx firmware built for product series.
>> +      should be set one of following:
>> +      - "nv" for the RTX product series
>> +      - "gn" for the Jetson product series
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.


Thanks. Apologies for this. I will sort this out in the next revision.

Jon

-- 
nvpublic
