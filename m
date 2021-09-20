Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35052C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 16:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 178ED60F38
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 16:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238573AbhITQot (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Sep 2021 12:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237709AbhITQos (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Sep 2021 12:44:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA9FC061574
        for <linux-tegra@vger.kernel.org>; Mon, 20 Sep 2021 09:43:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t10so63902010lfd.8
        for <linux-tegra@vger.kernel.org>; Mon, 20 Sep 2021 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ktbwkhy3rbgHFFQkdiJBYVtvpT8HovLT4b4l+npAGPY=;
        b=Nh50tnKdv84V3ZH13m/5EugbkPkw6ob9DNK0VYQ9JoZZRC4H3Z1k7esuLHEUCxo1f4
         MGm3VlUyGuDU2UFrH1iOSGN4VSFnKfsJYns6KzACGeXOs9KFYqzcx5Zwxppxzlyrnh5e
         gVEEj+5b8uwMlyzCZdWnS8iLn/AtygQgpffak1fnqiUEBXB3pR5ir7BeDlMCnvltaBqF
         PuMznbFCRdkoAjf+VgFWVRZXZxnMVc04IOwtiFmYUmcXRbjSKrepK6M6z5Iw9TQLgL7X
         Tprvje23cnnutuONA9fezjv8IRkFlEJ04sGZwbQ8wzENWeOySK97IkAeIgEw+AjtYlIp
         UNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ktbwkhy3rbgHFFQkdiJBYVtvpT8HovLT4b4l+npAGPY=;
        b=Opb0RNzWlTAZOVtI4WV7p6ZgUL8H/kvx/WbzP6xujCsTZ3Nu+03/HIjrEvkSMg8eqG
         8xRzqDfNF0Gt/lug+y1593gy/DRF4OnIYGqJ2TyQJjuMJFSBoXQAtV2Unu06GPC5ut/f
         Leej56WoRuZDS+gBdj0FamRAERQtjXJOl2veNJhrBLn/78382Q/gWAvpBzJVtgttuOOs
         OwnTGuDi74z7CPW4Yj0ae/SRdxkiqk40CB1pC4HCvLvH7PCVcYQ7CyATdq92g73aDYVl
         Qmbst2/0loxJs4VNjWhg2B1l/2xf4eY9xY9Tk0p4ZRZf2yasb+05QKhtdlIkJ9XfmxSL
         FA9Q==
X-Gm-Message-State: AOAM533zxc9Ty2sfJPD/D3P8hKgTTp03NnZNa4osrxjCZLkHtgRueTDL
        FxYiGRyCOzsPwZnvdWPB8tY+rs5R0FI=
X-Google-Smtp-Source: ABdhPJxxi3zhkrKnK0e6UqV9MLL71sHdRrsqPl2nOa2d6w6pzbMEX4j1pwOONAP1ppUtqCAgKN0wmQ==
X-Received: by 2002:a2e:2a06:: with SMTP id q6mr22809575ljq.424.1632156199788;
        Mon, 20 Sep 2021 09:43:19 -0700 (PDT)
Received: from [192.168.2.145] (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.googlemail.com with ESMTPSA id e17sm1817583ljk.133.2021.09.20.09.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 09:43:19 -0700 (PDT)
Subject: Re: [PATCH libdrm 00/25] Update Tegra support
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0d43222-2d45-fee7-f96b-2ab511b94d88@gmail.com>
Date:   Mon, 20 Sep 2021 19:43:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

27.08.2021 16:22, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi all,
> 
> this is the userspace part of the kernel patches that were recently
> merged into drm-next:
> 
>   https://patchwork.freedesktop.org/series/92378/
> 
> The goal is to provide a userspace implementation of the UAPI exposed by
> the kernel and show its usage in some test programs that can also be
> used for basic sanity testing. More complete userspace implementations
> are available here:
> 
>   * https://github.com/cyndis/vaapi-tegra-driver
>   * https://github.com/grate-driver/xf86-video-opentegra
>   * https://github.com/grate-driver/grate
> 
> Thierry
> 
> Thierry Reding (25):
>   tegra: Indent according to .editorconfig
>   tegra: Remove unused IOCTL implementations
>   tegra: Extract common buffer object allocation code
>   tegra: Fix mmap() of GEM buffer objects
>   tegra: Add flink helpers
>   tegra: Add PRIME support helpers
>   tegra: Make API more consistent
>   tegra: Install tegra-openclose test
>   tegra: Update for new UABI
>   tegra: Include private.h in list of source files
>   tegra: Add channel APIs
>   tegra: Add job and push buffer APIs
>   tegra: Add syncpoint APIs
>   tests: tegra: Add helper library for tests
>   tests: tegra: Add gr2d-fill test
>   tests: tegra: Add syncpt-wait test
>   tests: tegra: Add syncpoint timeout test
>   tests: tegra: Add VIC support
>   tests: tegra: Add VIC 3.0 support
>   tests: tegra: Add VIC 4.0 support
>   tests: tegra: Add VIC 4.1 support
>   tests: tegra: Add VIC 4.2 support
>   tests: tegra: Add VIC clear test
>   tests: tegra: Add VIC blit test
>   tests: tegra: Add VIC flip test

Have you thought about moving tests into IGT? Wouldn't it be a more
appropriate place for the tests?

Perhaps we can add/move Mikko's UAPI tests there too, for complicity.
Although, I'd prefer it all to be written in a plain C or C++.
