Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16279C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Sep 2021 19:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF31760FED
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Sep 2021 19:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbhISTmz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Sep 2021 15:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhISTmx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Sep 2021 15:42:53 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC7AC06175F
        for <linux-tegra@vger.kernel.org>; Sun, 19 Sep 2021 12:41:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c8so57758670lfi.3
        for <linux-tegra@vger.kernel.org>; Sun, 19 Sep 2021 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LYTzOdcrX47mnET/O6IbbirI1g0RFSgGZ65Y7f58LeQ=;
        b=spwp/KpEFJhDnqy54onPk162/G5pw8dUturgYEWZX1FMOfciExMa+ChSfIm0Gy8Tp7
         RNSSNAW0C+T4WiMO9tsEYzDiJxApm2db0Lb18vFiJkAV7CXWDtn1ZQIUcel6NuhM6XO0
         E2sfuU7GPsSaC3q+V8/6z/J+CXq3s+xXYp7LsdlTVP7y5Kljis25gsYra++pXnn8PUFN
         Hr0J0gZOrwJKACWnGNs2mThrmdJ4MVHy+kRHw674eHZZ7d419xVC3Uq1nhQ3jvAackV9
         0yw9zsy+BNOq6NecZQqOLfpn/7rax4qcEgSGCOrJyTaNhjGQBZked2iOG8LBCcWpqwkZ
         zyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LYTzOdcrX47mnET/O6IbbirI1g0RFSgGZ65Y7f58LeQ=;
        b=CdreiCkIiksJlTLdf1QSTXx8gUWq3v7vavORGNK7DQIU3CclJTkus0uwEcwmml+Hiu
         2DOHriJf6fJOsj16gA8N8lnq4CvDdJQlavpTbu/lv0HNqe3fTe2+BBxD19DGLVGKnsqT
         Nwwfpe1Av6Oizenn1tRsOsrB7g1rmFkBoZkZJbujSG2wUL7aNLR1RnjavEbw+xTsYuKE
         fYGTziLzGTnaUYHcejpukvmUCAhGT4ND1DDM9fM2v444RS1/2ElF/YZfte9EDwJewYJm
         jqcdO+paEWFRa7I2dysEZDkiyy84bUSxqFmtB4ITv7qjyiaK797vPuGGE6ucDICK1Awv
         ga4Q==
X-Gm-Message-State: AOAM531lsXJ9x7+W0ARw4O/j4A97/5f8JZBF9js1PkgsYU+jKe2FbXNk
        d5cSwH5VET7utwO7DqaYHfHE99E+jfadxxap2cQOEj1P/RA=
X-Google-Smtp-Source: ABdhPJw+a+RYqW7LREzMJdZrkeqv0faFTmrJBsxG9VYISXMESJvXoq5ic1siEmlwm2VnTvDad1sJr+wxcffypYWMwso=
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr18829959ljo.288.1632080484878;
 Sun, 19 Sep 2021 12:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210917105412.595539-1-thierry.reding@gmail.com>
In-Reply-To: <20210917105412.595539-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 21:41:14 +0200
Message-ID: <CACRpkdb+-6dQ4F-asb0K+_9d2JtP7LXyMgjC45V=C0kpBiuAJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: tegra186: Force one interrupt per bank
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 17, 2021 at 12:54 PM Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Newer chips support up to 8 interrupts per bank, which can be useful to
> balance the load and decrease latency. However, it also required a very
> complicated interrupt routing to be set up. To keep things simple for
> now, ensure that a single interrupt per bank is enforced, even if all
> possible interrupts are described in device tree.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
