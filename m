Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1D5C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 00:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5E0820770
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 00:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpkBGw5d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgIPAsc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgIOLm1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 07:42:27 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA07C061354;
        Tue, 15 Sep 2020 04:41:50 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nw23so4577983ejb.4;
        Tue, 15 Sep 2020 04:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=NyM9HKb/kB48ewijaPDo434N6k5WI8+ETaVUXwUOERY=;
        b=FpkBGw5dci4/yPmSnmb3rmcg5LPBylECw3fR5n22HGr9YoDHbPKSxcYDyQdoL05dif
         jjWVlK6LplvNk576zM8kE+1q151rc3oz9UmFl1cus5o4i2RgTWDpS+E+dIgVYkZP0viv
         OuyGigtBpbF6RLr/qX0eozuNp9p2agJohwEa0X9j8JYA9Sv8LyKiXyhf0bMH0/zgG4sz
         L7xBxCFpv7tqGUNHEfcqaQ18uvTVTAMhc+5w16vjQaEmDwAZobQO9lTYWtRenQGqWNKC
         AUif2YLw4p2vKPOZrsJxBhaeRNmfM1FNXLVWJZFtL9CSoUf/3aH3m7Bk1lDKNw0zWS4m
         rBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=NyM9HKb/kB48ewijaPDo434N6k5WI8+ETaVUXwUOERY=;
        b=JSt0YkomSIOyBE2LaNX7U2/ZGPuPq2zbZF1NzJ8X/PO6q4XlBsGXjq4ZyW+DFILjEq
         zIjDV9lZX345NvI88jduiavAmxCoFY8Te6XeToRMW8JIdtVabQp+dHmUYt8GARE4wfj6
         fGjR6irTSsf+nwJ/luSXxjpMr+CIIhNQYvDkMLNnzXAkOWtvHi5OaA0anslcGpi/OI9I
         rHCGb3hCXJbS+LqQ2YZQaGiXRKamh1e1Z8Y2fdvgc3jbNOnMGJJQauLf4Myx935SKzEj
         02yWTiNMYsfWmx+VTNPsidfZEsWjnk0tSB/mW2Wfcot5/oPjBbMQ74IfbzqIAO9lr7go
         Bmpg==
X-Gm-Message-State: AOAM533BM7Ldb7TwHh2UAGmid1LlZwslVnyy5Qw12VlBDUTO+4/IAtCJ
        oOBkIIM4jFhSwyBdb9AtcSbbdRXm/CwKSUSqNp7Pz+atwR7aFw==
X-Google-Smtp-Source: ABdhPJzYDdXIPX3j8eWwRY0yxEWDRCb5Jm2mA5uRp46jqAQqBui5N8IOlx1PBLoLlqkQsvoWZcAgal69cFA73RESmr4=
X-Received: by 2002:a17:906:858a:: with SMTP id v10mr7524020ejx.61.1600170108871;
 Tue, 15 Sep 2020 04:41:48 -0700 (PDT)
MIME-Version: 1.0
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Tue, 15 Sep 2020 07:41:38 -0400
Message-ID: <CAMdYzYoRFBOA0b8tZgZpvbWkrtNrcyDXt9zHCF7yqtm2heYSXQ@mail.gmail.com>
Subject: [BUG] slab: double free detected in cache 'kmalloc-128', objp daff5780
To:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Good Morning,

I discovered a double free bug in kmalloc-128 in v5.9 on arm.
It is with the tegra_defconfig, running on a tegra30.
I've reliably reproduced it by compiling the kernel on the board then rebooting.
It will sometimes trigger early into compilation.
I've begun bisecting and will report if I find the offending commit.

[  OK  ] Reached target Reboot.
[33632.950829] slab: double free detected in cache 'kmalloc-128', objp daff5780
[33632.958035] ------------[ cut here ]------------
[33632.962702] kernel BUG at mm/slab.c:2535!
[33632.965984] systemd-shutdown[1]: All filesystems unmounted.
[33632.966764] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
[33632.966770] Modules linked in: fuse brcmfmac brcmutil
[33632.966785] CPU: 1 PID: 15 Comm: ksoftirqd/1 Not tainted 5.9.0-rc4 #30
[33632.966788] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[33632.966803] PC is at free_block.constprop.0+0x228/0x22c
[33632.966807] LR is at free_block.constprop.0+0x228/0x22c
[33632.966810] pc : [<c02d1110>]    lr : [<c02d1110>]    psr: 60000193
[33632.966813] sp : df0f5c78  ip : 000007bf  fp : 00000000
[33632.966815] r10: c1337480  r9 : df612750  r8 : 00000000
[33632.966818] r7 : 0000000f  r6 : daff5b00  r5 : dfa42e78  r4 : daff5b1f
[33632.966820] r3 : c1204ec8  r2 : 00000000  r1 : 1e4a0000  r0 : 00000040
[33632.966827] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment none
[33632.972626] systemd-shutdown[1]: Deactivating swaps.
[33632.978351] Control: 10c5387d  Table: 9d1c804a  DAC: 00000051
[33632.978357] Process ksoftirqd/1 (pid: 15, stack limit = 0x8c4e77fe)
[33632.978361] Stack: (0xdf0f5c78 to 0xdf0f6000)
[33632.978365] 5c60:
    00000010 df001084
