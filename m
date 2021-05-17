Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE782C43462
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 15:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D736B6108D
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 15:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240662AbhEQPFl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 11:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241665AbhEQPCx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 11:02:53 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E350BC0613ED;
        Mon, 17 May 2021 07:23:40 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y9so7489641ljn.6;
        Mon, 17 May 2021 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iS/P8JiADakXJGpN4rrcz4d8YhejJnZchwPjq0v9rUg=;
        b=qdykRinAL18KEqBuWZcfNfQwfm2z5zM89Pt2ZxhKeISsCCNJXp+34w7VvYYx6RrRyu
         7uJYpa4fylSL7d1W+5w8a9LMZE6J9PWjkINlF6GzajPwIOnsZE7xssJUL6dHHVpHhsJD
         7+xGKFL9Jo4LWYRhb4I2/DkGGJ9CPhFNRGHcOlfBJPCyq4NdMS9X54gD06rEMXJVoYxD
         8gWRTUX7ORdkJ2jN5QvAtchpQJglMSmGJWdrMLgbdntkE42ufH6ImzjChsnMnT6yJ/fB
         9TsJnQcU02+vQiKTS2qQOJhxOQK6pXLWipGJ0o8E3lQJtTgsTIZm/8Z5GJjWTc+6TRyQ
         qSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iS/P8JiADakXJGpN4rrcz4d8YhejJnZchwPjq0v9rUg=;
        b=Pl2DwaYXTywtr6IvwFf3yb+aJVXGwPD1eduVaAfgtCfbUNE0FVACp2FVk9NtmuYffH
         jZU4InijRBywiHbGFwWHUotv4OOyUcSu67IpeO+uYP0a7JZpyW3/b582Pz/7Cu7q5kib
         /Lv/3eAgPx64MZq/AQGZN8c5sFyg4jeR703n2Y+ktPn/IKOMTqjvwV57Vf3pSXoTkwQI
         RcVBBLp5jMxX4PkzxwsQ24sKeTcSOKBBwQ+NRtXgYKWwphXMAOKXNxZJ9X8tCJRJq+Z9
         2bITaJq9ZTePy2dknWq5hNTSXVDmZ9flVQQNTiEv06DPY1N5NwgNb+JyJ+4B149P/ufB
         BYIQ==
X-Gm-Message-State: AOAM532Rh/eH7f1H0AXy/OuTOJ4TmjCa9EEd18BdYnRzBjhdcs38wUpJ
        DGg2hmtlgZ9y7QpnVezHjOPZcSVETiI=
X-Google-Smtp-Source: ABdhPJxBqu6DBuFtNyji6ErZhGCmOHqKJY0GsPKMO5PS+6vo4jWyVaEXfhEZ6RwwNRXxtnui0t3jNg==
X-Received: by 2002:a2e:884c:: with SMTP id z12mr51260433ljj.276.1621261419242;
        Mon, 17 May 2021 07:23:39 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id s11sm2821069ljc.66.2021.05.17.07.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:23:39 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on
 64bit platforms
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-4-digetx@gmail.com>
 <936cfc7d-737e-a582-ea60-ad2ba5b4ca72@canonical.com>
 <1d80ee0f-de4c-24d0-154f-20841874bf20@gmail.com>
 <4ea1bf29-c353-6fcf-5248-bfee67d5c361@canonical.com>
 <c120ecf5-7202-9f1d-6e70-a99db2f5335f@gmail.com>
 <1cde1d43-f139-cb90-395e-8f8fceb41bce@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9c2b7fe8-551f-288d-eeab-37810aa3f6ba@gmail.com>
Date:   Mon, 17 May 2021 17:23:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1cde1d43-f139-cb90-395e-8f8fceb41bce@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.05.2021 17:04, Krzysztof Kozlowski пишет:
> On 17/05/2021 09:47, Dmitry Osipenko wrote:
>> 17.05.2021 16:39, Krzysztof Kozlowski пишет:
>>>>>>  #define DRAM_DEV_SEL_ALL			0
>>>>>> -#define DRAM_DEV_SEL_0				(2 << 30)
>>>>>> -#define DRAM_DEV_SEL_1				(1 << 30)
>>>>>> +#define DRAM_DEV_SEL_0				(2u << 30)
>>>>>> +#define DRAM_DEV_SEL_1				(1u << 30)
>>>>>
>>>>> Why not using BIT()? This would make even this 2<<30 less awkard...
>>>>
>>>> The bitfield 31:30 is a enum, 3 is a wrong value. Formally it's
>>>> incorrect to use the BIT() macro here.
>>>
>>> Why "3"? BIT(31) is the same as 2<<30.
>>
>> By 3 I meant BIT(31)|BIT(30). This bitfield is explicitly designated as
>> a enum in the hardware documentation.
> 
> I understand it and using BIT() here does not mean someone has to set
> both of them. BIT() is a helper pointing out that you want to toggle one
> bit. It does not mean that it is allowed to do so always!
> 
>>
>>> It's common to use BIT for
>>> register fields which do not accept all possible values. Now you
>>> basically reimplement BIT() which is error-prone.
>>
>> Could you please show couple examples? The common practice today is to
>> use FIELD_PREP helpers, but this driver was written before these helpers
>> existed.
> 
> 
> There are plenty of such examples so I guess it would be easier to ask
> you to provide counter ones. Few IT for enum-like registers found within 2 minutes:
> 
> https://elixir.bootlin.com/linux/latest/C/ident/MAX77620_CNFG_GPIO_INT_MASK
> https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/max77650-regulator.c#L18
> https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/tps6524x-regulator.c#L62
> https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/tps80031-regulator.c#L39
> https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/da9121-regulator.h#L200
> https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/da9121-regulator.h#L231

Alright, I'll use the BIT macro in the v3.

I also realized now that the tegra30-emc drivers needs the same change.

Thank you for the review.
