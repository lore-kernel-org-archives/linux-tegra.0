Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3100AE80A98
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbjI2Kbd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbjI2KbL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:31:11 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DD01BFE;
        Fri, 29 Sep 2023 03:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaLG0uoCWuTno/jUNYzuIq9XX1NyQFDddZFcSdQyrEiiFMSjb6rThrU+cRNadP7uExEDmpy75UymIoabyPnQ82PqgJkWcHjXbRly10+6dBJ5F30D/pHbThPSZgm4yRwSbMhGn2nIYZ+km8K5XxveTqMOBnOTogklUovOCiMYLqKWEPCp9iZt0L2J0bIiS9NKmhIaWW9MkR4PPEYFlOlm1uO53AKvbX17tP7FP0qb4ENyPxIc2pu5Q8bK2586af9aggaDXWmC82bHJfqqjk3RBtMGpv1NtfL9obmg/9aIzu73Bm8azkHraqTqw8p82tLAojnwOZgWc7VGVfFYXwCcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxBL1gg97Z8Mh5WoN5bctVJjOadrumzTJkD0PZkIYsw=;
 b=QEDPsYAGPfnvcYnAOMG22+F4YWL2s32UMwW8YbY4X5641CF7idCFwH7LUbn/J2v3RTvaUUOfRkHoBeNo3e9Hoo9Ynj5zL2Fa9PY6T1n1SnGgOw7XYw8NPjihCx76fi8oa6NjLZq5pKLx8XMX7C9H0NAPiBgIyL2+RCv7616O2rcsvMcEORhS+oQ6fmNtCgtGtSePqC7VV5b9cXu0JLnz5L4ONjJgMts+VA06tesme3YZfuxRhTruCMlEzQduWsqODHBJQvgbfkzA6P1BCi9L+/AwqFwqVaOotRihAq/KExz6DuLoYT4MzX9gT/EJ8xRyoEaeozJZVALLk0UHhKzNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxBL1gg97Z8Mh5WoN5bctVJjOadrumzTJkD0PZkIYsw=;
 b=s7Op2r44Gzd3vHVnssxA1AW784KxxRhyJpRt+AXjpIzoNVZOOTQku3pqlvm9WWK5GMsFLU+tIJpkwE/2ZY5Rg80bLm0qGNeWa/wdPczQGdxOslIJLVktzS6PxyvaBFkx2qwMHcTXsA8XR5KEeT/79hF57L6IV2E+4MzbgaBUQR8l0B6/2t2u+MVKGkFICnQLSLouql1hIOR56zSxcoBh0G7n3BDvk5/DvF0gfYv1MvOngH8FR6iuk/zDGG/tkzPOu4Zl60bSGgBtyARW5BcqJl95ePvliEn8Yhlk8DhcsVxQlXE4xYQcRS8p3WaEq6ohMjDkl8UvAvKVEwA+h8pBXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.25; Fri, 29 Sep 2023 10:29:59 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc%6]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 10:29:58 +0000
Message-ID: <99d640c6-f7cc-80ab-f7ae-fe18b9bd4de3@nvidia.com>
Date:   Fri, 29 Sep 2023 11:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4 2/4] dt-bindings: hwmon: ina3221: Add
 ti,summation-disable
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ninad Malwade <nmalwade@nvidia.com>
References: <20230929102744.84989-1-jonathanh@nvidia.com>
 <20230929102744.84989-3-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230929102744.84989-3-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0391.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::18) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH2PR12MB4310:EE_
