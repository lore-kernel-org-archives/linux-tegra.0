Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD74EC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Jun 2022 06:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiF0Gpa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Jun 2022 02:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbiF0Gp3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jun 2022 02:45:29 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23DC5598
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jun 2022 23:45:28 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g20-20020a17090a579400b001ed52939d72so3019389pji.4
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jun 2022 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bH3Vt7XX7aybZeFwi1CTdnlCoZZeRmTfAiO/nez5hfo=;
        b=ykFyF40ED8ltV1C22vrrCu2Ahxrq6lDUEHVRJJMWmLISGsTYVnUmByK/WyYZAoFJEs
         B77swVbdEz6e+oEZpaCTgE7Hylf9Yb4qjD1AgGIoCJ8RD+MrjKrI5Jzy6D9vBdJplVae
         7c4aw1Z1c1SkbrHp2rQGTuUna8Soo5ErVHrT5kZo6hpBqOGkEiYtHauCfhmOFHxhV3E+
         zgN/C30pAgiLj6MF5qA727QeEDMlQ1tRsxevl8fyMpQ981JkaJ8cqYjKcrHG0nMcghWE
         P9Yz0E5CiyTfhYjTcXLUNV7+9waiX+sM8Fhix46lgrs218sgFUTqtBihxvmnWEXWe4aY
         xJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bH3Vt7XX7aybZeFwi1CTdnlCoZZeRmTfAiO/nez5hfo=;
        b=IBz484f6wUWRJbkNJ5WVaVAE3jTZD+qKtnC21uhK6t2A1N5KniPee7LXZVGkaSyUTz
         Dixl0RM+QotNAbnZ6unXzH5dts9Glls4jCvxn8VNVH5Wma0JxKYOtefxdf5yJDteIA8o
         lZAZXwj/x3F5iDgrzL+sWR9wejh/WQPlykgaQXB/omYLM3And1OAmh5CQCGwJvmYKA80
         tcbkuM4jvrxBt51iGqSvublgMhL/xbrKZLKAwYVheqed664LfGwmnYbI7gvqSpprHxhr
         P8OC2H1FbJ37MeAOBFzFsLHIBCq3VL41oWMJOw1p29MVu0Qz7XZxbiziG5Oh1h0755FK
         x04A==
X-Gm-Message-State: AJIora9TZnbayRkZLuFRa1D4yYMa+rTthQ7Rg025cOlf+lCI2japqcHf
        iaikxSGL5UQ4f64EqJL97Lr5LA==
X-Google-Smtp-Source: AGRyM1skjSIr2LG5qz1p7HriNtf5RQBG+zI/jwqerqVBvWNFUvR0glyAewRI0itDcsi27L2Yi8fzKw==
X-Received: by 2002:a17:902:f20a:b0:16a:22ef:b17f with SMTP id m10-20020a170902f20a00b0016a22efb17fmr13305957plc.168.1656312328184;
        Sun, 26 Jun 2022 23:45:28 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id jf5-20020a170903268500b0016a1d007637sm6295143plb.110.2022.06.26.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 23:45:27 -0700 (PDT)
Date:   Mon, 27 Jun 2022 12:15:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/31] soc/tegra: Migrate to dev_pm_opp_set_config()
Message-ID: <20220627064526.2nkezq4nufpkl4y2@vireshk-i7>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <449b344f037c7ef1970bc84d31e0d4c4cb4d2951.1653564321.git.viresh.kumar@linaro.org>
 <20220624004831.po35sowzfo4c47b3@vireshk-i7>
 <20220624005700.oj4etaajbutvsym7@vireshk-i7>
 <73d39022-c6fc-0c21-cb68-9714846f02bf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73d39022-c6fc-0c21-cb68-9714846f02bf@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27-06-22, 01:14, Dmitry Osipenko wrote:
> Looks okay. If you'll solve the cpufreq problem where OPP config is set
> by two drivers for the same cpu device

This is supported, there is some early freeing of resources on the
removal path though, the reasoning for which I already gave in another
email. Though, I am open to sorting that out as well, but nothing
breaks the code for now AFAICT.

> and will keep the set_opp()
> helper that is needed by the Tegra 3d driver, then it all should work
> for Tegra.

I have responded to that as well on another thread.

> Looking forward to the next update of the OPP patches, thank you.

All that I have is already pushed to linux-next, I don't have any more
changes. Yes I still need to send the updated changes to list.

-- 
viresh
