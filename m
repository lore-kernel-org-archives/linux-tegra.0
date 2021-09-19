Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B179C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Sep 2021 19:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28A6261052
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Sep 2021 19:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhISTn1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Sep 2021 15:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbhISTn1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Sep 2021 15:43:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA27C061574
        for <linux-tegra@vger.kernel.org>; Sun, 19 Sep 2021 12:42:01 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i4so58212688lfv.4
        for <linux-tegra@vger.kernel.org>; Sun, 19 Sep 2021 12:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=267Y5GG4wv3jBVNFLCjYNg4eEpoY547mjd1IsPwkZZ4=;
        b=aCEfsATQGKUcZ6Gbf07F1Ad396sTKdrW+S3XJ9iraG9sqiyz/afeQxWCIk/lwOXWWu
         vmHOByZNuk5iXVZOfH39JWTuJ43DVu5kYyEflMaLVzqKsLtvGXOT5Z5MH7JYhHgR2Vg7
         0+uN2m38f58OtVTQBeetop+lFeFnf9ATVg1sHCh9OsjFUIHSd7e/f33b171Sch/cqbQ1
         5KdGzTp0kNomZzOClhbZFDzi0Cf8L3whqyfMhoIe9RgyAuYV3bA5/j3l4kQhBIkCgIWm
         kvE825n+8A0Ad3rA/rnww53FxHBs6uWAoPA6JCYRETNN/Sn0KDQ3VuyQV314Qby5eqZ1
         dAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=267Y5GG4wv3jBVNFLCjYNg4eEpoY547mjd1IsPwkZZ4=;
        b=O1rlbgxq1BxBv2SChjJEU8guxaCaWgYfMcR2yFTFVgZLmwyWgmubby5n1DB92lCWLj
         XSS2b/ZjmdBFfdpPWT2jl0y91ZNV6H1ClKeA8uaI3aBYax190F4lB6EJldH8sCtX2DhP
         zxiLVwTvVIyeVVgRwXEZY0XU3ZgyCH8QvZIHQbzrDCj1vRpBu3J041mYBIShdTL88g29
         9SsmGpPvmKG5xhiIG09Pr4ZQhVhstesZ0bs2EExf2IauLLRfQvqR42vDyJ99nXHTvMQX
         /7dD+j9tf3oTgT5DcD4a0welrEMni5h3zoN/rk1qnsV4IkXCh5jdiEdMaVN7m9JZko5a
         JbqQ==
X-Gm-Message-State: AOAM531lkgahonPevufUj1f2k8RVKbPs1V7gEDkswnCnZeo1fjlj59cH
        sGRIIthaw2hUJWpaaY07V0bNV44Z+lDPonOebXVi1A==
X-Google-Smtp-Source: ABdhPJyOo0GRxViJevniGs7x1CN7wVCSU7UZCda+WhFRVhOAhvLyfjPAJB50V+BaC7FyiDJ/fYxFy0KgzWfbWa2BcZw=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr13156944lja.145.1632080520043;
 Sun, 19 Sep 2021 12:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210917105412.595539-1-thierry.reding@gmail.com> <20210917105412.595539-2-thierry.reding@gmail.com>
In-Reply-To: <20210917105412.595539-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 21:41:49 +0200
Message-ID: <CACRpkdboaxpVhLHRmWw8vtuXNZB8z5okSYLCBae-WzNjpbyK-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra186: Support multiple interrupts per bank
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
> Tegra194 and later support more than a single interrupt per bank. This
> is primarily useful for virtualization but can also be helpful for more
> fine-grained CPU affinity control. To keep things simple for now, route
> all pins to the first interrupt.
>
> For backwards-compatibility, support old device trees that specify only
> one interrupt per bank by counting the interrupts at probe time.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
