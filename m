Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2CCC433E2
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 16:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4260D6199F
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 16:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhCVQCW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Mar 2021 12:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbhCVQBi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Mar 2021 12:01:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E949C061756
        for <linux-tegra@vger.kernel.org>; Mon, 22 Mar 2021 09:01:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q29so21964598lfb.4
        for <linux-tegra@vger.kernel.org>; Mon, 22 Mar 2021 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LyOuop42Xk/5tojOUKb1zQ7ckHXWXwif0tSXvBO6Ffs=;
        b=qoCNf9SJZUm2q5stw2bLwxn6WMiJpBCrA+FJUYWCPIs4AydoCBszPt1GqGcc4XePYD
         RldHz0HDdJaxjRSF44dlZ+e7A6AtpTAQKSHtGxxwkMAb3UC/G3KdJLYF00RcC/4b31+h
         9ihETF3ZD98uXOgnymrvHaIGwuJAbcjdR8Y1MUB0tbx/CkmZEPLkHl9kKkD0Clu5cxLi
         8Mcwi4YPmv0DDvDYf4FGs78ZCeszmiXYOCs5y4x/1IZRA5vacV5sLbbpQ/neupt2RfL5
         kT4V2iBiIaQKWH+We9DMuaSMTOSaNaeFCxHOlErJkGQe021e1U6KDZeaLkx8Zkq1+fLX
         ZoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LyOuop42Xk/5tojOUKb1zQ7ckHXWXwif0tSXvBO6Ffs=;
        b=baoUiZLPdHfELw93zsMXlsVXQl/zjmLXa8ask1XFCsJMAKVyuE0Htr3Zzv9ELq0qCf
         +brJFDiGskz9LlbPsF8LNWzJ9PTM/pAu8B6AjrEiBWTxyvNQHhl3DXFfyEWwbPosdoIQ
         dVzHTQ0/NJjPNwNrNaDkq75sJa7RTSGbx2UCvZy9Xo0XoiSBMUgZuTVIgjIdJxpNZk/H
         XWPCnCQTcFKxg4BhOhBfETkgM6X8FBpezLT3QsN7uZmnauI2nfnnlo3tSqBdlJgC6kjz
         w28ZWbum2mi81yHSDPdFSLvm16MZvjPfqoXluqwNlh2epfdutI48NB0N++4R9mPdLtyl
         udyg==
X-Gm-Message-State: AOAM530R0tXc3hIOxVznb/ieJ9ZIrjpfSyEmr9Vw8JgfqWNkrMtieBSx
        K8WQlckzz1eH3cXaECrmLsk=
X-Google-Smtp-Source: ABdhPJwkGeZJEg40ZOLxP295OqaH/Q5BjZybzfqYhM+sOjcMYFPzBFqhS58v++0YGteMeRtajrOkYQ==
X-Received: by 2002:a05:6512:b97:: with SMTP id b23mr53427lfv.101.1616428896016;
        Mon, 22 Mar 2021 09:01:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-47.dynamic.spd-mgts.ru. [109.252.193.47])
        by smtp.googlemail.com with ESMTPSA id t10sm1607291lfp.162.2021.03.22.09.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 09:01:35 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To:     Mikko Perttunen <mperttunen@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6dec95ac-bd92-9434-76ba-eb7fcb316f49@gmail.com>
Date:   Mon, 22 Mar 2021 19:01:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.03.2021 18:19, Mikko Perttunen пишет:
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
>>>>         INIT_LIST_HEAD(&client->list);
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

Thank you for the clarification! We now actually have a similar problem on Tegra20 after fixing the coupling of display controllers using the dc1_client->parent=dc0_client and I see the same warning when DC1 is enabled.

[    3.808338] ============================================
[    3.808355] WARNING: possible recursive locking detected
[    3.808376] 5.12.0-rc3-next-20210319-00176-g60867e51e180 #7219 Tainted: G        W        
[    3.808406] --------------------------------------------
[    3.808421] kworker/1:2/108 is trying to acquire lock:
[    3.808449] c36b70a4 (&client->lock){+.+.}-{3:3}, at: host1x_client_resume+0x17/0x58
[    3.808586] 
               but task is already holding lock:
[    3.808603] c34df8a4 (&client->lock){+.+.}-{3:3}, at: host1x_client_resume+0x17/0x58
[    3.808712] 
               other info that might help us debug this:
[    3.808729]  Possible unsafe locking scenario:

