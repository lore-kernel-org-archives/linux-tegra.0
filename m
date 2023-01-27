Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D330C54EAA
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbjA0PAG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbjA0PAF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:00:05 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4EF83953;
        Fri, 27 Jan 2023 07:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AS8jN8YS9pUVYzeZDmVeOgHMGcRUgqGPsP9YzZD9z/4TGgHSBxB8W2cjwNuKUSYPzG99QKDbiq3C+lU5hULrC/UaDatL4kjEmArgkcko3JwcJYqwewnFSaRlrenG7A1SGRS4rtoyPlKLe7pV6Z9PBe+P2QEmE+EFqi4CUbKEDvbQqKWXSwgXnbfowKwftz27LHuG/NeRs74Cw5Er429ZZZCBF+uWXWrO9d2UMS8uYWU7LvpVIJvpYrjiL8XR8IALooTc1rz5bPINxi/FcDIovdN5v0xSqoE/O99kGSFf3R2G01eDBwSdntCIbijnLwhkv6uuz4xUaBfkRdcATnVKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJhtIRoCCTJFIMHi5I5QnW7HaoQMcF3dVmDciE8rsho=;
 b=Km6/Q8Oxv7rjBSoHTu0U+Nylzbboyup0dSoaNqxBOJyB71QP2mpSInawf9888wPcOxT9bZ144gAcqQCIXwgfcgd2VmLouAigdwLqWdzAuLHl0r7JAlGQAMoYaxL2N9IGeI4R4srpY1T7DPrXRQboAD4DRLbMhcHVKspl/F/GoImKqcHUHVXfDobTIvdJJ4/8Fl31DTND8Tp7AlVrIfRmZUpa1Vurcecsj0toh4GbjMsXQ2R804jnCwX/SF+mEcMPaclUvVOm4FFJAsRIoa5xN24RyTW8dja590/ruu5yrlgkVrJjy2zA1SNeET9FLhUHa8nDOxknLY9uNUwii+lWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJhtIRoCCTJFIMHi5I5QnW7HaoQMcF3dVmDciE8rsho=;
 b=jii4TZRvF7LcoCi2VsO/C9f8OlubiALRRNneBOKkg4CgOLfvnaM75wGVhZKtgDqJHTdF6omvqKBp1V/l5uRP/kO31ml3x6IntNzqiezUzB0M9PtHc2eYyn6vKWjm+O+fX6HMLlmylRIkqlbtFXZG9MFAqsjN7VQjxY01yTEpJiGbZjjn8w37XZQrNzezFSCbYx2Kp8CX2tFxYOLcvHR6AQL3wP8eRfdJXb4l/jTm9EN078oYvNEMZscOlAnH3w9LkazLJPs36UOvTk39N2PeGpxzCe8VpNyDMayK9ohBHfZGvjSyyIWZJnVxToFJbt5uRGcG5X/FWsoGpgc8xOdrnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 15:00:01 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%6]) with mapi id 15.20.6043.025; Fri, 27 Jan 2023
 15:00:01 +0000
Message-ID: <5bd06892-313c-f979-dd1b-c75532e22da6@nvidia.com>
Date:   Fri, 27 Jan 2023 14:59:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V8 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
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
 <213afca0-43e8-4027-3da5-3f35f130148b@nvidia.com>
