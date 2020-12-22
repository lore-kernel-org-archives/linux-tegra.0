Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D38BC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Dec 2020 06:43:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1111423120
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Dec 2020 06:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgLVGmv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Dec 2020 01:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLVGmu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Dec 2020 01:42:50 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C52C061285
        for <linux-tegra@vger.kernel.org>; Mon, 21 Dec 2020 22:41:45 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id f9so7874422pfc.11
        for <linux-tegra@vger.kernel.org>; Mon, 21 Dec 2020 22:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mdb8ubeZUDajJW+FcHgYac1dD8MByc7AxGNoAnUULbI=;
        b=npm8TWA8O2hsE4I05GLXYUgOLq1zgQjekB/Y4euzum/q0sfwISRV8ojNFw9xBetHYG
         evQHh7Im53EF1KPazTUM6tG5aazhT/xA3W29tAzWofCmWnBLUvHwm07XeX/ejN4ZKNp+
         GG1EIaznfaIPh04fh8Vuf5DnthO72+88HGixBcUWvlVGWbNtuglnZU0e7Z08HgxGdv8S
         NU/vtGF3TDtC2JLVLs4AZIpRX70hZbTJkcb96VBSFOPBpkbXmP1YGrK7ObL+Aiz9SArD
         8vn+yrLPGr5ZiIMK5ZKv0qTkSfbBMVYVUkMsjTy7Z0aDg9Kb2OysaSGaZdGGmigLzN/I
         S2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mdb8ubeZUDajJW+FcHgYac1dD8MByc7AxGNoAnUULbI=;
        b=iGf+OSdqlAruHWR0pf9xsjlHczORpj8X1V3qqB4/QDi+VVGfI0yG7nYI9FLhFT9b65
         YkndRxTkAAf9UnUpVEqSLIKDLIQALHou5Bs5LuVCzEzbyKj/3y8UKVLuOF3CFLLevnpw
         5WZ1OBDdJVWy1sZgacMmB4/D1ZoC4vKItoGkjf0GSA7BTxYmq6781ipyYph9hnpT1KVz
         1QYnBKLXm/wMmT7c0di7AwFsETWdduT84ORghdowJ72K+EIA+l2gQZCq7B2uAHbhPz40
         BDzLau7nsrndVVXHFj5ufu8nE8HZ5QdVp3HPwkNrRKbeiIFbSRTrWc+bX08Kik0JWLse
         F2MQ==
X-Gm-Message-State: AOAM532+Ivhw3gWzmawg8pXXRqaKr7yNFAiN+iiD0Lp+xaNr7d+tLA3J
        vNtLhZ9Y80pthrA8hJ7Ze1o1kg==
X-Google-Smtp-Source: ABdhPJw7BD4Js7XMjl68MHqDPRxBWn/XxIVoOlLeKMWzpyH+qOtOrTPdNalPZDEVDwvJf8LazuKUiw==
X-Received: by 2002:a63:2265:: with SMTP id t37mr18196221pgm.336.1608619304758;
        Mon, 21 Dec 2020 22:41:44 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id x1sm18440611pfc.112.2020.12.21.22.41.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 22:41:44 -0800 (PST)
Date:   Tue, 22 Dec 2020 12:11:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 10/48] opp: Add dev_pm_opp_set_voltage()
Message-ID: <20201222064142.pidafbhcbrecz57z@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-11-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Add dev_pm_opp_set_voltage() which allows OPP table users to set voltage
> in accordance to a given OPP. In particular this is needed for driving
> voltage of a generic power domain which uses OPPs and doesn't have a
> clock.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

We shouldn't be doing this, details in patch 28.

-- 
viresh
