Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CD2C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Dec 2020 19:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE812221EC
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Dec 2020 19:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgLCTU3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Dec 2020 14:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbgLCTU2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Dec 2020 14:20:28 -0500
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731B7C061A4E
        for <linux-tegra@vger.kernel.org>; Thu,  3 Dec 2020 11:19:48 -0800 (PST)
Received: by mail-yb1-xb43.google.com with SMTP id 10so3047480ybx.9
        for <linux-tegra@vger.kernel.org>; Thu, 03 Dec 2020 11:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUYfB3LhbOXH/qWX5ow3QLdCqkjf8YNWyBuEVSInt6w=;
        b=tAd4JdpSkRPjjrscn5ThUbDcRYUSaRgmc8LmMW8HU7IePg47OQhCVJdawgzjaN7syv
         e3N3DviCmLqpIzkG8sO9XhRF7Xf5itcYmV+qZhq7FZqrC0InNtmGC17CoIJH1Wfphncr
         Rg3+TeoBuBit3SqGgU3LvdQFbIl4Hfvd3BljTLXwQyaI0Nmmgvg8oNhs51a3TPi3/ykN
         3T79WmLyPDK6zN22VMLIOPq8xzaeDsW3ln56eq9MCq3v+uSGTB7yi3dNZ01zx+siGqKN
         vaiTRladSGMR+rgnYUqa2sd69sMLzM0Csre6QiBaviz0vCyosEHEY5UGK4etRXSK2MqN
         PnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUYfB3LhbOXH/qWX5ow3QLdCqkjf8YNWyBuEVSInt6w=;
        b=WBubrDHQA5kXZ0aJFffLRvrONobpOMXC4iahiYIRdxz9ActqIs8Uu7j7AzExwV1OvN
         JkW1nvSiUEk2VvOs66HI9vKJ+y9myM/BgBeNblSvThWpfbXPkODo9zos1BdpI9lrKhaX
         ubQozLC13Fi5ETWcgYzcFipMq8dj5ZRW2/v+RCyVw+sP6PHLXvC+4RLDcGJlqgm/zRB9
         o6xQChfOAtNEhSxuu4PwZfOPI5TBPRu8+YgDnNG2nBU6z9O2e/nKFC9+II0hXvXlI6es
         Y213gbb4lnA5PMVG9Ae3taV4T7iEZzOsjp8y0n3T9rg+awF09QmoRy3cA5IsPSf1nzSt
         C/EA==
X-Gm-Message-State: AOAM533YlwGkHgAaUabkmgxJhBZNANfqaHHfZDuX3yH718otSQRhheOo
        0icYeMmJx1qQQPQ9dhJi3ZrhHf3QLEfT0rwjYhljY9Qadz2Jjmvn
X-Google-Smtp-Source: ABdhPJyhXbsmp80bw0icNNI9ciSn4KKgQYFLMDbMBvVHnJ7Dp8BN0RFUQsPErKCI3u7Ti+5A7pCXg92G1jadJjuVlVw=
X-Received: by 2002:a25:8401:: with SMTP id u1mr1068640ybk.96.1607023187549;
 Thu, 03 Dec 2020 11:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20201203175756.1405564-1-thierry.reding@gmail.com> <CAJZ5v0g_FC6Pikrvk2PK=XMvAwqjaNOcYXHYS6eqv6Zc0JgqNQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0g_FC6Pikrvk2PK=XMvAwqjaNOcYXHYS6eqv6Zc0JgqNQ@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 3 Dec 2020 11:19:11 -0800
Message-ID: <CAGETcx9wrKNfvV36v1YJLa_A8jtb6OvZRMjsNG9AYxLPDvdpgQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: Reorder devices on successful probe
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 3, 2020 at 10:17 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Dec 3, 2020 at 6:58 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Device drivers usually depend on the fact that the devices that they
> > control are suspended in the same order that they were probed in. In
> > most cases this is already guaranteed via deferred probe.
> >
> > However, there's one case where this can still break: if a device is
> > instantiated before a dependency (for example if it appears before the
> > dependency in device tree) but gets probed only after the dependency is
> > probed. Instantiation order would cause the dependency to get probed
> > later, in which case probe of the original device would be deferred and
> > the suspend/resume queue would get reordered properly. However, if the
> > dependency is provided by a built-in driver and the device depending on
> > that driver is controlled by a loadable module, which may only get
> > loaded after the root filesystem has become available, we can be faced
> > with a situation where the probe order ends up being different from the
> > suspend/resume order.
> >
> > One example where this happens is on Tegra186, where the ACONNECT is
> > listed very early in device tree (sorted by unit-address) and depends on
> > BPMP (listed very late because it has no unit-address) for power domains
> > and clocks/resets. If the ACONNECT driver is built-in, there is no
> > problem because it will be probed before BPMP, causing a probe deferral
> > and that in turn reorders the suspend/resume queue. However, if built as
> > a module, it will end up being probed after BPMP, and therefore not
> > result in a probe deferral, and therefore the suspend/resume queue will
> > stay in the instantiation order. This in turn causes problems because
> > ACONNECT will be resumed before BPMP, which will result in a hang
> > because the ACONNECT's power domain cannot be powered on as long as the
> > BPMP is still suspended.
> >
> > Fix this by always reordering devices on successful probe. This ensures
> > that the suspend/resume queue is always in probe order and hence meets
> > the natural expectations of drivers vs. their dependencies.
> >
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Saravana had submitted a very similar patch (I don't have a pointer to
> that one though) and I was against it at that time due to
> overhead-related concerns.  There still are some, but maybe that
> doesn't matter in practice.

Yeah, it's a very similar patch but I also suggested deleting the
reorder done in the deferred probe code (I'm pretty sure we can drop
it). Here's the thread:
https://lore.kernel.org/lkml/20200625032430.152447-1-saravanak@google.com/

Btw, I've been wondering about this recently. Do we even need
device_pm_move_to_tail() to do the recursive thing once we do "add
device to end of list when added" + "move probed devices to the end
after probe" thing here? Doesn't this guarantee that none of the
consumers can come before the supplier in the dpm list?

-Saravana

>
> Also, I kind of expect this to blow up somewhere, but since I have no
> examples ready from the top of my head, I think let's try and see, so:
>
> Acked-by: Rafael. J. Wysocki <rafael@kernel.org>
>
> > ---
> >  drivers/base/dd.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 148e81969e04..cfc079e738bb 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -370,6 +370,13 @@ static void driver_bound(struct device *dev)
> >
> >         device_pm_check_callbacks(dev);
> >
> > +       /*
> > +        * Reorder successfully probed devices to the end of the device list.
> > +        * This ensures that suspend/resume order matches probe order, which
> > +        * is usually what drivers rely on.
> > +        */
> > +       device_pm_move_to_tail(dev);
> > +
> >         /*
> >          * Make sure the device is no longer in one of the deferred lists and
> >          * kick off retrying all pending devices
> > --
> > 2.29.2
> >
