Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86821C25B50
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Jan 2023 22:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbjAWWS3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Jan 2023 17:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbjAWWS2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Jan 2023 17:18:28 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD63EB76;
        Mon, 23 Jan 2023 14:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrS+1OidG3B6PZ6SXJaoYKSJEUF9my1JNoR7dhom5Yj9Pk2DEVe2jXw0sUjtkZq4LpM5re6pZhOps/Kx1UlmOqWqJd5AhbWGIDuHFfw79FCsVymHJJvZJgBfVMF8VZGLZ81g9D9ZVe0uQEROwl9E0ayo9tRsG+RSu1/6IcX2SasJ+0aEDBGYEJ7pWD2XjGUMaNFWgf99txqzKtjZUDytToZtfFYnv11n0WIWUUIqeX+Y8HZh+c1j9NbD4bIGMkFsQJ/yjwtjAB6JTzAj3pjunS+E6TpFAX4QyobItRz4KLcJtYwZ2Tjp8fk8EKcdG2msomvqdLlSDqx6TcX6o8BewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hl5EgAq4JR7kb7Q0lNDp8gcd0zpeZK/hScV/KS6WxEw=;
 b=O59B6MWnwkvX8kFlt52gxY/5RqzFzfXuKelnrWQeT+qgZwTxzq0bbsKJC5UwVUAHlkOsmyvc3qpTvy+5dJ9ltD9yzc3ff9HabhIM4LkeGCL2+D925o6BD/48hOHhDiIAafelhrJol4E3juI3knLYBkn5mQjsk92jeZiXT7/T7qocQipwlWmBTYkso4EmreGOP72qBbh5PV69jSmxc3c1AhDyaJ5kTQCJc2JvljiMDTj1vZSypjdMei6uUuTy5VaHlOxU4BUPL9TEgtsfVBCV05Lg4EhpaOUcqfp1JLupb1EsEMo1D3mMcBo0KlkqMSSV3KjzAWrI6UJ9ceudBaeZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl5EgAq4JR7kb7Q0lNDp8gcd0zpeZK/hScV/KS6WxEw=;
 b=YgNv9jxhFpRhiOyl9ZnVLQwLS8oJqmqwDMkxXlaeV8nlSKiTeHD6apGSYI3OA3nhhGptR9kawOhGlRkbsr39JsFfJuKMpfjqsVYtOczfyVTjpxoGyeIc26JwQCvTU56WyX8G1xfJP/UKZNo190g/jljJHiP3fpPPscZ0SPIkQh9XM9kNx7Y+1+Oqr3UulrFNSV43Y0xPmLNx/vhLqLgRRaBkuDkJ9MnRo8LpUePeJBlRuH9KgKOoO/+Ghjr+WWa3vb8dXeeRjD3qM6Hi2HpVPK5v8KkVNf4S5InL6Vul4Ur5EVug9N3C/xT2EKv82GW13bKlgXIDxwInmOYM6qK4KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Mon, 23 Jan 2023 22:18:24 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%8]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 22:18:24 +0000
