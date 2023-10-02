Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530A4E7849A
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Oct 2023 08:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235850AbjJBIdS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Oct 2023 04:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235821AbjJBIdR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Oct 2023 04:33:17 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC6DD7
        for <linux-tegra@vger.kernel.org>; Mon,  2 Oct 2023 01:33:14 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49b289adca9so1421758e0c.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Oct 2023 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696235593; x=1696840393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWuACrVMiSb7UXfUbQbyMPZK0CXvOIuNQRYAat1PZ5c=;
        b=mGMXbFfSAdQ33Pn8DhFNdxYHGwLi1a/WtP8laaF5BKHoK/uLaC+caGWUNjCpDbMU5l
         79CFu4zh0pKKdRq+i0BdVlOOizdKEJOXBJ/Rp5JcwleufcbxuqsMJQwkyiyOzVVTYAky
         lKW8hiXPVgwfQt439QxyYvx+jkr4WZp6xqh8+sW+04Ice2ZtTmQSbW3OBsEqeTxWEBru
         qKPDFIFRst8RpT8GDOGsIUHFu92Fb9nFj/xryNhPkM5GeRM590UR9XjXuMRD3488J/1g
         MqWunFTqozbKWvOfY5ugD38/+Y6dtM20YjjmXR1XnvwckDjK8NjBkvg6K2+icFyZRGe5
         mSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696235593; x=1696840393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWuACrVMiSb7UXfUbQbyMPZK0CXvOIuNQRYAat1PZ5c=;
        b=szMm74M5xdt1DJ+wjZ36XA2UHZecTMBek4qEEnlos+ZB2soKSlSHGNIrp+TRsHnFmB
         56CNwc/RWY2XRRJwplsz+Okbt3ZkvlokW51VPkZ/CkN0FXccLuebMkngcuNCWlMHECJe
         YI/xf6XtZOJu1YYOYe0R6SvrrepxTg49i3mPUTZJzgWDytzMCzBtIkiJU9w4Fv9dwoHH
         YZbprd324c7Wh5N6QP8JuwXVxiaXD95Eb8xsfJOQrDaUooz/a4i1+3d4lkxzxHv/+rKD
         CKSlMcEF6Tpxw/Td7wOnAtOGDP3Lk9aMOS4dcmO/Z53w+dvlk7zNaubmU7lLdsgF1JDc
         BB3A==
X-Gm-Message-State: AOJu0YyD/sRD+KAlovkyNZE8nQuJ+dSnKReXKyF1FlwjQ99lc9S8JttP
        iMgY22s9tJTViyPxzxe+L28wjzwTb2Lhg5n7NNYwOA==
X-Google-Smtp-Source: AGHT+IFfKpIXAiatz/Qemg0XDFz87eh8j3hgBkyqc/WD9Z2//Ssp0YA84oFp4tG14Pz/tbr/mMsJDoMhwpf1CGKdmto=
X-Received: by 2002:a1f:4c05:0:b0:49a:b9d3:692a with SMTP id
 z5-20020a1f4c05000000b0049ab9d3692amr8265541vka.5.1696235593620; Mon, 02 Oct
 2023 01:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230911094443.14040-1-brgl@bgdev.pl> <cd4df23c-cc02-6723-e36d-34ca03409e6e@nvidia.com>
In-Reply-To: <cd4df23c-cc02-6723-e36d-34ca03409e6e@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 10:33:02 +0200
Message-ID: <CAMRc=MeWXapho1bsX9Si5uSx7MWVhpT2cqrv5S+qPo51Ko=Vtg@mail.gmail.com>
Subject: Re: [PATCH] hte: tegra194: improve the GPIO-related comment
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        timestamp@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 29, 2023 at 11:38=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wr=
ote:
>
> On 9/11/23 2:44 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Using any of the GPIO interfaces using the global numberspace is
> > deprecated. Make it clear in the comment.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > This was part of a wider series but since this is independent, I'm send=
ing
> > it separately.
> >
> >  drivers/hte/hte-tegra194.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
> > index 6fe6897047ac..9fd3c00ff695 100644
> > --- a/drivers/hte/hte-tegra194.c
> > +++ b/drivers/hte/hte-tegra194.c
> > @@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip *=
gc,
> >               return -EINVAL;
> >
> >       /*
> > +      * GPIO consumers can access GPIOs in two ways:
> >        *
> > -      * There are two paths GPIO consumers can take as follows:
> > -      * 1) The consumer (gpiolib-cdev for example) which uses GPIO glo=
bal
> > -      * number which gets assigned run time.
> > -      * 2) The consumer passing GPIO from the DT which is assigned
> > -      * statically for example by using TEGRA194_AON_GPIO gpio DT bind=
ing.
> > +      * 1) Using the global GPIO numberspace.
> > +      *
> > +      * This is the old, now DEPRECATED method and should not be used =
in
> > +      * new code. TODO: Check if tegra is even concerned by this.
> This use case is to do namespace mapping from gpio subsystem to hte. Few =
doubts:
> 1. What does deprecate mean here? Does gpio subsys not use global space a=
nymore?

It does but we don't want to expose this to external users in any way
anymore (and haven't to for years). This is what deprecated means.
Users should deal with opaque GPIO descriptors not global GPIO
numberspace.

> 2. If yes, what GPIO number is set when it comes from gpiolib-cdev, as ba=
sed on that I may have to
> reflect in the mapping, tegra194_aon_gpio_map for example.

Why DO you have to use a GPIO number though? If HTE needs just a
number from some HTE numberspace (which in itself may be unnecessary)
then why not just keep a local IDA for it? Do you have to know the
GPIOs internal numbering scheme to make it work?

Bart

> > +      *
> > +      * 2) Using GPIO descriptors that can be assigned to consumer dev=
ices
> > +      * using device-tree, ACPI or lookup tables.
> >        *
> >        * The code below addresses both the consumer use cases and maps =
into
> >        * HTE/GTE namespace.
>
