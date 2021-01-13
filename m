Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B1BC43381
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 02:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DBBC23343
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 02:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbhANCO3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 21:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729129AbhAMV2I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 16:28:08 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C855C061795
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 13:27:28 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id p14so4185467qke.6
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 13:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYfuGnLwArlinw5s1DodWez2H2suYhTdu1Oid0kJwRY=;
        b=r3hmvLs9ZA7yzltYa5GNNLkPnSiaItyhkoVfhKIlZJz/2W6WbPgNrVP0BKwaMhjzkV
         Zct5gPPx+smoEIxds+onaBFcJS9w/0Y+IC7kXubLEO23XygggLoD8QeEsUSvcERMpNvN
         Ndr2HxPuUfsbt/x60f+uRCqxF6K+iSl2PLCFCtbNxPTxIr/H600n1R9pDWwj5dD/zFqk
         +phsNj/SRxSDFH2qOx5s+jKvYLwaP2zYPUEDW93wZYzM14fCHyORIQSCUqc1kqZeLPKI
         kQQ/r+utOYaq7vCHtIMxblDxNnkDo+rZlvdc8ekJsiSynF7YavUf3CT6PTW705KbcyKt
         Ri2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYfuGnLwArlinw5s1DodWez2H2suYhTdu1Oid0kJwRY=;
        b=VXs9DExvYE0vISmD6kHESyxxVxcjfRv/Gw8pK1VybiejBn38Q23x0C+rauQgac52U0
         kTudgdca1vWiXQp3od7jwLxPmlTDoR9QCcsPje2+42tWE40sYYV66aB7bjIHYJl+uucf
         ufNjlXfWbtKHVAKDjMrtEessGkQBUEHKtR7hNL8DUFm98y0wR5bsBF2o6L/w6BOmkyWC
         QkXs+Ppdl1m82BzyBtnfpFtqeLFSiNFXMGtSY5eX/h9BakQu33LVmB+rLgKB09p9bUU/
         fZ7BCfcWzfqf81kEAdPVTyO+IGqSx+L/WWcQ0QJg3daEMnuT6btvrq84h+nBsCwVxzqZ
         KVrA==
X-Gm-Message-State: AOAM531OWYIHQt7SFrdZkKgWyFzvhXs+Icfo3JdWEgRvTLEcGiJa9MMI
        rtvR1BSh8OSTkeewOViMoWiPSwn798jBarZGTIXQ2A==
X-Google-Smtp-Source: ABdhPJwORp3tKryADDf32VsnwiJuvC7YfWezYSI/YhfnKwkfnJ1GnNGeoco2Zd2VtFjdyt4NVkfZ9noLdQmqmI5qGGM=
X-Received: by 2002:a25:6604:: with SMTP id a4mr6435438ybc.412.1610573247136;
 Wed, 13 Jan 2021 13:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com> <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com>
