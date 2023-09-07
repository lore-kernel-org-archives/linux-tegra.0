Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C20AEC8743
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 17:28:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243677AbjIGR2i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243770AbjIGR2g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 13:28:36 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326C91FD3
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 10:28:07 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a88ff732aeso1251778b6e.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694107601; x=1694712401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM9vERMeF0RyymslElMGVcmFN1ITJOkS0HhbR6rj4eY=;
        b=idg5Vv8AtgNmyCl9jyaaMSqKrmf7js2xvi5wbvrtWxb9vu5Yoxrii+0pCZWztigLAY
         JR1+B2uZhdYIG7GSzXJg9xWZEfuhXu8MIPjan00YDjLGvDbWeL3uuIxOCZaGnln2sGm1
         hb8if6gq9joT3q5u9ejhuYmdrEgubw0s5szhrtTsrZ0Wr5XvFnZBZQEVtLQ4EdMutian
         CMo/rL6B9m+uIfa+tWRuofd0G4U6nfnc20iJ6qvdJ9KSUk18eCgxO5Hyknz8B+PT2tAg
         imNykCw+TMLBMzW0v5zByd6Ymq0XyOwOpW+Hqt7mGkmYK9kb9+90Vvx+XqLMgXx+KtiZ
         vxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107601; x=1694712401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM9vERMeF0RyymslElMGVcmFN1ITJOkS0HhbR6rj4eY=;
        b=V/DpA6tb9ula3U600S7WuBU9naWQZKvbimfE3vJl/xOrUDoNanhiwL3vmh5SXG7JJs
         zmcsj7BGtihBpuGygr9EYCAzACsvd0N7twUrNUEe4undg9EXXMRw6TL+loRgL5ANwvql
         rzNyj+VwGDYPQLcdt8D1d1PDwv9EIoYJctWO/zq+D9oUlchJVBveLkD8kyrinst5pgZw
         8Y5ba8dZX0ykeHVusdBPwmJOYyWr01ioZls2AN7GTHpb3BTDPElICIKHs+EMzwB8Qc95
         jDftUWKtwW65jtL6vjzL4dolFo3uZ6KrVOyhUKizhqzmuTmDO51bh88pRvzS7tU6C9oP
         JkSw==
X-Gm-Message-State: AOJu0YwROgYJfl9y9sF+tc6qzoryCSGjNeAyTeDBXJrKYIrnaCEbqbW0
        3mhzcGNTVpczY6SWcRrIRrS6VP9vyMl2Lso+UNwlYoHfni82fEqI
X-Google-Smtp-Source: AGHT+IE8anPJZAGlVEtdUDBvfZSj/6PcDMAuKXqvs+G37inCYN9bOlMGcS0/NNLAQtkZM5qKA1KbbaOuVnGUeMyCl78=
X-Received: by 2002:a05:6102:2408:b0:447:9339:a5f with SMTP id
 j8-20020a056102240800b0044793390a5fmr1416739vsi.0.1694073488292; Thu, 07 Sep
 2023 00:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
 <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
In-Reply-To: <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:57:57 +0200
Message-ID: <CAMRc=McBMTrcVpjWr2Qo2N5Z6+BEAWr6kLG_bPDmmuO=OFTtfg@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 7, 2023 at 9:35=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> Oops one more note:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_find() is going away as it's not hot-unplug safe. This platfor=
m
> > is not affected by any of the related problems as this GPIO controller
> > cannot really go away but in order to finally remove this function, we
> > need to convert it to using gpio_device_find() as well.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> (...)
> > +       struct gpio_device *gdev;
> (...)
> > +       gdev =3D gpio_device_find_by_label(OMAP_GPIO_LABEL);
>
> This leaves a reference to the gdev right? No scoped guard?
>
> If you leave a dangling reference intentionally I think it warrants
> a comment ("leaving a ref here so the device will never be
> free:ed").
>

It's right there in the comment. :)

Bart
