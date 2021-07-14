Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6421BC11F66
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 15:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4991E613BF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 15:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhGNPQl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 11:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239608AbhGNPQk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 11:16:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1437CC06175F;
        Wed, 14 Jul 2021 08:13:48 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e20so3906939ljn.8;
        Wed, 14 Jul 2021 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GztcTOsUqEihFXn3Q2HotsLpAiI5v2MRtVUADm5nE2M=;
        b=GuuD5AUWzD4szy767jIAfUPEbCm+DAz3oMX+l+cze0C6RVSHnnS4HMlCovzyloBU30
         O7+Fi92es4OtWurIs7RZQlMv5K5fB3dZQD3/T/X5gTuKGy3VSx3EafxIuokhnVENrCmr
         Ntr+rR/0/Lpyg0lGTctYYXkxTPt+lNNK0Yb+88MyqMS8ITsPPYCv9KiHJUjWlWSxu9dV
         wi91vfNZO8hNiquAekt7JIMQTEZY1VlUMOnqf9NXMHs4SoS6yaZv56wsmdl7o0AE+EtH
         wM7Gayrcbr56p1g/B+Ee4eRESfnUukSzXs9cF3a0qv8bnwuJTwMqz+WKQiIaxvW8IoFA
         lnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GztcTOsUqEihFXn3Q2HotsLpAiI5v2MRtVUADm5nE2M=;
        b=KHqSpAhgS+0H6p35+l1CUEeEjNJHnCg+izF+cJSykkjg/BeKHpk63R7rwhvCZUkgF1
         2lRtzR+4EIHPyt8Tsc09uuFz5KHmHoL5Aqe4YrWBGOa+WrPegTiAJNbNGF1vMObduhqT
         j0Wl6s8IC4b24CQ+t+zr5ViIzFQRQs6MLclumLiVnXIMWYwUhRQuTjFrrIRWU92AmSJO
         tp2v1AxTf1qBmMFT1d0VKlRtd7aQ7FU6NUxXFB6jGinchN0O9xGkPmw8k1LlPtnqFYzQ
         yImmb9n6RVB2pvlvVafNUCAK31g+id8bcg5FJVaSerCMc5X31KpzGSAl/YQyK9fUfws5
         R+Tg==
X-Gm-Message-State: AOAM53371u9XQnymFrq21lnDzoYGzqDIQOmLOejH32B4Ako/DIxBjvlM
        rpKTBxwyXeFwOk5zzw2gEgAoxJ/eLcc=
X-Google-Smtp-Source: ABdhPJxd7XItkZMbc1ywTqFI9DfcL57kFHqq8ei6QSbVOkDgVsFwR8X39raQrW0tQZWkGd0ptYtISA==
X-Received: by 2002:a2e:9e95:: with SMTP id f21mr9383501ljk.137.1626275626276;
        Wed, 14 Jul 2021 08:13:46 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id t24sm184249lfb.76.2021.07.14.08.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 08:13:45 -0700 (PDT)
Subject: Re: [PATCH v8 2/9] clk: tegra: Fix refcounting of gate clocks
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210516163041.12818-1-digetx@gmail.com>
 <20210516163041.12818-3-digetx@gmail.com>
 <fa13f623-dbd1-9b0c-dfd1-8d58800e04b4@nvidia.com>
 <e61f1ee5-2c1e-7a1b-094e-810a587ce3cd@gmail.com>
Message-ID: <35e7f162-1746-82c7-4129-0654beb77a79@gmail.com>
Date:   Wed, 14 Jul 2021 18:13:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e61f1ee5-2c1e-7a1b-094e-810a587ce3cd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.07.2021 14:59, Dmitry Osipenko пишет:
> I now see this has been picked up for stable, but I don't see where
> this was tagged for stable and so I am not sure how that happened?

I don't know it was picked for stable. Maybe bot picks up all patches
that have a "fix" word in commit message.