[    3.808744]        CPU0
[    3.808757]        ----
[    3.808771]   lock(&client->lock);
[    3.808810]   lock(&client->lock);
[    3.808821] 
                *** DEADLOCK ***

[    3.808825]  May be due to missing lock nesting notation

[    3.808829] 15 locks held by kworker/1:2/108:
[    3.808836]  #0: c20068a8 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x15a/0x608
[    3.808878]  #1: c2bbbf18 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x15a/0x608
[    3.808912]  #2: c366d4d8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x29/0xdc
[    3.808953]  #3: c141a980 (devices_lock){+.+.}-{3:3}, at: host1x_client_register+0x35/0xfc
[    3.808986]  #4: c34df64c (&host1x->devices_lock){+.+.}-{3:3}, at: host1x_client_register+0x51/0xfc
[    3.809017]  #5: c34ed4d8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x29/0xdc
[    3.809050]  #6: c13faf5c (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x2d/0x274
[    3.809092]  #7: c132566c (console_lock){+.+.}-{0:0}, at: register_framebuffer+0x219/0x274
[    3.809124]  #8: c36e7848 (&fb_info->lock){+.+.}-{3:3}, at: register_framebuffer+0x19f/0x274
[    3.809157]  #9: c36d2d6c (&helper->lock){+.+.}-{3:3}, at: __drm_fb_helper_restore_fbdev_mode_unlocked+0x41/0x8c
[    3.809199]  #10: c36f00e8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x17/0x28
[    3.809233]  #11: c36d2c50 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x1d/0x138
[    3.809272]  #12: c2bbba28 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0x2f/0x1c4
[    3.809306]  #13: c36e6448 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_backoff+0x63/0x190
[    3.809337]  #14: c34df8a4 (&client->lock){+.+.}-{3:3}, at: host1x_client_resume+0x17/0x58
[    3.809369] 
               stack backtrace:
