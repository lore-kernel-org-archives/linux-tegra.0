Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B422DEC8750
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 18:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbjIGSrx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344317AbjIGSrq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 14:47:46 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF45C92
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 11:47:41 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-76f066e4fffso71972785a.2
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694112461; x=1694717261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBdELFiF0kNq2P4ovxPr1G/v1B3B5Z0Pa4x1EdUn7xY=;
        b=yoYAw5uGiSExsMZJhFVs92IgkL5EICU/hyAsDWvWJzVHXC/y2YKd8ybyDl4kFN4aYb
         T1SUIzWUnQk4u7KbDVjDpb5zL6FPRa9cJScYrr3q68iMF0I4Q/WYeyKpW2GUELxABK6f
         KN+QtcFiAs+xc8pF92P75Hxwaa2cWfAGIhB+1FKNrjRnmAnL0soJR2V93pNO+blYUtct
         CntDkpAQg3vT4z6cheFEzOsJEN6bKaX3WjZRV6ARzrgH7xX3nXgGOcTCZUT+c9PHp2pr
         8U7z1fubC+YDEe6CIQMt73V6wPbzzlStLEMM8h5dRftKb6hSRoz1qLz9sRzZNl/+DH3s
         jz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694112461; x=1694717261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBdELFiF0kNq2P4ovxPr1G/v1B3B5Z0Pa4x1EdUn7xY=;
        b=s1TQvkI2tkCH0HFjwpOl8g7KDkW0mqnqLY8QttiMXSKFbsnP7bzC+YPav7tPFpoZwu
         jM85U/mbSqEN0RBgBL/8Z6z+zxj4K7bMNlWEsLlfAxv4QAWawW+IzzCL8bajfZns0MQw
         +2yM8qdfbjayDhnHdfib5bPgw4YgxG+Dj4zNUbtviivbTDxnpA7/yWr4jbkP+bv+gNBI
         CCfU9Ydj2xYiSBswRGyUmiAqW3jnYuYUfSNO8gYpG/VtJnFZSlM5D0UjTJDqop48MrJM
         51uEAxJLrHoyUAOCpepbfvC4J1kIplcshVJemqEHfkCt2pWumm4/IBWaQX9aDA5sduHX
         SRDA==
X-Gm-Message-State: AOJu0Yzqzou5qW1IDL5nENYO4p8oMcp/XacC5YsZHT7yZsOwSOkohIXO
        T22/kyB2GZX8ZHH74nOC4WxI5VBNOfM5uVFLIyd8AmyACRTGLdBg8fQ=
X-Google-Smtp-Source: AGHT+IGquAMmj4BV1IgcH+0hlmwrCPO8RvK5dDPIHBFPHMvw3mBi9yKQYdiyjPsOt1CRLSecOSiNHyNGSnbycipPFpA=
X-Received: by 2002:a25:4057:0:b0:d7f:1ef3:66a9 with SMTP id
 n84-20020a254057000000b00d7f1ef366a9mr10826771yba.15.1694071032928; Thu, 07
 Sep 2023 00:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-8-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-8-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:17:01 +0200
Message-ID: <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
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
> Let's start adding getters for the opaque struct gpio_device. Start with
> a function allowing to retrieve the base GPIO number.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I guess you have a solid usecase for drivers needing to do this
crazy thing, because I suppose you feel as much as me that
this should rather be gpiolib-internal and confined to
drivers/gpio/gpiolib.h?

If you add a valid reason for making this globally visible outside
of drivers/[gpio|pinctrl] to the commit message I guess I can live
with it because we need to think of the bigger picture:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

It brings to mind the now confusing "base" inside of
struct gpio_chip. We all know it should go away, but since it
is never used during the lifetime of the gpio_chip - or SHOULD
never be used - it should rather be an argument to
[devm_]gpiochip_add_data( .... int base);...

Maybe something we should add to our TODO file.

Yours,
Linus Walleij
