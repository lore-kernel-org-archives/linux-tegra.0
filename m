Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F32C49EA6
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 11:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E989761878
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 11:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhF0Li5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 07:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhF0Li5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 07:38:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78245C061766
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 04:36:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id k10so26076391lfv.13
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 04:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L0uluB7HuQhsw7mGnLWslYA3uy3EG1MTHEbuGazF1rg=;
        b=ePrWJTf7MzJcYP7/RoZK6gO7JLRBO7zov1scQSv9IVmTZKotCrKZoFil5Br5uhC/mq
         LmsZKu5JQrdFYFzB2L1VY8HZqJjae/32EPCP7RIsqJVyGu8BpM/KdvFHyofUzkEGy7yQ
         xy/7kIRtpt2O+sotuqaMxLbTySSIaoe4lry2oJKnKu+Rahjuf0c2wow19vmAlrlXT0js
         sXrkKtHJeBtoguCVvVQNJrLVqvGtORkuiXhNBzPe2EDsx+3SuJ8tgRQ2b3lqIY85Tbe8
         SKo+Z8vVKo5d+6UPMHPSxjAChI3zdgwGPzM332aDSNCggqFnPvIIgQP53lyKzRLUgXc4
         O7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L0uluB7HuQhsw7mGnLWslYA3uy3EG1MTHEbuGazF1rg=;
        b=CzWhLyG39I3x1I0sOZ5izPTmQUYb6WRzI9Sr3GSqzEegfx5y7Av3S1gI6Pg0vu6Q6o
         Qe2agQXosRVCHUbxxzHbz/YqVZL9XamVlBQV87RvbSGJtEA6pJpFwq8EMhxBsfYUV/Ub
         wUzmbflS6vhAV2G/89fYkUhNQyR4TTQLn4CIYLINDA4qkTFKoQ9sI394LTk10zlbp4yI
         Oieov5Y7QlpoozX2G/T0vT0bhJhxd6r7yrr3KML8PaPLtTp4t079kpnK+t+HzVyUq7pX
         YezgIJPn2KR6jgoGdsHu7TK8Z7cJls3HYyQAY+0vwg7uycL3afV2/eZRtZuS2ru0tYLV
         Wo/A==
X-Gm-Message-State: AOAM533QGPnAGzUHhM0qO790jw6ylbQfg9cUuCIfpJJIgXBZG2KQsJJN
        isONkQ+1YjZxF26ccinlvczLvH0VZK94a0xTVncQOg==
X-Google-Smtp-Source: ABdhPJxWfLAvo/+u9bB5PGDdyQPOHtnDXhWs2ic8sha6ZDWiAWx0ULOR3o0RjVDJruFbYAGHa1N/Vwt3sGwfhFv2iiU=
X-Received: by 2002:a05:6512:3c9f:: with SMTP id h31mr5354921lfv.465.1624793790690;
 Sun, 27 Jun 2021 04:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-10-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-10-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Jun 2021 13:36:18 +0200
Message-ID: <CACRpkdaqKJLUdf3NiFHaTgu6buyhMb_D1yKyHF4M=eTQ94pe-g@mail.gmail.com>
Subject: Re: [RFC 09/11] tools: gpio: Add new hardware clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:

> gpiolib-cdev is extended to support hardware clock type, this
> patch reflects that fact.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
(...)
>                 case 'w':
>                         config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
>                         break;
> +               case 't':
> +                       config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
> +                       break;

After the checking of the command line options we need a small sanity
check so we don't try to enable both realtime and hardware clock
at the same time, we will only be able to request one of them.

Yours,
Linus Walleij
