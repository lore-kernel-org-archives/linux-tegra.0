Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1A1C4363A
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 17:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F15B62076E
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 17:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPzMAn3x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgJ2RpP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Oct 2020 13:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgJ2RpN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Oct 2020 13:45:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBB3C0613CF
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2020 10:45:09 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d24so4000578ljg.10
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2020 10:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S65y5xSLhczH11mkaBRQH2/d0jIRR8Xm9PQfUAb0xFA=;
        b=PPzMAn3xlQ9tcF8KBLyJV8P/hGu9oAwkkhFpJvI2fN0y4NT6IBUOVEUPIW5rXF3Fri
         DdVv7oepTA380YuC9kXhrj06Hkc7UXk4fa8a/EKK8fe0WTTTsz7wr7vflEI6HqDVMgDo
         Yo+Y1PsfvFC2LIMwsE+TG5t0PzPV72o3ryh5ys4kIzrikF+YeVeqU2nN9G/4Vue2pLd5
         y2gy0raRzsgtTsqcdw8FSxdxc3YYtbmuBVhQ4YU5a0LBlqvzwOx+G/8I8uunb8eWZcsN
         v3PFw7V3wDvgJp+qEOnY4V/8f4z5Ff/09enkZUxdUnvQ4OQEsKbWbopMrEMIvEc4Bt0y
         6I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S65y5xSLhczH11mkaBRQH2/d0jIRR8Xm9PQfUAb0xFA=;
        b=KdVVuF9eAS2kFGt+/zV3HD+oaXupnxJP+N/CoqcMooQe7pXf3lEynMXKRabhEVXKZj
         jTfLGN4YJ6y9TUxcdmU1d2t9d68zZFTJeEO4e+RShucwQZfRzbPrfDGs+SolUf7dddb0
         iDE8NuAsr1ygfsxwMTsJZxq04Aq+UyZAymz8TdhmXABXkUddlYYCSEGEQB62ORUTj0Tp
         cKZbBnwwvQExaMDE4B9bVY8Gu8mkH8tnoKMVT8SFYL+7kR4lFB0Kt8c4ud5jzglXnHv3
         NdGr9BwZw3CbDMrmc3HR7WVxWqIkpTSxTUdVug9xktURP8Iu5Wls50ic+8OsQcxFKP7Z
         H49A==
X-Gm-Message-State: AOAM533bR4bqR5pBC/WvuqkQpGPe3zTuvNKAQ5g86+Wzw6aM8GL/aNGP
        QBEdVkXuBZw0prA6LQKt0zQ=
X-Google-Smtp-Source: ABdhPJzATBIpx4cUs04+kicc9fSxG1KNhKjxBfvMKEGQJlxojesrIU+38impqmiZBYziJwUrVNQHQA==
X-Received: by 2002:a2e:3a08:: with SMTP id h8mr2448196lja.125.1603993508320;
        Thu, 29 Oct 2020 10:45:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru. [109.252.193.177])
        by smtp.googlemail.com with ESMTPSA id u11sm402640ljl.38.2020.10.29.10.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 10:45:07 -0700 (PDT)
Subject: Re: [PATCH 0/5 v16] KASan for Arm
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>
References: <20201019084140.4532-1-linus.walleij@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c3a17f70-4c7b-55b5-a7ce-373c4ff46b29@gmail.com>
Date:   Thu, 29 Oct 2020 20:45:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019084140.4532-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.10.2020 11:41, Linus Walleij пишет:
> This is the 16th and final (knock on wood) version of
> KASan for ARM32.

Hi,

I tried KASAN on NVIDIA Tegra using next-20201029 and getting a (seems)
bogus bug report saying that the bug is in the KASAN code (note
udc_irq() belongs to the ChipIdea USB driver), this problem doesn't
happen using one of older versions of the KASAN patches.

[   27.700859]
==================================================================
[   27.720575] BUG: KASAN: stack-out-of-bounds in save_trace+0xbf/0xf8
[   27.740119] Read of size 4 at addr c4dc7038 by task kworker/0:1H/124

[   27.778724] CPU: 0 PID: 124 Comm: kworker/0:1H Tainted: G        W
     5.10.0-rc1-next-20201029-00144-g367ba7b6ebb4 #4327
