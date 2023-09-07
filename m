Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441D5EC873E
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244436AbjIGQxi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjIGQxg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:53:36 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D911FCE
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:53:06 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a7f4f7a8easo468632b6e.2
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105523; x=1694710323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=PBIR6ObXyahzlHh/JzdEBkyQd1keJRg59nYb6fyOQ/UL8zQFllqk73ugSqDvitC5hi
         MR9LUKTJkUDHu89fH/AHuX6+aFAu9FPu5Uav75Q3cKRzat6jrdEURS+p3BNHkbg4z6IT
         8394RQsRV5OLrldXHK3H6p+zDNio/cgQXwx7MnoSOjI+CSsAtnl6GaJ/cs0b/tydUcqn
         m3GOQCfQJKzZKX/1yycZTxZsjbanhhWuq/AyESI2LBZ+pCiKFa4wBVjw3DmwfVbkHyjq
         3ggVcTmKKQMw1XRdaP++E3Q5J8HH4t2kgSenNEJkPRYWYmUVG0oLgHPXeo5jcGY3Mme0
         BuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105523; x=1694710323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=N9hc6wA1K2q7R39t4wPXs4EoUSFRU83NsxBTW5AZQD7V3Dip8rDeYl2FzPUBkFCprd
         4Am3A4wuxT5bzJbePCQrP/TVIOo2NNprBYw1TKs6e/i4lCcMgck2DtYTusMLk3d17KIC
         ABHwQnrHRuy9yxiIrcPA9XuD82cUGrLOplqMMU4aejgrlLzAJ2Eg1eHH6/t4XMZScFpu
         yUEq8yXsECn86IBMURAyXZVcMHI8WcmGR4arIgI1zMCgzPUOl3NKKCVMQvq6IK//7i4D
         xNdeNGr51yMlzNZIMaYYe6SXLOkN7jO2D3z6Nq5Gz1QtnIZCebbgQrOJuzx9WTTaqEcO
         bHKg==
X-Gm-Message-State: AOJu0Ywb1yXR6nh8unBbycfxxAvc4YVweyqWdAeZBwowmNIkeswHj0JC
        MKwNphUuH0M8gD+1amux/L8vsZruK4ejzDV83D4CQC5bN2GKXYyGuvs=
X-Google-Smtp-Source: AGHT+IFBMY2aVjLfU4IGVauVzzx/POp8es0I/Cix3TKhZtX3AA6hztSUPcllgbHHruPMjhuUvCKYwAD/N3CsJPq8yKo=
X-Received: by 2002:a25:bc53:0:b0:d62:6514:45b7 with SMTP id
 d19-20020a25bc53000000b00d62651445b7mr18630990ybk.37.1694070562057; Thu, 07
 Sep 2023 00:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-6-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-6-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:09:10 +0200
Message-ID: <CACRpkdbAeBQj2RUjj9ybaAiytvtgpF4PXFvX+S4C0ZVP0bb8Rg@mail.gmail.com>
Subject: Re: [PATCH 05/21] gpiolib: add support for scope-based management to gpio_device
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
> As the few users that need to get the reference to the GPIO device often
> release it right after inspecting its properties, let's add support for
> the automatic reference release to struct gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say, I'm a strong advocate for scoped resource management.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
