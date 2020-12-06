Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8D8C19425
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Dec 2020 15:14:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 867E423332
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Dec 2020 15:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgLFPOy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 6 Dec 2020 10:14:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgLFPOx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 6 Dec 2020 10:14:53 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4358C0613D3
        for <linux-tegra@vger.kernel.org>; Sun,  6 Dec 2020 07:14:12 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id f11so380504ljn.2
        for <linux-tegra@vger.kernel.org>; Sun, 06 Dec 2020 07:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ewLQDP/8tzLVIjOAB6Z6yBX/hdvnuw9WqxClNkbxi5c=;
        b=ebMvmXZOn+SFPjj7tRKJ1Hg0BIRHg5+xookwP/W5cirHmg6iPhktYlp+2gAc/z1Igl
         MCoTL162aPOs/YSVqaV0dJrwuDgHM5bdjWcAIzUXlE6Pk+3LhVuueQ6wQwomppL7QwjO
         ROSha5rWv1unSTc2Pc5V1ZB98hP4dbvBbKEnXWxo71XL3t0qAzPPG6KuQuy7DBnql3Tb
         k7b2HPg1EQ1z5e44YOZl4aHSugKhI8bnOi4ndXsp8b6R3M/IaCS71yF6cRzAzsHm8ief
         25QVaE93St2D3e04vPrWiBVZlJskrseHCpXsx1k9oLI3L5QFsHtCKJPy3zrZmtY1ITS0
         4cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewLQDP/8tzLVIjOAB6Z6yBX/hdvnuw9WqxClNkbxi5c=;
        b=YGJt+h0TdFco5ZsgjoJukYTmm1nq0tXpOgU2YeKlLkiduaUmGMKP7OlmjtCVkC3e6O
         JS1h7m39dfHnKdGytJ56Z9AA68a7Y4dk2VcLby01JEUkBsFYmEkXFT35Q8ka5kMvF1CG
         ReJaa6NYKRK14Gwpdc2U2Dc3zRZrpUCaJeGW/cLPUcPcWzF971lh/LoSV3Bhilop4+OB
         uopKQpXvoJOs4xoaoeMZXAkWpaIvkOCcLg/F5vikLxhtO6A7MaN7ao/hTCEymHTz41Mg
         oGhwBGJNNe+MfWisSGWRhiN9jTuye2FlkzfbN5RLR8oh4NEXdlEhvwYEr+c1Rdx7cXcV
         DUOw==
X-Gm-Message-State: AOAM532fCjLQwdfW2nH68qjNnQTiHGSLeVY7EHPFRAOSIlLU4p3i/c8S
        n+J8M1leUCmt4tre3+ZmXMKaQR50F3Jm8ZvRjU6tsw==
X-Google-Smtp-Source: ABdhPJy7Rh18d+1pv9wJ41IJ+1/SLO4A2I29ybUTEusEbi5vnUDxLdouW9sCljOvQyHl/r6VEcE/XS780edAEcMoGYo=
X-Received: by 2002:a05:651c:c2:: with SMTP id 2mr6851536ljr.104.1607267651173;
 Sun, 06 Dec 2020 07:14:11 -0800 (PST)
MIME-Version: 1.0
References: <20201205053328.9535-1-digetx@gmail.com> <20201205053328.9535-2-digetx@gmail.com>
In-Reply-To: <20201205053328.9535-2-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Dec 2020 16:13:59 +0100
Message-ID: <CACRpkdY+fLhUD4cpM7X96Z7XjtXBkoVDRN6pDBUk+PjrQjTxcA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: input: atmel_mxt_ts: Document
 atmel,wakeup-method and wake-GPIO
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Dec 5, 2020 at 6:34 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> Some Atmel touchscreen controllers have a WAKE line that needs to be
> asserted low in order to wake up controller from a deep sleep. Document
> the wakeup methods and the wake-GPIO properties.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Looks really useful!

> +  atmel,wakeup-method:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The WAKE line is an active-low input that is used to wake up the touch
> +      controller from deep-sleep mode before communication with the controller
> +      could be started. This feature used to minimize current consumption
> +      when the controller is in deep sleep mode.
> +
> +      The WAKE pin can be connected in one of the following ways:
> +       1) left permanently low
> +       2) connected to the I2C-compatible SCL pin
> +       3) connected to a GPIO pin on the host
> +    enum:
> +      - 0 # ATMEL_MXT_WAKEUP_NONE
> +      - 1 # ATMEL_MXT_WAKEUP_I2C_SCL
> +      - 2 # ATMEL_MXT_WAKEUP_GPIO

So you can add:
minimum: 0
maximum: 2

I suppose?

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
