Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AB0C38145
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Sep 2022 18:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiIFS6z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Sep 2022 14:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiIFS6y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Sep 2022 14:58:54 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4AC606A7
        for <linux-tegra@vger.kernel.org>; Tue,  6 Sep 2022 11:58:53 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id y3so25457929ejc.1
        for <linux-tegra@vger.kernel.org>; Tue, 06 Sep 2022 11:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YhCD2BUnvk+EART+qJYRghEdCBWvNx4ju2rtPfEiOI4=;
        b=y+siq/RM3RjL+a1SK0nGMlaEWNEBEQpvol3sAC7TSLKfqrvgrwE+jUGmQgB/MUNllk
         jnsMr1WTUb1cZLxUcNNORCDaeZfQt3O1dgZahrjHwLFy0N6vd6qrvqlsy4AEpQ/4VXsf
         zWotv3g4A24afILYTS/uVTv4MQrVjjn09OpgSxusqSom94LbqJNvu50DCuu0P9ro/JId
         GkTk05VU3tLi5ADw6VkS0s49SNsT77h2jqjtOZEWVI40YVhpkHSt19Z8JmMq67O9jUmd
         fUm9c2Qa9pCn4G5/mzAkrd7N5g1tRPHblr6ND74ND6KX6C6xDtOakIOOqteQoziPUM4L
         N3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YhCD2BUnvk+EART+qJYRghEdCBWvNx4ju2rtPfEiOI4=;
        b=qA3qISdfYAA2r6+NgN0+NhmSsA/nmUGmWCxo44GmKYKIjfxyvMRo3fVu7p9DypGjIK
         bTH2zv5kBW+amLrbn9zCdoglG9fNJPqBbLO9AtCylFn9tFviv3oEm0d5BYd9X5yrX3Y5
         31h7ttuy1OifinqgqyEfzxj/YLfsnc7+MnAqwpQnolhD9fa/7Fi9aT4ecgTIgF92vWet
         VpPLJ8NKry0xirP7cROXADvG8DfzDhMkhWBrpItCAPIzo9V1AY6FOAMguXpvXFeXlCqk
         rG82HHSZjE2shB/snd2WRuugoBkWHnyun6EFq26TRyJdvliz1g6CvmR9r2JFTzKmgv4P
         RC0w==
X-Gm-Message-State: ACgBeo0UEIjXy2uvWQRF7mwzoTUOiRHmVbseUNOGadvHdN5dF9zr7fUW
        72L/4RjzeWFxwOnP9WznOQ6C7ezERLhU5JDY2jv9lg==
X-Google-Smtp-Source: AA6agR5AOS8szLUYRUywxgPElU/nyOQWQJSIyBhejwRqUbyMNY9SBFGhCIk8wI4FG9Qv8YfYQiDR8F4+fwjKMWs/ojo=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr41006298ejs.190.1662490731615; Tue, 06
 Sep 2022 11:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <YxeS1BK2OBH1P/kO@google.com>
In-Reply-To: <YxeS1BK2OBH1P/kO@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Sep 2022 20:58:40 +0200
Message-ID: <CACRpkdY1DmywF3UdzBQHSp6N_uwK5MK93Do8TkKExtCVVQHZ2w@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: stmpe: switch to using gpiod API
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 6, 2022 at 8:35 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> make private to gpiolib.
>
> We also need to patch relevant DTS files, as the original code relied on
> the fact that of_get_named_gpio_flags() would fetch any data encoded in
> GPIO flags, even if it does not reflect valid flags for a GPIO.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> ---
>
> v1->v2:
>  - add DTS changes, as noticed by Francesco Dolcini.
>
> I guess we could do a dance of changing stmpe to check the flags coming
> from DTS and try to distinguish IRQ flags from proper GPIO flags, then
> have a separate patch changing DTSes, and finally a 2nd patch to stmpe
> to use GPIOD API, but I am hoping we could apply this in one go...

It's a mess, let's just apply it and forget about it. It's one of those
trees falling in the forest and noone is there to hear it fall-type of
things.

Yours,
Linus Walleij
