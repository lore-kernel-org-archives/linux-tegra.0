Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA50AC6FA83
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 21:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbiIEVDz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 17:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiIEVDx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 17:03:53 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87ED66564D
        for <linux-tegra@vger.kernel.org>; Mon,  5 Sep 2022 14:03:51 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y3so19234804ejc.1
        for <linux-tegra@vger.kernel.org>; Mon, 05 Sep 2022 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
        b=RJtkdpcWwDCjdU//f+NiUTQJO5kz/J/LQ4Oeb8FsER0ooLc9TUWAVJHwh16h0rFR6k
         jDNxcAT6fUKAWlYXkDzi9PRVLGCFhao6TAvvqUzCLnc6J1JgrkOg//ZWPBTqZXz06MLe
         g/E79BtcrSCZXcou4vgp2IFBghrcFJpfeHS130JLJDTFGdRTjjJVv3m8lMFyySNYfbdn
         zyHSJi+z2sGr74Gs8Ferhg3qHw1Rm2Rd7LpNg2QiPU+rsqNYeELsa2ObuGU9YVxZktXI
         +EIJDXEMJp+8DP7PW/zCtw+WHI1pL0md9UYJvdO9U0CdYO9jo7gVaKjIjDEh/+/hHVoD
         fvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
        b=q/eiN2jvYzjrnM/idi2ImTFh/OBdkGJmTS1HaCtNkP15HD7vCxGMetN8u9WEC0lKYy
         KIsBrOWfNHr7JI1s0xyO+yaeLmQmQjIIFiRx1R5Ct6OIvC3mSAbgrqWnuXRgH1EhIDGv
         6oKdpCavX0OQbS+YHDjaxEf+1RkohFsvpX2A6yULSmnWe7SDaQL4hq69X7L/hxjkHe/v
         x+5DVDDKIF2okJEpZWpdHs0DwS9VIYEOFoTRjjXRax1o9MhHW98h73p0BesJOL3MLjFq
         pXMhP9t7eA/wMLBK6Bx7sk7ILF0UsFQw32b8OIa/NHTlLvVaWxgQXJSZ1+I/FOxhE7rx
         yScg==
X-Gm-Message-State: ACgBeo1O1Re1RYWDvBxlghap0o5vgvfEkjiej/RAra136XIOTE6xoGky
        3LPRia1CBP/q0D9jwwc5pGBxLfwYr+ht3D6bnVVWWA==
X-Google-Smtp-Source: AA6agR4GWSThcRe2jCNjPhluqCCYiE882sQv//p+YmHWCdk54XKDzjUOkiYoAS2W+owpznoWxs2VPch3w1ZAdKXk+5E=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr28207413ejc.203.1662411830025; Mon, 05
 Sep 2022 14:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com> <YxZP/exeVD7DQ5Hx@google.com>
In-Reply-To: <YxZP/exeVD7DQ5Hx@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 23:03:38 +0200
Message-ID: <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Felipe Balbi <balbi@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Marc Zyngier <maz@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        David Airlie <airlied@linux.ie>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 5, 2022 at 9:37 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > I would like to limit (or maybe even remove) use of
> > > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > > a bit, so let's switch to the generic device property API.
> >
> > > It may even
> > > help with handling secondary fwnodes when gpiolib is taught to handle
> > > gpios described by swnodes.
> >
> > I would remove this sentence from all commit messages since it's a
> > debatable thing and might even not happen, so the above is a pure
> > speculation.
>
> I have the patches. Granted, I had them since '19 ;) but I'm rebasing
> them and going to push them. I need them to convert bunch of input
> drivers away from platform data.

That's good news!

Are you referring to this patch set mentioned in a discussion
from 2017 thru 2020?
https://lore.kernel.org/linux-input/20200826161222.GA1665100@dtor-ws/

I put aside GPIO descriptor conversion for input devices (keys, buttons)
in board files anticipating a swnode mechanism.

Yours,
Linus Walleij
