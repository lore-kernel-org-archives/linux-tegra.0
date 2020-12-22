Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19472C43381
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Dec 2020 05:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E775723120
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Dec 2020 05:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgLVFsa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Dec 2020 00:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLVFs3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Dec 2020 00:48:29 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9523EC061793
        for <linux-tegra@vger.kernel.org>; Mon, 21 Dec 2020 21:47:49 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id w5so7711336pgj.3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Dec 2020 21:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cCGMbIqC4XxP3YzkMZr/q4dVBJexuv/rEbrwR/RfRdY=;
        b=Srk+K+UPjswKkg/1tVgElwXk8iXMo12S4lotAPM6oNqJRfLX4Akb4jCzrEVhJFkNcN
         KwmEReFJdIBHT2WSRvLkd8i7wVFSz7dFKJm/2rVvjMB6ZGvTiX6hGy+DN4X/ZM868V00
         73HzbED5vDA3gtnluSyszbP9FxpDsO4c7ybd4Z2kxt3KPzrU9HDkl0eZjifyL6ThwXeR
         k0KGy+QQ3/ZEWuzY9D28U31GnJbEv+Z2ji2hUUETC1Z5OcgNUbZ9jIW5JLBjioaJAzAK
         jXto8mCy8uH+aG0s1Wrs8f12pwSFRlOMMfPi/A2aGQydtoLszXVJRV7ZUkW2dkIIR5ja
         0K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cCGMbIqC4XxP3YzkMZr/q4dVBJexuv/rEbrwR/RfRdY=;
        b=uA/RyTQbQAKZMhhZIxofNQZ2y/YWGJ3X+5oTe5gK+M+LNWqcCSSo4c+cVPqiYK7HO6
         kXb5tXkW5E2GNOKadOzndYXWXw1q12R8DjbhxsxxdzNo+UztJ2vN5VSoMtlYltsCgXXf
         B+W1CuyVcLR49ulXITE/JigAqYzpDi9HeYuGMv4ugvegL6dXiD58LCLOKVgT29dk8J68
         biZqYowj3J1rZHYJyYvp8KnwGiBEbY6zGXxXThp6jxg58RzfSuPNDQqcHWe5NQmOhCko
         bs94PEFGsdgnga/nOR93aLGdln2cSR3q9GZwHRLF7dNphg5FumcoMJ9mWHmUxioh4QVW
         LOqQ==
X-Gm-Message-State: AOAM531Yhx1bB2lrx6Q10RQysKGkV5AYfK5S8yW/GMTeSqQzxpjSDefU
        NrLC24pfwWjS8vwZnjEXlZ001A==
X-Google-Smtp-Source: ABdhPJwP8rj+wVobkUZDGozTZvrM4sLI7dbTq8nO4cY0ZzqShz5ME0L2t66M0IEjW5YQ3Z5zCN6kng==
X-Received: by 2002:a62:e30c:0:b029:19d:932b:a1e2 with SMTP id g12-20020a62e30c0000b029019d932ba1e2mr18342199pfh.78.1608616068942;
        Mon, 21 Dec 2020 21:47:48 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id f29sm18854172pfk.32.2020.12.21.21.47.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 21:47:47 -0800 (PST)
Date:   Tue, 22 Dec 2020 11:17:45 +0530
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
Subject: Re: [PATCH v2 43/48] ARM: tegra: Add OPP tables and power domains to
 Tegra20 device-tree
Message-ID: <20201222054745.2am4bcbk5df5aqzj@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-44-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-44-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
> index b84afecea154..7e015cdfbc55 100644
> --- a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
> +++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
> @@ -1,6 +1,46 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  / {
> +	core_opp_table: core-power-domain-opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		core_opp_950: opp@950000 {
> +			opp-microvolt = <950000 950000 1300000>;
> +			opp-level = <950000>;
> +		};

I am not sure I fully understand this, why does it have both microvolt and level
properties ?

-- 
viresh
