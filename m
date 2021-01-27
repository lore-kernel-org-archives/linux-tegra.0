Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFC9C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 14:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DA702079A
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 14:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbhA0Omq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 09:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234324AbhA0Ome (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 09:42:34 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E33C061573
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 06:41:54 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ke15so2951499ejc.12
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 06:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DuOa7ZEsTI7Y364o/TcoZAKGbJr0jvsbyAw2/nr+qg4=;
        b=duXCWPaG3ZkgSVUzlFwMgG4NoT8oj+HYdl5VGOgUwN1C6zfjviGhPDVYvZ81cNFxmF
         6mERpEdHo36ackTZgSKHdTw01wWAPdgWmOh/Q/lP3bMdEGaiK5j5G+lOuJpBVb0/F/h2
         7EgR1Mqr1ZvGRvP1Kk2i1nxvj1qoiWuLEYmacafZ2yxmzDzdhdoJOPCIjTGkpFKHB+M0
         sjmiXHzlFZ+kiLSlchlSl9lIYVKEIXzbg9/FTXouutMU3Yn/nnZGYY9eFEUdl22IJzQO
         nxR6b+E1GUxgEM75eUSihWB71ahNsj2MoBWXaGpSuBwd3pKzoYlBjfw2wDLbiv1od1sx
         EH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DuOa7ZEsTI7Y364o/TcoZAKGbJr0jvsbyAw2/nr+qg4=;
        b=ZItmpMP+2wLr9fprupY9asozGGZb6ZufPcBQTzZ/EgVG0G5dWkesH4oq0vVjfFZb83
         O4QRvrz6sxCiwIm03CNrvNjva5EPE+xMzRs+LHPyhWfO5xCyLWwI0wJ0vk1CHsf+RB2c
         Fic0+j3D6rW66ePU2gmE1f4gTG/SEeB0QXyKAIsGTI0aIuKnhgWZy4Q7tRAa/HSaKJZR
         e+ERLGv88BPrT6kv3Zx33uZxsR8qAFJD22HfCkJTevzQI/kjauzH023KZVa6SIyMP6PD
         G0GZu5jeH1x1NxiqdbtSSveyL/VQ46stIpZdqABpqvqY7jyrOqKZogKkWiDBcph9TVU4
         dzqw==
X-Gm-Message-State: AOAM532DNR4cxHFN9i08hOgnRHuSOHKq+jmGW0aadpNqkMSpphw8twGg
        BsdUtnzI3ZLdymm/DBki3LiEycBvBn36VEc66u1V2w==
X-Google-Smtp-Source: ABdhPJysPwilf2kikwvGM0DJZGRBUU1uB0ZoL1FxDo8lL9H8tTMY2kUdkuafIucUFMixu3h8XhKrySdwI7H+CziTb0w=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr6787392eje.363.1611758512900;
 Wed, 27 Jan 2021 06:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20210122185543.16554-1-digetx@gmail.com>
In-Reply-To: <20210122185543.16554-1-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Jan 2021 15:41:42 +0100
Message-ID: <CAMpxmJW1V84a6JJ_nOcNOrPQD6q1BgYr=znZoWtzdoBvTyH3cA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable module
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Hi,
>
> This small series adds modularization support to the gpio-tegra driver,
> i.e. driver now could be built as a loadable kernel module.
>
> Dmitry Osipenko (3):
>   gpio: tegra: Use debugfs_create_devm_seqfile()
>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
>   gpio: tegra: Support building driver as a loadable module
>
>  drivers/gpio/Kconfig      |  2 +-
>  drivers/gpio/gpio-tegra.c | 31 ++++++++++++++++---------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
>
> --
> 2.29.2
>

Series applied, thanks!

Bartosz
