Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023CFC4361A
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Dec 2020 17:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B873922EBD
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Dec 2020 17:41:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbgLERjx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Dec 2020 12:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgLERic (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Dec 2020 12:38:32 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838CBC094270
        for <linux-tegra@vger.kernel.org>; Sat,  5 Dec 2020 09:12:54 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id q13so12096226lfr.10
        for <linux-tegra@vger.kernel.org>; Sat, 05 Dec 2020 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mxdC9nJ3E8UgLvs3Rk9lCytw5k8wmjBa4iF3dwQ+Rt4=;
        b=sHK3k8AdCX6k4jiRY6SdoiiARh2Zojtn832+mXeJ0+ISh9pUUjMpkCuFFfaNYYM2Af
         qyzhEmxNaXqeRXtsVHpYi+mSQqzbqjnTMK1BnWij1R7l+fAuk9LCDMqFwG2BZK9mPItX
         AZcJ7Mc9a5EYpaXbyoxZeT6dd6h3FFLqRycuh40c1iPF9/6E1p7nyP2RSpamNpd2dUaY
         RmfdzuVIaLDHdkbIGuhM8Fw1NQiEf3r9WOcJGJe2e4k7ysH5+YXPylXelFet7SAn4VAH
         +GEQRXVItSkJug/v1RnpvsxyD04y99sgVPJALAGyxu4FWHy6vlP1ZKgy9JbeN9ldKlcK
         hZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mxdC9nJ3E8UgLvs3Rk9lCytw5k8wmjBa4iF3dwQ+Rt4=;
        b=D1UasxjtkxUpZjFaRzip5OrikT5XqIvx+Klk0hlNCYWX4ff+0lPchHDtN+MVbFiifv
         gfv4asQGm3nhjHwI0lOpHSy6N8YofSfluDT4pQcR46jeKrNayCffIJh2az4qtkoE2ttF
         HY+aMV5KDN7xDLjZp/VYcLWefqJYJtP6aFoVDPWMWZksMb0O0Dr7viY3nBDGJTrWfbca
         tIeK/S9npP8RCT/gvo8kfrBVeMEzCKnOfuaxGFAvl5E9nl6V79EYn41etGibZFptS5xg
         nO5vgMe66owviFkSljPgZFWANf4m8m/k1n0WITl7BQJoD2uq2dJ8GrqAVFGe1lufJuK+
         g8Xw==
X-Gm-Message-State: AOAM533j401KgKFuka6z5MlmcCx2w8sdmPH2pyb6eFco0WpZOV7iWOKZ
        462V/1y9cAc+RQdCnQuOHxhTkMkC6KJlRaFV2W9MCg==
X-Google-Smtp-Source: ABdhPJwHyBZ83Wft1RikDbPvXssq7kSbQwSzdhcpRDcjx19c6pe0HapIIBpSbImoJIVYmIj/THSx9nQyFBYoAl2g8Vw=
X-Received: by 2002:ac2:530b:: with SMTP id c11mr5092734lfh.185.1607188372824;
 Sat, 05 Dec 2020 09:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20201203152311.5272-1-carver4lio@163.com> <a5bc444ec40a2248009d0894fda61b822d030235.camel@redhat.com>
 <CGME20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c@eucas1p1.samsung.com>
 <adc36428-05eb-f885-9394-080cc805818f@samsung.com> <3d709122-0364-5bca-9247-3f212096b389@nvidia.com>
 <CADYN=9+nE=n4cXb6gDKmQqfkn97HoFShKGSpqVise=XR-aGtVw@mail.gmail.com>
In-Reply-To: <CADYN=9+nE=n4cXb6gDKmQqfkn97HoFShKGSpqVise=XR-aGtVw@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Sat, 5 Dec 2020 18:12:42 +0100
Message-ID: <CADYN=9KDbLq5Xbvr-ZtbF2ZMEjatLab8wqzN1hTijGWnddD8-A@mail.gmail.com>
Subject: Re: [PATCH] mm/memblock:use a more appropriate order calculation when
 free memblock pages
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Qian Cai <qcai@redhat.com>, carver4lio@163.com,
        rppt@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hailong Liu <liu.hailong6@zte.com.cn>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 5 Dec 2020 at 18:09, Anders Roxell <anders.roxell@linaro.org> wrote:
>
> On Fri, 4 Dec 2020 at 18:44, Jon Hunter <jonathanh@nvidia.com> wrote:
> >
> >
> > On 04/12/2020 16:07, Marek Szyprowski wrote:
> > > Hi All,
> > >
> > > On 04.12.2020 14:42, Qian Cai wrote:
> > >> On Thu, 2020-12-03 at 23:23 +0800, carver4lio@163.com wrote:
> > >>> From: Hailong Liu <liu.hailong6@zte.com.cn>
> > >>>
> > >>> When system in the booting stage, pages span from [start, end] of a memblock
> > >>> are freed to buddy in a order as large as possible (less than MAX_ORDER) at
> > >>> first, then decrease gradually to a proper order(less than end) in a loop.
> > >>>
> > >>> However, *min(MAX_ORDER - 1UL, __ffs(start))* can not get the largest order
> > >>> in some cases.
> > >>> Instead, *__ffs(end - start)* may be more appropriate and meaningful.
> > >>>
> > >>> Signed-off-by: Hailong Liu <liu.hailong6@zte.com.cn>
> > >> Reverting this commit on the top of today's linux-next fixed boot crashes on
> > >> multiple NUMA systems.
> > >
> > > I confirm. Reverting commit 4df001639c84 ("mm/memblock: use a more
> > > appropriate order calculation when free memblock pages") on top of linux
> > > next-20201204 fixed booting of my ARM32bit test systems.
> >
> >
> > FWIW, I also confirm that this is causing several 32-bit Tegra platforms
> > to crash on boot and reverting this fixes the problem.
>
> I had the same experience on an arm64 system.

This is the log that I see:

[    0.000000][    T0] percpu: Embedded 507 pages/cpu s2036568 r8192
d31912 u2076672
[    0.000000][    T0] Detected VIPT I-cache on CPU0
[    0.000000][    T0] CPU features: detected: ARM erratum 845719
[    0.000000][    T0] CPU features: GIC system register CPU interface
present but disabled by higher exception level
[    0.000000][    T0] CPU features: kernel page table isolation
forced OFF by kpti command line option
[    0.000000][    T0] Built 1 zonelists, mobility grouping on.  Total
pages: 516096
[    0.000000][    T0] Policy zone: DMA
[    0.000000][    T0] Kernel command line: root=/dev/root
rootfstype=9p rootflags=trans=virtio console=ttyAMA0,38400n8
earlycon=pl011,0x9000000 initcall_debug softlockup_panic=0
security=none kpti=no
[    0.000000][    T0] Dentry cache hash table entries: 262144 (order:
9, 2097152 bytes, linear)
[    0.000000][    T0] Inode-cache hash table entries: 131072 (order:
8, 1048576 bytes, linear)
[    0.000000][    T0] mem auto-init: stack:off, heap alloc:on, heap free:on
[    0.000000][    T0] mem auto-init: clearing system memory may take
some time...
[    0.000000][    T0] page:(____ptrval____) refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x40010
[    0.000000][    T0] flags: 0x1fffe0000000000()
[    0.000000][    T0] raw: 01fffe0000000000 fffffc0000000408
fffffc0000000408 0000000000000000
[    0.000000][    T0] raw: 0000000000000000 0000000000000000
00000000ffffffff 0000000000000000
[    0.000000][    T0] page dumped because: VM_BUG_ON_PAGE(pfn & ((1
<< order) - 1))
[    0.000000][    T0] ------------[ cut here ]------------
[    0.000000][    T0] kernel BUG at mm/page_alloc.c:1015!
[    0.000000][    T0] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted
5.10.0-rc6-next-20201204-00010-g7f8e9106f747-dirty #1
[    0.000000][    T0] Hardware name: linux,dummy-virt (DT)
[    0.000000][    T0] pstate: 40400085 (nZcv daIf +PAN -UAO -TCO BTYPE=--)
[    0.000000][    T0] pc : __free_one_page+0x14c/0x700
[    0.000000][    T0] lr : __free_one_page+0x14c/0x700
[    0.000000][    T0] sp : ffff800013fd7c10
[    0.000000][    T0] x29: ffff800013fd7c10 x28: 0000000000000000
[    0.000000][    T0] x27: 0000000000000200 x26: 0000000000000001
[    0.000000][    T0] x25: 0000000000000000 x24: 0000000000000009
[    0.000000][    T0] x23: ffff00007dbfbd40 x22: fffffc0000000400
[    0.000000][    T0] x21: 0000000000040010 x20: 0000000000000009
[    0.000000][    T0] x19: 00000000000001ff x18: 0000000000000000
[    0.000000][    T0] x17: 0000000000000000 x16: 0000000000000000
[    0.000000][    T0] x15: 0000000000000000 x14: 0000000000000000
[    0.000000][    T0] x13: 0000000000000000 x12: ffff70000281852d
[    0.000000][    T0] x11: 1ffff0000281852c x10: ffff70000281852c
[    0.000000][    T0] x9 : dfff800000000000 x8 : ffff8000140c2960
[    0.000000][    T0] x7 : 0000000000000001 x6 : 00008ffffd7e7ad4
[    0.000000][    T0] x5 : 0000000000000000 x4 : 0000000000000000
[    0.000000][    T0] x3 : ffff80001400ab00 x2 : 0000000000000000
[    0.000000][    T0] x1 : 0000000000000000 x0 : 0000000000000000
[    0.000000][    T0] Call trace:
[    0.000000][    T0]  __free_one_page+0x14c/0x700
[    0.000000][    T0]  free_one_page+0xf0/0x120
[    0.000000][    T0]  __free_pages_ok+0x720/0x780
[    0.000000][    T0]  __free_pages_core+0x240/0x280
[    0.000000][    T0]  memblock_free_pages+0x40/0x50
[    0.000000][    T0]  free_low_memory_core_early+0x230/0x2f0
[    0.000000][    T0]  memblock_free_all+0x28/0x58
[    0.000000][    T0]  mem_init+0xf0/0x10c
[    0.000000][    T0]  mm_init+0xb4/0xe8
[    0.000000][    T0]  start_kernel+0x1e0/0x520
[    0.000000][    T0] Code: 913a8021 aa1603e0 91030021 97fe7ec6 (d4210000)
[    0.000000][    T0] random: get_random_bytes called from
oops_exit+0x50/0xa0 with crng_init=0
[    0.000000][    T0] ---[ end trace 0000000000000000 ]---
[    0.000000][    T0] Kernel panic - not syncing: Oops - BUG: Fatal exception
[    0.000000][    T0] ---[ end Kernel panic - not syncing: Oops -
BUG: Fatal exception ]---

Cheers,
Anders
