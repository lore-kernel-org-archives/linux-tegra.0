Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D91C433E6
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 06:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 697702311F
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 06:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbhASGh4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 01:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730113AbhASGgr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 01:36:47 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA9FC061757
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 22:36:07 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id p18so12369908pgm.11
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 22:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=X5IMzCSjw6hdE0XYKTmPpUTu7Rrf+T8M0wW3hZeEQ+w=;
        b=TVyBVn2kvggDDFt8zMQcx6cZ4HsYmqisKNtFOLIQgEofRxA6SO6mEMqGRUdgiKuZoj
         ILjwcx6zf18jHqTs9k5RmDCBtBgjPVy8q+mPq5ItW5yGwPDePuAa6Qg8dh9GvG0HR+Pz
         3LcumwwsPip9Zwsz9JgGVt32Jh2sUE05gEvRMd/yZTB/ao0cQ0baj/5UL/VVK4qLfzLv
         RuOHq+YV3bEtbYfDhdQ9B0UgRCPE+NgQXsADKgswcFJqqYmR5Sj55lYKeo6dHgFP/2GC
         +Sx5o5iU60KxODan/z0YsJ3rYPSAqblz2sFcOfGtthbLxBzygSPIO9vQY8cGj7NC/90c
         VlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=X5IMzCSjw6hdE0XYKTmPpUTu7Rrf+T8M0wW3hZeEQ+w=;
        b=teNVyAGOrx0hyN/LJXJQuvzEwcYyBIOrKPkewiz9gRa/sjjAgG/TJ8po8us7IGpZI2
         Ki7wnYs6m4adLGDfi5qPyspA5Rk4d6Aohw8Ra7TObjsps/MS14gziQMaK7IGcdofg3Az
         1Ib0HBTeuq9tdejqRyLgrPj6nGX/nW7Bl/GAXzPO8ox3nEGxL02yCoe8BB1P8UXBFCU6
         1c99oPfWsmJiLfUDkFi1wGyStZLiCqG1YEUpMheA4avZoTERMU5wFkyMeoTvfCF4yp2G
         ibd1RzXIMQgZGhuUZZNVeuZvTzKosRJjrLTl8g2g3JhGZvXLC9b/3x9a+utdRMRlRP8K
         y2/w==
X-Gm-Message-State: AOAM530JBfR/ksxtE140YrpOgUdpQpzQFBi2bKpsmC1WvIiiv02tqgRB
        alUbubo5lQr9YFQI0KP9eqrU6w==
X-Google-Smtp-Source: ABdhPJwemrAik0aboHC/87dKaQTGExZ9AwAfw7s+kZOyu9xR1AM7abKX1vES1VKZTcBV7T3k+afM6A==
X-Received: by 2002:a62:8414:0:b029:1ae:6a9a:48c7 with SMTP id k20-20020a6284140000b02901ae6a9a48c7mr3059280pfd.52.1611038166710;
        Mon, 18 Jan 2021 22:36:06 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id h11sm1509164pjg.46.2021.01.18.22.36.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2021 22:36:05 -0800 (PST)
Date:   Tue, 19 Jan 2021 12:06:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 10/12] opp: Support set_opp() customization without
 requiring to use regulators
Message-ID: <20210119063603.oqbpndniizfifp4t@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-11-digetx@gmail.com>
 <20210118114451.5mpuvgnhhajx4b3y@vireshk-i7>
 <fb69353c-a35b-9b7c-46bc-d464c6dab6f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb69353c-a35b-9b7c-46bc-d464c6dab6f5@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 21:48, Dmitry Osipenko wrote:
> 18.01.2021 14:44, Viresh Kumar пишет:
> > On 18-01-21, 03:55, Dmitry Osipenko wrote:
> >> diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
> >> index eefd0b15890c..c98fd2add563 100644
> >> --- a/include/linux/pm_opp.h
> >> +++ b/include/linux/pm_opp.h
> >> @@ -13,6 +13,7 @@
> >>  
> >>  #include <linux/energy_model.h>
> >>  #include <linux/err.h>
> >> +#include <linux/kref.h>
> >>  #include <linux/notifier.h>
> >>  
> >>  struct clk;
> >> @@ -74,6 +75,7 @@ struct dev_pm_opp_info {
> >>   * @regulator_count: Number of regulators
> >>   * @clk:	Pointer to clk
> >>   * @dev:	Pointer to the struct device
> >> + * @kref:	Reference counter
> >>   *
> >>   * This structure contains all information required for setting an OPP.
> >>   */
> >> @@ -85,6 +87,7 @@ struct dev_pm_set_opp_data {
> >>  	unsigned int regulator_count;
> >>  	struct clk *clk;
> >>  	struct device *dev;
> >> +	struct kref kref;
> >>  };
> > 
> > Instead of kref thing, allocate the memory for supplies from
> > dev_pm_opp_set_regulators() and store it in new entries in opp-table
> > and for rest of the data from dev_pm_opp_register_set_opp_helper(), to
> > which you can copy supplies pointers then.
> > 
> 
> Could you please show a code sample?

Sent a patch to you.

-- 
viresh
