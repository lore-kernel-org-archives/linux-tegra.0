Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D89CD8CA5
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Oct 2023 15:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjJJPKY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Oct 2023 11:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbjJJPKX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Oct 2023 11:10:23 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEAAB9
        for <linux-tegra@vger.kernel.org>; Tue, 10 Oct 2023 08:10:20 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9a64ca9cedso689684276.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Oct 2023 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696950620; x=1697555420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNVRgyFvWum2hRFmlW92z1wg/5s9UkkY7tvKtWeRi8Q=;
        b=SVSLCKj5dikkLNk6DOuRJHon/PhbCOdxZuJBsZD4Y0GPVDcJcDiTRsqmSsKO4VeCPg
         3sFgYZ0wL3MXOhi1/jAGpDGQlq7g53JVhK+J34QCeJqxsiucw0O3zIyqrgCKMzxksVin
         rRsSzRuA0cch3Ipy3RQC5EIqilhjpkXsfWwKD3cX2kL6WcW/mRwCQIuxedkIw4ZzJ9MW
         CJwXqXUNEVyvUXRq7Pxg3BhEsvPmfwQB+qwW5Ju+Cm9M7jYztfW4bx0TI44udUItWZFX
         G5VcxkkxP22eMj64OhfAbs6iy8SRebmx7OAl29iQDD0ztKZXDFRmQQ1Gr3TFflBHmFpw
         P4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696950620; x=1697555420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNVRgyFvWum2hRFmlW92z1wg/5s9UkkY7tvKtWeRi8Q=;
        b=ME5+tYnrFCRn/8xxo3mPXIOiJKH/cq0WFaHQ+1rkEV03EbgVfdfVbzDA7FRLkwJVEQ
         nVyqB/rOmXORK0w4PVZG1SqcYlQVhVPwoWYEpP61rxQHzzqFjZq7cSx4R6zFHZMlXB65
         +/EP7c/xNEJY8TM2MuTYYM/kzR+UKMTNJsrIYT2d1tuEpYlV0oCs2er3yLiEvjaRv+U4
         jBC0BeagMPlkdBjyYNTD3QOki3Fk+1VjlAuOIOzh32ICitKCyn+hSa6szd5FEo21hOZU
         F1EQvV7GLg9qdWfuGZhEFyG7l6/cBOjjIEpqdhD0C3rMw9GE2f0IXMSrMxHPyIH/wD2q
         p/zg==
X-Gm-Message-State: AOJu0Yw5d549QVcdk9W/YAl+vbTfVpzOiW7xX7EXnGC9l23XrbNdpL6p
        T4PYpKhuarp49AjGtIV3UMriBi7RX2XlhVg7B1Jy5A==
X-Google-Smtp-Source: AGHT+IHfvy8QBycFXs2pUxVfYETVBPejg2TIRQTJu6G07uZHpYTTeTyT86wgocW2zL5M6/OjRH6H1VYO28y8QHYa0Dk=
X-Received: by 2002:a25:ac9d:0:b0:d86:53cb:1eee with SMTP id
 x29-20020a25ac9d000000b00d8653cb1eeemr16293192ybi.2.1696950619976; Tue, 10
 Oct 2023 08:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231009173858.723686-1-dipenp@nvidia.com> <ZSVN73ffDkGBzmmI@smile.fi.intel.com>
 <ZSVWKSVNsBqDcOFS@smile.fi.intel.com> <ZSVcFo2sDVbMCW3Z@smile.fi.intel.com> <ZSVewh61i8JzwxQQ@smile.fi.intel.com>
In-Reply-To: <ZSVewh61i8JzwxQQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Oct 2023 17:10:08 +0200
Message-ID: <CAMRc=MdBGf7g1xcGid+AuWaLhm3AJEAvFjK4PFOhs2dUF35QdQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: tegra186: Set fwnode of the GPIO chip
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Dipen Patel <dipenp@nvidia.com>, linus.walleij@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 10, 2023 at 4:25=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Tue, Oct 10, 2023 at 05:13:42PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 10, 2023 at 04:48:25PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 10, 2023 at 04:13:19PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Oct 09, 2023 at 10:38:58AM -0700, Dipen Patel wrote:
>
> ...
>
> > > > > +       /*
> > > > > +        * This is needed for driver using gpio device matching w=
here it
> > > > > +        * has to use gpio_chip fwnode to match the gpio controll=
er.
> > > > > +        */
> > > > > +       gpio->gpio.fwnode =3D of_node_to_fwnode(pdev->dev.of_node=
);
> > > >
> > > > of_node_to_fwnode() is specific to IRQ, in other places we use gene=
ric
> > > > of_fwnode_handle(). That's why better just to use dev_fwnode().
> > >
> > > On the second thought is there any parent assigned?
> > > At least I see that in tegra186_gpio_probe(). Are you saying
> > > it is not working? Or is it (matching) called _before_ we
> > > add a GPIO device?
> >
> > Okay, I think I got it. There is a function called tegra_gpiochip_match=
()
> > in drivers/hte/hte-tegra194.c which fails after my patch. Yeah, if prov=
ider
> > doesn't set fwnode, it can't match. But, since the driver sets the pare=
nt
> > properly it means that the matching function should be done against the
> > device.
> >
> > Seems to me that in HTE code the matching function is broken.
>
> I'll send a patch soon. Please, test it.
>

I'll have you know that if it is about to add any new "#include
../gpio/gpiolib.h", then it's a preemptive NAK from me. :)

Bart
