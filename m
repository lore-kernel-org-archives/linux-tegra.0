Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DA2C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 12:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26BC42343E
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 12:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbhAVM7Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 07:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbhAVM7T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 07:59:19 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC6FC0613D6
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jan 2021 04:58:36 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id b10so6403826ljp.6
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jan 2021 04:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4seuth170OHrpzcvrGxWNmFx5FHFxq8P84afz/6Z5Xo=;
        b=HDnNK/PLHiVdfRkWV5yeyxOxcoyCn24hwPU4U5xCPwq9vE8u2n7RaykoB9INj9iET2
         qUuiJw/ezJMAYKqwQ7h8IxlVNfZwDGlZZF6GpSe26TrDgk/w6HvHpeAWDxUbbe+E/xty
         IP3BH3yzs6HK2qPiedEnoeSTrLmR1CdeJX7crvwKs2nTNUQGoeTHl0catxZTLfTkXsVO
         Pda4DDu/6DrlmZtvXnU1vRjCKW/8QMLlU7aoEzt2FFKEwyeRxBe3+Eec4bzCujuiac+y
         R0N+yTNXq7d2rzCjwGs9Ed3mh/bpNkyn7x+uz4CdUJEgwTkIsaF0BiCl9WNM0uZmSfN/
         Popw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4seuth170OHrpzcvrGxWNmFx5FHFxq8P84afz/6Z5Xo=;
        b=IHLu4s6daOjrzVf1bA3f3xdt+s2WQAZkwlHy7d2LRlRbQY5TMAI9OJlbizpJGWjhHU
         rMIirqhoGMAj3V0CHOtwb0dkOf0ckAlwF10/VHMlnc12iFvkDtFpc2rITZPurNraKXHG
         SW89ViPOlsPiBQ6WOhR1ndQukydpARnUIfZOLP3SPRbuw/IMrPJc+upkeeQCmJGE/MY3
         6AKLdguIWOvOqNtKeEoojKGzFMP7IJ/x1M9Gkp3x4kE/cplHmO7GtiL0VoNpiinbTe3F
         RuVGtBVPNTyZIf42UYqIb18/GWGFZ+pRuHYbtiYKkOb0a+6ITYkG0dENoBuMQkbkPJZr
         3Xeg==
X-Gm-Message-State: AOAM530jvWzxEIwcUIQi5rLLdvQr8N8Jw4uiNNQbT+6Q1NLmbsFwalWA
        bwZzkhX/ngXFLw2pBAsRamvwnVp65WY9+XQIpnycDg==
X-Google-Smtp-Source: ABdhPJzj59F+7XmvRLWmVdxewFMrw4mj2TMxm/ZMG2OB+xID5A+BKHAHHzn8FfIafN2lCelvrEVeOCnbUajF+SnUnUI=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr218754ljo.368.1611320314554;
 Fri, 22 Jan 2021 04:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com> <20210121225712.1118239-2-saravanak@google.com>
In-Reply-To: <20210121225712.1118239-2-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 13:58:23 +0100
Message-ID: <CACRpkdbR+W_prw-ONbU90q2hYrm9vTvFUDXHCvtDcbdZ8UwXsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] of: property: Add fw_devlink support for "gpio"
 and "gpios" binding
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 21, 2021 at 11:57 PM Saravana Kannan <saravanak@google.com> wrote:

> To provide backward compatibility for boards that use deprecated DT
> bindings, we need to add fw_devlink support for "gpio" and "gpios".
>
> We also need to ignore these properties on nodes with "gpio-hog"
> property because their gpio[s] are all supplied by the parent node.
>
> Cc: linux-tegra <linux-tegra@vger.kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
