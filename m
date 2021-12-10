Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1315C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 01:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbhLJBuE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 20:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235446AbhLJBuE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 20:50:04 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3EEC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 17:46:29 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id m6so11344556oim.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 17:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K4JW2/qEYStrILqartAbBx8B5bJfEolL5T76+9kS2ww=;
        b=gnJArJOmqf5dXJgQmwXxkiMoRA26lm9Syi6/vDeIRWWvbI9yqNgFctwWu18wVvkR87
         7bX1DzX+R1/CVJSR7nTJn+WgGjxRa8WCkGdGika4UeHu9CppIpZ8AmiYVAHDdTP/RGT9
         RkxWzF2XyE0n4elmehdxEZ5R3ST3g/iwkD9aie0CqEduZB8FQ3144N6bBpUd0pI337/O
         YQMI8RIArukq0jnHW8ZSrkPF/Cvc0cuWFC10bzAWWdLjYRLDqVVyag8wXRvPSr+y2Tyz
         DiUJMcYShMX1aXyvhQZlP8+TnMwavHx7NQcbU5dg1rrXOaRyZyEj3ku2XSgp335xJpBx
         BOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K4JW2/qEYStrILqartAbBx8B5bJfEolL5T76+9kS2ww=;
        b=AqXxjkVBHer5p7s3sOCe2we8GNNCmHqV0f401l5YDreN/8tVPUSbP/oR/2bXwyViyM
         o/+ZiE0cN3qAsaztFmNYNwg9es4ofrK6BfJ7PuNDUsEISe3gzSv9sky6b0ojO5GS/No3
         Tbd73WtxQ3p87tEVRGa9Z+qD1SneF96FlAO2FN4lRceu75ELvXYrojyBMXv8bD0DGE4x
         XRtg168i7VeHPLH7S6SF5pnNfB+Wl1IXGHK5ygMH8YwU9THOTAsL7slIWhMGcqkDGIO1
         +u0rp+ADZFMfzabqlCdXfUQ2GDI2egiaCP5yPoKYnnPlsmtyclm0z87AkGuFb8J7w8cH
         g3TQ==
X-Gm-Message-State: AOAM530GZaDdl8NzwDNlDjYBMYa3Q+8VGLYfDTWsewrc3J7u5PE83qFF
        /n9nk465ysRH2b2QVG3eBeWVQFK6LrPjS1QTkxTRuQ==
X-Google-Smtp-Source: ABdhPJzAYaCwfSsBf3NmLm9BUy57Q2PiaK9iFhZfHmspReUMseWKJMiLIxy10F1Zzmq9OQfuGU/u7ItKTB1guKDlOao=
X-Received: by 2002:a54:4791:: with SMTP id o17mr9973234oic.114.1639100789236;
 Thu, 09 Dec 2021 17:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20211208173047.558108-1-thierry.reding@gmail.com> <20211208173047.558108-4-thierry.reding@gmail.com>
In-Reply-To: <20211208173047.558108-4-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:46:17 +0100
Message-ID: <CACRpkdYoD6dFy3nXJhf=kwtyUNq-UVn0TLHaEPRy=hiJGOb-KA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gpio: tegra186: Add support for Tegra234
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 8, 2021 at 6:30 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Prathamesh Shete <pshete@nvidia.com>
>
> Extend the existing Tegra186 GPIO controller driver with support for the
> GPIO controller found on Tegra234. While the programming model remains
> the same, the number of pins has slightly changed.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
