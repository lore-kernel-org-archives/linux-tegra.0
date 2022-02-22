Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6409C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Feb 2022 12:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbiBVMzy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Feb 2022 07:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbiBVMzy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Feb 2022 07:55:54 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC85E128DEF;
        Tue, 22 Feb 2022 04:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLstoaT22ghzyP4H4r0ZyCDEYf8M4F4jvurYxxOQX9CNql4jKnZ38i60vc0rmI7v/e4z9JXRREqvwPv1/eLZr6uCHlDzC4wW5K4iuF/hc15aJWuHvzn2H1B5qm/5SmgGWJUkOnsCocWB+/IgHWOxCi66Ntpiu8jz3UYiu3ujbe/LkfCuZf+3Fda7F3RecTyabVnfXSBKmLz1eIoOj4/heDCk6etN/G3gslHoalEfdREzNhkK7ICfrr0HoibnvaI3vWlDm7fOyW42qlEtAEgUNycK7xe19EFAwVfD8xsNNMXm2QsvlXi5HAhXcx4MlPPSQfT4TZ1fhqZSEJ2Ot/o+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1CjRxs1ggFwWsmPygQrj4pYOgH2fbUG1oBR1VtxZ0E=;
 b=SmRTDVZ1PS9Z+xqu4Hx5K12JcWM0ZI4DSpX1xtKkWycF4rK2KQj+rkfxVT8yKWrg/vY5Uygu6BFswI054jh2G4F5E8vyqsrDu5FkH5QpoILyqDHeCJtGysXjFDLW8OPFIAKCxbiKVdljWHL2kmN75beU8GuXcliuyRFnSwPFYRht0HPkquokJA4zWmJbhzfPwZaOcGne41RIVcHAr1ydako3DDxUAsetEvGLv0TiTcdNnDAR7VlD49IqmTnNAuOxG21eDHPSVr8FoJNAFIRohrzIwJ0xjfkhwnv6PgwQIthYp4PdnoTIHqlJTASnAVjMyhW2RUOC6n8zioNFhybydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1CjRxs1ggFwWsmPygQrj4pYOgH2fbUG1oBR1VtxZ0E=;
 b=q4ZlNuzgvFHG90LeARCL9Hn5MsXPuQxyR/qJIekI6yTz2Cn025CYuuwHV4OrcT2MrGt2QxMDjRU+1ccQVBOwvzvJlj5Ki3tY3tw6RNQWX2ALZmHGAtoX7wgkKjYvPVCRYiQKIf5td/8hpXoaGJsVv9+PFAwRE8UIddMiS0zR/vfeFDi/oySBxgl84QfAB9zhMpcIFwyo/DH2svHUqNSIBemej/n+/QZlR2B7Ce91t9PMgS/vE/X+xsDvcdlGMmJlfRAw9gqUe2ZrTGJpqro7dvZQbBNluy9MvwO5hqC0FqBNTxoOfk5lH+R6Qt2h3vnv9So+4JwK1OViPkIVm+HRqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW2PR12MB2522.namprd12.prod.outlook.com (2603:10b6:907:f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Tue, 22 Feb 2022 12:55:25 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3df2:54be:277e:7ed7]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3df2:54be:277e:7ed7%5]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 12:55:25 +0000
