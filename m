Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEEFC64E7B
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 15:10:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E03B20758
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 15:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="M6GzMfZ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391528AbgLAPJs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Dec 2020 10:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390172AbgLAPJr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Dec 2020 10:09:47 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE43C0613D4
        for <linux-tegra@vger.kernel.org>; Tue,  1 Dec 2020 07:09:07 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id b2so3655098edy.13
        for <linux-tegra@vger.kernel.org>; Tue, 01 Dec 2020 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RTOWmJcTi6tDwprZNdib9Hdn63NVGgGhw7pXQyKPyrk=;
        b=M6GzMfZ6FF7DbGPeP3NnXgxaIiQw4pdouFhBBJ+/YkU0qgns2g9J910z6UaG/504fR
         yo6SiAO+F9hFvvdZHOS29XEzYnpQF/JgL7IjpVsTFAxFmioDZAJZzqAzUMjgyqEOvEC5
         KVfjAE9Mb4jFaoBgbnn9qb4Zk8l74i2mShu2CaY9zJ2ORIYkDzUcMEnwwbfEwFzVmY87
         dEWsQPiu7OjYl5oV0BB5vAV0lxVVuHhfikU3wBXiO49UJedrpXtnthVuj2xNhDAcPqvl
         tySGoyMX+FBR6krNlJr/HrBybicyTg2y6RgT1lpI1UwWsxcwStC0FDcPZGl//6n8iklx
         2vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RTOWmJcTi6tDwprZNdib9Hdn63NVGgGhw7pXQyKPyrk=;
        b=sP2OrOUF7wxsMn3/IwSljia1ma+zK+zDA+IOf52B3GtXfjnzxdqmyMtSjwekEqNVSp
         SJhgrXxtCwsh2Zo7qvbNhbE41aDNwuMsfNDPikoUn3MxzxYoXG4iVBYp0k6Ob+9exC19
         cgdWiO2gG/C0BNkywNlbCvPIVCO/KUHS0Uyv53zpucqOlQVTf0pCoWZ7JRqGhhB0zYQN
         50jgDTT4Q0kP6Gs0Y19bO8sKPHNLOtiO1ghSNHCmoC3FVECeBslSkB7H239ypyzyS/Jl
         e2HF8Y9OFCCOWqWl0NU9djYoQgoAjOITEK58y8ayaftDxcT/bYlu/2qcC5ukq4KvSvVf
         Z2xw==
X-Gm-Message-State: AOAM533WBN2+zCDRrQ2UtXMCjWwcbFmtA784jIo9N8ugUYGyiT9DbkGd
        OiNskhbIQB+iRZ1Df4Lzyp4o6jIWy88zY8RRL/6wqg==
X-Google-Smtp-Source: ABdhPJzrWBdQJnmW0BM0NTPvh2J75LukiUCSsiOAD+wTKDT0AULBU0OK7XeO2+V7DnpJ+Qa4WT6COZy0AbS/GJiikqY=
X-Received: by 2002:a05:6402:88c:: with SMTP id e12mr3532883edy.88.1606835346190;
 Tue, 01 Dec 2020 07:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20201127140852.123192-1-thierry.reding@gmail.com> <20201127140852.123192-3-thierry.reding@gmail.com>
In-Reply-To: <20201127140852.123192-3-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Dec 2020 16:08:55 +0100
Message-ID: <CAMpxmJVDo9DmKLsDzRH75GNzRAu2OTGOfEcPz6oEj55tvSFtEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra: Convert to gpio_irq_chip
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 27, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Convert the Tegra GPIO driver to use the gpio_irq_chip infrastructure.
> This allows a bit of boiler plate to be removed and while at it enables
> support for hierarchical domains, which is useful to support PMC wake
> events on Tegra210 and earlier.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

This looks good to me but Linus is much better versed in hierarchical
domains so I'll let him take a look before picking it up.

Bartosz
