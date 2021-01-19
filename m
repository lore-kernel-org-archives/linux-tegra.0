Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC42EC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 05:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FD52206A3
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 05:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389177AbhASFEC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 00:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388577AbhASE7R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 23:59:17 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F3AC061575
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 20:58:31 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id q7so12277350pgm.5
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 20:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GdalPBArCtho3m6AI39Xqzf4zzknjhHroOmStBYwPLY=;
        b=Rj1TQbsQGJRCnHXDtaee94EgFB3Gzj+tPtoMau45lYOoYARNJ/zp0IC0GPIhZRdhtq
         5zGZO0oSAMmYJN/86j1yi/UKsvqMM4k4dcrVZrh5PlNFAUtPiuUhEfrlYaXn+PWDncpR
         0JAkmG0CN8j5xTRMnH72O3sILj+71j9JLtEIZLMIwZPXneo/8pPtwE38LjozqKBX4/5N
         bz2Igu4UBjqJGcAePgpAluq5x90ajUhNNF0OU/sEVgXO8b9RFa2ZuXK+N/e7ypyIivzt
         Fqqs6f5pNSPLtNWgvwJ6ZKZTjxhlbEtT2geZngo1Xm8uMI9olzz3tljelLU7EkcoDNnj
         LHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GdalPBArCtho3m6AI39Xqzf4zzknjhHroOmStBYwPLY=;
        b=MYHgn7ZnHLw8VL82EoQInsggmiGwOw0kxpzy95ohVPy+yA4SPNP7PAcoC096XwmLiv
         9byK9oGckvby8UTi9sthryLUzID/6ut9l1SnOzWBjCx+tS+eV9S8WIir6jad01o58koZ
         Ptht3eGaMzE6NJHfeCwQ9SW08z3ttyOdCM545c/Xsi4a6eoRMgI00JqYvrmqeaJAVCh+
         RxcDCVMvlac0tN0qWJawuf4fO5U8ZOQYBxulhjI865wOFASQvod7zQota2XS6xOck19e
         4Y6mkf2lEPjSsQDu2CUxRBAPgQvmSBvZlD5fTYExASIsl5VbaqswimBlYOKctGFuW43H
         E3/Q==
X-Gm-Message-State: AOAM530fKtV3M70K9UdpcCSvnjWCbARpN5zCQUBTCvvQNhliwy0LEi09
        OqYV7QvnLcMuapqg/ZarsAxGYQ==
X-Google-Smtp-Source: ABdhPJyuVIXevpohF1/KkcC1LFB/FpvGvIhi0xZnxFBU+U/e6qNXQ7Y5MqytGpLY5V3dalaL5iGMNg==
X-Received: by 2002:a62:4e43:0:b029:1a4:684c:87ea with SMTP id c64-20020a624e430000b02901a4684c87eamr2721535pfb.75.1611032311078;
        Mon, 18 Jan 2021 20:58:31 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id r30sm729407pjg.43.2021.01.18.20.58.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2021 20:58:30 -0800 (PST)
Date:   Tue, 19 Jan 2021 10:28:27 +0530
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
Subject: Re: [PATCH v3 04/12] opp: Add dev_pm_opp_sync_regulators()
Message-ID: <20210119045827.2645gk6vabubehuh@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-5-digetx@gmail.com>
 <20210118082013.32y5tndlbw4xrdgc@vireshk-i7>
 <4acde958-91c1-bbcb-6e20-2d90cf0e57d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4acde958-91c1-bbcb-6e20-2d90cf0e57d3@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 21:35, Dmitry Osipenko wrote:
> 18.01.2021 11:20, Viresh Kumar пишет:
> >> +int dev_pm_opp_sync_regulators(struct device *dev)
> >> +{
> >> +	struct opp_table *opp_table;
> >> +	struct regulator *reg;
> >> +	int i, ret = 0;
> >> +
> >> +	/* Device may not have OPP table */
> >> +	opp_table = _find_opp_table(dev);
> >> +	if (IS_ERR(opp_table))
> >> +		return 0;
> >> +
> >> +	/* Regulator may not be required for the device */
> >> +	if (!opp_table->regulators)
> >> +		goto put_table;
> >> +
> >> +	mutex_lock(&opp_table->lock);
> > What exactly do you need this lock for ?
> 
> It is needed for protecting simultaneous invocations of
> dev_pm_opp_sync_regulators() and dev_pm_opp_set_voltage().
> 
> The sync_regulators() should be invoked only after completion of the
> set_voltage() in a case of Tegra power domain driver since potentially
> both could be running in parallel. For example device driver may be
> changing performance state in a work thread, while PM domain state is
> syncing.

I think just checking the 'enabled' flag should be enough here (you may need a
lock for it though, but the lock should cover only the area it is supposed to
cover and nothing else.

> But maybe it will be better to move the protection to the PM driver
> since we're focused on sync_regulators() and set_voltage() here, but
> there are other OPP API functions which use regulators. I'll need to
> take a closer look at it.

-- 
viresh
