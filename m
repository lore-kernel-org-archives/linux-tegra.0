Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7857DC49EAB
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 14:41:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 643DF61C20
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 14:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhF0Ong (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 10:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhF0Ong (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 10:43:36 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1DDC061768
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 07:41:11 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a15so18892711lfr.6
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=btdlc/ifZaWqLzJPrzCmNv9xr6UOVvnu4j5N5Ajddbc=;
        b=yffTw/J5lSDtXKZKMbHb+LYAj2r+UxCDpeXnSWFKiXIFDF619yE7YIq5A87id2LvKa
         Q87cqXc66jFqDBWZR4BnGNgqyAeXaRJjTLIOouA6vrFRvKqoIzkwlROs7MUhWp5znt6h
         JzzRFwzMOT0YaxSY/d/NuW0vY9y6i6jZNOwKEWLjn+6Nb3WzhpE4oqLWDGhNx08GLZjt
         CNv9E1//wPPkVcja7fOjXXz+STz7G9aCld7HIphWRNC/N0IgOh9XAlHPM/M82DG8nx4m
         IR2WxqSeW6s3VK9QWzpCore1k2uJmhYWif/9sCm/yOTj8D8t97/Njy7uLQSVWNUtqi/J
         rElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btdlc/ifZaWqLzJPrzCmNv9xr6UOVvnu4j5N5Ajddbc=;
        b=RZybeUr6zuIAtIakaeU7IfNUA661IDCTm6+i2GiHDZWIVRk/diDBOkIouQr6YTtqaH
         9HfNWwcs9eqEcapP5T0tdiCUyTGCfz6C80tvP+SBWRgUf4bC8zdymqfHa0m8cmQyWyLK
         T4G+MFzPzqTdMA9P6JZtFzJZocJgvbHJsTeTd+ZpTBhFHQUYGI2mDHimed1QbQJgfmp5
         wUL6N2fKtQZ5488LXU+nugJMoAJoVGI7NdbDo3Zjy8UqLRCOtl9vazp34k+l5NJHsMLc
         LJh9l4p/JI20OsssgeoUQ98984RODyQxG/HoLxpYSNHb3DVJJmG2N/1l01g3+vuNjp54
         9Gig==
X-Gm-Message-State: AOAM532d7CyR9KiLmuvaXdhio5Vd4E7Nr+SPctGQijUjnNFJbGqJOVs1
        ztI42gIgfEFQTMjasfsrgenJLFay53XIgUiGyMfi+Q==
X-Google-Smtp-Source: ABdhPJwomKfBSqwR+h+1fkMj/2by+2A/Vt84AAJQdmIrZY7Vy9QHtS+zQ27ySQ7/GVl60lvKYvUjV5vijNwRvQFpL60=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr13083965lfk.291.1624804869321;
 Sun, 27 Jun 2021 07:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <CAHp75Vf4TKjtC7cLNape4r+hE-AWnbxtbww2ofCcHQJf9zyh-g@mail.gmail.com>
In-Reply-To: <CAHp75Vf4TKjtC7cLNape4r+hE-AWnbxtbww2ofCcHQJf9zyh-g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Jun 2021 16:40:58 +0200
Message-ID: <CACRpkdbXE2A98P0_juA9PNEKTo89FcgywYmnqJSC5bV+Vox=Fw@mail.gmail.com>
Subject: Re: [RFC 00/11] Intro to Hardware timestamping engine
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ye Xiang <xiang.ye@intel.com>,
        Drew Fustini <drew@beagleboard.org>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Dipen Patel <dipenp@nvidia.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jun 27, 2021 at 3:08 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> > To summarize upstream discussion:
> > - It was heavily favoured by Linus and Kent to extend GPIOLIB and supporting
> > GPIO drivers to add HTE functionality and I agreed to experiment with it.
>
> I guess this series should include more people from different
> companies, especially documentation parts. This may be used by
> different hardware and quite different vendors. Developing a framework
> like this for only one vendor is no go in general.

I forwarded patch 00 to the IIO list and Jonathan Cameron,
and let's page Ye Xiang who made a bunch of contributions
from Intel's side to IIO directly. (Hi Ye, please check this concept
if you have time!)

The actually most important target group would be people
doing things like sensor fusion where a common timebase is
important, I don't know who does really, but Sandeep Singh from
AMD has contributed the AMD Sensor Fusion hub in
drivers/hid/amd-sfh-hid and might know a few things about this
though I don't think SFH would need this directly.
https://en.wikipedia.org/wiki/Sensor_fusion

Also Paging Drew Fustini, who knows a lot of maker and tinker
people, he might know a bit about this or know someone who
knows.

Yours,
Linus Walleij
