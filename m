Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D127AC83F18
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Aug 2023 12:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbjH2MsT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Aug 2023 08:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235559AbjH2MsT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Aug 2023 08:48:19 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A27DC0;
        Tue, 29 Aug 2023 05:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NC9R2jOl7q4Zhv0ANDeKqRMmLpWhLOM64iKzsMP0yPEcI34DgkbbP4yCyY8zgFPFfgw3x1HXVcY3I7JzXFJM5CRZgaGADoeBc+a2FlK8Vp4p95hlp5K9Fzf9pbtWmMi8Gv+fkilKoPEczoC+nGqve0XDiU0LyV/XeUtcCZFqkJ3aIzIUENUO+I72BH6ggGtw0OmH5e8UzcdENX+g2i6FJu5r0mjKO2qF7qVizrU2kQsuDa9QTFqWuR4aldnbA9cmcnxNItaQeLB297K84ihWNrV9Yu1Tfdc2jiJDd1CmsfXEckQlv+1SJTv7PjjK/hpCaVTN/3kWgf9iyj5QFFlEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EihCaeXeMEb+S5k0BLDz42khQe916Q/eDxKOez5O8Nw=;
 b=bd7I0TGeGU+TpBzz1GuxxlX2fx0lZPwr0aj3kxuOqv+UU1q9DZ4B7yFVvTuPuPZykIha8dL0R7pWomXjOPnsu2QwvfXp9p5J9cDPzRiWVfoHzSBq8fasFthZdWrwFeDhS/PIAs7c7b5760EAb5yKsS9VFFkJ0ZRDivs+IIQtuvwCoFt9uXE+CwpjnJ+41Unq5/Owv1Pc0ID98rDGt1IaQ0tDjWxtoxCQu92P95sh9wv+6Y+ba+Q9y5aQSb2lObWUrQxoWstojyMxGTFWAd9CRMPFFvgg9WFerwerppM1ZdsoYWZSmG/YQpZbk0i0sdXKCjm22BygWQW2pf1J0c54ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EihCaeXeMEb+S5k0BLDz42khQe916Q/eDxKOez5O8Nw=;
 b=jDtfIpT+yuA9ImU4I7EaEgtmacLOO6k2HNg/E65hlhKLwDdMiCRhK5Gv5KC//bVtIAO6Kep91C1BB2lCOueiInihPNDvh9ikxmDruDZblD8FSZiS9lQ5HlJUW7WEYFikVtr2z2WoiFhhnu59J2hAeUJL8fOm7mos2nPSKY4wdiHtHm+HPnc0hauapqtc8+KW67u/lARKl5NhH20WTbViU7QYmt7OPplwnWwXcU+5+1QtYYxpvdlq1MEeeew201KsdN+O2ePiXXTg8rkhCzdH4aqSlSq1grOQsAQDmW/5d//wwMhbxkjFxjAWxC93K1QEGPl+al4rEC0Xt1DaYqULBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Tue, 29 Aug 2023 12:48:14 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865%4]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:48:14 +0000
