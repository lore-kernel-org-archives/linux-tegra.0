Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B77CC38142
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Jan 2023 15:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjAWPIh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjAWPIg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Jan 2023 10:08:36 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222E9E3BC;
        Mon, 23 Jan 2023 07:08:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+EY1a2piXUlE3h70EsXdMxTG8bsGNv/QitLcSwl+gxFKCOtUuyGvcJaaHuViCBUoVwPSGiS8Ib8BO/i3ePqv7/Hb84GhbU06to029bREt6Kr43xJY9O99joSN7TA/Wvff6cvwf1Bbh3qVzztmybThAN9XVH+4pmNJLbHWKWeGVgtXArHkBDHbAfqf/5IcAjNmZQrNS44G8r9qX3Pz8aZKdmMeNhE7Lew/okcoIz73cvqTLTbRRYyMNXKYRnyd3lqGET7Tm7agG/zwpAie8teypraWEA8CK1jHha5yQ264c+01r/5x/g5Noq7HERo6mVvqw7Hn6ThuOyDmY/fy/3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkUCYVNxoQU8ramC0vCLWCjHQ8QXSBwF6gO6Qt4Rz7A=;
 b=hmYwnUStH4a+VSNKLCYLsfBD2OfyIujkNuTKjuI87z7z+43OeMiXje47Pa/Kh3yZbiZPjXQ/5U47770LKdC59+uOdyxK/qVz7VS2/+ZVbpT5vIUoD+6Z5A36LSIfxviPTg/XEZKRgZDsqpCQfHg+ctY4Jy7rUHKow+bAIYHj1Ky7qFvA+633b1lOwXv3xnw01ispwqYJ+1tCp0o7e02fhu1S02ziP9A4e64F95D2JpJjd1r8yVwg58IAQKnmf1uZegTZjyzzUmWsJ6e4bntFg/rNMj6ITaSsS9PbilSZVqz3vUNHyVlz6YC7GYN/uXCDWfjoUlnMC/P1iBPBj6ejVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkUCYVNxoQU8ramC0vCLWCjHQ8QXSBwF6gO6Qt4Rz7A=;
 b=FCMBjtblkIWvSslJO1AMEg3hMgbOjKFFSKa5eLGu+lrhJ51mM3D7Xmocu4Ukd+4l6cu5JFxpo6xEG7ZbyxwPkeRiateCykq42GOvf6TrnrNjvYL1UK5uowPeHdFc5RxJs4NW3KPGpwusfqWACO3qm/1U+Oevd8KC+KSp3WAY8R5QSyORY1nxT0uDE7khuyecBUxuJaPNGaZG/1UR4pjeqIwjGtbuGVs8/eKvZgwD+GHJuls2QRbI9K9h55Qc+DqOOgN1ijy6SJGqBHNpYGArToh/qrDTo7P0NdBZp/FRHA0zHiO8k9kgd9phpA1wYwNdarPyl9iFPLU5WLBulmOSIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY8PR12MB7414.namprd12.prod.outlook.com (2603:10b6:930:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Mon, 23 Jan 2023 15:08:33 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%8]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 15:08:33 +0000
Message-ID: <71814bdb-f7d9-330d-f85c-659db3499f6c@nvidia.com>
Date:   Mon, 23 Jan 2023 15:04:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
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
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-2-jonathanh@nvidia.com>
 <2789cf94-60b4-7e35-50f8-e21b564a1dfb@linaro.org>
 <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