[33632.978370] 5c80: df001094 df0f5cd4 0000956f df0000c0 d6bdde00
c1172740 c1337480 1e4a0000
[33632.978375] 5ca0: df612740 df001080 00332b14 c02d1aa4 00001e96
c3b88900 00000010 00000000
[33632.978382] 5cc0: df612750 df60e180 df0ca140 00000005 00003e80
df0f5cd4 df0f5cd4 c1204ec8
[33632.986457] systemd-shutdown[1]: All swaps deactivated.
[33632.990067] 5ce0: df0ca140 d6bdde00 c02d2288 a0000193 c0efa504
9d74e35b 09f91102 d6bfae80
[33632.996428] systemd-shutdown[1]: Detaching loop devices.
[33633.001653] 5d00: 00000020 c02d207c 00000001 df0000c0 df9a9f28
df0000c0 00000000 c02d2288
[33633.012540] systemd-shutdown[1]: All loop devices detached.
[33633.013237] 5d20: df0000c0 df9a9f28 d6bfaf80 c02d238c df0f5d94
df0f5d90 df0f5d94 df0000c0
[33633.018562] systemd-shutdown[1]: Detaching DM devices.
[33633.023783] 5d40: 00000122 00000100 df612740 df001080 00407ad8
c02d2468 df0000c0 dca86800
[33633.030686] systemd-shutdown[1]: All DM devices detached.
[33633.036926] 5d60: c1172740 c1337480 1e4a0000 c02d1c24 0032dcdb
0008f24d 00000010 00000000
[33633.036931] 5d80: df612750 df0f4000 df0f5da0 38e38e39 c12e7640
df0f5d94 df0f5d94 c1204ec8
[33633.036935] 5da0: df606628 dca86800 c02d2288 a0000193 c0efa504
9d74e35b 09f91102 dc45ca08
[33633.036940] 5dc0: 00000019 c02d207c 0009c463 df08cf00 dfa70cf0
df08cf00 00000000 c02d2288
[33633.044239] systemd-shutdown[1]: All filesystems, swaps, loop
devices and DM devices detached.
[33633.049219] 5de0: df08cf00 dfa70cf0 dc45cf00 c02d238c df0f5e54
df0f5e50 df0f5e54 df08cf00
[33633.049224] 5e00: 00000122 00000100 df6131c4 df084fc0 00437334
c02d2468 df08cf00 ddfa51e0
[33633.049228] 5e20: c11731c4 c1337480 1e4a0000 c02d1c24 00000010
00000000 00000010 00000120
[33633.049233] 5e40: df6131d4 d84156c5 c3b887c0 ddfa51e0 df0f5e4c
df0f5e54 df0f5e54 c1204ec8
[33633.233225] 5e60: c0303a00 c01a1f00 a0000113 ddfa51e8 df0f5ed0
ddfa5268 df0f4000 00000100
[33633.241442] 5e80: c12ef6b8 c02d1f0c 20000113 ddfa51e8 c12ef5a0
c1204eec c1213f00 c01a1f00
[33633.249698] 5ea0: 00000000 c1309e00 00000001 c015d9b4 df60e1b0
00000000 00000011 df60e9ac
[33633.257944] 5ec0: df60e980 c12ef6b8 00000000 00000000 ddfa51c8
de7a3da8 fffffff6 c1204ec8
[33633.266197] 5ee0: c12030a4 c12030a4 0000000a 00000009 00000200
df0f4000 c12ef1a4 00000100
[33633.274416] 5f00: df0f5f08 c01013bc ffffe000 df0f4000 c1203080
c1162360 00000009 c116dd00
[33633.282664] 5f20: c116dd00 c11622ec 0032dcda c1203d00 df0c0140
04208040 df0ca0c0 df0f4000
[33633.290927] 5f40: 00000000 df0c0140 c120cb6c ffffe000 00000000
df0b1e04 df0c00a4 c012ac80
[33633.299164] 5f60: df0f4000 c014a980 df0c0080 df0c00c0 df0f4000
00000000 c014a87c df0c0140
[33633.307431] 5f80: df0b1e04 c0146f20 00000000 df0c00c0 c0146d94
00000000 00000000 00000000
[33633.315740] 5fa0: 00000000 00000000 00000000 c01001a8 00000000
00000000 00000000 00000000
[33633.324006] 5fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[33633.331491] systemd-shutdown[1]: Syncing filesystems and block devices.
[33633.332254] 5fe0: 00000000 00000000 00000000 00000000 00000013
00000000 00000000 00000000
[33633.339097] systemd-shutdown[1]: Rebooting.
[33633.347196] [<c02d1110>] (free_block.constprop.0) from [<c02d1aa4>]
(___cache_free+0x3ac/0x6f4)
[33633.347202] [<c02d1aa4>] (___cache_free) from [<c02d207c>] (kfree+0x98/0x194)
[33633.367354] [<c02d207c>] (kfree) from [<c02d2288>]
(kmem_freepages+0x110/0x134)
[33633.374733] [<c02d2288>] (kmem_freepages) from [<c02d238c>]
(slab_destroy+0xd4/0x16c)
[33633.382651] [<c02d238c>] (slab_destroy) from [<c02d2468>]
(slabs_destroy+0x44/0x60)
[33633.390344] [<c02d2468>] (slabs_destroy) from [<c02d1c24>]
(___cache_free+0x52c/0x6f4)
[33633.398297] [<c02d1c24>] (___cache_free) from [<c02d207c>] (kfree+0x98/0x194)
[33633.405501] [<c02d207c>] (kfree) from [<c02d2288>]
(kmem_freepages+0x110/0x134)
[33633.412845] [<c02d2288>] (kmem_freepages) from [<c02d238c>]
(slab_destroy+0xd4/0x16c)
[33633.420747] [<c02d238c>] (slab_destroy) from [<c02d2468>]
(slabs_destroy+0x44/0x60)
[33633.428477] [<c02d2468>] (slabs_destroy) from [<c02d1c24>]
(___cache_free+0x52c/0x6f4)
[33633.436468] [<c02d1c24>] (___cache_free) from [<c02d1f0c>]
(kmem_cache_free.part.0+0x24/0xf0)
[33633.445034] [<c02d1f0c>] (kmem_cache_free.part.0) from [<c01a1f00>]
(rcu_core+0x2d8/0xb3c)
[33633.453375] [<c01a1f00>] (rcu_core) from [<c01013bc>]
(__do_softirq+0x114/0x3dc)
[33633.460852] [<c01013bc>] (__do_softirq) from [<c012ac80>]
(run_ksoftirqd+0x2c/0x34)
[33633.468549] [<c012ac80>] (run_ksoftirqd) from [<c014a980>]
(smpboot_thread_fn+0x104/0x270)
[33633.476889] [<c014a980>] (smpboot_thread_fn) from [<c0146f20>]
(kthread+0x18c/0x190)
[33633.484701] [<c0146f20>] (kthread) from [<c01001a8>]
(ret_from_fork+0x14/0x2c)
[33633.491956] Exception stack(0xdf0f5fb0 to 0xdf0f5ff8)
[33633.497080] 5fa0:                                     00000000
00000000 00000000 00000000
[33633.505325] 5fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[33633.513534] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[33633.520220] Code: e5901040 e30a0440 e34c00ef ebfad8dd (e7f001f2)
[33633.526353] ---[ end trace 0d2364af0084bf74 ]---
[33633.538355] Kernel panic - not syncing: Fatal exception in interrupt
[33633.544747] CPU0: stopping
[33633.547533] CPU: 0 PID: 24031 Comm: kworker/0:1 Tainted: G      D
        5.9.0-rc4 #30