Message-ID: <ef17206a-aaab-5a13-fdc1-7a8d9d04c6dd@nvidia.com>
Date:   Tue, 29 Aug 2023 13:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 2/4] dt-bindings: hwmon: ina3221: Add summation-bypass
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-3-nmalwade@nvidia.com>
 <7595f0d3-7a59-9837-ef6b-627be3688667@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <7595f0d3-7a59-9837-ef6b-627be3688667@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0268.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::20) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9736be-403d-470b-a480-08dba88e355f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYZ07hI6R0dP8zdU97VZ0vEYWCrISkcGTCmI0L5BQnT9lThpPP+wpJLRoHwQH/FnrjoukaYbtYXfZzrYGpHJG/r2AjbmrHzBeiJDgJMEZycIm80HFCl0czsnAm3UNr1HjzZJgP2Jwml32nO8MQ+M9JoVec2QXiaAEbUfld+rBSs8TrUrEZOIvksADxaVq+OyNeSXqGXLJ8lPeW+MxU/ig4adq1xjMewfzjyaFaUv0tOvmxoJTHxT4egA+rlo5WqmIqHNRw2jyi6gKYBQT62oNMkP8LftZOXIdYNIHAWP+Q51+ACHRqiZoGjP81jT11MzngGot1EvrXZjCGrAByrVO65JIeKDj6v9wd78bUqmL8A0fSuxo9FCqpwxj6R4lGboAJS0W14SYHTSIfDOY0/WMFnJwsmNEwQRN+1cuJ0ECnsz0F3Hte7X2ojEAqybcGwND2H0HfEbD5HiDFBT2QHXY5T6la/pcMcI5zugFxhnYhO1lAXppVh1zXLXbvnzmEzWc4jfjKCZPHIc+hnJii2VUdM7s7CfbYEBxkO3+EipZ7hh4Omtr0r4iILdJnLBjtv9TKUuE1rMDREzos/uxKC7V22eSOyJKMaarLhFLJda9aOIoPMUF2HHGyWw2gU/N4+SNvwq3HG2W0VjwQd76T03JPH09fSe+XD4VzVN6zqlSypRF96PA9DqJGcpkg34ttvMY46YLKLzdn61PIV5ZDLyZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(1800799009)(451199024)(186009)(6512007)(38100700002)(316002)(41300700001)(7416002)(2906002)(83380400001)(31696002)(86362001)(2616005)(36756003)(26005)(5660300002)(8676002)(8936002)(6666004)(921005)(6506007)(966005)(6486002)(66476007)(66556008)(66946007)(53546011)(110136005)(55236004)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGpUUDUvZUtQMnRtUnFsUUtQamRjRWdoL3Z4OVZjS2V0Vnc4UWhzNG9nb3dL?=
 =?utf-8?B?T0pCbGg2ajhsQTQ4UU1mNUlFZzFVb1JYRm9yTW9PblYwcTBNck9Ld3NseExh?=
 =?utf-8?B?SDcwaFVsMm9RS0w3MGh6ZVI5VnlPb0VHdWZXUjIwUkgyRW81d2V3K3VyS2xm?=
 =?utf-8?B?THdvR0tuVUhIN2dPR0lOaktuOXBBRGdtcXFBTmswSkVkQ0NCRnB4Q3BSa0dO?=
 =?utf-8?B?Sk05c29MR2R6STdWSEdzL3NZODh4NEN5S0NzbkZlWjNBSnhwd2p3dGZWaHZ0?=
 =?utf-8?B?S1hFTnhqOHh5YmNFMGZXYWRvd1kvcDgyOGFpc29Ma2dYRmptMHNwMzJXakxH?=
 =?utf-8?B?Q0tvNW1nUG93UGlVRC85K3JVbE5nOWVkSVhtQVlodHJxTEc3SVpnckFHMEpn?=
 =?utf-8?B?QVVHMU1qWGF5R0pkcWdlQTNvWVR1dG9FTHlzWTVpVEVLUGZnOHlDUkdtV1Bu?=
 =?utf-8?B?Q0ozOUJOOWpMQ2NmRmZIQlZsT1FRM0JUTnJBbVU1U3lIZ1IxWFVHSkdVZmxW?=
 =?utf-8?B?MWpVUzl2MnEvQS9sekREYUsxREJnM0piV043bFIybkdkT3llaU02ZVhKSCtD?=
 =?utf-8?B?RnRaelRWWW9rWWoxeUZMSEpJa2hLUEp5bzkzNmpRYnErTTYwL1QvYVhNK1JK?=
 =?utf-8?B?SWJDMmFQV3dodFdybktHclRQR3ZiMzFhTERJMnJyc3RrOUE0VFVKMHdyak5T?=
 =?utf-8?B?cmVPdndQR2VxV1Zna2oxelA1clVpRkE1U284WFBMRytnNDlGa2FDR1ZKMlNS?=
 =?utf-8?B?SGlUemp3UkFtOWpxSWxYM0NuSFlZRkhkY01ncDk4SWc5YkxTdEgvay9INHlC?=
 =?utf-8?B?V1NMYkhmY0ZJRlFGY2VGT0N1dFZMNmlsck5Ic0xheVRvS2JLSVUzMlpEYlpm?=
 =?utf-8?B?eWFVbmdLUDAzZmt6OGJ5SlQwQWZnV1ZzVGtESXBpN1ZSaGFjUkV4MjQ5RHhl?=
 =?utf-8?B?cm9tU1lnQ05ueEo4c3kwQ3Q0VFhmVTk2djBROU5FZDJxOE5QeVlMQ0pwUitH?=
 =?utf-8?B?Vjl2QUJUMkRubXdNL05kc0FKazJ2N0tHMmRZbU40T0Q1aEpzdU4rbUdEa3J6?=
 =?utf-8?B?dHlnTkRpRGlQSVhSTisvY3ZaaDQxSlhPc1Foem5YeHFvM1FwallPVzAwWmVx?=
 =?utf-8?B?a3NyZmM3a0YzWFVnL1VxUXFzS2J0Ti9ZZmp3U200RzYydDI1V2FLWGFmN09G?=
 =?utf-8?B?ZmJ3K2YxUGltWTlTTVhwd1VjS3YwVERCT0tvSVZCQ29iT3djZlNOU3pCUDFG?=
 =?utf-8?B?TER2dmJkU284OFVsQktDemRiMEZEMkxlQnRNMFRhZjlONDg2b2prNVVlbGQ5?=
 =?utf-8?B?M2hUdDYxcnNDUk1hSUV5ZnpwNVB4c2VhVHRyazQzSkNHRDlZakVKWkFFVkhE?=
 =?utf-8?B?anN5R2ZRVWc3Z2M2REErVjBYdG0wSHZJQ1l0cmlIYlExSkJNRWlzS3VBeXY1?=
 =?utf-8?B?Y1VpYlp5elNuWUlNOU1OS1lWakpEWENoMFcvK2sremtCRTFieUdVYk5abHRN?=
 =?utf-8?B?dm0raTI1VXFKZFhTWDgxQkNTYjFoM1ptVG5URmxxZFl0TUpCNzdHR2NXeDlv?=
 =?utf-8?B?eTliZHBjSzNxaGR3cTFFTTN4SDJSWVo1a1Z3b0J5c2crMGIyWkhzcVpELzFQ?=
 =?utf-8?B?UnZDQkhhRHlSMUViY1l2ckNtYU9UUmFqbTVrL0EwbHI3NVZXWFlpbUd2ZTNN?=
 =?utf-8?B?eHBiK0pUZEdwSGNoZS8vaHh3SnBaZHAvRVlrdlVhZzREZlhJdnVkU1FlRXA1?=
 =?utf-8?B?b0lUb0tnWGs0cDRPUW1UcmdmNmY0NzJXRTBFaDlnWTdLdmlmekZxMFVSeTJa?=
 =?utf-8?B?aFg5bEZuRXJhKzFRZWVrU2lGVFhkMEcrb2Z6ZFpLL0ZTS2ZLK3RGNzE3ZXdh?=
 =?utf-8?B?MTJHRUhzS1EvMm5UejA0TWZxcWpqT3NwOEIrOEduUi93ZkhvVk80d2Q1RW1H?=
 =?utf-8?B?VVFQWXBmejR0VTQxNEJMc3QwTVB3ZWkvVTZocmZuSXRXWGhYclN0cWlvQUVs?=
 =?utf-8?B?N0Y5bVlDRHRQL0UrelhvNTI2Rk9MdDgrSVdiREVRV2IzTXBsMUI0UFpqMExy?=
 =?utf-8?B?cFFCaUxIdHp6U2l0c2JFamNmRHNJbGZNWDQwUzQ0b2xjbnByMjEvWkhWaC9l?=
 =?utf-8?B?ZDlCeEhwWkxZeXVCZVJNL0FGY2lIbEZQNlYzV1JiM2NCTm4wcFlsVEhrRFVB?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9736be-403d-470b-a480-08dba88e355f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:48:14.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHzDbiyccLns9ozDoz8miRgGqxNOVV1J5bICpqRdSOAUC7G3AI8dG1JIaHP5Ht3794ObIe370ddGYkPGb1+V5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 26/08/2023 09:56, Krzysztof Kozlowski wrote:
> On 25/08/2023 18:42, Ninad Malwade wrote:
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
>> to use the same shunt-resistor value on all included channels. Add a
>> new property, 'summation-bypass', to allow specific channels to be
>> excluded from the summation control function if the shunt resistor
>> is different to other channels.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
>> ---
>>   .../devicetree/bindings/hwmon/ti,ina3221.yaml  | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> index 0c6d41423d8c..20c23febf575 100644
>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> @@ -55,6 +55,24 @@ patternProperties:
>>         shunt-resistor-micro-ohms:
>>           description: shunt resistor value in micro-Ohm
>>   
>> +      summation-bypass:
> 
> What is the type? There is no vendor prefix here, so you added it as a
> generic property. Which other devices use or can use it?
> 
>> +        description: |
>> +          The INA3221 has a critical alert pin that can be controlled by the
>> +          summation control function. This function adds the single
>> +          shunt-voltage conversions for the desired channels in order to
>> +          compare the combined sum to the programmed limit. The Shunt-Voltage
>> +          Sum Limit register contains the programmed value that is compared
>> +          to the value in the Shunt-Voltage Sum register in order to
>> +          determine if the total summed limit is exceeded. If the
>> +          shunt-voltage sum limit value is exceeded, the critical alert pin
>> +          pulls low.
>> +
>> +          For the summation limit to have a meaningful value, it is necessary
>> +          to use the same shunt-resistor value on all included channels. If
>> +          this is not the case for specific channels, then the
>> +          'summation-bypass' can be populated for a specific channel to
>> +          exclude from the summation control function.
> 
> I don't understand what this property does. You described feature in the
> device, that's good, but how does it map to the property? Bypass means
> disable?


Yes it means 'disable'. I kept as 'bypass' to align with the original 
patch [0], but if it is clearer, we could change this to be 
'summation-disable'.

Jon

[0] https://lore.kernel.org/lkml/20221108045243.24143-1-nmalwade@nvidia.com/

-- 
nvpublic
