Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76B5C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95CE7619C7
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbhC3Pkt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 11:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhC3PkS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 11:40:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6015CC061574;
        Tue, 30 Mar 2021 08:40:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id o126so24521627lfa.0;
        Tue, 30 Mar 2021 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=urZWxZfB9unPuEm4Qf4bW/iI+i8H6VODYdeRAS1F/MI=;
        b=MrnFWRQtgTGgchvSFTJRhG0iKpk9EDN2YXdCjpBbyB8rh22kK7jvid3cRUCNSBbLpZ
         UejA7C1qrcoNQ+7CHGGy1GBQtXARqaJzuNWrsloNP9L1oevIk5+KdNgZ/O4zLJJqQRBi
         CEO5W9FO7KicYhSVJphTPoVAdpTyRLFC4NkP3+4OjbnBowZBSSbrj8tt0K8oQ4GXArbI
         BZz/KOfVyEgcCkd2fvLH0kiV9peZL7+hJpDwja5M3V0MTvgEVqc3OqEWF5h2v+f06xlE
         EZqPuLVN7WQ4DMMHa9URMvoSFxduS1DyOTvCk96kxR0CQL8pAkodscvdb/KL528TOrp9
         WSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=urZWxZfB9unPuEm4Qf4bW/iI+i8H6VODYdeRAS1F/MI=;
        b=VkV1va/19voeszKcSB82ec5A5Fq6b0B+M1G9fQI5jSspdwdkmYhq3b3OpQSUNQHl6O
         G5oFwPji2PKJokK+T/eumwHOGtEXyC/Tb9g6ieMpHIjMDF/06LoyxbHpx/PcbgUk9RBs
         JMlC7SnqSko1dWrNuoLV22qX3eZukGRL1kEqNKFjR9yo6tLPHCHg088876y6FOGR1z2Z
         rsjeNU6YZU2WncSVORnMG/GrrAlYl8DCs61+so0xxT1QCrVQfwtz8kQJqbdrOzOdkl6M
         A77dIw4GjHRhhnv+FF2RzxCsgsvMhZ+wMVRJV/EOmSjAgvtfZf3rPTqxq+iGuFt9my3/
         zBfg==
X-Gm-Message-State: AOAM532+oOy+Kst1EIXgFBhhf2hPk+D5FhlUHj8Mdh/iu5mMsgVgSV39
        uHNA+C5+CAlWzhasgODfMzA65CNp84o=
X-Google-Smtp-Source: ABdhPJxLFpSSfuhNS0hdHsznwk8YNQRRUIPd6xUixqlH59yRifshaEk4JlORzzZoe3gmo0A7krPl6Q==
X-Received: by 2002:a05:6512:3b9a:: with SMTP id g26mr20260153lfv.560.1617118815739;
        Tue, 30 Mar 2021 08:40:15 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id y17sm2204847lfb.132.2021.03.30.08.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:40:15 -0700 (PDT)
Subject: Re: [PATCH v6 0/7] Couple improvements for Tegra clk driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210320152648.8389-1-digetx@gmail.com>
Message-ID: <c4394764-184c-3680-5e6f-2df8d2d18972@gmail.com>
Date:   Tue, 30 Mar 2021 18:40:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210320152648.8389-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.03.2021 18:26, Dmitry Osipenko пишет:
> This series fixes couple minor standalone problems of the Tegra clk
> driver.

Hello Stephen,

Do you have any objects if Thierry will take this series into the Tegra
tree?

Or will you be able to take the patches into the clk tree?

Please let us know what works best for you, thanks in advance.

