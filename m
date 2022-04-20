Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0605C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Apr 2022 21:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350014AbiDTV00 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Apr 2022 17:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381910AbiDTV0Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Apr 2022 17:26:25 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5790048881
        for <linux-tegra@vger.kernel.org>; Wed, 20 Apr 2022 14:23:37 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x200so5193709ybe.13
        for <linux-tegra@vger.kernel.org>; Wed, 20 Apr 2022 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNoFOy4a3bgPkQVqzY9jvHwandHXVY61/sg4Zfz5i3w=;
        b=Seo2bThqdCMjzWqjYXZ0xLFOhHtVm9bLdX6O0DJ3+v0DymcUaqJLYUJHsrSy7ma5N/
         JlVJ0OZTTGsMCajqR1C1ddy1D4vS+VEeKR/c9a5WUnkg0ZXm03NLiKP7YuhrHQubTSej
         JkIQfWxFY8vFlSnuAiJlRc7WgvOZLOIRtOVTYjgNsNSRM0KoADLyAgDS9bZZpVXMOcdl
         v7cCprLixK+YvYKgcKX5ezBFGGa9ak++pc79Hs4qO9dJpJxwzjJwxLF+RaFm62gtNZXb
         um/uwTJpGhmkQ1Mt75SuC6yIm0m4r0uxD7tUnrYpwWE+GINkJy6pGCdzcWi2oBhV0Cx2
         2R0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNoFOy4a3bgPkQVqzY9jvHwandHXVY61/sg4Zfz5i3w=;
        b=rOnGHzP1zia0pyNNzOv1e80+tZ8MS08IrOhKxTnAYSTh43fBC9RJb/KE5T8QnNARFi
         LvSp3xTpvBUTqL4maucIHAah4Ous5McFuNAhKKbMSCDWabdscvUYZLVS6gJXy/GUsAXA
         2NBLJblaHjd04o0hHHUaB1MMUJPWFEUpLMIpk4qoApCZ9AkhK53H/0WmzAMH2UJf93/F
         mo3xiYaW5R3ztPY4Lq+pgM/IB1rddRz3ICepa+0ZmfqN+Do97uD+YMvX/bZrmuIyHBv1
         SNk8CDc8uvOtJsNI2W8ZptRgyD+4OS2JLaCwrdigd/lJgzAg9YRgxD6uqeggHdV8j9sO
         5SYw==
X-Gm-Message-State: AOAM530SpwGY1j81WV88TcWoXlWFW2DofOk8CTsE7Ru+j6F8qW6Z7x3z
        RGagN1ym06IoVno75H5aIQmjAFiqTYEN6we1RWZxvQ==
X-Google-Smtp-Source: ABdhPJxiHDq05p9pdRKqWJQxsx5s+4OOdYxBG0GepwCxgjP4lZMjN5+fEEckXfW9Nwt6Rn8+Qcb9CqFq5moxgaXyirU=
X-Received: by 2002:a5b:8c8:0:b0:641:e8de:a6f4 with SMTP id
 w8-20020a5b08c8000000b00641e8dea6f4mr21879860ybq.533.1650489816614; Wed, 20
 Apr 2022 14:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220329054521.14420-1-dipenp@nvidia.com> <CACRpkdbGyrRU9DDTmNDpU52rECAKY3wfi2y3jo9FMypDG=pmJQ@mail.gmail.com>
 <YmAPBG6IknkLotJp@orome>
In-Reply-To: <YmAPBG6IknkLotJp@orome>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 23:23:25 +0200
Message-ID: <CACRpkdY_R+kJr9KppVBENzav_tJ_XToubs8mvtHmvCz9HokeUA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] Intro to Hardware timestamping engine
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dipen Patel <dipenp@nvidia.com>, jonathanh@nvidia.com,
        smangipudi@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, warthog618@gmail.com,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Apr 20, 2022 at 3:47 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Apr 20, 2022 at 12:46:43AM +0200, Linus Walleij wrote:
> > On Tue, Mar 29, 2022 at 7:45 AM Dipen Patel <dipenp@nvidia.com> wrote:
> >
> > > This patch series introduces new subsystem called hardware timestamping
> > > engine (HTE). It offers functionality such as timestamping through hardware
> > > means in realtime. The HTE subsystem centralizes HTE provider and consumers
> > > where providers can register themselves and the consumers can request
> > > interested entity which could be lines, GPIO, signals or buses. The
> > > HTE subsystem provides timestamp in nano seconds, having said that the provider
> > > need to convert the timestamp if its not in that unit. There was upstream
> > > discussion about the HTE at
> > > https://lore.kernel.org/lkml/4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com/
> >
> > I like this.
> >
> > Can you put it in a public git and make it eligible for Stephen Rothwell to
> > pull into linux-next and ask him to do so, as we intend to merge this for
> > v5.19?
>
> Do you intend to maintain this as part of the pinctrl or GPIO trees with
> Dipen as a sub-maintainer? Or would you prefer for this to be a separate
> tree?

It has nothing to do with pin control but a bit to do with GPIO and IIO.
I think it needs to be its own tree just like regulators or clocks.

Yours,
Linus Walleij
