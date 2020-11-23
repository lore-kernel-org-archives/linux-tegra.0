Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556CCC63697
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 06:32:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED5B320756
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 06:32:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbRF9fS5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgKWGcN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Nov 2020 01:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKWGcN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Nov 2020 01:32:13 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28108C061A4D
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2020 22:32:13 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c9so16819064wml.5
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2020 22:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=cvoVqwP9FE52rvFYms7Y+WcvtyD/16/j90QsV7N1aWk=;
        b=xbRF9fS5clfnIPpqfycFtmWKqkeQgkcTHmz41tiQsJghMhZkvIdgBAPvw0T3BXSA4I
         wV3Q/ntGbWkU8zpZ9heYLLMcLsHqFKKmSqoBnzkvBSDGoNJA91LlKYGzEP25u3NQF3QB
         AivQoi1x7qkh9O1LRv+4sWnBn4SvV5o/8m90JmW7oA9ZLgw8PTzUp2epvQbGiBciQtVq
         1nBVi64/QS2RAHBg5pyr15f/p7i1uqIms5dwWdfDdU25n9vNbp299oBH2IqkkTO0cDx1
         UJC3P8LeWo+IqZuJLsQ8UpHhv+M2yxn7CD9mgGWviZO1w7WI2U/islls/qAJUAon2DrE
         J/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cvoVqwP9FE52rvFYms7Y+WcvtyD/16/j90QsV7N1aWk=;
        b=i+LQi0BtrC33Udx0tJzKJaVW1EfuJP5yixcOZMcgf9Qr2c5ne0rVLnM4RNf0Ib9MlU
         nLuoAvjAIOZNtlg7S+5wBXRftyc3dfKrmmO02i1ah4n3fea+wtJtaRAJ0mVUGjdrlA0S
         YYv5lr1S8z6YBsUlRIeaKMZC/mUCQH2PJSyVBjyHT6NON/bsCRB0fGmMgUqhDjzDg8QX
         ElWekqc0NnKq77bRRLrTr8eMyn50TV7t6Y5QABI49a2C6G05XUpdj3uqQez/t7mlD8PF
         OIm73Up2g2uCdLYrOVDrYcpHsmOIKGNUNlmfOVqES/ufXAR8KazTtBCiivS8jhEA2kek
         ZeiA==
X-Gm-Message-State: AOAM530UQqnPXxriqGtZKjNy289Ebb28QE6tpaUs1kKpq5jCfG4cpKlu
        E4JU5J+sIg/THq8Hqs8ekfPQZw==
X-Google-Smtp-Source: ABdhPJwTKWks2V4u6Zzj4GGmt0mUu9p9zEiVEx7S7M5Igkq/WpJwqdS3vmhU4wIkWy4oSAnhkJUiDg==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr21807743wme.18.1606113131688;
        Sun, 22 Nov 2020 22:32:11 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
        by smtp.googlemail.com with ESMTPSA id a144sm15756349wmd.47.2020.11.22.22.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 22:32:10 -0800 (PST)
Subject: Re: [PATCH v10 03/19] memory: tegra30: Support interconnect framework
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-4-digetx@gmail.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <109bc617-f7d9-8635-3db1-3f4869b32f4d@linaro.org>
Date:   Mon, 23 Nov 2020 08:32:09 +0200
MIME-Version: 1.0
In-Reply-To: <20201123002723.28463-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On 23.11.20 2:27, Dmitry Osipenko wrote:
> Now Internal and External memory controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS. MC driver now
> supports tuning of memory arbitration latency, which needs to be done
> for ISO memory clients, like a Display client for example.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

Thank you for the continuous work on this patchset!

BR,
Georgi

> ---
>   drivers/memory/tegra/Kconfig       |   1 +
>   drivers/memory/tegra/tegra30-emc.c | 344 +++++++++++++++++++++++++++--
>   drivers/memory/tegra/tegra30.c     | 173 ++++++++++++++-
>   3 files changed, 496 insertions(+), 22 deletions(-)
