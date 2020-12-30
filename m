Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AF4C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Dec 2020 04:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 194C7207BC
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Dec 2020 04:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgL3ErV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Dec 2020 23:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgL3ErU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Dec 2020 23:47:20 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E46C06179B
        for <linux-tegra@vger.kernel.org>; Tue, 29 Dec 2020 20:46:40 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id h186so9131499pfe.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Dec 2020 20:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=S7TlR/t9efyKgBLIkX3DcwEJbaeI569mJCDTFS0GWK0=;
        b=Bv4XDe7sX+slpuPaCMEL56juX3yWcw2LziUKmc37jW3yU5m7JGjQqk4PRfEMXq3dSa
         S9Wm6+bIT58vZYkcjtmn1OBPVSUOwLWVIjUcAR8dv0GwdWNbGlmsyBow7j3AeXjSiamR
         wRfhK9laeSI2I90Wv7A42bMayA7xIFS3tHWQP6zK2sKAnxj4HpDgSKZOu34RJEWuulPY
         VGfEK8dc91Mv24zsAHjIqJIGPJoS1Z6DbE9cvjWFckZneGmXR16A4skyPxRGDcqZfLA8
         aclz0r4zUfVV34NGxZ+HPm2hFYZjAfnzac1lYOIQ77mqKg9OF9S+j9B7VzhNnApi+5M7
         /MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=S7TlR/t9efyKgBLIkX3DcwEJbaeI569mJCDTFS0GWK0=;
        b=RYfYzbBtfwKj3PfS/EzNq9cIbwCe91NSzANW04gXVY8w1OvfuV8tu9ChEIzOk0nM0O
         iVOcSB60jGGUJp0hNFKzh6a5neX0ck66st7swA1LfnG6X/IgfBS1sDkFRuLdxZ0sI84t
         FjXCqxoy7IIJeCl6Je24Z/DPk/L7LCoKYE+6YLlaq9d18zbTal+Syjt1co0iWocUZRNn
         xWHY4mq9QCyHwhEneUZOvL5SIxYfzoHfVCNo9YvkdfLg6W61tUytdI6cvEwJu0hIR7tQ
         0gd3LgZUJKxqEiwiXMOfBzdJrh54ml2wIKfYNl9MBxiDsh3g9CPt52ya1SNN18BfgR6y
         wFIA==
X-Gm-Message-State: AOAM531HMtSNew0D0464RgFZimwy6trZ9uFtakjzIJ+nPOwlfClhW8Oe
        zxxOaQBcie0aCtVuUR8NAjfpNw==
X-Google-Smtp-Source: ABdhPJyAMIYVw5j0FbznclvAGjSkFr9eYljcNjUnJ9+BY9Q4/dP8WzEX/TWRPpJAEV49/79xQ6NUAg==
X-Received: by 2002:a63:6fce:: with SMTP id k197mr24081334pgc.423.1609303599877;
        Tue, 29 Dec 2020 20:46:39 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id e65sm43548898pfh.175.2020.12.29.20.46.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 20:46:39 -0800 (PST)
Date:   Wed, 30 Dec 2020 10:16:37 +0530
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
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Message-ID: <20201230044637.jjyw5gwe73ovslbd@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
 <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
 <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
 <20201224064339.zngidobhstnlu2a3@vireshk-i7>
 <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
 <20201228062254.ui727ka2ftijov4m@vireshk-i7>
 <c4a6336f-e7e6-b23e-4d60-a41d8e09aef3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4a6336f-e7e6-b23e-4d60-a41d8e09aef3@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28-12-20, 17:03, Dmitry Osipenko wrote:
> 28.12.2020 09:22, Viresh Kumar пишет:
> > On 24-12-20, 16:00, Dmitry Osipenko wrote:
> >> In a device driver I want to set PD to the lowest performance state by
> >> removing the performance vote when dev_pm_opp_set_rate(dev, 0) is
> >> invoked by the driver.
> >>
> >> The OPP core already does this, but if OPP levels don't start from 0 in
> >> a device-tree for PD, then it currently doesn't work since there is a
> >> need to get a rounded-up performance state because
> >> dev_pm_opp_set_voltage() takes OPP entry for the argument (patches 9 and
> >> 28).
> >>
> >> The PD powering off and performance-changes are separate from each other
> >> in the GENPD core. The GENPD core automatically turns off domain when
> >> all devices within the domain are suspended by system-suspend or RPM.
> >>
> >> The performance state of a power domain is controlled solely by a device
> >> driver. GENPD core only aggregates the performance requests, it doesn't
> >> change the performance state of a domain by itself when device is
> >> suspended or resumed, IIUC this is intentional. And I want to put domain
> >> into lowest performance state when device is suspended.
> > 
> > Right, so if you really want to just drop the performance vote, then with a
> > value of 0 for the performance state the call will reach to your genpd's
> > callback ->set_performance_state(). Just as dev_pm_opp_set_rate() accepts the
> > frequency to be 0, I would expect dev_pm_opp_set_rate() to accept opp argument
> > as NULL and in that case set voltage to 0 and do regulator_disable() as well.
> > Won't that work better than going for the lowest voltage ?
> > 
> 
> We can make dev_pm_opp_set_voltage() to accept OPP=NULL in order to
> disable the regulator, like it's done for dev_pm_opp_set_rate(dev, 0).
> Although, I don't need this kind of behaviour for the Tegra PD driver,
> and thus, would prefer to leave this for somebody else to implement in
> the future, once it will be really needed.
> 
> Still we need the dev_pm_opp_find_level_ceil() because level=0 means
> that we want to set PD to the lowest (minimal) performance state, i.e.
> it doesn't necessarily mean that we want to set the voltage to 0 and
> disable the PD entirely. GENPD has a separate controls for on/off.

Ok.

-- 
viresh
