Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4710C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 04:19:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8523364DD1
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 04:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhA1ETn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 23:19:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhA1ETm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 23:19:42 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44E3C061573
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 20:19:01 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id s15so2612407plr.9
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 20:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RTAG4vsAoUjlR0wHdPRSWvh6PJ/veu4LyJng/CB31aA=;
        b=uJ8qG+hjgRgxsD7XyEzcyvs3SRBRuiMqgAeBDn8V+t1h/i3YSRJLmGWOY8QqKCRoXl
         C9YhVD/VZMCq9894EzWzKHlgdUFchNp/0lPXYoDgSsx315oH1bMgKMxrdMtWMLGU2LBy
         M4U3QTtGEjeZRjmBFndldNNQdiw4YCrG0KYQcCeGb/OcK2hF90R1RROysJmYb2Id7z4y
         DKZwFjf67nu7P2QiZ1bm/agd/QUhSapqP48G2XQTk89+sInyaMbqYqkx3yMG0CiRcPaB
         1d4TBW/aUpUTSCnV2pPk9nmY+4vndwl/MFJlow4v4a2E6qskV3sKMKYn0C044u3Z4owD
         MDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RTAG4vsAoUjlR0wHdPRSWvh6PJ/veu4LyJng/CB31aA=;
        b=nzPK83LUTiICROGrEOm382P/OyxQNmCoxc52WLP9/6kn++maoOByrgUV4RMl0KliZO
         +A2FaeQ9Wrgt1GbH9sw9F5NeDkCZY00x6K2n8+SFjobzLVHtK5Uw38sqzRFyJDt/Y07T
         CnJMznEiNZvfQDGqqZ0B8VpcC/voU4oBHikpBqccYrwu/xfOk0+VosUwubbr3NtDw/zQ
         XoKaqawarbNAJC3d403/8UrIAcNaSFpF5c/7jIeuBPdRxoPCQAdqlKlhIdrKSnrxDxLZ
         t3jI5kOXAPcv6ZGkYDhlBv5eZVlA1Wbi6hhQ+w/SYc0HxpXIuMMk9jNn6ndG0WLYuLVc
         RTdA==
X-Gm-Message-State: AOAM531t2JCn8gCxA8Jq+yuQWRLGLwTO7XctcK2Ou62E8748iQSOcrRJ
        kRCM2OUo1RXanZtVZG6/SWeYWij6IgbBLg==
X-Google-Smtp-Source: ABdhPJyXlbusIa5aDnUr1YQskJ1UjHwzmZFuuVfIphKPBt8J1C/dFiblCimvtZONWyiR4r621UvA/g==
X-Received: by 2002:a17:90a:b392:: with SMTP id e18mr9115862pjr.156.1611807541303;
        Wed, 27 Jan 2021 20:19:01 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id a2sm3764717pgq.94.2021.01.27.20.19.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 20:19:00 -0800 (PST)
Date:   Thu, 28 Jan 2021 09:48:55 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Remove calls to dev_pm_opp_set_clkname()
Message-ID: <20210128041855.4sovmu3bnbq7efaa@vireshk-i7>
References: <0f22cc1791d8b88c50a9790c2dc19455b34ec7b0.1611742564.git.viresh.kumar@linaro.org>
 <7daaf77c-4ba0-0c69-1028-49518eb44d18@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7daaf77c-4ba0-0c69-1028-49518eb44d18@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27-01-21, 22:27, Dmitry Osipenko wrote:
> 27.01.2021 13:16, Viresh Kumar пишет:
> > There is no point calling dev_pm_opp_set_clkname() with the "name"
> > parameter set to NULL, this is already done by the OPP core at setup
> > time and should work as it is.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > 
> > ---
> > V2: Update tegra124 as well.
> > 
> > Krzysztof, please take this through your tree, it doesn't have any
> > dependency in the OPP tree.
> > ---
> >  drivers/memory/tegra/tegra124-emc.c | 13 ++-----------
> >  drivers/memory/tegra/tegra20-emc.c  | 13 ++-----------
> >  drivers/memory/tegra/tegra30-emc.c  | 13 ++-----------
> >  3 files changed, 6 insertions(+), 33 deletions(-)
> 
> Ideally drivers should be able to ensure that OPP table received the
> clk, IMO.

I don't really agree with that, this stuff is internal to the OPP
core. And it should all work unless there is a bug, whose effects we
will see anyway.

> But this is also almost fine with me since realistically
> clk_get() shouldn't fail if it already succeeded a moment ago.
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>

Thanks.

Krzysztof, please apply the patch to your tree. Thanks.

> Could we please fix the _allocate_opp_table() to not ignore clk_get()
> errors like -ENOMEM and etc?

Maybe we should fail if the error is anything other than -ENODEV ?

-- 
viresh
