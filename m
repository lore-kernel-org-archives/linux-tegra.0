Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AAAC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Jun 2022 11:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344463AbiF1LEx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Jun 2022 07:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245522AbiF1LEw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jun 2022 07:04:52 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD0730F6A
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 04:04:50 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h192so11883727pgc.4
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MtflUKKrotQDzDJ77cvNHXiJL1xHtvO05S39qsKv6XQ=;
        b=KrkYTBOp1b37GnM869FLJX729JJDnog9KbXXc3du2sux+Ekt4oDTPKDKjmgyHzmvnF
         jqUdZfegUdbX7XVx3Mho2Rt+A92v/QmhhhDM7G6E2WPYfKLDqlLnWXZ79TRVLPQqgtVF
         l4EwVgJ3LvQVXKvoQP9n/iStaTd7JfBED1rh2HsYNQDVd7ehEgTzm/f8+EpYuyQFbOQd
         xbdS2ybASDQmIKDVdP6qxxZ/k+9PIPdDmTwKlmBlC22fvPrZDt9Tl9v+qc1EMTqB883U
         nE/NBW1R+7Xq73a9D3LrKJsURP5R8YnVp1QxUh575V0gh1S0hicKWvmKuUympvTCknHk
         uRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MtflUKKrotQDzDJ77cvNHXiJL1xHtvO05S39qsKv6XQ=;
        b=Ki0CT4LhR6mc90n8XUfjhAUCGg9IzkE0AfwFBpl95u8b7IiL0JTOwhrF/BWbrG2Hde
         jGe4rk+y8y056oH2r9TDzw0vuIpkyCXtU+9sidAojDn6xfrM5pZgqbSOpWr9pNUYjQ8c
         tvT7HopyiAszUB4UI4H8k07KWEg2ZKJI136xoi7m40QPkGUevaiBSZbXL6J5NO3uzMvD
         Hodfs5ZHmY4HYPQqiyv1oYBug9Wpz6LmqiMqarrxla1YOjArI2TjF1NAwmzAGthB4b9w
         umICJ/YPlYKrzoeAmD3nZj45R4MzdudrCRjv9HwQ82WWyy4tglohw/57bHa9Smyi72vk
         0kLw==
X-Gm-Message-State: AJIora9QB0LGZvO5KGQhh0iE12QKHRpjmH+oy2NXjBP9nC3BGlQsliDp
        lGCkNEbAIZARPQWeU6B7X+oaXQ==
X-Google-Smtp-Source: AGRyM1unj6gY1V/LkKYDSb4ffybTNB6/cr1mPA3NNjalBdt+PwAQjEFzwunF9JbUp9meFzfqyKAubg==
X-Received: by 2002:a63:ae48:0:b0:40c:3775:8b49 with SMTP id e8-20020a63ae48000000b0040c37758b49mr17052176pgp.268.1656414290452;
        Tue, 28 Jun 2022 04:04:50 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b0015e8d4eb2c0sm8954795plb.266.2022.06.28.04.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:04:49 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:34:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Keerthy <j-keerthy@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5/5] OPP: Remove custom OPP helper support
Message-ID: <20220628110448.bercnxgwjmoiebsd@vireshk-i7>
References: <cover.1653991004.git.viresh.kumar@linaro.org>
 <2e6ee73dbc8a231377547a8e9497561cadb38166.1653991004.git.viresh.kumar@linaro.org>
 <565ff879-11e4-1ae4-08d8-1237a875ef12@gmail.com>
 <20220627060636.rfpok75zydgcwwo6@vireshk-i7>
 <4a8114f7-4ee6-a9ad-f5be-ceaf64be8a0e@gmail.com>
 <20220627064155.jo7iqz5h33l7a4vn@vireshk-i7>
 <d18a1f18-d78c-2db8-9b19-196dc88978c2@gmail.com>
 <20220627071937.uneeudaqzo2aa2me@vireshk-i7>
 <d2a8c329-4469-f68a-5b4b-789a93725ea4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a8c329-4469-f68a-5b4b-789a93725ea4@collabora.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28-06-22, 13:04, Dmitry Osipenko wrote:
> What about to bump the "by-level" sorting priority, making it above the
> "by-rate" sorting and then always use the first clock for the "by-rate"
> sorting?

The order doesn't matter much really. If there are multiple clocks,
then we can't compare just one of them. If we don't want the level to
be introduced, which is fine, then we need to compare all the clocks.

> Then the multi-clock will work for Tegra without breaking dtbs
> and those for whom this sorting option won't be appropriate will have to
> add levels to the DT.

There was a recent discussion [1] around this, where using level was
considered sensible for such devices, like Qcom UFS.

-- 
viresh

[1] https://lore.kernel.org/lkml/65a4c28d-6702-3a9f-f837-1ea69a428777@linaro.org/
