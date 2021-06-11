Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39798C48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 09:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E70B613E9
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 09:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhFKJ4A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 05:56:00 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:33425 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhFKJz7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 05:55:59 -0400
Received: by mail-wr1-f50.google.com with SMTP id a20so5415178wrc.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OgudDCr8nu3IxqwsuuPI9ZtWL1iN/96prFR7PGoOlDo=;
        b=r8kljAbixtOeGD8+lzVhokh/lPE0vtoX2Ki+vtsneiJiClMO+icwj0glZdP2mhbfC9
         1QfoCMNkAdfGCMEHIeFpqiQ7IahE2eriz9uigQuVzlFrlTnlWbY1ztJYZVVbty03x4d+
         E3sLV27M6dJFnJPANwxia3iHnVTu2y8ORnJ9NcX4M0QJAfUJ8I9ENYtLkPXzmpofllQ+
         Wq6mkOs9VIbkGrswrZpyBcvUmXRLeoKn70R5Tj+Jp0KFBKrUcdkdImDD76HDBYUp3AiA
         Q9GLUNIyTzEsSULx4TBMzkElqUxcywME97QchVFCur7AQjzB7xk4l03SwRu+ZJp6Pm3e
         ydCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OgudDCr8nu3IxqwsuuPI9ZtWL1iN/96prFR7PGoOlDo=;
        b=GcBkE3kJVoJBls9cGWsh0TYvASsJGTTNYpoQtqlnY3CffKCyN+h4Y2OOcCTRVoWy2d
         X4HFA4uIWuN55OdLS4QuOKPxbbTRcXx6pwpcBPjL6Z3bFeQt7t2zpAmHsDNji45560ez
         HE5T0a+o1MToxVukFIzoWatL9es/uIib3g3rASXI0i4F3T6Y4O0q+R9rTApyAqoOxcTg
         XO64yYxWZaI6r2V54hnOWp35rQ/snsj10YHhBewavKsCj/JpBAg8c38vF/vmO6zEJYGT
         ErQJCc5/eH6G8qIMyHfag6WS74vkD/mAIpTa4KLKp/ujbE+SntVkGVrK1+OmB6HoZwfp
         6wmw==
X-Gm-Message-State: AOAM533UoGwPVek0rE0btJ6sCrOobDKU6aosS1ohTfviveY/EnpJwNK6
        nXYoRmQEu0ikCGUyksT7hDFlnw==
X-Google-Smtp-Source: ABdhPJwFRAkYN2qGj4CVzjSEAjAoQHrpTF/5MbS3YtF/3UTkUS0i1YvfMrwi+sCZeFrK97wckpg+Fw==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr3127381wro.345.1623405181390;
        Fri, 11 Jun 2021 02:53:01 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e537:d458:d3c4:18e1? ([2a01:e34:ed2f:f020:e537:d458:d3c4:18e1])
        by smtp.googlemail.com with ESMTPSA id i9sm8029544wrn.54.2021.06.11.02.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 02:53:00 -0700 (PDT)
Subject: Re: [PATCH v1 03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-4-digetx@gmail.com>
 <20210514211601.GA1969@qmqm.qmqm.pl>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ecc89faf-97f5-65e9-0eb8-93c8414c69e5@linaro.org>
Date:   Fri, 11 Jun 2021 11:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514211601.GA1969@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14/05/2021 23:16, Michał Mirosław wrote:
> On Mon, May 10, 2021 at 11:25:53PM +0300, Dmitry Osipenko wrote:
>> It's possible to hit the temperature of the thermal zone in a very warm
>> environment under a constant load, like watching a video using software
>> decoding. It's even easier to hit the limit with a slightly overclocked
>> CPU. Bump the temperature limit by 10C in order to improve user
>> experience. Acer A500 has a large board and 10" display panel which are
>> used for the heat dissipation, the SoC is placed far away from battery,
>> hence we can safely bump the temperature limit.
> 
> 60^C looks like a touch-safety limit (to avoid burns for users). Did you
> verify the touchable parts' temperature somehow after the change?

The skin temperature and the CPU/GPU etc ... temperatures are different
things.

For the embedded system there is the dissipation system and a
temperature sensor on it which is the skin temp. This temperature is the
result of the heat of all the thermal zones on the board and must be
below 45°C. The temperature slowly changes.

On the CPU, the temperature changes can be very fast and you have to
take care of keeping it below the max temperature specified in the TRM
by using different techniques (freq changes, idle injection, ...) but
the temperature can be 75°C, 85°C or whatever the manual says.

50°C and 60°C are low temperature for a CPU and that will inevitably
impact the performances, so setting the temperature close the max
temperature is what will allow max performances.

What matters is the skin temperature.

The skin temperature must be monitored by other techniques, eg. using
the TDP of the system and throttle the different devices to keep them in
this power budget. That is the role of an thermal daemon.





-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
