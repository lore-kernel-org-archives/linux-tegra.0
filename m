Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F744C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 09:27:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14FE461268
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 09:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234402AbhIVJ3I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Sep 2021 05:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbhIVJ3I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Sep 2021 05:29:08 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC8CC061757
        for <linux-tegra@vger.kernel.org>; Wed, 22 Sep 2021 02:27:38 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id a10so7125369qka.12
        for <linux-tegra@vger.kernel.org>; Wed, 22 Sep 2021 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tilLj76TPuTpGDBFmhCvj0XM+49+fiZL/DQswhreJ10=;
        b=nofHkNUbYZJvR4FoyoBpnjRnqf1qNSRV6vW8PlecT60OgNgezJSuZ8F8xsvsTa4RiX
         qstp+7BG0ldBR15Yrt+ebdFB9rpBPDvkSkIp2nVChS2b/BEqM2iOhGdz8FUQsJZPEbw6
         CNXKjna7Sq+FlRpCA7dhwAxDfHWDG/xOYceelI0KuyWtkHWDnHsG/dP0uJmm8/gWvLjG
         vrBnB74DHp20uq43sdBTOwZq/3HND/7TSQVKuj5BOHprjA6KCdJd+Xj3mmmNs4abR88I
         sxW8jNG7sCScDebqqIrSZCE8zz1UpezSpxb+T1LfXiMWyvo4WHTXHW88K1phn79BJWRH
         xRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tilLj76TPuTpGDBFmhCvj0XM+49+fiZL/DQswhreJ10=;
        b=4SwCHdjQBbKR2EcfgNRx5GUDU9EvKLm5sSAgc7ErM7rMhBQ3YOaR+8r9yJiaZGIFA4
         IgKVYVYPaxkNhUk0QFOmjnDY6oOd2NQIeqJiehZ6kiQTYVhbD1v6DPomCna9flkfsVfI
         OJ59rqTv3T6P3SHQ30XF2zESYoZoQ7Nq8enOBHvKXCcI9wRU0QyraxJGoAFq5T3LARw/
         bJZa3AmC5WXEnHHgjs2m6PZBwTDqzX9oHgfrunkOs7kdHVWJEjsYF/CH1AF1TinurRRJ
         /QK/G8iN84TVAke4FsIpgMn/GL5GAW8c6Tlp2pFUoLLDwVZe9/qynKzyp0USE1jLN/RE
         ZZMg==
X-Gm-Message-State: AOAM532//dwNGAMW8Ne9pUXA+KuvifLNEQ6niSuXOj+nLTYNNlKj9OhF
        L3+PWyUsQpsu/VXIa2oG8sem4phZhXJATJP3/mHyrQ==
X-Google-Smtp-Source: ABdhPJx+7jMUDAlovngPB82cNaH261sjiihbmIpUdUWI+Yq4Gh0SgtwiTP2LNAxQ2CQe+tUN/BPbism8KQnVzsefdz4=
X-Received: by 2002:a5b:783:: with SMTP id b3mr40104169ybq.328.1632302857487;
 Wed, 22 Sep 2021 02:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210917105412.595539-1-thierry.reding@gmail.com> <20210917105412.595539-2-thierry.reding@gmail.com>
In-Reply-To: <20210917105412.595539-2-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:27:26 +0200
Message-ID: <CAMpxmJW5XkwrawJX0ypJ9BVV4_LEO6g3EkptGKG0LCxsmHKriQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra186: Support multiple interrupts per bank
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 17, 2021 at 12:54 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Tegra194 and later support more than a single interrupt per bank. This
> is primarily useful for virtualization but can also be helpful for more
> fine-grained CPU affinity control. To keep things simple for now, route
> all pins to the first interrupt.
>
> For backwards-compatibility, support old device trees that specify only
> one interrupt per bank by counting the interrupts at probe time.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied, thanks!

Bart
