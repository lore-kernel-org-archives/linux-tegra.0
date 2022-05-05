Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39887C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  5 May 2022 12:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376315AbiEENC0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 09:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240388AbiEENC0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 09:02:26 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2E44B1C6
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 05:58:46 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bv19so8569882ejb.6
        for <linux-tegra@vger.kernel.org>; Thu, 05 May 2022 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=22a0aEe/UHOud0IxgtpbxI9XkgviWAY8z8RMp+dcuwQ=;
        b=1XRpN+uo+kP9aG9wT4n4cKnAZn7JO6V4622+J8wG4BXRaqAGxbs5Dd/NSV2hfai1nm
         JIp4TtzEX6agoxnoZmsxVJlw+O75peinbaq5ddt4q6oYYwi3vfUA1mxPmu3FgGQ7drrO
         E4BSHtDOF6F8bHQZSWIWQaqmrlmUbOVQ1Wfkedc2AzzdP2jwo007Yui7Uns5qUEqY3rf
         WlfiyqSgCpLLAJEwbGn5DWUM0UlydXH7IFdl+g/RyoaJZYyhKJb2OZxDztCeOtJqDTif
         2huGVEanDK0Zjiv18nCNYDQQC59OaujFBzOmxafpwYZjTniReZh7M9vCYAX3zyR88fe3
         s+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22a0aEe/UHOud0IxgtpbxI9XkgviWAY8z8RMp+dcuwQ=;
        b=609pcyt8/1zGXdUBG0lcpkijKbyKPw4+HMvQooI9hGBDOFQuRDjXM4qb2LnahJxIfm
         khXSlVJhWZB29QGNcFRyjfcgeRRknFbqw8LZr3PPwJ0p40pGQSufoXwUC1EgybOCnfjX
         lQRyytPMYVGG+RhNFlRe6N44VHXwPiZAhsQI955hXcwJ/zAWWwCdq+/WpePAtKz83wFQ
         OmMvO8qoStWMJF8Q8BouuvmA5SEQKeC1Md5ujYh/QmjidFTRmz/4cwAN6Z9OtYUMm64j
         LfX5a5vkk7UuQBEDGJJE6zwRu4LFcvZKRU1Ma6hp22fSnhsGlsxeJJv6C9jEoRGW+l3A
         dHPg==
X-Gm-Message-State: AOAM531aKt/JgTWdICotbgUxaGRne4CJT88VkXC8sBmYgnuyRiV0PN3q
        0QiSDCqwiC9tgajBKlcC6txSDomPHqRj0Jle9P7BEw==
X-Google-Smtp-Source: ABdhPJy9F/3TMLwB/gxgUg1zQckteUkdzDetKT5ae+EhzlpwYypnDRimt8G0RZmsnzLZkknum7KcgQukcAOiLvOSRzQ=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr22968073ejc.101.1651755525314; Thu, 05
 May 2022 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220419141846.598305-1-maz@kernel.org> <CACRpkda3L_itpqcnPq6xDoJtNHt8NuvE1MZk1bCNR+u2KKUpBA@mail.gmail.com>
 <874k2kccse.wl-maz@kernel.org> <CACRpkdb32NuJ8jdsk6ox7ViVjK=9WWWavS=aYcoWTCbaO3WkTg@mail.gmail.com>
In-Reply-To: <CACRpkdb32NuJ8jdsk6ox7ViVjK=9WWWavS=aYcoWTCbaO3WkTg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:58:34 +0200
Message-ID: <CAMRc=MdwbzkpL5Vm2aEXVPKzj78GsFStk+3uZexyrJMB468U4g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 4, 2022 at 11:22 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Apr 23, 2022 at 12:30 PM Marc Zyngier <maz@kernel.org> wrote:
>
> > > Bartosz: if you're happy with this can you apply it to an immutable branch
> > > from v5.18-rc1 and merge that into the GPIO for-next and then I can also
> > > pull that into pinctrl?
> >
> > For what it is worth, I've pushed this branch into irqchip-next.
> >
> > You can pick it up from:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gpio-immutable
>
> Bartosz are you pulling this? Most of the changes are in GPIO.
> Patches have started to arrive that go on top of these changes
> so would be nice to have it in both GPIO and pin control as a
> baseline.
>
> Yours,
> Linus Walleij

Yes! Sorry for the delay. Pulling now.

Bart
