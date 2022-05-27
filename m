Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80909C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 27 May 2022 02:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbiE0Cng (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 May 2022 22:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbiE0Cng (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 May 2022 22:43:36 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF755E528A
        for <linux-tegra@vger.kernel.org>; Thu, 26 May 2022 19:43:34 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f18so3046199plg.0
        for <linux-tegra@vger.kernel.org>; Thu, 26 May 2022 19:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tCbjiRdRJoa16DjQmzqPUCTmyJlX3Xm3EGzU7SZYB48=;
        b=unI1dKwt13z46NWgVcF/f6pY8q2na7j7rEnLYqAopnP8WrbK43li4m/7OrNqQgY9L1
         tg/JstaAehFqkxIwHpJgys1nBKK+Ie+D6igCIYYx0nkp4UBbjuH/S7khiG+IbDISFjzp
         jd7+rzQiMg0GyPVwsjNcF1wCq5aPT2cpJRJ9yKA8u3b8h/xMHogF7ylAtLtEUfs1bSl8
         Ep71Vjn4mZmTU8BFCJ8aOVE6zRDP0m7jk0M1a2nkrIj3rVzJaJGGPmWJDjTljv+1g2H0
         w34qphgI5t2B+h+EsIUXiwkTJmJOWcoVPxQ8jHiK75fn4LEC+P2fNcXxgMii8P3srV/s
         HnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tCbjiRdRJoa16DjQmzqPUCTmyJlX3Xm3EGzU7SZYB48=;
        b=LqwRdcJ3IzXK/nH3LZSoOwJGD5H96MHA76RgkJ/+NtlENDocOjuq1akpcbSJnp47VB
         Ni4hzRtjUzqEIcYBOUeE3/XlqslVsdgIITQIstXPhs5J5Gr0Go6e7BdrwjeG7pvmy0ke
         OUoJflE/XwZiUnedvELgeRnXQ8w5wys2PPXDMZb7rLd0JUDTaeDFPu3WE7ZSYPHi+I8D
         5fiaqnd7Dp4UTRluWioKjxA7Jc7KOVq33GLxgixacLWpQrhYeqUmKn1HmqLT04gOuFOJ
         Tv3B18LiyYm1mrVr7VuPphdZHh6bCUyUZHw7tT5KL8hEbQfSVyGNUnrvOf3thpJvQh4x
         EOug==
X-Gm-Message-State: AOAM530mukGd/7Wy2LL1drOUSqDPNjIbQmDwtlh3lFgmAt+vpV7P3NSa
        U+LkTtkgEze63qvZtVNTNTc39Q==
X-Google-Smtp-Source: ABdhPJwTBXjt8npUnZjAyIbizyejh0fXkxDPHH1uh3aRf1Bdies2ajElDTSMQ5AtJ4B6lGs7lFNjuA==
X-Received: by 2002:a17:902:d483:b0:162:3f26:7fb3 with SMTP id c3-20020a170902d48300b001623f267fb3mr17006488plg.82.1653619414325;
        Thu, 26 May 2022 19:43:34 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id q31-20020a631f5f000000b003fae8a7e3e5sm2178914pgm.91.2022.05.26.19.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 19:43:33 -0700 (PDT)
Date:   Fri, 27 May 2022 08:13:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 18/31] media: tegra: Migrate to dev_pm_opp_set_config()
Message-ID: <20220527024332.u7kuuudaccade63s@vireshk-i7>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <67b10cc516558405bfff0fc7749cee9d3bf02fc0.1653564321.git.viresh.kumar@linaro.org>
 <f92bc466-734e-b040-b8d5-0add023fe341@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f92bc466-734e-b040-b8d5-0add023fe341@linaro.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26-05-22, 14:57, Krzysztof Kozlowski wrote:
> On 26/05/2022 13:42, Viresh Kumar wrote:
> > The OPP core now provides a unified API for setting all configuration
> > types, i.e. dev_pm_opp_set_config().
> > 
> > Lets start using it.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  drivers/memory/tegra/tegra124-emc.c | 14 +++++++++-----
> 
> Wrong subject prefix - it's memory.

Oops, fixed it, thanks.

-- 
viresh
