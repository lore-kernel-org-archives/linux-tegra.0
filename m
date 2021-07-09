Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B136C07E99
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 21:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06760613C3
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 21:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhGIVTR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 17:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGIVTQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 17:19:16 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9892DC0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 14:16:31 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a6so10164621ljq.3
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FFJn93KXlbUO1eC2UPdfdsHwOfyOvGiL00QyxwOUiUI=;
        b=biK9KW1Cem9wEcxu6XQ+7cKDNwZkZL4LAy9aNFLRa7F0wS4kO9BNpPZ7D2fvXVi5ne
         Ja0VYcEhg0ugIcH7I/6jgiTuaj83cUIemzGa7QkeIhCH5Fs2auxNCSMemycxIiDblMDt
         4SL+u5Lpnr4/4RjsZo0fB0/ebpI6lZZXjO1pL66YizZtZYCOp49X3jOC1c6uCm2a3Ujr
         4WuJ1Yyp5q+lxDm19CXqRpYkTN4O4mYrnG78q+WI4j4YvByFRYeOmP37xyMkNzWy2c6G
         pJrhkCkLMF3kJc64OPHCjFw4ppLftdW3VV2Z8UezZT4IwyBxCvWXBeaDHdCqU5+uYIDM
         VSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FFJn93KXlbUO1eC2UPdfdsHwOfyOvGiL00QyxwOUiUI=;
        b=ofxZg+YMXOb2LHWC2zslk7IWUXuw30MoJnLKLMfBBHQTRi+76q4U0PXWKZZsyv18e2
         qG7m+1av4Llh7p/3wsitakx5uWxGziu+jUzICk1QOGAJIdErPPp98+3IlWROWmNtHIdq
         F9OG0+RL5mSV4gPFgJHe1xXPKfGFEiAONMLDNs1JGunFithuVhkfXv6T2YyK0U11v4+g
         yNWNYlK+dqARcBAiFBlnuWkNmUD3VqJrIVIhSYl7npT6pUsvB7ajluE3WE78H7dSeGLf
         GvHtBCUwF0iSQt5g1FENEm9CR/tLFq4KyTptS5+mdOXIEV/Ae15wuJ9/LoQKVw3ztBP1
         gskw==
X-Gm-Message-State: AOAM531ubH86X92/5HI7tZx+MDXJgZrL+YAuKkfph17p57yeF4/moz11
        6/oR+kGK2FFu3Ved2/h23msQVs4f3X4=
X-Google-Smtp-Source: ABdhPJxp/+NTQ81AZlwJauM9o9/HxJXNZkHnftQviz1jVAmg4gdpJvVVI88j0vrPQnG0sO9vW/Ei5A==
X-Received: by 2002:a2e:7210:: with SMTP id n16mr24699177ljc.8.1625865389512;
        Fri, 09 Jul 2021 14:16:29 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id u10sm606303ljl.122.2021.07.09.14.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 14:16:29 -0700 (PDT)
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
Date:   Sat, 10 Jul 2021 00:16:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Thierry,

09.07.2021 22:31, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi all,
> 
> Mikko has been away for a few weeks, so I've been testing and revising
> the new UABI patches in the meantime. There are very minor changes to
> the naming of some of the UABI fields, but other than that it's mostly
> unchanged from v7.

Why you haven't addressed any of the previous review comments? There
were some obvious problems in v7 and v8 still has them.

> One notable change is that mappings can now be read-only, write-only,
> read-write or none of them (rather than just read-only or read-write),
> since those combinations are all supported by the IOMMUs and it might
> be useful to make some mappings write-only.
> 
> For a full list of changes in v8, see the changelog in patch 6.
> 
> I've also updated the libdrm_tegra library to work against this version
> of the UABI. A branch can be found here:
> 
>   https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
> 
> That contains helper APIs for the concepts introduced in this series and
> shows how they can be used in various tests that can be run for sanity
> checking.
> 
> In addition, Mikko has made updates to the following projects, though
> they may need to be updated for the minor changes in v8:
> 
> * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
>   Experimental support for MPEG2 and H264 decoding on T210, T186
>   and T194.
> 
> * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
>   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
> 
> * grate - https://github.com/grate-driver/grate
>   3D rendering testbed for Tegra20, Tegra30, and Tegra114
> 
> I plan on putting this into linux-next soon after v5.14-rc1 so that this
> can get some soak time.

It should be a bit too early to push it into kernel. The UAPI is not
ready because it's missing essential features. We can't call this a
'modern UABI' until it's fully implemented. The design decisions are
still questionable because this UAPI is built around the proprietary
firmware (and based on UAPI of downstream driver) which doesn't fit well
into DRM world. I haven't got all the answers to my previous questions,
should I repeat them?

UAPI is not the only problem that we have. The performance and stability
of the driver are in a very bad shape too. The modern UAPI can't be
built on top of the old code. It's clear now that this is a very serious
problem that must be addressed along with the UAPI work and I'm getting
silence from you guys.