[33633.555738] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[33633.562077] Workqueue: events dbs_work_handler
[33633.566567] [<c0111a6c>] (unwind_backtrace) from [<c010b95c>]
(show_stack+0x10/0x14)
[33633.574382] [<c010b95c>] (show_stack) from [<c0512450>]
(dump_stack+0xc4/0xd8)
[33633.581677] [<c0512450>] (dump_stack) from [<c010fcd4>]
(handle_IPI+0x3f4/0x420)
[33633.589113] [<c010fcd4>] (handle_IPI) from [<c052b380>]
(gic_handle_irq+0x8c/0x90)
[33633.596753] [<c052b380>] (gic_handle_irq) from [<c0100b8c>]
(__irq_svc+0x6c/0xa8)
[33633.604301] Exception stack(0xdcf29c60 to 0xdcf29ca8)
[33633.609385] 9c60: 00000001 00000004 df611c40 00000011 df5faac0
c1205004 c1205318 df5faac4
[33633.617628] 9c80: dcf29d78 1e4c8000 c1171c40 00000004 00000000
dcf29cb0 c01c7594 c01c75cc
[33633.625870] 9ca0: 000f0113 ffffffff
[33633.629402] [<c0100b8c>] (__irq_svc) from [<c01c75cc>]
(smp_call_function_many_cond+0x398/0x42c)
[33633.638258] [<c01c75cc>] (smp_call_function_many_cond) from
[<c01c76c4>] (smp_call_function+0x48/0x84)
[33633.647594] [<c01c76c4>] (smp_call_function) from [<c01c772c>]
(on_each_cpu+0x2c/0x70)
[33633.655581] [<c01c772c>] (on_each_cpu) from [<c0110e48>]
(twd_rate_change+0x28/0x30)
[33633.663399] [<c0110e48>] (twd_rate_change) from [<c0148230>]
(notifier_call_chain+0x48/0x80)
[33633.671905] [<c0148230>] (notifier_call_chain) from [<c0148448>]
(__srcu_notifier_call_chain+0x44/0x9c)
[33633.681328] [<c0148448>] (__srcu_notifier_call_chain) from
[<c01484b8>] (srcu_notifier_call_chain+0x18/0x20)
[33633.691229] [<c01484b8>] (srcu_notifier_call_chain) from
[<c0587cfc>] (__clk_notify+0x80/0xb4)
[33633.699911] [<c0587cfc>] (__clk_notify) from [<c058b6f8>]
(clk_change_rate+0x1a8/0x594)
[33633.707982] [<c058b6f8>] (clk_change_rate) from [<c058b6b0>]
(clk_change_rate+0x160/0x594)
[33633.716314] [<c058b6b0>] (clk_change_rate) from [<c058b6b0>]
(clk_change_rate+0x160/0x594)
[33633.724609] [<c058b6b0>] (clk_change_rate) from [<c058bc5c>]
(clk_core_set_rate_nolock+0x178/0x1a0)
[33633.733721] [<c058bc5c>] (clk_core_set_rate_nolock) from
[<c058bcb4>] (clk_set_rate+0x30/0x88)
[33633.742402] [<c058bcb4>] (clk_set_rate) from [<c0851efc>]
(dev_pm_opp_set_rate+0x210/0x5e8)
[33633.750822] [<c0851efc>] (dev_pm_opp_set_rate) from [<c085ae64>]
(set_target+0x2c/0x54)
[33633.758861] [<c085ae64>] (set_target) from [<c0855f44>]
(__cpufreq_driver_target+0x168/0x528)
[33633.767456] [<c0855f44>] (__cpufreq_driver_target) from
[<c0859560>] (od_dbs_update+0x13c/0x160)
[33633.776309] [<c0859560>] (od_dbs_update) from [<c085a25c>]
(dbs_work_handler+0x2c/0x58)
[33633.784387] [<c085a25c>] (dbs_work_handler) from [<c01402d4>]
(process_one_work+0x1dc/0x594)
[33633.792856] [<c01402d4>] (process_one_work) from [<c01406d8>]
(worker_thread+0x4c/0x520)
[33633.801016] [<c01406d8>] (worker_thread) from [<c0146f20>]
(kthread+0x18c/0x190)
[33633.808480] [<c0146f20>] (kthread) from [<c01001a8>]
(ret_from_fork+0x14/0x2c)
[33633.815730] Exception stack(0xdcf29fb0 to 0xdcf29ff8)
[33633.820850] 9fa0:                                     00000000
00000000 00000000 00000000
[33633.829057] 9fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[33633.837300] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[33633.843981] CPU3: stopping
[33633.846728] CPU: 3 PID: 1 Comm: systemd-shutdow Tainted: G      D
        5.9.0-rc4 #30
