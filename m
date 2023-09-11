Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D8ECA0EC8
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Sep 2023 21:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237388AbjIKV4l (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236662AbjIKLKM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Sep 2023 07:10:12 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA0ECC3
        for <linux-tegra@vger.kernel.org>; Mon, 11 Sep 2023 04:10:07 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-44d48168e2cso1353354137.2
        for <linux-tegra@vger.kernel.org>; Mon, 11 Sep 2023 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694430607; x=1695035407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygzI44NeTHTXZv1CATzGbcxyMKxYdJM78sd/Ui4mbh4=;
        b=S43RlbxgMRIDxaYPaKhgHxFMDEy0YycLcdWKGNBFWNq47kUz/NhhofQvphaQpnnNxA
         rds3vE4/NWKTO/pCmnSC4FhHUg+M40LqaQ06VSDlukuh8FqhZZYBFXONsm10ihTBcxFg
         Bq6mZsekZCorKFbhzsTLz0J3tWCufljGqV8C/jDsHw/wECFgV7QGkvtq4dvZ++yfcMKk
         crn3f7v3a5vweADREqwCWgCnqCMffVF3YlZhK4Q7K0kgWAsgDCrrcwwpOSzZulggjX5P
         tTVCpNbLuc2uQtV1zkW0M/loqKJ4PXklWOB/oXmyBtH7YGIWN3nB93ojRPszCIZyyjpY
         bwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430607; x=1695035407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygzI44NeTHTXZv1CATzGbcxyMKxYdJM78sd/Ui4mbh4=;
        b=Bq2kQ8gb+3Hccz0YdujyqNGD1TOnA09q0zIYeGSxWbZ5xy+MVFeyshZyxE9ryG6ASw
         Ivn1ClLyyUsbkLc2vzAwMfVoByMfvqHA8RXq6ir9CokZqatfvtunjU5HMZOI0W4A8l1J
         VG1KcbeYf2h7dTAToY5yJHQ4Vwwg599a49LZvTvpKLfdsgOKQtByOJHgiR/LDDEbIRfQ
         u0m4xaOp9RJgYy5oYZlJkG/Pjk6n0S67eHts4MBK1fn61D8MuLduNj70rn4OUEfM+MSb
         4MeG6CrqZtmiKxnHoQg7p0rbPl5IqRnmnKtjNAXdXGwMZCtD1coe9Chiohad2VOEB0Ar
         3VSQ==
X-Gm-Message-State: AOJu0YyOFFNRePXeVxSoDJiXvQvxyF7JQpfrN7oo5MlV3CmwE3pTe8iN
        Y/+nPg1v7/VEPRPt5UpSGWTxBUhUB6CduKPHYs3S9g==
X-Google-Smtp-Source: AGHT+IHKoGdBmULT8rxuDZNFn4KOQlQw0ew3QXPEPQ2cSj+YIXX/HcTVOBuC3A6SmscStWmmEPnPXA1WJ+6yAFCejlE=
X-Received: by 2002:a67:f557:0:b0:44d:5b62:bcd5 with SMTP id
 z23-20020a67f557000000b0044d5b62bcd5mr8865170vsn.23.1694430607044; Mon, 11
 Sep 2023 04:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
 <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com> <6555932.G0QQBjFxQf@dell>
In-Reply-To: <6555932.G0QQBjFxQf@dell>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 13:09:56 +0200
Message-ID: <CAMRc=Mfrk9q6fJyEAuxDXYPpbjVHeLJaTjHEcKiYHzrE3r+_7A@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
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

On Fri, Sep 8, 2023 at 8:07=E2=80=AFPM Janusz Krzysztofik <jmkrzyszt@gmail.=
com> wrote:
>
> Dnia czwartek, 7 wrze=C5=9Bnia 2023 09:31:01 CEST Linus Walleij pisze:
> > On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > gpiochip_find() is going away as it's not hot-unplug safe. This platf=
orm
> > > is not affected by any of the related problems as this GPIO controlle=
r
> > > cannot really go away but in order to finally remove this function, w=
e
> > > need to convert it to using gpio_device_find() as well.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I was cleaning this one just some merge cycle ago, now it
> > looks even better!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
>

Janusz,

Is it fine if I take it through the GPIO tree?

Bartosz

> Thanks,
> Janusz
>
> >
> > Yours,
> > Linus Walleij
> >
>
>
>
>
