Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A45DC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3486561A13
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCZOzR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhCZOzA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:55:00 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECC6C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qlCr9DYUNxaSIyqRMEavX/tZoTiLlQL37Afi2jZuhpM=; b=dtsuFBitQHCZQASQF8I/2YIk7A
        UkXykv2C5D6WIB7OqGBsdXIed5Rn6w8rJPJyINiSylGHUJxFIBK7+D5hqepte3rGXtyXTKjnFEid9
        Ht3UKJD7l/1fTe06d2syZuTjKoGFSmjhIKSHEJHUUppc9MvP8hWKD9ZkwqWs/yOZpGN2KBqMBVu6F
        T5H/aGfAH7zNtaor73W4eij9u3iMzO0E2nFCsIO9pKmxiu6u6bkNOn0V6rM+2n9yiJ2r3uB6UPyyp
        lFQw9Zo1BpKPo51y3wnVErijk+vsZIFkA6Ci387c+bankE10vJWK+WGKWRgjkvhJrI4R1g92deOk+
        xKCxpCyg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lPnrT-0001Vd-93; Fri, 26 Mar 2021 16:54:55 +0200
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
Date:   Fri, 26 Mar 2021 16:54:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/22/21 5:19 PM, Mikko Perttunen wrote:
> On 22.3.2021 16.48, Dmitry Osipenko wrote:
>> 22.03.2021 17:46, Thierry Reding пишет:
>>> On Mon, Jan 11, 2021 at 02:59:59PM +0200, Mikko Perttunen wrote:
>>>> To avoid false lockdep warnings, give each client lock a different
>>>> lock class, passed from the initialization site by macro.
>>>>
>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>> ---
>>>>   drivers/gpu/host1x/bus.c | 7 ++++---
>>>>   include/linux/host1x.h   | 9 ++++++++-
>>>>   2 files changed, 12 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
>>>> index 347fb962b6c9..8fc79e9cb652 100644
>>>> --- a/drivers/gpu/host1x/bus.c
>>>> +++ b/drivers/gpu/host1x/bus.c
>>>> @@ -715,13 +715,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
>>>>    * device and call host1x_device_init(), which will in turn call 
>>>> each client's
>>>>    * &host1x_client_ops.init implementation.
>>>>    */
>>>> -int host1x_client_register(struct host1x_client *client)
>>>> +int __host1x_client_register(struct host1x_client *client,
>>>> +               struct lock_class_key *key)
>>>
>>> I've seen the kbuild robot warn about this because the kerneldoc is now
>>> out of date.
>>>
>>>>   {
>>>>       struct host1x *host1x;
>>>>       int err;
>>>>       INIT_LIST_HEAD(&client->list);
>>>> -    mutex_init(&client->lock);
>>>> +    __mutex_init(&client->lock, "host1x client lock", key);
>>>
>>> Should we maybe attempt to make this unique? Could we use something like
>>> dev_name(client->dev) for this?
>>
>> I'm curious who the lockdep warning could be triggered at all, I don't
>> recall ever seeing it. Mikko, could you please clarify how to reproduce
>> the warning?
>>
> 
> This is pretty difficult to read but I guess it's some interaction 
> related to the delayed initialization of host1x clients? In any case, I 
> consistently get it at boot (though it may be triggered by vic probe 
> instead of nvdec).
> 
> I'll fix the kbuild robot warnings and see if I can add a 
> client-specific lock name for v6.

Lockdep doesn't seem to be liking dev_name() for the name, and I think 
allocating a string for this purpose seems a bit overkill, so I'll keep 
the lock name as is if there are no objections.

Mikko

> 
> Mikko
> 
> [   38.128257] WARNING: possible recursive locking detected
> [   38.133567] 5.11.0-rc2-next-20210108+ #102 Tainted: G S
> [   38.140089] --------------------------------------------
> [   38.145395] systemd-udevd/239 is trying to acquire lock:
> [   38.150703] ffff0000997aa218 (&client->lock){+.+.}-{3:3}, at: 
> host1x_client_resume+0x30/0x100 [host1x]
> [   38.160142]
> [   38.160142] but task is already holding lock:
> [   38.165968] ffff000080c3b148 (&client->lock){+.+.}-{3:3}, at: 
> host1x_client_resume+0x30/0x100 [host1x]
> [   38.175398]
> [   38.175398] other info that might help us debug this:
> [   38.181918]  Possible unsafe locking scenario:
> [   38.181918]
> [   38.187830]        CPU0
> [   38.190275]        ----
> [   38.192719]   lock(&client->lock);
> [   38.196129]   lock(&client->lock);
> [   38.199537]
> [   38.199537]  *** DEADLOCK ***
> [   38.199537]
> [   38.205449]  May be due to missing lock nesting notation
> [   38.205449]
> [   38.212228] 6 locks held by systemd-udevd/239:
> [   38.216669]  #0: ffff00009261c188 (&dev->mutex){....}-{3:3}, at: 
> device_driver_attach+0x60/0x130
> [   38.225487]  #1: ffff800009a17168 (devices_lock){+.+.}-{3:3}, at: 
> host1x_client_register+0x7c/0x220 [host1x]
> [   38.235441]  #2: ffff000083f94bb8 (&host->devices_lock){+.+.}-{3:3}, 
> at: host1x_client_register+0xac/0x220 [host1x]
> [   38.245996]  #3: ffff0000a2267190 (&dev->mutex){....}-{3:3}, at: 
> __device_attach+0x8c/0x230
> [   38.254372]  #4: ffff000092c880f0 (&wgrp->lock){+.+.}-{3:3}, at: 
> tegra_display_hub_prepare+0xd8/0x170 [tegra_drm]
> [   38.264788]  #5: ffff000080c3b148 (&client->lock){+.+.}-{3:3}, at: 
> host1x_client_resume+0x30/0x100 [host1x]
> [   38.274658]
> [   38.274658] stack backtrace:
> [   38.279012] CPU: 0 PID: 239 Comm: systemd-udevd Tainted: G S       
> 5.11.0-rc2-next-20210108+ #102
> [   38.288660] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
> [   38.294577] Call trace:
> [   38.297022]  dump_backtrace+0x0/0x2c0
> [   38.300695]  show_stack+0x18/0x6c
> [   38.304013]  dump_stack+0x120/0x19c
> [   38.307507]  __lock_acquire+0x171c/0x2c34
> [   38.311521]  lock_acquire.part.0+0x230/0x490
> [   38.315793]  lock_acquire+0x70/0x90
> [   38.319285]  __mutex_lock+0x11c/0x6d0
> [   38.322952]  mutex_lock_nested+0x58/0x90
> [   38.326877]  host1x_client_resume+0x30/0x100 [host1x]
> [   38.332047]  host1x_client_resume+0x44/0x100 [host1x]
> [   38.337200]  tegra_display_hub_prepare+0xf8/0x170 [tegra_drm]
> [   38.343084]  host1x_drm_probe+0x1fc/0x4f0 [tegra_drm]
> [   38.348256]  host1x_device_probe+0x3c/0x50 [host1x]
> [   38.353240]  really_probe+0x148/0x6f0
> [   38.356906]  driver_probe_device+0x78/0xe4
> [   38.361005]  __device_attach_driver+0x10c/0x170
> [   38.365536]  bus_for_each_drv+0xf0/0x160
> [   38.369461]  __device_attach+0x168/0x230
> [   38.373385]  device_initial_probe+0x14/0x20
> [   38.377571]  bus_probe_device+0xec/0x100
> [   38.381494]  device_add+0x580/0xbcc
> [   38.384985]  host1x_subdev_register+0x178/0x1cc [host1x]
> [   38.390397]  host1x_client_register+0x138/0x220 [host1x]
> [   38.395808]  nvdec_probe+0x240/0x3ec [tegra_drm]
> [   38.400549]  platform_probe+0x8c/0x110
> [   38.404302]  really_probe+0x148/0x6f0
> [   38.407966]  driver_probe_device+0x78/0xe4
> [   38.412065]  device_driver_attach+0x120/0x130
> [   38.416423]  __driver_attach+0xb4/0x190
> [   38.420261]  bus_for_each_dev+0xe8/0x160
> [   38.424185]  driver_attach+0x34/0x44
> [   38.427761]  bus_add_driver+0x1a4/0x2b0
> [   38.431598]  driver_register+0xe0/0x210
> [   38.435437]  __platform_register_drivers+0x6c/0x104
> [   38.440318]  host1x_drm_init+0x54/0x1000 [tegra_drm]
> [   38.445405]  do_one_initcall+0xec/0x5e0
> [   38.449244]  do_init_module+0xe0/0x384
> [   38.453000]  load_module+0x32d8/0x3c60
