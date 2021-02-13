Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91ECC433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 13 Feb 2021 18:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95B7564E4F
	for <linux-tegra@archiver.kernel.org>; Sat, 13 Feb 2021 18:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhBMSzN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 13 Feb 2021 13:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhBMSzG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 13 Feb 2021 13:55:06 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAFFC061756;
        Sat, 13 Feb 2021 10:54:26 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id x10so657658oor.3;
        Sat, 13 Feb 2021 10:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yEKNNEKnkLgSvJYomQ7ArLDNCQcwq8od634EP/lBxr0=;
        b=SZtD//sERVc3we2PKNfu8kltMbidBi5bAE0A5Ix1j7I0rJaF5FEBdzK95uOvFsgwGQ
         zpSK4j+G6io3FpST18xzqm1+v0k2gorvXfBPy+SQCTl9Yp834ziTnHWbEUCUsRKtolFz
         MycgquFZpxkoRrPo8N2Hazq3k57gCEoFrFx2eVVKXdH5l3xSrrTni3ezvDt0t11LYF7p
         0VxMF4VVaVGa+yC4pU1NTq8Fm0ee0xLjLXrNbkyklUxmMnS35SHiCNhCqzLJkbOrDC1y
         e81Dsq+Ua+sE6PxT0djFRWaABrgwsVxpqRFPn4dV9NwbBeK53HfoZvGZwRgJ43otvew7
         F0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=yEKNNEKnkLgSvJYomQ7ArLDNCQcwq8od634EP/lBxr0=;
        b=nfNhKhhzFqHmV0QXY4ZJRtb9fVoLi2YWtT/VB3S3XTDl8KEvEHbVVyGqAwlEyRnto/
         xaWr3hmcwNGB7ro46+9skGGF+vVcxuDvAofYiOjDEjVaEXMXRapzjyB5m6hzU0n4CHkD
         gG4FHOct6l8Vx4vUUObh01kmZIwkseTkapHZFT9W0EpMXFeLGSmNk1NxER7tHzcI0iaz
         Qdy1FEA5YQwL+Q71vwZbU8wXggAW18j2sLIj11pzxpEsqEN94GdHV97NwFBXXOve/h5N
         MJzA8F6puaSkcCY3m2GPe+R//AP0f/g8tOtXoG+xQ765trWCcmoHddZVVk/kUZ+buCy7
         ES3Q==
X-Gm-Message-State: AOAM532UPl2XBYmS1Sqrz9w2XiVGbpAifbRwoJYfjCMbAeViZyze9W+I
        VXBR+5++eKx44IJcW7Pt5uw=
X-Google-Smtp-Source: ABdhPJzhjErbLWLdvSj9t/4+cZdxLj8EJ162VROcMzEuK78/ZJOG8+mKrG+EpKk4f7KRbR2EjCEa6w==
X-Received: by 2002:a4a:4c17:: with SMTP id a23mr5940532oob.16.1613242463925;
        Sat, 13 Feb 2021 10:54:23 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f1sm1556012otq.10.2021.02.13.10.54.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Feb 2021 10:54:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 13 Feb 2021 10:54:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, kernel-team@android.com,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for
 interrupts
Message-ID: <20210213185422.GA195733@roeck-us.net>
References: <20210121225712.1118239-1-saravanak@google.com>
 <20210121225712.1118239-3-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121225712.1118239-3-saravanak@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Thu, Jan 21, 2021 at 02:57:12PM -0800, Saravana Kannan wrote:
> This allows fw_devlink to create device links between consumers of an
> interrupt and the supplier of the interrupt.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

This patch causes all ppc64:powernv qemu emulations to fail.
The problem is always the same: The root file system can not be mounted.

Example:

[   14.245672][    T1] VFS: Cannot open root device "sda" or unknown-block(0,0): error -6
[   14.246063][    T1] Please append a correct "root=" boot option; here are the available partitions:
[   14.246609][    T1] 1f00          131072 mtdblock0
[   14.246648][    T1]  (driver?)
[   14.247137][    T1] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[   14.247631][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210212 #1
[   14.248166][    T1] Call Trace:
[   14.248344][    T1] [c000000002c07a70] [c0000000008f052c] dump_stack+0x100/0x174 (unreliable)
[   14.248780][    T1] [c000000002c07ab0] [c00000000010d0e0] panic+0x190/0x450
[   14.249097][    T1] [c000000002c07b50] [c0000000014d1af8] mount_block_root+0x320/0x430
[   14.249442][    T1] [c000000002c07c50] [c0000000014d1e64] prepare_namespace+0x1b0/0x204
[   14.249798][    T1] [c000000002c07cc0] [c0000000014d1544] kernel_init_freeable+0x3dc/0x438
[   14.250145][    T1] [c000000002c07da0] [c000000000012b7c] kernel_init+0x2c/0x170
[   14.250466][    T1] [c000000002c07e10] [c00000000000d56c] ret_from_kernel_thread+0x5c/0x70
[   28.068945385,5] OPAL: Reboot request...

Another:

[   14.273398][    T1] md: Autodetecting RAID arrays.
[   14.273665][    T1] md: autorun ...
[   14.273860][    T1] md: ... autorun DONE.
[   14.275078][    T1] Waiting for root device /dev/mmcblk0...

[ waits until terminated ]

Key difference seems to be that PCI devices are no longer instantiated
with this patch applied. Specifically, I see

[    1.153780][    T1] pci 0005:01     : [PE# fd] Setting up window#0 0..7fffffff pg=10000^M
[    1.154475][    T1] pci 0005:01     : [PE# fd] Enabling 64-bit DMA bypass^M
[    1.155749][    T1] pci 0005:01:00.0: Adding to iommu group 0^M
[    1.160543][    T1] pci 0005:00:00.0: enabling device (0105 -> 0107)^M

in both cases, but (exmple nvme) I don't see

[   13.520561][   T11] nvme nvme0: pci function 0005:01:00.0^M
[   13.521747][   T45] nvme 0005:01:00.0: enabling device (0100 -> 0102)^M

after this patch has been applied.

Reverting th patch plus its fix resolves the problem.

Bisect log attached.

Guenter

---
# bad: [07f7e57c63aaa2afb4ea31edef05e08699a63a00] Add linux-next specific files for 20210212
# good: [92bf22614b21a2706f4993b278017e437f7785b3] Linux 5.11-rc7
git bisect start 'HEAD' 'v5.11-rc7'
# good: [987d576a592082b8e0e499990236f49ad655f5dc] Merge remote-tracking branch 'crypto/master'
git bisect good 987d576a592082b8e0e499990236f49ad655f5dc
# good: [e254726a51e0440c05eb4606215772c34b77a53f] Merge remote-tracking branch 'spi/for-next'
git bisect good e254726a51e0440c05eb4606215772c34b77a53f
# bad: [309b7dce497b1ce820b2afb13a19b0ad39b23a4a] Merge remote-tracking branch 'char-misc/char-misc-next'
git bisect bad 309b7dce497b1ce820b2afb13a19b0ad39b23a4a
# good: [5c45f9ce2ad5c4abf79baf114e42620da77c84fe] Merge remote-tracking branch 'chrome-platform/for-next'
git bisect good 5c45f9ce2ad5c4abf79baf114e42620da77c84fe
# bad: [b45d849cd57bf11d1824f68d92404ceea1293886] Merge remote-tracking branch 'usb/usb-next'
git bisect bad b45d849cd57bf11d1824f68d92404ceea1293886
# good: [89451aabea5f91a6c1b6dc4c52cac4caffecbc8a] Merge tag 'tag-ib-usb-typec-chrome-platform-cros-ec-typec-clear-pd-discovery-events-for-5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux into usb-next
git bisect good 89451aabea5f91a6c1b6dc4c52cac4caffecbc8a
# good: [43861d29c0810a70792bf69d37482efb7bb6677d] USB: quirks: sort quirk entries
git bisect good 43861d29c0810a70792bf69d37482efb7bb6677d
# good: [08f4a6b903369ee0147b557931b7075c17e015f6] dt-bindings: usb: dwc3: add description for rk3328
git bisect good 08f4a6b903369ee0147b557931b7075c17e015f6
# bad: [1753c4d1edbcf1b35e585ff76777d09434344c8f] of: property: Don't add links to absent suppliers
git bisect bad 1753c4d1edbcf1b35e585ff76777d09434344c8f
# good: [072a51be8ecfb84e15b27b7f80a601560f386788] Merge 5.11-rc5 into driver-core-next
git bisect good 072a51be8ecfb84e15b27b7f80a601560f386788
# bad: [4731210c09f5977300f439b6c56ba220c65b2348] gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default
git bisect bad 4731210c09f5977300f439b6c56ba220c65b2348
# bad: [4044b2fcfb2048a256529ecbd869b43713982006] drivers: base: change 'driver_create_groups' to 'driver_add_groups' in printk
git bisect bad 4044b2fcfb2048a256529ecbd869b43713982006
# bad: [4104ca776ba38d81bd6610256d3b0d7e6a058067] of: property: Add fw_devlink support for interrupts
git bisect bad 4104ca776ba38d81bd6610256d3b0d7e6a058067
# good: [e13f5b7a130f7b6d4d34be27a87393890b5ee2ba] of: property: Add fw_devlink support for "gpio" and "gpios" binding
git bisect good e13f5b7a130f7b6d4d34be27a87393890b5ee2ba
# first bad commit: [4104ca776ba38d81bd6610256d3b0d7e6a058067] of: property: Add fw_devlink support for interrupts
