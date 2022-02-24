Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D92FC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Feb 2022 17:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiBXRSe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 12:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiBXRSd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 12:18:33 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4DE1B0180
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 09:18:03 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b9so5055584lfv.7
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 09:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZEF24tzNN36Ad6E2QTpV8p5Sa4Vkb2AWklLMy5ayQGA=;
        b=WpodwI797Rwd5d3Bqh4Ioe16qGHmgCq95omZ7cEKxJIStGiKXtvn5YYQjBCG/MVoE8
         MkrwSod9DOdWu4ufQ+G6EJFktP0MI/vAE6Le/k5cqnofP06II26wzYqlo76bLeUJjd35
         2cFTI4mclwQkDi6QC3k6FkF8igTaePP3nExo/K1Ej+6j86esRvLEyiH/1ZD5jg7YCHj3
         ZS7Yl+8PEvwRYuu9QiLQUoFQ/CXYn94/JoMIK4q1YyWuDNQxlt/Fl2DvOxUalyML7Y4z
         5yi8KpjOiqVXI0B3YzIdHebbS++F8NDtdXjqDbIL3s/ck6WVzw235HOsEEA3P57iHDam
         FM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZEF24tzNN36Ad6E2QTpV8p5Sa4Vkb2AWklLMy5ayQGA=;
        b=2V5wGiLwwGpvDL7oaExfs1tRnpALsqeIVRWSpzT+GCWJw9uv0NzGAAD/WX32JDyZ/e
         OA11JZcaDYnh9LaY69uc2PZbGE011hYfDXvNSFsj3Jeh5XEeMizjZ3dql5hGxvcOyok7
         OiyN//VFmT7MsTcA0ciVh5dSdd4fvhZ83Vjaq5l5BAwQbZqF9SsfLAC69rp6KB9TvTjz
         eKiKFGaLVd0klFwHJUOiaGSrI0CE/gHMaufxzhg1nftnzAqKTA2BLzNi/EI9VlwjL/dN
         0ttx+kvyHCL4z6FkCTlxHkrmwcAlzRq1AYXpQWN2s2goLgPI/Mw9QIaufH3AS7ot19fQ
         +aDw==
X-Gm-Message-State: AOAM530YOK3LNPru6CzrciQgOFzxQ0mprJ0Qb/p8gz697VWgYLljHeiA
        OU9rjyWovK7JizOHdIlqghhxiAR/uoE=
X-Google-Smtp-Source: ABdhPJwcR7KJ1sG1dWn4HB4VUsHPfcXidHtpADKlS/xYTpv7jH43cB37PGeqQzvuPx8FQvhZsYDIFA==
X-Received: by 2002:ac2:5148:0:b0:442:f24f:1aea with SMTP id q8-20020ac25148000000b00442f24f1aeamr2421864lfd.20.1645723081906;
        Thu, 24 Feb 2022 09:18:01 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru. [109.252.137.194])
        by smtp.googlemail.com with ESMTPSA id n23-20020a2e86d7000000b002460f3e885asm20837ljj.20.2022.02.24.09.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 09:18:01 -0800 (PST)
Message-ID: <0a550dde-7c06-c61d-2cbf-e63ad1a7dcc5@gmail.com>
Date:   Thu, 24 Feb 2022 20:18:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 05/25] tegra: Add flink helpers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <20220217191625.2534521-6-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217191625.2534521-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.02.2022 22:16, Thierry Reding пишет:
> +int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name);
> +int drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
> +                      struct drm_tegra_bo **bop);

drm_tegra_bo_open() isn't a very good name for a function. How will you
name dmabuf and handle variants?

In grate-drive we're using these names:

drm_tegra_bo_from_name
drm_tegra_bo_from_dmabuf
drm_tegra_bo_from_handle

I suggest to use more meaningful function names before will be too late,
especially given that this is the upstream libdrm.