Message-ID: <fd3aa188-56a5-064d-f63f-846b909dd2a3@nvidia.com>
Date:   Tue, 22 Feb 2022 12:55:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] hwmon: Handle failure to register sensor with thermal
 zone correctly
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220221182209.1795242-1-linux@roeck-us.net>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220221182209.1795242-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0063.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::40) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fb306c2-72f8-4ff2-0cbc-08d9f6029828
X-MS-TrafficTypeDiagnostic: MW2PR12MB2522:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2522667A09FC308204A6357BD93B9@MW2PR12MB2522.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUD2FVU7Ta0Iz6K3yCOIGA2WqME82OvRILts39ScNX7Lu6Qr9/CmKWhMjJddn4458evYfMn+6c8Ljvb8U87mRrJ89JZmbkSFdMZ8oaDlyLDRy40XYNbiCYyQDyhzm606DcQQf4uZPdMVvtMFX2rbWp7zKmBlMkUoMfVumKvUcP2iQPldfqFDQjEvGhi/TSEqCajK7orWKbugfxT31e5CfWSZJTYIBR51RN8IB6/yXxTtB5TialEi+/oNgV5uCslnb0lGl84afX1pWw9NHuZhjJHVW/Ke7UdmLJRvjYWS6sZ8pQAtSnMwzAntWLvqTWTYSF9DQvjYT9f+sH67r5Ayyjv3gVlnCRIkPGy14EPRMbG2Dw7RztWm5dj7B/N0UVS5jeK7vIw01kBH9VCWD/l2E57XXG1CDvidah+wN/fA5kM3hiwIuQIm6FKNaNlq3tEaKkP87OFkmP39ZuoLMriU3AY3+YJQIFshPaRk3iFC/S10gFVpNI78uOFBVoz/ZF84EznnaBccJOdAHVvkVSJlro/sBxpVCUXLmBBE6UfQyF05UaRUc86DU0wRXJsIHTcdSwWu0WozwbDRNoQntwa9jKCi713C1xccIDHCqYF3An3W14/AJu8/WUMCENZXB40lJXGXsUucF4fWq+/QGFS2XSaXWNNGGuJfCbuR6lSgTDEYQF5PCpU5e3KldVAf3z9wWuJ35eogiRz7p0gRAHOj7wB6c2rtb6o4/6jHOoVeskg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66476007)(66556008)(2616005)(6486002)(26005)(186003)(316002)(66946007)(508600001)(6512007)(38100700002)(86362001)(31696002)(110136005)(54906003)(2906002)(83380400001)(8936002)(31686004)(53546011)(36756003)(6506007)(55236004)(6666004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXBHajZtM0hJR1pNL1RLbnliRFhjTVI5V20zTmNTZnliamdIZkg3NnFkV1Uv?=
 =?utf-8?B?dlhjYjBvcFlscnV6SXhSeTAreUczQnRITkpydTB5NEZMZmFhMW5OdXZBL25u?=
 =?utf-8?B?SXB6ZWZVN29FbldKbkpqRkc1cUlDb1pFZ2dyY0xFWHpOb2lvNmVRalZhYVFS?=
 =?utf-8?B?dkxPekJ0UmdEQ3cyOXVMcUhxUkJ0Znp3REE1U1d4NEZvNFBQU3pPVjIxOG1v?=
 =?utf-8?B?ZVphb0NOTHhjNHFvNHdaelNBVEY5ZW5WMURlYXpGak9jYkRwY0R0c2l2a3Fs?=
 =?utf-8?B?bU1FeDl2V3BtdjNxOS9pVjlETCs1b0U0RDZkdTUwWVU2RVRRakZVY3JUYzJW?=
 =?utf-8?B?TXc4azREN1RqaXhkUUxSWlhMWDRvek9MRENkNENVeC9NMW9XRG1JTjM5c1ll?=
 =?utf-8?B?ZDArMUJQa2pXbjZxa2JwaUQ4QmtLRFgvSTlPUk9OV1Nxd3dHeXZxVkdUWlFN?=
 =?utf-8?B?aWVPeCt0TzAyY1pmZ2oyMkZPQ3NTa2RyV1gwM2M2eWQrSGRvTUsxMkg2R0Ro?=
 =?utf-8?B?L09pelJxd1grTGtvN0JQZ1FkZS9oT011bHRiTEI1WFZpSnlnZm1QQWNXQVoy?=
 =?utf-8?B?ZFdGWXN5Qkx5YzFSTHd0WFh2Q0tkQWI1TTMzL1QzcG9RQ1o2azQ4UXpKMEhj?=
 =?utf-8?B?K3h5Rmd6dXo0T2dnQUMxbmlUc1ZMeGlyU3hMbGJNNWc5eWhHY3VBR09QNVVH?=
 =?utf-8?B?SFA5OVVZQ0hjZ2FYMEJXNVNlOFBLelFONk5MaE1pRGthVVBEbURpWjliajI1?=
 =?utf-8?B?NXJCNk00YlFBMGtxRStjOXhVdkY1OUZLNEVEUEFpYWwvMXErNmxnNHdXQzN0?=
 =?utf-8?B?V3ZaeGxrRlN2UStDUjhHTytCbVZsNHNhL05NRGtBK2ZlRGJnRktPTEZ2cDR2?=
 =?utf-8?B?ZHB4cFdRYjU5d1U5TDJmQTROZTdGTFNTYjgrdUZrV3hmS0EreUZkRzJUZTZz?=
 =?utf-8?B?N2MxNkY4SDBPT3JRLzNDR1lELzdXeUhtTUhIQi9pcy9YT294UUxZaGdlSk5E?=
 =?utf-8?B?OXkycjZnUGpNUjlmeTR4SmY3bS9CTDRVWllveWU5OEQybFVhZktQMkVwcGVO?=
 =?utf-8?B?ZjR6bzUvN3NKaEZZaHI1SmFvZ2FOTnpBS1V1bUZjOUdGWjZ0dHAxaTNERlN0?=
 =?utf-8?B?aElhUUlnbmFoc0ZUNGNuaWVyNmxOdFB1czZHSGlFTGZiOVNrbmdZbHVSL3V2?=
 =?utf-8?B?MHUzam9RQTVSZ1hIc1BBdUhYTjIyOGFQSWYxaVZKWGNNdEFxOXJVeG0wVzlT?=
 =?utf-8?B?M0FvU09LdlZGR2tEVDdTZ2dzNFRob1d2dE5xbHYvS2JnaUVtQlUzNmtkU3ow?=
 =?utf-8?B?MlN0NWZBNVRWNmw1Y0VEZDNOY3p6N1lhNEJYbi8wV1ZzU2tnMjhOYXdVdk5u?=
 =?utf-8?B?WWxWOHBxRWUrR0hpNTFuK0dFV3I3WWRSU2pVSzVIRmNDMmxLMFc0SlNsMEhY?=
 =?utf-8?B?Z3RNcURJNDIwNlg3a0k5M1Y3QU1ncUlIenMrRmM3by94N3g2b2FPSGpVY20x?=
 =?utf-8?B?MUZQbzI0UVpEOHNQTXhOcG1UTU9PZ3V5aXY0OVo0R1lDR2R6SHZ3RmFCVUxn?=
 =?utf-8?B?K3JCTmlhUU5qNzRrVzl0RnJoOE10RXl3KzhCS1RZTTJDWmNJdXRtcjRFS1oz?=
 =?utf-8?B?ZkE4anRLRW5PZE9kamNMdGFmUGE3Z1VXUXAraFB4czdoaVg0aFh6TXZsRHFB?=
 =?utf-8?B?YXliT2ZETjlzVktaM2dobEhadmw4VWhEWklXQndXWXY3VWMvTnpxekZUVE1L?=
 =?utf-8?B?NVV4d1BlcElnNGtkTzFTSGpiSkRtSUkvMWV4cnBBUWdBYnkveXozOWRWWGZw?=
 =?utf-8?B?akg4TFdBTjgwM1p4MSs0bS9XZHBnYS9Xckl5S2hjcjQ2UHRJYXpzTVluaStJ?=
 =?utf-8?B?RnNvVytENmNKWnNsMFhQeS9FWTN3K25TY1NwVXAwaWVXdmlRREhWTkR2OVEy?=
 =?utf-8?B?ZW1CWi8zc29NcEZoNDBnNmlNWHJ6SHJ3ZDR6YW1yTUxjZ3NEYk44cUNKRVI0?=
 =?utf-8?B?R3FlRHFrMUs3WmYxV2xxTGdtTzFtTjRGY0JpUlVDQ1NmVjVGTWZ4dVZsVkVT?=
 =?utf-8?B?dkFndzRVTEpjN1pxbG4zOHpIWnI0cEEySkNBcXE2YnhkUmt4c0FhcWNlSmxz?=
 =?utf-8?B?WDBmVldZb05WbnpTb0JxWFFXYmY1M2dmWGc3L2ZObjl6TjY2VWxDbHNwbWNs?=
 =?utf-8?Q?GgbwWV7f+cng2H374IK3NJw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb306c2-72f8-4ff2-0cbc-08d9f6029828
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 12:55:25.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyxNxF45aST4m2iWs9iG+rp8MeoLs2yMnEVHpmVeotBvGgVebtOlK2BOOQhlVL35edAmM42mT0UnAYUipcdVMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2522
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Guenter,

On 21/02/2022 18:22, Guenter Roeck wrote:
> If an attempt is made to a sensor with a thermal zone and it fails,
> the call to devm_thermal_zone_of_sensor_register() may return -ENODEV.
> This may result in crashes similar to the following.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000003cd
> ...
> Internal error: Oops: 96000021 [#1] PREEMPT SMP
> ...
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : mutex_lock+0x18/0x60
> lr : thermal_zone_device_update+0x40/0x2e0
> sp : ffff800014c4fc60
> x29: ffff800014c4fc60 x28: ffff365ee3f6e000 x27: ffffdde218426790
> x26: ffff365ee3f6e000 x25: 0000000000000000 x24: ffff365ee3f6e000
> x23: ffffdde218426870 x22: ffff365ee3f6e000 x21: 00000000000003cd
> x20: ffff365ee8bf3308 x19: ffffffffffffffed x18: 0000000000000000
> x17: ffffdde21842689c x16: ffffdde1cb7a0b7c x15: 0000000000000040
> x14: ffffdde21a4889a0 x13: 0000000000000228 x12: 0000000000000000
> x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> x8 : 0000000001120000 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : 0068000878e20f07 x4 : 0000000000000000 x3 : 00000000000003cd
> x2 : ffff365ee3f6e000 x1 : 0000000000000000 x0 : 00000000000003cd
> Call trace:
>   mutex_lock+0x18/0x60
>   hwmon_notify_event+0xfc/0x110
>   0xffffdde1cb7a0a90
>   0xffffdde1cb7a0b7c
>   irq_thread_fn+0x2c/0xa0
>   irq_thread+0x134/0x240
>   kthread+0x178/0x190
>   ret_from_fork+0x10/0x20
> Code: d503201f d503201f d2800001 aa0103e4 (c8e47c02)
> 
> Jon Hunter reports that the exact call sequence is:
> 
> hwmon_notify_event()
>    --> hwmon_thermal_notify()
>      --> thermal_zone_device_update()
>        --> update_temperature()
>          --> mutex_lock()
> 
> The hwmon core needs to handle all errors returned from calls
> to devm_thermal_zone_of_sensor_register(). If the call fails
> with -ENODEV, report that the sensor was not attached to a
> thermal zone  but continue to register the hwmon device.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Fixes: 1597b374af222 ("hwmon: Add notification support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Use dev_info instead of dev_warn, and change message to be
>      less alarming.
> 
>   drivers/hwmon/hwmon.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 3501a3ead4ba..3ae961986fc3 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -214,12 +214,14 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
>   
>   	tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
>   						   &hwmon_thermal_ops);
> -	/*
> -	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
> -	 * so ignore that error but forward any other error.
> -	 */
> -	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
> -		return PTR_ERR(tzd);
> +	if (IS_ERR(tzd)) {
> +		if (PTR_ERR(tzd) != -ENODEV)
> +			return PTR_ERR(tzd);
> +		dev_info(dev, "temp%d_input not attached to any thermal zone\n",
> +			 index + 1);
> +		devm_kfree(dev, tdata);
> +		return 0;
> +	}
>   
>   	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
>   	if (err)


Thanks for the quick fix. Works for me!

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