Message-ID: <392b05ef-0ac3-dca6-05f1-7201f4f647f6@nvidia.com>
Date:   Mon, 23 Jan 2023 22:16:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
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
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-2-jonathanh@nvidia.com>
 <2789cf94-60b4-7e35-50f8-e21b564a1dfb@linaro.org>
 <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
 <b86ed174-811a-023f-4a65-4bc0b10cf710@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <b86ed174-811a-023f-4a65-4bc0b10cf710@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0235.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a6fa43-8170-423e-afce-08dafd8fbe38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAA+EjUBHvLha9D5QOx5q3ZlFUfVw5TDKsjWkN85HV8OSO6+aaX7jrOujbykRvNtYvVSwmgB7iWMXNWfW8FFAp0YZKFaPfpkiVnxeyq8q4Op11Hzy7S9d/ls8Bn1PNHqpSYoJtMiSWoAcATiyDQxN5TnSDJWM/r6+k0fpEERcxEUTcia/ShCg7NbrDLiKR8l1Fo0ZeCWObVeYBpbSr9SA88bha/sn/CMtIJZzS6r6DnmpcwgOgofz01Ke7ZCctpAgwSAGRjZP7oKOJy3OpOC7LsveC43drbEzlVeogGmo+VJFQYtc7qdm5nU3ZM6mdKm9R0zTiLvpWPpNxDNk6jsslXcfafcYSbvCuoIueK99kvPkaBZP7iMgXimXsKRBX08uJB+HDvn0XPIEkNhGkC8YNEepXv+sIqbS+7ICe3xmo+xmoYgqrJjTAmqqmZ2UkT8bNtW5b7bFLyIttCBwUpw1lR7mxjCfOeFQ4JzzzEfomOYPF6pae+iGzdkiiorjkrMc8jc6Xj0GwN0mhw91rSooKZnRXGYSnyvNX4Wyu8tyy+HdrdezK5ELnmSISYVwkN8so9aoF83b7eYoSbDzOpv8lB22dBnu+9Z4BiTx8XT5UbbJIytkW5DAwjujNNZzunzrVBajMxpAseJYagXHdcX3itc+FVZ3z2kjdN8DrM6IOhAEIPD7AqBzKF40HCjpW/gZ4Y7UY0ng8i+hp4B8GsvDzzaCvViHGuTX6+SsLvcN8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199015)(31696002)(36756003)(6512007)(26005)(6486002)(110136005)(478600001)(6666004)(186003)(107886003)(53546011)(41300700001)(55236004)(2906002)(8936002)(5660300002)(4326008)(8676002)(2616005)(316002)(66946007)(66476007)(66556008)(6506007)(86362001)(38100700002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEUyU3BmeDFsTDJUTmYyUmNUMStONnc4emdUVTd6MkdtSlZFMTZLaUJXNFVX?=
 =?utf-8?B?VHZoYk9sSDZOMHQ1Qi9LQVc1cUVsc3EzNHJiOWxrb0tGMmZBSXdmdkhFME82?=
 =?utf-8?B?eWFKbGRJcXl5VElqdE1WRGlHOFMyZ0I2S2pRSE8yWVZxbkJXeDI1WnNBTVFu?=
 =?utf-8?B?RTRDS2Q0K2JZV2VneWJEYjc5UDRxT2RsSU1hdzRFampZZ0RXTEZaK1R0MkYv?=
 =?utf-8?B?ZEtIeFkvTDRxRHdER2JxMUhCUzlSby83VEcvczZoN2xYOHBLdjZiKzJ6S2Ju?=
 =?utf-8?B?b1AzY3prK09ldDUvbmRFNHZwZWtKVkNjek9wUURVUkFnNy9sUjZVTnJmSFhG?=
 =?utf-8?B?cXJ3MWJ2Ky9QV1UwaEhjL0dDcDI0d1VqL1Z6SEFVV2dybnpYWjJEcWxsa21W?=
 =?utf-8?B?TWpoSlRiV0d0dGswVUR6eU0xR1VZRlhZWjVNTDNUUnBTak5kc2ZMUDBRdmhZ?=
 =?utf-8?B?K2dVclJiUGhTTlpUakc3ZkRpNTdWN2dFWE9LZklwUldSb1M3eE00OG9UYUY5?=
 =?utf-8?B?UDdzUEVzLzF2K05SWmppbG1GSHZYV1BQclpTUkFDWERFNlJLR1pRSFROWElB?=
 =?utf-8?B?UGR5c1F2T1ZtTGJBaFl5MU9Jd0d5MU1tM3ArOFNVc0ZkUVJBaTRtZVU4M29N?=
 =?utf-8?B?R1JvWXNVcjJBTVp3akJFb1NHOExnbk5rS0ZaRWhjRmdidStPVWRJSnJwbWhY?=
 =?utf-8?B?Y29GU1ZQOGRuVUxDMHFWbFVoMjFBVkNXZ2phd0xKeXR4Z1E2ZUorcmFwcTZt?=
 =?utf-8?B?cFhxMzYvdkJPeG5PdU90VXR4MzBqWUVGVVNiamkrSkpJWWFDN3VhM2FuRXky?=
 =?utf-8?B?VGJQV2lGaDROY2Z0TjQ1MTNVWmdSbDF3UXdvdjljbGVzSjEvOXVtL2RkQTVa?=
 =?utf-8?B?WTdKL055SHMyNlBqUTczY1RrbmZGVzZ0S2ttdjVwV3BKdXVEMW1sRW13NFRY?=
 =?utf-8?B?SWZQcm1FcCtCdUNNVy9KTWFPak1vYUp5YjhaMVpxTUlocFhzR1pQUGpTMFVP?=
 =?utf-8?B?NVQ0RnFpNHdzc29tYXJWTFd4MjMzUEpGblk4QVNBYnQ1ckVja3YxRG1xRzlF?=
 =?utf-8?B?cm9xanlSUW5lSFNvYzBrUVlWR3lWQlpycFJuMjNKYTNHRFJiUmI2cGdJd3Ji?=
 =?utf-8?B?ZEtVRFFhWlRWZ2VyZjFmSlNpY2lkTXNDMkY5SUptNE1xS3M2TGxJRTcza2RZ?=
 =?utf-8?B?V2hrVVltOHczY0l3OE1ONkV4djdLcEszMlpZRSt6TlV6dUpnT2VqK1dONmJC?=
 =?utf-8?B?YXNSTjE3SkhzWUJLaXplRmgvNXd5dGlaOXRTQ1lvM3ViL3lQb1RYM1VhcGt4?=
 =?utf-8?B?Q2dGUUhOVnU1Nmk2NzdTTDdwcXFSNHJtb3dTYy8ySVBwOTB0djR4NFNqN3JE?=
 =?utf-8?B?ZlBUeXZFcVBOakhKWDBSdkg1ZHJiVEpLLy9PK0V3L2xnN2Y1MWhmdE9WTDVW?=
 =?utf-8?B?N2J0OUczTHlQcUJhcGIyd1dVTzB4ZW53cEZRNkNreURwZTBaY0pMQ1ltWW0z?=
 =?utf-8?B?WURySFBXd05nKzlCazFNbTl6UGNhb1JKNU91cTNxcFpuV09NNURmRXhHTnRU?=
 =?utf-8?B?SVhoS0t5ZWI0MFFFNHhCODZvRmgzT1dMZWcybVlVb3BZQmJrYWhGUjdkL0I0?=
 =?utf-8?B?SGVuWWRSd2xsQTU0a1lwK1FwR25wajlNUXlJbmdMVFFENFZFdE1jVjdZMWg3?=
 =?utf-8?B?K2N1dTFqU25PazRMTDgzZzBzT3J2UUFFK2VZcnhiRWh6eWNZaXJ0N2hvZy80?=
 =?utf-8?B?YU4vUjZ3eGVHYm03KzZ5SlJ5dDJKZVgwcmJkSW84aGNhTmFsbktGR0pOdXVr?=
 =?utf-8?B?SGpyNSt1b3VGcVJGNGZXbEIxOUx2Vzh6YlRyRVNUVk82NmljQUNIZWl2clNk?=
 =?utf-8?B?UVF6cmgxQTRJOEd2Z3dpZVlmbVh2TmhmdFJ3bU1iR2p4ODVpMlVuN3F0amxq?=
 =?utf-8?B?MUdZNldLWFRxalhxOGxITzZjS0FXOW9tS1pkY0dCQW1uenEzSjNXV0dmT2tQ?=
 =?utf-8?B?L1hLdmNPMjYvUmdQTGVNcFpPVnFFRGNFOWRhakUrM0duNnM4VHFTTytPYkpt?=
 =?utf-8?B?RXJJak5ITU9WVlc0L202U1BNblVNR2FZR2lLeENMS0orMzBHRHdZd2NtYXNQ?=
 =?utf-8?B?Y1lybGtFSVVEWW9oVzZsS3RWdE1EQkU2NzFVN0ZwN1NuVjYyVGlDK1ZnYjZC?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a6fa43-8170-423e-afce-08dafd8fbe38
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 22:18:24.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Pd0p3sbmOmmU3QVm7TcycnGP+kZQcMbVdCn2G6Kfqvh5fw8wpkoZvhoFbMWUNCOSBN88JRTFpecm1oqg2N5QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 23/01/2023 15:54, Krzysztof Kozlowski wrote:

...

>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/gpio/tegra194-gpio.h>
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    i2c {
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +      #interrupt-cells = <2>;
>>>
>>> Drop, does not look like relevant or used here.
>>
>>
>> Without the above I get ...
> 
> Didn't you drop too much? I meant only that one line above my comment,
> so only interrupt-cells.

Yes, I was not sure if you meant just interrupt-cells or all of them.
However ...

>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:25.13-26: Warning (reg_format): /example-0/i2c/typec-controller@8:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #address-cells value
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #size-cells value
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: typec-controller@8: interrupts: [[10], [8]] is too long

Per the above if we remove interrupt-cells, then we get ...

Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: typec@8: interrupts: [[10], [8]] is too long
 From schema: /home/jonathanh/workdir/tegra/korg-linux-next.git/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

So it seems that we need this as well.

Jon

-- 
nvpublic
