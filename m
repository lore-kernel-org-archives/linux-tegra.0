Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C01C433E0
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Feb 2021 21:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A927164E56
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Feb 2021 21:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhBNVOI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Feb 2021 16:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhBNVOE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Feb 2021 16:14:04 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCA4C0613D6
        for <linux-tegra@vger.kernel.org>; Sun, 14 Feb 2021 13:13:24 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id p193so5292164yba.4
        for <linux-tegra@vger.kernel.org>; Sun, 14 Feb 2021 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WvjJzLdrfTNVytek6OA/yzvCxUAi6JyBGqJZAjWc790=;
        b=BPVv9GCW9JBBTThvFGFu80shYejZoNiIxs5sFBVAkxMPWhdr8AYvAxiSzhcvjD3//I
         QvJ7QHHWLoCVn9FfNc8DQpxsbeQp/1xys1AMcIPV43ijiT2d/lSHsMrgLIuqWgugQlKr
         8h6AnxL81n7PN3aAouTYt3Qrx36qy6jLtRUYoH5FcRCgZQ4BYnkVNp9aLDF2i+Vx/976
         LOSjGKg+ZRU1T/svdqYKcM0W+BZNbSnWh4k+dcYzswZh5xFZ+4GWFH7jiyMYtf4GLtd5
         53z0LfVL5jhk2qSj951kL3wzx514c+EWrRD/7RRVzN7DOhT0ywea5ezFlrP+7P4HZ3UH
         29Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WvjJzLdrfTNVytek6OA/yzvCxUAi6JyBGqJZAjWc790=;
        b=YrWT0q9c9BBeZSKY1zN0OkvV5t5Z9uB62wTAZQ5cHKCWqpUaNNxxPiGTBJIVX7nzv3
         Yxqb1Wu1LdK4bwEG+Vu1t0US5k/Q/COE/KlPyY8KxS6XG0ObqQh+PHfR4q5GmuMXmw8J
         67Tek96FhNKXOaZA9xMbQxRtWvQVvR77fP3K7m4rJGu5QyQzDleTq10iLjK+05w7AQqX
         73m7cTAOeO7+NJ5/SxBDMGwDLhLTmEm0uLjIuo2hnETPTHUSvvc6dqhwP0RFrSiC0fIM
         GiMLyTtDaC68GYiEZi/Naj69db23GJ1bYZ66cEhxGuKaZgn3lr3mL02ZqqP9eDnJeGvs
         aC7Q==
X-Gm-Message-State: AOAM531C7mtPXe3TjME5DJBRlwMcHVaku0AUVtJnGRczjPW0V5SVmC1E
        5PL1WSEmiJnOGVHuudoSHLYaxZ5A3XT5x0C1Ot2VMQ==
X-Google-Smtp-Source: ABdhPJyUsPIdF34SP1gQ0z27oD+oRK3myuuGBxHGMDWZh5CzBhPa1mrUg68HjExfJcg9REyzdOFtzEe8DEo8FkV4guE=
X-Received: by 2002:a25:aa43:: with SMTP id s61mr19670000ybi.32.1613337203292;
 Sun, 14 Feb 2021 13:13:23 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <20210121225712.1118239-3-saravanak@google.com> <20210213185422.GA195733@roeck-us.net>
In-Reply-To: <20210213185422.GA195733@roeck-us.net>
From:   Saravana Kannan <saravanak@google.com>
Date:   Sun, 14 Feb 2021 13:12:47 -0800
Message-ID: <CAGETcx_RpG45Fwhty1Uj34Mv01qkH5vFv0J6jVtJgTBFQinOBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Feb 13, 2021 at 10:54 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Thu, Jan 21, 2021 at 02:57:12PM -0800, Saravana Kannan wrote:
> > This allows fw_devlink to create device links between consumers of an
> > interrupt and the supplier of the interrupt.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> This patch causes all ppc64:powernv qemu emulations to fail.
> The problem is always the same: The root file system can not be mounted.
>
> Example:
>
> [   14.245672][    T1] VFS: Cannot open root device "sda" or unknown-block(0,0): error -6
> [   14.246063][    T1] Please append a correct "root=" boot option; here are the available partitions:
> [   14.246609][    T1] 1f00          131072 mtdblock0
> [   14.246648][    T1]  (driver?)
> [   14.247137][    T1] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> [   14.247631][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc7-next-20210212 #1
> [   14.248166][    T1] Call Trace:
> [   14.248344][    T1] [c000000002c07a70] [c0000000008f052c] dump_stack+0x100/0x174 (unreliable)
> [   14.248780][    T1] [c000000002c07ab0] [c00000000010d0e0] panic+0x190/0x450
> [   14.249097][    T1] [c000000002c07b50] [c0000000014d1af8] mount_block_root+0x320/0x430
> [   14.249442][    T1] [c000000002c07c50] [c0000000014d1e64] prepare_namespace+0x1b0/0x204
> [   14.249798][    T1] [c000000002c07cc0] [c0000000014d1544] kernel_init_freeable+0x3dc/0x438
> [   14.250145][    T1] [c000000002c07da0] [c000000000012b7c] kernel_init+0x2c/0x170
> [   14.250466][    T1] [c000000002c07e10] [c00000000000d56c] ret_from_kernel_thread+0x5c/0x70
> [   28.068945385,5] OPAL: Reboot request...
>
> Another:
>
> [   14.273398][    T1] md: Autodetecting RAID arrays.
> [   14.273665][    T1] md: autorun ...
> [   14.273860][    T1] md: ... autorun DONE.
> [   14.275078][    T1] Waiting for root device /dev/mmcblk0...
>
> [ waits until terminated ]
>
> Key difference seems to be that PCI devices are no longer instantiated
> with this patch applied. Specifically, I see
>
> [    1.153780][    T1] pci 0005:01     : [PE# fd] Setting up window#0 0..7fffffff pg=10000^M
> [    1.154475][    T1] pci 0005:01     : [PE# fd] Enabling 64-bit DMA bypass^M
> [    1.155749][    T1] pci 0005:01:00.0: Adding to iommu group 0^M
> [    1.160543][    T1] pci 0005:00:00.0: enabling device (0105 -> 0107)^M
>
> in both cases, but (exmple nvme) I don't see
>
> [   13.520561][   T11] nvme nvme0: pci function 0005:01:00.0^M
> [   13.521747][   T45] nvme 0005:01:00.0: enabling device (0100 -> 0102)^M
>
> after this patch has been applied.
>
> Reverting th patch plus its fix resolves the problem.
>
> Bisect log attached.

Hi Guenter,

Thanks for the report.

Can you please give me the following details:
* The DTS file for the board (not the SoC).
* A boot log with the logs enabled in device_links_check_suppliers()
and device_link_add()

That should help me debug this.

Rob,

Looks like Guenter has this patch[1] too. What PPC specific IRQ hack
am I missing? Any ideas?

[1] - https://lore.kernel.org/lkml/20210209010439.3529036-1-saravanak@google.com/

Thanks,
Saravana
