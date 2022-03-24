Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1373C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Mar 2022 22:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355390AbiCXWcE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Mar 2022 18:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352786AbiCXWcE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Mar 2022 18:32:04 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD20BA320
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 15:30:31 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2e68c95e0f9so66580897b3.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nx70n0suL1GDpxFS4bYKUTt/7IVPxxVYBu7tsC4lV4U=;
        b=wV1PHTJJBE46LfidocVooxEy6bX7qvq2914zt2Oyz0DEkO1P2b9T4RBK2uyUlfHMXi
         8L4h61xtgy+nf1Sp5SjH+p+8xOdkyIscKNzC5c+ta5w2ZHwPHdqOR0m4HDH3kZXyKUd+
         4nVVH+VWPcaO2hF/59Kup2doG3cbGYIsSNIDHELH+X3HMxlxEBK6tWEYjh3cu7KJsdFz
         8a/veQ9Qdlc7QnvgFXa+xmf3DPpx81MEUB3oDQM46z75GtJbBjRqGYYo8c4Jh72kwjjj
         qwwd+T0/mXVeNFlmfSMkAwTE6NWBqBCe6huzIpYFivT8APWWXtVemglzRRTu2lcqtEft
         r1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nx70n0suL1GDpxFS4bYKUTt/7IVPxxVYBu7tsC4lV4U=;
        b=R5STAWUUxmSxaZRmQSFKyctKVKAYiYDOXamgfi7okd3HOVEeD/yMoAujoQPoLSRlRE
         NcobBtvcmw7cZlapQ4FhEpTTu8Rr6EOjlN2kTNFEHf0txUsQJ2zoy16pX9eF0S558zKN
         jLAoQZ6pnVegmsMq9+RZxz9xcGCkJAofH2jaW5m8HPafBUZDuUZa47uQhW2xshuNpb//
         sdfAe5HhqqDWFz8w5g0yAh1f+91ovi5ns05N/Rxf3wdgzqd3GXsdQ+qTRRwX0qyv2/lA
         lLdJil8CBwYYOSXzGLSxcYc4+gQ7SCe17kgf5htJY02NPG1WsqSSC1EH4ARppETCWBEp
         lj+g==
X-Gm-Message-State: AOAM531BhjciYlr2d9QVPXav+i3l4ueEYcXoQB8Jn/P0x4bNXEemfWo0
        DtZpUgX2HvPPMlfxku3Dubc2oHZMKwyQOQuNtRknQQ==
X-Google-Smtp-Source: ABdhPJyX/ehlHwq02rrgBUmaGF0K2xU+m3rjYaoGRrmp/Pny8sEiCtj0Bb3Mr1HrmXMEl0nAG2wa9t/q+Y8pZcewrXk=
X-Received: by 2002:a81:5706:0:b0:2e5:c451:b257 with SMTP id
 l6-20020a815706000000b002e5c451b257mr7678607ywb.126.1648161030506; Thu, 24
 Mar 2022 15:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220223154405.54912-1-maz@kernel.org> <CACRpkdbEDoPeu=TWmsJ_t-4+NtyiiSCXoj9rymspZt0nC+yrsQ@mail.gmail.com>
 <e39c68c6c8c99fec796461cde33f78df@kernel.org>
In-Reply-To: <e39c68c6c8c99fec796461cde33f78df@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 23:30:19 +0100
Message-ID: <CACRpkdZJch7SmMNGhfJ9hpNP+=yy4ZE_8wuATsaqdHQdaMhbAQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpiolib: Handle immutable irq_chip structures
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 15, 2022 at 10:35 AM Marc Zyngier <maz@kernel.org> wrote:

> > I'm happy with this approach as long as the 300+ drivers get fixed
> > and the old way of doing it gets deleted.
>
> Of course. Note that it will take some time before it actually happens.
> My current plan is to stick in a pr_warn() each time a driver
> following the old scheme gets registered, as a nudge for people to
> update their driver if they care about it.

Fair enough, we have a bunch of those WIP churn tasks in
GPIO anyways.

What about adding a blurb to:
drivers/gpio/TODO
so we have it on the radar?

> Regarding documentation, are you OK with me simply replacing the
> current code samples with the new approach? It will at least avoid
> giving people the wrong idea. I also want to write a brief migration
> guide that people willing to bump up their patch count can follow.

Yup

> I'll repost something once -rc1 is out.

Sounds good!

Yours,
Linus Walleij
