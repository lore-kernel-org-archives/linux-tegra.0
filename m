Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF24C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:34:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D442823A40
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:34:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbhAUSdz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729324AbhAUSbL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:31:11 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D4AC0613D6
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 10:30:30 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id z1so2988828ybr.4
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 10:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZMx/E/2jxeFQ/OIv6Rd62p8bKvIIXSarZZ/uxbDSpwY=;
        b=pB8CSuCQ1t5NAIwfgQPsRbm4+N0eqdS2xb3sYibQkm9BQS2mwqlUtyPpO6iLIpNvTf
         ka2NAi+p0KSBwruk+USrd4lKF2udHHqkPF0ROeViCgN+c39XCGmlkVQrEnBDBBfQb1Rg
         jP8JiSiRCC6E5j7+BBHU/UFYNf7FaNMZNfB0EbDL8QQf4rIGpMEWlKackhI+O0PYy7/V
         Wk0AsR7mxPL1ZgKcB7pW6DIXFGPDn2CG7XE3S4u+4mHhCA7Xy7EQC+JAgzutVdOnplRI
         joaAAbzHTBkH+075AARQ5Rv/iJXt2YomkRDsTnU502319R63zcWAh7Zb47O8SRgVGtv+
         Oelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZMx/E/2jxeFQ/OIv6Rd62p8bKvIIXSarZZ/uxbDSpwY=;
        b=aqG1jRoph6tMW6UrQKA3r8FXHSMMFdoOVEzIz1r5zMXO6SHiobIgyIaVrDoJ1uOJ4e
         NESo3ylBhDjnEsjqQ2CQvR7aKyBQQ8CHnUzojUJOXbXK7eKGgktVC1KRXgDmXL9LZoqz
         FdbCLh5MvvQIgauLgLn26fzwLJuGnOpqFfMLFNjWvBEm4yBjY8LNGPw5zMv9XW7uWh6y
         0XXjC7/vx6TMFic6Zoe76Z7HNbNpGYi3eM+6FLvam62FIj0XKFG9tNE6wzl1TgwFm3r3
         CIqQhhhdDWAOAhmF5S/fOpd9hOADpHjR/MrXnDDOXw8jJet/QtbaAqSvM4B8BxuOke4R
         Fx6w==
X-Gm-Message-State: AOAM53097Nw513GDEulF4ruFj4aj4N4p882F3K9QGoDkh9LDZPx9RcOE
        KnaBcAaA6vG5AHvt/u/pfU0BMzTBInjTtV+DklXkziFZn+U=
X-Google-Smtp-Source: ABdhPJwnZpmvD+AZqcXVdjUOu32h6NtnBg2N1jGh81MiZd0VG0aCJtfW7+8+aKL/Muz7mdDJKzVA4r+78/0mqdECUOs=
X-Received: by 2002:a25:dfcb:: with SMTP id w194mr883475ybg.346.1611253829911;
 Thu, 21 Jan 2021 10:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20210120080522.471120-1-saravanak@google.com> <20210120080522.471120-2-saravanak@google.com>
 <CACRpkdbEC6duR=fJQD_Nw9o=HW0DEe2_Ks3SYCgJmkOjzKz3Jg@mail.gmail.com>
In-Reply-To: <CACRpkdbEC6duR=fJQD_Nw9o=HW0DEe2_Ks3SYCgJmkOjzKz3Jg@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 21 Jan 2021 10:29:54 -0800
Message-ID: <CAGETcx9HFtnuA=XDdbXOq+HEEkbtpQ7J7Nz4uTWhoswZbHpsfw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] of: property: Add fw_devlink support for "gpio"
 and "gpios" binding
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 21, 2021 at 5:11 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jan 20, 2021 at 9:05 AM Saravana Kannan <saravanak@google.com> wrote:
>
> > To provide backward compatibility for boards that use deprecated DT
> > bindings, we need to add fw_devlink support for "gpio" and "gpios".
>
> You do some more stuff in the patch so describe that too.
> Especially the check for hogs and #gpio-cells.
> Describe why you do that. Maybe even with a comment in
> the code because I don't think everyone will understand.

Ack

>
> > +       if (strcmp(prop_name, "gpio") && strcmp(prop_name, "gpios"))
> > +               return NULL;
>
> This part is easy to understand.
>
> > +       if (of_find_property(np, "gpio-hog", NULL))
> > +               return NULL;
> > +
> > +       if (of_parse_phandle_with_args(np, prop_name, "#gpio-cells", index,
> > +                                      &sup_args))
> > +               return NULL;
>
> This part is hard to understand. Insert comments and tell the reader
> of the code what is going on and why.

I assume the "hard to understand" part is the gpio-hog part? Because
the last line is pretty straightforward -- it's returning the index-th
phandle. Also, it's a copy-paste from the DEFINE_SIMPLE_PROP macro.


-Saravana
