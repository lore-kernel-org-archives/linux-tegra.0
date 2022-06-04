Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27C6C43334
	for <linux-tegra@archiver.kernel.org>; Sat,  4 Jun 2022 04:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347824AbiFDEiV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 4 Jun 2022 00:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbiFDEiS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Jun 2022 00:38:18 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D129E32070
        for <linux-tegra@vger.kernel.org>; Fri,  3 Jun 2022 21:38:17 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id q1so19361483ejz.9
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jun 2022 21:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hh4ELzZPJFhmxKWds3g9V2X+IxOzPvS8KSmxMCSqtss=;
        b=YUKSooZoVPXYG42IT9ndGNg7dC1LZpK/VfKSn0j57Z+sy/uNIrK4r7Gg/XCMWo/MXe
         eembK/oUt12M3iUxeSnaBQ5kVxZY/it5PLDSYraoq+49vmEuFqaJXLHFKXJ+xIWcpi63
         N1NzZSeKmfbq5jX7aFzK8yeeG9r1V9tkLi9Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hh4ELzZPJFhmxKWds3g9V2X+IxOzPvS8KSmxMCSqtss=;
        b=M/vhA2vqHnkHgIa9kT7ointcrJvxdV5olM0zeLmWIUw3qW9UaGNaV1/mRV+6umqIue
         iGLaneie7cGmT5IvmupB+8E/tcLt0XTr+o+IvtywJsLndIvg+OAyLtCFERvXvmR3N2tk
         krBa4o6eUV7ubJrkl1UYsFk+hkYcRU3/FrAEdE+xlRnhlQsYBPnMZCAqsvvB9nC0sieB
         VaZMZN/SgtoMHXqwvMuYFksvQyoFYaVsABW9PoivwW8UjAR4RvkVNf249WauDaqv/kp6
         e5a/+MRh7XppI7em1UpTJwEJMWrzGGp5cjtRSM5Wq5NjWshZaAgvE6HAugb+y2kEYiB1
         AQvQ==
X-Gm-Message-State: AOAM530A11fbyL7bwzSvZP3c2DgkqndxrJXb1dR/i2sbCW1aOHNih/Fp
        zyQxcsjwmop0vao/G9fm+VGJbUEMzdgBPQA9
X-Google-Smtp-Source: ABdhPJx8N8mcxIEk6v7cMro7b7WF0BngKwDqq1ERy7D7xFmV9BWJ01pfB91fvvdvmUqZ2Ko/U5joMA==
X-Received: by 2002:a17:906:f845:b0:70e:fb6a:9b76 with SMTP id ks5-20020a170906f84500b0070efb6a9b76mr4741722ejb.530.1654317495926;
        Fri, 03 Jun 2022 21:38:15 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id c24-20020a056402159800b0042617ba63c2sm4964363edv.76.2022.06.03.21.38.14
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 21:38:14 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso5209959wmn.4
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jun 2022 21:38:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4982:b0:39c:3c0d:437c with SMTP id
 h2-20020a05600c498200b0039c3c0d437cmr7056295wmp.38.1654317494164; Fri, 03 Jun
 2022 21:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220603113908.78777-1-thierry.reding@gmail.com>
In-Reply-To: <20220603113908.78777-1-thierry.reding@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 3 Jun 2022 21:37:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVxF5VLFSuet3OrC7u1Gfb-ZyMs4W-KXAc42rXPRWmhA@mail.gmail.com>
Message-ID: <CAHk-=wiVxF5VLFSuet3OrC7u1Gfb-ZyMs4W-KXAc42rXPRWmhA@mail.gmail.com>
Subject: Re: [GIT PULL] hte: New subsystem for v5.19-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dipen Patel <dipenp@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 3, 2022 at 4:39 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Note that this currently supports only one provider, but there seems to
> be enough interest in this functionality and we expect to see more
> drivers added once this is merged.

So the "one provider" worries me, but the part that really doesn't
make me all warm and fuzzy is how this came in at the end of the merge
window.

And it's a bit odd in other ways.

The DT bindings got the comment "why call it 'hardware timestamp'"
when no other case seems sane.

So the DT bindings got renamed. So now part of the code calls it "hte"
(which nobody understands outside of the hte community that is
apparently one single device: Tegra) and part of the code calls it
"timestamp".

Hmm.

             Linus
