Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C203C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Mar 2022 09:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237952AbiCGJmh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238987AbiCGJjG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Mar 2022 04:39:06 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655FC6FA29
        for <linux-tegra@vger.kernel.org>; Mon,  7 Mar 2022 01:34:05 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id g3so6762182edu.1
        for <linux-tegra@vger.kernel.org>; Mon, 07 Mar 2022 01:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4pAYxTpYPVm5BTKv0KTFLGCqSqO8rP0B5DSOXBwIIg=;
        b=XOVQYs5hOi5/QArBQXFroja0peQ2uhcvbl0ymGXyBrZz7jqc1l1e7nq9dqLl4KBskz
         HTpJYa4D4L4D1Ny38BmIdtiTGV5Rmzb47jmY6rHFEhK+3ZnqwtoEu9ZW8C7TiFq5YxRh
         cMwQjrWZ0xMPEW1P9VbUQA3AE8fCATUhNhLkkSYTWpNN6Xq4gKLRlXMEzsyWqI4/1PdA
         dV1tHE4mxBLY1iEoEbvoxZp8PUUJaUyUg6lhWpQ54LCW28Nh8a2rc8NNYuGLPvbOb7lY
         qbZXa7rxKXLMvcpvlUlP1uVrSHXZPJTF96M8bpcSmKbW1XJa4362k2PaotiKn+weMN7F
         xWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4pAYxTpYPVm5BTKv0KTFLGCqSqO8rP0B5DSOXBwIIg=;
        b=rj6uBoZqDcAKMzABMr1BAWaTuZGARyJqFACFO78QYvoUEgFsllYRlUlBWtySirRs50
         Mp56SUXGZR7OHb6A17WckmHh3/g7FO0KLGJyuLROxfF9srca8o9x1Dv8EbDgbUvGgPjm
         rXaPNh/7x38DDWpcOyIwEevp1Xt4ztomHYlOuyhvcEeqnfCrI/MK6sV82fKnS2u0vbCu
         OjFdvwPo+f+zAvYe9Zlu7FrkmrbXsvZxgsvHQDkRM4zGdYsADWnXyMR1hB2joYXOJiTa
         zNu7fNnwnrRz6qrSlLgnhn3YoPex1s/nTAUx63ABngcpwRO3UF5XqbqiCp8cuNfT1UYl
         kW7Q==
X-Gm-Message-State: AOAM5338mNZVQN3NnfyxKhv+tB3zx3oFg1GTBhMMdA+vakmV6UfhFAIH
        4/oSXqw6HPxVvwQr0VN43rz5mB2Hjz7cF2+IZYtPNA==
X-Google-Smtp-Source: ABdhPJzs6obQQ+IS68pyTHcyaWrxMiTQtAkSpPqurNqsXqJhCMR3bBC/qScebmZHHGDDCuou6y5dsamkrWzHkgOr8oU=
X-Received: by 2002:a05:6402:d0d:b0:416:1d69:f23b with SMTP id
 eb13-20020a0564020d0d00b004161d69f23bmr10131225edb.141.1646645637315; Mon, 07
 Mar 2022 01:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20220228153405.49981-1-akhilrajeev@nvidia.com>
In-Reply-To: <20220228153405.49981-1-akhilrajeev@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Mar 2022 10:33:46 +0100
Message-ID: <CAMRc=McbkMjg2Qku8XdC_GK3KPt_GFwi15PK4Yt-rRMKNs0rYw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Add IRQ per bank for Tegra241
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Feb 28, 2022 at 4:34 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add the number of interrupts per bank for Tegra241 (Grace) to
> fix the probe failure.
>
> Fixes: d1056b771ddb ("gpio: tegra186: Add support for Tegra241")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v1->v2: Add 'Fixes' tag in the commit message
>
>  drivers/gpio/gpio-tegra186.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 8d298beffd86..031fe105b58e 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1075,6 +1075,7 @@ static const struct tegra_gpio_soc tegra241_main_soc = {
>         .ports = tegra241_main_ports,
>         .name = "tegra241-gpio",
>         .instance = 0,
> +       .num_irqs_per_bank = 8,
>  };
>
>  #define TEGRA241_AON_GPIO_PORT(_name, _bank, _port, _pins)     \
> @@ -1095,6 +1096,7 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
>         .ports = tegra241_aon_ports,
>         .name = "tegra241-gpio-aon",
>         .instance = 1,
> +       .num_irqs_per_bank = 8,
>  };
>
>  static const struct of_device_id tegra186_gpio_of_match[] = {
> --
> 2.17.1
>

Queued for fixes, thanks!

Bart