[   27.818361] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   27.838599] Workqueue: mmc_complete mmc_blk_mq_complete_work
[   27.858795] [<c0111a05>] (unwind_backtrace) from [<c010c26d>]
(show_stack+0x11/0x14)
[   27.879038] [<c010c26d>] (show_stack) from [<c0f42e5b>]
(dump_stack+0x8b/0xa0)
[   27.899374] [<c0f42e5b>] (dump_stack) from [<c031d8f7>]
(print_address_description.constprop.0+0x2b/0x360)
[   27.939249] [<c031d8f7>] (print_address_description.constprop.0) from
[<c031ddab>] (kasan_report+0x103/0x11c)
[   27.979769] [<c031ddab>] (kasan_report) from [<c010bddb>]
(save_trace+0xbf/0xf8)
[   28.000506] [<c010bddb>] (save_trace) from [<c010bd11>]
(walk_stackframe+0x19/0x24)
[   28.021501] [<c010bd11>] (walk_stackframe) from [<c010bf07>]
(__save_stack_trace+0xf3/0xf8)
[   28.042658] [<c010bf07>] (__save_stack_trace) from [<c01b8c4d>]
(stack_trace_save+0x75/0x8c)
[   28.063740] [<c01b8c4d>] (stack_trace_save) from [<c031d019>]
(kasan_save_stack+0x11/0x28)
[   28.084979] [<c031d019>] (kasan_save_stack) from [<c031d04d>]
(kasan_set_track+0x1d/0x20)
[   28.106135] [<c031d04d>] (kasan_set_track) from [<c031e461>]
(kasan_set_free_info+0x19/0x20)
[   28.127351] [<c031e461>] (kasan_set_free_info) from [<c031cfe5>]
(__kasan_slab_free+0xa5/0xc8)
[   28.148491] [<c031cfe5>] (__kasan_slab_free) from [<c0318b7f>]
(kfree+0x7b/0x374)
[   28.169910] [<c0318b7f>] (kfree) from [<c09bbe7f>] (udc_irq+0x477/0xe18)
[   28.191214] [<c09bbe7f>] (udc_irq) from [<c019cb09>]
(__handle_irq_event_percpu+0x71/0x2d4)
[   28.212693] [<c019cb09>] (__handle_irq_event_percpu) from
[<c019cde1>] (handle_irq_event_percpu+0x75/0xb8)
[   28.255076] [<c019cde1>] (handle_irq_event_percpu) from [<c019ce67>]
(handle_irq_event+0x43/0x64)
[   28.277174] [<c019ce67>] (handle_irq_event) from [<c01a1bbb>]
(handle_fasteoi_irq+0xcf/0x18c)
[   28.299436] [<c01a1bbb>] (handle_fasteoi_irq) from [<c019bd4b>]
(generic_handle_irq+0x3b/0x44)
[   28.321825] [<c019bd4b>] (generic_handle_irq) from [<c019c34b>]
(__handle_domain_irq+0x5f/0xa8)
[   28.344383] [<c019c34b>] (__handle_domain_irq) from [<c06b30cf>]
(gic_handle_irq+0x87/0x9c)
[   28.367176] [<c06b30cf>] (gic_handle_irq) from [<c0100b23>]
(__irq_svc+0x63/0xb0)
[   28.390118] Exception stack(0xc4dc6f58 to 0xc4dc6fa0)
[   28.413200] 6f40:
  c1fa88c4 00000000
[   28.436622] 6f60: c1fa88c4 00000000 c5557800 00000000 00000001
c5557808 00000001 c1fa88c0
[   28.460176] 6f80: 00000000 c466c000 b782c97b c4dc6fac c0bdcfa1
c0bdd51e 60070133 ffffffff
[   28.484070] [<c0100b23>] (__irq_svc) from [<c0bdd51e>]
(__qdisc_run+0x6d2/0x7b8)
[   28.508082] [<c0bdd51e>] (__qdisc_run) from [<c0100155>]
(ret_from_fork+0x11/0x1c)
[   28.532185] Exception stack(0xc4dc6ffc to 0xc4dc7044)
[   28.556578] 6fe0:
           00000000
[   28.581249] 7000: c1902d18 c4dc8000 00000000 00000000 00000003
00000000 00000000 00000001
[   28.605909] 7020: 41b58ab3 c1864c40 c0b94e6c 00000800 00000000
c2c01e00 00000001 c09bbe7f
[   28.630740] 7040: fffffff4

[   28.679636] The buggy address belongs to the page:
[   28.704480] page:bc50e6d8 refcount:0 mapcount:0 mapping:00000000
index:0x0 pfn:0x84dc7
[   28.729687] flags: 0x0()
[   28.754372] raw: 00000000 defa7000 defa7000 00000000 00000000
00000000 ffffffff 00000000
[   28.779394] raw: 00000000
[   28.804339] page dumped because: kasan: bad access detected

[   28.854326] addr c4dc7038 is located in stack of task
kworker/0:1H/124 at offset 24 in frame:
[   28.880073]  __dev_queue_xmit+0x0/0x9cc

[   28.931135] this frame has 4 objects:
[   28.956624]  [32, 36) 'rc'
[   28.956638]  [48, 52) 'to_free'
[   28.981922]  [64, 72) '_udphdr'
[   29.007038]  [96, 116) '_tcphdr'

[   29.081989] Memory state around the buggy address:
[   29.106884]  c4dc6f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   29.132106]  c4dc6f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   29.157134] >c4dc7000: 00 00 00 00 f1 f1 f1 f1 04 f2 04 f2 00 f2 f2 f2
[   29.181980]                                 ^
[   29.206867]  c4dc7080: 00 00 04 f3 f3 f3 f3 f3 00 00 00 00 00 00 00 00
[   29.231827]  c4dc7100: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 04 f3 f3 f3
[   29.257034]
==================================================================