[33633.854971] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[33633.861275] [<c0111a6c>] (unwind_backtrace) from [<c010b95c>]
(show_stack+0x10/0x14)
[33633.869087] [<c010b95c>] (show_stack) from [<c0512450>]
(dump_stack+0xc4/0xd8)
[33633.876380] [<c0512450>] (dump_stack) from [<c010fcd4>]
(handle_IPI+0x3f4/0x420)
[33633.883810] [<c010fcd4>] (handle_IPI) from [<c052b380>]
(gic_handle_irq+0x8c/0x90)
[33633.891449] [<c052b380>] (gic_handle_irq) from [<c0100b8c>]
(__irq_svc+0x6c/0xa8)
[33633.898996] Exception stack(0xdf0b1d78 to 0xdf0b1dc0)
[33633.904080] 1d60:
    00000000 df0b1dd0
[33633.912324] 1d80: df60ea80 00000011 df0b1dd0 df611b00 c025b59c
00000001 00000001 ffffe000
[33633.920568] 1da0: 00000000 df611b08 df611c40 df0b1dc8 00000000
c01c7030 200b0013 ffffffff
[33633.928779] [<c0100b8c>] (__irq_svc) from [<c01c7030>]
(smp_call_function_single+0x1ec/0x294)
[33633.937376] [<c01c7030>] (smp_call_function_single) from
[<c0251338>] (perf_event_exit_cpu_context+0x64/0x9c)
[33633.947356] [<c0251338>] (perf_event_exit_cpu_context) from
[<c0251390>] (perf_reboot+0x20/0x44)
[33633.956210] [<c0251390>] (perf_reboot) from [<c0148230>]
(notifier_call_chain+0x48/0x80)
[33633.964332] [<c0148230>] (notifier_call_chain) from [<c01488c0>]
(blocking_notifier_call_chain+0x44/0x60)
[33633.973966] [<c01488c0>] (blocking_notifier_call_chain) from
[<c0149a14>] (kernel_restart_prepare+0x18/0x38)
[33633.983861] [<c0149a14>] (kernel_restart_prepare) from [<c0149aec>]
(kernel_restart+0xc/0x50)
[33633.992454] [<c0149aec>] (kernel_restart) from [<c0149d40>]
(__do_sys_reboot+0x10c/0x204)
[33634.000700] [<c0149d40>] (__do_sys_reboot) from [<c01000c0>]
(ret_fast_syscall+0x0/0x54)
[33634.008819] Exception stack(0xdf0b1fa8 to 0xdf0b1ff0)
[33634.013939] 1fa0:                   01234567 be9c5b28 fee1dead
28121969 01234567 487de000
[33634.022183] 1fc0: 01234567 be9c5b28 be9c5b24 00000058 be9c5b28
be9c5b24 fffff000 be9c5b2c
[33634.030388] 1fe0: 00000058 be9c5a9c b6f08d65 b6e87be6
[33634.035509] CPU2: stopping
[33634.038258] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D
  5.9.0-rc4 #30
