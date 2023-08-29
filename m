Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A523C83F17
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Aug 2023 12:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235527AbjH2MrP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Aug 2023 08:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235529AbjH2MrF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Aug 2023 08:47:05 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A334EC;
        Tue, 29 Aug 2023 05:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGhv4PIg23tVOOO6SgHozRROFMjjJYV1xVX6hkDn19QRer1dmrldUBRtOXJKpLJAi5yScTk2yEMCcrJgUE8bgd75UVqI2SaS79Z5Kas2BsQK8jZx6mAJVgmwnmp4TVHHDcIgS8znPcywnREc0x1PAo8VDHW52Nh3jnjj5HXCU8GdwWtVZkNDy1rwvhYJj8KHGL/tTwFdClHL741U4X3Eu1ecHLh113cD+b/jwmhRvMdBStx+jeTC6UHLpfx/7wynd1LnO7Nu1/rYJIm9vmqzVuqBSOniLl+clzx/NcpuxzwJ6B1dIFR8OA+8RLlhc+ooCK6QK9zI+CDjHKdP2lisZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDtiMhXt8yBFo2H3mERgWBuW9YRtETAkyx4McJQMRro=;
 b=n41WE5ZzjiyUXo31eZ89wYAfKWlfPmsokwk0jEqPx/QQspiwZf4gM3ifBl18DquaXS42Y/7RBlgcxmwc9SKq9IOR29cclcvq2RD3jVRu8vDtDRpQbtNjNeCgPtagfN32X9d0FPRZSP051p/YljFV3n3vZDqc91UBZ2eJke1KI46lHecDD0CsCFrD6WLPYuTJSt5gguXhPz1R6ZS8Xr5jlSGjrv5WsgcYAS5XBQG2ZYlfi3qHPqd6cIlQJpBtqn9jmu03ltK7NHUlPYBQghWzoa6T02bRnvvP/flfMrvRog6Jrs7dvFKM3baNldvVq7N5bFTmlDJQFObaAMClN0q7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDtiMhXt8yBFo2H3mERgWBuW9YRtETAkyx4McJQMRro=;
 b=gvkVei/MOyE5GzUqVdKxE1+jyt+AI4MbybjE/oHkC0zljn2gOa9w2NMXZ6zGA1vsV561QZhMqyWCa/tJPC6pfUFE1CTyAM/5HXp4zkRr6/Vmow0TvuEnsebBrKZ5uQVGqf5apsLQWCwH9/cdRaJpNMzTufFSlVgAwgZusFNpaTu+9lP0V3INv7tVIHpyy6M5puYTeJwZj0V9GXJ6832hqS1XoW213VXQ8g2sf4dHkjwb7XwZ6I4vqp2TRYQGpnTylKGQ1iUeuVarzM2d1Yytw0lq96kTo+1YUbBX0MN1aewALLkS2OvZEklMNgSGBf4HK61JuaUtLQfa9Vc+lsx7vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 12:46:58 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865%4]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:46:58 +0000
