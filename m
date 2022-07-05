Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B449BC43334
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jul 2022 04:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbiGEEI1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jul 2022 00:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiGEEI0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jul 2022 00:08:26 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D61FE8E
        for <linux-tegra@vger.kernel.org>; Mon,  4 Jul 2022 21:08:25 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso1029521pjj.5
        for <linux-tegra@vger.kernel.org>; Mon, 04 Jul 2022 21:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jlwigwlQcoYrdhkSBW2yT+ZrjXNWxDoG9Qdpdv63Uew=;
        b=bOFzd4V7IdTxyt1oHggTxGQErW7qbQZy3wf3TXGcorZf/khYnmfvymzgzeLCK7zxGr
         qWUS67+BzgMhud6EP93G5FhLZe6JoTJqSZskRMV0fuXBcEe/c/Y9y3/Nm7nDkOgQN8Ef
         ZH5QHllrTye9o5kvP3A65PQHqn6pJujKXzoogqxmAoknTGiiULqDvZFgxFYhcYFzr4u1
         Xh7yjcqGW/4KkoNTDmVDk3HBAyqbtcgNWNvDY7HtB0qPEn7kqI6AFG+Y/sfmJukGklfI
         2bpW0Xt3fvffhdLk+Vz/CKAwHA0yZm68G0IK+qL89On1kJEoIdHrJMAxrWa/bNluCt3d
         budA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jlwigwlQcoYrdhkSBW2yT+ZrjXNWxDoG9Qdpdv63Uew=;
        b=EN3Awsr7Pm090xTv6IDpN4o13znMko9OUcurI/8ph4BsruiedXbinS6eX3BnarJksy
         8KgKI6NPwpaKDtjjNi8PVJ2IJPCrz9KdFnFmXZMQN3tWL2RIJhXoKdlPHKRFrv3xRyzj
         i/AWQLfqN6+NYxqNHRP1/uoBTmknIbf9esdNfAriMY608k4FpFPq9zq42IRxXZnM8cHG
         LUMNy2wLVB5fWuuYPoRsWKb0i6Ph4AsnmSK1kwououQTz3oHYL8g+ZfViL4MtJ34ZtQc
         4QtKiHjGMB5PRpkVQRf0m2jVFAzKN23aeR10p7zRTqHB+SWN0zHkMUZzPFtBJLvKftcf
         4ReQ==
X-Gm-Message-State: AJIora8vCmEoAz4+Oy9HjSZ7TCGitID5F8yPku1NKnVJAoVyU9e3aHdU
        7X63enUB9+ZHwDvccJPQ8Lrolg==
X-Google-Smtp-Source: AGRyM1tNI2QNHBytqnLJKVyWohCZSupL/dSQ4ZO3W5+QzMRn/9xTNXOmN0sXqWjo7ei3cYWMv/T6NA==
X-Received: by 2002:a17:902:c405:b0:16b:e7aa:2f22 with SMTP id k5-20020a170902c40500b0016be7aa2f22mr6341600plk.170.1656994104538;
        Mon, 04 Jul 2022 21:08:24 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id p22-20020a1709027ed600b0016a0fe1a1fbsm22257702plb.220.2022.07.04.21.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 21:08:23 -0700 (PDT)
Date:   Tue, 5 Jul 2022 09:38:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5/8] OPP: Allow multiple clocks for a device
Message-ID: <20220705040821.w5hrj5qmm6tbtpap@vireshk-i7>
References: <c6f100e4-8a35-ebf0-f833-06ff0d8a2fb6@collabora.com>
 <20220630005028.fddtcbkoksbygwc5@vireshk-i7>
 <8367c38b-8cd3-cde1-5833-874769ef3350@collabora.com>
 <20220630095245.otvo53ezd4avoujw@vireshk-i7>
 <b899ff5f-b424-5f44-7c94-deb013ff6bbc@collabora.com>
 <20220630101540.5dafkegrmcattt2c@vireshk-i7>
 <20220704120915.s3ermueulcofg7nj@vireshk-i7>
 <58cc8e3c-74d4-e432-8502-299312a1f15e@collabora.com>
 <20220704155225.n4kmgwnvsuksbo2p@vireshk-i7>
 <7c661c98-0cd2-1732-d60c-3202643926a5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c661c98-0cd2-1732-d60c-3202643926a5@collabora.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04-07-22, 21:04, Dmitry Osipenko wrote:
> On 7/4/22 18:52, Viresh Kumar wrote:
> > On 04-07-22, 16:17, Dmitry Osipenko wrote:
> >> Actually the freq was 0 and it was 1 on the next loop like you suggested.
> >>
> >> Previously, the _read_opp_key() was always reading the opp-hz. Now it
> >> skips reading the rates in _read_rate() because opp_table->clk_count=0
> >> for the tegra30-devfreq driver the uses devm_pm_opp_of_add_table_noclk().
> > 
> > This is exactly what I wrote in an earlier email :)
> > 
> > Anyway, I have pushed two patches on top of my opp/linux-next branch
> > and they should fix it in a good way now I suppose. Can you please
> > give that a try.
> > 
> > This is how the diff looks like:
> > 
> > PM / devfreq: tegra30: Register config_clks helper
> > 
> > There is a corner case with Tegra30, where we want to skip clk
> > configuration via dev_pm_opp_set_opp(), but still want the OPP core to
> > read the "opp-hz" property so we can find the right OPP via freq finding
> > helpers.
> > 
> > The OPP core provides support for the platforms to provide config_clks
> > helpers now, lets use them instead of devm_pm_opp_of_add_table_noclk()
> > to achieve the same result, as the OPP core won't parse the DT's
> > "opp-hz" property if the clock isn't provided.
> 
> Works, thanks you!
> 
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Finally, thanks a lot Dmitry :)

-- 
viresh
