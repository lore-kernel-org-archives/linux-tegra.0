Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398B9C43217
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Oct 2022 08:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiJQIHA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Oct 2022 04:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbiJQIG7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Oct 2022 04:06:59 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43400578B7
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 01:06:58 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a8so4054172uaj.11
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n7z2zqfikD651OG+4PqNGLgjVdCisNAlofdRvbyLWcg=;
        b=NdMPhGP7re2rsdLDqwAO5pjkZ0WmwEnl/DutqM++yjkYM88jbyO8FHEhHaZQp50N0r
         WVzoYtJNARRDgvkzHe7QH6BvS661UZA+eCMnFPCTZeAjmjXS/AQa5sZ43SKPR/2SKXKT
         tVA8CHHDUqavWd1yFVCtOIWJGE4WdG1i8J/L3ZGFcbYI0TT96h5G7KDCkSPbaBUCwoUf
         h3kETGy921lChCp0TPBw9sWiPlalFvv60qauMv0Pa2oDzZcBwwxSQBJ4wSU19SXUAgOg
         rWXF1t50JurYxXikU5zaZl20VQIFIE9bgyN69IaakYLI4yMrRmj9ZHsJ3RoQM8vamluo
         TAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7z2zqfikD651OG+4PqNGLgjVdCisNAlofdRvbyLWcg=;
        b=wl/zmdES3ubIfBj8qFByYXJeDaySgKydDJLqfzMfrLvp/RK+rKrLDgnwW5h2NVT6sS
         x0Eh4a/3zuVEgdfRW06PQ8AjuQhJ4IHdL1RBQH6XMiSpzJ77Ra6l7QzmVys/ZqgHp9Y6
         9eQtE5lWK0zATlC0VFS6FvrGdgUwka4S7a/jT6Z2r5LztDEczV+wugTAkh1e0fHrSF6x
         pQ6lHOiMdbKDETzw7zermkMOQqaCW/rGPJKsxUdmxfvoYwIofvM+w+2rHHgFZlH1CDKf
         OkxEEM8LCYXmM33r4M6WuWW6O9B6wI4jei5SqcqNWLTKSYNCSAXpB27EQXbwZGYusPNz
         EEOQ==
X-Gm-Message-State: ACrzQf0uQWyq4TwYAtmk0r8TldkSfofedIod915+YBw/nH/IbZ5d6GyT
        x/0RsWiNkMew22SQhRmm6vsFlmYZLbWx51QsKek5sQ==
X-Google-Smtp-Source: AMsMyM5zKGzq/HLcG+oVMJ1IuRtu+Ts3/HzgbGWj/9vgLKcOz67M0wCJQ+LbJp5ikNVBUPZUSTKaAsCMTG02LhSp4C8=
X-Received: by 2002:ab0:2155:0:b0:3e2:bdc:cfa5 with SMTP id
 t21-20020ab02155000000b003e20bdccfa5mr3781207ual.119.1665994017309; Mon, 17
 Oct 2022 01:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221015172602.84855-1-clamor95@gmail.com> <20221015172602.84855-2-clamor95@gmail.com>
In-Reply-To: <20221015172602.84855-2-clamor95@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Oct 2022 10:06:46 +0200
Message-ID: <CAMRc=MfR50MnQo9LpBJQXojEzVn8oAzjLXHC=om=-HwkN+NOuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: tegra: Convert to immutable irq chip
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Oct 15, 2022 at 7:26 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> Update the driver to use an immutable IRQ chip to fix this warning:
>
>     "not an immutable chip, please consider fixing it!"
>
> Preserve per-chip labels by adding an ->irq_print_chip() callback.
>
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # TF201 T30
> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # TF101 T20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied, thanks!

Bart
