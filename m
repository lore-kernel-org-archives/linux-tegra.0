Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E6DC48BE5
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 10:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99FF061073
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 10:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhFLKnp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Jun 2021 06:43:45 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:33405 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFLKnp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Jun 2021 06:43:45 -0400
Received: by mail-lf1-f42.google.com with SMTP id bp38so12612686lfb.0;
        Sat, 12 Jun 2021 03:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JOEIcx53m7VhAtg8WODRLr93suHEys6T9aEDXiYn8lQ=;
        b=kZets4t5byDBKbpzGxwlRUgfYHaybzK3jhkTmAxGgNcvcqMDh6LRs5vWoeSDs/IIqs
         caNAopuUprKyMucBL/g7ekR8rBtmP7xIHWGzGg/wtgM+tLGMl/CBjMfnyj1nB3/Yqae2
         Y8ypf65MkLkx6sGQ24WT7k831TISwXf9YBN6+F/yNPoAuPZJZNMnoIhcW6IlfMqv8lxB
         8fFlPHhPQ+r0NTVstxRgCONw402DmuRw+fXSKGiTZtaw/yLjBSAjqwgE3ykXcEcbNh1O
         J8b3uHfTjrb/Nk+SMs08aWeJp6TDA+WJf7tGiTke0o00q4MTgmFv5Vn6eoxE3eQbBvR6
         8dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JOEIcx53m7VhAtg8WODRLr93suHEys6T9aEDXiYn8lQ=;
        b=hyTcubyMG9atE5eYqpD0v84XQAS2JXNF1lLh2LVuIjlbjdU0DChq4YDeGnIy6ZLf4d
         VRk4TfIYCdQPgI7pbpHQM9TWfmqxPgdKNhFjPUJ338I7UfJ91/7AQthnbSA5TtpIPdo0
         MQtVuG68Df5txve87BpcRg72ZHcrZ81lzT80iQNhE486FC00Fb5ibI9WW5P6A4eYdlhh
         E9i4Z4nE8PnLz52c00tVfMRYfU+pyPl0QJDlrUDKKzVxK2pcMVNd82asdLfq9NHNcZyg
         bbQTJ/J7b7L4E9dsqHZ4fGiHwkdWgQ5ZD39Yxox1n/fsldcy9QChoRGJWEgWPjeYayfR
         RteQ==
X-Gm-Message-State: AOAM533+mv3E7inMSs46eQx9oIVvJ0fd6Fd1zu1uSVG5kG4Z+qP6UZH0
        VjG0fh3+iuXg/IiAoxfmyi58RJO7w7Y=
X-Google-Smtp-Source: ABdhPJxrkSwO7odQIiYaO0h7tL9wndH29tLExzP6gAlc8Vf4QWVi7iWLuVWfAvYgfebChNyFwnboLw==
X-Received: by 2002:a19:7e8e:: with SMTP id z136mr1107364lfc.35.1623494431208;
        Sat, 12 Jun 2021 03:40:31 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id m18sm1039554ljg.105.2021.06.12.03.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 03:40:30 -0700 (PDT)
Subject: Re: [PATCH v1 03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-4-digetx@gmail.com>
 <20210514211601.GA1969@qmqm.qmqm.pl>
 <ecc89faf-97f5-65e9-0eb8-93c8414c69e5@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eedb5792-d3a5-78b3-ec89-b26d2e45f9c4@gmail.com>
Date:   Sat, 12 Jun 2021 13:40:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ecc89faf-97f5-65e9-0eb8-93c8414c69e5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.06.2021 12:52, Daniel Lezcano пишет:
> On 14/05/2021 23:16, Michał Mirosław wrote:
>> On Mon, May 10, 2021 at 11:25:53PM +0300, Dmitry Osipenko wrote:
>>> It's possible to hit the temperature of the thermal zone in a very warm
>>> environment under a constant load, like watching a video using software
>>> decoding. It's even easier to hit the limit with a slightly overclocked
>>> CPU. Bump the temperature limit by 10C in order to improve user
>>> experience. Acer A500 has a large board and 10" display panel which are
>>> used for the heat dissipation, the SoC is placed far away from battery,
>>> hence we can safely bump the temperature limit.
>>
>> 60^C looks like a touch-safety limit (to avoid burns for users). Did you
>> verify the touchable parts' temperature somehow after the change?
> 
> The skin temperature and the CPU/GPU etc ... temperatures are different
> things.
> 
> For the embedded system there is the dissipation system and a
> temperature sensor on it which is the skin temp. This temperature is the
> result of the heat of all the thermal zones on the board and must be
> below 45°C. The temperature slowly changes.
> 
> On the CPU, the temperature changes can be very fast and you have to
> take care of keeping it below the max temperature specified in the TRM
> by using different techniques (freq changes, idle injection, ...) but
> the temperature can be 75°C, 85°C or whatever the manual says.
> 
> 50°C and 60°C are low temperature for a CPU and that will inevitably
> impact the performances, so setting the temperature close the max
> temperature is what will allow max performances.
> 
> What matters is the skin temperature.
> 
> The skin temperature must be monitored by other techniques, eg. using
> the TDP of the system and throttle the different devices to keep them in
> this power budget. That is the role of an thermal daemon.

Thank you for the clarification. Indeed, I wasn't sure how to make use
of the skin temperature properly.

The skin temperature varies a lot depending on the thermal capabilities
of a particular device. It's about 15C below CPU core at a full load on
A500, while it's 2C below CPU core on Nexus 7. But this is expected
since Nexus 7 can't dissipate heat efficiently.

I will revisit the DT thermal zones again for the next kernel release.
