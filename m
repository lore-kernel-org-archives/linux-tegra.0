Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD2CC05027
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 20:23:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjBAUXg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 15:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBAUXf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 15:23:35 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683E212F2F;
        Wed,  1 Feb 2023 12:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cERND72SyInBZTXLlmO/0Jertl8VNiYV+vAoVh9v3MAFZd5iNDQ/9FZhGu/01x0xUfWZnwtpoHbNMAQB6kJ4hzrfKKldRYvojdVk8UOfh1mHqeaU7gaZmjDZToWat3Fa7G047uLrAD4LB2FLgbj9kUGaVSUWzxMiOE4byROjtsK1qJF5z+pKmJCE1d6/CjmG79XIqBo3XoQKEejKw04uYiaRcK4td7n7fa2NSom/3zTa3+ph2rFzWNkrGG+o8xG/9seQ3OZ3GSnAhCjS8kK2lHm3i61UnXazYbTC3Kozh07j8G1UBYrq9FfBZQXni+sl/Axm3aJ36AFRmuUfALRJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78/DQqKb8TcIC7D2/uA7qry4F9i9DfDZdbWgKGEqC/M=;
 b=anw7t4sUdVIHipY22xgj4WoGV9JKJmQS9eJXnhnuNrUeaCGEX+rpdwweeLO8zbQBOjiC49F5uAWZPN6pwyLR8w5wpt1WCbEa56uN6hb116uu/AkARv+XtzB/qb5ufk6SLkb9xQ4/18aJTpU0iI1/xFj/ErJdGksIEkgP6gqxfTTfexBspdgxXy2jo4XVZb1ZmR0m77iEywPvfho++ofuiRy/mTQ2EEA/SA5TAKDbw2MhdohfECmy79hyKBY959gPzqy2Azmut9YUppOGFmn1Fbwbx2Q0x35wyoqW82MFJ+ngKj8FFHCAh/m/DxdEHflHRN811IzryLR1gqegwJzLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78/DQqKb8TcIC7D2/uA7qry4F9i9DfDZdbWgKGEqC/M=;
 b=UHsZWowQ/1IR+/qtxQxSn5FTGEQbObR9aMAdf058KkxjPtVQMqrHbFgyEuNbwkCGXQ6ShKaiwd22MXAyDlOjeXx+xDTiuxIJBytlTqkmnNhNbsg0MKInmq4yBJGi15pwvk0uOjgDPINYVGyaLsuGMQDWoej4785cV6vW/unJyHCTC+enjAhtmmg5mgxVtfQEup90Pv0CBp53SY474bN6LbgQYN6hFFChmuUq0EppxhMyRRMqrhX1vYZpH+jzxeCUMCxbHC0eVytu0pcoa/YXpg5RK6CM/DFw9H47t1ZfuVAYmeNKb/brfCKi4RIMEP6US37IZSOfb1iagtfKN6+d9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB6399.namprd12.prod.outlook.com (2603:10b6:8:b7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.24; Wed, 1 Feb 2023 20:23:31 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 20:23:30 +0000
Message-ID: <00059af2-dc99-0771-4d30-b7dd94ce1150@nvidia.com>
Date:   Wed, 1 Feb 2023 20:23:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V10 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-5-jonathanh@nvidia.com>
 <936488c6-f86d-3552-1a35-1039eca55c00@nvidia.com>
In-Reply-To: <936488c6-f86d-3552-1a35-1039eca55c00@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::25) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: f5841ca2-3d9e-4e23-d591-08db04922f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t1IQT/mvFaB5Ypb6AFVv4zD8J+yYGY3LjIb8HOBtTjCp3G0ScxQa9ARc5qkNAFKTkkzpfVGr9moM8TNO58PwhRt9zhhE5uSjkcdwR7BwxQMknPQqaiymjkRE/Aii9SQlFISSMnk/DLUXn+dePpoKyeolwbUWG5rLybx1WiYl0+fB7lUlQMwehqYiUDeDFlUkvWPzYuLbxqiWOvM8g3TJa50iBTKtkiq3oPupeCtTrlmTLYwJdXPJHx7HTEgOUIYTpoOKv5rCeeH/kIbyRtx6oS/1aimQUM70BxtvKa49hQF6pxgDqdrlK60JT1RVXUZ/G1hRVvNx9A3tLPB9dd4p2yLaW2fp8NjPTK/mjlDyThny2SxirPoEAdgWFeDnkEsrELzHMqlZw4uWOJSd9UWM0LhFyUfEm1BtFdc4S+7kn5zT6CG5rH8pVeiBAWwhN3mv9nSMn7xHQaMFICJJz0gFpc5ht5vD4qiwFYgOvN8IkfIZoa0viJyimPfgbYRjX2fxxriggZthEw1jvQK0jmBRy+d7zrFK+0TOUg0WLvlCGOtWeTC9PWEa6N9mUteWTQVt8RxRQWmLaoLL5yzdhAxyp0BofC7VGO5Qd3cXu+7o9p1mMIgdiDHSQij6wXNDNCFTxPrp1KGcgGtkADGPb0goByLf1i+wrOCop0uSbMF8eSCrEAQEJIbkFff5ZYu8VpcM3y6ycEdsC9xCV4KisPJ8mi4/gXeT+EwU9XR6tqGs2AU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199018)(6512007)(186003)(6486002)(107886003)(41300700001)(478600001)(36756003)(38100700002)(6636002)(86362001)(110136005)(31696002)(316002)(66946007)(66556008)(8676002)(4326008)(66476007)(6666004)(8936002)(53546011)(6506007)(5660300002)(83380400001)(31686004)(2616005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBrNWJjdlBsd1c1UFl3VjlqNGpwNXA4UlREMUY4ZXc1K0hUYVc1OGY5L1gz?=
 =?utf-8?B?OTRkbWdMNmZiQ1dtTDdjT1dXbE96cEVveDZZUkJpdXJ5RXQ3OHU2UXYvUzYv?=
 =?utf-8?B?dXVsVTVNZERWT1VuRDJUa1d2YmllN1JhNFIvdy9iNmg0MHZUSUZpa21hZmFy?=
 =?utf-8?B?M0dCQ1MxeVk5UzJwSVdDcnVnUjdJbVdDQ1A5cUkvWUpzSmR6a2J5MDJLNnYz?=
 =?utf-8?B?d3gwYStDUkhXVmpjcXNuUDNFalJERTlDc1JTM3BLM2p1c1h3TEt1cW5oS1Zw?=
 =?utf-8?B?eXJPNDNsRHgrM3gxMGRDNjBhRWh2c0dKeUMzK25GcjMvazlWN2hjbFJLclE0?=
 =?utf-8?B?bzFHdmVUVEhJUGhLWHBkNmRDVG1WM2VyMkhaNTZoeFRTYXMycG9HNHpSOUov?=
 =?utf-8?B?ZGk1QURHL0htR01yVkhhUktwRXpYY0s5Q2lqRWh1L1Vjc0VQN0JoLzYvdmFI?=
 =?utf-8?B?c3NybW55YitFUTZ3Uk9MWTc5UUNwYXIwVUliZnpLbnl2U3lBdU9zVVpBL25m?=
 =?utf-8?B?OUVvTVM1bG9VTkpPUkwydTdSUmhESU5UM285aCtXRUxwNWhMeWUrWlorM1BC?=
 =?utf-8?B?enZEaDh1Tkh1Sk1MdVFxbFBqWGRIMHNXU3JaWEllWGNuSGRmdEJuTTNVS0Vt?=
 =?utf-8?B?cmNYSkhvR2FJTkk3ekd5SWNVbWZoS0JVaWMrZTdaWjdYWDVnZ1V1cStKeUgx?=
 =?utf-8?B?R3NNMlZXZGVDUGx6KzVnUDhQV05CUm5ZckdZRTIrWUtaK3NCdU5wQmdiV3hX?=
 =?utf-8?B?Y0puODlSVEcyUlE0TGFGUUJDMzN3RWc0WVZFVGw4TXkyb0k0ekQ2d01wbW15?=
 =?utf-8?B?Q2pwQmk4NEk0S0w1YnlKSlNmQ216U29ZUlRRaVYvTEtDV3RKaHpKNDE0ekkx?=
 =?utf-8?B?aHlyWlQ0Z28vZG9hOVlQdW1BZXdUcFc1dUhqOG5YeDlTRXZGazgzdDlVNEFU?=
 =?utf-8?B?c2t6TlF0c0tPTklHS2lxWkx4dGo1VTVMYU5NSkJPOFFhTGh4YlM3VG1RdWF6?=
 =?utf-8?B?OEtJcVM5eWpVWTcxREp1SUhEa2Uvd2Q4ZnZ1OGRyb0Zta1pmdW5Qc1VxNTlv?=
 =?utf-8?B?K1ljMkNxTW9xVHFNOHJQdHJjNFZSQ25zUmJzVzBZRGRsKzJwZ0tQRnN0VWc0?=
 =?utf-8?B?R0xhSkdlMjd3WldFSzhiMlZ2WjA4SnlkY1cvT2xmM3pQTEZXU3g5b2l1Ynpo?=
 =?utf-8?B?SWdhVnF3ZkEyWDdXbmN6blR1OXVQVDU5bE5Oay9iMjFYS1llV3lwV3YydGgz?=
 =?utf-8?B?V2JHN0RCUVdrdEJRZEE0c0x4UUtubEc3R05rQ2NQenhPRkZSTDl6UWplV2la?=
 =?utf-8?B?MzR0V2ZJTnJ6Um0wMWprWmI4M3NGQ0psTk00dFhWeDIvai85ZDNxdjFXakZn?=
 =?utf-8?B?eHRkTEk5SU4wMWJ5akV6MmdDcUZ2NGYvN2huZENuRkFiNFNmV1ZPY05oTTdP?=
 =?utf-8?B?ZEUzUHRmMGYveFNlREhCM01FT3pvMEsvVERxMk0xelVGVkdRQndyU3htWG93?=
 =?utf-8?B?T3E2UkNYblhhRkNkbG1WcCt2eUpobDM3cXhkRy9Yd2RWNmh6cjNVUHNxcW13?=
 =?utf-8?B?YTBuRzl3VW9FdDJybXo0WlFwZnlaNTBsM25yRjdQMHU5Z1BrT3l0SUFVWUwr?=
 =?utf-8?B?a3VkS01lbFhQZDg3a01UZmxyZmk2TFpDVnFYZzJQTGZPTVRYUHFWLy83WUpt?=
 =?utf-8?B?Tm5Wd1JwVHcrMmxQQjlLRUlhYmhhWnY1a1FJSU1zampqbVpjZlpaZUFlcENy?=
 =?utf-8?B?RWhVa01uR3F2cDBiNURqN284T0hZMzVteGJ1N3lTU0Qxbm9CM2tEejZzWlNo?=
 =?utf-8?B?Ry9TMlRBK3FOV3NKUDIrRi9DRU41dkVPaXg1V0REUWI2M1FWZFVIeitXRjZv?=
 =?utf-8?B?aWZreHpONjMybURsMzc4V2kwcVowbkl0QVNxTUZ3SjQ0aFdPWDVGRWxWdjZ1?=
 =?utf-8?B?dDV6VE9vOHdsMHhGK2ZWMHlDUFAyMmEzci9zTlQyM01PSWl3SzZVNXpyVkVB?=
 =?utf-8?B?UTBaeGlBckgzM3E2UndPZXZnTEJXaU00NHR3WDJDZVB4aDdFL3dIa2lSVXph?=
 =?utf-8?B?OXU3Y2NUR1RnVi9HZVdQbG5Sai84dk5jNUM3YXRXajdmRXNWSStFdDdHejhj?=
 =?utf-8?B?VVhvUW5Lakp0c0s2N2ZyT3k3U2RGeEtORzBjbEo3N3VxTTNvK2VlQTllaFVm?=
 =?utf-8?B?bXozZ3VDUkNZODRyTDlvSXJ3VFpkUjBFVUI5TXJjS1MwMVQvK0dqZkVzN1Vu?=
 =?utf-8?B?U3pTeGtodkNiQ0lmR1ByRVY2bjJnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5841ca2-3d9e-4e23-d591-08db04922f28
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 20:23:30.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXnAJC5roTrTIKxL8rgz/v1pjYJzMXsg4uXGtv5XVDFwlk2tbnPNlH2JUA3AztlN6mIibn9/491l6zARuOipQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Adding Ajay as well.

On 01/02/2023 16:01, Jon Hunter wrote:
> Adding Wolfram.
> 
> On 31/01/2023 17:57, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> Now the Cypress CCG driver has been updated to support the
>> 'firmware-name' property to align with device-tree, remove the
>> 'ccgx,firmware-build' property as this is no longer needed.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> V6 -> V10: no changes
>> V5: Added this patch from V3
>>
>>   drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c 
>> b/drivers/i2c/busses/i2c-nvidia-gpu.c
>> index 6d81ea530a83..a8b99e7f6262 100644
>> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
>> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
>> @@ -259,8 +259,7 @@ static const struct pci_device_id gpu_i2c_ids[] = {
>>   MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>>   static const struct property_entry ccgx_props[] = {
>> -    /* Use FW built for NVIDIA (nv) only */
>> -    PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
>> +    /* Use FW built for NVIDIA GPU only */
>>       PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
>>       { }
>>   };
> 

-- 
nvpublic
