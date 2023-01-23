Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12343C38142
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Jan 2023 14:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjAWOdX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Jan 2023 09:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjAWOdW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Jan 2023 09:33:22 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831B37693;
        Mon, 23 Jan 2023 06:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIjkgrmPamvpo43GfeDEzuY7t9ZjBqn0rAnp1gdJC5TpFBaVIkXYpBEBDBaqz2EfHqfUiVfyYBjy+BRb4A+Acc9BKBdx4UagZnsYJlnuoLRirms+3FmYIXo52aSNg2SaDvGn74mw4DbBpPVeINxDo+GbpcNNsUNvvFsDAJ/JBrL04lmcA00o9G2WeihOOGpH0XMu+wJAnh9ZaKxPO9nIJscR6YeSCmje8kr2yahkWNUbgtoT5/IEAnaphe6T0bscASAFoqFa6NcPtioycwA/ogYFoE6PU6CZhx4MUtaBkKLxjUnvOIptUoiNYQREh8x2BT3KKz+GW5E+ZBK0Ys6lUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Pmps9L24qiJZfT66gM1Ahyu/GldNI7W7y1ogirN7Vo=;
 b=OZZq0GOqaq1bV8sH+Iheh79gRkK4QEQlLDN/3ycIMGSC4Sa5e+ZChiRUI+WggrgPCWbZVV0QB5vUdy7VLtoEPRNF3ZTp5Lc5gTm1vkZX50uyE7osZxl2tnkUwVGLvI5ItwoSIXNzpA2inF+ZYQC/+TSzOK7R17EbTcUmSxE/WBdSegWY6vFX8LXyRf8mVZHesPY9vFwFB1satXvG5uM0q5cTZylSFLoA6C4d9NZyAteSqB6NCmwzeeydDo7qfjdcfaXgC14KCwVp4/GH+q6s3N/KvmNs7jxVIRhEtCTVEq3R6CNBJo6g7dLjhqSTfCCZtRjErhrbIiCEnDXFtZf2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Pmps9L24qiJZfT66gM1Ahyu/GldNI7W7y1ogirN7Vo=;
 b=i0yIPIff8tf+/0jCAdpukgtVK9QuPOlP5c3zvfe3mkKZZksiVog7d451f2+LjiHQ4TkiUmb/dm48ezj16vmTqRdmXTfZ7Xujf49LSk62LZ63fiyT+cgSGDaP1a83QKNJ1oG5x4CqKP38Lgy4N7cDemrfoIki9k8DKx3UHSG7UO6t00q6d8lV0rYm4QyVtGUPzUv36Y4IRGWdts35CxBoTcQAM6cD/P5iZ/g3JB6q8V6D6+VVVlPj5GgRr8JddXHyVn21HTklOMEwuiC1WvmCmLFCxw4TW/iprtCZOYlaRcqYyxArccUbddwN+t+nA9h+zGv6OJvr7clvcVOvUaOSxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4370.namprd12.prod.outlook.com (2603:10b6:5:2aa::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Mon, 23 Jan 2023 14:33:19 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%8]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:33:19 +0000
