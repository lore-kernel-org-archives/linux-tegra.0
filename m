Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB2BC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Dec 2020 06:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DCFD22285
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Dec 2020 06:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgLXGw1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Dec 2020 01:52:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgLXGw0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Dec 2020 01:52:26 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FE2C0617A7
        for <linux-tegra@vger.kernel.org>; Wed, 23 Dec 2020 22:51:46 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id z12so669247pjn.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Dec 2020 22:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UwfYLcIirH3qmQI4JsZzO7mShidOe2h56ps9Mn8CcUM=;
        b=p3LVWtHH4lnaxCM8RaV0FuiWfeYOi6He8i8ZzNhCF2uE9taZX9ndUrAyZBXTOdxsnT
         8t1a2YxI3HYBrNnJu5/+84bn8mvwe06wBzE8OjHFScw6bPwKQUlii9XgIa5kYYzLrQjz
         cevJ8CwVsVedjRe1pyo4VzLQM56IHQU1HXJZv8Ymr7DpvswknpNhVK0bNDhjWr+AmyFA
         VXnPNO7lGfweDD3iaWdIQbaycRrOmiT6TEl2s4l7BsI+AFuYMhsl2he2VEUu8wHUmrgN
         JAyaUYWYX4+N3gjwuNljjOM87xxFl7tYQT3LDU5fujok71XDOV2xYGmYz4hU5PcuZaI9
         o6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UwfYLcIirH3qmQI4JsZzO7mShidOe2h56ps9Mn8CcUM=;
        b=hEeJZEpagf6Rxcxt80aajr3ZKkvBMGUw5lYoXoSVWI1QgUfy5Buv9EzB4VTAdyU/96
         4OFa5zqc5YyLFA4x7twqraBT18qTsQZO1XDg2jMjRu1V2Ygkyu7dK6yqDTRImamQLBmq
         5E9WIer+LzYJ/dCBEy2MC6QBZjBjGecFub/CfznwnoNR0u3c35sxRTS+2q3v5iyMIsA7
         bF9uifSepMukfbsixGxGIKBCc1MYhN22x5J3CpwiOsID43Nh5VUBU7wDKrxcvjQAV1vR
         0E5jVM3uLGmzt7ESVqVea71SbCwA9ow+NSEbXDTuu/LB3lJnNXiwdgDeNwjiGJbcBB5u
         Kb6w==
X-Gm-Message-State: AOAM533GFXPNA+uODn3y0QzJXmMsmJ0PXdXpSGDUsMo5ZSN6/WhXfskz
        HA8kh3wLMGvUHWG75Zqy8mWwYw==
X-Google-Smtp-Source: ABdhPJxPqikU/RNfF0gTcEkAqxaTFu96TFPfNpSQbS38QvWMYUf6BnYHm7AoCnEqPDZbtfAFx+0fHQ==
X-Received: by 2002:a17:90a:9d88:: with SMTP id k8mr3121955pjp.141.1608792705605;
        Wed, 23 Dec 2020 22:51:45 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id w18sm25677012pfj.120.2020.12.23.22.51.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 22:51:44 -0800 (PST)
Date:   Thu, 24 Dec 2020 12:21:42 +0530
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
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
Message-ID: <20201224065142.7rhfx37wgg3ejjqm@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
 <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
 <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23-12-20, 23:37, Dmitry Osipenko wrote:
> 23.12.2020 08:57, Viresh Kumar пишет:
> > What's wrong with getting the regulator in the driver as well ? Apart from the
> > OPP core ?
> 
> The voltage syncing should be done for each consumer regulator
> individually [1].
> 
> Secondly, regulator core doesn't work well today if the same regulator
> is requested more than one time for the same device.

Hmm...

> >> will return the OPP table regulator in order to allow driver to use the
> >> regulator directly. But I'm not sure whether this is a much better
> >> option than the opp_sync_regulators() and opp_set_voltage() APIs.
> > 
> > set_voltage() is still fine as there is some data that the OPP core has, but
> > sync_regulator() has nothing to do with OPP core.
> > 
> > And this may lead to more wrapper helpers in the OPP core, which I am afraid of.
> > And so even if it is not the best, I would like the OPP core to provide the data
> > and not get into this. Ofcourse there is an exception to this, opp_set_rate.
> > 
> 
> The regulator_sync_voltage() should be invoked only if voltage was
> changed previously [1].
> 
> The OPP core already has the info about whether voltage was changed and
> it provides the necessary locking for both set_voltage() and
> sync_regulator(). Perhaps I'll need to duplicate that functionality in
> the PD driver, instead of making it all generic and re-usable by other
> drivers.
> 
> [1]
> https://elixir.bootlin.com/linux/v5.10.2/source/drivers/regulator/core.c#L4107

Lets do it in the OPP core and see where we go.

-- 
viresh
