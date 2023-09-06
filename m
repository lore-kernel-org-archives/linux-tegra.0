Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32D4EE14A3
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Sep 2023 14:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241246AbjIFO4m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Sep 2023 10:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238537AbjIFO4l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Sep 2023 10:56:41 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1A91981
        for <linux-tegra@vger.kernel.org>; Wed,  6 Sep 2023 07:56:24 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49032a0ff13so1268374e0c.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 Sep 2023 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694012183; x=1694616983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b+LrhpzD5zlDQ1f5MsWSMzQeSCCSm94gfnG0eru8no=;
        b=MtkxY4AXWAtLYiDITObnjhqqBAd6yV6C/RcVat9RtgJpsKr4Pby1a8bAiUE032J2OI
         RSr6th0q6mqw2uA0zinRN+wqXc4m4QqtYEL4gmIAGDOghicRCvtc0I3EGW0R/k02s9o9
         7tYk0Q4XT0Z2xo0u20dGu994+P8YX2HFCaUfoTHMQyKIfGdRATgA2ZjzGjgHE6eP1yS5
         dCq0W3bXozka2qnROw/XeWciDAflTzRkpXnwtqTE+P5D20hOc66OlsJ7FFtO6I1tWLGb
         Vpmrru06iv8/ZyqJZ98DkhhwC+vLJSRagRnAl1x677v6ToML7Hu8NIXzjG/B7JFLPnZg
         5oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012183; x=1694616983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b+LrhpzD5zlDQ1f5MsWSMzQeSCCSm94gfnG0eru8no=;
        b=S0XrUbKoRzJy4NiOFmXoiH9Vmdn22Yc2FGR+i+j3czvbeCU8CfNvNSYtm+AnYVTj80
         Dws6aojMPB83GPJSK4pQ3gRdrniECy/PhGGUGjgpCIYURSJZwhNe83SX76tYuawp6pS0
         hvgfe6yqblEM6Gs2bQ2t7EJSuVv99jie8nAnSyXeXbHVYZEJ3zJvH+av+1qzON9PSPC9
         VoPzHVi4Pii3Tt/UmYj4ak5sJkpelIFl/WvuA7WGGyhTI4J1nrEZiHoo6Qnpyoa4KNKN
         Du2im5ONSDWv1ZqMrYBTIoKnPw6bzzdJvzGW9mI3VWZPNdOQD5NS9xldCpaFty3wwbyo
         Xscg==
X-Gm-Message-State: AOJu0Yx4pOg17SpYjneboKal6BimUs7+Gy4FEooVtsoA8o0f3oDA2VH4
        Lgh428GLw92IxAXEPY5eAI7VGyCpiGYYRIHQ/+I/Kg==
X-Google-Smtp-Source: AGHT+IHFUAaQuXJCvoaHz5cxhv0bEhMufwh67QZ6cCxl5kH6KvbUhYeVa6KPRbL1zs6bpPHq6Ld1E0a7yk+msYaoihA=
X-Received: by 2002:a1f:e402:0:b0:48d:2a1:5d26 with SMTP id
 b2-20020a1fe402000000b0048d02a15d26mr3439732vkh.4.1694012182436; Wed, 06 Sep
 2023 07:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
 <ZPiRTfN3ZbvcuE6I@smile.fi.intel.com>
In-Reply-To: <ZPiRTfN3ZbvcuE6I@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Sep 2023 16:56:11 +0200
Message-ID: <CAMRc=Md3gRyfizGxkGwCUhO1ahkgew5qURueKbJNmkBJJn7=EA@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Wed, Sep 6, 2023 at 4:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 05, 2023 at 08:53:03PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_find() is going away as it's not hot-unplug safe. This platfor=
m
> > is not affected by any of the related problems as this GPIO controller
> > cannot really go away but in order to finally remove this function, we
> > need to convert it to using gpio_device_find() as well.
>
> Side question, have you used --patience when preparing this series?
>

Yes! Thanks for bringing it to my attention.

Bart
