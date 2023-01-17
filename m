Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53878C54E76
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 17:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbjAQRXS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 12:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235039AbjAQRWY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 12:22:24 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596F249974;
        Tue, 17 Jan 2023 09:21:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYqVwdoMKr1nB7LKxEvxtLcC+jtwczXggdfuZfSm3qcEBZI5LfsI1BNB24fJQXfMVK+n25Pt9OUWKp3pQs89FGU1zk6kbLO7+Gdfi+HgA2ulEbnWjKvDVNJR5KsosJNxyd1i4KyA5kZadooWn8pW1Ri1MP3sE9rBXOP0G5XQjESHcpcFMYk+UDLv8HAIFiokElcrpknSh9crbOzdXX+dv4w2CLTyELXL7tGuiaoY78eTK4kW8XuHR/FFgJZSJ77RsMGs6S2ggdV2u49YiLGwrzJPfv4gaWsD56/ipqkXw4XEnLS3zZtbq8vgapLbtzOC6vWCX1urBVf2T5XHLc6eiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fNokAHK01Oz6LxiodxB1rODMyJcz7Ora7zR2EoeHBI=;
 b=JA3yiW/+xqz+8yEAaLUtkTJkmZOpflnvZszziUPuYAkXJj4LghKST6x+sdVIpZK8rQzp5fD7567bCMvBiHCcHU5YcWiQLLSmlC6d6JWfoijuCAxldmk5BBk3IhNeGJzGirXIq2UYjf22iWCKtR1TQw1RkUQITr+51rdeuFGMecnpVhOWXnCDmbzjSdp37K7b9gtSoj+TNjii83rw9P/7FlarPX0FCbssoAlaHKfE5z24zRgE24EUY5fvpkcvGJSyIWPwY8c6XeY+sV0hbim/+7WzWF91JX59s+rcTmCshDDvfLkZVeTOaGHoPklxQu+rgEv10DkQ4SSRUn1WYS3tiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fNokAHK01Oz6LxiodxB1rODMyJcz7Ora7zR2EoeHBI=;
 b=ovIjcBqVpDLs0thUPUWRynZ/n9cVPhk8P4jKOtn3WWN6Mp9WftpkltV+jUWrmeUgJRJ62+ANP86bdJO25tqRL+iXpeJ60sWXH5Aeuemwvcx66bbOGHmkWq5TyIGbYjBoZDyDx5ea4qsaapasGzFNfPddPkw2N4XSgW0SEjMGLKJejIxLMQovH7+y8eFhbYt2/aYFSsF/NH1GoKkl4BwXTR8y6aPAORJ7/B9aIxDuyiDGmWFhGJFlUsyoMKN5IHnst0112Jc6QvGEdhMQOwL4l8PLeXv2pZ4FfUdQfEdNMWsbyccOWoinMXjACipIAjykHZOqDNiVdIoaTwPLY/xyKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:21:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 17:21:45 +0000
