Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E16AEC873E
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235507AbjIGQ5H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbjIGQ5H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:57:07 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AE810CF
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:56:42 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-41215efeb1aso8232231cf.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105436; x=1694710236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=XHg1QXhevLXuH/Ulmnmvvgb6EYKFLepy0usCRIn5xVGLXChGxomMTaZwI+T+NvTSm8
         4DDbIlS29qa9OSmE3FbfVk3n6dJ4Owoi9WqESoUk0GnYPdmlI2FZ4qWVG5uI0o+xM0eV
         JJonbtLD3itFWxGs+F5/M6+xmTGNaKBsuEemQDO1UYIH8hIhg2jtpr0qvTNuE3xRvbeH
         n6W9YXwZGKmc1ge9dGt73pFlhcaCczA4UhBfNjjUDu1fdbzWJhScjJrnIzsQFvNHseDG
         vwTpNj7iM6Lj21h9e/5RqtCq7LxlFSwzqunxIOkO9UXe1/x3Vq1BnwkOPQCNnoJkbfJW
         S28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694105436; x=1694710236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=IzzE2hvXuB+jhbd7Cex/yEktL/dP6LsfFJJpl/FNnvZWUrA6vLj/8R6NncnaIOw7h8
         04YH8W0FJHddHulsbbFcwhgYzsKQX/Yo2LmZAWTCLORBBoQ5+T0lN8z5E8lfV8+yBRuv
         bYuI/625jvfatZiiDZIoOE3TS/Gyevn1A6Ds9MPVCHyWDKM7dczj2S1WmoPLwUiON9DJ
         N3NdGWl5s98eUGTng+KKyZWYalQCwlGXIWI10iCKSAyKdbPTjFK7M3r10pvdX/ATchQF
         UzRadE5evHwLYoRrWQPgKRnHzj1wW3yIe5omC2e8717FZPBi9UioNqCbhDJmCfCpdHyP
         BaQw==
X-Gm-Message-State: AOJu0Yz2IWHvb17CDG0c+drsTOROWMwMi/vFuwiVgJ5iSMBxsvgsb9li
        S1ouhhcVlNNEnRXwpx/H89bMGENCJIpL3Sifr+uGAjGtNOakHdCKV08=
X-Google-Smtp-Source: AGHT+IFBssMxe62b6gjC3N4aS6mxtu2dG9GSPKFawDHtfKqDxWyo3xiYEaVk7D6s0DhtiZ21qOVsU28YZ+Ws9GvtAJ0=
X-Received: by 2002:a5b:791:0:b0:d1f:6886:854a with SMTP id
 b17-20020a5b0791000000b00d1f6886854amr17648637ybq.9.1694071162023; Thu, 07
 Sep 2023 00:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-10-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-10-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:19:09 +0200
Message-ID: <CACRpkdazRyhqHhH+Ock3U0wFRkd_U5QUTZmOeTFoXx-Pe_jCRw@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpiolib: reluctantly provide gpio_device_get_chip()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The process of converting all unauthorized users of struct gpio_chip to
> using dedicated struct gpio_device function will be long so in the
> meantime we must provide a way of retrieving the pointer to struct
> gpio_chip from a GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah, sigh. Maybe add a notice to drivers/gpio/TODO that this needs
to happen long time.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
