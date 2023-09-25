Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A7CCE7A81
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Sep 2023 10:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjIYKrQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Sep 2023 06:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIYKrO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Sep 2023 06:47:14 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A53DA3;
        Mon, 25 Sep 2023 03:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBBGgvyddsNCH2RciioahgIFXH/Jt2e5o1RfdXaRYBYjPII7EsHUTP5lD8lC8TtlBpyS9gMaeQFItAAI4Ven7l5a0RxMALrlKzjuh5nDebGCmCl/APIuMZNn4Y6FkVPdrELhConDbTywKXykypkDcynh0HUsK4CzJZHaLEGdW+ChpBEgmuTs1Gca/KKG7Ua1MrUeRB1zk/1snit3HT/Rwbm+4mkRLswH7ie1qP+Oci3K+prsBQShtCUiJdHhzazO1cyu9gNohSgikfneX9NqcaFMTtj5p/pi9k8aMBv2qyWrXOqBxzcbej1UZa8Jo+QJwjH7f5W2c6W1OOg4XtAddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc0lAHewZmta+amd7H0H4zlX5L/rhzTmsx1Jg6OFaT4=;
 b=Cbn7B3VTMCR1G+PeYxJQb3oY1nLbvO3z1Zx0r6vuSoQqYWdkfITRsZxgzOoxF2gUwwR8gwfxuqpFrLyxtD87H/MVSkzwHs5Qiringq7FYsVJTG2iBBrBgkt0ch/YvD4EjOZ9P2cTkTxEsaC+K0MSi+DnxEJcSNL5YPLPZxUZxlXBJIHlg8Pd5FEgDhmPLdJZTE/3BFISQbVzpldSu90NnKoBaWx47aqsRhYtRGKGK7oqZhSczbVVj3q4WeEhE8vMJK0Xl/wZQRqX5wboNWYoJ1yJ+ysjKO+3j2IrKfvOeqVUA3i+VTSbOdtoOcoWdu13e+X8lqO3DU2kuo4C2GPAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc0lAHewZmta+amd7H0H4zlX5L/rhzTmsx1Jg6OFaT4=;
 b=XrcwNBI8SbNhkDTl4giE6uLeY1i5BmijItI9+dpvbkOfYPg9DDd1sXTADAfw49gNhOG37xhpmHA1U2WLB5GM80nTmM0IWJiOwccWoWAHMHDHvRe6/Le5ZOURyRgNBUktZhc76S3YPOLucx/fD+WZKAqrepmbdYWsTjpqfNdZRwH9mJTg4K12e+wTqz5c94b/n0dj3f6pCIHrKWXNW3veXb8GMHJcHKhDakfIbjU14DJBvT4ok2M0sc9xDzYizr2X+Z8kIJAqeXD8cAEBnN2RB6VJ6Pg88PRCNpH6ZNqF5vgq/l/jnwxuXpo/pOLH6mz8RRvyOSLZri21OO5QAEwSgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 10:47:05 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865%4]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 10:47:05 +0000
