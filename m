Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D29CC43217
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 02:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ADE3235F8
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 02:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbhAMVbk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 16:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbhAMVaf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 16:30:35 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48E9C061786
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 13:29:53 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id 143so4165491qke.10
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 13:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VExiYHmqwPXooPsM00PEuTMdc848Er2iS47/e4Rre3U=;
        b=rLrEeqZEMYBFkB57NfvTrRBtpce1M96aDR8g8DXBcOnFyUdpuKgZXYOOC/IYPOMC29
         bxT+rU7I4Zop56nmAXg0Mjgv0f99gu7ExCKbazp0zDj0nuSkiTTFx8+NPw4a3Ok/Hzbn
         yJhVBZIriApPRBkODPNnwAKqACAKbLpunk0smw3qy9pLAfE1i76Ambu7EGM+lkJZg1zI
         esM5GCf7aTeYeAvSUKyzb/xI11X5UXZjAdYfN9sKefFpkDNIxnNla8+8eKw9OZc0kJFe
         2GWWv6ECoDhkiIoeTCNcEMj3jKfwMq/Fw+gHYlIJoZdBijxtjbKC025/M19yzyWZUoN8
         jIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VExiYHmqwPXooPsM00PEuTMdc848Er2iS47/e4Rre3U=;
        b=aXYXfC0J4pcsrUfCa3LOSMnpabrQ+HRIOXcxh7NkQEO+DwcfLoZ/2QMCjqRfMnvYbl
         rwNvPZJf7xXUN+Nhnf+8WAPL6SlzTzsKsja8IL/xblEN3gT3ou1NsCAEeKi07JRILFJC
         4a/e5AdButMaggk/9EdojbwMGI4Rn5Z5I6fnK4IzPsHNzb8iVyg/f2C/wUD6jSmcTN6b
         rMVVMnwhuxzPXnwBviVFHynxM0VmjExHQqd+M+ASC7KlWRkKIjDF1uKBWs/J1RBQjEwG
         lkgZpAyL6v5cLHmQGqFnHZTA2CQOQO+7yXp2YuJzsHdQNZNgjE7JGCIdtS8sZ1se+xqf
         rljQ==
X-Gm-Message-State: AOAM531BOUms0324yQ2YNtIcLOiNod7AVYQHV+pAqFGLGU69sh0Q7iCj
        PcnIkdmQ/1l0aJcVeaaTUrhtjMhs6KQ9W9WMgMAXKg==
X-Google-Smtp-Source: ABdhPJxuYYjsMGPxY/P1Gyj3lPeICRhxkp0YFDfzhEzob3rW6ao/fMgu2IlLIeHccNoFEzd9z7gPTfcTSUSL2lIADVE=
X-Received: by 2002:a25:d7d7:: with SMTP id o206mr6177287ybg.228.1610573392718;
 Wed, 13 Jan 2021 13:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <X/dpkgTnUk+inKHK@kroah.com> <e28e1f38d87c12a3c714a6573beba6e1@kernel.org> <ba2fcbfb-d714-2f73-3bd0-962f49363b62@nvidia.com>
In-Reply-To: <ba2fcbfb-d714-2f73-3bd0-962f49363b62@nvidia.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 13 Jan 2021 13:29:16 -0800
Message-ID: <CAGETcx8pdPnH1ndOCoi7Qyz8DDshCfMTzDLQM=oEaCjyds9reA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 13, 2021 at 7:27 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 13/01/2021 11:11, Marc Zyngier wrote:
> > On 2021-01-07 20:05, Greg Kroah-Hartman wrote:
> >> On Thu, Dec 17, 2020 at 07:16:58PM -0800, Saravana Kannan wrote:
> >>> As discussed in LPC 2020, cyclic dependencies in firmware that couldn't
> >>> be broken using logic was one of the last remaining reasons
> >>> fw_devlink=on couldn't be set by default.
> >>>
> >>> This series changes fw_devlink so that when a cyclic dependency is found
> >>> in firmware, the links between those devices fallback to permissive mode
> >>> behavior. This way, the rest of the system still benefits from
> >>> fw_devlink, but the ambiguous cases fallback to permissive mode.
> >>>
> >>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> >>> only for systems with device tree firmware):
> >>> * Significantly cuts down deferred probes.
> >>> * Device probe is effectively attempted in graph order.
> >>> * Makes it much easier to load drivers as modules without having to
> >>>   worry about functional dependencies between modules (depmod is still
> >>>   needed for symbol dependencies).
> >>>
> >>> Greg/Rafael,
> >>>
> >>> Can we get this pulled into 5.11-rc1 or -rc2 soon please? I expect to
> >>> see some issues due to device drivers that aren't following best
> >>> practices (they don't expose the device to driver core). Want to
> >>> identify those early on and try to have them fixed before 5.11 release.
> >>> See [1] for an example of such a case.
> >>
> >> Now queued up in my tree, will show up in linux-next in a few days,
> >> let's see what breaks!  :)
> >>
> >> And it is scheduled for 5.12-rc1, not 5.11, sorry.
> >
> > For the record, this breaks my rk3399 board, (NanoPC-T4) as no mass
> > storage can be discovered (it lives on PCIe):
> >
> > (initramfs) find /sys -name 'waiting_for_supplier'| xargs grep .| egrep
> > -v ':0$'
> > /sys/devices/platform/ff3d0000.i2c/i2c-4/4-0022/waiting_for_supplier:1
> > /sys/devices/platform/f8000000.pcie/waiting_for_supplier:1
> > /sys/devices/platform/fe320000.mmc/waiting_for_supplier:1
> > /sys/devices/platform/sdio-pwrseq/waiting_for_supplier:1
> > /sys/devices/platform/ff3c0000.i2c/i2c-0/0-001b/waiting_for_supplier:1
> >
> > Enabling the debug prints in device_links_check_suppliers(), I end up with
> > the dump below (apologies for the size).
>
>
> I am seeing the same problem on Tegra30 Cardhu A04 where several regulators
> are continuously deferred and prevents the board from booting ...
>
> [    2.518334] platform panel: probe deferral - supplier regulator@11 not ready
>
> [    2.525503] platform regulator@1: probe deferral - supplier 4-002d not ready
>
> [    2.533141] platform regulator@3: probe deferral - supplier regulator@101 not ready
>
> [    2.540856] platform regulator@5: probe deferral - supplier regulator@101 not ready
>
> [    2.548589] platform regulator@6: probe deferral - supplier regulator@101 not ready
>
> [    2.556316] platform regulator@7: probe deferral - supplier regulator@101 not ready
>
> [    2.564041] platform regulator@8: probe deferral - supplier regulator@101 not ready
>
> [    2.571743] platform regulator@9: probe deferral - supplier regulator@101 not ready
>
> [    2.579463] platform regulator@10: probe deferral - supplier regulator@101 not ready
>
> [    2.587273] platform regulator@11: probe deferral - supplier regulator@101 not ready
>
> [    2.595088] platform regulator@12: probe deferral - supplier regulator@104 not ready
>
> [    2.603837] platform regulator@102: probe deferral - supplier regulator@104 not ready
>
> [    2.611726] platform regulator@103: probe deferral - supplier regulator@104 not ready
>
> [    2.620137] platform 3000.pcie: probe deferral - supplier regulator@5 not ready

Looks like this is not the whole log? Do you see any "wait for
supplier" logs? That's what all these boot issues should boil down to.
And as usual, pointer to DT for this board please.

-Saravana
