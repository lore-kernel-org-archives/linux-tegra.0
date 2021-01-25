Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DC8C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Jan 2021 03:11:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8C5022472
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Jan 2021 03:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbhAYDLJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 24 Jan 2021 22:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbhAYDLH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Jan 2021 22:11:07 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B2BC061574
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 19:10:26 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id b8so6697028plh.12
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 19:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wABN0PT/1uNSFrGdIrkcCEhg4WEbDL/+pWG1JFqkxBA=;
        b=UnJCehjrYU2vKR+H2yI5OG0uvswV4DsRTnmGyoPfOxoGOoh2oEBwr0E8v+gEN/fp3u
         NaEcUNfCmrwWJb7my+ihcB/mWk/eeFqbcpHzEumbTDEgPKGtxZhEk6jW/UekmkOHODL8
         yom6XPoLIHbdHFZ5m/W446R2CXQl2zznoEGxIxOM+sN9t8L1JKOZrLZpOfTN0jOiuKAF
         XqyTlUap52FH1Socv1djvml0DD5DKyqDqTOvc8UD7KR2wOMo2ezcC02ip5TAMeiMW3S2
         SkPx1tLxEdV+Gxl2gDTfZjXU32MGZGVJJTZzJVHBxwLdhsVD1RnD2g4/+UgPcGJKPCJq
         V44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wABN0PT/1uNSFrGdIrkcCEhg4WEbDL/+pWG1JFqkxBA=;
        b=rDcu779ThbO/yMM9b+BeqPt8XheJlLws5jdaLd6WzJSwLH1k8zK/QfWRSjYoq1anug
         7UZdx0vUAyaxhyHNvDqyVGK65SE9Zlrl9wQnXhVzoMMrrMyyqXJTmmdlBv+hIob59pbl
         rEREHWkU0aCT2cD+gn6B8NkAb05nFQAAqSSKAL2hY13IB64xHofdjSfQitFaYycqyw5M
         ldujP7GxZEy8lwbEA0EzKAumuG6rBsqEJxtcCdluAUTKNcYQWpgsmwaINbnRCQGxxytl
         mX6Cby9MWCOxyYQjTmmTqw6TNyvS/OhpcA3vR4UUOSXU1gFPUehtCDydsKOxyi3/x6CY
         8eOA==
X-Gm-Message-State: AOAM533KbTF25X/BHgB4dnbn9KvjQZHrLGNcZRYC1VXLrdaZb9awVjNR
        d0zJTv7hIKt6TRXDRXBwQ+e2KQ==
X-Google-Smtp-Source: ABdhPJwECRQ5UnnivMklopaGuIyjpNECRo99aPxNEwNNxmHFJwzSOUUEPM/ZCDxwkJ9ZOnsbIq9TCQ==
X-Received: by 2002:a17:90a:520e:: with SMTP id v14mr737287pjh.9.1611544226384;
        Sun, 24 Jan 2021 19:10:26 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id s65sm15364217pfc.95.2021.01.24.19.10.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jan 2021 19:10:25 -0800 (PST)
Date:   Mon, 25 Jan 2021 08:40:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Remove calls to dev_pm_opp_set_clkname()
Message-ID: <20210125031024.g6limtpu4ozzp2mr@vireshk-i7>
References: <1430e70777fdcf1c946ca2fef296f439762a4f21.1611295029.git.viresh.kumar@linaro.org>
 <36db9831-0d68-2502-ad64-5aab05b16974@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36db9831-0d68-2502-ad64-5aab05b16974@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-01-21, 18:00, Dmitry Osipenko wrote:
> 22.01.2021 09:00, Viresh Kumar пишет:
> > There is no point calling dev_pm_opp_set_clkname() with the "name"
> > parameter set to NULL, this is already done by the OPP core at setup
> > time and should work as it is.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > Dmitry, am I missing something obvious here ?
> 
> The dev_pm_opp_set_clkname() ensures that the OPP table has a clk
> assigned to the table.
> 
> The _allocate_opp_table() ignores all clk_get() errors except the
> -EPROBE_DEFER.

That is the case for everyone relying on OPP core to get it. It should be fine
for this case as well.

> The opp_table->clk must be not a PTR_ERR for these memory drivers.
> 
> On the other hand, the memory drivers also do the devm_clk_get()
> themselves, hence technically clk_get() of _allocate_opp_table()
> shouldn't fail. But I'll need to take a closer look at the clk core, to
> check whether clk_get() could fail for the implicit _allocate_opp_table().
> 
> Tegra124-emc driver also has dev_pm_opp_set_clkname(), BTW.

-- 
viresh