Message-ID: <c2a5a199-2297-d0ca-515c-64b1dd267509@nvidia.com>
Date:   Mon, 25 Sep 2023 11:46:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ninad Malwade <nmalwade@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230921130818.21247-1-jonathanh@nvidia.com>
 <20230921130818.21247-2-jonathanh@nvidia.com>
 <20230922210101.GA3562325-robh@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230922210101.GA3562325-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0554.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7a22e5-aee7-4021-1751-08dbbdb4c22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3wABh6GN1x12wS5rtFP4yEWWVADUA4j/uoA7he9ccS01TipCkGpnNg1Ed2D7WJDY6Iog2m+yrilE664ZiVDBmvL5TYWHf5k4MTG/y0qxryGZfevZKafU1LAal77ZCWKadi+DC7AYK8Xxx+m3/GlDr0yxW31uikQsBCOJLYRJFsIb4+bVaEWZIfT+K25/pI6+q1l34by83Og9+cS8S9Sp4KpeORf6pviw7FXPsMSGqdgjRoLA6+HBZAveRqIizj98OIxMQ1Pes7ddOuYDyGNTWS46LQ7iG+4Yd8DoqgdDVJvI4xBuMnWyN67lbR+NJugR3m9nlnzXfch/66/yWKOhAXEH9uhB7crApd5gA2Hvpe8Qgw1fj9Dr+J/GiVH4nP+rqWRsi1Uh1NUWbwIaOW9Jd+YB0pfryhWHX8aDWSmGpWVquWq4RlFc/T0L7DZ55FQp1BAojjcM/94RedB4gaEy8+248Fqwd2kABJG334HhJmHEsmwbMIuGI8/28EIZtNWHut9luwu02S5JzqrUKSSlV/3+FGTtDH06+SgKInE8QdW5wDfiDZ2Xi5g0f7MvTly70KXdnx79DuXO0xFcKmxBNeWS9nB5ycbWNcUuG6A5Cx5Wpvqq3KShtrjEKLaJWi/4XUA5DFPM7DDhk1qgnvbFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799009)(478600001)(86362001)(53546011)(6486002)(6506007)(6666004)(55236004)(83380400001)(66476007)(54906003)(5660300002)(2906002)(6916009)(7416002)(316002)(66946007)(66556008)(8936002)(4326008)(8676002)(41300700001)(6512007)(2616005)(38100700002)(36756003)(26005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHdSZmZEQUlUaHdpeE5mNFUzT2ZIc3ExY3NoK245VXV3VkhQQ2U4TGQ3KzA3?=
 =?utf-8?B?K0l1bUh6d0hmemt5WWp2UXFrS3NzOUpXODVrb3p0bS92SHk5aFpvbXdYSm9i?=
 =?utf-8?B?c2dhR0Q4NW5YeHlncEp5OWNDdElKRzI3MHJZNkVUOVN0RnJ4NFZReVpqMlNO?=
 =?utf-8?B?a3hqUWhhOGtiaU5CZVpYdXpQR2ZpaGh3cEhuaGJvcmszTGd5cGQ4QU84ejVI?=
 =?utf-8?B?akZGRXRoUGdpLzlqYUFPMWZIZmVnSGF6ditEbXZSOXM5SHYwTGRRWjNtbTdz?=
 =?utf-8?B?MGMvb1dRTFgwNUZELzhFdzZzdTd1QVJmNWpjQ2RWWGJMT2VsOVNTdXlocjZN?=
 =?utf-8?B?OUVqMmlWOHJtUnYxNUNTRURpd3VRQS82STVmYjc0eU1EcVI0T0hySzEvMzht?=
 =?utf-8?B?cGFMd2dKQmVnOVBmQmtYOGpVcjBOWndJTEJZTkR6cHBrd3RPeEcwalAvNktj?=
 =?utf-8?B?OThBZWFOYlk5TFh5RVpsMjRWKy9LTU93dDgwSUhkQlVvY1lWSjlrV0dFdmtB?=
 =?utf-8?B?alplNEtJT2IrTm8wRUVOSGg3SUFVZmtac0tGenVQNDR4NEF3Q2FGNUFCWllT?=
 =?utf-8?B?UGVFU0x5RnRpWDdBRFh6ZDJkMVNCZVgwcFBkWW16WGpxSG9TZFpLVWpYL2Fj?=
 =?utf-8?B?dWJVL29LWjY5M1VQd2xkdGhWOHc0OWZncVRrSWQ1L2svVmZ1eW9MdXgxdFdz?=
 =?utf-8?B?MlpGdmQ1RWFoMXZKckp3Vmx5d1JzVnY1OTBlUG9GT3hiWml1alVVbTI3djZL?=
 =?utf-8?B?Zmx6RjNjdmVQc2hMeFowSTlBQU1WOHJOeGlKanpxOE54N1ZDOHhXRHlTbWNt?=
 =?utf-8?B?UHZaUTJaeDFrTzNPYTNlcHY3RVZXbENVcnQ3b1pZcTI4Yk5JNSt5dm5vVmxY?=
 =?utf-8?B?cnl6cHkrYzNBUmFnTGwrZ3hCNHpWUFFiRnFlUXpyWHpucnNudFYwbFVkS2pj?=
 =?utf-8?B?bkplTHlwYTdYSVJRVlFqSHl0eWluS3F1OUlBcmxXS1pnMS8xZ2hsVEUzT1hp?=
 =?utf-8?B?cU1GazNIRFM5OG50WXlKdFg5UiticmRiZmVUV1creUdOb0VDOFI5M2xWY2Jw?=
 =?utf-8?B?OFF1akY3cVUxbFdMcTRVMnRnWFYrWUcrZ284Tk5aclROQW9TejZwWk55b3Fp?=
 =?utf-8?B?bFd5MURQK3Q2VDRMZmozd3lnMTNaNVRyS0lrdXJFVHVlOGM2T3RpVkRYVWtG?=
 =?utf-8?B?Z3FnZ2dxcElMU1pxM2xieG1KRWN6M2hwRVpYd0ZCdCt6MlRsWDhEVTZiMC8y?=
 =?utf-8?B?K2pMNjlsQnZvOGcrbjVQb0xremNTVm9ESjRUbG0zY09LdGp2emNaODFWM2FX?=
 =?utf-8?B?Q2NBbU5vRnBGV1lPSEVBbXV4S0FJU1l6ZkhGZnpEaHVKMDZVVWQ1akZsbkpi?=
 =?utf-8?B?MUdNTG9ad2NwVmpxeVA0cUlINEdIU2FvblpSRVRpNlQrSHlqejErWHF0L25C?=
 =?utf-8?B?a1N5ZFBuR2ZLcHVSMmMzM0tzekxtd2g5NFFzV0pOL3N6UEE0MCtEVFdQQ3pi?=
 =?utf-8?B?T3VEZGkvdWNpUUl5ZzNjY2p2ZXlmb0pUS3FCWU1SSVZaVHNGd3NXWUlGczlu?=
 =?utf-8?B?dVp5dmUvYXJOUENGcGV5d1hkRXBneHl1U25IaFBGQVlEbTVab3NtU0NMamw0?=
 =?utf-8?B?RjVMUnVVeVNrZ1FSMVZGdnNUa1h6d2E1S1poNFZ6TjhXanU3MXJ2Y1hLeVE3?=
 =?utf-8?B?cER3dlR4dVhLbE96Yy9QNnJPRHlEb2Y3MmFHc3NxOFBNMkdJbWd4M2JVYkJX?=
 =?utf-8?B?MjJlcEl6Vm5kQ05CbUJYc2ErdnhmaU96cWVieDVERjNKaTlIV290bG85cFdn?=
 =?utf-8?B?MlIwWU56Y0V2c3VuaFlsdmhBazZsbWlNazBIa0o2SVd6OW40TzhpMTFLcjNx?=
 =?utf-8?B?U2xra1lvMXFiVllzZWtYWFkrUjgwQ2hIL3FFb0NUdFhqSCtUUTZ5RHR0bTNm?=
 =?utf-8?B?YzJJUGlOT0pESm0zVGNZWEZMTllqdVpvdXd6cVk2dFJPWDAyVzNNTElXbWpm?=
 =?utf-8?B?TnJuRVRyLzZyMWFSUUdiV25Wc3VxNnFWc2NVUU14VTgrRnVYSmIwSUM3K2F0?=
 =?utf-8?B?TGFUaTJHMkNIQnUyckM0TmJGT0NDL0pMV1YyTmx6VjNIbW5sZlkrNysxQ2E0?=
 =?utf-8?Q?vrQFq6U5p6tBUjctjCLV9QBUQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7a22e5-aee7-4021-1751-08dbbdb4c22e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 10:47:05.3608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/YbsOUMEMhPWrLF7vSKAloy0CKS15TntIOm4lOWWtM8EC3PisblfzsiA7Fk8wDdZ+f/LxzYqL3Fgm+QjTU3kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 22/09/2023 22:01, Rob Herring wrote:
> On Thu, Sep 21, 2023 at 02:08:15PM +0100, Jon Hunter wrote:
>> From: Ninad Malwade <nmalwade@nvidia.com>
>>
>> Convert the TI INA3221 bindings from the free-form text format to
>> json-schema.
>>
>> Note that the INA3221 input channels default to enabled in the chip.
>> Unless channels are explicitly disabled in device-tree, input
>> channels will be enabled.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   .../devicetree/bindings/hwmon/ina3221.txt     | 54 ----------
>>   .../devicetree/bindings/hwmon/ti,ina3221.yaml | 98 +++++++++++++++++++
>>   2 files changed, 98 insertions(+), 54 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml


...

>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        power-sensor@40 {
>> +            compatible = "ti,ina3221";
>> +            reg = <0x40>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            input@0 {
>> +                reg = <0x0>;
>> +                status = "disabled";
> 
> Examples should be enabled.


Yes normally that would be the case. However, per the discussion with 
Guenter and the comment in the changelog, for this device channels are 
enabled in the chip by default. And so to disable them, we need to 
explicitly disable in device-tree.

Jon

-- 
nvpublic