In-Reply-To: <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY8PR12MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a2ab07-b643-4fee-5699-08dafd53b1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRJGDuxToy/dWzf/9RLD7hqtCqo+CZ5FJLX3V3zIQqcC54EjJdF1z/TFxGcVPai5RL1/E2LZGMT6WjN7dKEQzK/YKSpxijMsI8m4q0DFQlcwPEWBB2d9q0WahZByloD9OqpIb93YaCKc+wQ8TNMfNgg13STd7HBT7wuK3i4I2Fei2ICvoP8xX7DiJ00+9YeSLbBHGO7GTzKzJgtVI9ZQIt3LCMUOlVkdUDnMxbUEbWkjTnmKfQcxT1czaL+SNc8gStJvGDg0OFAIb/mnKMD5n91IwENo1nnB+etUpYC5hnpJ1pwG8fBEHEQaz7Ud537qg9ZbaiifDLuArLyAdx1ydQKnXoDA8CAq9Xip9sh4yhChOFWUp7O79pg4SWBF182Rv0d0UO942Yvp+zDq83WVyPqrcz7f5hxVOTzuvQua1eYDK5nbOhEyX8ed4Us4gvyZIIFROcB5dz2c31LBmIp9rm/H0Ck84Ii8eczv/FSZMuc99jj2G2L0TBsjwpes1vk9lTEqhnCtxIpLzYnvgpZ/TUwrKQ4I8l2jVmZmVTOXin942azwSw5LfBQOgrhwGgxn7UVxxgVz6srqm5uCAZ8Lt3VvapOQ/AoNZYmbslnSpvbrRCXTCg2WAPVhvyNaQFIV6+cT19Oof/IKM7SJkQug+H8Cw9fDAMdmftpmWZi4+c3AE4cqukc7x3hC5aMfoaAl4ZKZrjNm1YHszcvsuUdUxeGAqx5QLVrc5Wa3gxrZqh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199015)(31686004)(2906002)(66556008)(4326008)(66476007)(66946007)(966005)(8676002)(6486002)(2616005)(6512007)(6666004)(26005)(5660300002)(8936002)(107886003)(4744005)(41300700001)(186003)(6506007)(53546011)(55236004)(38100700002)(31696002)(478600001)(110136005)(316002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGtzWTNDTHRrRFlDd2JpeGlSdWJLMmJVNUloU0lDMG11aEpJcHJVd1RoejBh?=
 =?utf-8?B?T1RoM2xqYnRneVlaUWU0WFVTTlMraCsyYTkzSWl0UlFzTmZIL0NFZU9yajNH?=
 =?utf-8?B?ZlhKYW5PRUdLMGY3WmpZMTlsUWsybXpLaVFpQkdqckNoWXZUSFE4dHRlVE03?=
 =?utf-8?B?M3YycVFGR2lyS1Yxd3B6Rlo2OWVrOEg5SFFoZEEyWWlqOGZQRHh6a3E5b25H?=
 =?utf-8?B?OEltVXlUUGo5MWxUZ2lxSXNLV0pjem9NcG1YKy9RMzh0TU5CN3U3U1VaWW9n?=
 =?utf-8?B?cUFoRWVEc0c4RCs1NmlxTTRpLy9IckpaWWl2Yk1OOFB5bTJxd0dPV1hiUUF2?=
 =?utf-8?B?Yzc3endVSEpTdDlUZ0RwVmRDVWxCbFZMZmxEbkpsZDB1QjJVdFlhWjVZeDh5?=
 =?utf-8?B?WU5zcWs4QlJhNzdyOTV3NUR2eVJIS1gxSVdaTStqU2tHc2M2T2VkaGo3Ukcv?=
 =?utf-8?B?ZmZOSXAreDdiM01TTHdNYVNWVmY5Z1JSY3l4WmorNVJyU00rclo1SlZHcjUz?=
 =?utf-8?B?WjFrUTkxa1N0aGQwMTVheVZvT3RFUy9WdGl1UHR5OVJ3cVZwRVpaaUlUZWVH?=
 =?utf-8?B?OUFjMVpXWEVSeUV5cHQwRlB0ZUpweHR4OWJqTjZ1Rm1JekZ2YWVtQ3A1eC8w?=
 =?utf-8?B?TWFxbUNEU1VvbHdQU21ZQkVrcE51a2IvLzJUR2tYSHhBV3RKTnZlMjBtYXRK?=
 =?utf-8?B?T2UxNmJVMDlTRkpldldJc3NVVlN5UFEzaGFzOEpKTHB6S3NlRVRDUk1VZDJH?=
 =?utf-8?B?Z040NWJnblljQWhXZXNNSEV5cnlKaTVaK1RtNkdyVUFzZW5Tem5lUlFsaWVk?=
 =?utf-8?B?QUl1N0Q2UzhHQThNYU1zUEhhcWYrVnVPaVloNzB0RE5pdTZmdGZUNzFiMEVr?=
 =?utf-8?B?STVKQ2lWUm9ZRWQrNHZrK0tudWR2ZTliSHZtY0ZiSWtUMDBreDZXYTVCNmNa?=
 =?utf-8?B?aS9DV25McHR1ZXQzUC9xbURMWG8wRkxVNzhqbHVPM1NlYk56THU4TVJMdjNk?=
 =?utf-8?B?M1NVUnBDaUVHR3YvTWJYdDF4dlRWVHRrc0VCcFFIdHhvTTl6Zzd6MFBuUGhX?=
 =?utf-8?B?c2g5VkI2WTlzZi9SS25WOUhXdnFreCs3YzJWYVdSaE1tdG44NFUxeGdCdzJW?=
 =?utf-8?B?czEya3UrUG0vZDVSVUl5Z1JYemhQcmNYZkZ4REZDbEVxSEt4YkYrODJhbmJV?=
 =?utf-8?B?UElNQVljNTJBK0hkaG1XTHduMTV5M0c2a203RnZjY1ZPSzg0QXJibGN6SVNi?=
 =?utf-8?B?MEUrbkRFN0xUSEpsQzlDejZXQjBYOTBYTVRveWlDN1lOU3c3QWtRd3FyemhN?=
 =?utf-8?B?NFp6R0tCNGtvazFSdjhRL1NqY0Y2RnJxMjJzQmgyQmlDcXFZMGRMNEEzSUZN?=
 =?utf-8?B?NS8rcFRKWE54YVE4TkJ1V2k4UnpmckExZGZYVXFLVjkyK0gxNUxzRVRnYWRM?=
 =?utf-8?B?OW4yRWxNcEZ2OTNvYkJQSitiazBqc255OURkOVJTQkUxZ3VGM3RqOGF6RStV?=
 =?utf-8?B?RExaWGZIOStjN25LRFJUa1gxVTk2ckZBd2ZZa0kzNmRIS0l6ZHlFd00vaVUy?=
 =?utf-8?B?MS9QYWJkdXB3NHJLZ3h4OXFyeTQ0bjZXaXlDeFFONUY2T1BQTzlJcWJScENh?=
 =?utf-8?B?R0VZQ28vVTY2RW5Pa09HZzlYZ0tpbHVPdEZRTDRQeWtrcE5YYjZYQUJTQ05x?=
 =?utf-8?B?YTNMVUZXOUhyMlFGNE1NaVVBZG9hbFNoQmY2Rjd0UGVHNXQ0d3ZrTkNPZWtI?=
 =?utf-8?B?TnlwbTZLYTgrdGgwMkQ2YlZUcTNTOVhDeEVaeGRJdE9xN2JUWUF0UDV4WHVz?=
 =?utf-8?B?UGgrUjBEVGpEaUlHQjJsekNMaUFWUnQwMW5JaHN6ZmFtaEV3N1duRU4zWU01?=
 =?utf-8?B?ci85ZWJCRDZmbk1MTCthQjVQUmw5bFlyQXJGMWpacUMwcEFiUGlRVDFyNzNw?=
 =?utf-8?B?cXl4b2I0MDBHTjZIZlBvRjFFeHFkOFRHSDhNV1ZMZ2FMZVlTOWVEOThzaE5y?=
 =?utf-8?B?Z3pPeG5GVHMranpGSy9ZaCtFa2g4MzZDYWZWNVRYU21qOHVaNjBweXhhclN2?=
 =?utf-8?B?YnRXWHBpdDJqVjdFbFNwOFlGakJabHM3N2dBZ2hpK2hKV2pzd0k3NndyRk5z?=
 =?utf-8?B?RFBnZFhmcGdGVzIzWTdiandCV1RtZjJhMnk5M3hLeVRIYmxLbW5VbUFvNWhH?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a2ab07-b643-4fee-5699-08dafd53b1b2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 15:08:33.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BO+8QwzXHqydo0K2dNnrPxrAE/klnPT8s/Z0x7yAtc7LcswswclqOtuiKp2kjfIODXzpbDpB2Afq2ioBQ6RQHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7414
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 23/01/2023 14:28, Jon Hunter wrote:

...

>>> +
>>> +      ucsi-ccg@8 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
> Thanks. I don't see anything there is would fit here, so would 
> 'typec-controller' for the node name be OK?


Looks like the st,typec-stm32g0 and google,cros-ec-typec both use just 
'typec'. So we can use the same as this looks quite similar to the ST 
device.

Jon

-- 
nvpublic
