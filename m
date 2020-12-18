Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6575AC2BBCF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 07:15:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DF2D23A80
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 07:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgLRHPj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 02:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727449AbgLRHPi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 02:15:38 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F30C061285
        for <linux-tegra@vger.kernel.org>; Thu, 17 Dec 2020 23:14:58 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z12so824537pjn.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Dec 2020 23:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5uBH5KsWopbV7FffwP9cu3qwTCPbWsa/gpWuvPcUSsg=;
        b=QAa+QgBNWGXQOzLHcEttslyMX7yfVRFnmsie63URsvH5GVYmCfqLASAvZuwYX9MIET
         eDmE1hBXyewXRMKiWj91RDHrjpb/kMVBkEeGid+6WGS4/m50KcVQrRCW8T8QrPc/NQ/n
         xkFA8qANdUY/ZMDZ1U10ACf2taGB60mF9xbpsuylhp3HoF/iXl+pGW94NzxojOGrxEL+
         jbM/5E7N+gPH/W3t8wPwMcbtn6s1VbaU8LAIXwc8wN+nbdu3UYGXyxVvioFI2s3fGdha
         qUWYb/n/DIAy3pLKM/lOTXvtnloCMYB9AUwFndWYRMY4bs1NSawqpvTYjUnjhU9MTH8e
         72jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5uBH5KsWopbV7FffwP9cu3qwTCPbWsa/gpWuvPcUSsg=;
        b=sy3IfxT7pupuO5SSEF66vIIAaGKyvgZ3xB8nraEYfas/qSjg2BidwHA5oXRIDh8FLJ
         nkECt4ShSg291/lcURYdIEPCr6SfYPxMunTM9p7AGWB+mJrnpWLuMZegerA1PW4C2jW1
         1BC+04IE2DYLgDzNRbmqlgOaEvLfl9MbXpN4RcnUWHn9D7Ti3h/lNGvK1ltW2CgAOfWU
         fwY0Cui9idyuB8jYv8gmqo9bkHSe+RQ23XK1eVSuGFDHvOBpt+LG7h5AwHwFTBi9K36m
         n5m1CFXGAnEJvvT8URCsPRjcZUc7ClcnymrE1GoVq4MQ/c/R14ayRF0Rxv+HYSK3WWyd
         haYA==
X-Gm-Message-State: AOAM533j1DJtK36T6Ovjq4ylIqlXEIVVkdVD9rzMyPI6pkc1COCVk5Kt
        vwNqUfz09L3JajMw8IYhDCU+1w==
X-Google-Smtp-Source: ABdhPJxh6Vc+BoEp2nvhSj4YmNHb7ku5mMkwmUaQUKeZHUbZ9rzCY6oJyHfeJDwsJp2g/i5HDfSMhg==
X-Received: by 2002:a17:902:8f94:b029:da:d168:4443 with SMTP id z20-20020a1709028f94b02900dad1684443mr3091172plo.57.1608275697958;
        Thu, 17 Dec 2020 23:14:57 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id j20sm7721737pfd.106.2020.12.17.23.14.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 23:14:57 -0800 (PST)
Date:   Fri, 18 Dec 2020 12:44:55 +0530
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
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-12-20, 21:05, Dmitry Osipenko wrote:
> Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
> power consumption and heating of the Tegra chips. Tegra SoC has multiple
> hardware units which belong to a core power domain of the SoC and share
> the core voltage. The voltage must be selected in accordance to a minimum
> requirement of every core hardware unit.

Please submit the OPP changes separately (alone), it will never get
merged this way. Send fixes at the top, any features you want later in
the series. It is fine for you to base your series of patches which
are under review, you just need to mention that in your cover letter
for your platform's patchset.

-- 
viresh
