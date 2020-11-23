Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100B0C56202
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 16:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADC12206D4
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 16:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387881AbgKWQak (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Nov 2020 11:30:40 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52002 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732895AbgKWQaj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Nov 2020 11:30:39 -0500
Received: by mail-wm1-f68.google.com with SMTP id a186so15628747wme.1;
        Mon, 23 Nov 2020 08:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yaoJZoEVBYpM6WD6aCJwupRS15UUhu0CgUeEN6LjY6Y=;
        b=GF/w6xqv5fBL7sp9j2VaIkjK/0M241qUuTl0AMWovyYw+YmO+EHnCNr8ZGxjpqroK/
         woh99eUz/Qu5hOSpTeGFYI8DDsJpFRzk8QqSXS61dXLWu+JxVzT9eMjFHsWcKuaKPKDY
         bp4MiQF/WObvsK7niFpYDmEXtr+SKM54K/oLLHwoNYdJujIHIOpyTaWpLrRAB1s5uEcc
         hgn0sJ31YF6PXzmUmWwz1BbDFq54FmW6fjGOGFg9OcFBJfXXW3kpL+ru9t4mkHwSunTn
         kzz7PnK9Yt4Lt4Sq9Cs8KUhkAmtM2QldWtBpNw4vk9H/UyJI1O4tVerkN8r+rrEyteFk
         kU3w==
X-Gm-Message-State: AOAM532D+2i/eN7AP4l6Vqj5+mSYYJG3cYo60LARUu+ut+c+SFoB0RIh
        sMzWDYhR0X4Q5WbWAwr8R9M=
X-Google-Smtp-Source: ABdhPJwEO9g9cDPbfMNUIxUvONsvBfFVObafalSLVZ01uKtcBRx6GfvKxoyLzi6AlM2EgEuFvUDSeA==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr70849wme.85.1606149038123;
        Mon, 23 Nov 2020 08:30:38 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id c4sm22151921wrd.30.2020.11.23.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 08:30:36 -0800 (PST)
Date:   Mon, 23 Nov 2020 17:30:35 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] memory: tegra30-emc: Remove unnecessary of_node_put in
 tegra_emc_probe
Message-ID: <20201123163035.GA209457@kozik-lap>
References: <20201119195244.1517236-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201119195244.1517236-1-natechancellor@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 19, 2020 at 12:52:44PM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> drivers/memory/tegra/tegra30-emc.c:1275:15: warning: variable 'np' is
> uninitialized when used here [-Wuninitialized]
>                 of_node_put(np);
>                             ^~
> drivers/memory/tegra/tegra30-emc.c:1269:24: note: initialize the
> variable 'np' to silence this warning
>         struct device_node *np;
>                               ^
>                                = NULL
> 1 warning generated.
> 
> There does not need to be an of_node_put call in this error handling
> block after the shuffling of the np assignment. Remove it so there is
> no use of uninitialized memory.
> 
> Fixes: 5e00fd90183a ("memory: tegra30-emc: Continue probing if timings are missing in device-tree")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1203
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