X-MS-Office365-Filtering-Correlation-Id: 6565d534-23db-4cfc-a31b-08dbc0d707d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQaoTftW0d8AOD4/fqSyI5hVSnL/IEJaqXMFP/GceM8a/AROypxkig7AbwAP0hS2VCT5L/85Sc+P1pX0zJDUE5nwH1QBtNFgw6+KSwOxbxdTRlWe3d3foTa1RuCBIFSvzL7cU4v3XqQmQAEv6bUc49ADntpNfxVL4OCnt4AYbF4TXUDLWNMaVSBej2rNpDK3aKJxTl0GtplZexK5vBNvnGfHUDFdWT8h5nvqkW0oSq56C3YrzIiEvbRHiS5Ane8ZgnLlsoDupabdT4DWFigvCGEeHomLjD8eI2fqrm26XkTmTP/6tQaxwTeqbbjrgdzKv07/JikqQpptSambjg5RUS4t0k49wULqOSWMjZo7KnAqYqAiirmDBNqCndpvnhrZ1ypV4L4Q3+Y2Kua9/8MMj3LhlRqLMsYce7oiUQrdcK+S3v86KyM2DJdkbfKp/eyGZ6RyPuumuK3q9e6ZpqKbn5FMl3yiJ+w6Zx1cLN2EfmUdhUDoE6ctAFbPCYL2ISu1eQniZx8LPzY5BvXpcNe1h6Io51U/xdu70alp7aAD8LISbZixSA0pWVKBCWyF4gJzw0zz1Tw1H8mBQ28A1GdQ86501G58oScB+noWio/uUqHBOS+5TTEGfODZt/86X/lAvyGgAebJpTPNeLY0zbTAnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31686004)(2906002)(41300700001)(316002)(4326008)(8676002)(66946007)(8936002)(5660300002)(36756003)(110136005)(66556008)(6512007)(107886003)(478600001)(86362001)(66476007)(31696002)(6666004)(53546011)(6506007)(38100700002)(2616005)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhmWjRFdmQ4YzVxY2luYURLNnh5MEhya1ViaFBQNlhaQ2NMVjlBZHpuZUwr?=
 =?utf-8?B?SXZkTG1id1ZBdEhzdkVPT2pvcHE5MjVtblA4MkdYMS9yNmFGaGI2YWtueEs3?=
 =?utf-8?B?V1g0cmhFMmR4c29CWEpuNE1vR0JoRWJNbE9GaGNjVHphOS92bVlPTXErYldN?=
 =?utf-8?B?NVl0U0xTWDNuanU4dkNUb041Z1VETXh3VUxmeERWWlFsVm9iRlVQQ1MvSmNm?=
 =?utf-8?B?VzM3WFd2cmdGVjZlRUxRVWgxYWQvdElyQW5FaUxhb3Z6TXlIVmFZT0tkODAx?=
 =?utf-8?B?c2d3K2VCelBRTUpXZE5KMTFzMDFPV29uQk04ckdaUFlPOHFFbm1EcTVGQmh4?=
 =?utf-8?B?SG9OcDB2NTdrcC84bm0wM0E4eE16VzlrVTBwcU1GL0cvV01YajN3UEtiSm5r?=
 =?utf-8?B?UndiK2JsMFpCcksxaUlaQlliQTFINXRnSWJtZ0FpRlNBcGlIZGxuQkVqN3ZJ?=
 =?utf-8?B?WktjT2g2U0pLdzk4bVJvTk54b2E5bWFPa05WZjh0OHFRQUxVK2ZJT3ZFaWVK?=
 =?utf-8?B?ZEdYaDQrd0pVckIzVGxqaU5jblluU0w2VzY4VVNOajdRK1BvbnM2aFNOZ29s?=
 =?utf-8?B?R1ZySk9LM3FrZVNUVFI1SitXRnY3bmRoblgzN1hRNXJlTjhlcUYzbmtyVVpZ?=
 =?utf-8?B?VDlsa0ttM2x0dEFMMFBhTjF1Z2xMTi9NckM2RWFOQXp6aW94NGtkMmVxc2lX?=
 =?utf-8?B?SFdSZ0grTjBNTk4ycWlDdXBtN0pBM2ZSOTE4NzJZN2JISGtMN1pzZmdVeWlU?=
 =?utf-8?B?eks5bUZnWkU4dk54cjRFWnpoN0twSFpVTk8zUFB6STVkUWtKU05hSHZQRGU0?=
 =?utf-8?B?RFVxdzhhUVZJTUY5YjdNTnFNeFFlSWVCL212RmF4a2hpcFRPbk5VUkhYajVm?=
 =?utf-8?B?QnY2blNiQWVPVndwSDJFM2ZFeW1ReXpZeU5FQjFjWFo0bjFPZVF1dmNRY2dQ?=
 =?utf-8?B?T05nbVVzWFIvaGdRb1cwMmt5M0YxVVJkeDRZOEVLOTh5R3lRdXhmNk5wUXVN?=
 =?utf-8?B?amtCS2I0ZzI0L01td2pES0xwSk5McG9jaEtaemxWWTlyRVIxazJyOGFva0Z5?=
 =?utf-8?B?TEdqZTROSFg0QTlkelJRVGw1RExCeXQybk1mSHBLVWVQVFNVUkZ6VnJkYlRG?=
 =?utf-8?B?dGgxOFRTeS9MNXN4bzZIRFJJT20yaXBBSmFYck1hY3BpWnIrMThlYVFRbVZ6?=
 =?utf-8?B?anNrK3VwL1czSUp1OGtRZE1jL3NzemZWMXNiVHZjTTVycXBVNHZvVFAvNzl4?=
 =?utf-8?B?dHlnMzVZVGN3YjFNT2J2c2VNK2g4WU1jSkhjdFk1UTU2VTdXa0tjZG96UTZ6?=
 =?utf-8?B?SUhBOS9GMXZDSFlXSlVJU3NsaGE0SlNYVkwvaUpoc3ZuTUFuS01ySHFEUGVD?=
 =?utf-8?B?aUd5ODZaYVpycUFXQTdabkp3b2UzMVNuUU9ISWVhL3RJa3pHKzFXNXB6bXFN?=
 =?utf-8?B?YXcyK21udmIzdjVnNjU4VkhBQ1E5SGt5WHJMakl0U0NRVG1IZWtZMTJtUkts?=
 =?utf-8?B?UW9GRGRFZ3pXYThORkdOQWlncGpua2Z0c1FVeDlBNDFjNElmek9Fd3NlbnN0?=
 =?utf-8?B?QXVXb2FrSnhEWDlBcDUzd21wcGlLLzRWMkVUOVp4UCttMXBXNGNrSGx0UU9O?=
 =?utf-8?B?ZHRTRHkwbml0dVNxSUpoK3Y2RW1sUnJETk5tUDRaSHFlK0EwVkp2b1BKald4?=
 =?utf-8?B?eGdEN05YaDg0aC9MV2dyRTExZzR4Sy9VdEdDVVdkb3pSRXU1bWh0Q1hGMVFk?=
 =?utf-8?B?ZkJFSGJqRlhFcHpPNGdjV0ErYXJEU3haRlNjeEthMEgvekIxa0crZG5pUS9m?=
 =?utf-8?B?dDRrRWhxYnE3NmVEbjhNZ2lqenVvOE9EdzQwTXVIY2tZcUZDNGk0NTAxVTFP?=
 =?utf-8?B?bTBKMlhZV1ZrRmdBSDByU09hdTgzSEF4WTFMaEJ4eno2Wng4cEJjTXdSVXR3?=
 =?utf-8?B?YktDN29COWszcHhXN3pDSGdHZzVMVDdyQ2FFV2YzUW4zUW5IS3d6K3Fhb1RZ?=
 =?utf-8?B?V1p0aHFNNTNLTjhOYnhkUDFtaEZFc3FGYUlRbzlEN2ZPTDJ6cVRhcUJrK3Fm?=
 =?utf-8?B?ZVhDWHRwaGxoY1pFMEdqU0VhNmtTcitEMzdGaTZWWDdaRWRrQU1IZUtXZ0Ux?=
 =?utf-8?B?MXp6ZzdJUVdOektQSHZ0czZTdk9RMzIrTDlYbEtyVGNqcnU4VWdCTEs5bjR4?=
 =?utf-8?Q?4Rq2Q6sMz599xm205qg7eRE7ng5ZzqMM5SaA8tPcBSaJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6565d534-23db-4cfc-a31b-08dbc0d707d1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:29:58.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJZlBgOcBhnQn0ECgXkKY+5EHFEoQf3vqvYMLvPq6RMO2kqBsieJJJ0Qf1Kqqw1AFQ9JDeUlLVEhCm8hrXDSJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 29/09/2023 11:27, Jon Hunter wrote:
