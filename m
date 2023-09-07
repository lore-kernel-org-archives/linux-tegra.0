Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F181BEC873E
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbjIGQau (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239934AbjIGQab (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:30:31 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4EFE57
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:28:47 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-34df2a961a0so4731625ab.2
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104074; x=1694708874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=Rj9LOaEu2uYxo4FIMWQLl4VTAIPzb3TBIcFiWX+nHgnZLFydA8B0yxQI8NlGxMNASp
         d9iYi8QSnN06QvV6ZYJhfE/4YVIMyjFVEEqWzEqpdScFcRnACSKc1fJGUMDVmUWlicCH
         E9XYdmJyhp3GC1lXwW+rdxeX4MuutD6ElZ3InTns+ejrNSNaUJQsNZ3qLaywBOhBMBeY
         TNSZ0rRv1GfS6DnaRdrZl8J+I4O5w7HPeJiWgw7+zYfeZGJUUtB2RMnEGzzB4vVDHP3W
         fVKoPc/GvZ5pTeZd6SRlykn7nn9SrQ2vDHV0k8zGXApUaVaaXLIoaNSpKJIxMGnX9gQz
         Y/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104074; x=1694708874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=TNbT6V+L06Aks960W/VN3rptEU8GeEK/n+FDLUrDf38hD/QM2uOKaFDVQw94fQLr6V
         pEHKJr+oeiXx6EjK5aLaZM0erQzA51VMFLfGWsYXFZ0RtBeaG7i73IUHjJIQuo2JcHjg
         XMx3g/n8GL9MMsrKlx1U8dlUOJxM8Ef+TK/xMMiiBF3JMcWU1QvEQMy9ShtbcLxMaoHP
         0kkMpIPeHj/g7EhNJo+nVLzwgo42krNoP0c8MZizclqRnqI8GD2LHnlMLkf+kKJSfWKl
         jBkHuXU3f6/f8pSUFX/ImbZ95mkxxwmko05F+LIG3HJ/v3m8i+Nzf1sb65GQUSUe90C5
         2WDA==
X-Gm-Message-State: AOJu0YwMoazrb7kE1VvFzi+FFkM5f4BqIx44bSMgq8fF2sYo9RpfzRW0
        JBPDtCj61ofUJ9FqUDMD4wpevoZpVEId8HFh53eK/Yyx3YbXeOctcMU=
X-Google-Smtp-Source: AGHT+IH52ZmMDQle74d5+xBv94alRH/CYtL/TIhLKM9b7HFrce/j3cJJJRCz5BcoTZ3hxH+Wxp8LvqydUyq2rr0UgjU=
X-Received: by 2002:a25:5f0d:0:b0:d7b:90c6:683c with SMTP id
 t13-20020a255f0d000000b00d7b90c6683cmr17866183ybb.26.1694070426178; Thu, 07
 Sep 2023 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-4-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-4-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:06:55 +0200
Message-ID: <CACRpkdbE5AJHiGan_oj4_kBSOh7okfwM0u9qDcEyTBr+NCO=wA@mail.gmail.com>
Subject: Re: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
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
> By far the most common way of looking up GPIO devices is using their
> label. Provide a helpers for that to avoid every user implementing their
> own matching function.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah this is what everyone and their dog reimplements.
Good to centralize this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
