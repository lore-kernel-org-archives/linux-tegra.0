Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3335C61DA4
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Mar 2023 04:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjCME2x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Mar 2023 00:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjCME2w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Mar 2023 00:28:52 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850A72A6D5
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 21:28:51 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so1327894pjv.5
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 21:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678681731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TAvGM9A2vDOzZdyZgN/PhkShf6xY7yJiV2Tqe3Nl+SQ=;
        b=vgSzyJf6wycqYZ/VP28K2uAd0g5ZW4Z17ATSTMj8bm/53X2tJN6kLXOuJUq2qi31px
         yTLOEvIj36P32blXlmvFWEpkRyIyz6ATGjFYQ99xtcsCFHsc2JewOeL8a0bqcWQhue0K
         Z5knfx4nBfuz7GdB05icBFRp6tGwuynWdlqAsAt0+7J16rlNB1iwp70JepKXzgvD38M0
         ifWATre3vYuJ0aduoRvF3Bakmn6wIVtpHx7H288oyWgmd0dvzyus7St6jM9vCxoDphRJ
         WCDeXAK4kePRLuHWAPz7O8Z+/yQDo4YzoXMueK6qhRQmHigR4daFHTCI5iuSZ6Um6HSk
         5iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678681731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAvGM9A2vDOzZdyZgN/PhkShf6xY7yJiV2Tqe3Nl+SQ=;
        b=r1Fr9FeKsN1vYEDZj5W6fJ2uo8+pWJmit1HU2TBKQWZAjSvk1Vvf5Y1WxSwZX4n0cf
         P7w+iw9pZp1Mrl75fTivO+DSRP2A96XDC89UZNUPXAH13slm4hREVqleT14Kd/WNuFTM
         nyMaFuHAkD/FcnaSo4m6umDcwtKZZYPGZTiutR5AeIbutx+FuAGKyt9biIWlXdjSQgbK
         ayzs7x3DM1nBZKXcpH9FrURpJHYHbNCx2Rr5of8bClEowGG5D5N7dvUvMhCQuki4K9Pc
         UJYHKaWC/MKB89nxbgdakp4CP4hIZMRWa+IG8iTvSvKdFXl3xFJid/j/MEvPs2rkzhaG
         b+Iw==
X-Gm-Message-State: AO0yUKW6lI0qV3vi7H3+dDPwRXP0/Ksz9hA9WdMWfxgDog1+gMWNgeTa
        CGg5RuCFHKcoaVl/slwz8NLE3g==
X-Google-Smtp-Source: AK7set9p4bFVrpjWBwosOcH7++GcaLBhSfedNIG7sXxnuN2cWJ9UqlzAa/4KGepgTsY0V/w5bofLMg==
X-Received: by 2002:a17:90b:943:b0:23d:198c:a5ec with SMTP id dw3-20020a17090b094300b0023d198ca5ecmr565374pjb.39.1678681730991;
        Sun, 12 Mar 2023 21:28:50 -0700 (PDT)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709029b8200b0019f0f5704besm3557029plp.236.2023.03.12.21.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:28:50 -0700 (PDT)
Date:   Mon, 13 Mar 2023 09:58:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Use of_property_present() for testing DT
 property presence
Message-ID: <20230313042848.bt4vl3tjjdb6qs34@vireshk-i7>
References: <20230310144702.1541730-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144702.1541730-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10-03-23, 08:47, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 +-
>  drivers/cpufreq/imx-cpufreq-dt.c     | 2 +-
>  drivers/cpufreq/imx6q-cpufreq.c      | 4 ++--
>  drivers/cpufreq/scmi-cpufreq.c       | 2 +-
>  drivers/cpufreq/tegra20-cpufreq.c    | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

Applied. Thanks.

-- 
viresh
