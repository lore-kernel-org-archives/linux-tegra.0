Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD30C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6452C23131
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbhATHrW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 02:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbhATHrL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 02:47:11 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6ADC0613CF
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 23:46:30 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id k132so11473863ybf.2
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 23:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2I7rI5GjEUa1LLS76qVO2YXGGEG72Ek4zDDQZ5QMYgg=;
        b=vMdbhKGjPnV/6BvG4c8Bvey4dQqb09nuR+r8kuPnpEhiNJa4rUT+5ct46DvukfOiQn
         +mpDvVtExlO3gMymMvWfppMJDgxKW/+4RiWOns+R3xGXTN/1EvYOo64mp5KIQau8fFzv
         qD+jxS0AxbLyNHbrGAWWs8Y+jDD2bm3be+UFddcxMoMMb+JexIaX0q60bc3t2wIM6zph
         agDX4OYfH9MD2duSCVOZkA+3o0ygY0IO4FmglUmAzDJ10zOdQ3jDjaovTkuOcksRooEH
         ZOIhgWSC0QGpCttkjjMSTXKd4vfJTInvR9Ph8xX2+pb0Vl445V5fRbDAHgvgak0A4D46
         yPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2I7rI5GjEUa1LLS76qVO2YXGGEG72Ek4zDDQZ5QMYgg=;
        b=p6agWQyTlOaBmlvflBv4vznJT6EKrpRQRgyk4Z0pU+hZXGrZfh6am1r2oPc8Pi0jv2
         BAYQ+9itZotECrwZLXVJNRbIVSYCYzb35rqJnjm+hRxbrE5F9D1W8beVd3tWcuKOqyhc
         Fa1cPYFSqYIrZ3yA8xOOhXNvU7V8v2zECovg/zpiqfpTNHxzwitSQqKfoQrNauuW9d2L
         WJo1yeWIiKD3pTA6OOzhGr1EwmsoHTX9P742QVLROmNoyvcqZ/qDmMFaWYpnIAiiB0LP
         FfgOx0HNY1tB9x3GCPNpZaubSAPQQ6poGvGpI35EVhpLYeNJP7z0bufDI2xCOtkOXDwv
         +Umw==
X-Gm-Message-State: AOAM532/mB3OCWsaxHdlS298RxZJbJCEPbw3QmbVwm+kYynCfZvTY5NY
        bh5P0KccyXHZmcFwJnokRnXWbTWFx8ZB6mBtXkamLg==
X-Google-Smtp-Source: ABdhPJwpmKi2+dpWZocyWr8KvJ8s9tQQA9oc+J+oMTZwVYMBU1GdDE0K7i4l6NIjYGA3kESWmM0Yk5FvSzBwl0vBuqc=
X-Received: by 2002:a25:c343:: with SMTP id t64mr11504051ybf.228.1611128789791;
 Tue, 19 Jan 2021 23:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20210120073310.427462-1-saravanak@google.com>
In-Reply-To: <20210120073310.427462-1-saravanak@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 19 Jan 2021 23:45:53 -0800
Message-ID: <CAGETcx_pUxH9gUUigsC7pFgtC_Ppw7gzcvHdSqZO0YtUvb3fcg@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-tegra <linux-tegra@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 19, 2021 at 11:33 PM Saravana Kannan <saravanak@google.com> wrote:
>
> To provide backward compatibility for boards that use deprecated DT
> bindings, we need to add fw_devlink support for "gpio" and "gpios".
>
> Cc: linux-tegra <linux-tegra@vger.kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
> Greg/Rob,
>
> I think it's better for this to go into driver-core-next because this
> fixed fw_devlink=on change that's queued for 5.12-rcX.
>
> -Saravana
>
>  drivers/of/property.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 5f9eed79a8aa..0b256ce9d7d5 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1271,6 +1271,24 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
>         return of_parse_phandle(np, prop_name, (index * 4) + 1);
>  }
>
> +static struct device_node *parse_gpio_compat(struct device_node *np,
> +                                            const char *prop_name, int index)
> +{
> +       struct of_phandle_args sup_args;
> +
> +       if (strcmp(prop_name, "gpio") && strcmp(prop_name, "gpios"))
> +               return NULL;
> +
> +       if (of_find_property(np, "gpio-hog", NULL))
> +               return NULL;
> +
> +       if (of_parse_phandle_with_args(np, prop_name, "#gpio-cells", index,
> +                                      &sup_args))
> +               return NULL;
> +
> +       return sup_args.np;
> +}
> +
>  static const struct supplier_bindings of_supplier_bindings[] = {
>         { .parse_prop = parse_clocks, },
>         { .parse_prop = parse_interconnects, },
> @@ -1296,6 +1314,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>         { .parse_prop = parse_pinctrl6, },
>         { .parse_prop = parse_pinctrl7, },
>         { .parse_prop = parse_pinctrl8, },
> +       { .parse_prop = parse_gpio_compat, },
>         { .parse_prop = parse_regulators, },
>         { .parse_prop = parse_gpio, },
>         { .parse_prop = parse_gpios, },
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>

Please ignore this patch. I'm going to make this part of a series I'll
be sending out.

-Saravana
