Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE547C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 09:27:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92DD461268
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 09:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234327AbhIVJ2h (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Sep 2021 05:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbhIVJ2g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Sep 2021 05:28:36 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2997C061756
        for <linux-tegra@vger.kernel.org>; Wed, 22 Sep 2021 02:27:06 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id 72so7392811qkk.7
        for <linux-tegra@vger.kernel.org>; Wed, 22 Sep 2021 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q5r+ZHmLBKiHQX70H5Ts56LudGzMirgnfs/7sEqKhoI=;
        b=bVtsQFphxv+PMBaFYpCnAOxW+4TF/zNObKBiv3jRnZJdKhXF+sN8iULpqlK7nv2udy
         EFb/O1TB3/yIDF4rt46bIctXU6lPtU6iMvapZQmNuvknsnEDRnHgSWodFUUGViCMXghP
         1OzvUxhpmggDrW2jiODD41+Dzdk54eUo2x+FRmoYy2myVV5x4bPNVjs5RJ2RqJieRDfk
         3a9GgMgnnNVwWw+TWLF3ueERRzIHuEXN/MqGTYOJaQhhwNlOs95vBIKE5CYhR9rxL91c
         O2KJJbKrbsU8N8ypJhrTM0lI6dxSxjzYVumuURPCeYmmV7vUHm94aFDIYwsGQ5gKVBSQ
         HagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q5r+ZHmLBKiHQX70H5Ts56LudGzMirgnfs/7sEqKhoI=;
        b=oXF1k1YMoSnGa3qbXi/W5MUyg8Cg0/HIwI74gk5aORSb/IRnfKBoDjVhkAZFq8HJBe
         RnoxcIZ0C78cWiNGWPs09LXhNW9AQfUEs/5qTixE28QjSci3z8y2JOJ2EdWFBABoSBu2
         cwjRSUejmbyIr0CPosJTPz8ZVxqa7nazJOoPdHE76ixF2MLPMrYogRpBDvexhRWcZ36j
         9c1d/wG0UuSTbOtm3n3+Zy94FPN+IBjlIR9q5gLpil+85zy6ZtZ3GywNWZadi4mAeFMZ
         KN2i11ypgzo8Rmx6D/Du4IRQpZdIhYlXp55aJJ42am8Y3tKZUH4RSHELCPPuBVgLNjHQ
         cWoA==
X-Gm-Message-State: AOAM53003zSNUcdnOMMbyqLg9uSz9DV3Ng+h38B7MYXqhCtNtY+Ty1BH
        zoYBymJbWtJeh50FaeLQ41ZhWV89xC4yCbelHygqIwrzBaU=
X-Google-Smtp-Source: ABdhPJwH8elDXf5KgspL13jX2tuE0QijykSs4P2ooWi/01P1LoJpz19UTo89aNkMG8go0fKysFrVB+WfuWILVnzwYu4=
X-Received: by 2002:a25:cbc3:: with SMTP id b186mr42620852ybg.199.1632302826203;
 Wed, 22 Sep 2021 02:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210917105412.595539-1-thierry.reding@gmail.com>
In-Reply-To: <20210917105412.595539-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:26:55 +0200
Message-ID: <CAMpxmJVhmeiE7vR4T+U7zDeqounqRNdTh9sZ6SEdqtyVM3E+og@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: tegra186: Force one interrupt per bank
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
> Newer chips support up to 8 interrupts per bank, which can be useful to
> balance the load and decrease latency. However, it also required a very
> complicated interrupt routing to be set up. To keep things simple for
> now, ensure that a single interrupt per bank is enforced, even if all
> possible interrupts are described in device tree.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied, thanks!

Bart
