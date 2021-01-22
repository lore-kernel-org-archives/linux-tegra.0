Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1287C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 07:27:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65B4023A54
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 07:27:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbhAVH1R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 02:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbhAVH1K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 02:27:10 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F41C061756
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 23:26:30 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id lw17so6005854pjb.0
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 23:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3YIYX5mk10bt+Xc3y97u3QBxeKBRZH93iPJqF2Cceik=;
        b=SiUkFCl/s9Z+xgmkDrVdAKhO/6CI7nxwZspcptlzaJMYzvgkwcdAPgGv0YvbkVxEaP
         j9B7Be+lWsmUAn+B8CBLhvCoA68TTkai842aA2tajU6ued41V+Q2A+ZaQMjGmyQtaE4g
         DFg99s0Y5k6PrN9VJVUWRUkDpy2zgRClhziwXQSTF7nMSm4y5cSbaTu9bZHWODZrTcw0
         aYFPWFLM/LYOZGwyZ6/OVzahQWtcJJLzjNLBOybutIYjjCm+mm5qp1kJZcgsVFl9ld/5
         b+GZu8U7IRoKAkTHpCymeUjOlyZ2jZjbfF1DQEDEZPMZrxL53EaQyLXwKWe2Y2j9F2fQ
         JuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3YIYX5mk10bt+Xc3y97u3QBxeKBRZH93iPJqF2Cceik=;
        b=c4IhEgV+vf0ykEUYm3Hz/w/pAVG4BRKIMeCJCWaYkdaDrIjk2wJinb/QVZtXH4s8dT
         12/01GBwP/Wp1Wq4FF/lx5cWq7juh1TIoLsd+K40myrmgFcpL/zpdVs3HIde/pBeUX6e
         BLHyDhbMXrmMLn5Diw0TDCdtgLd505HV4TvLRvnXcsuc+HwtcmZ6bYj4qdBd9wV9oaTP
         LgS1ktyPxXKXR4LPfkJnAx5fnWJajcWdRD9msc38r+Xwp3GAep/R7y+zvSuybctLt4su
         Y/tfItnHtAamG4NaAzhlkTBVUhmyD2DW1x3nQ5GjuTgvd5dW7vOf687p7ti7CjTtiqFb
         ++CA==
X-Gm-Message-State: AOAM533SqN39f9sGCpNVtQqjtR1x2fD1HJPNK8l9A/hg40MQ7eSwoRZa
        gt9hemkrKba+dRFkB9WrHrZbLQ==
X-Google-Smtp-Source: ABdhPJwl6UdKA4DSSvlOS2zeZ+4/K+JiUYVV6IE4QR9L9k79kEF/WlpDJci0JCXicG66p1XFVkHI1Q==
X-Received: by 2002:a17:902:67:b029:de:c5e0:87ca with SMTP id 94-20020a1709020067b02900dec5e087camr3733334pla.64.1611300389507;
        Thu, 21 Jan 2021 23:26:29 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id i26sm7929902pfq.219.2021.01.21.23.26.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 23:26:28 -0800 (PST)
Date:   Fri, 22 Jan 2021 12:56:26 +0530
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
Subject: Re: [PATCH v4 4/4] opp: Make _set_opp_custom() work without
 regulators
Message-ID: <20210122072626.mlbthef43hjldnyr@vireshk-i7>
References: <20210120222649.28149-1-digetx@gmail.com>
 <20210120222649.28149-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120222649.28149-5-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-01-21, 01:26, Dmitry Osipenko wrote:
> Check whether OPP table has regulators in _set_opp_custom() and set up
> dev_pm_set_opp_data accordingly. Now _set_opp_custom() works properly,
> i.e. it doesn't crash if OPP table doesn't have assigned regulators.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)

I have applied this instead:

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 32d653774adc..805fc2602808 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -828,24 +828,31 @@ static int _set_opp_custom(const struct opp_table *opp_table,
                           struct dev_pm_opp_supply *old_supply,
                           struct dev_pm_opp_supply *new_supply)
 {
-       struct dev_pm_set_opp_data *data;
+       struct dev_pm_set_opp_data *data = opp_table->set_opp_data;
        int size;
 
-       data = opp_table->set_opp_data;
+       /*
+        * We support this only if dev_pm_opp_set_regulators() was called
+        * earlier.
+        */
+       if (opp_table->sod_supplies) {
+               size = sizeof(*old_supply) * opp_table->regulator_count;
+               if (!old_supply)
+                       memset(data->old_opp.supplies, 0, size);
+               else
+                       memcpy(data->old_opp.supplies, old_supply, size);
+
+               memcpy(data->new_opp.supplies, new_supply, size);
+               data->regulator_count = opp_table->regulator_count;
+       } else {
+               data->regulator_count = 0;
+       }
+
        data->regulators = opp_table->regulators;
-       data->regulator_count = opp_table->regulator_count;
        data->clk = opp_table->clk;
        data->dev = dev;
-
        data->old_opp.rate = old_freq;
-       size = sizeof(*old_supply) * opp_table->regulator_count;
-       if (!old_supply)
-               memset(data->old_opp.supplies, 0, size);
-       else
-               memcpy(data->old_opp.supplies, old_supply, size);
-
        data->new_opp.rate = freq;
-       memcpy(data->new_opp.supplies, new_supply, size);
 
        return opp_table->set_opp(data);
 }


-- 
viresh