Message-ID: <c9a3f145-67e5-4ff5-19aa-809528586d9e@nvidia.com>
Date:   Tue, 29 Aug 2023 13:46:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-2-nmalwade@nvidia.com>
 <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: f72674b2-045a-46b7-ea01-08dba88e087d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnz1E/bynVAMz3XjWZLhikXLmuhDU5Fi+YTVzHhw7v5hXPrFLY3ems1/ObyjLjBHZLAS+WZbeRCfdRrJuCDZf6M6JK79bpjramGoMVzj3y+0dIyNGOBzggntRpo9IyD2ior66fIdIgqLLAvc1+d1iHz/zc9HnZ4O9zTylIi0IIHJawG+8+E2YS7ZT9gzG7k+hsoRfFZB3YgTDTgtCLdFFKZEnZwroDpPKExjomt9grGuARTLp2sQbLwGxcnkXEpLdc0/ff8+MXPZyGCaRgJvcKyB+ynZu14fazXKX08ZGVoe0GMOOBlwLpbFG3O8cwqPwqJsB1wDx8JsQwvOPdFxNjso68FWzuYLfGm0esrfRLEn05xOURpMpYZMdogLBpA2jThn/0quEsw25as4wwHz2SYAbw25RdQLivfPzDIT5FhOSACnExGOD/QSjhTfDE6NjdauLRr1Rwb7rpAlpENLBnG7k1FdJeo3d3SVDt+mpwDKxhxgI0MiK5RkBnh9aqMy4RVbOXPMCJjGiJFrytbSIrTJ2VFTQHeNODJtScT51B1m6UFIPU3CLz3jfeSiN0Sj+meQRRXUmCKkHzzVBNntrlKfQMw2CzrBY025f1zMjyqUCwSbqSMw9KKD0YkxiaOvId3cdd0UteQ8i/4hsXed+GCy1bSSpBF7niW1VLm3luRJBE+0oDri16EH3urCItCkgNTge3xX0qTtD+DyDvzkrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199024)(186009)(1800799009)(31686004)(6666004)(6506007)(6486002)(6512007)(36756003)(86362001)(31696002)(38100700002)(921005)(2906002)(107886003)(478600001)(26005)(55236004)(83380400001)(53546011)(966005)(8676002)(41300700001)(4326008)(8936002)(66946007)(66556008)(110136005)(5660300002)(66476007)(2616005)(7416002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUVEQ2NlUEE4STJaR3NJRXlUbW1WSmlVU1VLWUJRRUd3Tzl3bFp2WWpPcEll?=
 =?utf-8?B?aXFIdU5UQWJzeTFGc2RFSmZRUjR1UmVORm1vTGJlOEdnVmpRbEJ1NHNtNnRs?=
 =?utf-8?B?VVZVSEh1MC9rUkxIS3lvNzQvc3NKK1pjWHhsRW85aE9TTGl0aEdqcEdzTDRz?=
 =?utf-8?B?cytjbEVQWFJ3MitVWUdqQytheDhYWUREcVhYU1grbjJYdlV4U3Vzbm0veU9W?=
 =?utf-8?B?Y3haVXladmhnZ2xTWjFsT1FUcmc2YkVua2IvelExVzBVVktYMFA2ZG1VZENy?=
 =?utf-8?B?NmcwMllJUWhTbkdxQmtuNkFSbEJKU25uTVY1ckhiZHZCUnQxUVB2ZlJBOFND?=
 =?utf-8?B?TFFSemlXZGVZdFJpR1p0RExISzR0bjFLdGpDRVQwUVZ0Y1NhOG9JN1E4eWN1?=
 =?utf-8?B?NVVreFBRS2J2SWVjU0pON2NhRWRDV2xEcCtza1BPS1VxdUozOGdLTGRCQitz?=
 =?utf-8?B?b1FIRkhKdGRkZS91b3Zkajd0T3RDTUhza0ZzVlhxV2xEeW1CZ3hVVjFCb204?=
 =?utf-8?B?ZGdqZ0dpMnA3ZjZzaHlRL1JwVERxMnY4UFF1bCtLOEZhSE8rdDdSdXNMTk5C?=
 =?utf-8?B?Y2F2dXIyWHZWWFMyaTE4R3Z0TU52WnhBZTFUMjZOUTVKRzRTSGN2RnFQRnox?=
 =?utf-8?B?c0N2VXFKWUVDSVlNM1RUVjNyTTczTFZOb1RBREszTjBtRG1seEtXQ0lxY0FW?=
 =?utf-8?B?NEN0ZDdtS2lNZ29YaXBXakRNaG9nWUVWNEJmOGZmTDJ0R3VsV0NtWitSbHNx?=
 =?utf-8?B?Vnh1WkZvS1NuRlVKRlVmQnpSTEJ2QVdtdE5zdE9rVVBDVWE1TGdXREFWSWkz?=
 =?utf-8?B?R0wrMzh0UlFzaWdYSzBHMUxGWFdIQ1JPeGNyd21ldDZBaXk4QnpvRk9GVUho?=
 =?utf-8?B?TmlXeDdoeGVlV1hsamVMcWRObTB3NG42dWlDeWYvdjJERFdYR0lsYjJwekM2?=
 =?utf-8?B?LzREaSswb2g3eVg2LzBDYmFoR0dFSGRXVlRYSW1vQlJvcHFHQXJsVHJqWllW?=
 =?utf-8?B?SFdwVjROdzRTWUNOYXhsTlBvUjlqUGhneHNadXdkVE1sSmNsWllTU0pVaDd6?=
 =?utf-8?B?VnpwdlpXUnovZ3RpQ1ZXVHA3Mys1eXR3SlpMNmtBbWtMdmRIV3ZaV1JOd3pr?=
 =?utf-8?B?RVkxdEpvL3pWdWY4MWlNdUQydlhCU1NjMGhKVVl6THVCU3Z6S0dydU9JQ3By?=
 =?utf-8?B?WWxkN1N4aHJUUXVqampGWmRRYlNJVm0ybVc2eSswR0hLWXFpbTc2VWN1bGVl?=
 =?utf-8?B?Rm9zUFVROE4zVjJLamg3SGNFUjV6MGIrYnhMdWJncXRxdXlYVlBrekJvUW0z?=
 =?utf-8?B?RDFML21hQmU5cHNiV1ZjZEZtdSs4ZjlWandEa0toQ1lHejRrRXI0TUpzNkEv?=
 =?utf-8?B?cnZJWmVuYjNUWVFjZVFvaEt1dlQ3ZHQ2QkU1djQ0R3JndmRHQmJzZFIrK0Jp?=
 =?utf-8?B?MWJ5ZEpvTCtuTWZCbWdicFgyMjh1WFptd2pzSWh4RCtQelYvZnpuZ1ZFN2Ju?=
 =?utf-8?B?WTZhU0piUTdkbUdQMVFQVGNLdVJ6UXBpMHdRT2Q4N1ZGdEhGZTFjVGFFQWcr?=
 =?utf-8?B?WXM2OVJIb1Q0Sm0zQlVtaWRScUtzcTNVUFptY1NoUHZUVVp4Q1ZZQ2RHY1lI?=
 =?utf-8?B?aTF3aEJ2SEFiQnl5RWlTN0lFelJFdUZhbitReG5MNkZpNWFBK01OYU5iaVg3?=
 =?utf-8?B?eFhmUmpxV0lZYkRpby9FMVZEZVVYdXVCZ291eEdjZjNSZmpsN1Q2MFlJQmxM?=
 =?utf-8?B?UnZkSG51WlNuSVI0aGl4LzViMGp4UVpiRVlDcmw0ejRKeDRIQ0MzZFBqWjNG?=
 =?utf-8?B?bE1KTXFrVzFjb0UveXdFZ3lZZ215TERyTHZLcmNDUzhndzJUR1d5NzUxYUFm?=
 =?utf-8?B?c1dzRHFMejBOU3hSWElmOEJaMHJEVE14M0hRdHpKWWIrcm9EOFZCQUJyamR1?=
 =?utf-8?B?Nzg0Vi9GSWx0ZzMrUitFcklCWmRRbXJxMURWc1hadmRXNmN1Mk1ic252Z3lL?=
 =?utf-8?B?dVdEZ3VEMnNQRXVJL2Rxak90OUZkRFY1SHRpSVNHWE5ESkFkc2tzWW1GeDlF?=
 =?utf-8?B?RVg4djk2NFYwaXZyT3JWUFZTU0VmeURDSzZFZ2NvMXJ6M2JLbWJTN0pXd21k?=
 =?utf-8?B?UlBZOWJXb2hxUWplZmJvQ1UwVjBGMUl3UDBVbTlwb0dYRk9DQjhjcFpVcElm?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72674b2-045a-46b7-ea01-08dba88e087d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:46:58.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAxalrDIYsvi4Cog2iKSM9f8FnSbSdBTgQg8std7PDg1XG66fVXducYHfzUP3lUGm4Pz6AhaLt5e4U+CmdDLFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/08/2023 09:53, Krzysztof Kozlowski wrote:
> On 25/08/2023 18:42, Ninad Malwade wrote:
>> Convert the TI INA3221 bindings from the free-form text format to
>> json-schema.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
>> ---
> 
> This is v2, so where is the changelog?

Indeed. This was the first time this patch was included with the patch 
that extends the ina3221 driver. The original patch was here:

https://lore.kernel.org/lkml/20221108045243.24143-1-nmalwade@nvidia.com/


> 
>>   .../devicetree/bindings/hwmon/ina3221.txt     |  54 ---------
>>   .../devicetree/bindings/hwmon/ti,ina3221.yaml | 109 ++++++++++++++++++
>>   2 files changed, 109 insertions(+), 54 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>>
> 
> ...
> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> new file mode 100644
>> index 000000000000..0c6d41423d8c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> @@ -0,0 +1,109 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> 
> I assume you do not use standard license because of copying the description?


Probably just an oversight. I assume we can just update to be dual licensed?

>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/ti,ina3221.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments INA3221 Current and Voltage Monitor
>> +
>> +maintainers:
>> +  - Jean Delvare <jdelvare@suse.com>
>> +  - Guenter Roeck <linux@roeck-us.net>
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,ina3221
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ti,single-shot:
>> +    description: |
>> +      This chip has two power modes: single-shot (chip takes one measurement
>> +      and then shuts itself down) and continuous (chip takes continuous
>> +      measurements). The continuous mode is more reliable and suitable for
>> +      hardware monitor type device, but the single-shot mode is more power-
>> +      friendly and useful for battery-powered device which cares power
>> +      consumptions while still needs some measurements occasionally.
>> +
>> +      If this property is present, the single-shot mode will be used, instead
>> +      of the default continuous one for monitoring.
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
>> +  "#address-cells":
>> +    description: Required only if a child node is present.
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    description: Required only if a child node is present.
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^input@[0-2]$":
>> +    description: The node contains optional child nodes for three channels.
>> +      Each child node describes the information of input source.
>> +    type: object
>> +    properties:
>> +      reg:
>> +        description: Must be 0, 1 and 2, corresponding to the IN1, IN2 or IN3
>> +          ports of the INA3221, respectively.
>> +        enum: [ 0, 1, 2 ]
>> +
>> +      label:
>> +        description: name of the input source
>> +
>> +      shunt-resistor-micro-ohms:
>> +        description: shunt resistor value in micro-Ohm
>> +
>> +    additionalProperties: false
> 
> This should be rather after type:object for readability.

OK

>> +
>> +    required:
>> +      - reg
>> +
>> +additionalProperties: false
> 
> And this please keep like in example schema, so after required:.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/tegra186-clock.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/tegra186-reset.h>
>> +
>> +    i2c@3160000 {
>> +        compatible = "nvidia,tegra186-i2c";
>> +        reg = <0x03160000 0x10000>;
>> +        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&bpmp TEGRA186_CLK_I2C1>;
>> +        clock-names = "div-clk";
>> +        resets = <&bpmp TEGRA186_RESET_I2C1>;
>> +        reset-names = "i2c";
> 
> Drop all this. Not related, You only need i2c node with address/size-cells.

OK

>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        ina3221@40 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
>> +            compatible = "ti,ina3221";
>> +            reg = <0x40>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            input@0 {
>> +                reg = <0x0>;
>> +                status = "disabled";
> 
> Why is this node present? Binding said nodes are optional, so I assume
> it can be just skipped. If all children must be there, then you should
> actually require them in the binding (and mention it briefly in commit msg).

We can check this.

Thanks
Jon

-- 
nvpublic
