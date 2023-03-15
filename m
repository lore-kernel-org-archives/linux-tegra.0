Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDF2C6FD1D
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 12:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbjCOMQc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Mar 2023 08:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjCOMQ0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Mar 2023 08:16:26 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D7A8F510
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 05:16:11 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id s23so12577497uae.5
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678882570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzgtuMSfYssFcR6AaTEq8LEPYe/fsdaQKwPpEYrgic4=;
        b=k3Rp96Q41gIHkxWl46EzvcWsbg9XDbuPnEwhG1PjwX6Xr1s+nIM7LYjeM9B2UORuSW
         VI+IpGXP8JadT0gZJHx6i86d+SVB/6zvk8f12f6vLgeXgooy/yAT5jecP3GtLuBXepJ0
         ExKTOOQ4Ai6fyKLRkB8MirMRjkAWnQaD0Z+QTiigFQcd4pOX4F8wHUeRbscZJovG9PAp
         pn/x4i30NMz802/Qe6pVcWg011WMldRe8NUQTDslX0drhhMrTJsjh+tKyf4+uqLGxKIt
         OHakhlV/CKY+yb0Ypg2Q+pY9l9SC9/yXJjR8+8PWP678oiPOlKCtiLcVCNegFGmAeKnN
         xe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678882570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzgtuMSfYssFcR6AaTEq8LEPYe/fsdaQKwPpEYrgic4=;
        b=BlW8xHg/iHXphMGRhkWBvsQhKWVEeIbMtKwvGckUAvwzbhBeRzPXlxaifFu3Oet5W+
         3viObZKTsqSxVjEtl6gS1BCFYZAYtZEzyovUC0u9aC5V6yYWLmLeQco15gJnGLXfLayF
         8FvC+Nwos2mKYFulNcykmFNydXsQW5H+EIa5HADPu+U9sbRfg+LCX25o+zLashDLY3c8
         M8EqWJ4T1dKBxpUATKadVVW+YfkhwlyBPSphlOwxhf1W5LO31UYzts++sBbRkxQ88lW4
         3I1kt5AV7WyMYgrypjyZ//U0Pho/jLh767wLBVfaZB+YFj4IKTVJsl6oGY7N570bqONo
         sF4A==
X-Gm-Message-State: AO0yUKWaPUTGu7W1uiVI29lFNfq4LBwdNUMpf0Pp3wpyZ8QFFtgr/M5g
        8HbvwF84by8AdFroNfPrha8rR+dgiSZPnZ4N9qizAw==
X-Google-Smtp-Source: AK7set/aG+bFALcuRIRUQTR6qqfdF0rarM40hOIYBqY24ynLEqKWSLA6YkzVNlk2cI4HcNeuGu1jAfrbV+hUwnjZZqo=
X-Received: by 2002:ab0:5402:0:b0:68a:6c1e:1aab with SMTP id
 n2-20020ab05402000000b0068a6c1e1aabmr25631831uaa.2.1678882570399; Wed, 15 Mar
 2023 05:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230310190634.5053-1-dipenp@nvidia.com> <20230310190634.5053-6-dipenp@nvidia.com>
In-Reply-To: <20230310190634.5053-6-dipenp@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Mar 2023 13:15:59 +0100
Message-ID: <CAMRc=MfG0de07p7nJMya5RfK6a_wQhrKSDZxGMk2L=vhw=_oUQ@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] gpio: tegra186: Add Tegra234 hte support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        robh+dt@kernel.org, timestamp@lists.linux.dev,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 10, 2023 at 8:06=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wro=
te:
>
> To enable timestamp support for the Tegra234, has_gte variable needs
> to be set true.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 14c872b6ad05..b904de0b1784 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1134,6 +1134,7 @@ static const struct tegra_gpio_soc tegra234_aon_soc=
 =3D {
>         .name =3D "tegra234-gpio-aon",
>         .instance =3D 1,
>         .num_irqs_per_bank =3D 8,
> +       .has_gte =3D true,
>  };
>
>  #define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins)    \
> --
> 2.17.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
