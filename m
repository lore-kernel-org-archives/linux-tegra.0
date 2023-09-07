Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92A4EC873E
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbjIGQYT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239059AbjIGQMs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:12:48 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779A759F2
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:10:05 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1d53ab187e8so879187fac.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694102614; x=1694707414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=fS80Va+eDm4EGjjucqbGmbYPl0fQOQOVIjWi/mxsc5gERXIObbvj8b5GOF91ge/ESm
         35UAv9FqF+2WyVS+w4lE3Jubqs4QMqNyK58OXDNQUYyyPMpF2D5qPQ27SGkKn1i2grx8
         pvF2XUrswpB9NMdn+hx28zbsGN4VK/3PBr9fIO2tI78Q7QxVomJgEkGrc2PtnKnUIoxk
         uNzxdENYqMQYVI9g1abhGBiXSXHTxy4KkVexwwmBn+gdx2jy/tvXcRkk+FYIXCniH9XM
         f6rRVg7Vnw3CXpIG9jKhK/+EseoidONMh8WI5aEWbBearga/xmY4H7zYcs6K9P8g/GK3
         2XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102614; x=1694707414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=NxYdQmUs6B3fXrZctpNxDKFO1Xls9EGIy+uM1k+IIB1tB+xb5Lzme0B9MCVX+x9fVz
         LIjFHZM37WpeKZvZVyrxN4c/xu+YuRihXnj3W6YeOosLzVQltI36o3dfL8IW0HA7/Q7Y
         6FrDb5TYsmPfsCGqGpB7v7qiJFptOsvIa7tuIChyczEIZlp8d7nJbUngQhtLAi7sQMo5
         DALh86GLbT+mLLwyvTWEI38vg+n69VicZ4RXcyETVjJjaE6KM4TWtTdbL6+ChULry6tW
         FWuPRCokGzh4BgDLUqVSltAqGLDX7sux7x+98ZH2nMl+lerNBQFavlhHA2w+axHRisy2
         ZPTg==
X-Gm-Message-State: AOJu0YyrpvOemmmNeTWct1wdEoKDYP5DDcIwZjELqh5lbUMvMKzQKIbq
        2dI9pFJG124oQ/C2OpYiVGI4csxC73xkWiIXigewzvX7itBo16QoAYU=
X-Google-Smtp-Source: AGHT+IFxuGmnz6UhP+iDHBaAUw7EFN+gVZSw6nwdZwmmFMJ3XnkMU5k7fxCuPngY53Trr0s6Te5MkJ1CXk5K8y+Rwo4=
X-Received: by 2002:a25:ce47:0:b0:d1d:514e:27c6 with SMTP id
 x68-20020a25ce47000000b00d1d514e27c6mr18577035ybe.6.1694070485563; Thu, 07
 Sep 2023 00:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-5-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-5-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:07:53 +0200
Message-ID: <CACRpkdYCOVJZ6TUMQQHSaKZHMCx8tE8=3z=1BogYTkr52mFr8Q@mail.gmail.com>
Subject: Re: [PATCH 04/21] gpiolib: provide gpio_device_get_desc()
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
> Getting the GPIO descriptor directly from the gpio_chip struct is
> dangerous as we don't take the reference to the underlying GPIO device.
> In order to start working towards removing gpiochip_get_desc(), let's
> provide a safer variant that works with an existing reference to struct
> gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Andy had some good doc comments, with these addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