[    3.809375] CPU: 1 PID: 108 Comm: kworker/1:2 Tainted: G        W         5.12.0-rc3-next-20210319-00176-g60867e51e180 #7219
[    3.809387] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    3.809396] Workqueue: events deferred_probe_work_func
[    3.809417] [<c010d1ad>] (unwind_backtrace) from [<c010961d>] (show_stack+0x11/0x14)
[    3.809447] [<c010961d>] (show_stack) from [<c0b7d7c9>] (dump_stack+0x9f/0xb8)
[    3.809467] [<c0b7d7c9>] (dump_stack) from [<c0179eef>] (__lock_acquire+0x7fb/0x253c)
[    3.809495] [<c0179eef>] (__lock_acquire) from [<c017c403>] (lock_acquire+0xf3/0x420)
[    3.809516] [<c017c403>] (lock_acquire) from [<c0b87663>] (__mutex_lock+0x87/0x814)
[    3.809544] [<c0b87663>] (__mutex_lock) from [<c0b87e09>] (mutex_lock_nested+0x19/0x20)
[    3.809565] [<c0b87e09>] (mutex_lock_nested) from [<c05ccd2f>] (host1x_client_resume+0x17/0x58)
[    3.809587] [<c05ccd2f>] (host1x_client_resume) from [<c05ccd37>] (host1x_client_resume+0x1f/0x58)
[    3.809604] [<c05ccd37>] (host1x_client_resume) from [<c061d9a3>] (tegra_crtc_atomic_enable+0x33/0x21c4)
[    3.809634] [<c061d9a3>] (tegra_crtc_atomic_enable) from [<c05e0355>] (drm_atomic_helper_commit_modeset_enables+0x131/0x16c)
[    3.809667] [<c05e0355>] (drm_atomic_helper_commit_modeset_enables) from [<c05e0e89>] (drm_atomic_helper_commit_tail_rpm+0x1d/0x4c)
[    3.809691] [<c05e0e89>] (drm_atomic_helper_commit_tail_rpm) from [<c0610157>] (tegra_atomic_commit_tail+0x83/0x84)
[    3.809712] [<c0610157>] (tegra_atomic_commit_tail) from [<c05e1271>] (commit_tail+0x71/0x138)
[    3.809732] [<c05e1271>] (commit_tail) from [<c05e1b95>] (drm_atomic_helper_commit+0xf1/0x114)
[    3.809753] [<c05e1b95>] (drm_atomic_helper_commit) from [<c0607355>] (drm_client_modeset_commit_atomic+0x199/0x1c4)
[    3.809777] [<c0607355>] (drm_client_modeset_commit_atomic) from [<c0607401>] (drm_client_modeset_commit_locked+0x3d/0x138)
[    3.809798] [<c0607401>] (drm_client_modeset_commit_locked) from [<c0607517>] (drm_client_modeset_commit+0x1b/0x2c)
[    3.809818] [<c0607517>] (drm_client_modeset_commit) from [<c05e5c4f>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0x73/0x8c)
[    3.809842] [<c05e5c4f>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c05e5cc9>] (drm_fb_helper_set_par+0x2d/0x4c)
[    3.809862] [<c05e5cc9>] (drm_fb_helper_set_par) from [<c056c763>] (fbcon_init+0x1cb/0x370)
[    3.809883] [<c056c763>] (fbcon_init) from [<c05af8c7>] (visual_init+0x8b/0xc8)
[    3.809902] [<c05af8c7>] (visual_init) from [<c05b07c5>] (do_bind_con_driver+0x13d/0x2b4)
[    3.809919] [<c05b07c5>] (do_bind_con_driver) from [<c05b0b93>] (do_take_over_console+0xdf/0x15c)
[    3.809937] [<c05b0b93>] (do_take_over_console) from [<c056b1df>] (do_fbcon_takeover+0x4f/0x90)
[    3.809955] [<c056b1df>] (do_fbcon_takeover) from [<c056545d>] (register_framebuffer+0x1a5/0x274)
[    3.809977] [<c056545d>] (register_framebuffer) from [<c05e57cf>] (__drm_fb_helper_initial_config_and_unlock+0x29f/0x438)
[    3.809999] [<c05e57cf>] (__drm_fb_helper_initial_config_and_unlock) from [<c06115e1>] (tegra_drm_fb_init+0x25/0x5c)
[    3.810022] [<c06115e1>] (tegra_drm_fb_init) from [<c060feff>] (host1x_drm_probe+0x247/0x404)
[    3.810041] [<c060feff>] (host1x_drm_probe) from [<c0647ad9>] (really_probe+0xb1/0x2a4)
[    3.810064] [<c0647ad9>] (really_probe) from [<c0647d0b>] (driver_probe_device+0x3f/0x78)
[    3.810086] [<c0647d0b>] (driver_probe_device) from [<c0646737>] (bus_for_each_drv+0x4f/0x78)
[    3.810107] [<c0646737>] (bus_for_each_drv) from [<c06479d5>] (__device_attach+0x95/0xdc)
[    3.810127] [<c06479d5>] (__device_attach) from [<c064702d>] (bus_probe_device+0x5d/0x64)
[    3.810147] [<c064702d>] (bus_probe_device) from [<c064581b>] (device_add+0x293/0x5c0)
[    3.810166] [<c064581b>] (device_add) from [<c05cd211>] (host1x_subdev_register+0x8d/0xac)
[    3.810186] [<c05cd211>] (host1x_subdev_register) from [<c05cd4d3>] (host1x_client_register+0x8f/0xfc)
[    3.810204] [<c05cd4d3>] (host1x_client_register) from [<c061870f>] (tegra_dc_probe+0x1bf/0x2b0)
[    3.810225] [<c061870f>] (tegra_dc_probe) from [<c064977b>] (platform_probe+0x43/0x80)
[    3.810247] [<c064977b>] (platform_probe) from [<c0647ad9>] (really_probe+0xb1/0x2a4)
[    3.810266] [<c0647ad9>] (really_probe) from [<c0647d0b>] (driver_probe_device+0x3f/0x78)
[    3.810286] [<c0647d0b>] (driver_probe_device) from [<c0646737>] (bus_for_each_drv+0x4f/0x78)
[    3.810307] [<c0646737>] (bus_for_each_drv) from [<c06479d5>] (__device_attach+0x95/0xdc)
[    3.810326] [<c06479d5>] (__device_attach) from [<c064702d>] (bus_probe_device+0x5d/0x64)
[    3.810346] [<c064702d>] (bus_probe_device) from [<c0647379>] (deferred_probe_work_func+0x4d/0x70)
[    3.810367] [<c0647379>] (deferred_probe_work_func) from [<c0139557>] (process_one_work+0x1eb/0x608)
[    3.810391] [<c0139557>] (process_one_work) from [<c0139a6d>] (worker_thread+0xf9/0x3bc)
[    3.810411] [<c0139a6d>] (worker_thread) from [<c013f3db>] (kthread+0xff/0x134)
[    3.810432] [<c013f3db>] (kthread) from [<c0100159>] (ret_from_fork+0x11/0x38)
[    3.810449] Exception stack(0xc2bbbfb0 to 0xc2bbbff8)


