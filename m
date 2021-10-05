Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34476C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 11:13:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1086D60F93
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 11:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbhJELPV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:15:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:47128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232658AbhJELPV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 5 Oct 2021 07:15:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9D3161251;
        Tue,  5 Oct 2021 11:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633432410;
        bh=MP0zBtemtkQdqL8OmFU92hKaTF3Fwa0EJ8Ni7xN2MQQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p5SeEDKNWmorB1aERVWlJrUJFNy/bgmsyZlYjmB3i1z8diKCJrkTeRRXXsDR1DVom
         vA/MJE/AFcPSB7aY81e7aJIyYyDZYDHj7qs+vd91HSgxU0eKGET9tmmoJ6i3ANm9FM
         jdxd8XKbujTchHiCgeDtVOAdYyH6EpZRsbfZRwWkq55cn3sjzFFM3cQdj4Aqbj94C/
         omvocXtmtHPl9IdL5aCe5H/JJr8e1Njtxj9H/+gIxaSAOsgabAiB3+hwOuZYIus8J0
         /7CIUdFgGFw4g1Rx+dsQCOAipwswntmJVk///9p/yAakrUZ7zUuNqOizGigR12U11B
         1AbpqgAb0iRow==
Received: by mail-wr1-f41.google.com with SMTP id t8so36773293wri.1;
        Tue, 05 Oct 2021 04:13:30 -0700 (PDT)
X-Gm-Message-State: AOAM5321zMsOUB6n9ABYt9RYXqEqIvoJcdgO5bDcnBSpnVn93vYRablm
        YxYV5JxiKgMirfGB7ONVvZLRhFsv9xZSB69h5S4=
X-Google-Smtp-Source: ABdhPJxm8Hkv+U2qTgwd7JgG4bmf7LJ55i18N0rZnyQafyKdjpcuy+trai2GX3XtqF4Cbb2Tz/frlo0hsiDd1SJyDKE=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr965033wrb.336.1633432409306;
 Tue, 05 Oct 2021 04:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210927142258.1863321-1-arnd@kernel.org> <YVwxxywC5iSGSaXM@kroah.com>
In-Reply-To: <YVwxxywC5iSGSaXM@kroah.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 5 Oct 2021 13:13:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nmutn8ZHQkzH99mht9RPAUCTOvqTfEGPUKLoeqTs-pA@mail.gmail.com>
Message-ID: <CAK8P3a3nmutn8ZHQkzH99mht9RPAUCTOvqTfEGPUKLoeqTs-pA@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] usb: xhci: tegra: mark PM functions as __maybe_unused
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 5, 2021 at 1:07 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Sep 27, 2021 at 04:22:52PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The added #ifdefs in the PM rework were almost correct, but still
> > cause warnings in some randconfig builds:
> >
> > drivers/usb/host/xhci-tegra.c:2147:12: error: 'tegra_xusb_resume' defined but not used [-Werror=unused-function]
> >  2147 | static int tegra_xusb_resume(struct device *dev)
> >       |            ^~~~~~~~~~~~~~~~~
> > drivers/usb/host/xhci-tegra.c:2105:12: error: 'tegra_xusb_suspend' defined but not used [-Werror=unused-function]
> >  2105 | static int tegra_xusb_suspend(struct device *dev)
> >
> > Replace the #ifdef checks with simpler __maybe_unused annotations to
> > reliably shut up these warnings.
> >
> > Fixes: d64d362f1d8b ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
>
> What tree does this commit come in from?  I don't see it in my usb tree
> :(

I don't know, I originally created the patch back in April when the
problem first
showed up in my randconfig build tree, and picked up the commit now when I saw
the bug still exists in v5.15-rc.

Apparently the commit ID that has made it into mainline through your tree was
971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM").
I'll resend with that reference fixed.

      Arnd
