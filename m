Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8605C00A5A
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Jan 2023 00:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjARATG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 19:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjARASX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 19:18:23 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4DF51C66;
        Tue, 17 Jan 2023 15:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFKyNuxUiA0mHeyyYutx8HOwU9M72tuERrc9aQS/2E0XdZMXJnVDHYuJfTDUQkl+x8uLNFARGuFVEF4cIjM8nBTUGARGElHHGpzV7/3uNgjA7thxQ+OXCUetSgvkF46yh/hOHO2VXNwjzLot7sblfuteW/okablS8LZReJ+Nn9LpD/fJnLI14fwWIT0/K2C4UUvIH7M2QmR9+vOgjD4Y8zhf1kggKBiRFgTd7mOcjk9hKc55Cf1seujQqXDKttqWAF7rHAJYYqEaAnII8rHgIQ2MML32D5D3R6ZQJCmPSdYA7PgP5QeJP6XxKfNlxQ42yfrdddWv98nms9BaQIZGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XDiE9IBvTjFZ9k1oUx1mwJGbcXOCri6vz4KGXjYYMo=;
 b=ArR5Ruyu84h0yPbD/b6uGw9+YkYh5SljfjhOv52r9Af1oSpHvJ5R8qgX8rIphF+kOjnTIs60B9cxsJaDgcWzxmRnqV5T3hUCR9Okk4eeRWmd0vzmbNAPiw/nG6vVLej95p1IL7RG78elvRrB23eKkVhruFaCRCkj9J0svtq/oalmzbp64d1dkftnqqGR9kDvwtuMptDPsVrOH/MBM8DVX8tW7FzYghj76+yWnYxW1gcyoMe1St8tN6ze46GaW7bXn4UwXRb8LD3ZEW9fS9H9xs0ulro+Ja+pCyGjmUgFuzEN7XCMXgfywAw/PbpJe4rDv7n7tjZnEc4dBwKMe8WCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XDiE9IBvTjFZ9k1oUx1mwJGbcXOCri6vz4KGXjYYMo=;
 b=ZL9t8gZ0AsgKuSuqqWG6FAtnMWmCdXbIcOBoSz/ysrZEGrBFj9zt/S2sPSLruUV/ukD0EWuAWqPUzkEbq/ZclMHQgVbBNm8feQt6Q2CXKB4YzfdMOEnQjJ3Ksq0OuZ9g062ZtqAy/eZi21XNO44piCpi6ntSAGezRTa6WqlSqMK/AHntSRArrKGAzo/2WY4NpGTS9tkEK+p5UktU6J2Whx2hh9mL1HiQRuayeJMsJiQHLV8JHtp5c/f4CCX2MdtlcwXB8LHJm9GLfjsrjmBlYb3cvSeROwaDEdnctKzR7iZBMVs0nzyya5v00S0KZJWFiv+BDVhBXuMl1SS64hQzYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN6PR12MB8513.namprd12.prod.outlook.com (2603:10b6:208:472::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 17 Jan
 2023 23:33:53 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 23:33:53 +0000
Message-ID: <11349701-f82f-3a7f-61ef-11f1585958c3@nvidia.com>
Date:   Tue, 17 Jan 2023 23:29:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 3/5] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-4-jonathanh@nvidia.com>
 <Y8aOaH+ALBvjm/rH@kuha.fi.intel.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y8aOaH+ALBvjm/rH@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN6PR12MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a126cb-d6fb-425d-a56f-08daf8e34b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bgfag+tkQ2Lu+JM6IvOuO6GN0vvWe0QDQIS9S6Z4Mb+cZCZK9SRuVZr5xTUOyX85IEPHRbtsNglwxxjZLQ6QklchA9drSF4EcNCoIvqO3+GlGynBEeHJo/uLywnsPSurTRepYVZo5uabWQAoxtJWkZLRXiAdYCIAMQ/PLXtA4auHYOrFt+thk4jB8/X6KcEE9mzWDV84MYRtawFoYYVZCTm0tb7AlELVx/C84m5GCZQxi/PVnkvdFxYGMwLJuLsMe/nzUHL0Yunu3x6nNgLdAJREOsPTy8Rz1w9TJNHvHhm33H2SSarbNevL09a5TtONErtmIe8lgO/GyvClBqNsQV601778142EalwU5lyc3xm3W0k4/V9V0+/Eo9jURkQPqnNZxG4FLnE0xpRn40xM1r0UJTGrwGn4Fti+u/7/Ceo67610m+A8W7EAt2nCNfPCtK7pRlZeRPRzUHCACFKsKyBefGM+WiPzuaZd8g5+x1tTbAkQrdNHxfOFDmvu0VnANEOPZPz1QGj0f8uk0PxFe04halpcRWjacejt28JpSNuwp4uJ/LQ2ng9RgvGiGLScFLWG4mXSaGAqTM3Fi4stJ76OEAjim1O44E2xFP4rhCtmGmIkL3SDX6/cvZQSIQapwFnEinAz/5+leSQaVYTkH/U9jQj2nPUuCfwqtYPYripsomcsEpeFSbbJBxrr/uCsfPTiuvBTaG7DrON+62MqJNGWA3d7EuUySYKPHGGaBH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199015)(53546011)(2906002)(6506007)(6486002)(6666004)(26005)(6512007)(478600001)(186003)(55236004)(31686004)(6916009)(36756003)(316002)(66946007)(66476007)(8676002)(2616005)(66556008)(41300700001)(4326008)(8936002)(83380400001)(38100700002)(54906003)(5660300002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blllVElIL2lpRHBLK0JPa0cvUVFvdjZsY1oyMkE0LzlOaHp5VjFCQVlUVndG?=
 =?utf-8?B?dFpLRVZiOUU2Z0hKMUUxTG51K0g2SkEzOEZ0L0hKZ1J4R1hjL0xNb24xMm5p?=
 =?utf-8?B?SUdldktzSFFPUU8wRWo2aXEwL0VEQ21lcXdndDZlR213L2FtSUQrRTkwWm9I?=
 =?utf-8?B?eWhHWiszMFFKS0FJcWVqVlRSVlo4WW5SczBtcFFkbkJTNWdWTWdpU3VKLzdn?=
 =?utf-8?B?dVhYZXN1UXU0bjExck9NTmJOSXRQWnNVV1ZJQmxkYkFWUXZtWUkxM3lGS0VU?=
 =?utf-8?B?VEN3eHRyN1lFalBEMUN5eWM5Wi9hdzNsL1l3M21HT0pma01UcjJZQVVJU3hu?=
 =?utf-8?B?cTBXbVBDYXdJYkkyc0pkR1ZiamRFa2dEUWdKNnExQ1BIYlJyQWxBZ281QVg4?=
 =?utf-8?B?Q3Jua3JicmdyemlzOEM4djZhV1NMK2NpZStjak1neGg3eXhUNklTQjhiYU5B?=
 =?utf-8?B?cjlKbFp2N3pCdVpyVWxIL3Q2a0ZvZkJmUEZyTDVVbXNWbjNKTlZ1a0RaOGlT?=
 =?utf-8?B?WDNKN2NUTml1N0V2d3hUSW9pTzBVOWs5ZUp6blQzbGRKRFRqTS9XL1FEOGlM?=
 =?utf-8?B?WDFETU1yTEtReS9samF6bjMxbE03MVk0dXRXZW9MazBKa0xSOEU3RU1CbVNS?=
 =?utf-8?B?NXVCMDJQVHZKTkNpRURHSlFTVjB4WjNvaE03UXZDR1ZhdDkraGN5L2M2UUJW?=
 =?utf-8?B?MHNqRkp3N1FPMkpzU2F6OGg4dnl2b1BXb1ZhdWhESEIrOWIrazVlN2phekcv?=
 =?utf-8?B?NnNqbFJtME93OEYzMGRqVnlnUE1jWEtKbWVtQUFjV3FjWmRyTXdFYi9HVlpx?=
 =?utf-8?B?NDdoTXluUWZCS3hKOXFaL0s4QmhQckEwSXlaMjRaUC9jUFJhaGpPQnNnL2Vl?=
 =?utf-8?B?MXhzMElTcXpRUEViUjYrVi82bkZxUDJiZVFYY2twUWNCUU1ZTkI5Sjd4aG9v?=
 =?utf-8?B?MmtaUEFvSDI2SmhXbStVN1I5VWMrcmhMMkV2SjF1aFdNRTRwNnIxbTlUV1pq?=
 =?utf-8?B?bk9jcTZBLytNKzIySHptdGxHN2VzRGdlQWJQM29IcWRWd25LbG1DMCtIb3c0?=
 =?utf-8?B?d1ZCR2oxbG9VVzFKUEhrelEyaTc4VFhhc0l3QmJkckVqTittOGxIdlM3Q201?=
 =?utf-8?B?SU1pdnM4L0doSjEyTnhDUWtBN2k0WHpyc1RkK1pCT0c0UzlUUUlSYng5UTBJ?=
 =?utf-8?B?dFk1ekpKUVpkSm1IdU5KSmdYSkxBdG9tSDNxNlEwRmlhbDVOSVRuQjZRYVU2?=
 =?utf-8?B?ZUhmMklXK3FpU2Y5ZXZod3htM0Z0SENZc3JCOWJ0Y2xMVW55M1R6bFdZWm1z?=
 =?utf-8?B?b2ZJTWUxNHo3NkY5UlIxL3k2c3d1QWtVU01lY3ViSTRDRjdGdldXLytrbDlx?=
 =?utf-8?B?MHNQMFZHczFWcFZaMTEyWXFxZEZhUEEwZTArU3pUZzV6R2tOZGlPeklSbitw?=
 =?utf-8?B?Y2ZpMExtTXhIR3doTm1wd0NzV1A0QU9INnM3enRBT1dBSXBxNysvNmtsa250?=
 =?utf-8?B?M3ErbGpvNzBZa3p0T09PdHNtUEFXM0xlUjBPOWhqdFFaZkFRT3ZuMUxkYVVm?=
 =?utf-8?B?MC9VOE8xZG1pU0lPZnhVTmM1Z0xpRHVIb2l4cGJMWnpTOFBIdEg1OG52Wm1h?=
 =?utf-8?B?bXpWcHNRb01BSXUwenVpWU9hUmpvQ2p2SVdyZFN6WWczUGxJTjY5a3YzQnNt?=
 =?utf-8?B?WkJ2bEVWOGVXVENmaHI1ZXQvWmRmdGtXbEl0UitUOTFjNXZvVmdKMWNQZjZD?=
 =?utf-8?B?Z0lwQ3FzajRQcm16bVRFRFFOWnprNXEwRzAwRGFueG5Lcm10SVRyL0NBRDJo?=
 =?utf-8?B?SURvSldCYmpZREVQOE5rMU5QNUVab2hsdEhMTjUvU1JGQXorU3VPTTcxQVZE?=
 =?utf-8?B?NGt4WTViWXJEV2VlUzVXRi9jY1pjbVpWcEFoNnlYc3g4OThvRWUvQms2ZXJQ?=
 =?utf-8?B?VFlPZFMrSEZVUEowazhaeG1UaEJGQjNhYmY5KzQ3NTFpZkNuTUZKa2hSSjFt?=
 =?utf-8?B?dkJGR2NpN3QvTEtHdjAvb0RTMHJ2VVdMbXZKY2lSajNRb2hqTFJRcUNMUHF6?=
 =?utf-8?B?KytkNG9NeWV5bFpWalZpRWhacitVZmhiTUdDVk44aXo5K21qTm9pbU9Jb3Vy?=
 =?utf-8?Q?hFtB6G+M/00+TAJFcrRN+77xR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a126cb-d6fb-425d-a56f-08daf8e34b4a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 23:33:53.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spoFi1bm+UHEOIqCigiiIk74DEKb7Yo+zr8GQ1EYemzhL1s3lM7BYunxMSL8DIceX+OJxJtHCgvucj3oejeLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8513
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/01/2023 12:02, Heikki Krogerus wrote:
> On Mon, Jan 16, 2023 at 03:50:43PM +0000, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> ccgx is refer to the cypress cypd4226 typec controller.
>> Replace ccgx to well-known regex "cypress".
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> V2 -> V4: nothing has changed
>> V1 -> V2: new change added for adding cypress,firmware-build
>>
>>   drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> index 4bc31ed8e5bc..d6114fb8d5a9 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> @@ -1357,7 +1357,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>>   	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>>   
>>   	/* Only fail FW flashing when FW build information is not provided */
>> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
>> +	status = device_property_read_u16(dev, "cypress,firmware-build",
>>   					  &uc->fw_build);
> 
> You need to first add that property to
> drivers/i2c/busses/i2c-nvidia-gpu.c.


Looking at this some more, I wonder if we need to keep 
'ccgx,firmware-build' as a fallback for AMD? It is not clear to me if 
they implement this property or not. Let me know what you think. I will 
still update the i2c-nvidia-gpu driver. 	

Thanks
Jon

-- 
nvpublic