[33634.045982] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[33634.052287] [<c0111a6c>] (unwind_backtrace) from [<c010b95c>]
(show_stack+0x10/0x14)
[33634.060102] [<c010b95c>] (show_stack) from [<c0512450>]
(dump_stack+0xc4/0xd8)
[33634.067357] [<c0512450>] (dump_stack) from [<c010fcd4>]
(handle_IPI+0x3f4/0x420)
[33634.074826] [<c010fcd4>] (handle_IPI) from [<c052b380>]
(gic_handle_irq+0x8c/0x90)
[33634.082466] [<c052b380>] (gic_handle_irq) from [<c0100b8c>]
(__irq_svc+0x6c/0xa8)
[33634.089978] Exception stack(0xdf0ebf08 to 0xdf0ebf50)
[33634.095100] bf00:                   00000000 c12ab680 1e4b4000
00000060 c12ab620 00000001
[33634.103345] bf20: 00000001 00000001 df6213b8 eb7fd8c0 00001e96
c12efb40 fffffff6 df0ebf58
[33634.111551] bf40: c085c108 c085c1d4 60000113 ffffffff
[33634.116675] [<c0100b8c>] (__irq_svc) from [<c085c1d4>]
(cpuidle_enter_state+0x244/0x4d0)
[33634.124833] [<c085c1d4>] (cpuidle_enter_state) from [<c085c4c4>]
(cpuidle_enter+0x50/0x54)
[33634.133130] [<c085c4c4>] (cpuidle_enter) from [<c0158c4c>]
(do_idle+0x204/0x294)
[33634.140594] [<c0158c4c>] (do_idle) from [<c0158fdc>]
(cpu_startup_entry+0x18/0x1c)
[33634.148233] [<c0158fdc>] (cpu_startup_entry) from [<8010172c>] (0x8010172c)
[33634.164335] Rebooting in 10 seconds..
