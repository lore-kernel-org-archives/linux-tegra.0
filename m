Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2E3C2B9F4
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 14:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EBB0610A1
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 14:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhFQO4m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbhFQO4l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 10:56:41 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2896FC061760
        for <linux-tegra@vger.kernel.org>; Thu, 17 Jun 2021 07:54:32 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id ho18so10357694ejc.8
        for <linux-tegra@vger.kernel.org>; Thu, 17 Jun 2021 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kP9FZJ6E9jOuvBEfkZXpWLxsS4aT6M+o/FNvbytEBx4=;
        b=TAos1Myg6tlEtCXWGma2vcvlxK36hv6B5mhPDSIIXLJYHBezJ9p5/jWLLPjdXyNYV1
         FxomDl3fMGV0SvrzgsumjDVbUm/n8EgyOTJHV6KVK5soWZejWDV/gpXg7RtzmUyH5f7i
         nqIcyVq1AkuAyFzDLbrtLetR1gtiFS/w6kPyk3/YUICArZ6jnEzitOo+uce7OieRAmYu
         eZw1rgReSSuT7johry48W+XUPoF0o8ODuBNmlXNZD8e6z5wt5ZBH+R+jXKC4mgXfKJA8
         dP5pivfJr8M3DePenSPzKXIEjFp22RUrjlGZMMHzmrfMfNqpu0p0h7dTxpinblwIIHRZ
         ve0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kP9FZJ6E9jOuvBEfkZXpWLxsS4aT6M+o/FNvbytEBx4=;
        b=qsbkm1YNKHOiTvjwR7edcMWIyqm3UxMNoZPyjJ2uiqYJcKxeps6DcINA3I7we8mnPg
         h51y5E/TglVY8gfbUUmALZaiOz8KHgrTmrZ9Pa32p60yVDgRNEP/tNX6baMw/e0+8of3
         agntyxv45tNsHceAu8ez7hNSNQ1fhKOmarF5OiQEF6rkJ82jEklgVeYWat3L0QJiJNAQ
         quX9/7ni0+0fF3+B+dPUyD14VNK0mrJEekgW7ZFIcwC5biYWcK+mnq1VKyswh7dv8beX
         nLlFJ3SEz7FXe0Tb/zAuvksz7iIizH15MW4QlT7LQ1q/OK+9v40IbLrTOFKmBvke7dIg
         E9DQ==
X-Gm-Message-State: AOAM5329jebySl1ks63n+s017crMephq3PqEYtA3eoJBTBpgM4RsIJ1i
        zm/3MiID2INnOC6xviPLhRQruL5a8oclCe4LnkB5QQ==
X-Google-Smtp-Source: ABdhPJxrtEngye1FPnWP5qJqASxWqbVqz1llqVe9GVdKKRDt8N04M+Sb6HXeXjfsZEZA3AoWNAfc503S+WZNzPFUUYE=
X-Received: by 2002:a17:906:5648:: with SMTP id v8mr5645692ejr.421.1623941670599;
 Thu, 17 Jun 2021 07:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <1623924351-22489-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1623924351-22489-1-git-send-email-akhilrajeev@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Jun 2021 16:54:18 +0200
Message-ID: <CACRpkdYj9utWedo1-5NiRJRCHqhUmzYXHQzo8rvVq_4PETr0oA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Akhil,

thanks for your patch!

On Thu, Jun 17, 2021 at 12:05 PM Akhil R <akhilrajeev@nvidia.com> wrote:

> From: Akhil Rajeev <akhilrajeev@nvidia.com>
>
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.
>
> Signed-off-by: Akhil Rajeev <akhilrajeev@nvidia.com>

Please include ACPI GPIO maintainer Andy Shevchenko on subsequent
posts, he is looking after ACPI handling in the GPIO subsystem and
always provide excellent reviews. (Added on To:)

It looks OK to my untrained eye, but I don't know ACPI details
and expected behaviours as well as Andy.

Yours,
Linus Walleij
