Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED6DC433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 22:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91D5225AB
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 22:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbhAWWzX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 23 Jan 2021 17:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbhAWWzS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 23 Jan 2021 17:55:18 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29190C061788
        for <linux-tegra@vger.kernel.org>; Sat, 23 Jan 2021 14:54:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id h7so12645900lfc.6
        for <linux-tegra@vger.kernel.org>; Sat, 23 Jan 2021 14:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hpPVms42Qj3wyzK8TZxiwezrbYMDzaDl0qJC7o+O95A=;
        b=JnqAn/nCDH1I3FJ2vvEUCe/9Qs3MNAMiuY5aKGF7agHtBuKa2dND+oSvmNVE6emUej
         pxTuKutuhNRL9cfapcZH72FJDOOX/7/LML6jN5A4d1c8GCglVk9/nAvupo8MDAKKC9ak
         bbmfbdLoO/FM60BPmDLeGOocEXzxdQtPihW/27JqeSNuOMKzK1gqdRP6Xq9n9mxjSTCL
         8XP4fcv9qC1S0vTlpFEqEiFugakmMS1fj2L3olkRzErEOfFd7B+XtwT73Oh1vZBuxv6B
         t52ft1Y/8QlFC0+2DlNFmQB4eVqRIoWPviczj6RaY3SoJrRtL4FORkIDmabQYGjNi2oX
         mbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hpPVms42Qj3wyzK8TZxiwezrbYMDzaDl0qJC7o+O95A=;
        b=quEsXV/3VsI1pcdgBOfLoOgGcyyOMsGEmeDEMrjPtCklkpFUsYaZi7FZHBGCvZAKS1
         8u2ktqaYEviHF2dCiXUtBIjYsEvP7CjoAPDkw36O9g6h0VP9TzfgsWberoCr4sY5QupZ
         VpzkMy/E6PrPViSMRxY0Ll+znEPt+I+GGz62RnCAfhWEf2SiGPgsWw2PF+pDxAiY2d5i
         zxEMmqAwwMc8/K3vOMWKbkiw9y84fZqkyQOyjBJcdRtq1kPpgssS/QeFD+Aq80bp8gbG
         0hU/Ek9YsIn7S1XXiIAuLR0YiFwCTMGBla+N+zOcgZXIWjcZdGXKOhAL6ayKjncFqNYh
         HyEA==
X-Gm-Message-State: AOAM532I3+/khL12gNkMmdrIf1U4IXAuW05onFRfLdU5j6LUa1YWvW4g
        m75inRRuY9m5z2O4TIq999rsxtdO3nCvMPFKyRdk/Q==
X-Google-Smtp-Source: ABdhPJwAkjlpagQHKLJ3rhbl3XiPLlkcsgvSyAEaBP9bd69MBoanQKe+NOJImbhbS1Ybz6vhpv4n9Rf5uSnyLSqJiJY=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr831929lfe.29.1611442476603;
 Sat, 23 Jan 2021 14:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20210122195959.4197-1-digetx@gmail.com>
In-Reply-To: <20210122195959.4197-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Jan 2021 23:54:25 +0100
Message-ID: <CACRpkdbpMhXXg4R3doD5PWBScM6kKKBgShA5uxAuptuHzHLAsQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tegra: Improve formatting of the code
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 22, 2021 at 9:00 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> Don't cross 80 chars of line length in order to keep formatting of the
> code consistent.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
