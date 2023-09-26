Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78D0E7E62E
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Sep 2023 12:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbjIZMDR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Sep 2023 08:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbjIZMDQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Sep 2023 08:03:16 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17305DE;
        Tue, 26 Sep 2023 05:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrJyLq0SvjCw5g357QGnpRQSszbAXkAT3hlksQu+GIHJYamtqX3QDRG1zMDdnCBD5k8tJpO/XKjjCnFNLN9NqnNpK8+k/HX+ZlzqbGQelep5SU7yvTAhrzhgPdd9BhaKl8kGYjgiOkLBsBTvaUEeBuhdLcRG2yIEHQ7/JM4TucHNNMKLDMCL5DiA5k7BqZMT4b4dxOEM8MUMlM1jJqKK/N5pZhAtKTjMV8KA/jOmbjCzJlDGShC81+ECqzAViI02sad77wfgz3Zgr1xqD0dApdABbxfprnc9c0Dr3e6nfam81mo4w+Fa02WB80HHikHTdtCnaDg1nhUFBcptLL/hCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkhTz25BkOTCxP/hjePc+CNO17DMidgdvRlAeTmED1M=;
 b=FrS4zHDRqa/8Et2wPNPLoIhWkwHafwsTJcJHrWwXPdjxyjI9+qPOAErlLj7gtXEM31dw515pG8zwZYosaWQau8+y2XebtLIet6K+SAtL7Q7SkmdoOiEYWiqDPsN/2euABezzK7xbye3OWXs8bf8tbjswGpjTKhd7lvFruIvd3YuQYv7s6Pl27nyN/Sydrq4K759yAfXAzE7WGNSmyhh2oPiIHOBm3mVOLPgglqO2dnjbN6nafxwBVxaq3yAJ5nX0A5YA2ptrf0VRHrZ7eTp6wUTY5+USRw+93cDZDwTE1mJ23wOn7d7jdPozmHwwXYOD6NgPguFDHvg2Tun2zcO4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkhTz25BkOTCxP/hjePc+CNO17DMidgdvRlAeTmED1M=;
 b=evdXHWrr0PxpZDTzO6Z+LKsBoN3MDOVfpA8N9Av/9U9OFtlEQAlfWmjXMSlVgpxayn6IFuIK3PsdFixE31tLJL3cgw+yogrkzGaaP8+OVEnMh6a6YDhQdAumVbQimd2oLPf5L9LZL6sAFmgzqx0SjxxpNzajvxWf7mBhThVke5Poafga2/sYpBzbBUDlK4fCpavr6yKk2oSnmKIz+TAnKBz1Kh/wi8T4nVg3HlE1732Ryf5e6fweeMY1ZsqcIZ6lLtbjlZYFPVhj/UOvI2frZ3jE57yysEsq2M+abQcYVM2p3jgWL527gLc2Ahj6iiq5NXVHDrWNT1cHk9mwNRQfaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Tue, 26 Sep 2023 12:02:58 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 12:02:58 +0000