In-Reply-To: <213afca0-43e8-4027-3da5-3f35f130148b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0328.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::28) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f8586e-9a20-4262-8e7e-08db00772a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Q31brcGSyfk/afLN9ew+ca7DS3j2KxTkkinTzininm3XO0OTm4dhAYe3yqmC0OWtZYYMT/S7w51rbgPzQeFQ4YcdiusKDuLbkO3SC9aCoezmgBiG8MKy4mdJ+77rwYt0me/va4IZ0Qhxy+kxD6m/Lh0MEYp5+EAcxcSTAAPxcpjGz84u1VoieTadr6R08hxqZLjyo7gg082lsdSh2LCnJ2GDqWu/vioTkD3+1RlEvCb4WXGcHTJdWNuuTu+3xBhWVsvDKJvIqtLlj4auR4KvBsSW7h2sIPaJXEGJHAzg/ngZx/L/XLCrz3T4Q7MFTUc+32G/ed7tZ7uNxKexL+0dC0ZdFXXtX3/luGFZ5H71AUT1vQ8/BT8S2qip93jos3//tb5bkglhYrAZ78ZQOfVTDiiUf5ueji2Ncz0X5V4aRLoFXK9LpzsjhM7CbEglItRr9FjkyjiVJi0TiykSApMu6kQKp1WYHcLkQNtQiwG4IOZ3XjxXfLo4VCwUGu9cbLpvTbv8xkZ3V9irKWcn5I9V8Xq5+86YR0lM9iy+QNe+1Lj+IL7h5vZghAlaOlCkg1zwCgj/1OpnupYm3my7pVM7y++38YU5YZ5n5/6dWYeP4BAYJ+MsfhagOg/OOXFy+pxI+9+HfQ8zLRhy0uDXUpQ00zyd8anZHBhXVRBpBgfdVFv3txUGA7qA7Bk5Ko4ChkinfhbT6679xgUzwlaxxAjZuePVarjrCaJxik9D81AsssulkrZNNKv+6JEQg99ecE8KLsixGoYveh7/RfT5fzwryiNWSvhZ3tuqAR8q9hXUuELd0CzsPAQfKL6h0Lur2gh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199018)(110136005)(5660300002)(4326008)(2906002)(36756003)(66946007)(41300700001)(8676002)(8936002)(66476007)(66556008)(316002)(186003)(2616005)(83380400001)(107886003)(6666004)(966005)(6486002)(478600001)(6512007)(53546011)(6506007)(38100700002)(86362001)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDk5N3RkOGFadUN3bzk2SUVpSW9OQ0FXSThpNHRyQkpVamdDM1lublJ1RU9y?=
 =?utf-8?B?am5hZnlQQ1VLbS9lQzRYQXg1bXRMT2kvbm1Yb0RZT2ExdTFTM2xRVzRJekp0?=
 =?utf-8?B?Tmd5NE9hYlRXNFBDdjB6dWtCNnYwSXdVVmswWXA2cUFOQXIvKzRaM1c2OENz?=
 =?utf-8?B?c1dFT2NJZ3grRmR5cTJCdXlPc2p6ZW1NVldLV1ZiUFBiMmlwRkcyejNuVDVQ?=
 =?utf-8?B?U1R6MExUUDdWQWdEcEVveU9FQndjVHNJT21lVU1CRUw2V3AvZC9weE96YmZk?=
 =?utf-8?B?RVdReGlmcGhKbzNtQ3RXZHd0ODNFOHdkcmVDRXBVN05SWlBTZm9nSGtsSFlL?=
 =?utf-8?B?ajZXL20rd3VYdFRma05SOHJFeUpwWEVHaWZ4NTloMHNtdHdySUtCbzBxc3dY?=
 =?utf-8?B?NGg0MVUxY1pLa2R4TUhVQzhEMjZNRDBua2QySW9hR3UvRkdxQ1I0MkNlc2Nw?=
 =?utf-8?B?V2kzeURoMnBuOTE1RENtd0pjcTQwUmpTK095Mkk5YVFQRXlVTldpbjdNMHI0?=
 =?utf-8?B?aGFFMzlHWi9ZTTIwclpFNzA5Q0E0Vmlmelk5TENpcjRMYy9ac2xkbktUZFRk?=
 =?utf-8?B?eTBVSEptbVNoMnF6VXBKakd2Y0k5dVJFNCtSUzE1MGZyZnNiYXZnQUpuSWhO?=
 =?utf-8?B?YS9DWnN0ei9wcGxRall5cWRwU3VLVWV2aEZua3g1cXNrTHNNb3Q2UlVhU3Jy?=
 =?utf-8?B?MVJZVGlCbDNXTjQrMml6RXZwUWNGZk43T3h3bjdtdGZaaGQzRGVDREZzdWtQ?=
 =?utf-8?B?RDFEbmVYdUw0eWI3UkdMekc5ckVKVVZ5Q3cvZThuZzR5MEZBMDdRRjA5V3E0?=
 =?utf-8?B?cDUrSXVvVGRmNURKcjRoY3RUUEl0SXJwaW5CaWsyZ3ptdzJqZFk3NitjNjRM?=
 =?utf-8?B?dG5BY05XbDVTajZ6MGhISGNMbzl0NmIreUJZeDJrRUZmMlN6ZVR6MU1Vd1RF?=
 =?utf-8?B?RVpTcU9pUGE1UHpyU2x1TGcyMFYvU3dmS3krR3VDL0N4SFRTcHJtY21qMFFC?=
 =?utf-8?B?SWozcXZIbVdGemE3WmN5SExmQmJucWorUW5FOXJ4VXNZUDE1cWl4RGpyYUNp?=
 =?utf-8?B?NFVVckpPWU9ubFQyZnVVeHRUZ3hQOHpYSUJjVEN5dmphbnJOek9ta1ZrZmcx?=
 =?utf-8?B?clJ1UldzZjV0QWhvN0NqY3NIZlBKWUZFV2JnVWxPTFJ4QjFMTHE0dVFYNlNi?=
 =?utf-8?B?MDgyUkp2ZVowMXZRRlQvcFBnWkVMWURLa0tGV0NlSmRsU0NOVGNvZS81UG9s?=
 =?utf-8?B?bVNxckltaG81MW1LTlFZclh1SW9NbWllRlBndzhCMCsrU0pSUVlLWWxIVnZN?=
 =?utf-8?B?SERzT2x5bmhuQldQU0ZCelhzNVpEeFRSeXE5VUdjd2VYNTRLWlZnY2wzY0pV?=
 =?utf-8?B?ZVZNM1FKVkZnNWtmNDRlOWJFYTIvT0d5RzAxRzQxQjJTVkNtWTlBLzB6MkR5?=
 =?utf-8?B?ZUR4VXpraVZldm9DalQyeENPdGZQQ09Ta3dRUW5maE1YVW5qaCtCQmU0dlda?=
 =?utf-8?B?QXgzV0JHMmdjSmFhWW5DaitWeElXK2JvVXVqVkxZZWlseVpzaU1TbG43TU5B?=
 =?utf-8?B?UTdXYzdEcVNtZUZBd244OHhFZCs1WVNDQWpzNWpxU3VkTXlsRFFuUFdyZlMr?=
 =?utf-8?B?bytKb2pTWWJGbmFFYlViNXkrQ1FndG5Jbm9raFFMZVI0cXd1VzlHSDh3ck1n?=
 =?utf-8?B?aG5hV1luMlVGcXMzTXFTV3QvelQyQ1U3U3Z4bnFtQmtic0Y0MytCTEFhMDN1?=
 =?utf-8?B?aVIxbzhwZGpaQmh5RWs4VCtXbFFWTyttc01DZlg1S3h4WXpCSG0vZkpldFRG?=
 =?utf-8?B?dlpGbzlLSUt6MXpIK3V6TEJvTlhKaXNKSWtzaE1RTWsycWZaemlaRjJOenYr?=
 =?utf-8?B?S3JQZVpMZkROd0ZEdjJvU1JJZmxIMzl4TE9LRmVIQ3dqcUpDRnRZcStPVEVW?=
 =?utf-8?B?bFYveDB3QmFhbDhQQjc2dlF2QTl4cVZ3eUl1c1JPVGJqckJKK042WmkvK0dh?=
 =?utf-8?B?NWo2MFAwYVhyRFp4VW1wc2d5TWRiZmpqaitzelA4ZXZHSWdZblY1UjU4ZDNk?=
 =?utf-8?B?emh0b1h6bmZDTFgxL29xUTRDZ2VsNkR5VE5xUG16MktRZFU3TTdGOUliaEIw?=
 =?utf-8?B?MVJ4eGliR0EwWFRFY2hld0tadGlvbWFnaDZDcG5uNEswL0NyUSt0RnBGeWZK?=
 =?utf-8?B?czZwTW5GRE1lK2QySjdoOTQ0SjEzU1U0NS9rbFJjNTFMQi9MWjA2MmhrMTcr?=
 =?utf-8?B?dHZjVndpZXVQamg1OFpkZXVGbmFnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f8586e-9a20-4262-8e7e-08db00772a2e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:00:01.3434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO8x8+9pBwKME6ZMKK1MpieJXZxvcCPbwN/7gKO8hd1aVD7e3RKjg5YP7WtE2Jfx3UVVhAeaHirOJxyBGhyhTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/01/2023 15:05, Jon Hunter wrote:
> 
> On 26/01/2023 11:36, Krzysztof Kozlowski wrote:
>> On 25/01/2023 21:42, Jon Hunter wrote:
>>> From: Wayne Chang <waynec@nvidia.com>
>>>
>>> Add the device-tree binding documentation for Cypress cypd4226 dual
>>> Type-C controller.
>>>
>>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>
>>> +
>>> +  firmware-name:
>>> +    enum:
>>> +      - nvidia,gpu
>>> +      - nvidia,jetson-agx-xavier
>>> +    description: |
>>> +      The name of the CCGx firmware built for product series.
>>> +      should be set one of following:
>>> +      - "nvidia,gpu" for the NVIDIA RTX product series
>>> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
>>> +
>>> +patternProperties:
>>> +  '^connector@[0-1]+$':
>>> +    $ref: /schemas/connector/usb-connector.yaml#
>>
>> No improvements here
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
>>
>> Thank you.
> 
> 
> Hmmm ... I think I misinterpreted what you were asking/suggesting. OK, 
> let me fix this up.


Apologies for royally messing this up. What makes it worse is that this 
should have been fixed after V1 [0]. I have re-spun and will send out 
again shortly.

Jon

[0] 
https://lore.kernel.org/linux-tegra/f491fde0-5448-ddf2-d227-c42e30fd37d8@nvidia.com/

-- 
nvpublic
