Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B406C43219
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 13:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CC4861164
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 13:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346540AbhIXOBV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 10:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346605AbhIXOBE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 10:01:04 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F0EC061764
        for <linux-tegra@vger.kernel.org>; Fri, 24 Sep 2021 06:59:31 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id q14so10459300ils.5
        for <linux-tegra@vger.kernel.org>; Fri, 24 Sep 2021 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vH2YhvPec36tzF9CqFvv48FWCLMK8cS6dcfU+nnIHyY=;
        b=MULBtZwJXLYw882PNkC1wdIC6xsntlfC3Jqk68hXwFyDrHTB+5MPik7dimveBvicK9
         czoHkx9kG9TCx/Q0u/mXNOVOnge0HpxCKoo9h1TN4Th3MREoijDCtzjsI9IzhTeV8JJL
         vRiuoKD8opz3Gwxmjxn7QjH6rynmXpiiqOlLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vH2YhvPec36tzF9CqFvv48FWCLMK8cS6dcfU+nnIHyY=;
        b=LdvDJXhLuvFJ0vUqkB5yOkIrUXuGgFLGzJo1amReJGWp8mvfy7UudR62ODbm2SkAmN
         wGYvKLHz7JZKGw8NNoctd8Tv590wj92CaUxfY4eFh/7fMnjS2KY19b1cEqC8LLufnbvL
         q4tj30Okv9c5MzEaii+u8LMJnz5t4NGvKS4HrNv/OCYD2QMfggX82Dyw78Um3koK0uM5
         3apYer0jRbe+l3WGyq36tegymWjC82MslH1sSPWGYu1M3zoZn6bYRWDzMrbdmCosBxRa
         WCF+3xhino+GN88eUxthHTOqypuLaDgARrVxxx4D52/7/27KLQZ0ysfKXMMqHoSWCYbj
         N8gA==
X-Gm-Message-State: AOAM530DvkFaskIGVDvrevCQrkBsw+oZxbP6XQhY1BRTJujWfW2g4L+U
        c6cd19ZIP0hc6EmOm7+noF+fPgjW3P5rNQ==
X-Google-Smtp-Source: ABdhPJwrIScCI/+AXq0FOsDC4lK5lePaqcgVZbwx0uQXh38MWaldgHZeAZkdQ2HORWAoK2AiFAycJA==
X-Received: by 2002:a05:6e02:144c:: with SMTP id p12mr8907102ilo.292.1632491970370;
        Fri, 24 Sep 2021 06:59:30 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id p73sm3965924iod.43.2021.09.24.06.59.29
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 06:59:29 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id h20so10400044ilj.13
        for <linux-tegra@vger.kernel.org>; Fri, 24 Sep 2021 06:59:29 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id n13mr8008800ili.142.1632491957963;
 Fri, 24 Sep 2021 06:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
 <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
 <CGME20210924080417eucas1p209819b105dc64faf1f2a7140c5c1389b@eucas1p2.samsung.com>
 <874kaabdt5.fsf@intel.com> <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com>
In-Reply-To: <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Sep 2021 06:59:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
Message-ID: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-sunxi@lists.linux.dev,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        smyakam@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Fri, Sep 24, 2021 at 2:10 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Hi
>
> removed most cc, due to server limitation
>
>
> W dniu 24.09.2021 o 10:03, Jani Nikula pisze:
> > On Mon, 20 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> >> Pushed all 15 to drm-misc-next.
> > ...
> >> e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
> >> d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from
> >> the EDID
> > Hi Doug, Stan's reporting "initializer element is not constant" issues
> > here that were discussed before [1]. I wonder what gives, you said you'd
> > hit them on a draft version, but not with what was merged, and I can't
> > reproduce this either. Curious.
>
>
> Apparently this is grey area of unclear specification.
>
> gcc version below 8 reports error, above 8.1+ should work [1]. I am not
> sure if there is nice workaround for older gcc.
>
>
> [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18

So I think the only solution is to go back to the character-at-a-time
version. It's slightly uglier but functionality trumps form.

I'll post something today though it might need to wait a few hours
before I can manage it.

-Doug