Message-ID: <328a6a4e-5dd4-90a3-ff4c-1efe3a00a968@nvidia.com>
Date:   Tue, 26 Sep 2023 13:02:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
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
 <c2a5a199-2297-d0ca-515c-64b1dd267509@nvidia.com>
 <20230926-caretaker-raging-0fe380cd1232@spud>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230926-caretaker-raging-0fe380cd1232@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 20459779-3947-4263-67a3-08dbbe88864b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4QabPXT5/xGEJHmzji33wsSHHIkD3GXEfrfu7zs4WPLj3dD6bKty0+l+GHWUDQBgpwTh5gIBAatVm5Mrl7fg79DYqtPw4AS1/ptU3x2DqCcISeCpxqi/Z76dvFP79D6+2orXhpPz1/jmmxOVCMe3BAc/pioqQj11ElFJzTGH8r05ORlGBFI4a4R7EDJ4d9qn2+pGcSFh7dhGPQ7mY69Z5X+Xe9N20br9a+SkZSJtyHUF4sf3C0RvXRs47aH/dlEoJnW0Rll0BJT7t6cBziLYi15Wfv0nE4zkNSKejjRiZnwq+CkrMghY+7c+ppm+aFnevwSqL7rpPOUdKpExvnBifjNIfSNqStEQmUn+eUcbwjAkxSokrFTw+tcA8Oabx2ddsxUqj90+715pRrzeVOjVmhZ9lJZ0l6FccjKxEDljYXnGn6qH0R+W1vHTKI2XBpEAdsIeZ00T/sidCBjLAg+ljtNDFqZTaHlC3vMhOPtngxzgc99C5eTcdRhVoL/eXPUfy5aml7bvPVh/zPMpBJ7PD629A2HukyZe45HgB+QlCLXXSiLecly3Ftom79lJkwEpE4vlkJD6a09TCeYQwl/rzziQ1meZ4Ouudy8NyQXZp8Fj5wT6Nz4TN40mbVqwzJQqvDC/yLjc7A0CVzpUimwZBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(316002)(6916009)(41300700001)(2616005)(6512007)(26005)(38100700002)(6666004)(53546011)(6506007)(478600001)(83380400001)(55236004)(36756003)(6486002)(86362001)(31696002)(66556008)(66476007)(54906003)(66946007)(7416002)(2906002)(31686004)(8676002)(8936002)(5660300002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDgwTy80a2lZOCsrQy9UUTloVS9UNDhkR0tLZ1pxMUtmS29CYUpaUnM0UU1Y?=
 =?utf-8?B?blF2cmJNUTBvbk1mV0JSemFXQ2xLejNwU05HQjE3czV4eXZkVlNJdVJneUcv?=
 =?utf-8?B?bzVEOEloOUlNUE9KcGF2V3IycWlJRWlsWUFKdnlZekFwT0ZJSThLSHJVQlVN?=
 =?utf-8?B?TzU0OVluZkhnSTBObWpxclFPa3lWRnZMZm11WW53MVBRNSsvWGgwVDVvMnRs?=
 =?utf-8?B?dy9ieE9SYmtGek5UTmNLdFJWVitHcTlkQ0Y4eDJGMU9NM1ZxaUFKWnVDTFkz?=
 =?utf-8?B?eGpFbTFXZjIwRXN5a1hDMGZ5ZkV5ZS9ESU9VWDJoaUx2ck9mMUZGcjJhc1Bw?=
 =?utf-8?B?czJzMk5zR3pPdmNIZUJSVjZzU2w3bEkwakM1TkdWVndTS005QzZlTmhFbzRu?=
 =?utf-8?B?UEh0S3NsNlJZUVF2dktoaHV1RStNZXVUa1dBU1I3aEVjYTFPVjlkVzhxeVlY?=
 =?utf-8?B?N21BdDQ1VUN2dGRjNlZUV0RIbEIybmFDcFUzOXB3VFNtUTgxREZVYXpNVFBv?=
 =?utf-8?B?aU5QUnZOcnd0QWV3NEd6bkRJdllZdFIzaXBsYm92eEowdGdhbkhRWStibmc5?=
 =?utf-8?B?MzB5SVpMdFRWZ0hFcm5NK1lMcWUraFE0bjdWbk5mV2gzcnlRUUt2ekNKbXNo?=
 =?utf-8?B?azViWENwK2ZrMWoxWEZqQ1BKZkE2QWIxamhOQzVBVG9Sd25JQkNVQUhPM1Ur?=
 =?utf-8?B?S3pUMFF5cHNjOE8rWHVTb1FkM05rMkdKL2FBcE9uMDVOMHU2V05vWmJGc3p2?=
 =?utf-8?B?K25yYkxkMklpL3JSM0Y0Y20wVzVQRlFiZ094bVN1STltampzbklEY0JWNytI?=
 =?utf-8?B?NDBiMDdzWEdUREpVZE9qaXZ2UEp3UHR2dmo2akhEWjBpSUFCbTBSWjBVSDZW?=
 =?utf-8?B?SWRaZEs1U2diVEkreUZoTkM4cFcxVDlwYTRGQVJhaGFOOFliaDlBVWNNRzdJ?=
 =?utf-8?B?Si9IU2pwRzM3QUVsaEVqVmpDYm8xekxuZU04VUk3M0VwWTg2ZkpqRVYwaDlv?=
 =?utf-8?B?Yk9KdUxaZHl4SHF2WGRmQSswVTNKczhKZXNKVUtjb0hkRHhGaXZxYmRLNEdp?=
 =?utf-8?B?c1o1V1FTYmI0TjMrLzhwcEZVbU5EeHkvaUMzdnJ5QzFOTXdIdE5aQ3RKY0hT?=
 =?utf-8?B?b1ArcHZ0RDBkYUpIdTBjcy9oUjlCNy94Q3VkeGV2cXFwQ2lLUCtxd05uVExo?=
 =?utf-8?B?amdVT01LbzhrK3NnaXVYQkdoRjkzaWozZ25SbXNZUGp6OHR2aXdNbG9nZnNR?=
 =?utf-8?B?UDRSVVF6U3p3ZVJQZk1LSjVSMUVYb0RORUNNVUFXamJjNCt2TmhJRitLQndn?=
 =?utf-8?B?V0tvQTA1N1IyNUpxWXlyQXJYSEZsTWJwYkEwcDBVelc1c0NFNW9RT2x1cUJY?=
 =?utf-8?B?N3J6NDR4QlVlVlVocWZuazFNT0lubEVnb2txbmN2bE9zSjJ1Y0F1bjRrU1Jm?=
 =?utf-8?B?YlFjRWdzQW16aDFqVnp0UEIwRXRHNUVoOWJqQS9jYVp6TC9CYlpBR0dxcUFX?=
 =?utf-8?B?cFpqU1FncXl4R0gzSWJpNUpZSGUxZ05JdHoxSG84OWM5enFlNFpPeXducFdh?=
 =?utf-8?B?MmI5bnloMTRWS2x3ZzFra0lmb0VHTE1QR3h4c09RZ0pUZHR2MVRpS0t1bnMw?=
 =?utf-8?B?L1JtVmJnOVJGNnVRL2VCZEQrMkYvekhoZGFMczJPdDVSaXp6Y3VqRTVodm5E?=
 =?utf-8?B?RkNiOXRMcCtIVmM4OEU5K1VkZTNtR1Z1dERYRE1Xem16ZGhOYzFOQjJpMUpi?=
 =?utf-8?B?Z28xNGthanljWnlRTlF2N3ZBUEd0Unk2WmpOZVY5Z3g1NWNJZ0xUMjRMaWJU?=
 =?utf-8?B?T3dRQzZuZWxaV1E4cnZIa0ZFZGxRRExCTGNYZGFQbThKTjJNRjRrWWJka3hv?=
 =?utf-8?B?TmtIaktjck9HUXo3VXBkYkRyd0YzQWhOdERRaW5IaWx0R3Y5bkY3RDdmdGNO?=
 =?utf-8?B?cnBLS3U4aG9WMzNLQlNIbzVydlBDcmd0N2NKQVZxUUhxSzRxaHp3YVdtNUQw?=
 =?utf-8?B?S2lLZnNmRnNZaUhWTDJISjNIN3RYc09oemN6am9OQzMxUlhEeDY1d3FseDBU?=
 =?utf-8?B?eU5xbFBvYndQU3FNR21IaEtXSU84NVE2Zms0ZnJVRTJyYnlNTjFFaGFwK1ZV?=
 =?utf-8?Q?+Uapf9GQdBIaZ6PrCtm5A5N2y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20459779-3947-4263-67a3-08dbbe88864b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 12:02:58.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLgFrkxkrlBimwobFKVPBiceQrgA69PF5Umrq8SOLZyDO8ByP9YAMh1cxwSrahBv5iC41VG3bMkLNUX4av3Khw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 26/09/2023 10:18, Conor Dooley wrote:
> On Mon, Sep 25, 2023 at 11:46:58AM +0100, Jon Hunter wrote:
>>
>>
>> On 22/09/2023 22:01, Rob Herring wrote:
>>> On Thu, Sep 21, 2023 at 02:08:15PM +0100, Jon Hunter wrote:
>>>> From: Ninad Malwade <nmalwade@nvidia.com>
>>>>
>>>> Convert the TI INA3221 bindings from the free-form text format to
>>>> json-schema.
>>>>
>>>> Note that the INA3221 input channels default to enabled in the chip.
>>>> Unless channels are explicitly disabled in device-tree, input
>>>> channels will be enabled.
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>    .../devicetree/bindings/hwmon/ina3221.txt     | 54 ----------
>>>>    .../devicetree/bindings/hwmon/ti,ina3221.yaml | 98 +++++++++++++++++++
>>>>    2 files changed, 98 insertions(+), 54 deletions(-)
>>>>    delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
>>>>    create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>>
>>
>> ...
>>
>>>> +examples:
>>>> +  - |
>>>> +    i2c {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        power-sensor@40 {
>>>> +            compatible = "ti,ina3221";
>>>> +            reg = <0x40>;
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            input@0 {
>>>> +                reg = <0x0>;
>>>> +                status = "disabled";
>>>
>>> Examples should be enabled.
>>
>>
>> Yes normally that would be the case. However, per the discussion with
>> Guenter and the comment in the changelog, for this device channels are
>> enabled in the chip by default. And so to disable them, we need to
>> explicitly disable in device-tree.
> 
> Maybe a comment at this location would be good then, to point out that
> this is what you are trying to demonstrate with this example?
> 

OK yes I think that that will help convey that this is intentional in 
this case.

Thanks
Jon

-- 
nvpublic
