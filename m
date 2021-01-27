Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501A4C433E6
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 14:41:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06D54207C4
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 14:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbhA0Olf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 09:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhA0Oj6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 09:39:58 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AE5C0613D6
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 06:39:17 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id j13so2739481edp.2
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eEyKW0OOeD4bMUfDmmY4ocDleZrgI9OkhPdKV5qoR9Q=;
        b=NpkcQrhNC4YHc9tjgqzG7DBQsgSQqM+chQ4UTHFp+TY/c7PVyiUpubswyJzTAL1yaN
         FPat2TWT/YofF982tghVVSNvEu0sfx/bDwbrUdZoQEjq0pZkcheI5UP+vi65N0hIWPVd
         VifIeF5iOuQvWvw3ze/3rvHxzLRiKcT9JydM8UGDc0ENAJ4bLPRw0l0R0nIY2v1Z/1Ao
         zt06xy34R8cuLJfdczhgeM0Lyd4l1teb4vCe1UoCPz6yr2gwqOlkH9WJWIagSD5CMH9v
         YVEKM8xhDJa6x5Cqf6C2zHE2AJx4IjB/UgkJ2/OS4dBtECctzEY9Uetkk1q4Rvglk3wG
         jSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEyKW0OOeD4bMUfDmmY4ocDleZrgI9OkhPdKV5qoR9Q=;
        b=tM4kJE34TomsuONuff6+19JpWg6q7W6BE+ZXX++lFYEwJvaJHvUY5T9STY+dvscER9
         EcbtTSFAssn/XcsshoXSlfZU23/dwEz18gkSBQufFmQ7392U9+RIvDcvt5L1aJyUb9Md
         WZAXshlkxaCy1VH4rKaOsFV3zyk8luGVqOXhCJCD3B8vs8zqwrwloCXL81NwAY8P8cSe
         QzI/s0ucsU3QLtu+KHuLjbWk7tHJyG9bQz2aeIHfW6zouIUUn3TMPo5kMotMTiTCutw0
         7HDzMy/Q1HAi4ydvAjHt/I348JVFsvt0uLjsiUFdwhVkrOzlVnp6gPGnv5Mze9O39iWs
         e3hg==
X-Gm-Message-State: AOAM531MBDXHImUMysGUsgWPDxNGiBGVzIdvC30pIT+NB62GeU0IbNsW
        ZTL1j5ixO9rvCaPfTXcfKHUCXWUaEV/eNILaJDwgqA==
X-Google-Smtp-Source: ABdhPJxwP7vlLvBkETSQDDl3Zo3nlrn5s4PVm8Xh/te4H7ksBYhxc09YD60i7DSnCBOBaUnzlCM58jr0O8r6Su8dRHI=
X-Received: by 2002:a05:6402:134b:: with SMTP id y11mr9213196edw.88.1611758356543;
 Wed, 27 Jan 2021 06:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20210122195959.4197-1-digetx@gmail.com>
In-Reply-To: <20210122195959.4197-1-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Jan 2021 15:39:05 +0100
Message-ID: <CAMpxmJVYnxnrq87hmHKnEbCh7pqYUDSCgzWSjvVx4TP0YvKrDA@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tegra: Improve formatting of the code
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

On Fri, Jan 22, 2021 at 9:00 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Don't cross 80 chars of line length in order to keep formatting of the
> code consistent.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Patch applied, thanks!

Bartosz
