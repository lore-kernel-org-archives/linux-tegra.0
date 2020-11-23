Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30519C56202
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 14:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA6A02083E
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 14:32:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uDQ5uZPG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389241AbgKWOcf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Nov 2020 09:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729794AbgKWOce (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Nov 2020 09:32:34 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C19C061A4D
        for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2020 06:32:34 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id y26so1817584uan.5
        for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2020 06:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OgGZW3WpDuLDw5ozZE+5u59qz60QMyQHd0baZzhIOdY=;
        b=uDQ5uZPGj1q/JbChhqx9aCaS3qRHgKQbTp+mI6Eouz/FB1nvFjhFfQqazSviWmOuNi
         k6AW9L1f3Uqd1KrAIkBzlPQIjaET0KkCApC18XyyxG1iZa4m2/hUuzUTvnjqC6x/8XGp
         TNVXALu4nKnUgnDr6daqWte+mvSnCmA174Z0wcDy+NjHbbjzEy6m5XBEefSpWQkpq9Zv
         7bymDueIrRVokSxDIsOtvz2Ci+wMhDllib3xZDei66EGUUfzGRf0bZmNAGQ1J3SBQKHd
         0+b9MNwsnB0zng8Bem71joPDnC/YvKT0RGibO3VyCq4vgp55DUvab7RpVa2KUjTP9hjo
         r+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OgGZW3WpDuLDw5ozZE+5u59qz60QMyQHd0baZzhIOdY=;
        b=Px+iniRe+0pW3pTOWhzPR2/S/Mh6TD8sSKOBp+cLdatD+z6RLn6BgKt0KGxBbl3T7W
         XT3ckLHy070Tm1MH8bymuZJuajtZ+oN+7/X8obth8+WcKtbco5iVc3Kify4ju6N41d49
         aSFrVChX73stB2/A1OFYTqoeDYEDDKFrYz1fe3rKpr+P61vdyEGpgDD5KTPnmonLei7h
         fgv9dMqL7w+rW4nSIPIO8PNyegqU4QCjgrncpFPf1Az0y1cznc+HH8A1xz+T1zaIq9eu
         QO/UyD4dJJ+D14rBJkVYr87JNt5u4UpAYXPFt8z3wrfLf9/BNuG/r5MsvVe/CQg7axMv
         odwg==
X-Gm-Message-State: AOAM531yQPO4wjLLMCDZy5EDazjW+1EKxy3NdNxOXwpWDHFWzqc2cF+o
        rn/03fMlG2sYOw5GhQEjUbM2GKYCLh+DkVtB/HJBA9xYZfloJk2w
X-Google-Smtp-Source: ABdhPJxUUEeuuHWxDeiHXjQmA0ZxOSr84nq7YWX2icdEkJnskSn55gR/J2//1O4Hx4x7PB/TuoG5VIyVBvTf/npMBlI=
X-Received: by 2002:ab0:c12:: with SMTP id a18mr17768135uak.19.1606141953595;
 Mon, 23 Nov 2020 06:32:33 -0800 (PST)
MIME-Version: 1.0
References: <0e00f9ba-571a-23a0-7774-84f893ce6bd5@nvidia.com>
 <CAPDyKFrxKhO0V-uTDLDV6RFQFwhjesE0zfnuBLfYs-n5bNxXtg@mail.gmail.com> <35721978-d166-c5d9-06f6-45cec0d835ad@nvidia.com>
In-Reply-To: <35721978-d166-c5d9-06f6-45cec0d835ad@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 23 Nov 2020 15:31:55 +0100
Message-ID: <CAPDyKFoVQ=D96KtFnmjMh6R7=PrCvTLWqUAPAYsRrVOg2dFFTA@mail.gmail.com>
Subject: Re: [RFC] PM Domains: Ensure the provider is resumed first
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

+ Saravana

On Mon, 23 Nov 2020 at 14:09, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Ulf,
>
> On 19/11/2020 10:15, Ulf Hansson wrote:
> > On Mon, 16 Nov 2020 at 17:17, Jon Hunter <jonathanh@nvidia.com> wrote:
> >>
> >> Hi all,
> >>
> >> We recently ran into a problem on Tegra186 where it was failing to
> >> resume from suspend. It turned out that a driver, the Tegra ACONNECT
> >> (drivers/bus/tegra-aconnect.c), was being resumed before the PM domain
> >> provider, the BPMP (drivers/firmware/tegra/bpmp.c), and the Tegra
> >> ACONNECT was trying to enable the PM domain before the provider had been
> >> resumed.
> >>
> >> According to commit 4d23a5e84806 it states that 'genpd powers on the PM
> >> domain unconditionally in the system PM resume "noirq" phase'. However,
> >> what I don't see is anything that guarantees that the provider is
> >> resumed before any device that requires power domains. Unless there is
> >> something that I am missing?
> >
> > The genpd provider's ->power_on() callback should be invoked as soon
> > as an attached device gets resumed via the ->resume_noirq() callback
> > (genpd_resume_noirq). Have you verified that this is working as
> > expected for you?
>
> Yes this is working as expected. The problem is that the ->power_on
> callback for a device is occurring before the provider itself has been
> resumed.

I see.

>
> > Note that, if there is no device attached to the genpd, the
> > ->power_on() callback may not be invoked - unless there is a child
> > domain being powered on.
> >
> > From the genpd provider driver point of view - why do you need to
> > implement system suspend/resume callbacks at all? Do you have some
> > additional operations to run, besides those executed from the
> > ->power_on|off() callbacks?
>
> The provider in this case is an embedded controller, the BPMP, and it
> needs to be resumed [0] prior to calling the provider callbacks. I am
> wondering if any other providers have this requirement?

It seems like it should be a rather common requirement for a genpd
provider - at least for those providers that need to run some
additional operations at system suspend/resume.

I guess the reason for this problem is that the order of how the
devices end up in the dpm_list, doesn't fit well for your case.
Normally, a provider should be registered prior and the consumer, as
that would probably lead to that the provider becomes resumed first.

In any case, to make sure the order becomes correct, a device link
should be created between the genpd domain provider and the consumer
device. As a matter of fact, this is done "automagically" during boot
for DT based platforms, see of_link_property() in
drivers/of/property.c.

Currently these device links are created with DL_FLAG_SYNC_STATE_ONLY,
unless the "fw_devlink" kernel command line specifies a different
option (on == DL_FLAG_AUTOPROBE_CONSUMER). I would try to play with
that and see how that turns out.

>
> Thanks
> Jon
>
> [0]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/tegra/bpmp.c#n797

Kind regards
Uffe
