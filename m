Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09CEC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 21:25:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99E5360EE9
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 21:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhJXV1t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 24 Oct 2021 17:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhJXV1s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Oct 2021 17:27:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8B1C061745
        for <linux-tegra@vger.kernel.org>; Sun, 24 Oct 2021 14:25:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u21so9010416lff.8
        for <linux-tegra@vger.kernel.org>; Sun, 24 Oct 2021 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oJzHF/Z5fjP27mQA1nxiLi/yTI4xtj61op5B1TuJ3fM=;
        b=JUH7zF8hHI+MToSfVcMh/cTdGxkOximv7meXju66VAwbJSkiZLFr16B736nOIVlCpa
         c1HSZBPsypTgwn4o6WPBFkkPZjyNvt7grmfFmm2opWqCQv0TXW7Myq0F8QJxz+yHz8mI
         R5VhK2W/NU2dmp15mTmO6rPh9qgPhBz7Ezjrv5/b7SrO3R11PJAtR+IlNHuQIs5mTodn
         a40cOvriUHccOc19z4iLZoodLBPILC1qxTiW5yWaJa7KwgqI9zruLo6QNoT32JahzGLK
         Gb45S0Jew+xgl5GGVp5ri8fODC2YvxxGr76eb5aZG6uwg3Osntie2arMB0DoSDtY2kxn
         jgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJzHF/Z5fjP27mQA1nxiLi/yTI4xtj61op5B1TuJ3fM=;
        b=ZM6lfJSJnL7YrCNDR4k/YlVeXIJgEQi78CQHyrsgRKWKZ8UkGxflG7odlMUPe/Jt9M
         7kwtt0/EA2ipVRM3/RIv3OPQA0BhVpTPdyMB6jHY8aHmdKkf9b+N7baRsXuhWvC50wLt
         ADFllNmIgcF+JApVf46x0G8aRlIfdlUqi6jdNciROYudZvoaAQtUqhKGPinEWoPaXoDM
         slWP2zXh6EUfDKqt3/ZhlxaxChpGa/b+IJXODykeklv2bJYAe4l/9UrJ9e1tBNpw+EAm
         QNtR18Lq7Vm4L+SaEQyvASP8tyAltOQOJIZfbt97fIB+HROD7IG0mQH8ePtARvE3J33g
         2VqA==
X-Gm-Message-State: AOAM530W7GWY/26T1Vu92VS3/smeeGCLXhTxVa+PQAtJR3CkIS99H9PK
        h8JqO9wJMzm1ciMnEqdSpqsz6MjqXTWhrgfsjHzGNHJ1QX7tPQ==
X-Google-Smtp-Source: ABdhPJwt8o9K1DIszxN50TffhxTaQ1oO3M2G1LgnK0x2wMJGhMOsGef7TeP/cw6Sisz5Ih7aFrtZZE9PxXNMs3rMAek=
X-Received: by 2002:a19:c10d:: with SMTP id r13mr13151970lff.339.1635110726022;
 Sun, 24 Oct 2021 14:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211018121815.3017-1-pshete@nvidia.com> <20211018121815.3017-2-pshete@nvidia.com>
In-Reply-To: <20211018121815.3017-2-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:25:14 +0200
Message-ID: <CACRpkdYQMOAPdQaOb9TXtQmr5ez-xhwDguYusiGxK4DCHHX92A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add pinmux support for Tegra194
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Prathamesh,

I don't have a maintainer for the Tegra pin control driver
in MAINTAINERS, and I have seen different people contribute
to it over the years. Definitely Tegra 194 should be fixed up
now as it's been around for a while and it's great that you're
dealing with it.

Anyways I applied these two patches for now and let's see
what happens.

If you're working with this extensively maybe you should
simply list yourself (and Suresh?) as maintainer(s) in
MAINTAINERS for this driver? You can add Thierry or
Jonathan as comaintainer maybe since they made some
patches the last year or two.

Yours,
Linus Walleij
