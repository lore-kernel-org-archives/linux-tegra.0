Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319ABC47E48
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Jul 2021 13:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13114613D9
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Jul 2021 13:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhGON4x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Jul 2021 09:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhGON4x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Jul 2021 09:56:53 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A626C06175F
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jul 2021 06:54:00 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b26so10049617lfo.4
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jul 2021 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JGYF8hWgVNMB+PzE6zb3NE1EFBYIqKKq2vW7O89OdZA=;
        b=bF9C3Q5mYm4kfjJwI5xS+MFtfDk6LLmGorM3K5qQdXo8b8ICf4k1tNusnYebKhb5cr
         UhI/IpBbJYQooi1/4LIK7O6JmC1BWnvbztwuGcYP11z1ApSZC6ozyojDINnKAcaw1hz6
         F/SFQqawa3OuvPcpojI6yamGNDwkc0Dh4JQ3Asl8plDKGBqwE1LwUg6HsXmDVy+GQUYv
         SIgpAN4Lc95zxVKVRQiSQnHhzi9/PEaH3C1C9ZYOsVq7fT7JvxedmQfX27pDb+6lo764
         rR6V1eediZqj6XFN4hvlMeVYXgczzd1glhdKWR42Z5uzmIf1gOL95wOvRzMi5Qs6ii+l
         fvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JGYF8hWgVNMB+PzE6zb3NE1EFBYIqKKq2vW7O89OdZA=;
        b=oRL+XdE1c2tI+F1YsbMmlpyB2gH4YXLB79n3ONDS0l4emcy5jGU4KY6c7reWs2Mv5Q
         kKXLImVwm50xVwQ6+7obQUUt+XTd9R63hucoxiHrGqwVyHxd0kwslj1LaIy2S2+SD9cf
         NFbE2zfXXg1uCiLoZInrWuworWL7d0r2IoZRi7jkuH4/selVhRjwR7mMsvpLq23+FfK7
         w2NPaA9Aijk0kFseJ0ljbc+HWnPWxtn+WDBpFlLopq/5ceh2kLW4mNUXS/85oOr1G+yW
         FyqvjI7+mhRQ1rClMwMgsE0Mre05ufSRKnGaYNrYFKFJQAbOtNdHx3avXb5ERtC/Bw7J
         yVOg==
X-Gm-Message-State: AOAM533C11Fdj4i+6SDnbM9aiW0f116/jKblJMciCckSiJBsuoLTSvAr
        kiNkSabmwOqJPNmESZOduicv9ekB2tw=
X-Google-Smtp-Source: ABdhPJwCAYxv3fWLrJDR/7ML0iAUkHDR/18K1sCJ4H4j/2nj3/y61mdj4YGxVjZlwuvk8PVUSoqjuA==
X-Received: by 2002:ac2:5588:: with SMTP id v8mr3505435lfg.213.1626357238236;
        Thu, 15 Jul 2021 06:53:58 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id i13sm417617lfc.111.2021.07.15.06.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 06:53:57 -0700 (PDT)
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
 <YO6gm0PgMGNovk+4@orome.fritz.box>
 <56ca1626-37b6-5888-bc83-51433da7b26c@gmail.com>
 <e5158cfd-dbff-68c5-c54b-932c5d35f074@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1d6d89aa-3779-d749-74ae-739c77664d75@gmail.com>
Date:   Thu, 15 Jul 2021 16:53:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e5158cfd-dbff-68c5-c54b-932c5d35f074@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.07.2021 18:26, Mikko Perttunen пишет:
...
> While my goal of course is to enable proper use of Host1x on the newer
> SoCs, there is absolutely no intention to forget about the older SoCs.
> Observably, to me at least, GR2D and GR3D are working -- the test suites
> are passing (though I did not port/try mesa). We are also not regressing
> anything, and I do not think after this series we are worse (at least in
> any fundamental manner) than the downstream software stack that these
> chips were originally productized with.

> As such I have a hard time
> understanding the doom and gloom about the driver's state and needing
> grand overarching re-architectures.

You need to work with a real consumer device and use it everyday to feel
all those problems. But problems always exist, we will fix them
eventually and then have new problems. We also have an alternative
experimental driver that solves the problems for the time being, so it's
not really that bad.

I may sound a bit too negative, but that's because you're are already
doing this work and I want to get your attention to a core problems that
in my opinion should be solved first to avoid a need to re-do the work
later on.

...
> I have a long TODO list of improvements to work on. Admittedly, I won't
> have as much time to work on it as I would have before since I need to
> start working on other projects in parallel as well. And things will
> need to be agreed on

A slow pace parallel work is a normal thing, that's exactly what me and
everyone else are doing in regards to having fun with Tegra development.
We already managed to achieve a lot this way and it's only getting
better every day.

> (e.g. as alluded to earlier I still don't know of
> any concrete reason why we would need to add a software scheduler. I can
> only make guesses. It probably makes sense for the old SoCs, but I don't
> know why we now need one and downstream never did)

Scheduler is needed for running jobs in a correct order. You don't feel
like it's needed because you use only a single h/w engine and haven't
seen places where it's needed.

DRM scheduler also has a much cleaner code, has more features, it's
optimized, well thought, uses modern upstream concepts and successfully
used by multiple drivers in comparison to what we have in the Host1x driver.

We will discuss it in a more details.
