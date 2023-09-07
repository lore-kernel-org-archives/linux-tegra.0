Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC5FEC8743
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 17:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240979AbjIGRUr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243144AbjIGRUp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 13:20:45 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE67CFA
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 10:20:26 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-64a70194fbeso7635646d6.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107177; x=1694711977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=KfjXapV0EYs0lDWfBVGhnabmMB5zk1IBzjN6mpPD+FBxGT2PmWDxJ3OF9FQkRUf6/T
         Ox+pqQvcKVP9w1DUJg0jnbLbKdXCuGESfXS+BnTMJn7YEIqeSj8wFflTkdCqiT+XZWHS
         5MD/eD8u3a2PmJHA5eY3wCAcZ4gCJ8h6MhoWmRm09jLh7D7+qqlurhAB0HL19OXQr6ap
         D0fRpO/S4ptVV38pN1TfNoVX0flWUnMgB501Rjx1SrpYPq5Wo48RPFAwvZmlNhnfB3s0
         t2F9v2kjTHAUd5gXmTLn+YNh5YVomUvsIIEhI/L4ufRl8IarqeGwRToUNo1PQlfWt9dP
         oJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694107177; x=1694711977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=n7NYJZJnx9BC3cZrNsRZDIMHWjU7RsGPcT9ntDdKioxojmovmaSdRcSywqKf/9iVZK
         60m9jbEA7Q+xphKB0poDmis1EYStV6CRaZWSZPWd2KS0sizCChKhJi6/7E+lQslpaG43
         u1rNT4frTF9N4jpDhqMW6xUYOBlWdMMeIGegE6/JsJb8QapuHyEsKzYHSe1EvWuYZjfh
         XvVKr6eXsb7cAYqqs3Ac9oHFQvxmOGMADQWJfSOG+mUjqsBUxQHr6yu9e757hze8r2aR
         +Y5LZOyicIL8GMllDrntoSRJA5kWJcn8imMJrcJB9AwCV6GTpYutpA/hsinb8sawhQtm
         NoyA==
X-Gm-Message-State: AOJu0YwiKkXEwc/iT1y1R3GuMHY+HbuycEr5xFr7LX7dxtgD7hp1q83e
        iUoYnkUnEMSShHokPvaxuDWHBy8iz4PAqLqiQeWPmmKPa6dP4uoCNXE=
X-Google-Smtp-Source: AGHT+IHaxiCnBZm00LuWWUA+a8rnudg+hvum/6YQLw0kwU5o8WTcy0PQZuAfaxNBOQSTfwUYu0m1J/nwQGnmFDsy/5I=
X-Received: by 2002:a25:e6c9:0:b0:d05:fa02:5bf5 with SMTP id
 d192-20020a25e6c9000000b00d05fa025bf5mr19872193ybh.48.1694072468477; Thu, 07
 Sep 2023 00:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-21-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-21-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:40:57 +0200
Message-ID: <CACRpkdY-DMJAzkjVFx2Jyw6yG76u8cZ61YPUbcCsosN5kZ02Ww@mail.gmail.com>
Subject: Re: [PATCH 20/21] gpio: sysfs: drop the mention of gpiochip_find()
 from sysfs code
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
> We have removed all callers of gpiochip_find() so don't mention it in
> gpiolib-sysfs.c.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
