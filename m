Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF20C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 07:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB3EA64DD6
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 07:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhA1HCH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 02:02:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhA1HCF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 02:02:05 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94C6C061573
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 23:01:25 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d13so2825996plg.0
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 23:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nlba24MbVDarjbDWpz/7r7AuP6jGDXLXfVDSaaZnioc=;
        b=CQrSlYQAFkR9mTkea/Og6d9itO4X0ucrPrdmZnnS+W7X9SSXuLeRnkUW42pl3MuDlu
         HMGldKk3rabPpFJ4Y/7RGCcMHADDabJc3vgRy4az+r1YlIeabU/h26bGp9s65SkwMclJ
         cdpa8X6Qhg22Ma4mbSSC9HwJaSS0alKqZoOa0x6HNkaKPGHUXDgS0ff0cPOWuFO70ZPU
         izGmB5iu1z/0ks366VGNhSTOrnzqc3fL1AuOljYrvh0fJKVRVgXJwhz/l4N5N/33II5P
         pKdZLVzdEfrN650ZYNQ3/EI0y1N27p8GVG/mivXwNpUrx1WSOayX+jTnPPgYf8FMlwgR
         M6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nlba24MbVDarjbDWpz/7r7AuP6jGDXLXfVDSaaZnioc=;
        b=tqIYmK+RTboOcFek0m1j5YEui8kFvg8o90pib+6r0l+Lt/1mDYcRGNaCTOKBXQxtjG
         Hq/z6T0eHou5+M+msWBytyNtW54eY70BVUnA1GQNEwuGFf/tEbovOcFL9pDIrPQemqsI
         jyphbZs5m0Te4qlTOIocSwMrm4FP/3rAJHXJeuq09UYX5x/9wU2lZTdmIWYTacpTYsW8
         c1BR9PUTUYXBrpyHE+QBYQEYhIFmc3zK215YK7F2/Pvq1HajvdXHSFAhuaxgBv0yDFTz
         KDPkJuPxJDVVqLLDuKk12dzwq9DJhCHAlRIAC4IvSx5KKw8a3rqJXcDcrEChHY1a4y0w
         7pYw==
X-Gm-Message-State: AOAM531dD9HCnCZEtyA5MzUBDB+zpBdrIdJom2dt2WGuTvMybynzUcyB
        qbKPMts8bmAafTLAzQxWouRl9w==
X-Google-Smtp-Source: ABdhPJwJrZUiQO7pCFolzTYtxYtzNwESyIYHO8ut0T/Glo0lFk5TiR1nbYNQ/a7MnPw6ElBz53tRAQ==
X-Received: by 2002:a17:902:854b:b029:db:c725:edcd with SMTP id d11-20020a170902854bb02900dbc725edcdmr15248493plo.64.1611817285276;
        Wed, 27 Jan 2021 23:01:25 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id 77sm4530580pfx.130.2021.01.27.23.01.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 23:01:24 -0800 (PST)
Date:   Thu, 28 Jan 2021 12:31:22 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 11/13] devfreq: tegra30: Migrate to
 dev_pm_opp_set_opp()
Message-ID: <20210128070122.d3syt7mhey2dcf4s@vireshk-i7>
References: <3345fd49f7987d022f4f61edb6c44f230f7354c4.1611227342.git.viresh.kumar@linaro.org>
 <f0341655361aa0107266ed9c838aa8bcfe50a3ed.1611738418.git.viresh.kumar@linaro.org>
 <20210127100234.vl2wwe7rjrrz4btz@vireshk-i7>
 <b5f1065b-14ad-adae-af1c-e9962e6626ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5f1065b-14ad-adae-af1c-e9962e6626ad@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27-01-21, 18:58, Dmitry Osipenko wrote:
> Sadly this doesn't work because we missed that clk is assigned to
> opp_table when OPP table is allocated and not when it's added to device.

Ahh, I missed that.

I have bumped up the other patchset to V2, that should work fine with
this patch for tegra30 (this shouldn't require any update).

Everything is pushed in opp/linux-next, fetch and try it. Thanks.

-- 
viresh
