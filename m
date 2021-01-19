Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2581EC4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECD6F23104
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392208AbhASMDB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbhASJ4D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 04:56:03 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E85AC061574
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 01:55:15 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id md11so11474507pjb.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 01:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xAqXt2hrMnUwGHY4K/vXVEtDT5xO+PqICWyHvp6jNI4=;
        b=yLyMj40c8dpxG49080WIa+e1h0pdwJbbPb6WrmW/NlllBflJkMeezxlqx/j4D5Eu+f
         UVjn8MO4sm0KngRQxbChnQghGE8x7cuFzzgtIWVDa4mwXm+TnRc3LgZNKRDKwjDIWqk/
         xd1U0afI3Wfh4S7IEVlwnL6i/FE6p/oj8XtHRhcJDpvC45IRYws7FU6ZBKyBFqPyed4U
         MoieLszFLBCu2JWPzofsc8lwyRT7UFSDBPMDaoTmg4iGU+VoBu3jjofvFwH1C2en01Mf
         UePfcVcZW4+RGC2J74FvKjBsbvFQ0mWIWrfMWdyEpT6tW6pjxGN2/N1X2RjaVTPIu+SA
         92aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xAqXt2hrMnUwGHY4K/vXVEtDT5xO+PqICWyHvp6jNI4=;
        b=TWMwQLuw0xv1z6oWYBxgLEHr3x+tCpAZbQTVt7BIHH8E9T8PYfwhNtu7eboHyoPHvp
         45W/iOCOJMlMR4Dx2rZL66vd9wZoY7Zi48aK5aAURqv1e1uXIz5L4t9cFR7EbRz9BJiY
         kXKLToxEwSmdKx8NQ+a7Lfwxm/sXZwLhHSvS1m1CkSlSsMCHvW4yT2pUsJ34P5DpHqB/
         mJuFES3maGeUjgAairmNako1AgDMNuH4RC3x3JAxG5mf6NtQWqrVySMUkJj9r0NHVusL
         GzNaz88uWtxPHM4kqLLAaaH/lKlzdK8pdsIbm4rvszxlh1HHy9tkNtLOLK5fl8etck2v
         TOQg==
X-Gm-Message-State: AOAM530GrWYXQSXV1UbX9l5tEEzfvymO4MAQjBh2YkcWuAlzMZlLdrsr
        JfxosV0+poJau+5jbt/SDwR0NQ==
X-Google-Smtp-Source: ABdhPJzzA9SrNQFl+F6LdDy36vNrtNXWt6cwOvgIfknJpkBo8QX65rmWDW606+FJKruuIfh0mqyekA==
X-Received: by 2002:a17:90a:fa84:: with SMTP id cu4mr4536724pjb.0.1611050114175;
        Tue, 19 Jan 2021 01:55:14 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id q9sm18869325pgb.82.2021.01.19.01.55.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 01:55:13 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:25:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] PM: domains: Make set_performance_state()
 callback optional
Message-ID: <20210119095511.s3xntwwq4g65dcoa@vireshk-i7>
References: <20210118011330.4145-1-digetx@gmail.com>
 <20210118011330.4145-2-digetx@gmail.com>
 <20210118072855.anncyl6z3e5uznvd@vireshk-i7>
 <CAPDyKFquCGUSTvcCpmN0vm1eGEz9B_hYSNm7wojhgwuXT=jkEQ@mail.gmail.com>
 <20210118110506.linvsoca7jbl42iq@vireshk-i7>
 <CAPDyKFr7SD_A9sKD2+90XfjP09T+PCLE=8qvn=M-yPEPXvBhsg@mail.gmail.com>
 <20210119034428.qgjjlvti6sirsnzy@vireshk-i7>
 <CAPDyKFp3OpV5qgfB_EGf=fyCR5b0b0zntbsXAJJsWbJX09gF6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFp3OpV5qgfB_EGf=fyCR5b0b0zntbsXAJJsWbJX09gF6A@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19-01-21, 10:52, Ulf Hansson wrote:
> That would work if the topology is built from top to bottom, but I
> don't think we can rely on that.
> 
> For example, when a domain A is added as a child to domain B, domain B
> doesn't have a parent yet (and the "can-handle-pstates" don't get set
> for neither domain A or domain B). Next, domain B is added as child
> domain to domain C. Domain C has the "can-handle-pstates" set, which
> means domain B gets the "can-handle-pstates" set as well. This means
> domain A, will not have "can-handle-pstates" set, while it probably
> should have.

Okay, I missed that part.

> >
> > > So, maybe we should simply just stick to the existing code, forcing
> > > the parent to have a ->set_performance() callback assigned if
> > > propagation should continue?
> >
> > I think it would be better to fix the issue even if we aren't fully optimized
> > and making the change to make sure we keep propagating is rather important.
> 
> Alright, let's continue with Dmitry's patches and discuss this further
> when v4 is out, as he seems to have it almost ready.

Right.

-- 
viresh
