Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11A8C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 15:20:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBF3B619A2
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 15:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhCVPTh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Mar 2021 11:19:37 -0400
Received: from mail-mw2nam12on2040.outbound.protection.outlook.com ([40.107.244.40]:15296
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231749AbhCVPTT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Mar 2021 11:19:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJEqfb6rZ+0LcTuWZR9W8B9oyJJRUmBodDkJcY7WbLsq5beAj7gwyiyJ+ljV2BzhccAXx2V6V3xlwYFKXS3euoYJK8jc9hw6WNr6jS2BsJsIYfIRuEI6TSoDvNG64hhKxIb1XAslr7S7ITTTV+0lYb1AZNwMceoTN1r246t7d+H2Qdhx+FOHxjMs7AoPp+ejFI8NyR1CmSDobsv9KHonSGfQ4nLljvOVRpvWCRjIeuimuOrb7ih3Ckxn1+MP9Lu1Rj2uWmKmsZmzlMob6tcsMBClccRL/mT73zrcH8qxbSaSxlM6TUg//kqy2cHBS0ychfEs87tYEuK8pPB5ZPyk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0EYigv1SpaheMzV7P/hjAhH42S1fyROgLk4fTlfH/4=;
 b=dTt4AfFKWJnmg33FveRORT7iWOXCA5e9/ywdo24r2unow8LdFxHhXEasBPgQxh7UGy2y47b2hz3onyRXXvB/W1nZRnyf4oOZV2RJopS8z7pTqKg6XLh6qSO45biXfrO7NfWESLA76Hf+a92+kkJ37iBEo7OmGvMdJ3Ay/BKagKW3LdS7TyOjTBeVqghtcUhYQyAY54XWig/XzDDZHHlLtpoe0b83ZnYq9u8ykEc5NtqZIZhhW0tIzGJWxMwj1LC7wGjuCOjlVvFz8W3hDkuqF48yH1osr9CsgQtm1SpzqneNEd+nRa6BfayjkFrM9MJ2M3hLEg9sgxd1ZAIdLxANuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ie smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0EYigv1SpaheMzV7P/hjAhH42S1fyROgLk4fTlfH/4=;
 b=JYrSGClYUJZbEywKUiagFS0xNtadv+da2i/ithvRyd1h0dMngcdJD9G20L33j5pUP5WfdPa0WTNXSZ8Y7VNIxVhgenSg5tcAfdA0aUhsO3xQavOqZutNgfcf1Nss8mlARzck0SN+ZLipaApzIHLiB50xEfuUwr7AtzzyCPEijho+EYfoBCcHtnvcBccjCDxACsR9Wp9jQ9vlkDTLPepKiLAjaLq8IJk6Xsc4yrrrWYPtc+N3Slfkl/bHCP7L5wQmOEpJxOlsZrQHo//VRxjy9UWVgCW2WntttD+AOHrJWQtbylZ15f0RHEzFeLHvmmYtvSp23ThMQuHpawaQbRJ9Jg==
Received: from MWHPR17CA0077.namprd17.prod.outlook.com (2603:10b6:300:c2::15)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 15:19:18 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::10) by MWHPR17CA0077.outlook.office365.com
 (2603:10b6:300:c2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 15:19:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:19:17 +0000
Received: from [10.21.26.179] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 15:19:15 +0000
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <linux-tegra@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <talho@nvidia.com>, <bhuntsman@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
From:   Mikko Perttunen <mperttunen@nvidia.com>
Message-ID: <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
Date:   Mon, 22 Mar 2021 17:19:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bf196cb-a8c7-4ee2-f55c-08d8ed45dc56
X-MS-TrafficTypeDiagnostic: BY5PR12MB4308:
X-Microsoft-Antispam-PRVS: <BY5PR12MB430818D0A406FC7C88F21B28B2659@BY5PR12MB4308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELQc6FeDMWRQJETzkPZNZuPsv2eIxhaG56M3O+xqvxkbUX2blfFKSA9vSJTM9heln/ivCU70cooF5lxsyaXR1RqoTb2j7NUfatU1vzRhT56KxeYuqhLdMN48uBdzleyVgisNd0c9nXLThHmbNj2B/FLVMnGLx1NcGsTypvDVIHfl+qOc3jS04HFOanl2TQQokX+sCbigYouUFYhu8rszoCFW8vxkxsx9xEVR/M6jZMA/7dCoJhAN/1Jbs91lcVvaVvwqxwLqmYd5Ud+9N9jbh2j1ePSrN/qrRpUYAbUCVySC1gCfvavohuzvWmLfZdOC+Yi6/dNJOxreF7D9/UkQ2ENJ8/SX4sggQXWfT77Dgua+VLjsaRkwv+SJA7tg5cplNOWFc4YWzi0LdeP2pDKUC+CUxG/5v9GPGV/JoP+OsBBdY3Gj26NTekcvN+wr4eBQpyLpOI2a/2SfpQRAreTFNVvseXuRy6w5M8aPrBOpYUXaa60T1QQYQ+tcbudrN9ntwaGbIr+AE6IlpycK/2SxaR1gzrmlTlFINyD9v3O+uh4ySytHY6qiG8xYjDB1TCPhNrFCjIQq8yfqd/+93SSPZNWN5xC11X7IaZtPFrfV75ggwXVWXlRS+YFmgXqvXMj/UFJgQOaxqsWU5ogGguQA/CAzxVpGzUJ2r9Y9ISgq2hps8AKA1y6a9o5HM3HcHljCt3adnmHLPC4C3ZfLL8vPVbbylNYniH1G/AIvD5oPRiU=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(36840700001)(46966006)(70586007)(2616005)(316002)(110136005)(7636003)(4326008)(8676002)(83380400001)(54906003)(16576012)(478600001)(31686004)(70206006)(36756003)(107886003)(8936002)(31696002)(6666004)(186003)(426003)(82740400003)(16526019)(356005)(2906002)(26005)(36860700001)(5660300002)(47076005)(336012)(36906005)(82310400003)(86362001)(32563001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 15:19:17.7138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf196cb-a8c7-4ee2-f55c-08d8ed45dc56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22.3.2021 16.48, Dmitry Osipenko wrote:
> 22.03.2021 17:46, Thierry Reding пишет:
>> On Mon, Jan 11, 2021 at 02:59:59PM +0200, Mikko Perttunen wrote:
>>> To avoid false lockdep warnings, give each client lock a different
>>> lock class, passed from the initialization site by macro.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>> ---
>>>   drivers/gpu/host1x/bus.c | 7 ++++---
>>>   include/linux/host1x.h   | 9 ++++++++-
>>>   2 files changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
>>> index 347fb962b6c9..8fc79e9cb652 100644
>>> --- a/drivers/gpu/host1x/bus.c
>>> +++ b/drivers/gpu/host1x/bus.c
>>> @@ -715,13 +715,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
>>>    * device and call host1x_device_init(), which will in turn call each client's
>>>    * &host1x_client_ops.init implementation.
>>>    */
>>> -int host1x_client_register(struct host1x_client *client)
>>> +int __host1x_client_register(struct host1x_client *client,
>>> +			   struct lock_class_key *key)
>>
>> I've seen the kbuild robot warn about this because the kerneldoc is now
>> out of date.
>>
>>>   {
>>>   	struct host1x *host1x;
>>>   	int err;
>>>   
>>>   	INIT_LIST_HEAD(&client->list);
>>> -	mutex_init(&client->lock);
>>> +	__mutex_init(&client->lock, "host1x client lock", key);
>>
>> Should we maybe attempt to make this unique? Could we use something like
>> dev_name(client->dev) for this?
> 
> I'm curious who the lockdep warning could be triggered at all, I don't
> recall ever seeing it. Mikko, could you please clarify how to reproduce
> the warning?
> 

This is pretty difficult to read but I guess it's some interaction 
related to the delayed initialization of host1x clients? In any case, I 
consistently get it at boot (though it may be triggered by vic probe 
instead of nvdec).

I'll fix the kbuild robot warnings and see if I can add a 
client-specific lock name for v6.

Mikko

[   38.128257] WARNING: possible recursive locking detected
[   38.133567] 5.11.0-rc2-next-20210108+ #102 Tainted: G S
[   38.140089] --------------------------------------------
[   38.145395] systemd-udevd/239 is trying to acquire lock:
[   38.150703] ffff0000997aa218 (&client->lock){+.+.}-{3:3}, at: 
host1x_client_resume+0x30/0x100 [host1x]
[   38.160142]
[   38.160142] but task is already holding lock:
[   38.165968] ffff000080c3b148 (&client->lock){+.+.}-{3:3}, at: 
host1x_client_resume+0x30/0x100 [host1x]
[   38.175398]
[   38.175398] other info that might help us debug this:
[   38.181918]  Possible unsafe locking scenario:
[   38.181918]
[   38.187830]        CPU0
[   38.190275]        ----
[   38.192719]   lock(&client->lock);
[   38.196129]   lock(&client->lock);
[   38.199537]
[   38.199537]  *** DEADLOCK ***
[   38.199537]
[   38.205449]  May be due to missing lock nesting notation
[   38.205449]
[   38.212228] 6 locks held by systemd-udevd/239:
[   38.216669]  #0: ffff00009261c188 (&dev->mutex){....}-{3:3}, at: 
device_driver_attach+0x60/0x130
[   38.225487]  #1: ffff800009a17168 (devices_lock){+.+.}-{3:3}, at: 
host1x_client_register+0x7c/0x220 [host1x]
[   38.235441]  #2: ffff000083f94bb8 (&host->devices_lock){+.+.}-{3:3}, 
at: host1x_client_register+0xac/0x220 [host1x]
[   38.245996]  #3: ffff0000a2267190 (&dev->mutex){....}-{3:3}, at: 
__device_attach+0x8c/0x230
[   38.254372]  #4: ffff000092c880f0 (&wgrp->lock){+.+.}-{3:3}, at: 
tegra_display_hub_prepare+0xd8/0x170 [tegra_drm]
[   38.264788]  #5: ffff000080c3b148 (&client->lock){+.+.}-{3:3}, at: 
host1x_client_resume+0x30/0x100 [host1x]
[   38.274658]
[   38.274658] stack backtrace:
[   38.279012] CPU: 0 PID: 239 Comm: systemd-udevd Tainted: G S 
       5.11.0-rc2-next-20210108+ #102
[   38.288660] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[   38.294577] Call trace:
[   38.297022]  dump_backtrace+0x0/0x2c0
[   38.300695]  show_stack+0x18/0x6c
[   38.304013]  dump_stack+0x120/0x19c
[   38.307507]  __lock_acquire+0x171c/0x2c34
[   38.311521]  lock_acquire.part.0+0x230/0x490
[   38.315793]  lock_acquire+0x70/0x90
[   38.319285]  __mutex_lock+0x11c/0x6d0
[   38.322952]  mutex_lock_nested+0x58/0x90
[   38.326877]  host1x_client_resume+0x30/0x100 [host1x]
[   38.332047]  host1x_client_resume+0x44/0x100 [host1x]
[   38.337200]  tegra_display_hub_prepare+0xf8/0x170 [tegra_drm]
[   38.343084]  host1x_drm_probe+0x1fc/0x4f0 [tegra_drm]
[   38.348256]  host1x_device_probe+0x3c/0x50 [host1x]
[   38.353240]  really_probe+0x148/0x6f0
[   38.356906]  driver_probe_device+0x78/0xe4
[   38.361005]  __device_attach_driver+0x10c/0x170
[   38.365536]  bus_for_each_drv+0xf0/0x160
[   38.369461]  __device_attach+0x168/0x230
[   38.373385]  device_initial_probe+0x14/0x20
[   38.377571]  bus_probe_device+0xec/0x100
[   38.381494]  device_add+0x580/0xbcc
[   38.384985]  host1x_subdev_register+0x178/0x1cc [host1x]
[   38.390397]  host1x_client_register+0x138/0x220 [host1x]
[   38.395808]  nvdec_probe+0x240/0x3ec [tegra_drm]
[   38.400549]  platform_probe+0x8c/0x110
[   38.404302]  really_probe+0x148/0x6f0
[   38.407966]  driver_probe_device+0x78/0xe4
[   38.412065]  device_driver_attach+0x120/0x130
[   38.416423]  __driver_attach+0xb4/0x190
[   38.420261]  bus_for_each_dev+0xe8/0x160
[   38.424185]  driver_attach+0x34/0x44
[   38.427761]  bus_add_driver+0x1a4/0x2b0
[   38.431598]  driver_register+0xe0/0x210
[   38.435437]  __platform_register_drivers+0x6c/0x104
[   38.440318]  host1x_drm_init+0x54/0x1000 [tegra_drm]
[   38.445405]  do_one_initcall+0xec/0x5e0
[   38.449244]  do_init_module+0xe0/0x384
[   38.453000]  load_module+0x32d8/0x3c60
