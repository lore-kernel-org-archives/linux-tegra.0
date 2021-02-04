Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B807C433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 05:20:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0CF264F55
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 05:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhBDFUa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Feb 2021 00:20:30 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:35640 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhBDFU3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Feb 2021 00:20:29 -0500
Received: from mail-lf1-f70.google.com ([209.85.167.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1l7X3T-0005xt-NQ
        for linux-tegra@vger.kernel.org; Thu, 04 Feb 2021 05:19:47 +0000
Received: by mail-lf1-f70.google.com with SMTP id w8so1470447lfk.17
        for <linux-tegra@vger.kernel.org>; Wed, 03 Feb 2021 21:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2bZh9FeRp09Ou5sZB44JPrOq861pcQFzyhy33EguiI=;
        b=HkYKaOL4/48XObWvTJRjjZ1xmJMUj0hXUAFt6qFMEBWlY6FkKw+9TK8YDR5gRjCyDG
         hdVC/ocx/4EMAF15F1S9ostt2amUiyw4HEDUrCltCxw59lfm63+pr1xYCvI5Q3kMpK4x
         uCjhFPehTT70JZIv6MV2kNu+oCEXkogFclnUwjCviJByUpz6MbJD+VKwMKVlVnL7l9YD
         rnRe33nV5UkZoqv6MRiwNyhOBqaxio01wZl9k+xlFn0eWTonsZOMwhmH17WD7nRxkA1Z
         +4S9rv3tUCAm7qH8jYpEgxOgJVBenwLEVSJcLyhNy+de+dt0+dZycD5jnLXDpe4Mt+Jz
         DZIw==
X-Gm-Message-State: AOAM531zERXz8qJvVpi4zwweIB2VbgToBR7rrx+sMVKI/1mBbQjGyDKA
        CQRw+iC9R+EfT/AhRN9KzKfJLfvZJ/KFbcLqgQolJBsdO/RVbzzu2QY4uUqbnwXuaMzJiYmeEzX
        BtVX+OLlQ9OSitm6M695k+Uv0DCwVEqMUPt6B8Ht2zS/D2oY1hSxIJsfY
X-Received: by 2002:a2e:7d11:: with SMTP id y17mr3723816ljc.116.1612415987224;
        Wed, 03 Feb 2021 21:19:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynTeiKtps1UfPiLxa5hGUP8TTsWuu0Pnjw0/yGvmieCTQWw+NnyyzMg1yMAuk9bQKxK28mceHx/mSm2khR9As=
X-Received: by 2002:a2e:7d11:: with SMTP id y17mr3723804ljc.116.1612415987000;
 Wed, 03 Feb 2021 21:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20201201213019.1558738-1-furquan@google.com> <e77e0569-568a-f7fb-9f0d-e64943b467f0@gmail.com>
 <CAJZ5v0jhniqG43F6hCqXdxQiQZRc67GdkdP0BXcRut=P7k7BVQ@mail.gmail.com>
 <X/2fzghPXnuDNBPU@kroah.com> <CAEGmHFEpPTuRuWFt0ba022BmGfaDmSTAgEApW9EzAa5CitmtbA@mail.gmail.com>
 <b4a931cf-5974-64d0-fdf2-693e418f3110@gmail.com> <CAAd53p6PtdCRe50PFdn35S1mXHBACKUpmVVcE2qfZgVT3MKj5Q@mail.gmail.com>
 <CAEGmHFG-XXfhcO2ZJU0HwSmTAsYC-04F6by5td3+Ax4GbYLy+g@mail.gmail.com>
In-Reply-To: <CAEGmHFG-XXfhcO2ZJU0HwSmTAsYC-04F6by5td3+Ax4GbYLy+g@mail.gmail.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Thu, 4 Feb 2021 13:19:35 +0800
Message-ID: <CAAd53p71kXLObKAYn45GAQ7GHE00wHZdsGnhj4QECCpNoX5ZxA@mail.gmail.com>
Subject: Re: [PATCH] drivers: core: Detach device from power domain on shutdown
To:     Furquan Shaikh <furquan@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 4, 2021 at 12:09 PM Furquan Shaikh <furquan@google.com> wrote:
>
> On Wed, Feb 3, 2021 at 6:37 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > Hi Furquan,
> >
> > On Wed, Jan 13, 2021 at 10:31 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> > [snipped]
> > > Thank you all for addressing this problem!
> >
> > Are you still working on the alternate solution?
>
> Yes, it is in my pipeline, but I have been distracted because of some
> other high priority tasks. I plan to push something for review in ~3-4
> weeks.

Please Cc me in the revised patch.
Thanks for your work.

Kai-Heng

>
> > This patch can
> > address S5 power consumption issue for some laptops:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1912935
> >
> > Kai-Heng
