Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F87C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 21:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 603F323B01
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 21:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbhAVVlE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 16:41:04 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:54570 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbhAVVkv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 16:40:51 -0500
Received: by mail-wm1-f42.google.com with SMTP id i63so5479889wma.4;
        Fri, 22 Jan 2021 13:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LfXJtQRnqnK7ZLTZRB4x7g8Fu8oQe2xdldmkDirRkKI=;
        b=jfUicczR7k+Yql/fTFKSyhzFYQh6ueWCHAxvhCrzLrRaZfuKdY7y6kwMX8fDi/r2gK
         jS4ielTLNpJpTrN4tVJPLRBUXcFTL6iZfN+bsdqNlZGc06/he5xS9nvemfJe8Tj6gbNT
         HA8J5zkgqJGLzmJeU3jULfChmAgLAXj2QmynbpHKv+n2P6MfL0PVQiV/LsUG0MZXPSh3
         Vf99OOhUQGjNGIstT8vEbuLtDwAoj0nzr0Kq9sRbGgnPI9FPBCcqJLUfaOpaNPCpHZJX
         Iv/aoj4YZv92f49f9rMamgL53gjwZC9Fc+UIncpYyH0ZIfSsbQ/pEHss4TbuSb9oPStl
         iTjw==
X-Gm-Message-State: AOAM530RJHEJAPXHYkEmQdH06DYwRgJYOsRpoML6kpXabklSVxnURu6F
        /1rypLxJS6TAc1QXB+IezakPyb28QlY=
X-Google-Smtp-Source: ABdhPJzN4k4meXvcZspZsAfaO14yD9sOxbFQLdOXRDKJ5RnT5v60p3KrhtXkxMQ7ctr3bidLQCoYiw==
X-Received: by 2002:a7b:c415:: with SMTP id k21mr5727997wmi.96.1611351607575;
        Fri, 22 Jan 2021 13:40:07 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z14sm13284392wrm.5.2021.01.22.13.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 13:40:06 -0800 (PST)
Date:   Fri, 22 Jan 2021 22:40:05 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] memory: tegra: Check whether reset is already asserted
Message-ID: <20210122214005.bfsznpaga2rhl3ow@kozik-lap>
References: <20210119235210.13006-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210119235210.13006-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 20, 2021 at 02:52:10AM +0300, Dmitry Osipenko wrote:
> Check whether memory client reset is already asserted in order to prevent
> DMA-flush error on trying to re-assert an already asserted reset.
> 
> This becomes a problem once PMC GENPD is enabled to use memory resets
> since GENPD will get a error and fail to toggle power domain. PMC GENPDs
> can't be toggled safely without holding memory reset on Tegra and we're
> about to fix this.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30

Don't add your own Tested-by. Author has to test it.  However this is a
v1 and already three other people added tests. Where are the emails?

> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Best regards,
Krzysztof