Message-ID: <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
Date:   Mon, 23 Jan 2023 14:28:51 +0000
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
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <2789cf94-60b4-7e35-50f8-e21b564a1dfb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0027.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4370:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b778871-4450-4d1d-b20a-08dafd4ec5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hecf5Lak79XL+f8+ph0Ki0HGPB3QTGJKrb6zT1PhP+lUzlbg+1Oxxpc6nmqIslSRVTjqRl86pZkDu1aXY95wybE2AnJ8BiU+Cwq2rUEjwZOIPolaqi7D7XaTpWQ40zxlFhX9hwI+pv2OBQcfrMOxOt1MwheazNhsA7eaUF/+M1B6l5WsmHsJQ1BMwZmHmBRyhI83ZmpTjKuNe5tH+StSiBqwCLLwA8DBk2RzDOjj4IEpZp3SJQrV/R53pADIVr7bMxyJWnmJpEvvrdjG+Nv/tFTFp+t5fLlrUcKJid65QDiMRmz8VFW04kAhNOYVcEX9kXSA0s5aHhD/2KaucnRL1zb46vb5UsqD3laSYfY3kpq/S6+zZEZR9oaJmYp/EWStkFnu5cklCqHQktf8SQGkpdrt8o+kPJ8dk2QmvxshuozBl3fuJdAjkn2HIs9UhHcbvhYBEtvXGPP+VvIuANGHS5RJaO/+wpS968YtFhDiC+5aBrpyCLWBR1AqJtizq4Y6ZDYqqTi0EKuN3G2JuJYvINKbPHTHngQc9SjYfduOpNIQKQ0pIOZIlOFAel65jFHYsP/X9WSzDJLEs5uu3rAQ3j70t/0LIBu0+tTxPwxbPRJyYve7u05Zir1spz3XYsKdB5nzo6vSp4hLeufUNs2O5p1y1uLkoQVYcsLHk4l//e0w151QGt7CAXk4fftd3ZeeGGogOAfY3ipAD6uBuoiQnVQ59xsackJToZKK0gYKa8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(83380400001)(38100700002)(31696002)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(8676002)(55236004)(26005)(53546011)(186003)(6512007)(6506007)(6666004)(107886003)(66476007)(316002)(66946007)(2616005)(66556008)(478600001)(110136005)(966005)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3VEVDlxNm5VV3ZkTWRLTXpRQmNXamdCQkt2N2Z0ZmF2SVpTaXJrN2hPL0lH?=
 =?utf-8?B?L2pDY2l0MVJBUkVsNFRCMzhIQmF0MkVwbDcrc3BDZUYvQVJlSlExK3BXd08x?=
 =?utf-8?B?VUhGNmZCMTZvL3hhK0ZRcU84dTlxSExKeE1MaHFkMkpzNXAyZnlXS2d4RU1X?=
 =?utf-8?B?VHpFV3VQNVZqOVI1SXBWbVlPS3FRNU5QOFdXVHdnSVlvNG02bVBnV2VYbVMy?=
 =?utf-8?B?T3NRLyt5L2pldExQSWlUb3UzQ3NDVWl5N0FpOHcrUlQ4cHdySUw5NEJkbnFX?=
 =?utf-8?B?QUtCSlo2Szg3eWNnZkplejlvbHlWUGNMaFR1QXBaU2lMNlFCdWNwaXVpdUJz?=
 =?utf-8?B?UTlIMFZ6anZKOUV1VkVEcmtuQ3hybVJmSUhDUFNkc29jUkExTk9iYkhBYmNu?=
 =?utf-8?B?aWdIN3dFK1hmWTV4cVI1bGFhTG1VZkdRNy9RelZnaVk3dkdUZkQ5dDY5SVZ4?=
 =?utf-8?B?ZTEvcDVyUi95NEVScGIxR05JcTkvSTRnSnJSV0Z1NTBFTS9CdFNUUXlKR3gx?=
 =?utf-8?B?dndlWFlOZ0xyVlhUdUN4eVVFQlk5NkRUb2JnSStoSFR0bDBQekFYbDhPSTJQ?=
 =?utf-8?B?a1JoRTBkbU1NcXg0Z1pKKzFDdHkrZlA0SUlFenFoeWhQREtLYmhEVlJNRVBq?=
 =?utf-8?B?b1NaYjExd0hqNGdLNnh3TEVwRVJqU3hYS213eFNPZUlDWEFLaGVSNVQ1TlZn?=
 =?utf-8?B?STNSOUVhVDBPaDEwOUU2WlZKTHpPRFFHZUx6NTFxUHVXUWhVMG1mS0NRaUNT?=
 =?utf-8?B?dndDMWkyNUYza29iaGlKNmhMY2dVWTliaXNHUWlmWHpKVFh5czlGQ0RhcXd0?=
 =?utf-8?B?QjdYbHRxbStjemwvT3pNbHgvZ0xScU5rT2lXTzFJYThuNS9PakNoRGpscE0w?=
 =?utf-8?B?VU9rdXFFSFl1OTdlcXNNUU1IZUR1TmQ3TWJadzVPWmdJVytqLzdWUkNpOTNZ?=
 =?utf-8?B?dHhHc0NHb2dRa3FyR0tDK3QzajR6ajB4QXk2bTNPaW14dEVOZTVjY3V5bnNu?=
 =?utf-8?B?TnEvMFpNZnR5TGdGQzN0d0FEZERQNGVOT2hRbGFaQ2ZXK3BIUkw1dENHb1lV?=
 =?utf-8?B?bmVWVmxLU2RrVTJxdDRLZ1NKMm03NlM0c0FrNVd1WmNrQUMrTHdQelc5QnY0?=
 =?utf-8?B?ZStHaW1QSGI0VDh0WCtNVnJLTUgvZFpXdW44dExEZGxLR0lsMFRpamtVNUUr?=
 =?utf-8?B?bzlvdGwvd1ppbG9BaVF6ZzdpN2pzNXg2VEs4L2hWWTVwOTZUKzJEM2VXODI2?=
 =?utf-8?B?dUdSb2IycjlKR0c2MmMvOTROT3BmMGM3QTZrMm43ekdQbkI5UTI3bFN3eExo?=
 =?utf-8?B?TFVyc2JhbFVFbDlObmJlZ0lrcEVSRHVyVEJOUk9xaVRuTWMvb3ROV1NtRGNX?=
 =?utf-8?B?SmRUMXYxNjZ0Wjg0cmQwSUhUdVBpYVBGaG1YKzJkSDdPRGlkRHNqYUx5cFUv?=
 =?utf-8?B?TCtSd3JBK3VoUHhvUUhYRnVzUkZEVnFTellSSWlSU21Vd29nUlhzMkk3MkZJ?=
 =?utf-8?B?NVFzUCthbnl4dElwajI5eGZBaFpQWi9UT1dkUTRKdElwQks2WDhZbjlOMll3?=
 =?utf-8?B?NVBzaHpERjA2RUZvTytWcGY0dzQwZmFaSlN0cmYyR0d5bm9zUkU2YS8vWHBN?=
 =?utf-8?B?UGhSTVF2bDVwRE1YdExtVVBsMW1SenZTUWcydVYzaWNjRFMvY25TTG5RZTNy?=
 =?utf-8?B?T1dtai9UK3VZekkwUGlHL1lXbEl6VldzcGt0dFhMTDl2cXlmN0ZRL1d5eS9o?=
 =?utf-8?B?UTF3d3V6SGE0QTNYWkVkNERKRGgxclJDcmVtMFZXSXJuZzhLYmdjbysyVTRn?=
 =?utf-8?B?aTdiOU9QTWNIM1QwaTlTUXU3WGZyalFSNHpKYTdicmFNWnhpdkxOems3ZjUw?=
 =?utf-8?B?eC9QaWJsZzBRSXYwRVhpVWJ0T2lmaDN5UFo4OXM1QkZmRmdFTkMzRStVSFNK?=
 =?utf-8?B?UGd6dGtxU1F0MGNFTTlTa3lCTWQwRS9sTHBVRXNGbDVVWElldXBYMHRLNHdj?=
 =?utf-8?B?L3g2emZ4d1c1OTJTeWE3YjVZVGRYSGprL2I5Rk00cU5BYzA1Nkg2cFg1dncr?=
 =?utf-8?B?TTFsKzFrS01tenJLTWZNWVNwU0FjWW1GdytyM0s1eHh5ek04ZHFHdTFFc2ZZ?=
 =?utf-8?B?Tk05QTBkQ3dFRkIwdm5SeG5NSU9CTXpibWZ2ZTY3endlbGNpYWVMamlVcWcx?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b778871-4450-4d1d-b20a-08dafd4ec5a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:33:19.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pz2RGr5H+4MbT8JQUgZtN1rkg4i+mYty/uCnYf71XftBCV0h/sfjCSUyvCt8AqVZ+pzjr6iUqCUnSFVy5zInjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 20/01/2023 08:32, Krzysztof Kozlowski wrote:

...

>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/tegra194-gpio.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      #interrupt-cells = <2>;
> 
> Drop, does not look like relevant or used here.


Without the above I get ...

Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:25.13-26: Warning (reg_format): /example-0/i2c/typec-controller@8:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #address-cells value
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #size-cells value
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: typec-controller@8: interrupts: [[10], [8]] is too long

> 
>> +
>> +      ucsi-ccg@8 {
> 
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Thanks. I don't see anything there is would fit here, so would 'typec-controller' for the node name be OK?

Cheers
Jon

-- 
nvpublic