> The INA3221 has a critical alert pin that can be controlled by the
> summation control function. This function adds the single
> shunt-voltage conversions for the desired channels in order to
> compare the combined sum to the programmed limit. The Shunt-Voltage
> Sum Limit register contains the programmed value that is compared
> to the value in the Shunt-Voltage Sum register in order to
> determine if the total summed limit is exceeded. If the
> shunt-voltage sum limit value is exceeded, the critical alert pin
> pulls low.
> 
> For the summation limit to have a meaningful value, it is necessary
> to use the same shunt-resistor value on all included channels. Add a new
> vendor specific property, 'ti,summation-disable', to allow specific
> channels to be excluded from the summation control function if the shunt
> resistor is different to other channels or the channel should not be
> considered for triggering the critical alert pin.
> 
> Note that the ina3221 has always supported summing the various input
> channels and summation is enabled by default if the shunt-resistor
> values are the same. This change simply provides a way to exclude
> inputs from the summation. If this property is not populated, then the
> functionality of the driver does not change.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> ---
>   .../devicetree/bindings/hwmon/ti,ina3221.yaml | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> index d0e64a72af5b..d69f50d0e4ab 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> @@ -58,6 +58,25 @@ patternProperties:
>         shunt-resistor-micro-ohms:
>           description: shunt resistor value in micro-Ohm
>   
> +      ti,summation-disable:
> +        description: |
> +          The INA3221 has a critical alert pin that can be controlled by the
> +          summation control function. This function adds the single
> +          shunt-voltage conversions for the desired channels in order to
> +          compare the combined sum to the programmed limit. The Shunt-Voltage
> +          Sum Limit register contains the programmed value that is compared
> +          to the value in the Shunt-Voltage Sum register in order to
> +          determine if the total summed limit is exceeded. If the
> +          shunt-voltage sum limit value is exceeded, the critical alert pin
> +          is asserted.
> +
> +          For the summation limit to have a meaningful value, it is necessary
> +          to use the same shunt-resistor value on all enabled channels. If
> +          this is not the case or if a channel should not be used for
> +          triggering the critical alert pin, then this property can be used
> +          exclude specific channels from the summation control function.
> +        type: boolean
> +
>       required:
>         - reg
>   
> @@ -81,6 +100,10 @@ examples:
>   
>               input@0 {
>                   reg = <0x0>;
> +                /*
> +                 * Input channels are enabled by default in the device and so
> +                 * to disable, must be explicitly disabled in device-tree.
> +                 */
>                   status = "disabled";
>               };
>   

Ugh, I added this to the wrong patch. Let me correct this and send this 
again.

Jon

-- 
nvpublic
