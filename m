Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E55DC4363D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25A422085B
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEoyV/al"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgJEOCE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgJEOCE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 10:02:04 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2809BC0613CE;
        Mon,  5 Oct 2020 07:02:04 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 184so2347408lfd.6;
        Mon, 05 Oct 2020 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X/w3CEZ9lodjlQSct4mip6uwJZ2zGkN0UfUIv/VK97Q=;
        b=sEoyV/al+Rf3T8SXz6/2wHQ/oV7dBin9RovrWz0nHD2V6hhFwxVbYDTdwoBGlPwhjg
         iErhE+s88QqAEkJ25gPTkKpLqDpGXzcSkjkSF+ktNhG3muw0uzqM+WN32ZMZJ+qEE9il
         kVL9SXhCGbm9dLUOkiH/pXP4igo6smVOMj5dhbRRnrTH0oxIgV/Mkcr1UWnfotMNdJeP
         YZ5CAEYT3bCo60te+2Hj8cxTFa+aye2sAdUhCtSE6Q0Heazk4zFs1NqPfGmEOenjxueN
         9WF6u1Npl1IzQBhkrVN/sEnwyQOCzCo/GVdGq4oLkifxAmWxKHf6Jr+1u86/+9Vfu+Ny
         44uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X/w3CEZ9lodjlQSct4mip6uwJZ2zGkN0UfUIv/VK97Q=;
        b=rGXur0j+IFbdobq9hkuhICB5ZugtrVV+pWwx0Fk45eBxrtVruACpn5RmtdyqKLV7Dg
         YjGeBMqwEg1lWZxGCzh/jJwNwF7uvUg7mV6E9KAfyXiNuTxZyHnkDPe1pzWfdRXKucQn
         VFTjv2pFjdylpDhNY7XjOp5k+cIuQ/5meoSXdyxD7IGqFL5V2NZMoECZSABMI+7wOi6U
         im1F/2AoiKpqf73i4LpDGAbD9aCp23EDY7aJx36cLzMejXFPRZkF3Xc3i4tf2RPAHpbN
         GSJyGl0L6/t9PC8s5RtGVRySf0mGBGPfzZq+Htbj+PDeHszavCLPW48ZxhynBT6l9H0g
         g+rw==
X-Gm-Message-State: AOAM533PumkW5pFHZ6Hthh7swtQXf5BKrCitPAWay0C4AzaUlIxUjv9A
        3iaz4IFYDvD0IkoxwSFJVpKVeQQU2z8=
X-Google-Smtp-Source: ABdhPJzUzoij0wOhojrrQPR0ksGCPMNd0wMZDNgXMEiEgucIAuF9OTkcpjE8MHKO2jkCY/L0PYie8g==
X-Received: by 2002:a19:8488:: with SMTP id g130mr178362lfd.424.1601906522326;
        Mon, 05 Oct 2020 07:02:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id d6sm471414lja.63.2020.10.05.07.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 07:02:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] ARM: tegra: Add device-tree for Ouya
To:     Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <20201004133114.845230-2-pgwipeout@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b3b99578-73c8-17e1-81ff-4b3fdf1b58f3@gmail.com>
Date:   Mon, 5 Oct 2020 17:02:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201004133114.845230-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2020 16:31, Peter Geis пишет:
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay = <5000>;
> +			polling-delay-passive = <5000>;
> +
> +			thermal-sensors = <&cpu_temp 1>;
> +
> +			trips {
> +				cpu_alert0: cpu-alert0 {
> +					temperature = <50000>;
> +					hysteresis = <10000>;

Hello, Peter!

A day ago I was tuning thermal zones for Nexus 7 because found that the
current variant is a bit too unpractical. In particular temperature
hysteresis should be small, otherwise cpufreq could get throttled
enormously to the point that device becomes unusable. This is an
active-cooling zone, but it looks to me that hysteresis is a bit too
high and should make Ouya much noisier than it could be.

I suggest to try to set hysteresis to 0.2C here, i.e. hysteresis = <200>.

I also suggest to bump the temperature threshold to 55C in order to
ignore temporal temperature spikes because CPU temp should be about 40C
during idle and then it may raise quickly for a brief moments during
average usage.

> +					type = "active";
> +				};
> +				cpu_alert1: cpu-alert1 {
> +					temperature = <70000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};

And here to 0.2C as well.

> +				cpu_crit: cpu-crit {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};

The critical zone perhaps should be fine as-is.