In-Reply-To: <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 13 Jan 2021 13:26:51 -0800
Message-ID: <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 13, 2021 at 3:30 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 18/12/2020 03:16, Saravana Kannan wrote:
> > As discussed in LPC 2020, cyclic dependencies in firmware that couldn't
> > be broken using logic was one of the last remaining reasons
> > fw_devlink=on couldn't be set by default.
> >
> > This series changes fw_devlink so that when a cyclic dependency is found
> > in firmware, the links between those devices fallback to permissive mode
> > behavior. This way, the rest of the system still benefits from
> > fw_devlink, but the ambiguous cases fallback to permissive mode.
> >
> > Setting fw_devlink=on by default brings a bunch of benefits (currently,
> > only for systems with device tree firmware):
> > * Significantly cuts down deferred probes.
> > * Device probe is effectively attempted in graph order.
> > * Makes it much easier to load drivers as modules without having to
> >   worry about functional dependencies between modules (depmod is still
> >   needed for symbol dependencies).
>
>
> One issue we have come across with this is the of_mdio.c driver. On
> Tegra194 Jetson Xavier I am seeing the following ...
>
> boot: logs: [       4.194791] WARNING KERN WARNING: CPU: 0 PID: 1 at /dvs/git/dirty/git-master_l4t-upstream/kernel/drivers/base/core.c:1189 device_links_driver_bound+0x240/0x260
> boot: logs: [       4.207683] WARNING KERN Modules linked in:
> boot: logs: [       4.210691] WARNING KERN CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc3-next-20210112-gdf869cab4b35 #1
> boot: logs: [       4.219221] WARNING KERN Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> boot: logs: [       4.225628] WARNING KERN pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
> boot: logs: [       4.231542] WARNING KERN pc : device_links_driver_bound+0x240/0x260
> boot: logs: [       4.236587] WARNING KERN lr : device_links_driver_bound+0xf8/0x260
> boot: logs: [       4.241560] WARNING KERN sp : ffff800011f4b980
> boot: logs: [       4.244819] WARNING KERN x29: ffff800011f4b980 x28: ffff00008208a0a0
> boot: logs: [       4.250051] WARNING KERN x27: ffff00008208a080 x26: 00000000ffffffff
> boot: logs: [       4.255271] WARNING KERN x25: 0000000000000003 x24: ffff800011b99000
> boot: logs: [       4.260489] WARNING KERN x23: 0000000000000001 x22: ffff800011df14f0
> boot: logs: [       4.265706] WARNING KERN x21: ffff800011f4b9f8 x20: ffff800011df1000
> boot: logs: [       4.270934] WARNING KERN x19: ffff00008208a000 x18: 0000000000000005
> boot: logs: [       4.276166] WARNING KERN x17: 0000000000000007 x16: 0000000000000001
> boot: logs: [       4.281382] WARNING KERN x15: ffff000080030c90 x14: ffff0000805c9df8
> boot: logs: [       4.286618] WARNING KERN x13: 0000000000000000 x12: ffff000080030c90
> boot: logs: [       4.291847] WARNING KERN x11: ffff0000805c9da8 x10: 0000000000000040
> boot: logs: [       4.297061] WARNING KERN x9 : ffff000080030c98 x8 : 0000000000000000
> boot: logs: [       4.302291] WARNING KERN x7 : 0000000000000009 x6 : 0000000000000000
> boot: logs: [       4.307509] WARNING KERN x5 : ffff000080100000 x4 : 0000000000000000
> boot: logs: [       4.312739] WARNING KERN x3 : ffff800011df1e38 x2 : ffff000080908c10
> boot: logs: [       4.317956] WARNING KERN x1 : 0000000000000001 x0 : ffff0000809ca400
> boot: logs: [       4.323183] WARNING KERN Call trace:
> boot: logs: [       4.325593] WARNING KERN  device_links_driver_bound+0x240/0x260
> boot: logs: [       4.330301] WARNING KERN  driver_bound+0x70/0xd0
> boot: logs: [       4.333740] WARNING KERN  device_bind_driver+0x50/0x60
> boot: logs: [       4.337671] WARNING KERN  phy_attach_direct+0x258/0x2e0
> boot: logs: [       4.341718] WARNING KERN  phylink_of_phy_connect+0x7c/0x140
> boot: logs: [       4.346081] WARNING KERN  stmmac_open+0xb04/0xc70
> boot: logs: [       4.349612] WARNING KERN  __dev_open+0xe0/0x190
> boot: logs: [       4.352972] WARNING KERN  __dev_change_flags+0x16c/0x1b8
> boot: logs: [       4.357081] WARNING KERN  dev_change_flags+0x20/0x60
> boot: logs: [       4.360856] WARNING KERN  ip_auto_config+0x2a0/0xfe8
> boot: logs: [       4.364633] WARNING KERN  do_one_initcall+0x58/0x1b8
> boot: logs: [       4.368405] WARNING KERN  kernel_init_freeable+0x1ec/0x240
> boot: logs: [       4.372698] WARNING KERN  kernel_init+0x10/0x110
> boot: logs: [       4.376130] WARNING KERN  ret_from_fork+0x10/0x18
>
>
> So looking at this change does this mean that the of_mdio needs to be
> converted to a proper driver?

Sorry, there's not enough context in this log for me to tell how this
is even related to of_mdio.c. My guess is this is related to network
stack directly calling device_bind_driver() and not updating device
link state correctly. See what device_links_check_suppliers() does in
the normal path. I think I know which warning this is, but can you
check your tree and tell me the code you see in
drivers/base/core.c:1189 ?

Also, can you give me a few more lines above and below this log and
also explain why you think this is related to of_mdio.c? Where is the
DT file for this board in case I need to look at it? And where is this
phy node defined in DT?

If there's an easy way to convert it to a proper driver, that's always
better than calling into driver core in a piecemeal fashion.

> I would have thought that this will be
> seen on several platforms.

I'm surprised you are seeing this issue only now. I'd have expected it
to have happened even without this series.

-Saravana
