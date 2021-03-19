Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDA5C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 12:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF09164F6B
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 12:07:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhCSMG0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 08:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbhCSMGK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 08:06:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E991C06174A
        for <linux-tegra@vger.kernel.org>; Fri, 19 Mar 2021 05:06:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g8so2478070lfv.12
        for <linux-tegra@vger.kernel.org>; Fri, 19 Mar 2021 05:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8PEaxRIKLygOaEgMkzuJi7I5huOwDoYdniqBjKsADXw=;
        b=bAaniC1QAdS0rbs4tvED05sYJsdTCyqw3JPy/26JQGezuO0VYTGWavJoyODQhEIi6t
         OOq0iQqcBZpaadfXKAOTmzphaMCEA/ebfp5Aw0YBSGI09EUOdIcg6a2gEWWtKuCeW+fo
         T33wDpuy2QK2Jyxo69Kg2gg75nlZiV1ikqEWyixuOvxLJnRfsTVg3SZYq6cFxK8UTo9A
         iOVGRSEnKhmLTDuN1WGQGChG4eHLePgI2NUySIp9vdwqHB75PBt6G+SLTnZbNrR71445
         +QlBwnO1mE40AddN0fD5kkkv1cgbiRYtl2JKbuAXp4i9FTk8AmKIL9NHhFjhOw+g0RH3
         p5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8PEaxRIKLygOaEgMkzuJi7I5huOwDoYdniqBjKsADXw=;
        b=NubwJzTBfHlmW/Gvrnm872FdQzJa/3xwCsMo0r4xvGuumv3SlHPKoYc8R/L15tqCoV
         DMgx2faiy81ujVpjMR8NmzP3mZyb6v9q2et2iZ4DkZOOdHXAUUWP66ZffI/NkdIFyqpZ
         l4FBmP/F64U0t5BzBZJM1Q8aGz+HxuVegONDtr91KsVYnWQ+ZnyJ+k/qsVJCLF1Cbjay
         sO5hsrotqlX4w6R7tCmo6Ml+3XlBHtniGTq5nvOQz4OMTYNsEdCQ/mF6HuLhsxOIGYxr
         pLI1x/FfwFUvsRYMlgcCw+pZlpqd4jGm0MkTlB/h7lG900N1N7Mm0X8YmyIa9uY4USPa
         TS3A==
X-Gm-Message-State: AOAM531VEJOLKDg9PLrHeZZi1EJoeBrOKp6Wug7I0tdU4uL0d53UiTUx
        3Iv5uZcPsOi+IgceiwyvSyT6UPc69Nw=
X-Google-Smtp-Source: ABdhPJyByNj82M6gK0E2xY0hiyKZS2oFW7jUEFYFq0Kyf4sXAHCyJpJNfcNI9K9tJ3euch3GuK3Orw==
X-Received: by 2002:ac2:41c5:: with SMTP id d5mr613048lfi.459.1616155568537;
        Fri, 19 Mar 2021 05:06:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id q24sm737244lji.40.2021.03.19.05.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 05:06:07 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: dc: Restore coupling of display controllers
To:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210319070637.675964-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ec14b16-aa2a-5997-0b7f-d413377e93cb@gmail.com>
Date:   Fri, 19 Mar 2021 15:06:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319070637.675964-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 10:06, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Coupling of display controllers used to rely on runtime PM to take the
> companion controller out of reset. Commit fd67e9c6ed5a ("drm/tegra: Do
> not implement runtime PM") accidentally broke this when runtime PM was
> removed.
> 
> Restore this functionality by reusing the hierarchical host1x client
> suspend/resume infrastructure that's similar to runtime PM and which
> perfectly fits this use-case.
> 
> Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Hi,

This bug was originally reported by Paul Fertser, I redirected it to you.

Reported-by: Paul Fertser <fercerpav@gmail.com>

Formally, the stable kernel needs to be CCed since we want to have this
patch applied to the stable kernels.

Cc: stable@vger.kernel.org

Otherwise this is good to me, thank you!

Tested-by: Dmitry Osipenko <digetx@gmail.com>
