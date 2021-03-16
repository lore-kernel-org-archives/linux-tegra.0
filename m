Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C50C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 16:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A70786510B
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 16:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbhCPQUz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 12:20:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52911 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238647AbhCPQUw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 12:20:52 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMCR8-0001pm-RM
        for linux-tegra@vger.kernel.org; Tue, 16 Mar 2021 16:20:50 +0000
Received: by mail-ed1-f70.google.com with SMTP id i6so17998304edq.12
        for <linux-tegra@vger.kernel.org>; Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VknwmHw+mafFAf+N/kI7g0yn7Vs0AliFHe5HjOF0pmE=;
        b=el/9tM2LVNdX5/8dbLYqlQcmzUeGoo2IKlMVjpObKp67alrdYcKJ5Z9RkE6Sa2RIwK
         38fuUv50m9Oj/anLfIK9ribB1zb+piF6gE2uZ5nYf8JawxRZUnJVN6XbFgpmx+pAWEbu
         6YeUb3q9b5FJN+v8JsdDGMYd/NnShzleJUU0r3z8J8ooCWODKuUUC0sVQJV95aVX10wJ
         IYBLFq87y/Cla8Num1gNfT/jDhO/5vz9vWXhwpwlXv+Vhf65dECbsVI2OTsRlvAavafN
         TaTzhuctAf/EQHgINZAS7zIuA0Mpzur6p8jcbCMYIstIH9Cm/ax9/AY+pDT3CJ3icON7
         oneA==
X-Gm-Message-State: AOAM532zBavALT6H3Icv8LOSW5WHAEbQr6/NgGbOyEL8QG8C7s81gCzM
        ytTKhpeSnFbHO8xGh7K/hj3C7sARP7JZnBd54Ct5kbJtVZD6YArq9k+6s4MetVW4PRzu6urcA4b
        hAplXt28xQep3NLTexn3sjdpa3u/HfVedyXX0RJhE
X-Received: by 2002:a05:6402:5252:: with SMTP id t18mr23741590edd.258.1615911650618;
        Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpZeCcRfGYZrR3Un/ccY9m3ltyvSDI2VewZd/JxmPKV6ZsHbXKVwP308doM2rw+/5RVmvs2A==
X-Received: by 2002:a05:6402:5252:: with SMTP id t18mr23741572edd.258.1615911650452;
        Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id gj26sm9629395ejb.67.2021.03.16.09.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
Subject: Re: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
 <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
 <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
 <CA+Eumj4WirHRgr3si=nkQpNdUBcCwqLXvs-ihSi2nuJokxg=Xw@mail.gmail.com>
 <d280c555-5ee4-7803-ada1-88257f809816@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f0fbc7eb-f180-453c-de64-64c3d00958f8@canonical.com>
Date:   Tue, 16 Mar 2021 17:20:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d280c555-5ee4-7803-ada1-88257f809816@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/03/2021 17:14, Dmitry Osipenko wrote:
> 16.03.2021 18:51, Krzysztof Kozlowski пишет:
>>>>
>>>> But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
>>>> for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?
>>>
>>> Hi,
>>>
>>> It depends on the platform. Not all of them implement every clk API,
>>> so you can have failures:
>>> https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/
>>
>> Ah, you mentioned the stub, so let me clarify more. The common clk
>> stubs are not used for cases like !COMMON_CLK && HAVE_LEGACY_CLK (or
>> HAVE_CLK, I don't remember). This is why you can have a MIPS platform
>> defining some of the clock operations thus not using COMMON_CLK at all
>> (and neither the stubs).
> 
> I see now that the stubs depend on CONFIG_HAVE_CLK and not COMMON_CLK,
> thanks.
> 
> This raises question about why those platforms select CONFIG_HAVE_CLK,
> while not implementing it fully. Sounds like a better fix should be to
> add the missing stubs to the MIPS clk implementation, which should avoid
> the need to patch each driver individually.
> 
> https://elixir.bootlin.com/linux/v5.12-rc3/source/arch/mips/ar7/clock.c#L489

If such stubs as pointed by you are accepted, then indeed it would be
better approach.

Best regards,
Krzysztof
