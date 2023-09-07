Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33876EC873E
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242375AbjIGQl5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242007AbjIGQlk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:41:40 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B4A1FCE
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:16:07 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68becf931bfso999472b3a.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103316; x=1694708116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=n9zB9EYP6O0TUZH/kOoXMCe158EHo7ChJ08MSY1jM3STstcKNxti4Mh2tPtPKbhsLi
         JNjbRmtK/8vc4IgAiBmbnWGni52wAvIgkbwNhVzaYDL/0KjsDu9C1RL6BNr7pfhoqOk9
         cmnwhygUaX887Eb9ep4LfoPP4LzK4MOA34RcJvBy9IOOYNauRlP+B8hu3NDPVDvftcGD
         /SpndlFWUGE6D7/WFq/fiyt7bnZUZPDMBOeg9vQg7diKAhv9NCuKPCsng+wdQtAKfi2R
         cGskisSPauN46hMAv5JJ5Us0JdkERkppLW6sQkOTe7Qfxc0VxiwNAMzpIR9xCHeQPErR
         zYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103316; x=1694708116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=QRJc9IoKUV6ze7fwqgrlaSty3gcqRl6hC8TbS7+LIAYmtrxcPyT+2e1FQwqZtohw+m
         MZ1ffh6Eh/lNkXbRWnRgNaFUVTTPNrmzI7fxyydq7tnvHxAvSp+1KP10VYy6+Vr6F6CN
         nRiYKGVa3c+spp6e2rdQ8G12lOysCPIAKdk65p9KnE5Qe2MgZz1Q+tOT4x+f8fX+fUZT
         bdx6Rjn8ahv4dnw7jRTcjjVXgaypzhD8aoWDv78z4Qyo/E0mWrCzjVxwwd5FKoWym2Fj
         8NSRGzT4LJdYkZjXJDe+hNLxMsKX2im2YHkmJoA5tVZxDjTIM1BfgOTouprs603Xgn+7
         XJag==
X-Gm-Message-State: AOJu0Yw9e3WVuaZfh19TbInCOnlLYVa4bpo4FkgW/iTxKYoGx+fL009G
        yMa6BnIlIlcQv/p1Ef7fA6e3KoLLHcHLcsfkzm6AgWet/RGW8JGOGhI=
X-Google-Smtp-Source: AGHT+IFnux13voMEYKL2AvFFZ2IntVTZOtmPk8jRTbyWfstIdLEdj42EUj9cU8dCaEOekjzsm7vjd98pJPwVLSbOMrc=
X-Received: by 2002:a05:6902:120e:b0:d78:1b39:fd03 with SMTP id
 s14-20020a056902120e00b00d781b39fd03mr22126055ybu.64.1694072432520; Thu, 07
 Sep 2023 00:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-20-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-20-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:40:20 +0200
Message-ID: <CACRpkdZkPbvDTMo_ZOJ8rZ5+dUOqOi2_EfS+jzreWjMtpJrVYg@mail.gmail.com>
Subject: Re: [PATCH 19/21] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the swnode GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
