Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F9AEC873A
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236743AbjIGQHh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237284AbjIGQH0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:07:26 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF28524A
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:00:24 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-76dbe786527so64857785a.2
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694102356; x=1694707156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=rKCGgNAb+fEh9tZV9cL7WaAXUFG3SGcuKaFLMNX8mLfc4mmj9rzlUSXSyoo7AOLrhw
         /iKs3KsjF2tAeBotI4KbUkQrlr4af6J+0F4aOWk9Q3YZkIw0nI59V7nCC+gkil6jRWEa
         lLYP4SBQBA3BZIrLHzdV/8hvCXyjIKDncjnCa5KHiCYTr2PCyqVICR0JgbVLjEFkf0dN
         xXJwirW3ly7YCjmrvsUMAikHe9jx4BuecSh2hAagEXGHIi3TiW+3iIs26gfiMMpmISqn
         nTV5nKOsHxQIOQJcOlK/84UlbcjeNu4TPugbuY511Itrtn2Hr1Xcr3PSadJm+uJM8eVn
         qzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102356; x=1694707156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=ksydxQ/8NxuOoKMUQ9Q8VyW+bNnobDCUvyonIz2iuct9amz/LEFbBFHLualqdoSvx2
         DBDFy04VZ2Hnytrglehxm/3KkqVtvNbnDgQGfWEfodXwnlzKTar32XwHUtFGYznO4Noy
         YRkxOfLXlD0MdaYNeqqUoVwPppa+fX5cGT3JDbpwDLWG+iOroHR0a9XPjzystA/JexXI
         0FjeX1StQveb2EEP85KduDpGVr1X94j/JGe6AwUZF1nliIhz8Ja174k0kEU/LMnkU9VJ
         Q6dlEr5Z3O/SowmCUcJ0bAdc6Yms1R2xscHz6VEuOq0zceOedPQZjTfSkvKbXGDNJ/DG
         ClTQ==
X-Gm-Message-State: AOJu0YyG5kPomT2FhR8I+DiWrw1n4QDgSrClocg/OTpC1NMCRYkB/gQ8
        lYBBRZJjzEwFLT2PZsqaH64EOxc7xhC6MKGw10C2rpABuFL9AVZTkWs=
X-Google-Smtp-Source: AGHT+IG2TLQ2WqAfuGI+vTl02pQSFPJWDZVOY1MfvYV7hKobdzNo0vRGz8kywS9VyDIIMdmuzYR3qPmWC3h4lMZlj/s=
X-Received: by 2002:a25:dc81:0:b0:d7b:9a5d:37c with SMTP id
 y123-20020a25dc81000000b00d7b9a5d037cmr18599620ybe.49.1694071708542; Thu, 07
 Sep 2023 00:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-15-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-15-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:28:17 +0200
Message-ID: <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
Subject: Re: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
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
> Using struct gpio_chip is not safe as it will disappear if the
> underlying driver is unbound for any reason. Switch to using reference
> counted struct gpio_device and its dedicated accessors.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As Andy points out add <linux/cleanup.h>, with that fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think this can be merged into the gpio tree after leaving some
slack for the HTE maintainer to look at it, things look so much
better after this.

Yours,
Linus Walleij
