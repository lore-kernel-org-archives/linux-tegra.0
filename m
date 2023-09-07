Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF800EC8742
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234432AbjIGQ6k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245023AbjIGQ6j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:58:39 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059FB19B4
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:58:05 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58fb8963617so12333477b3.3
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105767; x=1694710567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=kYyMXDfnrI/u/WUw57zd4ITIKSJ5OfTBmM4JFS+7LW0D7U5jgW+2EvQ3dlFOXJkWBX
         Gt+mLH5EgHXcGv7W6/+/cMAJQVE7iFvEOwbEBEl18fMRbQCJeEyDynnmTu60ZAeIQdJc
         BM9nh4Zw4PrihKUi6q49jYaWqL9zkoXQkcg4BRGMnMIVWlED1zqUXX2P8NlfLL75MwSi
         UpYTP5c+HsaktB3lgrbREuRrYVXtOdsxtFlZhesEJD7WPfj1VyZNILJY8j+sBpedL+O5
         Xkpz14T6rwRX3iPWb6qxtJQiR5+01m0EwLw243JDHzzOXzQwEw6EvdGEBim9Kx1e1yTf
         PFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694105767; x=1694710567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=mcBpM4IifYtC37BEQrQLpJLxNIXMZrpojZoh0RTrgLE7p7nkd2dfF2ysJnHhGHSpKO
         140AIPS69SrJ6oBuj7AkTvH5BrgdLHSD90B0TagVr1OJ4+X6KtS97cWTx6n9a1bPH6W6
         bAaegEacZCTvs7b4mLQKxjT/mt78H1PU1nqnLUAgsbDf3rl/yMwRQKnxBhDI6oB2qJYt
         scwHFR6s0HJgzbiFWdem+KdcGO7o6HsqJZJh87e3ngMfQdN9GJIzcNssUe9EO0rXG+n0
         4xL2tnenMsjtQmPniYWsUEy/beIxPNXzKxm6zoQTR8nxmidpOI6ELqhHCTvdgri3Af7K
         MdGg==
X-Gm-Message-State: AOJu0YzPyY8cZSiYfXTIY1FydABARwkfjCNcljdfcpVw7tDW7kKiN1nf
        ImfmrTO8mAFEUyIzBMssQSKiYd40kfn5mIbuWSfzomevocVmD+Ux
X-Google-Smtp-Source: AGHT+IHG0TBlmxyoTQFIa7FFpqQqYMcVr4pyVQslrpSztqetV//HxeApegU4hZ/YXLQ350AtIlPtITxSVFId9gOqRWY=
X-Received: by 2002:a25:40a:0:b0:d7f:7690:d865 with SMTP id
 10-20020a25040a000000b00d7f7690d865mr6786114ybe.6.1694072130152; Thu, 07 Sep
 2023 00:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:35:18 +0200
Message-ID: <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
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

Oops one more note:

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)
> +       struct gpio_device *gdev;
(...)
> +       gdev =3D gpio_device_find_by_label(OMAP_GPIO_LABEL);

This leaves a reference to the gdev right? No scoped guard?

If you leave a dangling reference intentionally I think it warrants
a comment ("leaving a ref here so the device will never be
free:ed").

Yours,
Linus Walleij