Message-ID: <e39eeff8-321b-06ca-24e7-ba4bbee52812@nvidia.com>
Date:   Tue, 17 Jan 2023 17:17:16 +0000
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
X-ClientProxiedBy: LO2P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2bd120-1bb9-4f3e-d233-08daf8af4f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNUIfd3x/zvql7Z7Yw2A/BMAWMuAzUGa80G2sT4aUAQnCyfFda2PI210ZO3bFhNEmkHfElE+EDZSYWWcR89GiKDktz7+CBSE9KhyF1nBlPnvDminlO1iQLP1n/gfKYlHc6BgnH9S1D7e1lvvlwj1t8pn82nOzYdCPzfBNZP84KnUazzlmHbXB+vc1Ben16Jf4SiNS/yFMXbSdtplZrVMAmNSbMSXSEfsukDeMub3muJnC6KvnAEx+XK80Ed6+1ns0/LrrN8CvLSG4dEu0rUsyeEotrNWONoqL3wiwJrQAYZczkOAs48rnykdafN4g7uHZkzARsP4BvsYTCw1rTxDZFb65V8G70eX66QMkRRvRQ5ltO8/AyyMJFiZeO2xK08UAz75uwx4mWMYuLtcg9T2QCul+OjHG2Md08WvD39MYab4el7/EvJw8Z7WQWJ8ETqKulBEvQd/AinEMtUp1L9fw3JWgAE47blOQspzpuSsiliKDP4Ch1WbXIy+2a1+5fXAX6fJGa4KeSgi3OYfzL4+gNHyIsY/iZENpdesF7U5XsVCwIP/glkEIO6FeS/CP6HYdYWsPxauJRGcY6jUhn+8BW2+HEw3XQnGKXUVblAJLg1JwAIumrKLO4vSaqbKG2g/K/zvczGxf5zQqIajMz63E74YvQ5kH4h6XoPz01zHPN5S8ZoLw7ECTQSDPPaJjTN0w/1FWhtyE/aOuNBgfUEtovr/r5+kvNHij0JRxK3gcYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(31686004)(66556008)(41300700001)(66476007)(2616005)(66946007)(186003)(4326008)(8676002)(55236004)(6512007)(6916009)(36756003)(53546011)(86362001)(26005)(5660300002)(83380400001)(38100700002)(8936002)(54906003)(31696002)(478600001)(316002)(6506007)(2906002)(6666004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdjRm93Q2pSdlAzeGw5OS9QcVR3NnMyY0c3R3RNYWdmNnRJOFYyR1NwYlgx?=
 =?utf-8?B?WWFXc1I4STIyK2lxN0doSFZMYzlNaUZjTGg1RCszNFlFenFHeXVvU096Q1Rz?=
 =?utf-8?B?YWFtQ3Q4WXl2dzFDRlRaSkhGZ0tYSlErcW9BR1BKc1hBREtpdW9aWWNPQXpa?=
 =?utf-8?B?K0VEWFh1QzdqTi9jZ2tQelJDZVZ5MU1seWVuSEhvZFcwOVUxekxhUzhsZXpY?=
 =?utf-8?B?K0JHK1VnUUFnci83ZFFxY3A5Q1lBakFjVVhFOWQrZTQyMjBPZ2dyVG9WdlJi?=
 =?utf-8?B?YU4yUHlZcE1HQ2NNcG00bEFPbDR3TVJtWG9xVlM1TW9tWkFsM3U5TlVibG5r?=
 =?utf-8?B?RWkrdDhaM0RVMFhoNEQ0TktCSG5SVzFLSEJhZU5rbFBkTVpqcXhXUEptWmNP?=
 =?utf-8?B?aTA4M1FIZFpkYW1vaUYzOUczR3orWkRITit4ZkFhMVl1MVlLSHo1R0dOeDlK?=
 =?utf-8?B?ZVlJVHF5UzJLNnExb1RNVVh2UWc5d0h5K3NHTGV3alRHVis2VmNQMTlRbkNV?=
 =?utf-8?B?ZzM2ajlrN2tWcTAwRmdsZC9sNkZMRnAwQWM4WkZuNWl1OEc2ZXRHOHk1elNJ?=
 =?utf-8?B?MUFiUEI1L3NIZXNIYnBTMHZ2b0doUVJoYlFXbVg3ZGtCZE11WjZNVmhhUURL?=
 =?utf-8?B?Tkd6VlM4RnZLNnBHczNZcE1qenZsakkvUUtDeHU4SmJtK0Z4Z3JmT1JBODAx?=
 =?utf-8?B?ZWhTWkdic0hxeFhrRlh2Znc0VFNJWnBHOWthN3RSQ2lMSnExdG16bU9zcUxI?=
 =?utf-8?B?aUpkUlZ5bjM3YUlXQVJ2QjlrK09mMC9WZnZva1ErVFAreWV6YnFxcWxYRFhv?=
 =?utf-8?B?TTlHcE5MNU1tZ3A5RGZseGhaMms0MEdsbGVNY2tTTEpYNDFsM1pvZFRhejI4?=
 =?utf-8?B?S0ZUVHFTS3UvcHFaWnVuL1dOMlNKeE91MnFLY2dHSHg3eStjWEl6R0o5VkVq?=
 =?utf-8?B?aHYrR09JbFUrckFTdVg1TWR4cjdVck1uRUhiWVlwQm9vUVBvNkdjUnZoVnVo?=
 =?utf-8?B?Q2V3NzF0eE1OaFdOLzVYaTF4bkNLekNSVm83TW1ZS21ObnpBbytjM0xtN2lo?=
 =?utf-8?B?Qk1pNTJEcWxtQUZDa25sYVV1aHpqY3ltZVlteEk5TitkcXBEZmVWc1YyY2Qr?=
 =?utf-8?B?VU94K0czQkV5bXpYTDdhNDVld25xcHhmUno0VEc0ZktRc0NzNVFGYVBiakJF?=
 =?utf-8?B?SUhLQm5KK3ZMTVVHV0xTZEtpNng4YnFIS3RrSHVrVzUzZFlOOTIwVW1lVEZL?=
 =?utf-8?B?U04rVzhwZXp0REZENytKdWhjSzE0Q0VvU0Qwa2Roc2hjS01YZkFaUVhRbitY?=
 =?utf-8?B?aTJ3c29zOEdYM0E1MGMyWVJYZWMyS0RmMVF5WTFFUFg0U09Qa2lwMVJxTExR?=
 =?utf-8?B?a2dZOVo1dEN3dWdmWTdLVWVoL0k3UENlYi9tTnM1c0VaV09mOGVYZ2wrQ3BG?=
 =?utf-8?B?ZnlhakNwRUtROW1IbjYzb1JJUVY4aWFVZWhQWVpUK1lmUnpUUFhIZUxoNFVT?=
 =?utf-8?B?elIrN25xTTBWdTFjZXoxeWxIUXQ0VTZaRXF2VTlwaUp4QUlYVHF0SUxQOHE4?=
 =?utf-8?B?eFJxY0VTNzlwT1NxSUtvUURKczJvQWJxb21Hc3lBWWovSytkUXFEcHhEb05x?=
 =?utf-8?B?Ujg2WXkxZ0swWFVVWGFtTWhaME9yRHUzcVEwY0l1MTBGK1ovKy9TYzZGbHdw?=
 =?utf-8?B?M1l1clJobWE4a0s5dkpTSzV0UG5rVXhFOWsvcmpDbSs2OWRoWm9wdDMwK2Ni?=
 =?utf-8?B?NHpQOFVCNmhWQ1ByekxPeXowMFBTY0M3bWxIYm9xZWltQjNWaG0xblRJY3Bl?=
 =?utf-8?B?RHZSalN3eXpnTW54WDMvQ0tUSVo4eEFrOHVaMy9zT3JTV2xibTd4czNkZ3Jl?=
 =?utf-8?B?ZXFVMCtVckJ3ZUpSMmxpdFk0QVZUWGlDWXBVak9TVWJLSFhzS21kN0JoN1RG?=
 =?utf-8?B?REpScjZXclVmWVdBa2RzSmtXZHRHMEtrNlN3WENiRlhrKzVqUDloeHVMSi9V?=
 =?utf-8?B?WlI2MTl3RExWaGtFanNLSkQxRU5ONzRvek5IbE5Fb24yYTBEbTNvOFkrT2xZ?=
 =?utf-8?B?TTI3dUV0TWZoTldRaVg5VlVlNy9Hc3hUamNTbWZmYlFhK1l3U3VHcVZCeFJQ?=
 =?utf-8?B?SVFydjF2Ujh1c0ovVlN3U0hIVUtDVHM0NjRTY1FUSmp5UjYxdTJ2bE1ZRWRt?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2bd120-1bb9-4f3e-d233-08daf8af4f09
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:21:45.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzzMrbv4wNQvxn3bp/j5jMhOw3KQFY1VgKFZ8x8KLP4FsoPOP2B2doEY+chlq06QzmLE2KuQEnqiP7Ev2xQAdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154
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

Yes indeed! I will fix this.

Jon

-- 
nvpublic
